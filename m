Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501747D00BE
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1286829;
	Thu, 19 Oct 2023 19:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1286829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737033;
	bh=tdh4KoDxxJej97u6871PjSA90yS9LrArazZhIbPZ0b4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ptle8mkeVvRMTC2Hj8udsFsN80xTF5J1VnoAiRAPZ/uWcRgc9lOEaau+8WcGKS9s1
	 Rmgjrw70Eazsw4nbyozfxbjj+LIn4I4YW8tDKxK2PgRNeCDKSHhS8zPw8RYTjQcS9Z
	 1nVm1r1m/uKIJNY1J1Gi+t7A7YpY6KyRCNQRlBW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A793F805BA; Thu, 19 Oct 2023 19:34:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9373F805B4;
	Thu, 19 Oct 2023 19:34:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A02EFF8059F; Thu, 19 Oct 2023 19:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D88C7F8024E
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88C7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hjzn+6Cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736873; x=1729272873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tdh4KoDxxJej97u6871PjSA90yS9LrArazZhIbPZ0b4=;
  b=hjzn+6CnmizL+DZwafrHa6WZHO7/j3cFYwWga9Fd1mRQw0deG8gp2U35
   UnAFSy9jAIne7sO6vcc8rHgtSJsRnz7CtdcofS5NmA3BslPEiG1ZWpS0L
   OAklsoQVHTuxf5x+v4VZXpY+mySyXTUwzK9+pOnQGNMgNaGQsC4jEHiEQ
   +lDJHSrHQWCRq4JAdIp8IEW5ZyA10Ip40qdlcQry0YhY9mqU3Buh+94HT
   J3clQvzBP9Pq3dFXffUbVQpOp6T3ynnkzi+/yitw2MLf4Vf/PStn/4K3T
   F7cheh1tLbwSLp3ZUZsue+csSGUtZwN9ikXNR82BCWzgZkAp/u+RX0cHI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884343"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090656"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090656"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Terry Cheong <htcheong@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/10] ASoC: Intel: sof_nau8825: add RPL support for MAX98360A
 amp
Date: Thu, 19 Oct 2023 12:34:06 -0500
Message-Id: <20231019173411.166759-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XSGB6HU7SUBD5LCQPI44ZVBGP3QCHGVE
X-Message-ID-Hash: XSGB6HU7SUBD5LCQPI44ZVBGP3QCHGVE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSGB6HU7SUBD5LCQPI44ZVBGP3QCHGVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Terry Cheong <htcheong@chromium.org>

Adding support back to RPL devices that lost audio after the RPL/ADL
split. The hardware configuration is:

SSP0: NAU88L25/NAU88L25YGB codec
SSP1: MAX98360A amplifier

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Terry Cheong <htcheong@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c              | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 116281262859..44f5c359ae95 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -553,6 +553,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "rpl_mx98360a_8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.name = "rpl_nau8318_8825",
 		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 19cfdcdbfdf7..5b6f57e3a583 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -407,6 +407,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98373_amp,
 		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
 	},
+	{
+		.id = "10508825",
+		.drv_name = "rpl_mx98360a_8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_max98360a_amp,
+		.sof_tplg_filename = "sof-rpl-max98360a-nau8825.tplg",
+	},
 	{
 		.id = "10508825",
 		.drv_name = "rpl_nau8318_8825",
-- 
2.39.2

