Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F39693B9730
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 22:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914A11670;
	Thu,  1 Jul 2021 22:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914A11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625171072;
	bh=TY827WSoU5WceXI0VHmKk1LdJTm4B7mGiJK+4cyvA4A=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hb7NCQQ3VinkMO3AWOLi6jzTuPs3D+mEXBSWeeqHUBg4RNBu6X1FQF17Ypo5gzhEn
	 1N1TKQouyfhFfmTjCcuqJaZusZEd3S0yGQUY3H4UwEPE7B4wRj7dWy/zEdtzbqFhD7
	 YitSMpdIpO5zuFQ3apr16cMTV0UhuC/2mBZ8Uh9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3026F800E3;
	Thu,  1 Jul 2021 22:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C60CF802D2; Thu,  1 Jul 2021 22:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03543F800BA
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 22:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03543F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Herr761/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161KBuP3025553; Thu, 1 Jul 2021 15:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=M0r3P/KM3bXmJt0XpfOZLm3gmOah9FCo6I9iRDPeNuQ=;
 b=Herr761/lHV+wPtq2683YgxC8CiXWKna/I0MRjHvnnzeTxHgHbrJP1ScvYlHJAf7aQiG
 0Vx+gE+vX1mnOfsMvr1xmb2Pr44pENr91Dcj+60VtfZZeDYqzOOfQ3326M3iZKOPPYjf
 9Pse7jQntUTjqVk8OGIeQ4kWEv3aOnN9iZQyBK/gvQ5pKX7r44bOFJyuDbhqBv/3W+5P
 wxekkfcBcQZsChuUdz7Df1+Ud9grlnRpYqf/kFwOpfoo7n+pOXZVE9QRmq4Hq5FehxqF
 UEWJtmErdA2Hf55sqV8y7hxxOEOniT8mFaBeoVimG2B/T6SNhQt/pGsN/xpVAXpdekQM 4A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39gg1wjv58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Jul 2021 15:22:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 1 Jul 2021
 21:22:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 1 Jul 2021 21:22:55 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.64.207])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0EADC46A;
 Thu,  1 Jul 2021 20:22:53 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <robh@kernel.org>,
 <ckeepax@opensource.cirrus.com>, <brian.austin@cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <david.rhodes@cirrus.com>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
Date: Thu, 1 Jul 2021 15:22:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _G_CJRQWVPK6HKInKZ65u1peT5mNb-Q-
X-Proofpoint-ORIG-GUID: _G_CJRQWVPK6HKInKZ65u1peT5mNb-Q-
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010118
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

On 6/29/21 6:51 PM, Pierre-Louis Bossart wrote:
>> +static irqreturn_t cs35l41_irq(int irq, void *data)
>> +{
>> +	struct cs35l41_private *cs35l41 = data;
>> +	unsigned int status[4] = {0, 0, 0, 0};
>> +	unsigned int masks[4] = {0, 0, 0, 0};
> are those inits necessary, you override them below with the regmap reads?
> 

This one gets flagged by static analyzers so I'd like to keep the inits
