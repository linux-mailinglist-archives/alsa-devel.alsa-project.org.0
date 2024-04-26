Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C688B3BCB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828DC219F;
	Fri, 26 Apr 2024 17:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828DC219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714146066;
	bh=UQPrNln96b4xHk91nmowdoB7FfPTrZkZDGSoZjVsfKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e8cKzo4ep+5r69nhENxYemYsWpgjDiZSRCcoqye4ie9oOuOzD+Il7vVIRQ1uhGGnD
	 MXVg2iX8io2PpLKwjYTj2erZ5gbJ1M/ScaELbHuUydMZZb3Bp7irDrLOB0tl4gXrLA
	 6qXkpqsOTDlO3mSMfP1pYuysgVcnLhdpuKlvviSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98570F80654; Fri, 26 Apr 2024 17:39:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 727F0F8063E;
	Fri, 26 Apr 2024 17:39:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC6D6F805CB; Fri, 26 Apr 2024 17:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23171F80423
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23171F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TPC6jo4O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145959; x=1745681959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQPrNln96b4xHk91nmowdoB7FfPTrZkZDGSoZjVsfKg=;
  b=TPC6jo4OPyWsjqva2xFmorGVDKvT6ymvwBBwkNUX7MUbRzhJlOwUqlcQ
   KqZrYYzEH8K2qmZOjp26zST6Fkfo40OFfq1/RIslh4QuF5wIkPkWBBqLg
   f2jVLH5XoZGhVsj5l404sRIPnW5p4jbBqdJ/nVSC+muE3mW7KNQfpEWMW
   LQkURJsIlMkhheTx/AbiHZRkl9xLfzv0SG7FziH6UjaJLguyFHhg62OUj
   CNNDg/zWsO34+HRcZY9t0fx4KcrBJb9uXGoQjxlQp/cNV9pHNb3CjFNso
   05z0gC5cZtm+P9T9z2y725Lf+nb1FCspEzDcUmDjwNhIKa0dwufukP0TO
   A==;
X-CSE-ConnectionGUID: tEgQSnmXRwOpATGBsWGiLA==
X-CSE-MsgGUID: wks/0IMqSIi/zu8Lz2Le5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718447"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: 9njKNL6uTtKogg1KL4lPsQ==
X-CSE-MsgGUID: 6PJtELB4S26GsJ9+ow8Qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623542"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/5] ASoC: SOF: Intel: hda: list SoundWire peripherals on
 mismatch
Date: Fri, 26 Apr 2024 10:39:01 -0500
Message-Id: <20240426153902.39560-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GFXH32W56VH6LFZYPK7Q4SRGMT42FBDK
X-Message-ID-Hash: GFXH32W56VH6LFZYPK7Q4SRGMT42FBDK
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFXH32W56VH6LFZYPK7Q4SRGMT42FBDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Most of the SoundWire support issues come from bad ACPI information,
or configuration reported by ACPI that are not supported by the SOF
driver/topology. The users see a "No SoundWire machine driver found"
message without any details, and the fallback to HDaudio w/ HDMI is
used.

We can reduce our support load with a clear dev_info() log that will
give us a clear hint on the mismatch and why a machine driver/topology
were not found.

Example log on a MTL device:
[   13.158599] sof-audio-pci-intel-mtl 0000:00:1f.3: No SoundWire machine driver found for the ACPI-reported configuration:
[   13.158603] sof-audio-pci-intel-mtl 0000:00:1f.3: link 0 mfg_id 0x025d part_id 0x0713 version 0x3
[   13.158606] sof-audio-pci-intel-mtl 0000:00:1f.3: link 1 mfg_id 0x025d part_id 0x1316 version 0x3
[   13.158608] sof-audio-pci-intel-mtl 0000:00:1f.3: link 2 mfg_id 0x025d part_id 0x1316 version 0x3

In parallel, we will also provide an update to `alsa-info` to log all
SoundWire peripherals found in ACPI tables.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8ddc1b0ca3c9..8ac8c10b83bd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1645,6 +1645,7 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct snd_soc_acpi_link_adr *link;
+	struct sdw_extended_slave_id *ids;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
 	u32 link_mask;
@@ -1658,6 +1659,16 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		return NULL;
 	}
 
+	if (!hdev->sdw) {
+		dev_dbg(sdev->dev, "SoundWire context not allocated\n");
+		return NULL;
+	}
+
+	if (!hdev->sdw->num_slaves) {
+		dev_warn(sdev->dev, "No SoundWire peripheral detected in ACPI tables\n");
+		return NULL;
+	}
+
 	/*
 	 * Select SoundWire machine driver if needed using the
 	 * alternate tables. This case deals with SoundWire-only
@@ -1740,7 +1751,11 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 		return mach;
 	}
 
-	dev_info(sdev->dev, "No SoundWire machine driver found\n");
+	dev_info(sdev->dev, "No SoundWire machine driver found for the ACPI-reported configuration:\n");
+	ids = hdev->sdw->ids;
+	for (i = 0; i < hdev->sdw->num_slaves; i++)
+		dev_info(sdev->dev, "link %d mfg_id 0x%04x part_id 0x%04x version %#x\n",
+			 ids[i].link_id, ids[i].id.mfg_id, ids[i].id.part_id, ids[i].id.sdw_version);
 
 	return NULL;
 }
-- 
2.40.1

