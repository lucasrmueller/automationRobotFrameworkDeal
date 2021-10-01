import csv
from robot.api.deco import keyword

class CSVLibrary(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.content_to_save = []
        self.header = []

    @keyword('Read CSV File')
    def read_csv_file(self, file):
        content = open(file)
        self.content_to_save = []
        self.header = []
        csv_content = csv.reader(content, delimiter=';')
        i = 0
        for r in csv_content:
            if i > 0:
                self.content_to_save.append(r)
            else:
                self.header = r
            i = i + 1
        print(f'HEADER: {self.header}\n\n')
        print(f'CONTEUDO ATUAL: {self.content_to_save}')
        return self.header, self.content_to_save

    @keyword('Set CSV Header')
    def set_csv_header(self, header):
        if type(header) is not list:
            print('*ERROR*', 'Deve ser informado uma lista como input.')
            return
        self.header = header

    @keyword('Write CSV Line')
    def write_csv_line(self, content):
        if type(content) is not list:
            print('*ERROR*', 'Deve ser informado uma lista como input.')
            return
        size = 0 if len(self.content_to_save) == 0 else len(self.content_to_save[0])
        if size > 0:
            if size != len(content):
                print('*ERROR*', 'O input deve ter o mesmo tamanho dos dados atuais.')
                return
        if len(self.header) == 0 or len(self.header) != size:
            print('*ERROR*', 'Não possui um header do csv')
            return
        self.content_to_save.append(content)

    @keyword('Edit Line')
    def edit_line(self, index: int, content, cell=None):
        if len(self.content_to_save) < index:
            print('*ERROR*', 'O item que está procurando não está presente.')
            return
        if cell is None:
            if type(content) is not list:
                print('*ERROR*', 'Deve ser informado uma lista como input.')
                return
            self.content_to_save[index] = content
        else:
            if type(cell) is list and len(cell) == len(content):
                for i in range(0, len(list(cell))):
                    self.content_to_save[index][int(list(cell)[i])] = list(content)[i]
            else:
                self.content_to_save[index][int(cell)] = content
        return f'Nova Linha({index}): {self.content_to_save[index]}'

    @keyword('Save CSV')
    def save_csv(self, output_name):
        if len(self.header) == 0:
            print('*ERROR*', 'Não é possivel salvar o arquivo CSV pois ele não possui um header.')
            return
        with open(f'{output_name}', 'w', newline='') as file:
            writer = csv.writer(file, delimiter=';')
            writer.writerow(self.header)
            for r in self.content_to_save:
                writer.writerow(r)
            return file.name