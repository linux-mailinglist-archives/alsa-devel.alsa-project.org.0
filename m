Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116278CF5B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 00:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703EEDF8;
	Wed, 30 Aug 2023 00:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703EEDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693346603;
	bh=LABLKY8cGdghJhYahx98998a8gcU3xlpMvrXzGnf6a8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dnd+RAfsBZdkygeROeYVP31sBz22A7jE9BSFc5mK3//6ans+Yk5zcptIZbEu7/yrF
	 +wdMyppaJxfqMhoFqjmZLPfvIfrR4iCHbUWFKZcdHKrW4QFRMCZT0Wz5TGKUoBoYxc
	 wPvNrk7BqhsGThBMqhUAJevC9a+IgSbXs0oSDmtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DCA9F8057A; Wed, 30 Aug 2023 00:01:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A56FAF80158;
	Wed, 30 Aug 2023 00:01:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85CEAF8023B; Wed, 30 Aug 2023 00:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9E30F80155
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 00:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E30F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=RFvBbT2f
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id D79EF16C0055;
	Wed, 30 Aug 2023 01:01:25 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4aYD75tWZSX; Wed, 30 Aug 2023 01:01:24 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1693346484; bh=LABLKY8cGdghJhYahx98998a8gcU3xlpMvrXzGnf6a8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RFvBbT2fFvhcNjvMZZJV6XHR214q10qz2f3nbDu7BhKVyhEeZjWUr15pfX7ZZUBXf
	 vzVSFPPYzR+0pBXXGw6+4ab35uuxPkxjasoSjGOvXOSlmi6kU1M7SnX2pHah+4pN/M
	 NEc+xm4nN6RruGgrm72R3ZwJCTy5ym3MvYetq+A8=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v3 2/5] ASoC: es8316: Replace NR_SUPPORTED_MCLK_LRCK_RATIOS
 with ARRAY_SIZE()
Date: Wed, 30 Aug 2023 01:01:13 +0300
Message-ID: <20230829220116.1159-3-posteuca@mutex.one>
In-Reply-To: <20230829220116.1159-1-posteuca@mutex.one>
References: <20230829220116.1159-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 24RTEMRTMXAY55VY3UAQLJOHVXG4HA7K
X-Message-ID-Hash: 24RTEMRTMXAY55VY3UAQLJOHVXG4HA7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24RTEMRTMXAY55VY3UAQLJOHVXG4HA7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No need for a special define since we can use ARRAY_SIZE() directly,
and won't need to worry to keep it in sync.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 09fc0b25f600..a1c3e10c3cf1 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -27,7 +27,6 @@
  * MCLK/LRCK ratios, but we also add ratio 400, which is commonly used on
  * Intel Cherry Trail platforms (19.2MHz MCLK, 48kHz LRCK).
  */
-#define NR_SUPPORTED_MCLK_LRCK_RATIOS ARRAY_SIZE(supported_mclk_lrck_ratios)
 static const unsigned int supported_mclk_lrck_ratios[] = {
 	256, 384, 400, 500, 512, 768, 1024
 };
@@ -40,7 +39,7 @@ struct es8316_priv {
 	struct snd_soc_jack *jack;
 	int irq;
 	unsigned int sysclk;
-	unsigned int allowed_rates[NR_SUPPORTED_MCLK_LRCK_RATIOS];
+	unsigned int allowed_rates[ARRAY_SIZE(supported_mclk_lrck_ratios)];
 	struct snd_pcm_hw_constraint_list sysclk_constraints;
 	bool jd_inverted;
 };
@@ -382,7 +381,7 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	/* Limit supported sample rates to ones that can be autodetected
 	 * by the codec running in slave mode.
 	 */
-	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
+	for (i = 0; i < ARRAY_SIZE(supported_mclk_lrck_ratios); i++) {
 		const unsigned int ratio = supported_mclk_lrck_ratios[i];
 
 		if (freq % ratio == 0)
@@ -472,7 +471,7 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	int i;
 
 	/* Validate supported sample rates that are autodetected from MCLK */
-	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
+	for (i = 0; i < ARRAY_SIZE(supported_mclk_lrck_ratios); i++) {
 		const unsigned int ratio = supported_mclk_lrck_ratios[i];
 
 		if (es8316->sysclk % ratio != 0)
@@ -480,7 +479,7 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 		if (es8316->sysclk / ratio == params_rate(params))
 			break;
 	}
-	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
+	if (i == ARRAY_SIZE(supported_mclk_lrck_ratios))
 		return -EINVAL;
 	lrck_divider = es8316->sysclk / params_rate(params);
 	bclk_divider = lrck_divider / 4;
-- 
2.41.0

