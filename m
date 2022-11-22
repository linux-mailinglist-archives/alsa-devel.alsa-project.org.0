Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3F6334AC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 06:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC3F1666;
	Tue, 22 Nov 2022 06:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC3F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669094368;
	bh=BcD4JqvThlWwX7cQCLdFoRsqIr2tZD8u+qHX4Apjbs8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PF0D0dM62s+8FGXrDjnEb7NIOgRZi7FyQOmBOWWALvBqKGHhzBqJHcMdWtzLj+hum
	 0Qjq86+sYJXwuu8rfwar8q8EEAWxNogr6ev6KNE0Kzg3rRzy3oHKyM1LkMGHsQa9E9
	 ocREBDRKpAc2wdxykXj64f9pSOdsXV/jDX/FQoPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E30FBF80115;
	Tue, 22 Nov 2022 06:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29654F80272; Tue, 22 Nov 2022 06:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D67D2F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 06:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D67D2F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EUyW/SEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669094305; x=1700630305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BcD4JqvThlWwX7cQCLdFoRsqIr2tZD8u+qHX4Apjbs8=;
 b=EUyW/SExHC5Rxy6PrSB3/JgTo5XzSNGO7n1q3lo+eqL78W9uata+fXiy
 Ami/TNDv5rvkxhnmAECv13NXhK5FZAg5DHkDDkjZNsGGsceyf2/eSO+ED
 aa+Ec8Nt+lA/r3QTaVx9eLmAlGq82WvHfdYKrDz0SXND8jyuiMKF7HQ+n
 3W+k60LFAeygOycGDYhvfDYHALTNZKPebRCsQop1O2+zcrlpDxSKaNJUe
 y3Zi0h8eKAXq9Nu3ZUykl7qzyx0ZPtj9sfpFf46CC8qjBfsRvLQKltCDP
 W0QvILnljvHMS3OhaKg4MDHIHVbGqbRmBuOS0eHiNsX4zrcL9InDyhU8v w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="294124235"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="294124235"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 21:18:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="710072838"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="710072838"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 21:17:58 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: Intel: sof_sdw: Add support for SKU 0C4F product
Date: Tue, 22 Nov 2022 13:20:52 +0800
Message-Id: <20221122052052.687281-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

SKU 0C4F product supports a SoundWire headset codec, SoundWire
capture from local microphones and two SoundWire amplifiers.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 172f008adea0..ffef492e3f3d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -376,6 +376,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C4F")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.25.1

