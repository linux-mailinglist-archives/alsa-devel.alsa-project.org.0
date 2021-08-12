Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5BC3EAD5C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 00:48:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C26191C;
	Fri, 13 Aug 2021 00:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C26191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628808504;
	bh=lHT5Ti5cyDeg1++SxiRAfq9aMKWdRn6bITOnV+05ACE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXI3ebYn5JT91ocD1VQ7hLfzksaMsFUd8OKNtykuh4e6c7VutCoeqnywNe/mluj8M
	 ogbe0jPBcAYGZ9NEUthpDuPqslanVcac1Djn0x0yYysQAy5BfsOeVH+quNCLRJQ218
	 SL1XehWeljXFiwNrkr94sdAZNoj1CR3I0eJUZ+6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4DD3F804FB;
	Fri, 13 Aug 2021 00:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6925F804E4; Fri, 13 Aug 2021 00:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1053F804CF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 00:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1053F804CF
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212349754"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="212349754"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517647193"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/8] ASoC: Intel: boards: get codec device with ACPI
 instead of bus search
Date: Thu, 12 Aug 2021 17:44:38 -0500
Message-Id: <20210812224443.170144-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
References: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

We have an existing 'adev' handle from which we can find the codec
device, no need for an I2C bus search.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 4 ++--
 sound/soc/intel/boards/bytcr_rt5640.c  | 5 ++---
 sound/soc/intel/boards/bytcr_rt5651.c  | 6 ++----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 7c078a9f6deb..34bdae45da73 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -539,9 +539,10 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	}
 
 	/* get speaker enable GPIO */
-	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, codec_name);
+	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
+	priv->codec_dev = get_device(codec_dev);
 
 	if (quirk & BYT_CHT_ES8316_JD_INVERTED)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
@@ -559,7 +560,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		gpiod_get_index(codec_dev, "speaker-enable", 0,
 				/* see comment in byt_cht_es8316_resume */
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	priv->codec_dev = codec_dev;
 
 	if (IS_ERR(priv->speaker_en_gpio)) {
 		ret = PTR_ERR(priv->speaker_en_gpio);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 60ed954d7277..fbe75c77e4ca 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1475,11 +1475,10 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_quirk = quirk_override;
 	}
 
-	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, byt_rt5640_codec_name);
+	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
-
-	priv->codec_dev = codec_dev;
+	priv->codec_dev = get_device(codec_dev);
 
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5640_add_codec_device_props(codec_dev, priv);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index b4307d1d5527..c70dd729cdbb 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -924,10 +924,10 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
-					    byt_rt5651_codec_name);
+	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
+	priv->codec_dev = get_device(codec_dev);
 
 	/*
 	 * swap SSP0 if bytcr is detected
@@ -994,8 +994,6 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_quirk = quirk_override;
 	}
 
-	priv->codec_dev = codec_dev;
-
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
 	if (ret_val)
-- 
2.25.1

