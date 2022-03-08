Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CF4D218C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D80218F9;
	Tue,  8 Mar 2022 20:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D80218F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767944;
	bh=KV/8Ns2IlUyCE5aKhFXP59hsVbtria4qp0JsZ5Jlq+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8qQ/8StmRIHT1F4ODTn9uDwSOIjl/diuPfafLRlDbDWDjNJJDAcEh+8MJEvqbB2A
	 6ibKuSVNAA6eW89C7HTQObhdUUUVYjYYU3cqg8yCmUI/KZCLhk3u0ztZBWBn2FjFXs
	 4CKn/a/hQXUrgcbBmZ+PVjqJYwG+z87dE0ICL6Mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4BFF8057B;
	Tue,  8 Mar 2022 20:27:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AB6BF80520; Tue,  8 Mar 2022 20:27:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90104F8052D
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90104F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AuuLX1DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767614; x=1678303614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KV/8Ns2IlUyCE5aKhFXP59hsVbtria4qp0JsZ5Jlq+g=;
 b=AuuLX1DYkvMuMB2BXJh5xYIK6DHcsFRIEvCikRg9Hkc1Ld7p8nxpwGWg
 iMgREuPCHs950NuW7piT3yxiHkYTtZEe2wnlW1jm+SbEuRSwDJmt+odWc
 Rj1JZevErMNh56IYice2ALz6rxq9KAVd4fhu5sKFq5YX/2Af7o9PSEKuK
 +Gz3dk9jzZPzOBJIbccmCSWnx+X8mOidn91NTAr9yjYjfTWbB/3ddoE9l
 Ic5JZnVAVrA+PblczAVx6JnFoesk8wxNRo+BbkOYwjnA0uXcD6Y4ok0CF
 oilIaWKmK5oxGk/JJvPVlj8Lmd8fPb0aD7E8WGWHuUHFBhY/8cr5sYMnn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363757"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573997"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/20] ASoC: Intel: sof_es8336: extend machine driver to
 support ES8326 codec
Date: Tue,  8 Mar 2022 13:26:08 -0600
Message-Id: <20220308192610.392950-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The ES8326 requires a different codec driver than ES8316/8336, fixup
the codec name and dai name depending on the ACPI _HID exposed in the
DSDT.

Also add the select in Kconfig

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      |  3 ++-
 sound/soc/intel/boards/sof_es8336.c | 10 +++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6884ddf9edad..a62785893bec 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -530,12 +530,13 @@ config SND_SOC_INTEL_SOF_PCM512x_MACH
 	  If unsure select "N".
 
 config SND_SOC_INTEL_SOF_ES8336_MACH
-	tristate "SOF with ES8336 codec in I2S mode"
+	tristate "SOF with ES8336 or ES8326 codec in I2S mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on GPIOLIB || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_ES8316
+	select SND_SOC_ES8326
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	help
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 932a80e62bc8..32f5303041b8 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -292,7 +292,7 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-SND_SOC_DAILINK_DEF(ssp1_codec,
+SND_SOC_DAILINK_DEF(es8336_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-ESSX8336:00", "ES8316 HiFi")));
 
 static struct snd_soc_dai_link_component dmic_component[] = {
@@ -356,8 +356,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		goto devm_err;
 
 	links[id].id = id;
-	links[id].codecs = ssp1_codec;
-	links[id].num_codecs = ARRAY_SIZE(ssp1_codec);
+	links[id].codecs = es8336_codec;
+	links[id].num_codecs = ARRAY_SIZE(es8336_codec);
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_es8316_init;
@@ -539,6 +539,10 @@ static int sof_es8336_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
 		dai_links[0].codecs->name = codec_name;
+
+		/* also fixup codec dai name if relevant */
+		if (!strncmp(mach->id, "ESSX8326", SND_ACPI_I2C_ID_LEN))
+			dai_links[0].codecs->dai_name = "ES8326 HiFi";
 	} else {
 		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
 		return -ENXIO;
-- 
2.30.2

