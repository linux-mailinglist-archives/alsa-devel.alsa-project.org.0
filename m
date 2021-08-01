Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF03DCDDF
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC92C179A;
	Sun,  1 Aug 2021 23:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC92C179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627852111;
	bh=qlim0z/ks8sMFgBwgRg1vuM8Z+HUSpF1XQTbZzxKUuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKJIji1XfO1O9YyZt51QuZn6+kKpJ2pOiCeh174vM0+YHSOTTJPhCSESOqpLXZDqT
	 bEfJxzYWDW+11E0HGX0rMUNNKWotUQjSvz3KcYVT9TnHT6kaLZy7XljsziazVb3c5y
	 eKfDdp9XgmVWdDOneIIXn9+Y4cwWHNMQxqwQ+xQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCDEF80511;
	Sun,  1 Aug 2021 23:05:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574A7F8050F; Sun,  1 Aug 2021 23:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9954F804FD
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9954F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SUIHqWmX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1p8ek8Mv5bmjZQVgIKvZ48Fo/zhk1QEgZ1h1aTgjX1Q=;
 b=SUIHqWmX4KFBM1W5qWSfGjMr0sPgV0oSbANU1z6mm+cEZHcFqGvvNR0DHG6kteGngCJ/6t
 UxJn26p8Ne+dyNv5mMee1fzXOXx7vqMUIhm/xgk3d1P1Amu+WD/gnKUxNo4dmLDri9nrLR
 e1TkTUVyRoKDm7qF87mhPlHUzQEqtTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-ecoO_3qHNsaJDV7-k3PRtg-1; Sun, 01 Aug 2021 17:04:46 -0400
X-MC-Unique: ecoO_3qHNsaJDV7-k3PRtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 486E83482F;
 Sun,  1 Aug 2021 21:04:45 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA2160C5A;
 Sun,  1 Aug 2021 21:04:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headset mic input
Date: Sun,  1 Aug 2021 23:04:30 +0200
Message-Id: <20210801210431.161775-6-hdegoede@redhat.com>
In-Reply-To: <20210801210431.161775-1-hdegoede@redhat.com>
References: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some devices (HP Elitepad 1000 G2) have 2 headset jacks (1 on the dock,
2nd on the tablet itself). The 2nd headset mic input on these is
connected to in1 (the internal mics on the HP Elitepad 1000 G2 use DMIC2).

Add support for this through a new BYT_RT5640_HSMIC2_ON_IN1 quirk.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 51fb44ad9b4b..7bf848a07553 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -75,6 +75,7 @@ enum {
 #define BYT_RT5640_NO_SPEAKERS		BIT(24)
 #define BYT_RT5640_LINEOUT		BIT(25)
 #define BYT_RT5640_LINEOUT_AS_HP2	BIT(26)
+#define BYT_RT5640_HSMIC2_ON_IN1	BIT(27)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -127,6 +128,8 @@ static void log_quirks(struct device *dev)
 		dev_err(dev, "quirk map 0x%x is not supported, microphone input will not work\n", map);
 		break;
 	}
+	if (byt_rt5640_quirk & BYT_RT5640_HSMIC2_ON_IN1)
+		dev_info(dev, "quirk HSMIC2_ON_IN1 enabled\n");
 	if (BYT_RT5640_JDSRC(byt_rt5640_quirk)) {
 		dev_info(dev, "quirk realtek,jack-detect-source %ld\n",
 			 BYT_RT5640_JDSRC(byt_rt5640_quirk));
@@ -1072,6 +1075,14 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
+	if (byt_rt5640_quirk & BYT_RT5640_HSMIC2_ON_IN1) {
+		ret = snd_soc_dapm_add_routes(&card->dapm,
+					byt_rt5640_intmic_in1_map,
+					ARRAY_SIZE(byt_rt5640_intmic_in1_map));
+		if (ret)
+			return ret;
+	}
+
 	if (byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) {
 		ret = snd_soc_dapm_add_routes(&card->dapm,
 					byt_rt5640_ssp2_aif2_map,
@@ -1347,6 +1358,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3", "none" };
 	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
+	const char *headset2_string = "";
 	const char *lineout_string = "";
 	struct byt_rt5640_private *priv;
 	struct snd_soc_acpi_mach *mach;
@@ -1515,10 +1527,13 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	else if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
 		lineout_string = " cfg-lineout:1";
 
+	if (byt_rt5640_quirk & BYT_RT5640_HSMIC2_ON_IN1)
+		headset2_string = " cfg-hs2:in1";
+
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-		 "cfg-spk:%d cfg-mic:%s aif:%d%s", cfg_spk,
+		 "cfg-spk:%d cfg-mic:%s aif:%d%s%s", cfg_spk,
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif,
-		 lineout_string);
+		 lineout_string, headset2_string);
 	byt_rt5640_card.components = byt_rt5640_components;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
-- 
2.31.1

