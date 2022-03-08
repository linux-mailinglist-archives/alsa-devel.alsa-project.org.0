Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4274D1EB9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A103187B;
	Tue,  8 Mar 2022 18:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A103187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760057;
	bh=AN72OL0dXEGI0OEMMfVN1TwIk5aNwgb706b95+NXmcs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+O6lp3WwZKlipREc8adXdnlLyoGvj3Re8nzlthdtUloydNQ/0hTAauBPQUae2tnu
	 Qf/ER0yN+z9VyweCLJ0j8f17KBs+7U1HzTTIabarf4efl8peqt4gDv0PoTtCU5rqpB
	 nvncSKBAHz5ppz0Qe8VNXa9irSj5C6UOUNnen0hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75D0FF8053B;
	Tue,  8 Mar 2022 18:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF8AF80535; Tue,  8 Mar 2022 18:17:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EC87F80518
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC87F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UIel5sQr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228FxhGV010224;
 Tue, 8 Mar 2022 11:17:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mGz/I8GdLl656J3RCjFowA+MLJmwN8TeQmYF2TCEC3o=;
 b=UIel5sQrGyZj9N0108N48KDiTEZQ8G1MHCs4l2JjIxAoEYNOS1avgI+Uf+LmAqC82nev
 gO+35rl4xdqdUh2xlFIrzYzi1ENcLSsl4yijmBBe5lm1qTFV2VeNI67Q6+C7P16FLV3V
 UPEEEONShCQrfuQl+wQHGU6W18t8wtV3eJw7hR+wD1AAkt0xF9TdN6/NRqPTOS7wOGqX
 yhVcm7TE+192xItOdQ91UwwDkWrlXu2T7mDQQ/HK/9CW8IoqV7Y3agzRvaWNN75Tc53Q
 /um0n5zRXNw+PCZnGR0lb9uKc84lGC172udcCwRkf2D7UWX0yonA0ElDMURNnliGkHkU dg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656mh5v-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Mar 2022 11:17:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 17:17:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 8 Mar 2022 17:17:33 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 18F9511D1;
 Tue,  8 Mar 2022 17:17:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 05/16] ALSA: hda: cs35l41: Always configure the DAI
Date: Tue, 8 Mar 2022 17:17:19 +0000
Message-ID: <20220308171730.454587-6-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Pw_C11ee-rv0nN9wtCImYdaIKyQY_GIS
X-Proofpoint-GUID: Pw_C11ee-rv0nN9wtCImYdaIKyQY_GIS
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

The dai configuration is always the same and should always configured
during the opening the stream.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index fe6f6a208d29..4c99dcac2dd7 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -111,8 +111,6 @@ static const struct reg_sequence cs35l41_reset_to_safe[] = {
 static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_no_bst = {
 	.probe		= cs35l41_reset_to_safe,
 	.num_probe	= ARRAY_SIZE(cs35l41_reset_to_safe),
-	.open		= cs35l41_hda_config,
-	.num_open	= ARRAY_SIZE(cs35l41_hda_config),
 	.prepare	= cs35l41_safe_to_active,
 	.num_prepare	= ARRAY_SIZE(cs35l41_safe_to_active),
 	.cleanup	= cs35l41_active_to_safe,
@@ -120,8 +118,6 @@ static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_no_bst = {
 };
 
 static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_ext_bst = {
-	.open		= cs35l41_hda_config,
-	.num_open	= ARRAY_SIZE(cs35l41_hda_config),
 	.prepare	= cs35l41_start_ext_vspk,
 	.num_prepare	= ARRAY_SIZE(cs35l41_start_ext_vspk),
 	.cleanup	= cs35l41_stop_ext_vspk,
@@ -129,8 +125,6 @@ static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_ext_bst = {
 };
 
 static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_int_bst = {
-	.open		= cs35l41_hda_config,
-	.num_open	= ARRAY_SIZE(cs35l41_hda_config),
 	.prepare	= cs35l41_hda_start_bst,
 	.num_prepare	= ARRAY_SIZE(cs35l41_hda_start_bst),
 	.cleanup	= cs35l41_hda_stop_bst,
@@ -146,8 +140,8 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
-		if (reg_seq->open)
-			ret = regmap_multi_reg_write(reg, reg_seq->open, reg_seq->num_open);
+		ret = regmap_multi_reg_write(reg, cs35l41_hda_config,
+					     ARRAY_SIZE(cs35l41_hda_config));
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		if (reg_seq->prepare)
-- 
2.35.1

