Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F861EBE5
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 08:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C0882A;
	Mon,  7 Nov 2022 08:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C0882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667806022;
	bh=4oAWF6230xJyn55cbZn/RqlJr1644/x6T5DSbHIXF8U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NQXfk8gvzfp1MPmZCdKDxES+Zed7O1oDfbP71+5wEsQ1B0k1buZw1hHZSaLFVpbb3
	 1HQML8aQf1MSBZ0Hn15N2q6VUua3dgcul2joRv8nI64UmbYRRtAp+orcWPuHcL2EI7
	 oocYYanu27kPj76C6iPl1kvB+ellIzAU4+fG+xog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CB0F804BD;
	Mon,  7 Nov 2022 08:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 686D0F8025A; Mon,  7 Nov 2022 08:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA2B3F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 08:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA2B3F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NqiufuW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805959; x=1699341959;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4oAWF6230xJyn55cbZn/RqlJr1644/x6T5DSbHIXF8U=;
 b=NqiufuW2Ppv7WEElYvK35fQZTLC+71o9hkXliOsuQOmQjp0crv2LHTSX
 cEfqSYd7jlJMRLkDxz1830mZQy9wQNAHgeoBqXo4xXMGBxQ5YTU05Vk0D
 EDVDUak4A4/A/pG1l35vS5AX4nDcFYf4wtARxsuHLLpgkyTPzbHQAjqzB
 sjMg6hInNf295onSybKpu6ppxRM3aER30R/qsFsQO2ZXEMVBBFmO93Jt2
 CDxLpPqTmBg74J98o6bUrwvdTY/I/U8KaHgYLv+4vSrUBTe/1rmOpOb6e
 O0ozfvXMoQgLEB0zb2Ivwed4AgCRdCKb8Xcv7Rb40Ar+ox/mqZOKGtpRG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="374597586"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="374597586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:25:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586875899"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="586875899"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:25:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	kai.vehmanen@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-loader: use small buffer for iccmax
 stream
Date: Mon,  7 Nov 2022 09:26:21 +0200
Message-Id: <20221107072621.28904-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The data received via iccmax stream is not used anywhere, so no need to
allocate a big DMA buffer for it. This is especially important as the
allocation is done even in cases where reload of the firmware is skipped
and execution happens directly from the firmware stored in IMR.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 3a4b0b6e2c5c..d680562edb35 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -322,7 +322,6 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 {
 	struct hdac_ext_stream *iccmax_stream;
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct firmware stripped_firmware;
 	struct snd_dma_buffer dmab_bdl;
 	int ret, ret1;
 	u8 original_gb;
@@ -330,15 +329,11 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	/* save the original LTRP guardband value */
 	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
 
-	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
-		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
-		return -EINVAL;
-	}
-
-	stripped_firmware.size = sdev->basefw.fw->size - sdev->basefw.payload_offset;
-
-	/* prepare capture stream for ICCMAX */
-	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+	/*
+	 * Prepare capture stream for ICCMAX. We do not need to store
+	 * the data, so use a buffer of PAGE_SIZE for receiving.
+	 */
+	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, PAGE_SIZE,
 					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
-- 
2.38.1

