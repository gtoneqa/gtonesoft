/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Data processing mapper class on sample
 *
 * @author  Standard Framework Center 
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 * </pre>
 */
@Mapper("sampleMapper")
public interface SampleMapper {

	/**
	 * register the article.
	 * @param vo - SampleVO containing the information to register
	 * @return registration result 
	 * @exception Exception
	 */
	void insertSample(SampleVO vo) throws Exception;

	/**
	 * modify the article.
	 * @param vo - SampleVO containing the information to modify
	 * @return void type
	 * @exception Exception
	 */
	void updateSample(SampleVO vo) throws Exception;

	/**
	 * delete the article. 
	 * @param vo - SampleVO containing the information to delete
	 * @return void type
	 * @exception Exception
	 */
	void deleteSample(SampleVO vo) throws Exception;

	/**
	 * inquire the article. 
	 * @param vo - SampleVO containing the information to inquire
	 * @return inquired article
	 * @exception Exception
	 */
	SampleVO selectSample(SampleVO vo) throws Exception;

	/**
	 * inquire the list of articles.
	 * @param searchVO - VO containing the information to inquire
	 * @return list of articles
	 * @exception Exception
	 */
	List<?> selectSampleList(SampleDefaultVO searchVO) throws Exception;

	/**
	 * inquire the total number of articles.
	 * @param searchVO - VO containing the information to inquire
	 * @return total number of articles
	 * @exception
	 */
	int selectSampleListTotCnt(SampleDefaultVO searchVO);

}
