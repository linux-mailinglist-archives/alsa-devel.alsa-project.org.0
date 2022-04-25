Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1650E08F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120AF171C;
	Mon, 25 Apr 2022 14:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120AF171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650890523;
	bh=1wUHLemCnkAnFy1DzCNWqFL0dJjOdsvpTqnDgpQ2HWg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXJD/9xG4jxqZglAJPiI2UuB/6guqsKR8um3e/M7IETPCkOvPXq8kYuJt8xj/vftW
	 TQt7q/PU2oZl7SQh8nN4H1VhIPT8JJWntJSOeeMdNO6kVt/iCV1EItFEU7rpInuWl5
	 s6JUG+KjRzR8Jsnmac56lH+GZjRBRGzFkiR89y9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A004F8016B;
	Mon, 25 Apr 2022 14:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FC20F8016A; Mon, 25 Apr 2022 14:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CEFCF800CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEFCF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EVV/WeXa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PBDYfe013133;
 Mon, 25 Apr 2022 07:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=nlr38uaIfr5f4RWN8hQmBrW8tEdm1U6DpwhcPJKbjIk=;
 b=EVV/WeXa1NA0Mz7s/6i5X/Nv3Zt9wSsdvDGGKuaXIYGH1qUwKGntX+d7HrwGv9whgfOu
 3TI8mapVZTLF+lwCQRk0Sn50IW+PMCsNJyp3HJp76JPHIV7134JVEsLTsq1/eHFptxq7
 VEo07JjQ8H28GtHmBX66dMeWxnmejiThx4zmEbv97qEtGQzqFvw14Ln4xAskpJIbbR/2
 9JWJ9RcjxrD4Cf7+27RHBLa2drQh0veId8rOkI8O7H+1Bq7n6til6Qc7tgfOFb59wh2u
 lIJHRjef/b4cW5hIurWg6xWJ5ZNB3k0JiAVp3Lsu2vuZfRxKKvc+S66DTvwW/cwHmrCS 3A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fmev31wvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Apr 2022 07:40:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 13:40:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 25 Apr 2022 13:40:51 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 215C7478;
 Mon, 25 Apr 2022 12:40:50 +0000 (UTC)
Subject: Re: [PATCH 1/2] ASoC: soc.h: Introduce SOC_DOUBLE_R_S_EXT_TLV() macro
To: Mark Brown <broonie@kernel.org>
References: <20220422160112.3026542-1-rf@opensource.cirrus.com>
 <20220422160112.3026542-2-rf@opensource.cirrus.com>
 <YmaTZEnMAsqtg2FO@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <b8881338-ae93-7255-6c3f-06e14c61cda7@opensource.cirrus.com>
Date: Mon, 25 Apr 2022 13:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YmaTZEnMAsqtg2FO@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aYKhTGTQ6zBMc2_AKG8TiGQcx1mIIHMV
X-Proofpoint-GUID: aYKhTGTQ6zBMc2_AKG8TiGQcx1mIIHMV
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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


On 25/04/2022 13:26, Mark Brown wrote:
> On Fri, Apr 22, 2022 at 05:01:11PM +0100, Richard Fitzgerald wrote:
>> From: Simon Trimmer <simont@opensource.cirrus.com>
>>
>> A straightforward extension of the SOC_DOUBLE_R_S_TLV() macro that
>> allows the get and put functions to be customised.
>>
>> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
>> ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.
> 
Damn, sorry. Would be nice if checkpatch warned about that.
