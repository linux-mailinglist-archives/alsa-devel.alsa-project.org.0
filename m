Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C017A1D9B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7EE9DEB;
	Fri, 15 Sep 2023 13:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7EE9DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778155;
	bh=R5UmcmMi+0KGyQh2g1ZKzfiwXf75bbklKGGQF55+D5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2PBygjKMx1PVa6cZDb6Fxw3Y/+W++HhduDb1Qw+cuz08CGQ4A8DvDh9yCrz61b9S
	 bOFmLh6EPjv2Ca/COxQbFdRJc6UmwD+gE0PXwrSGuzZ63u6R4o//Y9l7GJA6zH2ZSI
	 AJQzMWhD52OJP//xClhjUs5zXFxZ/ZMn/+sgM7zA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CD74F805C2; Fri, 15 Sep 2023 13:40:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8E8F805C1;
	Fri, 15 Sep 2023 13:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B59F805BA; Fri, 15 Sep 2023 13:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EC40F805AF
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC40F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zmjijeed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694778030; x=1726314030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5UmcmMi+0KGyQh2g1ZKzfiwXf75bbklKGGQF55+D5w=;
  b=ZmjijeedZcYlrcbOoYvix6SuHnavJ0hHKaS6UhSMdZvb8TOwWAnDb2cN
   PsXdZpMlAIz8vO4UbsCvzJy6EFk5DeqatlJ+g8HxO5Xp4tJDiEHB7qyjx
   3OK7z9hkRDN5qXQY8pf8nTLzJsPTdLa9S0ux2ExGgH1f9ZLYc10FNvb32
   XoK7UBDjui1VHQSfeIUDfNAignKqGJ7NH7y90ZBOMVBaVts9AXU72Etxn
   Mr0Jp29tpgHIobNiVVZtYhOu4HxWpugP17iFLXYmqQfB46/IhgWi+nAc1
   IPzPzgsNB/6GfZ1OVFakcOAR4TanlaHeZzi04IWVkFn3NtcgElAzCKwXM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358642938"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358642938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721652896"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="721652896"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda-loader: Add support for split
 library loading
Date: Fri, 15 Sep 2023 14:40:18 +0300
Message-ID: <20230915114018.1701-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
References: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RTS4BSTGHVESKDA2TJNGBVSU5KTMDZHQ
X-Message-ID-Hash: RTS4BSTGHVESKDA2TJNGBVSU5KTMDZHQ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTS4BSTGHVESKDA2TJNGBVSU5KTMDZHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a certain sequence needs to be followed when configuring the HDA
DMA in host and DSP.
The firmware provides a way to handle this two stage sequencing by
splitting the library loading into two stage:
1st stage: LOAD_LIBRARY_PREPARE message
           the lib_id is 0, used to configure the DMA on DSP side
2nd stage: LOAD_LIBRARY message
           both dma_id and lib_id is valid, used for the actual transfer of
           the library

In case a firmware without support for this two stage loading is used then
the second stage message will trigger the loading and the first stage will
return with error, which is ignored by the kernel.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 42 ++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 50ce6b190002..1e2669a8088d 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -545,11 +545,40 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 
 	memcpy(dmab.area, stripped_firmware.data, stripped_firmware.size);
 
+	/*
+	 * 1st stage: SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
+	 * Message includes the dma_id to be prepared for the library loading.
+	 * If the firmware does not have support for the message, we will
+	 * receive -EOPNOTSUPP. In this case we will use single step library
+	 * loading and proceed to send the LOAD_LIBRARY message.
+	 */
 	msg.primary = hext_stream->hstream.stream_tag - 1;
-	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_LOAD_LIBRARY);
+	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE);
 	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
-	msg.primary |= SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(fw_lib->id);
+	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
+	if (!ret) {
+		int sd_offset = SOF_STREAM_SD_OFFSET(&hext_stream->hstream);
+		unsigned int status;
+
+		/*
+		 * Make sure that the FIFOS value is not 0 in SDxFIFOS register
+		 * which indicates that the firmware set the GEN bit and we can
+		 * continue to start the DMA
+		 */
+		ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+					sd_offset + SOF_HDA_ADSP_REG_SD_FIFOSIZE,
+					status,
+					status & SOF_HDA_SD_FIFOSIZE_FIFOS_MASK,
+					HDA_DSP_REG_POLL_INTERVAL_US,
+					HDA_DSP_BASEFW_TIMEOUT_US);
+
+		if (ret < 0)
+			dev_warn(sdev->dev,
+				 "%s: timeout waiting for FIFOS\n", __func__);
+	} else if (ret != -EOPNOTSUPP) {
+		goto cleanup;
+	}
 
 	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
@@ -557,8 +586,17 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 		goto cleanup;
 	}
 
+	/*
+	 * 2nd stage: LOAD_LIBRARY
+	 * Message includes the dma_id and the lib_id, the dma_id must be
+	 * identical to the one sent via LOAD_LIBRARY_PREPARE
+	 */
+	msg.primary &= ~SOF_IPC4_MSG_TYPE_MASK;
+	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_LOAD_LIBRARY);
+	msg.primary |= SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(fw_lib->id);
 	ret = sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
 
+	/* Stop the DMA channel */
 	ret1 = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "%s: DMA trigger stop failed\n", __func__);
-- 
2.42.0

