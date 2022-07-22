Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78B57DD16
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 11:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20E2168B;
	Fri, 22 Jul 2022 11:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20E2168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658480807;
	bh=Jp5DHGPR1ed3mVeSzGRmX/Y40y0bHG/yBNdxj2yJJpg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1B2i2LLiCqNYRLn0xclerMtf5X8A4JefcxdYpFJ5iyQK9cB/LhL2EtJNeVNJ31OL
	 gP3XdvP0ygBUUhFNqjub6IWqHf/7tIhX8UQMVKa0WZ6pgrhniQqdJJ1gWEl0xo2q13
	 cq/AfiQERZd3yIyF1VXVjuTg1lJ4KRnne6tozPTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C648CF80279;
	Fri, 22 Jul 2022 11:05:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E343F80246; Fri, 22 Jul 2022 11:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 114B6F8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 11:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114B6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RgzJDEj5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M5SHGJ029230;
 Fri, 22 Jul 2022 04:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fUH/IDEchZ9dPIGJX0NwZHAYP1mAyq3V+B8mNGztKLE=;
 b=RgzJDEj5WdcqKgU6kDfNFDQt6Sc9JLuq1s3B4/1AlTltHfanM5vjWNIq36o3faCI6k8x
 KRUmqMJzG1gTEo68gerNIIDYZgLdGL9+rpxeXNv1QNCU9ECAI64xwgGKvPrqqmDAB1pg
 2jLbWri/ImwOqkn1jcNmA9Mkg62bQu7iDHZbAsQ/497lurs8yWo4Q63u/cynsAAnW/XE
 2dB4t68pBJ39NXr7TQAoezq/vbR9rEAgOYu5yEewBwKWPR52sEoquM1pjuOrrpefUYbn
 X9y3P6aquSc9e/oKGD1DcsY9SWo9mATU7HgQzxv9k7mJtdASO2rV+h02U2cUvOVAZGSJ sQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hdxffbnb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 04:05:34 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 22 Jul
 2022 04:05:32 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Fri, 22 Jul 2022 04:05:32 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CB63D46B;
 Fri, 22 Jul 2022 09:05:32 +0000 (UTC)
Date: Fri, 22 Jul 2022 09:05:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41
Message-ID: <20220722090532.GF92394@ediswmail.ad.cirrus.com>
References: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: xPwS9w7hBwax5mWU939OdQEsh3UOH1LT
X-Proofpoint-GUID: xPwS9w7hBwax5mWU939OdQEsh3UOH1LT
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

On Fri, Jul 22, 2022 at 02:32:27AM +0300, Cristian Ciocaltea wrote:
> Unlike most CODEC drivers, the CS35L41 driver did not have the
> non_legacy_dai_naming set, meaning the corresponding DAI has been
> traditionally registered using the legacy naming: spi-VLV1776:0x
> 
> The recent migration to the new legacy DAI naming style has implicitly
> corrected that behavior and DAI gets now registered via the non-legacy
> naming, i.e. cs35l41-pcm.
> 
> The problem is the acp5x platform driver is now broken as it continues
> to refer to the above mentioned codec using the legacy DAI naming in
> function acp5x_cs35l41_hw_params() and, therefore, the related setup
> is not being executed anymore.
> 
> Let's fix that by replacing the obsolete DAI name with the correct one.
> 
> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")

Although sorry just noticed you might want to double check the SHA
here, I think the upstream one is 129f055a2144.

Thanks,
Charles
