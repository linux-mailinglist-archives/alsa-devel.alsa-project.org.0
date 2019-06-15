Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E946F38
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:13:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8AA1845;
	Sat, 15 Jun 2019 11:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8AA1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560589984;
	bh=veBrDI4khDkwA+mhRrgQdumB82ihMFs7/NZKTjrsW7U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPyNzx7u77b1ybG09tpvcUB4b2mYzM/OmyG9pEZD4BGuLquRAG9vRhzyL1LgaFV2m
	 WkGw5z7054xTi82lJPLfl8rw29gM7NY04G+jECz+hEast4pC6/nV425f1UCYURh8yW
	 a99gMASJNVaeR1ZGsXk//6OLkmwOD/8BbdiULkS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A014F89714;
	Sat, 15 Jun 2019 11:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC912F89712; Sat, 15 Jun 2019 11:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F4AF8076F
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F4AF8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lgD9gPqZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cMHDE7pI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 42B60482;
 Sat, 15 Jun 2019 05:11:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2IuI9NeVhuo5E
 SpTZh1J+R1hTbyQgo4XvaPWXGZE3RA=; b=lgD9gPqZn7jCJkbOVsU+CZegkc+D0
 2dPA2ZmNIiLXvluAXdy1LFUccRg34+ebz22JspzUZ07UW4dU/1Z2cD/eWYYkna+W
 yvMARMr8s05bHN46fxGboytjgx1kuUuI6nZYfs17HtPov7hlVn6yDSFRnDCm3coh
 2Y6lIjhZc/8ClnbaExipCjJFRHOZa83xHFFkagTP9YpR5pymgXBraYOKGjMf7cB4
 x05mIX5kYmnFGvBJyOr5mCw9DOqTU7qIyn0EOAtPaswXW97STx9IK/1OrDXfUv8I
 sPcPFEjFtAQC+g6qB6Vj6KTwkLYzhcVbyKDlm5YLMThQgD8kNmbr8Hyyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2IuI9NeVhuo5ESpTZh1J+R1hTbyQgo4XvaPWXGZE3RA=; b=cMHDE7pI
 QDG94enZ9Vjz/JwEOuvzj+IZs8LQVHV8CcKmTsKYGT/sdFUKYuByWaMwuc49WJii
 3a+6klGjDQyf5YUBjYNkmivQ/yEdfcUKx/5PA5FHJzY2V8lp4cWPUYwBD6hPx1w1
 T2qmalaJxzuSuugJbqT6aO5pmPgKuAEKgKZ1QHQnUjOi5Z3TMHxXdOPXek3Kb8l4
 D8LZLwf8ZIh7a1NeXClHw8l19g8+F5gvVdGa/8Y0m8GsBR0DPOHyoeUIYwB+v6y0
 pEtiRwXTI1MgJaV8k/YTlWuraJ755VDO52iI0uRg0w5ZsxpK0/x9ivRAxpq6/QPx
 ORqCuo1kOGd7jg==
X-ME-Sender: <xms:LbYEXTP7rizB6fM32477tJ3zoFtcJGwnMtMF5bnItldpoit5TRYR9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:LbYEXcbiJNWvyQYRYi-8FAa3z6wqQ92u7MWY_ZKuKOv_R62ebfJB_A>
 <xmx:LbYEXfrldORJd0Ys_pEvt2ZMaHGkjhmfnm4YGAuWOTbsHoOdJsCLww>
 <xmx:LbYEXa4MfdDBk9PAuFJHOL3xeS0vEVgLP5wiBsqRR6q0WgoCXeIvlw>
 <xmx:LbYEXamO__HiH2fTa_t8SybPryqW13lasXC-kGVRZfvbmthoklu8tQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8079D80061;
 Sat, 15 Jun 2019 05:11:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:10:56 +0900
Message-Id: <20190615091101.7515-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/6] ALSA: bebob: code rafactoring for callback
	functions to PCM interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The pairs of pcm.hw_params callback functions and .hw_free callback
functions for both direction have no differences.

This commit unifies the pairs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_pcm.c | 55 ++++----------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 71b6ede31bb2..530db7a7844c 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -185,33 +185,8 @@ pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int
-pcm_capture_hw_params(struct snd_pcm_substream *substream,
-		      struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_bebob *bebob = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
-		unsigned int rate = params_rate(hw_params);
-
-		mutex_lock(&bebob->mutex);
-		err = snd_bebob_stream_reserve_duplex(bebob, rate);
-		if (err >= 0)
-			++bebob->substreams_counter;
-		mutex_unlock(&bebob->mutex);
-	}
-
-	return err;
-}
-static int
-pcm_playback_hw_params(struct snd_pcm_substream *substream,
-		       struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_bebob *bebob = substream->private_data;
 	int err;
@@ -234,23 +209,7 @@ pcm_playback_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
-static int
-pcm_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_bebob *bebob = substream->private_data;
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
-		mutex_lock(&bebob->mutex);
-		bebob->substreams_counter--;
-		mutex_unlock(&bebob->mutex);
-	}
-
-	snd_bebob_stream_stop_duplex(bebob);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-static int
-pcm_playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_bebob *bebob = substream->private_data;
 
@@ -360,8 +319,8 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		.open		= pcm_open,
 		.close		= pcm_close,
 		.ioctl		= snd_pcm_lib_ioctl,
-		.hw_params	= pcm_capture_hw_params,
-		.hw_free	= pcm_capture_hw_free,
+		.hw_params	= pcm_hw_params,
+		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
@@ -372,8 +331,8 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 		.open		= pcm_open,
 		.close		= pcm_close,
 		.ioctl		= snd_pcm_lib_ioctl,
-		.hw_params	= pcm_playback_hw_params,
-		.hw_free	= pcm_playback_hw_free,
+		.hw_params	= pcm_hw_params,
+		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
