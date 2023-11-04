Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2437E0FE6
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Nov 2023 15:27:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063F6DED;
	Sat,  4 Nov 2023 15:26:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063F6DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699108051;
	bh=A6QLdzKlDqJ529pEFiBEV3qoCpU6rfwIHVJoIwdelg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XuANY58f1BG91kjMVLEL125XHOoF9FpL5m38qmEsVECcY53X6DxUFhee6AM7lUYEy
	 YWK/K02Y3FneWUtcNwFCwlWd81mjNu2RfubbBHHXPl7pNl7aPNuCzEjlyViBvzzitX
	 ot2pLmy3F2OUA9LUHX8vlPMppY8bZ4vTspLpiCS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEBE5F805AC; Sat,  4 Nov 2023 15:25:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1381EF805A9;
	Sat,  4 Nov 2023 15:25:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C7E1F80579; Sat,  4 Nov 2023 15:25:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43CBDF80425
	for <alsa-devel@alsa-project.org>; Sat,  4 Nov 2023 15:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CBDF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HOoMQSjp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699107893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPdUGB+6KgX+P+fCWntbspetyUcQnoq8BlftZyb4d00=;
	b=HOoMQSjpH2qjNex3mk9jewCVTepAxnzvv2cjeDKkww5y7uO4LJBKOHmMbt9k5jaw+tqtkE
	JNxrSfHPooaz+MocSgSxDVOCye9U4TEzbOPwygMVKe+VjFsUl0hB8kUP84VSyZ2S5Y34Sd
	xomP8Gev8gPMdFFFdWk88ZFS9uO4xC8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-12-Lg0m9ocmMh-Mj2rbplD2ew-1; Sat,
 04 Nov 2023 10:24:50 -0400
X-MC-Unique: Lg0m9ocmMh-Mj2rbplD2ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76F481C0515D;
	Sat,  4 Nov 2023 14:24:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44BE525C0;
	Sat,  4 Nov 2023 14:24:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing with
 codec-dev ACPI DSM
Date: Sat,  4 Nov 2023 15:24:39 +0100
Message-ID: <20231104142439.21983-5-hdegoede@redhat.com>
In-Reply-To: <20231104142439.21983-1-hdegoede@redhat.com>
References: <20231104142439.21983-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BKCVHL233GCIZH2JB2S5KTZAMTK53KTG
X-Message-ID-Hash: BKCVHL233GCIZH2JB2S5KTZAMTK53KTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKCVHL233GCIZH2JB2S5KTZAMTK53KTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for querying the same ACPI Device-Specific-Method (DSM) as
Windows uses to determine things like speaker and mic routing.

This avoids the need to add DMI quirks for each new ESS8316 tablet model.

This has been tested on the following devices:

1. Chuwi Hi12 CHT with stereo speakers and IN2-mic-map,
   this avoids the need to add a DMI quirk for this model.

2. Nanote UMPC-01 CHT with stereo speakers and IN1-mic-map,
   the existing DMI quirk is still necessary because of a bug
   in the DSM return values for the speakers (it returns mono).

3. Onda V80 plus CHT with mono speaker and IN1-mic-map,
   DSM set quirks match the previously used defaults.

4. GP-electronic T701 BYT with mono speaker and IN2-mic-map,
   DSM set quirks match the previously used defaults.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 1cdb1ae31a93..5ca3d41112dc 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -462,6 +462,66 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
 	{}
 };
 
+static int byt_cht_es8316_get_quirks_from_dsm(struct byt_cht_es8316_private *priv,
+					      bool is_bytcr)
+{
+	int ret, val1, val2, dsm_quirk = 0;
+
+	if (is_bytcr)
+		dsm_quirk |= BYT_CHT_ES8316_SSP0;
+
+	ret = es83xx_dsm(priv->codec_dev, PLATFORM_MAINMIC_TYPE_ARG, &val1);
+	if (ret < 0)
+		return ret;
+
+	ret = es83xx_dsm(priv->codec_dev, PLATFORM_HPMIC_TYPE_ARG, &val2);
+	if (ret < 0)
+		return ret;
+
+	if (val1 == PLATFORM_MIC_AMIC_LIN1RIN1 && val2 == PLATFORM_MIC_AMIC_LIN2RIN2) {
+		dsm_quirk |= BYT_CHT_ES8316_INTMIC_IN1_MAP;
+	} else if (val1 == PLATFORM_MIC_AMIC_LIN2RIN2 && val2 == PLATFORM_MIC_AMIC_LIN1RIN1) {
+		dsm_quirk |= BYT_CHT_ES8316_INTMIC_IN2_MAP;
+	} else {
+		dev_warn(priv->codec_dev, "Unknown mic settings mainmic 0x%02x hpmic 0x%02x\n",
+			 val1, val2);
+		return -EINVAL;
+	}
+
+	ret = es83xx_dsm(priv->codec_dev, PLATFORM_SPK_TYPE_ARG, &val1);
+	if (ret < 0)
+		return ret;
+
+	switch (val1) {
+	case PLATFORM_SPK_MONO:
+		dsm_quirk |= BYT_CHT_ES8316_MONO_SPEAKER;
+		break;
+	case PLATFORM_SPK_STEREO:
+		break;
+	default:
+		dev_warn(priv->codec_dev, "Unknown speaker setting 0x%02x\n", val1);
+		return -EINVAL;
+	}
+
+	ret = es83xx_dsm(priv->codec_dev, PLATFORM_HPDET_INV_ARG, &val1);
+	if (ret < 0)
+		return ret;
+
+	switch (val1) {
+	case PLATFORM_HPDET_NORMAL:
+		break;
+	case PLATFORM_HPDET_INVERTED:
+		dsm_quirk |= BYT_CHT_ES8316_JD_INVERTED;
+		break;
+	default:
+		dev_warn(priv->codec_dev, "Unknown hpdet-inv setting 0x%02x\n", val1);
+		return -EINVAL;
+	}
+
+	quirk = dsm_quirk;
+	return 0;
+}
+
 static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -528,6 +588,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	dmi_id = dmi_first_match(byt_cht_es8316_quirk_table);
 	if (dmi_id) {
 		quirk = (unsigned long)dmi_id->driver_data;
+	} else if (!byt_cht_es8316_get_quirks_from_dsm(priv, is_bytcr)) {
+		dev_info(dev, "Using ACPI DSM info for quirks\n");
 	} else if (is_bytcr) {
 		/* On BYTCR default to SSP0, internal-mic-in2-map, mono-spk */
 		quirk = BYT_CHT_ES8316_SSP0 | BYT_CHT_ES8316_INTMIC_IN2_MAP |
-- 
2.41.0

