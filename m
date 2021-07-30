Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD53DBC5C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C7B2139;
	Fri, 30 Jul 2021 17:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C7B2139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627659103;
	bh=D9iFWiKNVNzEhr6eU4JpVCYfVlmMHkJU2jwN9AOcAKI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFk+9rEzhVvwsQUGC+ZIaBhH2YL/hVambv9I4OVwzIhQqlHhMmMr8k7TiGVQmAQFm
	 IwqaFowBoNvUtBgnGLSrmWkoXefv7vY2UoCohv5htyiXvO6C/hN7biCtasZsGIZZ/R
	 AdyRYFAQA/aLmq937zafVk25J0AT762mOJtLWaFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8756CF80212;
	Fri, 30 Jul 2021 17:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC3BF804E1; Fri, 30 Jul 2021 17:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924E5F8019B
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924E5F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mRUsH9If"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UEL16V017692; 
 Fri, 30 Jul 2021 10:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=A33IGHmfp6aAAZpnJTItBbmOG7smoe+jLFS6FZeKxS4=;
 b=mRUsH9If7a+ZaUuIc+n2XlOFvONFsWYCsp/9MeRWBicAdLejLMOlZL04BkdVvg8rYDaE
 Kiw2cBAfvODURZIZgNbiAkRemzbJ9w0h1OjRqWyuUQFztrp0eZYJ/zqf23RB666qzAzP
 FOCR3mh7xWorLboVen1uAFTeMIF1s0iTfLny/RCGOTpvb07BoKdy0MOhT0qZkh/VFn1a
 nlTiKCRpMQIr63UX0PpNikr9ptkLsu/TLhv8q+emWyWicuEwk8zJpGoNbtVyqlBe4pWk
 CgZQgD3otlulHhih+Hwl5FkR3nlKDOtjUsLrvhsdNOfG/VsH4PzD+BGKbPDTEwQr//L9 NA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a3u889rb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:29:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:28:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:28:58 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.64.156])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5445A2BA;
 Fri, 30 Jul 2021 15:28:57 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] ASoC: cs35l41: Add bindings for CS35L41
To: Mark Brown <broonie@kernel.org>
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
 <20210726223438.1464333-3-drhodes@opensource.cirrus.com>
 <20210727153108.GU4670@sirena.org.uk>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <0aae364a-6e10-7473-fffe-ce7625319444@opensource.cirrus.com>
Date: Fri, 30 Jul 2021 10:28:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727153108.GU4670@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tPoravjWkvWdXbwwYsvA4pGnS63aAuS5
X-Proofpoint-GUID: tPoravjWkvWdXbwwYsvA4pGnS63aAuS5
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=870 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300102
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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

On 7/27/21 10:31 AM, Mark Brown wrote:
>> +  cirrus,right-channel-amp:
> Does this need to be in the DT or could it be a runtime control (eg, for
> a system that supports being rotated to adjust which speaker things go
> out of).
> 

This can also be changed at runtime using set_channel_map.

>> +  cirrus,amp-gain-zc:

> This is usually a runtime control too.  This applies to a bunch of the
> properties TBH.
> 

I agree, many of these properties can be changed to controls.
I would keep these in DT:
boost-peak-milliamp
boost-ind-nanohenry
boost-cap-microfarad
asp-sdout-hiz
classh-bst-max-limit
gpio-*

Thanks,
David
