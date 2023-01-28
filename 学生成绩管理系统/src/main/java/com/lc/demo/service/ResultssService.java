package com.lc.demo.service;

import com.lc.demo.bean.Rank;
import com.lc.demo.bean.Resultss;

import java.util.List;


public interface ResultssService {

    List<Resultss> getAllResult();

    List<Resultss> selectByStuId(String stuId);

    List<Resultss> selectByStuIdAndResTerm(String stuId,String resTerm);

    int addResult(Resultss resultss);

    int deleteResultById(int resId);

    Resultss selectResultByStuIdAndSubName(String stuId,String subName);

    Resultss selectResultByResId(int resId);

    List<Rank> selectRankByTerm(String resTerm);

    List<Rank> selectRankByTermAndStuClass(String resTerm,String stuClass);
}
