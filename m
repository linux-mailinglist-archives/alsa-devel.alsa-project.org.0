Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98075C0C2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158D0201;
	Fri, 21 Jul 2023 10:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158D0201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926751;
	bh=iHiERc0MUOj9x+Yv42yz0WTp6ckuoH3/JUwCM+MO/TE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KMlfbzaaW41FdpaQ9Nm+kK7Hp3EHErwFP+U8S9zrUkR5bs1bbZaSEZU+6QiCBk5HG
	 63xXFYgrYvejcmrJD9658/yLsqeaRQOHgKn48kGCQo0/sGAuMWtD8/IqGUL4z8NIhg
	 M5UOHDCsq/UQz3wWa212/Zx8sFyoagVymWukUqsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A22D2F80552; Fri, 21 Jul 2023 10:04:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A003F80548;
	Fri, 21 Jul 2023 10:04:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E583F8047D; Wed, 19 Jul 2023 18:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E3D2F8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 18:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3D2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Ai77xjd4
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99364ae9596so995491066b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 09:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689784374; x=1692376374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezYh9TdYf9SPGlHOq/YkmRIkBcOvB6bLPP8t0cvosPU=;
        b=Ai77xjd4Papa7mIdUTLLLOt0HjEVd4UaRKKLVWju83yIoffIwGYoOAGpHNGPTBkW7R
         xzjBMM3CdMTo9T4RB9oSbJ75u9EW9fTtiCbZN8tfdNpmmrilnk8lNUNQTUFeECk61y56
         jkeI/OeVa4PUEAV7qe9J6W64tzVgBxb/uOUch8GEPWxL83j9+7RYdDFueAzwh9u3s9ET
         JrqViZoYcaeJku2l6lKHWbFdDFIwVlXGoDaG72e33Rrlz9B097nXYrVup6zSuA9iomFI
         yhl7MOnt+FU3nyXRgZWaikNNV3lKagEaqODe+zmbirKNVvfNK+S8rUpIgAFCDfSRXVdo
         3Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784374; x=1692376374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezYh9TdYf9SPGlHOq/YkmRIkBcOvB6bLPP8t0cvosPU=;
        b=YBKFltETZ5iTw3ssJh8gc+wvMG9ImOpzNZ7jT087iWtSdU4MSPf/ZuCmC3qgo0SEvX
         LYLsuVLj9+Uu/oAWDRw1KcAyk1qKKjJEAvIX5CnaA+0E4rfmTeyMEt4pZdbkFYL6DYgn
         flEeeJZwD27gmZfyiqTZUvROwSBm2XYlfQCDcHZHVfUsgTp3+3+pqsqIF4eDDteaCb27
         PoBpdfDS5EDfVbig3S70X99neQoLwhlx8WKPud3pJvcHvzc5RAKPhERfcGp8dv0RPNX8
         6bakFfh1yddrTWcHYoZRJwK539tftyx8qBGaPPOREVTRMAa6FKjATwOtJI0n4ANzEoch
         EcYg==
X-Gm-Message-State: ABy/qLbLRhGsSyTIO1EsNXn0rRXZ1TbmcAgqWzeoJMoXLt2clx9FfZXU
	bxKjolqk7pssILDsx+zZ9dM=
X-Google-Smtp-Source: 
 APBJJlHZwwjBvT87CgsBUjDjYtMiifOSzfmRfPiW+vi01bUGZ/rvbUobuTctzgwoF66GEBo+mJgTOA==
X-Received: by 2002:a17:906:290:b0:999:37ff:be94 with SMTP id
 16-20020a170906029000b0099937ffbe94mr2432672ejf.71.1689784373757;
        Wed, 19 Jul 2023 09:32:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
        by smtp.gmail.com with ESMTPSA id
 o21-20020a17090637d500b0098e025cda3bsm2571044ejc.141.2023.07.19.09.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:32:53 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Matus Gajdos <matuszpd@gmail.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
Date: Wed, 19 Jul 2023 18:31:53 +0200
Message-Id: <20230719163154.19492-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: matuszpd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OI5IY2D7YC5NN3W6MVKUCIYC3K2CEILF
X-Message-ID-Hash: OI5IY2D7YC5NN3W6MVKUCIYC3K2CEILF
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:04:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OI5IY2D7YC5NN3W6MVKUCIYC3K2CEILF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for 22.05 kHz sample rate for TX.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_spdif.c | 8 ++++++--
 sound/soc/fsl/fsl_spdif.h | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 015c3708aa04..95e639711eba 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -514,6 +514,10 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 	int ret;
 
 	switch (sample_rate) {
+	case 22050:
+		rate = SPDIF_TXRATE_22050;
+		csfs = IEC958_AES3_CON_FS_22050;
+		break;
 	case 32000:
 		rate = SPDIF_TXRATE_32000;
 		csfs = IEC958_AES3_CON_FS_32000;
@@ -1422,7 +1426,7 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 				struct clk *clk, u64 savesub,
 				enum spdif_txrate index, bool round)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+	static const u32 rate[] = { 22050, 32000, 44100, 48000, 88200, 96000, 176400,
 				    192000, };
 	bool is_sysclk = clk_is_match(clk, spdif_priv->sysclk);
 	u64 rate_ideal, rate_actual, sub;
@@ -1483,7 +1487,7 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 				enum spdif_txrate index)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+	static const u32 rate[] = { 22050, 32000, 44100, 48000, 88200, 96000, 176400,
 				    192000, };
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index 75b42a692c90..2bc1b10c17d4 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -175,7 +175,8 @@ enum spdif_gainsel {
 
 /* SPDIF tx rate */
 enum spdif_txrate {
-	SPDIF_TXRATE_32000 = 0,
+	SPDIF_TXRATE_22050 = 0,
+	SPDIF_TXRATE_32000,
 	SPDIF_TXRATE_44100,
 	SPDIF_TXRATE_48000,
 	SPDIF_TXRATE_88200,
@@ -191,7 +192,8 @@ enum spdif_txrate {
 #define SPDIF_QSUB_SIZE			(SPDIF_UBITS_SIZE / 8)
 
 
-#define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_32000 |	\
+#define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_22050 |	\
+					 SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 |	\
 					 SNDRV_PCM_RATE_48000 |	\
 					 SNDRV_PCM_RATE_88200 | \
-- 
2.25.1

