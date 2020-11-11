Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB192AFAAE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:45:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D753217BA;
	Wed, 11 Nov 2020 22:44:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D753217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131123;
	bh=sEv8AOvsiMlIHosucopsqvt4eNW4DMtfQGaoUxc1gbM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAwt7B+/ZiLBvbL8XNtJIxGKAOg0hCRzoVm/kADWPA7JxZX58cAz8R5jJrOuHD8Yg
	 F9YSFF6URLkKFaCLLQmVPrAlhtRpK8rYkdJPqnJV4Ewn67yqZFv/AeMF9xmdAnzVit
	 XsREmsqXFPLkHkkp8SN6FqZztZwB1FxiE9ifwXm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E82CF8025E;
	Wed, 11 Nov 2020 22:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6926AF804BC; Wed, 11 Nov 2020 22:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14209F8022B
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14209F8022B
IronPort-SDR: 8KPbtOHj77xg35KgBxV/ThH4koRdpgg9SfJSvjwSstamoK7n2tZ95FBuwUQ9rZmZxQqK4oQDUT
 tAAIiVwr1gTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149495727"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="149495727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:33 -0800
IronPort-SDR: U757drAuI7kaZMe9R8luDFYKd7S9+PbdJjl4R1eNHt91bQTLKB8tjYm8XKk9yIFlWCS63LCZ+E
 s/ZSldud/usA==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="356808075"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: codecs: rt*.c: remove useless pointer cast
Date: Wed, 11 Nov 2020 15:43:16 -0600
Message-Id: <20201111214318.150529-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
References: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Pointer cast is not necessary, remove.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 2 +-
 sound/soc/codecs/rt5682-sdw.c | 2 +-
 sound/soc/codecs/rt700.c      | 2 +-
 sound/soc/codecs/rt711.c      | 2 +-
 sound/soc/codecs/rt715.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index c2621b0afe6c..ec5564f780e8 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -475,7 +475,7 @@ static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	if (!stream)
 		return -ENOMEM;
 
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 58fb13132602..4d707e854875 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -103,7 +103,7 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	if (!stream)
 		return -ENOMEM;
 
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 687ac2153666..66ec395dbbcd 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -867,7 +867,7 @@ static int rt700_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	if (!stream)
 		return -ENOMEM;
 
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 65b59dbfb43c..5771c02c3459 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -913,7 +913,7 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	if (!stream)
 		return -ENOMEM;
 
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 532c5303e7ab..9a7d393d424a 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -537,7 +537,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	if (!stream)
 		return -ENOMEM;
 
-	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-- 
2.25.1

