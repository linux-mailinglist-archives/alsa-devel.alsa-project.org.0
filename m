Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A425C3E7CA2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00DF4175C;
	Tue, 10 Aug 2021 17:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00DF4175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610224;
	bh=wIK3T/8tY8AT/dyhlNn4MQnll4PgUr0XUebdUztcbtE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5LbfND28ltFStigxT+zd45N7iysJ4XDTF7eYAu5lvDv1elPirSCXZM0YO9zQTPhy
	 /poF3DCEJZVLcOHuzgsDGh4t1xYM5m/1xNLNubWgvAWhZt54dV2TYlMUjlXJriAzWB
	 /YQv6QdJJBog1SNeCMwi3eHMdiVUYugHOellFSp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D09F80533;
	Tue, 10 Aug 2021 17:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8754F80519; Tue, 10 Aug 2021 17:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7AB5F804E4
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7AB5F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="C0nIKYR8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17AAlVv7027584; 
 Tue, 10 Aug 2021 10:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=M4NVOiS+8e9dy3UcC2jfG2nQmNP23NGdaJLXRG3jAcM=;
 b=C0nIKYR8/f4l+EHOD5RSKesPlt7abjCcqV/KimekgtyhGlWfySYb1WY9K1dRIx/ce3K/
 qSdUBeFrluF2cwB1AooDyqvlPxXeNWf/ZxAiYq7wNCJej3vFcL3D6iWzxj2JEGEvrWu+
 vRzaW2v6jzErS9QpNOp7yX8+M98z/uRuYS4XwLmXM7xgaM1h+3V57Bpr7WIDozwGKzMw
 62wn+TBv1feseqxoMb9J4IWwCfN1WWCJSERM85nVIxcR2JYfhGUpTGCsnG0U2L9Y9481
 6Wq8ACQzKrgFwqSYb9rwrA1oJZN+POqRwmLFX1zxnEk1y/5AzhliaC9c/QPKGlleLx11 /Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3abr0u0e2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:03 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 02E5845D;
 Tue, 10 Aug 2021 15:38:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 02/12] ASoC: cs42l42: Don't claim to support 192k
Date: Tue, 10 Aug 2021 16:37:49 +0100
Message-ID: <20210810153759.24333-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Upagjle_tQt1edBaNOp6RJgsr7x6hArl
X-Proofpoint-GUID: Upagjle_tQt1edBaNOp6RJgsr7x6hArl
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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
index 3c1609865440..a43cdfb6223b 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -819,7 +819,7 @@ static int cs42l42_dai_startup(struct snd_pcm_substream *substream, struct snd_s
 	/* Machine driver has not set a SCLK, limit bottom end to 44.1 kHz */
 	return snd_pcm_hw_constraint_minmax(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_RATE,
-					    44100, 192000);
+					    44100, 96000);
 }
 
 static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -1026,14 +1026,14 @@ static struct snd_soc_dai_driver cs42l42_dai = {
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

