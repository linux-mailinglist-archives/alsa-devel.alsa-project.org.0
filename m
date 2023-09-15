Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F967A1D90
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E44F852;
	Fri, 15 Sep 2023 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E44F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778022;
	bh=cV7AHlontMovqDlnpniU2t4nIcmYa9dc2wIMkhwQasI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hf00uRpdChLzan80arsDQG9sB29NnUj37kNzWinM85Lda9M31TM2QTkywWV+Cz8Us
	 pume3E8HrbCEpBvIFA1wmA9mxC4X8svE4WDVELs40dirRX7E3A2MWuNDDfiJcz6tB6
	 CRym/JZaXExpB4NToTlucz9iQXfsRO62Ok9AH0fc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2AAF801F5; Fri, 15 Sep 2023 13:39:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D177F80246;
	Fri, 15 Sep 2023 13:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6B1F80537; Fri, 15 Sep 2023 13:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74EE0F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74EE0F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TwvSAvpY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694777958; x=1726313958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cV7AHlontMovqDlnpniU2t4nIcmYa9dc2wIMkhwQasI=;
  b=TwvSAvpYeNTba+pGtc0HSIIyqT6XwA0VenIbEBfy+EA+ZuGXRYKrw+ZC
   bWnAGkPEIY/FK/ogf9gbm/VItLneSQKw283KyAy0cv9eoSGtox2oj+Mae
   Pj+jhGtcB0pCJ61S+L3DGsAcOmU7GbLceKGkP/yZKjdSM/+JuSy6AglKq
   +8h9h9cql1KyXi3ZxD6MUvREw/c+XIO8GFmsR9dh29JAXQxV2KXrVhG6l
   9f0aMt4jFCpPXT0QkD4Gj4cXVEB/lUsC3ldKH/otufQbMRiKPL28xFMkY
   9PQTlO/CuIxqmPpb40dwJWzH+PLHCiZyyrgMSTINlhuXz0ZE4+EnZh8Wr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465590996"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="465590996"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918629479"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="918629479"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda: Add definition for SDxFIFOS.FIFOS
 mask
Date: Fri, 15 Sep 2023 14:39:10 +0300
Message-ID: <20230915113912.1405-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915113912.1405-1-peter.ujfalusi@linux.intel.com>
References: <20230915113912.1405-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KUEVWFNKLR7RGAUR6XLQYJNIXW7CQ2NQ
X-Message-ID-Hash: KUEVWFNKLR7RGAUR6XLQYJNIXW7CQ2NQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUEVWFNKLR7RGAUR6XLQYJNIXW7CQ2NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The FIFOS (FIFO Size) field is in bit 0-15 of the register.
Use the defined mask instead of a magic number for the FIFOS value
masking in hda_dsp_stream_hw_params().

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 2 +-
 sound/soc/sof/intel/hda.h        | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 0b0087abcc50..65e9242365be 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -668,7 +668,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 					 sd_offset +
 					 SOF_HDA_ADSP_REG_SD_FIFOSIZE);
-		hstream->fifo_size &= 0xffff;
+		hstream->fifo_size &= SOF_HDA_SD_FIFOSIZE_FIFOS_MASK;
 		hstream->fifo_size += 1;
 	} else {
 		hstream->fifo_size = 0;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5c517ec57d4a..2b228c63905b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -135,6 +135,9 @@
 #define SOF_HDA_ADSP_REG_SD_BDLPU		0x1C
 #define SOF_HDA_ADSP_SD_ENTRY_SIZE		0x20
 
+/* SDxFIFOS FIFOS */
+#define SOF_HDA_SD_FIFOSIZE_FIFOS_MASK		GENMASK(15, 0)
+
 /* CL: Software Position Based FIFO Capability Registers */
 #define SOF_DSP_REG_CL_SPBFIFO \
 	(SOF_HDA_ADSP_LOADER_BASE + 0x20)
-- 
2.42.0

