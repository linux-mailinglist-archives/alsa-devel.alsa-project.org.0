Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AF4D217A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B5118AF;
	Tue,  8 Mar 2022 20:29:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B5118AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767800;
	bh=vDyiMC0goHPX1CvjQLSs/6fdaolU354xTVnxXUU0E9A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvFFNhN5CyC0IQAgiqSsyFUTi1a8laVH/pxao4O7CqjPAv2cZ0YHbpCGaUypRG3hE
	 xX3eLb23xQ3cUMW6NzSf1qp3yIClaNeryJZK2CNou6XICpTTXyNRRWvcctD3Z4DDfx
	 bZcs1P4FJlYg0YrHcOiqbjx19r7N3rN5ZxOlTXZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A28C1F80544;
	Tue,  8 Mar 2022 20:27:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF286F80272; Tue,  8 Mar 2022 20:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8769DF800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8769DF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kMMeNWBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767606; x=1678303606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDyiMC0goHPX1CvjQLSs/6fdaolU354xTVnxXUU0E9A=;
 b=kMMeNWBUclWHzLg1b63wI2geeTN3er6GVHToNul2KkmPfRtATC+X1EZB
 uqXLHvyU8bCtrpq9RT2pf3RC3umtP84Wt2uoJWCkNddo4r2jxE9fHPu0A
 0MGTTo+t9rGD5KDkuv1k8fP3RTwzv4ka01OGQklBclWETAlIprwvU6/Gl
 kcYuxmpyyisqa40keUZuVqqEgZ8rmRd5YfRoTJaLnbp4GB/qeqBYHZ8cD
 NbBCH+rWSlzIt2BgE1XaftIrwncQPPfjQE8qQucbSnzgzpzXRrHnELyow
 4/GNCZHkcOnDrJPbhEC13/WO94ooqTZwNLpQUtrRe0Ff5DcYCOnKQMpSC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363686"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363686"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573947"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/20] ASoC: SOF: Intel: hda: report SSP link mask to machine
 driver
Date: Tue,  8 Mar 2022 13:25:55 -0600
Message-Id: <20220308192610.392950-6-pierre-louis.bossart@linux.intel.com>
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

For devices designed for Windows, the SSP information should be listed
in the NHLT, and when present can be used to set quirks automatically
in the machine driver.

The NHLT information exposes BT and analog audio connections
separately, for now we are only interested in the analog audio parts.

The use of dev_info() for the SSP mask is intentional so that we can
immediately flag devices with an ES8336 codec. Since NHLT is not used
for recent Chromebooks these messages should be rare.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 711d14a821bb..eebb3b318d79 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -669,6 +669,25 @@ static int check_dmic_num(struct snd_sof_dev *sdev)
 	return dmic_num;
 }
 
+static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
+{
+	struct nhlt_acpi_table *nhlt;
+	int ssp_mask = 0;
+
+	nhlt = intel_nhlt_init(sdev->dev);
+	if (!nhlt)
+		return ssp_mask;
+
+	if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_SSP)) {
+		ssp_mask = intel_nhlt_ssp_endpoint_mask(nhlt, NHLT_DEVICE_I2S);
+		if (ssp_mask)
+			dev_info(sdev->dev, "NHLT_DEVICE_I2S detected, ssp_mask %#x\n", ssp_mask);
+	}
+	intel_nhlt_free(nhlt);
+
+	return ssp_mask;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
@@ -1391,6 +1410,9 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
 		}
+
+		/* report SSP link mask to machine driver */
+		mach->mach_params.i2s_link_mask = check_nhlt_ssp_mask(sdev);
 	}
 
 	/*
-- 
2.30.2

