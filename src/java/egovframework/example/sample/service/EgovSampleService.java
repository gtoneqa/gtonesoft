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
package egovframework.example.sample.service;

import java.util.List;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
 *
 * @author Development Framework Execution Environment Development Team
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface EgovSampleService {

	/**
	 * register the article.
	 * @param vo - SampleVO containing the information to register
	 * @return registration result
	 * @exception Exception
	 */
	String insertSample(SampleVO vo) throws Exception;

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
