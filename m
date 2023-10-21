Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262F7D1FCD
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E58DF1;
	Sat, 21 Oct 2023 23:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E58DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923266;
	bh=kz7rWTmE0KpnS2UO/aEwsPdd5nHUd2efkTLXB8FDr4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5NEoPsdMCcB5GynhAj3ILHhuzDzAoH0PzZD8dbk38GZJVye1OatyXmAOIyacabqM
	 NBEbPrIE4TlKdNi3ZPqGwfZF/tt4Pn4p6o8HEsKebughs0Ne207xxwgGjHpOF9V9Ha
	 8+F33CnDAlvGWhseiaxKMtZNQEyF/5j8d5Ot0e+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51FFEF8025F; Sat, 21 Oct 2023 23:20:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD3ABF80567;
	Sat, 21 Oct 2023 23:20:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F8CF8027B; Sat, 21 Oct 2023 23:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14D7DF8027B
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D7DF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GbwnugBe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nU8iPa82O5AHx58qnfiVc4gIA4n1aCdJD/7eQMb12Z8=;
	b=GbwnugBejZYeK8bkXr3Ey3qgm+6ldpARxTccWmj7tRz5dezfiQOiEGzEMm8FU/jJ/eNOvv
	1nDe/JOwuD29iEq0IW4+76TtdES/qSIOcK611cTI/ro20exukkrSwEa+3Cqxrjbnq4/5be
	jIqLIEmDWAWr1NC63OE562Erex/1e60=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-0eAW35G0N_2260owBk0aOg-1; Sat,
 21 Oct 2023 17:15:49 -0400
X-MC-Unique: 0eAW35G0N_2260owBk0aOg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD2D1C05ED4;
	Sat, 21 Oct 2023 21:15:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2498492BFB;
	Sat, 21 Oct 2023 21:15:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_OUT_MAP quirk
Date: Sat, 21 Oct 2023 23:15:32 +0200
Message-ID: <20231021211534.114991-5-hdegoede@redhat.com>
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
References: <20231021211534.114991-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: ZHXFOEUZ7PIWAVY6QC6CBJNUI7GCOJQQ
X-Message-ID-Hash: ZHXFOEUZ7PIWAVY6QC6CBJNUI7GCOJQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHXFOEUZ7PIWAVY6QC6CBJNUI7GCOJQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some x86 WM5102 designs don't use the SPK pins for speaker output
instead they use the HPOUT2L + HPOUT2R for the speakers.

Add an BYT_WM5102_OUT_MAP quirk mechanism to allow selecting
between 2 output maps, one for the speakers on the SPK output pins
and one for the speakers on the HPOUT2 pins.

The new HPOUT2 map is enabled by default on CHT because this is used on
the Lenovo Yoga Tab 3 YT3-X90 model which is the only Cherry Trail design
currently supported. If different CHT designs turn up which need different
output maps we can add DMI quirks to select a different map later.

The userspace UCM profile also needs to know about this so
setup a components string with this info too.

While at it also drop the unused "Line Out" route.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 72 +++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 622ee3079f26..d1664d7e6443 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -37,10 +38,17 @@ struct byt_wm5102_private {
 	int mclk_freq;
 };
 
-/* Bits 0-15 are reserved for things like an input-map */
+/* Bits 0-3 are reserved for the input-map */
+#define BYT_WM5102_OUT_MAP		GENMASK(7, 4)
 #define BYT_WM5102_SSP2			BIT(16)
 #define BYT_WM5102_MCLK_19_2MHZ		BIT(17)
 
+/* Note these values are pre-shifted for easy use of setting quirks */
+enum {
+	BYT_WM5102_SPK_SPK_MAP		= FIELD_PREP_CONST(BYT_WM5102_OUT_MAP, 0),
+	BYT_WM5102_SPK_HPOUT2_MAP	= FIELD_PREP_CONST(BYT_WM5102_OUT_MAP, 1),
+};
+
 static unsigned long quirk;
 
 static int quirk_override = -1;
