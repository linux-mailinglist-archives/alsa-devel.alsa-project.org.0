Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B46D5BCA
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6C11FB;
	Tue,  4 Apr 2023 11:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6C11FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600276;
	bh=grYn2ReBpBOCknBZ+84eS2ftxAl1jzdAbXWoKgwPM2o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uTVW2c6RSHpX8OCjJnENDkQlZlADLu7EQtzK7keznONhPKgZ+PRfVN3VewJhZituS
	 m+QXvYHS71KHso8uipK04bUxw/0/VeUtiIV5O1sOGvl2Z4Ilmv8L9ZGVJeOmCW/Osa
	 HJ4QZHbCCoYtpx/XIk5tAkfo0Dc4uJKxmrofXdB0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86927F8028B;
	Tue,  4 Apr 2023 11:22:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C72F8028B; Tue,  4 Apr 2023 11:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3166F80423
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3166F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BKec5j3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600060; x=1712136060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=grYn2ReBpBOCknBZ+84eS2ftxAl1jzdAbXWoKgwPM2o=;
  b=BKec5j3DFjAguqqDgtI4ffWqjyzBnbYEB2qgMnY+rXBupZcnwsPr9TVQ
   kgYBW1JJHmtXpHsGDnOoorYebT3/JVQfTSRKgPpSjD1HDu4e0LNQSSBCw
   9ZtukfW7pIq4UX5GYrfP0j+qgTST5kGJxYXalfqEusaM+dFqOwjsJIzAV
   OAopYxU41avBx88lSqTHNiwPye3YFvpnxlqkXJ70DEavpIVFDQ9iVU+Vs
   ZnRMTbP2brOEJwLMK5uatkux6Pb0c9PtWrtHVj6MtqLK6FJY5SysXvi67
   o1oI0DgVjV5SHSRK9J5VIa7qvcx8yrNcHyyln2GRMUjw+Btv6fNsBfXjH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620607"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620607"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820060"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820060"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/12] ASoC: SOF: Intel: pci-apl: Allow DSPless mode
Date: Tue,  4 Apr 2023 12:21:10 +0300
Message-Id: <20230404092115.27949-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YGW6JNN4PTJU67ZJ7G6LPYI4HV6BASOI
X-Message-ID-Hash: YGW6JNN4PTJU67ZJ7G6LPYI4HV6BASOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGW6JNN4PTJU67ZJ7G6LPYI4HV6BASOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

set the dspless_mode_supported flag to true for apl family to allow
DSPless mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/pci-apl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index aff6cb573c27..69cad5a6bc72 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -29,6 +29,7 @@ static const struct sof_dev_desc bxt_desc = {
 	.chip_info = &apl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/apl",
@@ -60,6 +61,7 @@ static const struct sof_dev_desc glk_desc = {
 	.chip_info = &apl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/glk",
-- 
2.40.0

