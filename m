Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23A6D5BBE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A773E1FC;
	Tue,  4 Apr 2023 11:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A773E1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600161;
	bh=djf9lcvpchOEZVIAgZqKO60P4CvQK1s8vysYvuz2adI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SdPkpCn3yLD9HoCVQGgOSysc4SimuK1ZmpHTxf4fviMpdlZX5M78QuUBHDO054yKo
	 0F4wi5W+heLlfIywjwByPdLQBWrrkIJzsHM5t+OCXkWxwFcRM3gL8uJ2mMFfO35OC9
	 Jwr2YudoM7aBnBWfLIVRCJJFvOOjp6mj3vEdidRE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C732F80533;
	Tue,  4 Apr 2023 11:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D97EF80423; Tue,  4 Apr 2023 11:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39BF8F8024C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BF8F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MR9PvD0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600050; x=1712136050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=djf9lcvpchOEZVIAgZqKO60P4CvQK1s8vysYvuz2adI=;
  b=MR9PvD0U6Hgroi3wh+9U8f1rrhQ7uttWeTGzKPeviEgk0mKB/CONs307
   9GZKBS9OUjfHr5uRhVqBYKvAolrzxjPJ+YQR7j9hybgueyUDclfpLdqFi
   KpBZWiZI6e3DYYrW0NRzGaRou1m74wmpt4YxFJ+u+UbBrnssEdF3Qkl+l
   N+Es9KZiLdi0QVXYmnaiCp4TFHaidMP6PLk1BOuxRidOj+iknZH1+GZDy
   dd8gmfBfLLNjm6bfTxiMB3SLRGQwH44zbmyV7cYVD6ANUZ1R2CmoHBrD2
   Dvinw/hMKbpVmEvsKn8ol2ypPRVK+smyuZIV0eKWtBOXYHWfs+UFfdUMT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620505"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620505"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688819951"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688819951"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/12] ASoC: SOF: Intel: hda-stream: Do not dereference
 hstream until it is safe
Date: Tue,  4 Apr 2023 12:21:04 +0300
Message-Id: <20230404092115.27949-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CFJGNTDAGYZO7QJAOS35ONEJYDVPYLD5
X-Message-ID-Hash: CFJGNTDAGYZO7QJAOS35ONEJYDVPYLD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFJGNTDAGYZO7QJAOS35ONEJYDVPYLD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Only access hext_stream->hstream after it has been checked for NULL pointer

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c37ef581637f..50e92996f928 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -485,9 +485,8 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 {
 	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_stream *hstream = &hext_stream->hstream;
-	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-	int ret;
+	struct hdac_stream *hstream;
+	int sd_offset, ret;
 	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
 	u32 mask;
 	u32 run;
@@ -502,6 +501,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 		return -ENODEV;
 	}
 
+	hstream = &hext_stream->hstream;
+	sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+
 	/* decouple host and link DMA */
 	mask = 0x1 << hstream->index;
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-- 
2.40.0

