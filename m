Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C640074E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 23:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D8818E3;
	Fri,  3 Sep 2021 23:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D8818E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630703524;
	bh=Xr6EPqpmSsfUoqXUsnhF2HSWf+A/h+yxoGzC/tMN/F4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYcVS3lrQro/KyYWZOT9pak8bSlCs75bkWz8jG6SIVbAvmlAPsZj7kfvhJovBdsjQ
	 V/FVO3UyB4p521onJD1FIn6XvUJ6J1CpFqAqeHeYcf55289ktntZbxAkx/Tt93xHAS
	 kD/S3AuEPjgiH9yqxAFhKH7T2BjT4ag+WgL/FZi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A32F80256;
	Fri,  3 Sep 2021 23:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0AEBF80254; Fri,  3 Sep 2021 23:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F60AF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 23:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F60AF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qVGSaFcn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 183D0TZK021606; 
 Fri, 3 Sep 2021 16:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=EF+1GM4tIu3/LSCMJPFyD8eeFrnRiEwxWONg0NLHXyo=;
 b=qVGSaFcne2BukjvklZ+Y5K1GwxFgyH8pMZTbSro70HsSf67eeJuwpDvnS0ONxkDfkAI8
 0b86hEDhHV2ZoJvxkazTUPHtoqtFrDS0a61Gz2oXv6eww7cFi51n5pfI2uT9XunPe46c
 0ET/Y4l4mObWqMyXWnxRdvvK7w9BVX5NraObjZbfNpmzRs26Lmck9DG6RjmZaZ89gQg3
 aBLMXsR+bN3jXb8+lbonA18m9+BfvRL5jGYchM5EQ41auFqxlsE7XiQQ42px+o0Lfz8L
 L63dNmxWJ/3d/oRvfHiK9kvyMElkwmKb2hYpMlUFm1j5ie+lgfXLg7MtZrS6HPXXZbVn oQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3aum6pggap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Sep 2021 16:10:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 3 Sep
 2021 22:10:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 3 Sep 2021 22:10:35 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.64.124])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF087478;
 Fri,  3 Sep 2021 21:10:33 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
 <20210817093110.GK9223@ediswmail.ad.cirrus.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <74ce6f57-7636-a208-61ef-a3a243132964@opensource.cirrus.com>
Date: Fri, 3 Sep 2021 16:10:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817093110.GK9223@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w3MPBr3Cf8IVFscXGQrAzT-Sk4_kDsZQ
X-Proofpoint-ORIG-GUID: w3MPBr3Cf8IVFscXGQrAzT-Sk4_kDsZQ
X-Proofpoint-Spam-Reason: safe
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com, broonie@kernel.org,
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

On 8/17/21 4:31 AM, Charles Keepax wrote:
 > On Mon, Aug 16, 2021 at 05:43:09PM -0500, David Rhodes wrote:
 >> +static int cs35l41_component_probe(struct snd_soc_component *component)
 >> +{
 >> +	struct cs35l41_private *cs35l41 =
 >> +		snd_soc_component_get_drvdata(component);
 >> +
 >> +	component->regmap = cs35l41->regmap;
 >
 > You sure this is necessary? The core should do this for us, its
 > only necessary if the regmap is on a different struct device to
 > the CODEC which isn't the case in this driver. Also if this is
 > necessary it should be using snd_soc_component_init_regmap.

Not necessary. As far as I can tell this is just a relic of something 
long since refactored.

I agree with all the other comments as well and I will include in v6.

Thanks,
David
