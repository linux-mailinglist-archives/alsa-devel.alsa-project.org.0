Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B33DDB01
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 16:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4357C16F5;
	Mon,  2 Aug 2021 16:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4357C16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627914520;
	bh=+megiDUmggCFGza9KKOxY8Pp1rpmOCtX7QPVMA2UOjw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXypzeEXSGwSTqmVTH5Rdt/+vj9kmJ7WXbqRWFbKJrtuVCLEHTo7eDshdWDgLt0ns
	 dy61+4O0riLG04qN8ZMINh/k/pkcaAVV5Qub6ZETsG65iyxTMn7S0huBM0X/jxUNXR
	 DJ9rhGoQbVcTx3qoXlg9l3sd79l0c+aKx1k4huzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCBEEF80506;
	Mon,  2 Aug 2021 16:25:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3D83F804FF; Mon,  2 Aug 2021 16:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17046F804FC
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 16:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17046F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OXjN1sa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627914333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqByEjPW6DEz1KVmuc+esyOhUeFDNFdJ/N8tqP4+R/g=;
 b=OXjN1sa/BpZb/xOWxHMYVjo9/Z3GF74+VhzLwDNrpr2Rwe3F2jlbYYcqWfY0rgyb5Mq0fO
 sA8wCfDQIxK4DPLtu0a6OIOzvr3lcoWW1eExKKPUwwOSCnSXqxK4wPUGOIy1efPuZPu0R7
 G8yrm4atyUDCmuKTrzZ0g9jGIy8fGBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-FKAEAm_8OgKn_pAz7AyQnQ-1; Mon, 02 Aug 2021 10:25:29 -0400
X-MC-Unique: FKAEAm_8OgKn_pAz7AyQnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472C187D55D;
 Mon,  2 Aug 2021 14:25:28 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA4E760C82;
 Mon,  2 Aug 2021 14:25:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 5/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headset mic input
Date: Mon,  2 Aug 2021 16:25:00 +0200
Message-Id: <20210802142501.991985-6-hdegoede@redhat.com>
In-Reply-To: <20210802142501.991985-1-hdegoede@redhat.com>
References: <20210802142501.991985-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index 54302a86f8df..f67bd6caec36 100644
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
@@ -1517,10 +1529,13 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 			lineout_string = " cfg-lineout:1";
 	}
 
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

