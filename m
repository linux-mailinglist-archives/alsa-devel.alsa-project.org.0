Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450262407B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 11:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6DC163E;
	Thu, 10 Nov 2022 11:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6DC163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668077832;
	bh=Yt9ilWXaUsm3heYclTe3JYl4BDs/e0V6t5cr01d8Kgo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OGKqEaxfq+KQ3GqZZ+0uwBdxjdJqs8Bq4kpB6pz7eEadZdLanuaY7IhrPbwRCf+kQ
	 xR2RgxiHD88TiFAd/HiDl5TcHUqjaBLuEJ8kzFDfUD5Pi+fc37yQhpTGPJXhZUb4HW
	 kAsHtRoiEsOUtfp/nOV+ObP4gzHPUGY/dndsIwQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0CDF802E8;
	Thu, 10 Nov 2022 11:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 900A7F8021D; Thu, 10 Nov 2022 11:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 348E6F80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 11:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348E6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dEqUJkKr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AA6HkCI013421; Thu, 10 Nov 2022 04:56:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=LXs6Llt9Vh2y94hkOvFyZNRZkCDLDTeAl26usvz8sik=;
 b=dEqUJkKrLzJcGnwb4ICm6Ne5AYlc5scUFP7nrGGJ2IldUHssWoYBbufGxUhcO8Tphold
 nJPqO7KytDuNE22ys+Em8lTlDXqLRGTXbsbgwZrsg89oBWKGjFH7qQJZy/2rpxYx0Yaj
 9/bxaQSdIhYvE8X8rZI32n7x29vF36KGSuqpNvecJr/8T7jU8RL4vqJx61tGJXt5l2j3
 /Nw8G/2UyiCR8R6hHL/PumN+JTWpoZc8Eh0GtHwmZbL2GAxOrqmMohyIccwdxLYVc6r2
 2PfOGYLBK/HhI/V9L4VQZYwYAuOvCOUCQ04+qP4LaTG6MDvdxx78JICb6BVLpKwLyDkZ 8A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81pse1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 04:56:06 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 10 Nov
 2022 04:55:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 10 Nov 2022 04:55:57 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A35D476;
 Thu, 10 Nov 2022 10:55:57 +0000 (UTC)
Message-ID: <43a6c801-e76f-7a03-af18-194cad14cbe0@opensource.cirrus.com>
Date: Thu, 10 Nov 2022 10:55:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/12] pinctrl: cirrus: Add support for CS48L31/32/33
 codecs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-6-rf@opensource.cirrus.com>
 <CACRpkdbY7W2rDZ4knkrRHBSTn7MKYV3LYh_r8Wkn1Hh=j+oL5A@mail.gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CACRpkdbY7W2rDZ4knkrRHBSTn7MKYV3LYh_r8Wkn1Hh=j+oL5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tZ_GrKpiLWxf-mqAUCAcqZgSBPBr6Fbv
X-Proofpoint-GUID: tZ_GrKpiLWxf-mqAUCAcqZgSBPBr6Fbv
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, maz@kernel.org,
 lee@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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

On 10/11/2022 10:02, Linus Walleij wrote:
> On Wed, Nov 9, 2022 at 5:53 PM Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
> 
>> From: Piotr Stankiewicz <piotrs@opensource.cirrus.com>
>>
>> Codecs in this family have multiple digital I/O functions for audio,
>> DSP subsystem, GPIO and various special functions. All muxable pins
>> are selectable as either a GPIO or an alternate function.
>>
>> Signed-off-by: Piotr Stankiewicz <piotrs@opensource.cirrus.com>
>> Signed-off-by: Qi Zhou <qi.zhou@cirrus.com>
>> Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> This looks OK.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Does this patch have compile-time dependencies on the other
> patches or is it something I can just merge separately?
> 

It has compile-time dependencies on the MFD at least.
I should have said that in the cover letter.

> Yours,
> Linus Walleij
