Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0447C22
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F66175E;
	Mon, 17 Jun 2019 10:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F66175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759789;
	bh=OgxFAh6JwjgCwh3uPqU5QcWHTHxh1awle0SPYqDmvjc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsPCmOo3t9PeXpdtFXE0M5VASE6kSG8NVht3gGMiNTazxeCaponqwquR/oh7HiVth
	 NwtRJb9MDJEr2QfsXgIRayHKJcln7hSgEFtpJSavGrKLTm2++Xv1nrdD/49kiyNtVM
	 +I3hT1phWFbEEW6c7apHRDf9okbOdwNXWuOZirjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12841F8975A;
	Mon, 17 Jun 2019 10:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA37F80764; Mon, 17 Jun 2019 10:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB153F89739
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB153F89739
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Yn+22299"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="zo1nCidY"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 29FD5755;
 Mon, 17 Jun 2019 04:15:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=U23GM6M3i9NKb
 CDjWX/JHbaBL7DmpVhKMru0EUgAZqY=; b=Yn+22299z6aZHDwUF8tG7D7bgxejl
 Hvq/5mY7mnTMdm+zJCFexX1f4jxSPUb3slr/+7Qw4KliwPvauGUbp3wgfWEkUwz6
 Jqh06ep+Kz+RkbL3M5Fwf+1XoC4tvjoj35peqqQyWA3x/vhl5MgzNhi8dkWtDLhM
 J7co+3joe8nVKZ7e0xoMdSZup9OiWjn9gi+7BEaJuqpa5JxOZwImYAGPdx7Oo9/Z
 6GAUCK2ewbZRLAmL/EFuDOIpKUEy8aWf+WBYRAl/2mI7TFcxcVuEc5ueVXsOLq4M
 AlbHoGqRWhMiRL0qhO/ie74Z+iqMR+5ouodmknSdHBWQqywCSAXwVkxzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=U23GM6M3i9NKbCDjWX/JHbaBL7DmpVhKMru0EUgAZqY=; b=zo1nCidY
 6LCDMdfPa7NmeArdUNHb+2JZB4cMNlt+6pyjM6TlcY/5OZZkrRDivqIrTnmWZgnF
 05WypnqnD+q7m6kecK+cMwESUO4q3qdrYgHvReXlWLqBdZY/rUEtxQ7f2rkzkIn7
 3VyBUjm+VRAOWxMmeN+8o0UK/dPACFMGmVDV0KAo5pVAq9dNKBBiNE8mLwwf6Xs4
 q3kkVtScZ09EbzFIV6qxsrR/it3GZsvyrWSwPm8PNoYggjPzL64XfyzrIdeZQalt
 wIi1x+l0d1pUtwhAamydypMHxkjqugiItK2NEniJU6roHMy95Z+eV7ArH6QCdWs7
 ArSRbBhTQDRwxA==
X-ME-Sender: <xms:IkwHXTBOq82QsGSeACiwLoqrtY5dLmzesGUs67-KoMqX3xW8ZKHg4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:IkwHXazrSMr6sE-M0MRBcWGGtxdHp18WVMOFJjvmWHZTxEEuQOUZCA>
 <xmx:IkwHXT6b-FwCJTRMUd0qQyip2VpzoOvTVXs5ZnBXo5Ciu-1ojin5AQ>
 <xmx:IkwHXTtftKFKmCyiI8F7H3bdUYH9-eEN4YzGylpTeF-GnGWte5wL3A>
 <xmx:IkwHXUOIa2KnrvUgrqGOGqMMyZH6ml-hc__-YMF4rxxdPThxxp-rjw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6529580063;
 Mon, 17 Jun 2019 04:15:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:10 +0900
Message-Id: <20190617081510.11025-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/10] ALSA: firewire-motu: code refactoring
	for pcm.hw_params/hw_free callbacks
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

The pairs of pcm.hw_params callbacks and .hw_free callbacks for both
direction have no differences.

This commit unifies the pairs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c | 54 +++++-----------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index d4e75d3ee928..b9852c911b98 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -190,8 +190,8 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int capture_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_motu *motu = substream->private_data;
 	int err;
@@ -213,48 +213,8 @@ static int capture_hw_params(struct snd_pcm_substream *substream,
 
 	return err;
 }
-static int playback_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_motu *motu = substream->private_data;
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
-		mutex_lock(&motu->mutex);
-		err = snd_motu_stream_reserve_duplex(motu, rate);
-		if (err >= 0)
-			++motu->substreams_counter;
-		mutex_unlock(&motu->mutex);
-	}
-
-	return err;
-}
-
-static int capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_motu *motu = substream->private_data;
-
-	mutex_lock(&motu->mutex);
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		--motu->substreams_counter;
-
-	snd_motu_stream_stop_duplex(motu);
-	snd_motu_stream_release_duplex(motu);
-
-	mutex_unlock(&motu->mutex);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
 
-static int playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
@@ -366,8 +326,8 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 		.open      = pcm_open,
 		.close     = pcm_close,
 		.ioctl     = snd_pcm_lib_ioctl,
-		.hw_params = capture_hw_params,
-		.hw_free   = capture_hw_free,
+		.hw_params = pcm_hw_params,
+		.hw_free   = pcm_hw_free,
 		.prepare   = capture_prepare,
 		.trigger   = capture_trigger,
 		.pointer   = capture_pointer,
@@ -378,8 +338,8 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 		.open      = pcm_open,
 		.close     = pcm_close,
 		.ioctl     = snd_pcm_lib_ioctl,
-		.hw_params = playback_hw_params,
-		.hw_free   = playback_hw_free,
+		.hw_params = pcm_hw_params,
+		.hw_free   = pcm_hw_free,
 		.prepare   = playback_prepare,
 		.trigger   = playback_trigger,
 		.pointer   = playback_pointer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
