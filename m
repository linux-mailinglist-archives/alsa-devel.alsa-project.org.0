Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C83333BA2F4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 17:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55F47169E;
	Fri,  2 Jul 2021 17:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55F47169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625241238;
	bh=pjB0+EPOFIZNSJIgH3P42MUEnNqJsQeSvnqZtfJBooY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0K0t387S4uW1aEzPamjv6J0UoIkiTPpGI8yleKr4VNubSX2dLJOaKOnrY7sy0bhZ
	 rcx5HPJ83AinM5tcL7iuYFE8k4mD5B5xL0Jj1lwobC5XsZmmF6AhUjSLOnQ1AFA0jA
	 EctAs/iUtvnMP3sA/lknHK0Qizr5M5pT/pcZiPNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8696F800F3;
	Fri,  2 Jul 2021 17:52:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272B5F80229; Fri,  2 Jul 2021 17:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9069BF800BA
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 17:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9069BF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Wz/0HxOa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162FeKa1000814; Fri, 2 Jul 2021 10:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=FXVr4Ax2ugwp+gUAJz2R0G60SxQJGFp9pCEAmi9XvkA=;
 b=Wz/0HxOaFJ4OvzdX48YHbU2T8iRLx1AU/CE0GxF+2z2b1Eb1H31AOZQ10kfVICG40Lf5
 AY2HCQkbEq+YYi7M6v8QhWi1Ve0hd07MU9ZPKhzaYZBHHgj4Fe9DFOi50/uXjWTnMME8
 +OD8D/wM8a7kzCT68H/Cy10MAQUS+8DU5ldaPzquI7xqQ8Yc28JFCvtG+xw1zbXj8IMu
 KVpgu4i5x3g93RPpKSmIxxhDIGYMwoIqH9Sgd8r1V2oIDKO5FuLWS6jDwtEq0RnWUdEF
 NQB2ETz3SYVUGsAu1dDV3IkR8pqRwhPV1iWboL4vvuK3nCJeugCgk0TT21DgCOUYILJP wQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39j40rr5k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 02 Jul 2021 10:52:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 2 Jul 2021
 16:52:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 2 Jul 2021 16:52:21 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com [141.131.64.84])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CF2646A;
 Fri,  2 Jul 2021 15:52:13 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Mark Brown <broonie@kernel.org>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
 <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
 <20210702120810.GA4416@sirena.org.uk>
 <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
 <20210702154820.GC4416@sirena.org.uk>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <08374391-c233-a6a5-38e3-d423ae17ec5f@opensource.cirrus.com>
Date: Fri, 2 Jul 2021 10:52:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210702154820.GC4416@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0ZR3hA64xFP-4CMpR8MP3g2UO_1_aJch
X-Proofpoint-GUID: 0ZR3hA64xFP-4CMpR8MP3g2UO_1_aJch
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=993
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107020086
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On 7/2/21 10:48 AM, Mark Brown wrote:
> On Fri, Jul 02, 2021 at 10:23:52AM -0500, David Rhodes wrote:
> 
>> So I don't think I have an actual issue, but I am just shutting up the
>> static analyzers, although I do think I fixed what they were telling me.
> 
> In that case you should get the static analyzers fixed, they clearly
> have a false positives problem here in what is a relatively common
> pattern.
> 

OK Thanks Mark. Will make Pierre's recommended change in the next revision.
