let g:doorboy_additional_quotations = {
      \ '*': ['%'],
      \ 'vspec': ['@']
      \ }
let g:doorboy_nomap_quotations = {
      \ '*': ['`'],
      \ 'vspec': ['"']
      \ }
runtime! plugin/doorboy.vim

source spec_helper.vim

set filetype=vspec

describe 'customizing'
  after
    normal ggdG
  end

  describe 'g:doorboy_additional_quotations'
    it 'should add custom quotations in any filetypes'
      call spec_helper#insert_chars('%ok')
      Expect getline(1) == '%ok%'
    end
    it 'should add custom quotations in a particular filetype'
      call spec_helper#insert_chars('@ok')
      Expect getline(1) == '@ok@'
    end
  end

  describe 'g:doorboy_nomap_quotations'
    it 'should remove quotations in any filetypes'
      call spec_helper#insert_chars('`ls')
      Expect getline(1) == '`ls'
    end
    it 'should remove quotations in a particular filetype'
      call spec_helper#insert_chars('"string')
      Expect getline(1) == '"string'
    end
  end
end
