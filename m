Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053240A975
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 10:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063971777;
	Tue, 14 Sep 2021 10:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063971777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631608877;
	bh=YKUxp5qm6IQXUEyLGJzCs6Twdh4shi84iKjeQ6qv8jk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ohr4iGAQv7rSVA9xhOsJA4H3hF73oCvLrb5lkhHjPjZulf3+tJkUJvpzw0+zpwF99
	 RNqj6fYuFErhASX6ZehdFNMzybIYbkBA4lCGsT7yGtmn/fYIHnKivQmC9KOVwlM9I8
	 AtNcx5bxzXpGessJ6ZlgigHokWdDp5QzG8XQQoDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C18AF80117;
	Tue, 14 Sep 2021 10:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D03F8025E; Tue, 14 Sep 2021 10:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15E01F80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 10:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15E01F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d58Ngo4L"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E6cAtL023919; 
 Tue, 14 Sep 2021 03:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=scVxlpPEA1WC9z6aW9UT6WML+2SekswVj4XAtrt2yk4=;
 b=d58Ngo4LIqJYAIGBcWy4KEuBvR95m88LWyxYXs8BFykGBoPZpHPU18cMhTRlHm8lXQnZ
 JF4ZB7CaCpC2fahVjYvk2+Yk7OR0VWyk5JlkuqeNM1jerxgwZ9mq+JuxAtPJKhJg7anA
 s59mJKlQi89M2j6WNMyFOUtL6yzsXWDwJv8dx08nUp+60gqYRdhfc8yjyn7vQV3hb2ur
 B2uGq7DxNhVIP6uwzF1sIlebDnteCr2UB/eZFb5Dfw6lwWnlbk+eDQukerBh04e9bSzT
 IEuv64Jqe1XOX9ivrrOQEEtY+AcqTQUAQ2Qtp3jx6XmLFEV7gU9QudYXToSDMRj45Hqx Qg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b29n3rsc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 03:39:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 14 Sep
 2021 09:39:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 14 Sep 2021 09:39:42 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.155])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7415C2A9;
 Tue, 14 Sep 2021 08:39:42 +0000 (UTC)
Subject: Re: [PATCH] soundwire: export sdw_nwrite_no_pm and sdw_nread_no_pm
 functions
To: Vinod Koul <vkoul@kernel.org>, Simon Trimmer <simont@opensource.cirrus.com>
References: <20210913143122.101428-1-simont@opensource.cirrus.com>
 <YUAysY0zEspRQ2Sa@matsya>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <cf27c999-5a7a-a03f-fc05-63cfceac556b@opensource.cirrus.com>
Date: Tue, 14 Sep 2021 09:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUAysY0zEspRQ2Sa@matsya>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jKOVzn4ILpiQ-CndwfKMbCBbPxdk8Nkc
X-Proofpoint-ORIG-GUID: jKOVzn4ILpiQ-CndwfKMbCBbPxdk8Nkc
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
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

> On 13-09-21, 15:31, Simon Trimmer wrote:
>> The patch "soundwire: export sdw_write/read_no_pm functions" exposed the
>> single byte no_pm versions of the IO functions that can be used without
>> touching PM, export the multi byte no_pm versions for the same reason.
> 
> That sounds okay to me, but how about the users for this API..?
> 

In development.
