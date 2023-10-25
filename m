Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07F7D6ED0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B106C1;
	Wed, 25 Oct 2023 16:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B106C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698244600;
	bh=33Ei53Pw07lbJnyj6aukh4h2LQQRmq6mgRq79CxhxLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=asBo5pXBI2ob0ij4xNdNFIlCURm4bJyXgD/gUrv6thuzMdHZzTZwXUa3e005qCiv4
	 J9lNa8wpDjRGcRcWYGbw3uQuxHMTipzzhJJiVbs6PtsjSEU/ixsCbYlBeWlCOLgbKi
	 k4cINv8IIGJIGzqcMkg7z+on3TX4vfFx87DwD7EY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD12F8012B; Wed, 25 Oct 2023 16:35:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A6BF8010B;
	Wed, 25 Oct 2023 16:35:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8299AF8028D; Wed, 25 Oct 2023 16:35:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 67B23F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B23F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Njwfzhf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698244528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2lGqqRsr6YPHOgQy0n6CqCNB06Eoj6aeWiDhog8eUUY=;
	b=Njwfzhf2EtW4UqqKOVNh41Cx0NMQVaYi7IWd5DmQJpcWy5p4MYc2R40GJP/yZJVATHx3L4
	9tolkpAVXg9MfSdVz0iBQEPOeZCMe30+Gihq3xGwvqUW101TSdrfcVdTNkwqNatTArcTsg
	lwYR7bdSO0MtKXTTSULNIfUZY32pz0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-4Nl8AtWSNb-QMypukBeVVA-1; Wed, 25 Oct 2023 10:35:26 -0400
X-MC-Unique: 4Nl8AtWSNb-QMypukBeVVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7964857CF1;
	Wed, 25 Oct 2023 14:35:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAA5A2026D4C;
	Wed, 25 Oct 2023 14:35:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_MCLK_19_2MHZ
 quirk
Date: Wed, 25 Oct 2023 16:35:11 +0200
Message-ID: <20231025143513.291753-3-hdegoede@redhat.com>
In-Reply-To: <20231025143513.291753-1-hdegoede@redhat.com>
References: <20231025143513.291753-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: PENFM4U2XVPMCB4UHW2I52RP26CG447M
X-Message-ID-Hash: PENFM4U2XVPMCB4UHW2I52RP26CG447M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PENFM4U2XVPMCB4UHW2I52RP26CG447M/>
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

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 932a5523b682..05a07b25e0f2 100644
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

