Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BC7879D9
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A9CE868;
	Thu, 24 Aug 2023 23:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A9CE868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911025;
	bh=4iqIZczUwHj51+Gp035c8aMKqZB01cQjN+gVhw4Jg6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/NSrmdJyWg6YOZQaWiaUcsCCrGy6eUPX5SuTrqjzZXQSbjLptN1DP0R1TD2AJNEo
	 U1GchCiPu5ivX1hdB7+oQQdiGNZHsAfNhVvmaiLBcxKQ3FjaO80sI4RbGriLxrsIVY
	 0bZm+s77PLqbvry8haL/EC9L9b781FfN36qfQUNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90FEBF800BF; Thu, 24 Aug 2023 23:02:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C49DCF80564;
	Thu, 24 Aug 2023 23:02:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A669CF80553; Thu, 24 Aug 2023 23:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4AA1F80158
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AA1F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=RTMv7Ac4
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id BFCFA16C0056;
	Fri, 25 Aug 2023 00:01:42 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8NZIR6Q7wEB; Fri, 25 Aug 2023 00:01:40 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692910900; bh=4iqIZczUwHj51+Gp035c8aMKqZB01cQjN+gVhw4Jg6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTMv7Ac45M5rQV//w50oKm5b9LIFwAx1eCWjng4aD6OwoQw//kYxYJBlE9YIYgiu3
	 pNtCZWbgwQj3bv0fYampraiZY4KHfYli77Qdu/0DYiZYufllAAXsfZ/hHXkJ6ZZHWv
	 6xdPMUc+TZZ9DzDPhQUU2RLxQZOZkDrXgbdVQi6Y=
To: Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v2 2/4] ASoC: es8316: Enable support for MCLK div by 2
Date: Fri, 25 Aug 2023 00:01:33 +0300
Message-ID: <20230824210135.19303-3-posteuca@mutex.one>
In-Reply-To: <20230824210135.19303-1-posteuca@mutex.one>
References: <20230824210135.19303-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZAWNE7NORHAFCA34TENQXW2ZU34SRN5W
X-Message-ID-Hash: ZAWNE7NORHAFCA34TENQXW2ZU34SRN5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAWNE7NORHAFCA34TENQXW2ZU34SRN5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To properly support a line of Huawei laptops with AMD CPU and a
ES8336 codec connected to the ACP3X module we need to enable
the codec option to divide the MCLK by 2.

The option to divide the MCLK will be enabled for one SKU with a
48Mhz MCLK. This frequency seems to be too high for the codec and
leads to distorted sounds when the option is not enabled.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/codecs/es8316.c | 20 ++++++++++++++++++--
 sound/soc/codecs/es8316.h |  3 +++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 09fc0b25f600..b506cfb9bd5d 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -26,12 +26,19 @@
 /* In slave mode at single speed, the codec is documented as accepting 5
  * MCLK/LRCK ratios, but we also add ratio 400, which is commonly used on
  * Intel Cherry Trail platforms (19.2MHz MCLK, 48kHz LRCK).
+ * Ratio 1000 is needed for at least one AMD SKU where MCLK is 48Mhz.
  */
 #define NR_SUPPORTED_MCLK_LRCK_RATIOS ARRAY_SIZE(supported_mclk_lrck_ratios)
 static const unsigned int supported_mclk_lrck_ratios[] = {
-	256, 384, 400, 500, 512, 768, 1024
+	256, 384, 400, 500, 512, 768, 1000, 1024
 };
 
+/* In at least one AMD laptop the internal timing of the codec goes off
+ * if the MCLK (48Mhz) is not divided by 2. So we will divide all MCLK
+ * frequencies above and equal to 48MHz by 2.
+ */
+#define MAX_SUPPORTED_MCLK_FREQ 48000000
+
 struct es8316_priv {
 	struct mutex lock;
 	struct clk *mclk;
@@ -470,6 +477,7 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	u8 bclk_divider;
 	u16 lrck_divider;
 	int i;
+	unsigned int mclk_div = 1;
 
 	/* Validate supported sample rates that are autodetected from MCLK */
 	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
@@ -482,7 +490,15 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
 		return -EINVAL;
-	lrck_divider = es8316->sysclk / params_rate(params);
+
+	if (es8316->sysclk >= MAX_SUPPORTED_MCLK_FREQ) {
+		snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV,
+					      ES8316_CLKMGR_CLKSW_MCLK_DIV);
+		mclk_div = 2;
+	}
+
+	lrck_divider = es8316->sysclk / params_rate(params) / mclk_div;
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

