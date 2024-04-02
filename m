Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB9895807
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D95B238C;
	Tue,  2 Apr 2024 17:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D95B238C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071244;
	bh=TJoW8RciH39owQNbgrWqj3szaoPdAAlBqErkph0omU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NrBHvarbu9zsSxZStUY1KhwtRpW8dGnFd6T6tYBxchcxSEnrpg2QULLbhz87DSUwo
	 gtXgmZWBsRaexHUjV8ng56U3LkspHWBNIOrgIP4as8Jz8jeYqqtZx0D3ZJXgJ8mrIh
	 56IPskkYsD01kxfIhrXLXOjGBbot7q5WLsQNIMwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1693FF80685; Tue,  2 Apr 2024 17:19:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E361F80684;
	Tue,  2 Apr 2024 17:19:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A63CAF805E7; Tue,  2 Apr 2024 17:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDD37F80007
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD37F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mVtxuuHM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071125; x=1743607125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJoW8RciH39owQNbgrWqj3szaoPdAAlBqErkph0omU8=;
  b=mVtxuuHMVg/pRIjUIAi8vuV6zvGNFUPo/ph6Y9V0NxlOmLn87QgYuZuS
   HZ0Sdtcb+xh057yS2U6Z/J9iqedJsWTSwXrSKTxwSfQ/aSPjMngmvaMjY
   1toYhgKmnMbUIaKhp2HD/4L6fsDkNc6V3oKrYOgKkL8mImzwuff4UCv0s
   /6nXxnmgmlC3/7ki7nRDAmjk7L8mDWmWs9luUQpcgMvWBkRlovLUcgMCy
   ABP7MGBBdJyBm3Jpm3n44kkX6RtIvzwbGVMM0MFpw3xmCs9ZiIgPaNPRr
   9lkO4R0/9YOkE5pGmWMsO6ffBSepDWgsZstuU0DsmYkOwmu68vqC5XFxe
   A==;
X-CSE-ConnectionGUID: gKrRwkBoQT62paA8UC8HSA==
X-CSE-MsgGUID: wFqnbixtSZyp5hR0rgKY2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729930"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729930"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:38 -0700
X-CSE-ConnectionGUID: 8ljQWR7OReyzb5vEp2vXDg==
X-CSE-MsgGUID: TAOVqzxqShmDRYy/qgxO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796490"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/17] Revert "ASoC: SOF: Intel: hda-dai-ops: only
 allocate/release streams for first CPU DAI"
Date: Tue,  2 Apr 2024 10:18:14 -0500
Message-Id: <20240402151828.175002-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BD57LUCHJR5MPHJ6BQHLV4AIGFNA7IWI
X-Message-ID-Hash: BD57LUCHJR5MPHJ6BQHLV4AIGFNA7IWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BD57LUCHJR5MPHJ6BQHLV4AIGFNA7IWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This reverts commit f8ba62ac863c33fc0d8ac3f1270985c2b77f4377.

The SoundWire aggregated solution was to use one DMA on multiple links.
But, the solution changed to use one DMA for each link. It means that
we should assign HDaudio stream_tag for each cpu_dai.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index e17b83575e84..457144203999 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -146,17 +146,9 @@ static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
 						      struct snd_soc_dai *cpu_dai,
 						      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
 	struct hdac_ext_stream *hext_stream;
 
-	/* only allocate a stream_tag for the first DAI in the dailink */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-	if (dai == cpu_dai)
-		hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
-	else
-		hext_stream = snd_soc_dai_get_dma_data(dai, substream);
-
+	hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
 	if (!hext_stream)
 		return NULL;
 
@@ -169,14 +161,9 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 				    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
 
-	/* only release a stream_tag for the first DAI in the dailink */
-	dai = snd_soc_rtd_to_cpu(rtd, 0);
-	if (dai == cpu_dai)
-		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 }
 
 static void hda_setup_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream,
-- 
2.40.1

