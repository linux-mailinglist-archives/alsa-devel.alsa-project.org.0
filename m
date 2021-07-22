Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B053D2745
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 18:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B2D16DF;
	Thu, 22 Jul 2021 18:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B2D16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626970145;
	bh=l0S/z9arqE13sIVCkqWn1VZ3yy66BRdFLP0YJ41OZeI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5T0MR2kOPwCuVxBfbvCvAwAWRKQgWPdN+0slHDRqdMchqJNSDQb2nv0evAbI+LRY
	 TQBZRzv2BzAKtmY3hPJ9EZFBTBMlS9MGucPET+YYjG2iDcP1niqAVqtV9jZhTMBvRG
	 o5QTTY8ecT7XlCjdqT82wH1rVAi6/geEZiCw+cmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 031FAF80256;
	Thu, 22 Jul 2021 18:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BB1F800DA; Thu, 22 Jul 2021 18:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5640AF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 18:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5640AF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TAbk5jrM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16ME1EQS004600; 
 Thu, 22 Jul 2021 11:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=kDAuG6OrRGMoIEmK05+f34TSzN/bDUlglDjmI+D9dVs=;
 b=TAbk5jrMUTd53bzm+UZX3na488yzGyglTBQWrmSVX9PUuB7q6vk+hjwG1GnpLji5PgzK
 hH6VvA8H1VXurRQzM7vCb+5Fr5gC+5DcMTenmwTRjrvtCxHtdgpA36bCmeGny8zvmHHd
 dOZrqTFXAq3JQiHSxsocLHQlz3SBZs/WuPJMrVVbipW7hEQ8xiT9QG/pUAOcNMreyr3T
 aoOFb0VhVzk+ABeXP0DPoY/9IA83fgCyDQ/DlDWtQpjJvSr4AsWU5NBmtSufkyUEOzwV
 0l2n1LBXHy4jzS0Q2s860KsotbAWaLLmO1B8ZFDAuNSpg312JVNs1+3kKgq3rFNYfpip 5A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39ya2r86ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 22 Jul 2021 11:07:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 Jul
 2021 17:07:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 22 Jul 2021 17:07:22 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.65.126])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CD62D2BA;
 Thu, 22 Jul 2021 16:07:20 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
 <20210712150341.GF4435@sirena.org.uk>
 <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
 <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <198c7169-8885-aa50-5ab4-cf53cafb16be@opensource.cirrus.com>
Date: Thu, 22 Jul 2021 11:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VJb6QP116lynMr2PnltxBwAzfBUiFLtH
X-Proofpoint-ORIG-GUID: VJb6QP116lynMr2PnltxBwAzfBUiFLtH
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=676 suspectscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220108
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

On 7/21/21 4:01 AM, Charles Keepax wrote:

> why that is necessary in the first place. AFAIK DAPM won't attempt
> to power down a widget without powering it up first. So, at least
> to me, its not clear how you get to this code without GLOBAL_EN
> having first been set by the power up?
> 

This is a case where the bit controlling the widget defaults to enabled.
Would it be better to clear that bit before registering the codec?

Thanks,
David
