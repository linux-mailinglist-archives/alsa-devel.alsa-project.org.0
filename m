Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B097D1FC6
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77F0593A;
	Sat, 21 Oct 2023 23:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77F0593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923153;
	bh=9cjz4gEptE7d6WOLh707GhaGFGNq+56BR+qJJwyo3io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tHhq7JQuCT4ZkUHxARDd53tVS5gtbj0bTsKAu8DPK2KnvLbVcrMeJYBy/te6vTRxj
	 q+NXwRFX+sO8KolgXfHbJ/Ry2rJsMcU4peIxH0qloaYCcaO9YyA8SkjksHrYpwucHc
	 utb707F9pCLyRPzB1mFeO/0p4dSGPnGl/GktbE2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FFEEF80580; Sat, 21 Oct 2023 23:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A47F80578;
	Sat, 21 Oct 2023 23:17:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F1DF80536; Sat, 21 Oct 2023 23:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC9F4F800C9
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC9F4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ApNcpD8w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697922954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmHsTYKJXE0a8HGHehYUMPc31yUvYnuo+o8I2G0HYRM=;
	b=ApNcpD8w+Xfyhjg3DY8QFJRaoelVUEjBobSvrw+wBlSMpTTxTjt1JgiWkqY2Byk1PG8daT
	YMRfcPh14VngDqBWTvBSAnF3t3RBXlTF9/ilQr3rcZ5bEBAHtCC4DReE1ufao/QtfHLfgh
	ft6f5l9bkDriIWEi9jYsIaqphaIwNpI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-pL1kRDGDNqqAZuawxxZsWA-1; Sat, 21 Oct 2023 17:15:50 -0400
X-MC-Unique: pL1kRDGDNqqAZuawxxZsWA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169BF87A9F4;
	Sat, 21 Oct 2023 21:15:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AED9492BFB;
	Sat, 21 Oct 2023 21:15:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_IN_MAP quirk
Date: Sat, 21 Oct 2023 23:15:33 +0200
Message-ID: <20231021211534.114991-6-hdegoede@redhat.com>
In-Reply-To: <20231021211534.114991-1-hdegoede@redhat.com>
References: <20231021211534.114991-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NAV5T2K53DRPHH2DOCKZXE5DCEVXVWJE
X-Message-ID-Hash: NAV5T2K53DRPHH2DOCKZXE5DCEVXVWJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAV5T2K53DRPHH2DOCKZXE5DCEVXVWJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unlike all designs supported sofar the Lenovo Yoga Tab 3 YT3-X90 does not
have its internal microphone (intmic) on IN3L with the headset microphone
on IN1L. Instead this tablet has the intmic on IN1L and the hsmic on IN2L.

Add a BYT_WM5102_IN_MAP quirk mechanism to allow selecting between
different input maps and add support for both setups with the current
settings being the default map.

The new INTMIC_IN1L_HSMIC_IN2L map is enabled by default on CHT because
the Lenovo Yoga Tab 3 YT3-X90 model is the only Cherry Trail design
currently supported. If different CHT designs turn up which need different
input maps we can add DMI quirks to select a different map later.

The userspace UCM profile also needs to know about this so
extend the components string with this info too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 60 +++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index d1664d7e6443..ee0a10256567 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -38,11 +38,16 @@ struct byt_wm5102_private {
 	int mclk_freq;
 };
 
-/* Bits 0-3 are reserved for the input-map */
+#define BYT_WM5102_IN_MAP		GENMASK(3, 0)
 #define BYT_WM5102_OUT_MAP		GENMASK(7, 4)
 #define BYT_WM5102_SSP2			BIT(16)
 #define BYT_WM5102_MCLK_19_2MHZ		BIT(17)
 
