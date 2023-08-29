Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B578CF5C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB16827;
	Wed, 30 Aug 2023 00:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB16827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693346627;
	bh=SprIKnjxd+XbEfV+ec+7dXXthO9g9LD+yn4zC/aX/LY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ky1OJFzFBy0KMNbUrFBU1nzruUUHHT8VQxGioRLbTau0uz4+QxomiMJpsLTDv1/Sr
	 icZOS4PMjjd+wd+O3g6EHCGwI02p6t7P0e9HnLYIPW4NjSEAYdYjx9wZTXqh+5BNGU
	 yvklHweWoUaXj2tt+TiLEnNhaVFlY0oLfKKtuO/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF6FF80580; Wed, 30 Aug 2023 00:01:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCA8F8057F;
	Wed, 30 Aug 2023 00:01:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F265F80571; Wed, 30 Aug 2023 00:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A71A4F80158
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71A4F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=GkqSsDP1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 2155016C0048;
	Wed, 30 Aug 2023 01:01:27 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nbl6XnZaHL6p; Wed, 30 Aug 2023 01:01:25 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693346485; bh=SprIKnjxd+XbEfV+ec+7dXXthO9g9LD+yn4zC/aX/LY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkqSsDP1U4E46wv7YhtutIxrTZxLoza5ePPRHLpcvq6X4374KOvMMeGuYcHwvQnZl
	 NrCHGd+Xg3T8gFY69eNqQ1ZoUF171ZVjyZ5+x3IyrUV3eKLL1d+upjKWAGxXXBJDcb
	 4HNOfMEhGZ2ZXMJx8QqPyVluWZjYTTDA0A3NyqHM=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v3 3/5] ASoC: es8316: Enable support for MCLK div by 2
Date: Wed, 30 Aug 2023 01:01:14 +0300
Message-ID: <20230829220116.1159-4-posteuca@mutex.one>
In-Reply-To: <20230829220116.1159-1-posteuca@mutex.one>
References: <20230829220116.1159-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BSPTUJK6L4HCB3GXJVKGD75566PBBLMS
X-Message-ID-Hash: BSPTUJK6L4HCB3GXJVKGD75566PBBLMS
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSPTUJK6L4HCB3GXJVKGD75566PBBLMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To properly support a line of Huawei laptops with an AMD CPU
and an ES8336 codec connected to the ACP3X module, we need
to enable the codec option to divide the MCLK by 2.
This is needed because for at least one SKU that has a 48Mhz
MCLK the sound is distorted unless the MCLK div by 2 option
is enabled.

The option to divide the MCLK will first be tried. If no suitable
clocking can be generated from this frequency, then the normal
non-halved MCLK frequency will be tried.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 45 +++++++++++++++++++++++++++++----------
 sound/soc/codecs/es8316.h |  3 +++
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index a1c3e10c3cf1..e53b2856d625 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -469,19 +469,42 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	u8 bclk_divider;
 	u16 lrck_divider;
 	int i;
+	unsigned int clk = es8316->sysclk / 2;
+	bool clk_valid = false;
+
+	/* We will start with halved sysclk and see if we can use it
+	 * for proper clocking. This is to minimise the risk of running
+	 * the CODEC with a too high frequency. We have an SKU where
+	 * the sysclk frequency is 48Mhz and this causes the sound to be
+	 * sped up. If we can run with a halved sysclk, we will use it,
+	 * if we can't use it, then full sysclk will be used.
+	 */
+	do {
+		/* Validate supported sample rates that are autodetected from MCLK */
+		for (i = 0; i < ARRAY_SIZE(supported_mclk_lrck_ratios); i++) {
+			const unsigned int ratio = supported_mclk_lrck_ratios[i];
+
+			if (clk % ratio != 0)
+				continue;
+			if (clk / ratio == params_rate(params))
+				break;
+		}
+		if (i == ARRAY_SIZE(supported_mclk_lrck_ratios)) {
+			if (clk == es8316->sysclk)
+				return -EINVAL;
+			clk = es8316->sysclk;
+		} else {
+			clk_valid = true;
+		}
+	} while (!clk_valid);
 
-	/* Validate supported sample rates that are autodetected from MCLK */
-	for (i = 0; i < ARRAY_SIZE(supported_mclk_lrck_ratios); i++) {
-		const unsigned int ratio = supported_mclk_lrck_ratios[i];
-
-		if (es8316->sysclk % ratio != 0)
-			continue;
-		if (es8316->sysclk / ratio == params_rate(params))
-			break;
+	if (clk != es8316->sysclk) {
+		snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV);
 	}
-	if (i == ARRAY_SIZE(supported_mclk_lrck_ratios))
-		return -EINVAL;
-	lrck_divider = es8316->sysclk / params_rate(params);
+
+	lrck_divider = clk / params_rate(params);
 	bclk_divider = lrck_divider / 4;
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
diff --git a/sound/soc/codecs/es8316.h b/sound/soc/codecs/es8316.h
index c335138e2837..0ff16f948690 100644
--- a/sound/soc/codecs/es8316.h
+++ b/sound/soc/codecs/es8316.h
@@ -129,4 +129,7 @@
 #define ES8316_GPIO_FLAG_GM_NOT_SHORTED		0x02
 #define ES8316_GPIO_FLAG_HP_NOT_INSERTED	0x04
 
+/* ES8316_CLKMGR_CLKSW */
+#define ES8316_CLKMGR_CLKSW_MCLK_DIV	0x80
+
 #endif
-- 
2.41.0

