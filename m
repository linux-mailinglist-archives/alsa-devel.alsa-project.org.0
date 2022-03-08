Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1744D2181
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB0218B8;
	Tue,  8 Mar 2022 20:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB0218B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767864;
	bh=uWItZkRqqviTpQrMpMtzGGHDPLKSKI2z3JIUMcQxR18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PadcP8IcQQme4FQd/y9KtrU19hi4+zrUaOftX6VI5NFLGUG7+jhHgLLDm1bfjnZxk
	 5MNmE+6QK2IvHZrvNVduJb6raDiTh4EeEuqZ/Y5uMFjwgm+XTw9UdOLXu2FtebV3Wu
	 HVCivuJbrFgE6O+xv7zNIOnQ7vISBSva2yJ6Y53Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FAE1F80558;
	Tue,  8 Mar 2022 20:27:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED929F80519; Tue,  8 Mar 2022 20:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5EEDF8051B
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5EEDF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NFWg5JZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767610; x=1678303610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uWItZkRqqviTpQrMpMtzGGHDPLKSKI2z3JIUMcQxR18=;
 b=NFWg5JZ91nJNbFgrwK6RA52tHzrEsO5hTHpxHxtF8EGgbgLq+McWhOwy
 809EmF1hCOnihSzZFVAp+KLas5nTA68NCt6pp7AyeZEGM79/BO8JSNCbU
 rL5YvD/NrfbGIDhOZPJ/1AfokxhWgTnBauHKA6tbprcCJYd//VmwgY4Ta
 Uf5NuxweDtTlWTrzNLFeRoOk3JV3xtajBlWdD7deFd116vBELIBURo70t
 KHr0FgB4L9l6aaOL8BDkeAUd8ycFPrjsJJjIi2xyDkT7fnGpyYylszjIe
 LeHjp1toQHxYp26W/K7z9syLviISXp/TAQ+8/4d3nbxLsblmwc1KCk7Bp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363722"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363722"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573973"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/20] ASoC: Intel: sof_es8336: get codec device with ACPI
 instead of bus search
Date: Tue,  8 Mar 2022 13:26:02 -0600
Message-Id: <20220308192610.392950-13-pierre-louis.bossart@linux.intel.com>
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

We have an existing 'adev' handle from which we can find the codec
device, no need for an I2C bus search.

This change aligns this driver will all other I2S-based machine
drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index eb792bd911fa..bb4a3491d71c 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -515,9 +515,10 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		return ret;
 
 	/* get speaker enable GPIO */
-	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, codec_name);
+	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
+	priv->codec_dev = get_device(codec_dev);
 
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, gpio_mapping);
 	if (ret)
@@ -530,7 +531,6 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	priv->codec_dev = codec_dev;
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
 
 	snd_soc_card_set_drvdata(card, priv);
-- 
2.30.2

