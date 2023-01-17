Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2F66DD35
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C605628;
	Tue, 17 Jan 2023 13:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C605628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957378;
	bh=vES2GFgYRIOF7bwFFS9IQ7TyRUcBcNAN0tvrKk/H2qU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=a31cQ9p7ihfGpI57iGMz29enq2Lam4tZypRn33EXxDVIZgSUn0ZBQ67Opb5CrbCkf
	 Qb+D/CA0kXofBK9m33nvpuj3SP8MOl6jz+9h+9v9b9QLP/+muLZCGTSTyeyyB04Jk1
	 uG6XKZQBQII07XfWkG4c8j9Btq5j9mGVXDoWGGtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CBAAF80083;
	Tue, 17 Jan 2023 13:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A7AF8047B; Tue, 17 Jan 2023 13:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ABA8F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABA8F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FYSF5j8T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673957317; x=1705493317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vES2GFgYRIOF7bwFFS9IQ7TyRUcBcNAN0tvrKk/H2qU=;
 b=FYSF5j8TPYbRmyytg4eWQK0lo7d4fz6lmvPHu7pAJcWUymx9IFPa4Dza
 kzSFk+zea1f0N7qrC9Rx+75eZIO91LBLJWQlMaKcYD+wqprFdNvfcuvxn
 md6pgDwHWnpesWho3GxreNIIqdN2L+5WAXQgCybx9O03eSE6LHqlabgz2
 Vu6J5Q+KFOrIKtzDtTRr7og/NQwVygH7MaPiHUdlZf9GLDQT3SFkZlzWi
 VeGI4sZLSyXXQZlIR/7l8Zw9moL6Wnd/rCG7UrGFURZNE/bXcAJzS8bSq
 3SAXSwI4EoZjvDf09W5x0sXIAZoG+HOWL+e/4cNmEWGETquKzKC4r1iAh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324732459"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="324732459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:08:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609223759"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="609223759"
Received: from izakharo-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.16])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:08:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda-loader: use SOF helper for consistency
Date: Tue, 17 Jan 2023 14:08:30 +0200
Message-Id: <20230117120830.23851-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Update code to remove mix between legacy and SOF definitions. No
functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d680562edb35..de8d9ad89bc7 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -321,13 +321,13 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 {
 	struct hdac_ext_stream *iccmax_stream;
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_dma_buffer dmab_bdl;
 	int ret, ret1;
 	u8 original_gb;
 
 	/* save the original LTRP guardband value */
-	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
+	original_gb = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP) &
+		HDA_VS_INTEL_LTRP_GB_MASK;
 
 	/*
 	 * Prepare capture stream for ICCMAX. We do not need to store
@@ -356,7 +356,8 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	}
 
 	/* restore the original guardband value after FW boot */
-	snd_hdac_chip_updateb(bus, VS_LTRP, HDA_VS_INTEL_LTRP_GB_MASK, original_gb);
+	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP,
+			    HDA_VS_INTEL_LTRP_GB_MASK, original_gb);
 
 	return ret;
 }
-- 
2.39.0

