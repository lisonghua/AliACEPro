package ${pojo.getPackageName()}.service;
<#assign classbody>
<#assign declarationName = pojo.importType(pojo.getDeclarationName())>
<#assign entityName = declarationName?uncap_first>
@${pojo.importType("org.springframework.stereotype.Service")}
@${pojo.importType("org.springframework.transaction.annotation.Transactional")}
public class ${declarationName}Manager {
	@${pojo.importType("org.springframework.beans.factory.annotation.Autowired")}
	private ${declarationName}Dao ${entityName}Dao;

	// ${declarationName} Manager //
	@Transactional(readOnly = true)
	public ${declarationName} get${declarationName}(${pojo.getJavaTypeName(clazz.identifierProperty, true)} id) {
		return ${entityName}Dao.get(id);
	}

	@Transactional(readOnly = true)
	public List<${declarationName}> getAll${declarationName}() {
		return ${entityName}Dao.getAll();
	}
	
	@Transactional(readOnly = true)
	public Page<${declarationName}> search(final Page<${declarationName}> page, final List<PropertyFilter> filters) {
		return ${entityName}Dao.findPage(page, filters);
	}
	
	public void save${declarationName}(${declarationName} ${entityName}) {
		${entityName}Dao.save(${entityName});
	}

	public void delete${declarationName}(${pojo.getJavaTypeName(clazz.identifierProperty, true)} id) {
		${entityName}Dao.delete(id);
	}
}
</#assign>

import java.util.List;

import org.springside.modules.orm.Page;
import org.springside.modules.orm.PropertyFilter;

${pojo.generateImports()}
import ${pojo.getPackageName()}.persistence.entity.${pojo.getDeclarationName()};
import ${pojo.getPackageName()}.persistence.dao.${declarationName}Dao;

${classbody}
