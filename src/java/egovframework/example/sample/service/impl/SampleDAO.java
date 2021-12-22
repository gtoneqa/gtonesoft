/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
 *
 * @author Development Framework Execution Environment Development Team
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Repository("sampleDAO")
public class SampleDAO extends EgovAbstractDAO {

	/**
	 * register the article.
	 * @param vo - SampleVO containing the information to register
	 * @return registration result
	 * @exception Exception
	 */
	public String insertSample(SampleVO vo) throws Exception {
		return (String) insert("sampleDAO.insertSample", vo);
	}

	/**
	 * modify the article.
	 * @param vo - SampleVO containing the information to modify
	 * @return void type
	 * @exception Exception
	 */
	public void updateSample(SampleVO vo) throws Exception {
		update("sampleDAO.updateSample", vo);
	}

	/**
	 * delete the article.
	 * @param vo - SampleVO containing the information to delete
	 * @return void type
	 * @exception Exception
	 */
	public void deleteSample(SampleVO vo) throws Exception {
		delete("sampleDAO.deleteSample", vo);
	}

	/**
	 * inquire the article.
	 * @param vo - SampleVO containing the information to inquire
	 * @return inquired article
	 * @exception Exception
	 */
	public SampleVO selectSample(SampleVO vo) throws Exception {
		return (SampleVO) select("sampleDAO.selectSample", vo);
	}

	/**
	 * inquire the list of articles.
	 * @param searchMap - Map containing the information to inquire
	 * @return article list
	 * @exception Exception
	 */
	public List<?> selectSampleList(SampleDefaultVO searchVO) throws Exception {
		return list("sampleDAO.selectSampleList", searchVO);
	}

	/**
	 * inquire the total number of articles.
	 * @param searchMap - Map containing the information to inquire
	 * @return total number of articles
	 * @exception
	 */
	public int selectSampleListTotCnt(SampleDefaultVO searchVO) {
		return (Integer) select("sampleDAO.selectSampleListTotCnt", searchVO);
	}

}
