Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0AB8A21B6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20EA2BC9;
	Fri, 12 Apr 2024 00:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20EA2BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874336;
	bh=c6lstUGBF8ul5qNCqvj7138ObR+8fKLSLVj5b2moD88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VMqERgs2g2FlscQzkELjSKsOtuIN4/69s2YHaYSvnnndiJ4kYQGsHHumk5zvKb47S
	 CrEQT2YX3bh3fgjFvo6urPQOe7RaWL/ldubfSxxTpJMAZKL94HxbSenqQtam+ZbT93
	 Az6fJfwFLCxQylp1uSFpnVUG+yCo6vQrBlBWr8Oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 606C6F80423; Fri, 12 Apr 2024 00:25:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC2D8F80236;
	Fri, 12 Apr 2024 00:25:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD235F80236; Fri, 12 Apr 2024 00:14:23 +0200 (CEST)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F948F8028B
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F948F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QndEQ3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873063; x=1744409063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6lstUGBF8ul5qNCqvj7138ObR+8fKLSLVj5b2moD88=;
  b=QndEQ3a025YjzTIr98hH3DXe8FllcmrVQih8e+eslH0Y6YXspCoqNnok
   5+Ce4mEp7ipOLOBq3CN//6wDMlVIOs3e4EnxY1tvL3Ur4BQIJzhZU8Lgp
   PSOgIXftdZmoM23un7kcAQqjIOidhPlqDGE3/K5wIgCgV6wg7NfTVwe0O
   qRHvnozWeMYfdUPoLOzz6K3u+QzyqB5AxwwbtFrBkaO+5M6BcJFK9GVNW
   I3iY6lctK/0jn7pS8l5Db4qDLVJMHEjH+iazfvTATEbuylDa2LxuyI0RH
   n0n+uBJfMOJjqrnYNMVqlAdEM87GVqly03cqBVvDkexPHcP2kmOoRrpT1
   w==;
X-CSE-ConnectionGUID: 7B9lan/nTbmqf/QueW0mng==
X-CSE-MsgGUID: HeALFKhLTgmQUjHtf5f4ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708350"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708350"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:14 -0700
X-CSE-ConnectionGUID: wyCfV3lnR46/qELWVn/wlw==
X-CSE-MsgGUID: pRbaKG5sQoaDEYfLkevyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628733"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 04/12] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
Date: Thu, 11 Apr 2024 17:03:39 -0500
Message-Id: <20240411220347.131267-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q74YPQ66QMCAYX3OXT2TXFI2QZBEY2W4
X-Message-ID-Hash: Q74YPQ66QMCAYX3OXT2TXFI2QZBEY2W4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q74YPQ66QMCAYX3OXT2TXFI2QZBEY2W4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The JD1 jack detection doesn't seem to work, use JD2.
Also use the 4 speaker configuration.

Link: https://github.com/thesofproject/linux/issues/4900
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f191dc72bc3d..6253fc464198 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -432,6 +432,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.40.1

