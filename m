Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3732270
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6FC11680;
	Sun,  2 Jun 2019 09:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6FC11680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460309;
	bh=60vidDCW/wCPbivO86BdzksIeW3i+hkKknqfVromCWU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcTHu7zqWiETYiXf2SIk+XjVYWyBT7kUjzx7YtIktTYJxo82iWCplGD0/yL+dHCOO
	 99/Y89jCwsiBramQJRNbpDFM06EYMrb+fOjKgXXpymM4jbRSTR+L/rtxosafObIVuU
	 LGgxKLWTGEdmcRXahZSmsq6BTNixatJywshUhuvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE5DF89786;
	Sun,  2 Jun 2019 09:13:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBBB2F8975E; Sun,  2 Jun 2019 09:13:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7EF7F89756
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7EF7F89756
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="f/l33zW+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="peaC16XI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DD31D20E7B;
 Sun,  2 Jun 2019 03:13:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=K8WKRCA+r5NSx
 I9G2/VoQHMQqtjwWFDDUgrr+tvWT+0=; b=f/l33zW+3TSgzNn4rSq30ZKJL6RJU
 srGOP4CNyRHrVyIlUDuCAQD242Y1K8eIEiUDsCpji4Hhw3DhyaxZ7VFCjN5HnquI
 +d91CWRLQCdvPnAJTL49VCyN6MSmYTHqllYLBQQxpWDlqkTdQ56QhCD/A652sYqs
 8wonp73P54P5NLubdWlPtclBP4BC7jXb4uxWBOa74c0bax7Yakbo8X2WRI18ZEON
 LfBWrEo+Sqfj9n0iY+05m0tYnMZvNRShpw7WJzE5huCQUSyZoSkVOpA00hK2pFa8
 GI9UbZmmmfKT/PozghMCSS1MPm28kbTHUduUmCHwK7s9HoOMNjsMxQ1qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=K8WKRCA+r5NSxI9G2/VoQHMQqtjwWFDDUgrr+tvWT+0=; b=peaC16XI
 8HmaOcUeFzPyYwwloeCXWZ2+Mug9oS7ms5h/CtVSYZgiFMQFBM+kzwGZ6YbbeyzV
 l03vZONzft5NS02oa9wUR90Ip47AkfEoYjmxNOoB40TiDQ6QVnhSS6CsrGSuGvg8
 jobYTIAPuowdeG4QU71SQvTMyWoAY5jpMdSOVdGi6HgblUx9HG2+bwnRO2+1MUcr
 FtoAi59R1T1MLXThbM++BYbb6SqQ+UFK3JXLsjBEUVEmZkFsFgL/cRCDaQUmoMOY
 KM3LzYhI4lf1eiy8tj45B6kxd0Fhy+whO+NNj1O/8DjdYGDwIjw02KthItMADUpD
 NY5MI1wVppzVdw==
X-ME-Sender: <xms:F3fzXBaBSnzUIg6OvuaLLe7yWJj2tsSTx1U_mAKUnthDPSEBw7g5MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:F3fzXCbY42SjPdsVU696_xJVUq-5PuKqSt0SlPsG2PZKixva-b164g>
 <xmx:F3fzXKm6ewjwc3kkvzc1t9oprJifZlFqqBcpG0IxkAm3GQ-wYHQrhg>
 <xmx:F3fzXN1N5kgau9Wm8JgHkjXrhVL6d0jWLlsSVGbbL8gkGfC18a70JA>
 <xmx:F3fzXPDKzILZUj3RNE0E_qjAhCtGc9RLzHnABTUw5CyJSgocZJZuXQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7720980059;
 Sun,  2 Jun 2019 03:13:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:59 +0900
Message-Id: <20190602071259.21622-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 15/15] ALSA: fireface: code refactoring for
	pcm.hw_params/hw_free callbacks
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
 sound/firewire/fireface/ff-pcm.c | 55 ++++----------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 53477404a58f..938985c2d4a8 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -199,8 +199,8 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_ff *ff = substream->private_data;
 	int err;
@@ -223,48 +223,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_ff *ff = substream->private_data;
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
-		mutex_lock(&ff->mutex);
-		err = snd_ff_stream_reserve_duplex(ff, rate);
-		if (err >= 0)
-			++ff->substreams_counter;
-		mutex_unlock(&ff->mutex);
-	}
-
-	return 0;
-}
-
-static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_ff *ff = substream->private_data;
-
-	mutex_lock(&ff->mutex);
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		--ff->substreams_counter;
-
-	snd_ff_stream_stop_duplex(ff);
-	snd_ff_stream_release_duplex(ff);
-
-	mutex_unlock(&ff->mutex);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-
-static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_ff *ff = substream->private_data;
 
@@ -385,8 +344,8 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
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
@@ -397,8 +356,8 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
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