+enum {
+	BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L,
+	BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L,
+};
+
 /* Note these values are pre-shifted for easy use of setting quirks */
 enum {
 	BYT_WM5102_SPK_SPK_MAP		= FIELD_PREP_CONST(BYT_WM5102_OUT_MAP, 0),
@@ -57,6 +62,20 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 static void log_quirks(struct device *dev)
 {
+	switch (quirk & BYT_WM5102_IN_MAP) {
+	case BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L:
+		dev_info_once(dev, "quirk INTMIC_IN3L_HSMIC_IN1L enabled\n");
+		break;
+	case BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L:
+		dev_info_once(dev, "quirk INTMIC_IN1L_HSMIC_IN2L enabled\n");
+		break;
+	default:
+		dev_warn_once(dev, "quirk sets invalid input map: 0x%lx, defaulting to INTMIC_IN3L_HSMIC_IN1L\n",
+			      quirk & BYT_WM5102_IN_MAP);
+		quirk &= ~BYT_WM5102_IN_MAP;
+		quirk |= BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L;
+		break;
+	}
 	switch (quirk & BYT_WM5102_OUT_MAP) {
 	case BYT_WM5102_SPK_SPK_MAP:
 		dev_info_once(dev, "quirk SPK_SPK_MAP enabled\n");
@@ -191,16 +210,13 @@ static const struct snd_soc_dapm_route byt_wm5102_audio_map[] = {
 	{"Headphone", NULL, "HPOUT1L"},
 	{"Headphone", NULL, "HPOUT1R"},
 
-	{"Internal Mic", NULL, "MICBIAS3"},
-	{"IN3L", NULL, "Internal Mic"},
-
 	/*
 	 * The Headset Mix uses MICBIAS1 or 2 depending on if a CTIA/OMTP Headset
 	 * is connected, as the MICBIAS is applied after the CTIA/OMTP cross-switch.
 	 */
 	{"Headset Mic", NULL, "MICBIAS1"},
 	{"Headset Mic", NULL, "MICBIAS2"},
-	{"IN1L", NULL, "Headset Mic"},
+	{"Internal Mic", NULL, "MICBIAS3"},
 };
 
 static const struct snd_soc_dapm_route bytcr_wm5102_ssp0_map[] = {
@@ -231,6 +247,16 @@ static const struct snd_soc_dapm_route byt_wm5102_spk_hpout2_map[] = {
 	{"Speaker", NULL, "HPOUT2R"},
 };
 
+static const struct snd_soc_dapm_route byt_wm5102_intmic_in3l_hsmic_in1l_map[] = {
+	{"IN3L", NULL, "Internal Mic"},
+	{"IN1L", NULL, "Headset Mic"},
+};
+
+static const struct snd_soc_dapm_route byt_wm5102_intmic_in1l_hsmic_in2l_map[] = {
+	{"IN1L", NULL, "Internal Mic"},
+	{"IN2L", NULL, "Headset Mic"},
+};
+
 static const struct snd_kcontrol_new byt_wm5102_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -271,6 +297,20 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
+	switch (quirk & BYT_WM5102_IN_MAP) {
+	case BYT_WM5102_INTMIC_IN3L_HSMIC_IN1L:
+		custom_map = byt_wm5102_intmic_in3l_hsmic_in1l_map;
+		num_routes = ARRAY_SIZE(byt_wm5102_intmic_in3l_hsmic_in1l_map);
+		break;
+	case BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L:
+		custom_map = byt_wm5102_intmic_in1l_hsmic_in2l_map;
+		num_routes = ARRAY_SIZE(byt_wm5102_intmic_in1l_hsmic_in2l_map);
+		break;
+	}
+	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	if (ret)
+		return ret;
+
 	switch (quirk & BYT_WM5102_OUT_MAP) {
 	case BYT_WM5102_SPK_SPK_MAP:
 		custom_map = byt_wm5102_spk_spk_map;
@@ -481,6 +521,8 @@ static char byt_wm5102_components[64]; /* = "cfg-spk:* cfg-int-mic:* cfg-hs-mic:
 static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 {
 	static const char * const out_map_name[] = { "spk", "hpout2" };
+	static const char * const intmic_map_name[] = { "in3l", "in1l" };
+	static const char * const hsmic_map_name[] = { "in1l", "in2l" };
 	char codec_name[SND_ACPI_I2C_ID_LEN];
 	struct device *dev = &pdev->dev;
 	struct byt_wm5102_private *priv;
@@ -541,9 +583,10 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 		/*
 		 * CHT always uses SSP2 and 19.2 MHz; and
 		 * the one currently supported CHT design uses HPOUT2 as
-		 * speaker output.
+		 * speaker output and has the intmic on IN1L + hsmic on IN2L.
 		 */
 		quirk = BYT_WM5102_SSP2 | BYT_WM5102_MCLK_19_2MHZ |
+			BYT_WM5102_INTMIC_IN1L_HSMIC_IN2L |
 			BYT_WM5102_SPK_HPOUT2_MAP;
 	}
 	if (quirk_override != -1) {
@@ -554,7 +597,10 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	log_quirks(dev);
 
 	snprintf(byt_wm5102_components, sizeof(byt_wm5102_components),
-		 "cfg-spk:%s", out_map_name[FIELD_GET(BYT_WM5102_OUT_MAP, quirk)]);
+		 "cfg-spk:%s cfg-intmic:%s cfg-hsmic:%s",
+		 out_map_name[FIELD_GET(BYT_WM5102_OUT_MAP, quirk)],
+		 intmic_map_name[FIELD_GET(BYT_WM5102_IN_MAP, quirk)],
+		 hsmic_map_name[FIELD_GET(BYT_WM5102_IN_MAP, quirk)]);
 	byt_wm5102_card.components = byt_wm5102_components;
 
 	/* find index of codec dai */
-- 
2.41.0

