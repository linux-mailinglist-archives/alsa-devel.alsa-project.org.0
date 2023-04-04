Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E76D5BC9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D57B820;
	Tue,  4 Apr 2023 11:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D57B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600266;
	bh=/X1Fi5qjJ3G6ib3WKl8VFpWGSiFIVJMbwl5VALOKjSw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VwuSs8oBVbeA2YOME//psof0Dlt3uztRqY4PReYPGotNu0ne74eJpKm5Nqr+85mnd
	 /F0bY6fU4WDGmQ0WMiN7Nko+oIVKLTB9FR4fwRUjwj9BMbL+wnQhCdQnH6egTztJHd
	 sE0uLlWITWE8yXoE4odWXBRpyKzNpeZaSA8bFIYc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFBDF8057E;
	Tue,  4 Apr 2023 11:21:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C320FF80557; Tue,  4 Apr 2023 11:21:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82F56F80544
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F56F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ONCpXVpN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600073; x=1712136073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/X1Fi5qjJ3G6ib3WKl8VFpWGSiFIVJMbwl5VALOKjSw=;
  b=ONCpXVpNLmXDf9PwaijVcxbSRx2F8SYyy9q+xZnmX0c/JJt1U9nHed59
   u+AGlYvn6GWSLwiSOYRU/d7sBb44796LE6TMZWT303rh8v4bmRkI/31RW
   fh67CzHUCG4j7Md7TWj1mF/mSc7jhf/QSy2U70Zg1kWq405N8pFgEy9KU
   B89CSDVKF3VuT+Ixc/HOP1TccPPwf4L9+mPlt+q2oMkYVRMdkZSnBpMWY
   iog5S4X09sCmQT790pw3UOR56HlOSAZg0klF99SnkMniYcS/BrgB8xE58
   +KaroXvwDVyhv/F02ItnNnmCrbcVI/Mj9b+2MITaKYSWJFNMa9ObZeOD8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620708"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620708"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820173"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820173"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:08 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 12/12] ASoC: SOF: Intel: pci-tgl: Allow DSPless mode
Date: Tue,  4 Apr 2023 12:21:15 +0300
Message-Id: <20230404092115.27949-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EYHHMILFVRUXGYSCDVPIYLZGU2RVV76L
X-Message-ID-Hash: EYHHMILFVRUXGYSCDVPIYLZGU2RVV76L
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYHHMILFVRUXGYSCDVPIYLZGU2RVV76L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

set the dspless_mode_supported flag to true for tgl/adl family to allow
DSPless mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 22e769e0831d..ca37ff1bbd2a 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -30,6 +30,7 @@ static const struct sof_dev_desc tgl_desc = {
 	.chip_info = &tgl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/tgl",
@@ -62,6 +63,7 @@ static const struct sof_dev_desc tglh_desc = {
 	.chip_info = &tglh_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/tgl-h",
@@ -93,6 +95,7 @@ static const struct sof_dev_desc ehl_desc = {
 	.chip_info = &ehl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/ehl",
@@ -125,6 +128,7 @@ static const struct sof_dev_desc adls_desc = {
 	.chip_info = &adls_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/adl-s",
@@ -157,6 +161,7 @@ static const struct sof_dev_desc adl_desc = {
 	.chip_info = &tgl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/adl",
@@ -189,6 +194,7 @@ static const struct sof_dev_desc adl_n_desc = {
 	.chip_info = &tgl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/adl-n",
@@ -221,6 +227,7 @@ static const struct sof_dev_desc rpls_desc = {
 	.chip_info = &adls_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/rpl-s",
@@ -253,6 +260,7 @@ static const struct sof_dev_desc rpl_desc = {
 	.chip_info = &tgl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/rpl",
-- 
2.40.0

