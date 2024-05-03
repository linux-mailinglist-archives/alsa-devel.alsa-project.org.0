Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549138BADC3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBDBBB6A;
	Fri,  3 May 2024 15:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBDBBB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714743261;
	bh=JCpC4jGCK6QJrTZBRMOqATgz35wNaz+JCvtUF81DMiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h2GNA/xtDCvKVlelJLfbDXHv2p6N1fLt5+TWIWEUv2e69J6BBWANhzeZNzLyyyXM3
	 twBScf5jWec6UsmA+i1gbydYh3S6zohabk2k2GULKwjahe4ozuauRoHgBLBRc31lJX
	 8FXMWXu6qDLCfsDBTsC3sleLpzX3iA2wzTnn1xy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F784F805C7; Fri,  3 May 2024 15:33:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26BF7F805CB;
	Fri,  3 May 2024 15:33:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 945CDF805AF; Fri,  3 May 2024 15:33:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB5EAF8025D
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5EAF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T9M3jOoc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743199; x=1746279199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JCpC4jGCK6QJrTZBRMOqATgz35wNaz+JCvtUF81DMiQ=;
  b=T9M3jOocnOgigvgAhIlKUKXh9Wfka/0h1p4T7FRp9ytb/Vw0Y5/TA8X8
   P2qJjHV9cghio1whNI/i4oWERxQlA08jps59V7nGs/dSN76j2GXm2tMJh
   9p0XYa10UFEAMVPiqJvio9XknzNjNu4uPtkrJA1Z5N5KdJvJIoSay1qip
   rW77VXE8RjEEa1jppZI9avEi50qrhJ6v6b2x/UtIygK/2fsk2+IaVkXKh
   Wv/Kcl4mTDJJje56AKd/U2D8axtT8HEmrS6LaG2Wu0f9fGaH4sBvMDc3f
   eIUSFOwbOz5ZMAwMe08T0MpENhmDXblsloRZIO4K1gZ1Z7zIz/5lNdVQu
   g==;
X-CSE-ConnectionGUID: zfD4nQJAQsyO4CTHd4Wtyg==
X-CSE-MsgGUID: vGjYJdnlR7eOrsOR4YnK+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499108"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="13499108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:07 -0700
X-CSE-ConnectionGUID: f9ghJ8ANQHSIwIACEiFdjg==
X-CSE-MsgGUID: JftdetwhSZGPnUZcXmaijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27501214"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/3] ASoC: SOF: Intel: discard SoundWire configuration if
 HDaudio codec is reported
Date: Fri,  3 May 2024 08:32:51 -0500
Message-Id: <20240503133253.108201-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AHPC63UH3CJ6YWERDMCX3PFOXPML7URX
X-Message-ID-Hash: AHPC63UH3CJ6YWERDMCX3PFOXPML7URX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHPC63UH3CJ6YWERDMCX3PFOXPML7URX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The machine driver and topology selection starts with I2S, then
SoundWire and last uses HDaudio as a fallback. That assumes that the
ACPI information is correct but there are of course exceptions to the
rule.

On a Lenovo platform, an external HDaudio codec is detected, but the
ACPI tables expose TWO RT711 jack codecs. This patch skips the
SoundWire selection in case an external HDaudio codec is detected -
which only works with the additional assumption that no one will mix
HDaudio and SoundWire.

Closes: https://github.com/thesofproject/linux/issues/4962
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 9 +++++++--
 sound/soc/sof/intel/hda.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8ac8c10b83bd..d4f039ed4ad4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1809,6 +1809,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach = NULL;
 	enum snd_soc_acpi_intel_codec codec_type;
 	const char *tplg_filename;
@@ -1981,8 +1982,12 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		}
 	}
 
-	/* If I2S fails, try SoundWire if it is supported */
-	if (!mach && (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+	/*
+	 * If I2S fails and no external HDaudio codec is detected,
+	 * try SoundWire if it is supported
+	 */
+	if (!mach && !HDA_EXT_CODEC(bus->codec_mask) &&
+	    (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		mach = hda_sdw_machine_select(sdev);
 
 	/*
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7804c5b50c26..8b495264f23d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -454,6 +454,8 @@
 #define SSP_SET_SFRM_CONSUMER	BIT(24)
 #define SSP_SET_CBP_CFP		(SSP_SET_SCLK_CONSUMER | SSP_SET_SFRM_CONSUMER)
 
+#define HDA_EXT_ADDR		0
+#define HDA_EXT_CODEC(x) ((x) & BIT(HDA_EXT_ADDR))
 #define HDA_IDISP_ADDR		2
 #define HDA_IDISP_CODEC(x) ((x) & BIT(HDA_IDISP_ADDR))
 
-- 
2.40.1

