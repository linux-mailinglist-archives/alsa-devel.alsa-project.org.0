Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2245DF4A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 18:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DDD189B;
	Thu, 25 Nov 2021 18:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DDD189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637859820;
	bh=I/cZxyMPuPCNOusl9hUHqL2Hbc8uwjYJVKJ2CuG/2aw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucBb2AhDGVqkpLyxTKSpXeejnjpbWFdGzqh25JytpL+DDGNChsz8CCDyKN/CEiUv9
	 bRgnPhXV5q3PUG5L3KWEg7fTYHBn4BV50zHJ/drbZJn5abMU5fDuD24KIHWp82VgT8
	 LMzUC5AOK6xHOsMdQMUK8RSAqnk1DtFXN04SBlUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70963F804AB;
	Thu, 25 Nov 2021 18:02:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAD92F8007E; Thu, 25 Nov 2021 18:02:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A1FDF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 18:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A1FDF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WuNTzhmV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APDwa56011922;
 Thu, 25 Nov 2021 11:02:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fUfqRxiYoRbxdy1ZSEccjSxBRfTJK48M8Na1ieirrOI=;
 b=WuNTzhmVFPJLsxBdvwfPc7dNsg7RAGTBPmTnsEOoR5va3MbI9L+nxKLx0l8T3pprJCs1
 pZjfihzItOrhrHWIK9q0tCRxwxl8akq9bG3T8kRnmjpCiN2FWjpfmaN8UE30wm65KBcL
 Ztm+tIYR8tpsxzbe5QlwnybQ9SlWS1/FinleT2hl0yp63z73xNAy+2AN9FNyUWRxT1gt
 /35PQ/wiHSyz1JAVlPy16wcV8e4Nlu11wKhekUKKSoKZoMwO7g9vTTHveJWbMH15vNx1
 /ainImGUhbVq5q8N9+HKX+SAN/3CsNojQKfg/SL0lSLJfdhD9YPk9GVg8ZzLRFFrfrj3 gA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3chds7hykr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Nov 2021 11:02:08 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 17:02:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 25 Nov 2021 17:02:06 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F127477;
 Thu, 25 Nov 2021 17:02:05 +0000 (UTC)
Date: Thu, 25 Nov 2021 17:02:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l41: Fix link problem
Message-ID: <20211125170205.GI18506@ediswmail.ad.cirrus.com>
References: <20211125143501.7720-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211125143501.7720-1-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Wanejz1T9KWz8nrSOxWt-KMBgAk10tNK
X-Proofpoint-ORIG-GUID: Wanejz1T9KWz8nrSOxWt-KMBgAk10tNK
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Thu, Nov 25, 2021 at 02:35:01PM +0000, Lucas Tanure wrote:
> Can't link I2C and SPI to the same binary, better
> to move CS35L41 to 3 modules approach.
> And instead of exposing cs35l41_reg, volatile_reg,
> readable_reg and precious_reg arrays, move
> cs35l41_regmap_i2c/spi to new module and expose it.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Thanks for picking this up looks good to me.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
