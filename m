Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 861303D215B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 11:57:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165E716C5;
	Thu, 22 Jul 2021 11:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165E716C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626947825;
	bh=r/jLGd34KqvfPWMVorFBHdVDXAH4XBBh19saIRO0dRA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYyThiuLRJgWxS9sHcxNyR0ZtiYwOgZDR8p4dUm3X/fqd38nOrgose/Q4QyfxsCpQ
	 PEmpWUmFmbT3LdDkwIXjQ/Sl1NT32n3IiQjVV7/O5OZHkxpGPFUD7MtD9QBpAfoje0
	 /asMsBs2E+fhrqBWk5Yy3Vvr1Lj+ehMd0k+TZsg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D6AF800DA;
	Thu, 22 Jul 2021 11:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA8DF80227; Thu, 22 Jul 2021 11:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F069F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 11:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F069F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ENZHGPM/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16M7GEwY021297; 
 Thu, 22 Jul 2021 04:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=MFSYCskN+1QDzOxOKrFIg7/n0TUbqpFAwQmpyPlf204=;
 b=ENZHGPM/4OmP7uz+p5ph0NRhjU1PAdM2Tw0tMKZJ5gvZv0hH1IAJyLiIXdBwh0U5chi2
 JdWLXfnGJI6tVXQcmICQlR1YQd/24mn5K/H7YTan77OYi+Z26VCMlTaNPPtBFb5Fdgg1
 chpVGryIuFD4ERMr413KENCcL/osp7aNhizrMHWr8T8rdQ0JkU/plAXHsZH7+KOE45e6
 YLCeRW7LHf6N3Pp6ovAZ2pqkCQggHkhGuWNiwBF5Mlm++mzQaOqJgQO79w+wLtTScNoJ
 /9Ky9VJoWJ9s4lB23KHfZV/9nczJD4epPL2AhhSy2Bl7MSpB1bxfISVZdTYopsuL1jSi Bw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39xgrt9cby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 22 Jul 2021 04:55:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 Jul
 2021 10:55:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 22 Jul 2021 10:55:24 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.17])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 100B92BA;
 Thu, 22 Jul 2021 09:55:24 +0000 (UTC)
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
To: Mark Brown <broonie@kernel.org>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
Date: Thu, 22 Jul 2021 10:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705165041.GC4574@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XCW_dW3XhHisG8xyfLH0o6NIRjmT_Q9G
X-Proofpoint-ORIG-GUID: XCW_dW3XhHisG8xyfLH0o6NIRjmT_Q9G
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=957 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220066
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 shumingf@realtek.com, rander.wang@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 05/07/2021 17:50, Mark Brown wrote:
> On Sat, Jul 03, 2021 at 01:50:34PM +0100, Richard Fitzgerald wrote:
> 
>> That commit breaks all users of the snd_soc_component_*_pin() functions
>> because it results in the prefix being added twice. It also breaks code
>> that correctly uses the snd_soc_dapm_*_pin() functions.
> 
>> Use the snd_soc_component_*_pin() functions if you want the component
>> prefix to be prepended automatically.
> 
>> Use the raw snd_soc_dapm_*_pin() functions if the caller has the full
>> name that should be matched exactly.
> 
> I'm not sure the analysis of which function to use when is correct or
> what we want here (though it will work ATM), though looking again more
> closely at the patch it doesn't look entirely right either.  The way
> this used to be done, and the way that older code will most likely
> assume things work, was that the DAPM functions would first try to match
> on the local DAPM context before falling back to doing a global match.
> This is what the fallback loop is intended to do, and the dapm functions
> are passing the "search other contexts" flag into dapm_find_widget().
> 
> I'd not expect the distinction you seem to expect between component and
> DAPM and we probably have a bunch of older drivers that aren't working
> correctly like the Realtek driver mentioned in the original fix.  I
> think what needs to happen is that dapm_find_widget() needs to be
> checking both the prefixed and non-prefixed names, and that the
> component stuff shouldn't need to bother and just be a convenience
> wrapper for users that happene to have a component to hand.
> Alternatively we need to do an audit of all the non-machine drivers to
> switch them to use the component functions exclusively (and possibly
> some of the machine drivers as well), most of the CODEC users look to be
> a small number of Wolfson/Cirrus ones.
> 

I don't mind if someone wants to change the core dapm functions if that
is generally useful, providing that it also updates all callers of those
functions to still work.

Changing the behaviour of core code to fix the Realtek driver without
updating other callers of those functions is a problem.