@@ -49,6 +57,20 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 static void log_quirks(struct device *dev)
 {
+	switch (quirk & BYT_WM5102_OUT_MAP) {
+	case BYT_WM5102_SPK_SPK_MAP:
+		dev_info_once(dev, "quirk SPK_SPK_MAP enabled\n");
+		break;
+	case BYT_WM5102_SPK_HPOUT2_MAP:
+		dev_info_once(dev, "quirk SPK_HPOUT2_MAP enabled\n");
+		break;
+	default:
+		dev_warn_once(dev, "quirk sets invalid output map: 0x%lx, defaulting to SPK_SPK_MAP\n",
+			      quirk & BYT_WM5102_OUT_MAP);
+		quirk &= ~BYT_WM5102_OUT_MAP;
+		quirk |= BYT_WM5102_SPK_SPK_MAP;
+		break;
+	}
 	if (quirk & BYT_WM5102_SSP2)
 		dev_info_once(dev, "quirk SSP2 enabled");
 	if (quirk & BYT_WM5102_MCLK_19_2MHZ)
@@ -164,12 +186,6 @@ static const struct snd_soc_dapm_route byt_wm5102_audio_map[] = {
 	{"Headset Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "Platform Clock"},
 	{"Speaker", NULL, "Platform Clock"},
-	{"Line Out", NULL, "Platform Clock"},
-
-	{"Speaker", NULL, "SPKOUTLP"},
-	{"Speaker", NULL, "SPKOUTLN"},
-	{"Speaker", NULL, "SPKOUTRP"},
-	{"Speaker", NULL, "SPKOUTRN"},
 	{"Speaker", NULL, "Speaker VDD"},
 
 	{"Headphone", NULL, "HPOUT1L"},
@@ -203,6 +219,18 @@ static const struct snd_soc_dapm_route bytcr_wm5102_ssp2_map[] = {
 	{"ssp2 Rx", NULL, "AIF1 Capture"},
 };
 
+static const struct snd_soc_dapm_route byt_wm5102_spk_spk_map[] = {
+	{"Speaker", NULL, "SPKOUTLP"},
+	{"Speaker", NULL, "SPKOUTLN"},
+	{"Speaker", NULL, "SPKOUTRP"},
+	{"Speaker", NULL, "SPKOUTRN"},
+};
+
+static const struct snd_soc_dapm_route byt_wm5102_spk_hpout2_map[] = {
+	{"Speaker", NULL, "HPOUT2L"},
+	{"Speaker", NULL, "HPOUT2R"},
+};
+
 static const struct snd_kcontrol_new byt_wm5102_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -243,6 +271,20 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
+	switch (quirk & BYT_WM5102_OUT_MAP) {
+	case BYT_WM5102_SPK_SPK_MAP:
+		custom_map = byt_wm5102_spk_spk_map;
+		num_routes = ARRAY_SIZE(byt_wm5102_spk_spk_map);
+		break;
+	case BYT_WM5102_SPK_HPOUT2_MAP:
+		custom_map = byt_wm5102_spk_hpout2_map;
+		num_routes = ARRAY_SIZE(byt_wm5102_spk_hpout2_map);
+		break;
+	}
+	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	if (ret)
+		return ret;
+
 	if (quirk & BYT_WM5102_SSP2) {
 		custom_map = bytcr_wm5102_ssp2_map;
 		num_routes = ARRAY_SIZE(bytcr_wm5102_ssp2_map);
@@ -434,8 +476,11 @@ static struct snd_soc_card byt_wm5102_card = {
 	.fully_routed = true,
 };
 
+static char byt_wm5102_components[64]; /* = "cfg-spk:* cfg-int-mic:* cfg-hs-mic:* ..." */
+
 static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 {
+	static const char * const out_map_name[] = { "spk", "hpout2" };
 	char codec_name[SND_ACPI_I2C_ID_LEN];
 	struct device *dev = &pdev->dev;
 	struct byt_wm5102_private *priv;
@@ -493,8 +538,13 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	}
 
 	if (soc_intel_is_cht()) {
-		/* On CHT default to SSP2 */
-		quirk = BYT_WM5102_SSP2 | BYT_WM5102_MCLK_19_2MHZ;
+		/*
+		 * CHT always uses SSP2 and 19.2 MHz; and
+		 * the one currently supported CHT design uses HPOUT2 as
+		 * speaker output.
+		 */
+		quirk = BYT_WM5102_SSP2 | BYT_WM5102_MCLK_19_2MHZ |
+			BYT_WM5102_SPK_HPOUT2_MAP;
 	}
 	if (quirk_override != -1) {
 		dev_info_once(dev, "Overriding quirk 0x%lx => 0x%x\n",
@@ -503,6 +553,10 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	}
 	log_quirks(dev);
 
+	snprintf(byt_wm5102_components, sizeof(byt_wm5102_components),
+		 "cfg-spk:%s", out_map_name[FIELD_GET(BYT_WM5102_OUT_MAP, quirk)]);
+	byt_wm5102_card.components = byt_wm5102_components;
+
 	/* find index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_wm5102_dais); i++) {
 		if (!strcmp(byt_wm5102_dais[i].codecs->name,
-- 
2.41.0

