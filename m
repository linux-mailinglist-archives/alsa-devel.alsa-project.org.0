Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE6763C30
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 18:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C33B5820;
	Wed, 26 Jul 2023 18:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C33B5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690388259;
	bh=KZMh6gXb5/w9VAYcBbs3HMPGR9VX5lnocJ18hEQ/n2s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tNU1nap0CUIB9r6fLSHbYUgWf7Dq976vAJIBwdGdPPPx9dexIxsBiAEpupTN7mZar
	 irniWuL3cEw1ZPVdfeT/HTdxYPkgvoUwrFgLtaH49DriXR5gi/367SQ36FyyLPQySD
	 xrBEyaeFibebNXVFb8eb3CGq/TjGVSiP7hikxQ/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2C70F80149; Wed, 26 Jul 2023 18:16:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C6EF80153;
	Wed, 26 Jul 2023 18:16:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 173EDF8019B; Wed, 26 Jul 2023 18:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4571FF80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 18:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4571FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N6BxAX76
Received: by mail.gandi.net (Postfix) with ESMTPA id CB81420003;
	Wed, 26 Jul 2023 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690388186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eBmzEf3kjVQ82BbqkAs+ELGEXlJ8CUzuDkLRObIRhk4=;
	b=N6BxAX76EenROMlARU/JmssigVE/7f+lesvsSK/kILa36HBHNRwtPOP1C/NA8GneXVZWlo
	vwidYrwh4GOQ7EQWfGtYjcJIsu9vsAZ24pXLxDAjV6aWECeREVMNS0+TtlGuuLxzAzdEv7
	hTixV+QT0O9oFHPfYJHM3x7zLuMoq3x8VN68tjceNpjiTvTsnUgoEpeaFRhUvZeij+bfX7
	gPinUZg2zf75u1p9QXu4K/ZDUaRYE1EL0khQUcBr7IlqLu5uW+UM7N6c4E7U8LyuoFUu5l
	3W6JvMGmhe7koaf81QJ5s0Z4aBWTKumknM2zq7NyO9B2zd5f4rtOeDdZekfD4A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/1] ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t values
 handling
Date: Wed, 26 Jul 2023 18:16:20 +0200
Message-ID: <20230726161620.495298-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 3RTUEENVSCNY3B3WLACAGYPYVNTD4IER
X-Message-ID-Hash: 3RTUEENVSCNY3B3WLACAGYPYVNTD4IER
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RTUEENVSCNY3B3WLACAGYPYVNTD4IER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Running sparse on fsl_qmc_audio (make C=1) raises the following warnings:
 fsl_qmc_audio.c:387:26: warning: restricted snd_pcm_format_t degrades to integer
 fsl_qmc_audio.c:389:59: warning: incorrect type in argument 1 (different base types)
 fsl_qmc_audio.c:389:59:    expected restricted snd_pcm_format_t [usertype] format
 fsl_qmc_audio.c:389:59:    got unsigned int [assigned] i
 fsl_qmc_audio.c:564:26: warning: restricted snd_pcm_format_t degrades to integer
 fsl_qmc_audio.c:569:50: warning: incorrect type in argument 1 (different base types)
 fsl_qmc_audio.c:569:50:    expected restricted snd_pcm_format_t [usertype] format
 fsl_qmc_audio.c:569:50:    got int [assigned] i
 fsl_qmc_audio.c:573:62: warning: incorrect type in argument 1 (different base types)
 fsl_qmc_audio.c:573:62:    expected restricted snd_pcm_format_t [usertype] format
 fsl_qmc_audio.c:573:62:    got int [assigned] i

These warnings are due to snd_pcm_format_t values handling done in the
driver. Some macros and functions exist to handle safely these values.

Use dedicated macros and functions to remove these warnings.

Fixes: 075c7125b11c ("ASoC: fsl: Add support for QMC audio")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 7cbb8e4758cc..56d6b0b039a2 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -372,8 +372,8 @@ static int qmc_dai_hw_rule_format_by_channels(struct qmc_dai *qmc_dai,
 	struct snd_mask *f_old = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	unsigned int channels = params_channels(params);
 	unsigned int slot_width;
+	snd_pcm_format_t format;
 	struct snd_mask f_new;
-	unsigned int i;
 
 	if (!channels || channels > nb_ts) {
 		dev_err(qmc_dai->dev, "channels %u not supported\n",
@@ -384,10 +384,10 @@ static int qmc_dai_hw_rule_format_by_channels(struct qmc_dai *qmc_dai,
 	slot_width = (nb_ts / channels) * 8;
 
 	snd_mask_none(&f_new);
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-		if (snd_mask_test(f_old, i)) {
-			if (snd_pcm_format_physical_width(i) <= slot_width)
-				snd_mask_set(&f_new, i);
+	pcm_for_each_format(format) {
+		if (snd_mask_test_format(f_old, format)) {
+			if (snd_pcm_format_physical_width(format) <= slot_width)
+				snd_mask_set_format(&f_new, format);
 		}
 	}
 
@@ -551,26 +551,26 @@ static const struct snd_soc_dai_ops qmc_dai_ops = {
 
 static u64 qmc_audio_formats(u8 nb_ts)
 {
-	u64 formats;
-	unsigned int chan_width;
 	unsigned int format_width;
-	int i;
+	unsigned int chan_width;
+	snd_pcm_format_t format;
+	u64 formats_mask;
 
 	if (!nb_ts)
 		return 0;
 
-	formats = 0;
+	formats_mask = 0;
 	chan_width = nb_ts * 8;
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+	pcm_for_each_format(format) {
 		/*
 		 * Support format other than little-endian (ie big-endian or
 		 * without endianness such as 8bit formats)
 		 */
-		if (snd_pcm_format_little_endian(i) == 1)
+		if (snd_pcm_format_little_endian(format) == 1)
 			continue;
 
 		/* Support physical width multiple of 8bit */
-		format_width = snd_pcm_format_physical_width(i);
+		format_width = snd_pcm_format_physical_width(format);
 		if (format_width == 0 || format_width % 8)
 			continue;
 
@@ -581,9 +581,9 @@ static u64 qmc_audio_formats(u8 nb_ts)
 		if (format_width > chan_width || chan_width % format_width)
 			continue;
 
-		formats |= (1ULL << i);
+		formats_mask |= pcm_format_to_bits(format);
 	}
-	return formats;
+	return formats_mask;
 }
 
 static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *np,
-- 
2.41.0

