Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05693EB778
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 17:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD4E189B;
	Fri, 13 Aug 2021 17:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD4E189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628867638;
	bh=37Oqj2pLC9unks56W7cl8VkW24DQPb51AT5K+psWob4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IE8KrQzRy9maypPaenfPm4xxX0hopPsWd5wtNBRlkfnEtt35wEAi/VBaYyMKz0KHz
	 Bf7NeTKGyQ5bGpbkipuHqmDlGrbLhHWQXNbsZw67oThUDuNSxMSj5l63I4lMiTjN7h
	 71NwOzzPEuVd/k/YSRf1a0Oo7JFsYxB3QKXpgMWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B6DF8020D;
	Fri, 13 Aug 2021 17:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 363D5F804E1; Fri, 13 Aug 2021 17:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A53F802D2
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 17:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A53F802D2
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215301877"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="215301877"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:11:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="422888860"
Received: from mchatter-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 08:11:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/8] ASoC: Intel: boards: handle errors with
 acpi_dev_get_first_match_dev()
Date: Fri, 13 Aug 2021 10:11:10 -0500
Message-Id: <20210813151116.23931-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
References: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
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

acpi_dev_get_first_match_dev() searches for an acpi_handle
instantiated by the ACPI table scanning done early during boot.

Two of three machine drivers using this search don't deal with errors
and the one which does (bytcr_rt5651) returns -ENODEV, which doesn't
make sense here: an alternate driver will not be probed.

Add consistent error handling and report -ENXIO.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 3 +++
 sound/soc/intel/boards/bytcr_rt5640.c  | 3 +++
 sound/soc/intel/boards/bytcr_rt5651.c  | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 893dd74adb94..3224ab7faaa3 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -492,6 +492,9 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
 		byt_cht_es8316_dais[dai_index].codecs->name = codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENXIO;
 	}
 
 	/* override plaform name, if required */
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index b25ca99d9855..65c37b037a97 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1394,6 +1394,9 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
 		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
+	} else {
+		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENXIO;
 	}
 
 	/*
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 7033c07f8fd6..b4307d1d5527 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -921,7 +921,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_dais[dai_index].codecs->name = byt_rt5651_codec_name;
 	} else {
 		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
-		return -ENODEV;
+		return -ENXIO;
 	}
 
 	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
-- 
2.25.1

