Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AC62CF8C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 01:27:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F042516B6;
	Thu, 17 Nov 2022 01:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F042516B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668644845;
	bh=1AUQWgGBl7ZmXOunIsxpyPE6ACQ4IEY3MWATGhM9bCo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8CzXc3ix/aQXvBegtuvWmNpHaNg+Djxr7DwrnFGYxuoLfGh/uqg/V4D4CLSDv7OP
	 nqw6bmVRKXAV0L+h1EICO9C11cmdvDwQpC562XKYJuQoqdbH5bZ2Bu5CgEARZ207ZP
	 pnMrJS490Bq1eV5FVlhbbZJxlStfhLzBn7ir6+cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A12F80559;
	Thu, 17 Nov 2022 01:25:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9A5F8032D; Thu, 17 Nov 2022 01:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D574F80169
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 01:25:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D574F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GlSKtS2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668644740; x=1700180740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1AUQWgGBl7ZmXOunIsxpyPE6ACQ4IEY3MWATGhM9bCo=;
 b=GlSKtS2V4oqU18aQ11lL0Vf/baxhsU3TMvNsLNb+n9EUMhsk/HeVsu86
 pZCKP4TMjApNcsQSSawyLAB4AsTKCkSY0yCJY+RU3uGxuU4y9Mo9bzRhT
 mb4XPuvMQ3XP1/IMUF6eM/PQK7gTcpEf3i3xtx/6h0cfVCp/D7E2nqzjb
 AVB92PW5jv3lTUeiqi1gOdgHIMStRDSt1LwdbmFI5f+/vRUDiolmp4NNl
 liuCFRqMQ1hkLoB0qUeiQBjoRNdjaXH8F5v+lztxO1QBGuS7kKIkhmzKD
 46rZc/+Le0dM/iI9JS9oI7OZGbG+v0tStRshkgfFSEL1YyKHMk4szJv7V Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314523563"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="314523563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764535158"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="764535158"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:36 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/3] ASoC: Intel: sof_sdw: Add support for SKU 0C11 product
Date: Thu, 17 Nov 2022 08:27:57 +0800
Message-Id: <20221117002758.496211-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
References: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

SKU 0C11 product supports a SoundWire headset codec, SoundWire
capture from local microphones and two SoundWire amplifiers.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b86b1c5579bb..33b404299430 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -366,6 +366,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C11")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.25.1

