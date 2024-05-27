Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1AD8D0E4D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658AC84D;
	Mon, 27 May 2024 21:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658AC84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838817;
	bh=TmJuRDSQp2fRkO+qt84U2YXpR8Orn462Xy6kPz0SgRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vto825359ahO5R9QHxQX41/P81OWdT50biBa/9ojOXsqC+F94MgwqcfuaX0NPQZPA
	 INc6rUXfUHrfM+IffJrcHOGUTCTQVOm+kVcVBfPNdsL+1ROks//QFc0D1gWOLhr1CT
	 zHGDv1/tfEYTUD8PylyYoO2ShCWW3DXOaHEgwK4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C9C8F80792; Mon, 27 May 2024 21:37:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CC5F807CA;
	Mon, 27 May 2024 21:37:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3D6F80737; Mon, 27 May 2024 21:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2256F80587
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2256F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VHqSqX9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838586; x=1748374586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TmJuRDSQp2fRkO+qt84U2YXpR8Orn462Xy6kPz0SgRc=;
  b=VHqSqX9CakLPxXxPyC3hcnKhE9wKBwAJF+vIP7M2fNPRXNrUDSXSPdNP
   RTJ6VUFvRZkyj+lgPoXNArDe+Yvd3HtqQpAhQi8OqAmCWx66+ZsqsU/Zq
   FSZAw349URqZzrCeM0nnCM1xzEY2kZzugkLccMSjnzGeY8iYstfjSb2Se
   vJiO50MVh989D2CbLDDDJMwEFu31EzwNV42IPmIOiCit/qHx6of+2BJ61
   +FSQtgTXxhSER7CZGl+cyv0ouTiCJyUyYOH1WjsQ4bKaEv5INGm2UpYNG
   XFRz5iUdA0IsMXp9qrLG00dXfsRm3OzuHcndSd5KeWygZOYYQcQKDrew/
   g==;
X-CSE-ConnectionGUID: GzkD9pIoS82N/hC0wBxI6w==
X-CSE-MsgGUID: jCVU2+5RTa6TCjM4nlUDrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339392"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339392"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:21 -0700
X-CSE-ConnectionGUID: iZyAspuQS/ya86+gCyQHLA==
X-CSE-MsgGUID: +UoF/mOtQkiChc2Lm36tnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029789"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: SOF: ipc4-topology: support tdm slot number query
Date: Mon, 27 May 2024 14:35:49 -0500
Message-ID: <20240527193552.165567-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GY6MUN2WMMUOGGQH3UXFAET4ILSE22WU
X-Message-ID-Hash: GY6MUN2WMMUOGGQH3UXFAET4ILSE22WU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GY6MUN2WMMUOGGQH3UXFAET4ILSE22WU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Support the new parameter type SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS in
sof_ipc4_dai_get_param() function to get the tdm slot number of
specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 67e34fd559f2..df4344f7d547 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3174,6 +3174,8 @@ static int sof_ipc4_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *
 			return le32_to_cpu(hw_config->mclk_rate);
 		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return le32_to_cpu(hw_config->bclk_rate);
+		case SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS:
+			return le32_to_cpu(hw_config->tdm_slots);
 		default:
 			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
-- 
2.43.0

