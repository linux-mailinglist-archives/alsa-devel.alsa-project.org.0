Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01C864867C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 17:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672D821BE;
	Fri,  9 Dec 2022 17:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672D821BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670603245;
	bh=ZZWbPjLIsr1vDXA4m2vRIlrxXaLxff9AJIqudRoeFkE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DnvRew80Nj5/ZZnq8Fbyzz5ea1DcSzVF9xtRPdrl7cGMvkhJmGzK171N8hwFY8G6e
	 aEAMvP4EVA2N1dsIIAaE3xKGD8f6upIOFYl0HS8c6H9EVf6iB3MPm48E5DVndB9azb
	 A/1A7S0hQlT0+mHXgXLOYC6F26TXLGustpt4MSAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F627F80115;
	Fri,  9 Dec 2022 17:26:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A941EF8022D; Fri,  9 Dec 2022 17:26:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E86CAF80115
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 17:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E86CAF80115
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gdKXXOy5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B9Cr27p022178; Fri, 9 Dec 2022 10:26:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=WQIy0bB9FOlkei9LXg3yHfqN7BBQ5OeJdmMPVOfoTA0=;
 b=gdKXXOy582kO3dYvjQ56u/U/yYOThIBY2gDMCmOrHZbuTBnsYBD5B7uEg28dZJ1odFyT
 PeZgrC+/OvkLf2Pm4KDXx8tsifEf+fiiRweMVXNaLuHvDQu+9D23pI9fJKo84rRUqDQU
 DnHsXcqD13PuQ3Nr7+I4dJwaeDYJDPCLqs4C/RcSCt2Oeryr6pEE/YLtJuuwZksbAkiZ
 +QQpbxKR5VV3KRbA7wzLMmoI36t9JpAswaPIbq29JzDLVSEvuqXeJEfD2nSmY0bTRmgm
 vjnJ9Lhl/xjKUExHfKsfQ6GC+wMJ2siY8eRlNmru0MwyTlahKf7ffftJtQxrwulJkDFN iQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3matyutqww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 10:26:28 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 10:26:26 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 9 Dec 2022 10:26:26 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CEA9B10;
 Fri,  9 Dec 2022 16:26:26 +0000 (UTC)
Message-ID: <bf558787-0ca5-f99b-5ae3-3b0a30de9344@opensource.cirrus.com>
Date: Fri, 9 Dec 2022 16:26:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open() breaks
 SOF Audio in Lenovo laptops
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?P=c3=a9ter_Ujfalusi?=
 <peter.ujfalusi@linux.intel.com>
References: <f7a515a0d5429b41348341874b78f3c3254970e6.camel@infinera.com>
 <Y5IOEAw5pjAvGgiN@sirena.org.uk>
 <8fa316d5-b525-2207-9092-da14f1d77232@linux.intel.com>
 <ade9deca-2f15-a3a6-97c3-7198f1cf0da0@linux.intel.com>
 <a31e0bee-6972-0c0f-7579-449fb412a0b2@linux.intel.com>
 <b54b48cf-3680-9f0c-8ca9-db904e4a57ec@linux.intel.com>
 <Y5Nfyo7VARU0TKoB@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Y5Nfyo7VARU0TKoB@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9qENw9xKeXBkiSWyShj3LjFFo-4hRiR-
X-Proofpoint-GUID: 9qENw9xKeXBkiSWyShj3LjFFo-4hRiR-
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "sashal@kernel.org" <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/12/22 16:18, Mark Brown wrote:
> On Fri, Dec 09, 2022 at 05:38:54PM +0200, Péter Ujfalusi wrote:
>> On 09/12/2022 16:42, Pierre-Louis Bossart wrote:
> 
>>> Agree with the analysis, so what would be the least bad recommendation?
>>> a) revert the "don't zero TDM masks" patch
>>> b) backport the change to use set_stream()?
> 
>> I would vote for b) unless other platforms report regressions.
> 
> I don't really care either way given the backport policy.

Neither do I.
If you want to minimize risk, revert the patch in older backports.

Lessons learned:
Don't hijack a data member to pass something different from what it
is intended to hold.
Don't depend on a bug.
Don't assume all code is using a data member for what is supposed to be
in that member.
