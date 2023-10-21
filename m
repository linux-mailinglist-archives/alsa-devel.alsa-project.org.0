Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B356E7D1FC5
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDB5086E;
	Sat, 21 Oct 2023 23:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDB5086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923151;
	bh=D9wqZG4+YLvbONX/aSeArqU1tm+LVFgELWBREqk66Qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FlmfX/tG8swrUn4HDgs2dwSL/sOt3ZsPwdi+X/+1FkPoWwYJZvyoZ2hMG2dy1/RNo
	 Lb02hCZJcVLEF5KpYXe6u++bh1dp5ru+H7//2gq1jXSMnc92nLyn1mBKBo0UI8sIyd
	 iy3qZyxtns90dqdLBsV506yt65D8jAUzwvTbfF1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ED72F80564; Sat, 21 Oct 2023 23:17:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E72CCF80558;
	Sat, 21 Oct 2023 23:17:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 484CDF8032D; Sat, 21 Oct 2023 23:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A72AF8024E
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A72AF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FAE00s9r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zX7R3dPXhnRUd6EfEGArN/haExKYVfr7JTHCT7kPxU=;
	b=FAE00s9rYvm3WbIKSV3jF2R5PgSZOhbu6IdGyLTMW5yKoS0P9aZ6MbmIBM7d/tV3js8ycG
	GPmCwBH+bKlWcjrEOH+rCFHO+frnvNiidZQnfEX+d9cVe75NtzopWWEP1zxuzs2PRxZy22
	cm8mvpjttZF9XnhpXq6wGsMsQ2jtvAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-HoA3X-ytO1GtP2f_mzC2DQ-1; Sat, 21 Oct 2023 17:15:48 -0400
X-MC-Unique: HoA3X-ytO1GtP2f_mzC2DQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0A4D185A795;
	Sat, 21 Oct 2023 21:15:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B19C8492BFB;
	Sat, 21 Oct 2023 21:15:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_MCLK_19_2MHZ
 quirk
Date: Sat, 21 Oct 2023 23:15:31 +0200
Message-ID: <20231021211534.114991-4-hdegoede@redhat.com>
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
References: <20231021211534.114991-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JS4MPAR5PVKSUPBPZGYRLD22NCZIECAE
X-Message-ID-Hash: JS4MPAR5PVKSUPBPZGYRLD22NCZIECAE
X-MailFrom: hdegoede@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JS4MPAR5PVKSUPBPZGYRLD22NCZIECAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cherry Trail SoC only supports 19200000 as clk-frequency for
the pmc_plt_clk used for the audio codec.

Add a BYT_WM5102_MCLK_19_2MHZ quirk for this and enable this
by default on Cherry Trail SoCs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 51682137c4a8..622ee3079f26 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -27,8 +27,6 @@
 #include "../../codecs/wm5102.h"
 #include "../atom/sst-atom-controls.h"
 
-#define MCLK_FREQ		25000000
-
 #define WM5102_MAX_SYSCLK_4K	49152000 /* max sysclk for 4K family */
 #define WM5102_MAX_SYSCLK_11025	45158400 /* max sysclk for 11.025K family */
 
@@ -36,10 +34,12 @@ struct byt_wm5102_private {
 	struct snd_soc_jack jack;
 	struct clk *mclk;
 	struct gpio_desc *spkvdd_en_gpio;
+	int mclk_freq;
 };
 
 /* Bits 0-15 are reserved for things like an input-map */
 #define BYT_WM5102_SSP2			BIT(16)
+#define BYT_WM5102_MCLK_19_2MHZ		BIT(17)
 
 static unsigned long quirk;
 
@@ -51,6 +51,8 @@ static void log_quirks(struct device *dev)
 {
 	if (quirk & BYT_WM5102_SSP2)
 		dev_info_once(dev, "quirk SSP2 enabled");
+	if (quirk & BYT_WM5102_MCLK_19_2MHZ)
+		dev_info_once(dev, "quirk MCLK 19.2MHz enabled");
 }
 
 static int byt_wm5102_spkvdd_power_event(struct snd_soc_dapm_widget *w,
@@ -68,6 +70,7 @@ static int byt_wm5102_spkvdd_power_event(struct snd_soc_dapm_widget *w,
 static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int rate)
 {
 	struct snd_soc_component *codec_component = codec_dai->component;
+	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(codec_component->card);
 	int sr_mult = ((rate % 4000) == 0) ?
 		(WM5102_MAX_SYSCLK_4K / rate) :
 		(WM5102_MAX_SYSCLK_11025 / rate);
@@ -79,7 +82,7 @@ static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int
 
 	/* Configure the FLL1 PLL before selecting it */
 	ret = snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_CLK_SRC_MCLK1,
-				  MCLK_FREQ, rate * sr_mult);
+				  priv->mclk_freq, rate * sr_mult);
 	if (ret) {
 		dev_err(codec_component->dev, "Error setting PLL: %d\n", ret);
 		return ret;
@@ -251,6 +254,11 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
+	if (quirk & BYT_WM5102_MCLK_19_2MHZ)
+		priv->mclk_freq = 19200000;
+	else
+		priv->mclk_freq = 25000000;
+
 	/*
 	 * The firmware might enable the clock at boot (this information
 	 * may or may not be reflected in the enable clock register).
@@ -263,7 +271,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 	if (!ret)
 		clk_disable_unprepare(priv->mclk);
 
-	ret = clk_set_rate(priv->mclk, MCLK_FREQ);
+	ret = clk_set_rate(priv->mclk, priv->mclk_freq);
 	if (ret) {
 		dev_err(card->dev, "Error setting MCLK rate: %d\n", ret);
 		return ret;
@@ -486,7 +494,7 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 
 	if (soc_intel_is_cht()) {
 		/* On CHT default to SSP2 */
-		quirk = BYT_WM5102_SSP2;
+		quirk = BYT_WM5102_SSP2 | BYT_WM5102_MCLK_19_2MHZ;
 	}
 	if (quirk_override != -1) {
 		dev_info_once(dev, "Overriding quirk 0x%lx => 0x%x\n",
-- 
2.41.0

