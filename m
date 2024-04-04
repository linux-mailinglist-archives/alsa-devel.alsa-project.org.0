Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7892898E68
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642282CF0;
	Thu,  4 Apr 2024 20:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642282CF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712256974;
	bh=jR0hXVnSlMm9VAI0MUqukd1eQ7JKzhltn4ryJuf8Cqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VOocn94YbaqoTgbEpss40C4ZlniX34iZF/fA0NNkxh5Y9mGe9uwx29W3gDAB7REm7
	 UeliTFYK3XNpKxDMeLz74pF75WP+80sfhR7f8lNsVxKVBcgwtc4jmOs1CDgNc/asYO
	 Wv95h9B5eFQdnqMrS+PB8m8AlMd7QBTYnT/Ft73s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5FDEF805EB; Thu,  4 Apr 2024 20:55:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A9EF805F2;
	Thu,  4 Apr 2024 20:55:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88E7F805B2; Thu,  4 Apr 2024 20:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 511E1F80007
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511E1F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z0jVwFfn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256903; x=1743792903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jR0hXVnSlMm9VAI0MUqukd1eQ7JKzhltn4ryJuf8Cqs=;
  b=Z0jVwFfnrLzzVxtXYDltmyIGkIx+9JniuI6BLUjoDWKSZ7V1OFgCPnrc
   fZZdx1/peUi/MdiApiBzBG4Wryr3JMECMijeGFndNsYQ2VsNe5pXBlKki
   2Mrs6TrtN4c+jKZxATUNynlkxauN4n8DyZGalvv7TcMclTQEIg9EqeQJi
   7fRdHy/VbDUOzQM60c+Yl7/AeKQLjVZIBAAAGtRFazDgmj3AEUKdz8dxt
   qlLQRpcjoCw4NTCSaqiufwXr50FLty9nIpxqt97pDVN4S8J3s1CP7dRhz
   GX3I+U6WQbp5xCZtlQy0aMl91/Mkwj3AJeOsW3ypV5TWDifmwyH7b4s9f
   A==;
X-CSE-ConnectionGUID: KWMkfmX4SzesD58BzGVLgA==
X-CSE-MsgGUID: +EcSIXz5ToiemAx5UEU7yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432794"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7432794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:59 -0700
X-CSE-ConnectionGUID: haT0D51HR5SMYnS+TL5msA==
X-CSE-MsgGUID: 5zJ9sduNQ96WS7UoRFKKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23574622"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:54:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX
 stream
Date: Thu,  4 Apr 2024 13:54:45 -0500
Message-Id: <20240404185448.136157-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GBP77ANOUV7Q5R74TNXZ7KOMBV7KGIWD
X-Message-ID-Hash: GBP77ANOUV7Q5R74TNXZ7KOMBV7KGIWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBP77ANOUV7Q5R74TNXZ7KOMBV7KGIWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code conflates capture stream and ICCMAX stream. This
isn't going to be true any longer when we add support for SDW BPT RX
streams. Add a boolean tag to flag ICCMAX streams.

No functionality change, only future-proofing change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 10 +++++-----
 sound/soc/sof/intel/hda.h        |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d5b9209beb5a..dafb6b3ebb20 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -46,7 +46,7 @@ static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
 
 struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction)
+					      int direction, bool is_iccmax)
 {
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
@@ -73,7 +73,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
 	hstream->format_val = format;
 	hstream->bufsize = size;
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+	if (is_iccmax) {
 		ret = hda_dsp_iccmax_stream_hw_params(sdev, hext_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: iccmax stream prepare failed: %d\n", ret);
@@ -335,7 +335,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	 * the data, so use a buffer of PAGE_SIZE for receiving.
 	 */
 	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, PAGE_SIZE,
-					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE);
+					      &dmab_bdl, SNDRV_PCM_STREAM_CAPTURE, true);
 	if (IS_ERR(iccmax_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for ICCMAX stream failed\n");
 		return PTR_ERR(iccmax_stream);
@@ -421,7 +421,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	/* prepare DMA for code loader stream */
 	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
 					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
 		return PTR_ERR(hext_stream);
@@ -538,7 +538,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	/* prepare DMA for code loader stream */
 	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
 					    stripped_firmware.size,
-					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK, false);
 	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "%s: DMA prepare failed\n", __func__);
 		return PTR_ERR(hext_stream);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 16140ae22c90..30a185d4c7ab 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -705,7 +705,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
 int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream);
 struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 					      unsigned int size, struct snd_dma_buffer *dmab,
-					      int direction);
+					      int direction, bool is_iccmax);
 int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream);
 int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
-- 
2.40.1

