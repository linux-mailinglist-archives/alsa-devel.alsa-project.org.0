Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5188EB3D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827E32C4A;
	Wed, 27 Mar 2024 17:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827E32C4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556955;
	bh=yo1S20Nb/qbRVE550kkoA7HJaQ0Sj7F5P9mjlosdfF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FoWrNQh6ZHKK2nNtD8+mEEgCwljzCmtG+O+rMItK2fE/KfddmjddZPrShicw70CNZ
	 Ae3SIYRYAvvn9qO7pA35WR9gb3GJuX5OdLjR6eCzBaebbBh68WpIzE9JcxFMVdp4zo
	 GYHeBnMmNGZf0VfT5WO7P51QvVPE/mbe7ysv7j0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD7DF802DB; Wed, 27 Mar 2024 17:25:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5D8F808F5;
	Wed, 27 Mar 2024 17:25:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BA29F806D0; Wed, 27 Mar 2024 17:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2605F805C1
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2605F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f4IxzLog
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556684; x=1743092684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yo1S20Nb/qbRVE550kkoA7HJaQ0Sj7F5P9mjlosdfF0=;
  b=f4IxzLogPzDnEtrtFrh1Yq7MmdJanMCTDK75mRxuPUBCMyMSelpD9UT7
   vNL4VOfOMbgE6+ORVdhDMS5+tklNRCaZTqvGFCIKMOJoCWrrsxPF+cQK+
   JNo8aFFQFkdV20XH6Blw9ykT9gk6RQmAwEHr7mO4dK5lzck2eR66osODV
   FR4/Cwv55GO/mera6XYvFOal2NFmdK9wF77dCseXJD27Howhqg1/ilQCE
   LOh7qBzQTzqBcKLzwo7UfAHyyjRqkC/RkPdQrQk12O8qlV8iEfHgB2UjI
   fQBy159uFJ7V+kpRi92iY434lGjpOTirIPaKw9lq0rdLYnXw6wUF9fkV+
   A==;
X-CSE-ConnectionGUID: rY8cw3vXTjOW1Zs79EsofA==
X-CSE-MsgGUID: czcBNTcgTxatwlNiUegP5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221567"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821337"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: Intel: sof_cs42l42: board id cleanup for adl
 boards
Date: Wed, 27 Mar 2024 11:24:05 -0500
Message-Id: <20240327162408.63953-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QR5CNQ2EAICGTNLTAEWWNGHD6ZOYF52D
X-Message-ID-Hash: QR5CNQ2EAICGTNLTAEWWNGHD6ZOYF52D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QR5CNQ2EAICGTNLTAEWWNGHD6ZOYF52D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Introduce "adl_cs42l42_def" for adl boards which implement headphone
codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 2 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 40ecfeaa1d26..8a2833a0e3c5 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -263,7 +263,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_AMP(1)),
 	},
 	{
-		.name = "adl_mx98360a_cs4242",
+		.name = "adl_cs42l42_def",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 9ac9310dd2be..7977a6fb9a5c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -497,7 +497,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10134242",
-		.drv_name = "adl_mx98360a_cs4242",
+		.drv_name = "adl_cs42l42_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
-- 
2.40.1

