Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC342F3E7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48995173E;
	Fri, 15 Oct 2021 15:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48995173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305191;
	bh=8wZML6h9miBTCNd2Q5WSN3h+Xdi/1f4xlet3GotNlZg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4cf1Ker5Diip25WT1KAX66HMaqt/4FW836whl5veFOuZLOlKjzrZ2ChTQzdGtlzu
	 KjvRkoPisj3JaNEnx4o0dUtuRmTu7KZ79ARRHKaH+lIZEn1s6ycg7Am9Ixkaxe/s4B
	 QFeHfjRa9O1bElIVF8EaBotd1bGt3g0Ni/gNNyGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E574F804FA;
	Fri, 15 Oct 2021 15:36:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A26F80507; Fri, 15 Oct 2021 15:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D30F80423
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D30F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mApZYqHJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4c2t3023483; 
 Fri, 15 Oct 2021 08:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=i+3Uz83fu6Tsr2zoWjKonYaF4sUZax+MDZBMEuGJlWg=;
 b=mApZYqHJixhPSRm/eiA68tUo7+SGi9PX1czGfEsrcsUUlHAF99CIvsv6Wp+YakQ2w7iU
 GDxHhE0z+MGdValgziauCJLodABvzGj5IptDwSwyz1UhYIPZzEf+fL0JcBYjWLzFu2uZ
 lp6uesSauWV4LSoptGvo5Yfoiudy3+zvfKmha6qnP7DKl+cuB5VokwY4+RkMCjVYJauh
 vGYHSdam3Tf83yFLk+yDzjQSkJIeF1z+4IslpgZSIj/QcR5LsEU6L7sTsiw/LXMdsQoy
 fpdYjP0GON5S+D3mQdTQEA1aEWxJVVTtUtixJz5VfsdeYi4b8jOCqwCedQV4/m//LiR2 VQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5v-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:24 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 856B946D;
 Fri, 15 Oct 2021 13:36:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 10/16] ASoC: cs42l42: Don't claim to support 192k
Date: Fri, 15 Oct 2021 14:36:13 +0100
Message-ID: <20211015133619.4698-11-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: h4tELPdJfIrHtMQS6nK-vE9fKXl8UTAG
X-Proofpoint-GUID: h4tELPdJfIrHtMQS6nK-vE9fKXl8UTAG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The driver currently only supports configuring for sample rates <= 96k
and it isn't possible to setup a configuration that will support all
sample rates up to 192k.

For sample rates up to 96k MCLK is in the 12MHz group.
However, although 192k only requires an I2S clock in the 12MHz group,
the cs42l42 audio path is not natively 192k so the audio must be
resampled. But for 192k the SRC requires a 24MHz MCLK.

It is not possible to switch MCLK between 12MHz and 24MHz groups
on-the-fly. The 12MHz group supports all sample rates up to 96k.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 174f738e9e5a..c18f42cc1044 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -802,7 +802,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
 	return snd_pcm_hw_constraint_minmax(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 192000);
+					    44100, 96000);
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -998,14 +998,14 @@ static struct snd_soc_dai_driver cs42l42_dai = {
 			.stream_name = "Playback",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_192000,
+			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = CS42L42_FORMATS,
 		},
 		.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
 			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_192000,
+			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = CS42L42_FORMATS,
 		},
 		.symmetric_rate = 1,
-- 
2.11.0

