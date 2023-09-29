Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26CF7B30EA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 12:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2556D3E;
	Fri, 29 Sep 2023 12:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2556D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695985018;
	bh=kPZ6wR/vAMk4xhV5l5oUC1T7NeXF+/f+Wn9iGkBY46s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pseg+M8CWDDZ1tOp4ZroxSAPFLC9ytvMSqYEmxcb0ZGrl+6S/XYrSTiyLbVCXH4mr
	 kMj4oOv9WJoWkKph34N3JjBGnBVbxTtPbsrv/Wla3GuePlbEsXQKQnnLyxBoFHPiCP
	 R6zcmReSk1Vc2VTlxeA45+Dl/ZCu1lhiAhI3xSAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0E9FF80553; Fri, 29 Sep 2023 12:56:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C019F8016A;
	Fri, 29 Sep 2023 12:56:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56208F801D5; Fri, 29 Sep 2023 12:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 836EFF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 12:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 836EFF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SKnA9KZZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695984958; x=1727520958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kPZ6wR/vAMk4xhV5l5oUC1T7NeXF+/f+Wn9iGkBY46s=;
  b=SKnA9KZZvEOc7lGcfgrRKLVwOHU2ZuTsxMnjkmJ1zJvIi0bNe3JoxNrx
   VJiZT/twYT1FnlE8kuZlX4QYLXsbV1WDObbvRlp7SosXKNJiTZoyMuXra
   etmfEGRdCdcIhwgUPe+Hd7UdyIhZDey7xp5EWBTTfaapbTJ2E9TkMvOjn
   aCgs1QfJtFveDK7C3M174Mv9qFGTkrNz8NAb5AwRdR7ggBBCts/+ivqOg
   k/2U57lqj1mho3UIxlSVGyWzDVK/h2pegU1B6AS90yJLwpb6HuYnNTq26
   CINUNltVxoJDiz7iFHnXvIiPArW1widkS4RGV6mFgNHbI7u50LcPllKCn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372629968"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="372629968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="785062923"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="785062923"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 03:55:37 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] soundwire: Use snd_soc_substream_to_rtd() to obtain rtd
Date: Fri, 29 Sep 2023 12:55:46 +0200
Message-Id: <20230929105546.774332-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7WFZELA2TP5ZKDWEXSZFOLOQKFVSB6B
X-Message-ID-Hash: O7WFZELA2TP5ZKDWEXSZFOLOQKFVSB6B
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7WFZELA2TP5ZKDWEXSZFOLOQKFVSB6B/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Utilize the helper function instead of casting from ->private_data
directly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 drivers/soundwire/stream.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 69719b335bcb..652aae4e221d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1717,7 +1717,7 @@ EXPORT_SYMBOL(sdw_deprepare_stream);
 static int set_stream(struct snd_pcm_substream *substream,
 		      struct sdw_stream_runtime *sdw_stream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int ret = 0;
 	int i;
@@ -1770,7 +1770,7 @@ EXPORT_SYMBOL(sdw_alloc_stream);
 int sdw_startup_stream(void *sdw_substream)
 {
 	struct snd_pcm_substream *substream = sdw_substream;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	char *name;
 	int ret;
@@ -1814,7 +1814,7 @@ EXPORT_SYMBOL(sdw_startup_stream);
 void sdw_shutdown_stream(void *sdw_substream)
 {
 	struct snd_pcm_substream *substream = sdw_substream;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	struct snd_soc_dai *dai;
 
-- 
2.34.1

