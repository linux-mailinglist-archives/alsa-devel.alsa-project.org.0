Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932D7730FD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35B4C83B;
	Mon,  7 Aug 2023 23:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35B4C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442824;
	bh=hSlgxCVxMnokiJeXJYSA/H62hcvzuo9l2W7Y1nx6ysE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nU2NiRhd9j67+edI2QT0gkC7fkaE2sNUqJFDpXd96s+FostuIE/dqYqtTMxWK44R8
	 85mQXJUhFJjgxdhOv/ABflD+avRBX5ugPZVhOlQg1FkN3chBzAIPFVgMePSATSYTgK
	 0Bquv2fBohLvhSxnMp55DO7pXbBZMtT5I8IPZZ5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E792F805C8; Mon,  7 Aug 2023 23:10:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF06AF805C8;
	Mon,  7 Aug 2023 23:10:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 915C7F805A0; Mon,  7 Aug 2023 23:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B65F8016D
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B65F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IEbY0Mr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442617; x=1722978617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hSlgxCVxMnokiJeXJYSA/H62hcvzuo9l2W7Y1nx6ysE=;
  b=IEbY0Mr1+igWQl+HEcCp8kDp57UAdQcN7YgTApDX+oxInkHWXcmGG7uv
   BNX7uHRyx8Q9olI4lEWL+sSFHmkgG7usm3TuW5MWuBCsumVS7QbmEoxtQ
   Pttd1E1P+gHNBIwE2j/yE7mSFYEmqj2PKK+afbAfcm7cRJqxafN7GdSWN
   1w4Db56Z9rVV1WOZPYY1BplctNpdrF7Xcn6QqEO/gmT7SnnDdAQQW4AZt
   V63mujFYKX4JfblzmNNcvu9zli5fTtSV4nWvbAqZKK+k5ulk51yrCLAiH
   To1F00iluYQ7vEzGxYVo6HJXXjH0unDqmmLPJE1Vt3HNjUoVbdbJZgxgT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244302"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465154"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465154"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 01/20] ASoC: SOF: Intel: hda-mlink: fix off-by-one error
Date: Mon,  7 Aug 2023 16:09:40 -0500
Message-Id: <20230807210959.506849-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KLVE2KY3SPCJHE2D7IMAU3XS4ZN6MRXX
X-Message-ID-Hash: KLVE2KY3SPCJHE2D7IMAU3XS4ZN6MRXX
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HCHAN parameter should be the highest channel number, not the
channel count.

While we're at it, handle LCHAN with the dual __ffs helper.

Fixes: ccc2f0c1b6b6 ("ASoC: SOF: Intel: hda-mlink: add helper to program SoundWire PCMSyCM registers")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index b7cbf66badf5..acad3ea2f471 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -781,6 +781,8 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 {
 	struct hdac_ext2_link *h2link;
 	u16 __iomem *pcmsycm;
+	int hchan;
+	int lchan;
 	u16 val;
 
 	h2link = find_ext2_link(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
@@ -791,9 +793,17 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 		h2link->instance_offset * sublink +
 		AZX_REG_SDW_SHIM_PCMSyCM(y);
 
+	if (channel_mask) {
+		hchan = __fls(channel_mask);
+		lchan = __ffs(channel_mask);
+	} else {
+		hchan = 0;
+		lchan = 0;
+	}
+
 	mutex_lock(&h2link->eml_lock);
 
-	hdaml_shim_map_stream_ch(pcmsycm, 0, hweight32(channel_mask),
+	hdaml_shim_map_stream_ch(pcmsycm, lchan, hchan,
 				 stream_id, dir);
 
 	mutex_unlock(&h2link->eml_lock);
-- 
2.39.2

