Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48041FAE
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652AA16C2;
	Wed, 12 Jun 2019 10:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652AA16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329470;
	bh=hXwI+8KvpxW+6u/iJfEflRVMBLLKWC9gaIh/RJuIFR4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1IzsX1IU5zpqHM9mKB7qhWje2/Bezk7uRDN5EnF7BEiusNWr9v8xyqgvfN2SGkjl
	 4lL5qZJqCERed0xhX9lrDY6e4Oo2cKPrD3Ihhr8G0pcSxle9kit/mvSOS+Bk4lRcBE
	 1terapUfDHUoRngZZY9gMQyNVhs9G8md/wlJHxHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 332BCF89755;
	Wed, 12 Jun 2019 10:44:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 552E1F8973A; Wed, 12 Jun 2019 10:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B78E5F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78E5F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GAunMQoe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UwWgLdDM"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1DEA3571;
 Wed, 12 Jun 2019 04:44:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FUTGoQ7x1584K
 MF/g9Rzh6+f5kYFFKQqfEaEGsNUfSg=; b=GAunMQoePSdvcNCC1pbBhKCfYv9cq
 w0DV/qSel2bEo3skEaueWy3vtXS/kE8iKik3nbD2Scx+86AlngXLwQ1yQrUCxZbl
 Ewfno7fN+CQ00KHvH/ROyeA+LFRHm2I4fe8mACNqt+VTqNfbi8wx2NxZlEFXiRGw
 syyDOj4DvKfvnKXBWIzkdZ9cAC0VWZKi9NiYqXnSAsM6whl6437BsrW7g7csj+9G
 YDCog2EtmY1wgnI59vJNJo988/2m7xiyEdCUIr1CVelQnM7Ocq180Ehs/1Xry6q1
 67pCaAMCg0KUggX1RVyu2TOM8jHBOjFQQ3SeoCPBsEoRWdALMFrbFOWxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FUTGoQ7x1584KMF/g9Rzh6+f5kYFFKQqfEaEGsNUfSg=; b=UwWgLdDM
 pwu71P+3Bzlt0S34ZuBBP+1Y9OX0Upn8hSBwws1M2ZuUd+K0buD+lrLtNV3T9MbQ
 bK1NwdAmV+HRY7qOv3kEQ5D2TVJptnslWiysfVQWZFZjGRMkUJp7Wl6MUvuIABsT
 ZJUrOY74psEu9msbHpfMf39KmrJrSUz1IuXhUIbDlgMZuaNi0J8rJ/4FZpdkmAnR
 ALFxvtR5bK0UaA7bjWnMXDc0vqGpX48ZpfCqD5vWCAHOHi2HwTn369csxvkFjmTs
 6WqjTOf5LEGfjiwCHH/z4K6a0//vuxgWmu2GI3UAG4SUmTBYFAiOTS4UsQeLG0Sl
 jgo6uwuWjrXFyw==
X-ME-Sender: <xms:dbsAXZgcCyDLHTEr5O2NABrqEbBAxRVnjaCRN8HprV3z7xYrDGHVWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:dbsAXdn7qWqubs_R7hPGDeoVptUsNorciV_v4mUC7PLkhdh3zjnC9Q>
 <xmx:dbsAXdbELF_6iF4shbNSH58wPwYFw_0SJldQvcxqkV0h8qzIAGxG5g>
 <xmx:dbsAXQyTEAmfZViWi3ssLgrpy9wJevRmPcuzCThi3Fwr5WIYfXYIQA>
 <xmx:dbsAXfZ0b_6YPcv1qLf0f5IWv_RfqYEUTBHhKAc0aI2hWgF5drwApA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47F1038008A;
 Wed, 12 Jun 2019 04:44:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:10 +0900
Message-Id: <20190612084422.5344-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/19] ALSA: fireworks: code refactoring for
	pcm.hw_params/hw_free
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

Two sets of callbacks for pcm.hw_params/hw_free but they have the same
codes. This commit unifies each of the callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_pcm.c | 45 ++++--------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index a66f6a381dac..398a6ad04c5f 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -219,7 +219,7 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
+static int pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_efw *efw = substream->private_data;
@@ -238,41 +238,8 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_efw *efw = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
-		mutex_lock(&efw->mutex);
-		++efw->substreams_counter;
-		mutex_unlock(&efw->mutex);
-	}
-
-	return 0;
-}
-
-static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_efw *efw = substream->private_data;
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
-		mutex_lock(&efw->mutex);
-		--efw->substreams_counter;
-		mutex_unlock(&efw->mutex);
-	}
-
-	snd_efw_stream_stop_duplex(efw);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
 
@@ -378,8 +345,8 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
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
@@ -390,8 +357,8 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
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
