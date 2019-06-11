Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5F3CCFE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE311763;
	Tue, 11 Jun 2019 15:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE311763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259887;
	bh=ax8cv2jb86vX52ppq11mgWsE0r6IZWNzIMUBRIurU9s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCeOf5Fd/gyS9V/xzVBb0URLwqjiLp26nQ+EqOO40QZL+EO3lPCAGwLQfz3K6XbIx
	 CDTHZnLxk200MuFoMCE3xYylG48BZcEQihCRu0SRcIwOcpZ53T/y8fBlr8+YhVmiuT
	 op3ifgNQl33Fwu4tiSt+OqVrjH65btCRMQgA6QAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA40F8976E;
	Tue, 11 Jun 2019 15:22:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5A6F8974A; Tue, 11 Jun 2019 15:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6B36F89733
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B36F89733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lDB32E6U"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ECBRU5f2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DCB8420A3C;
 Tue, 11 Jun 2019 09:21:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=asBHAlIE0CZ8Q
 0Zgidif0+AmrxXvFh7uvx3Su/8Lxzc=; b=lDB32E6U6+7HtXFAXSPBMxcZh4jP3
 WlgsBHeJCocfwXMx59aYHF2sRbt3/8rlP2YTOYqbS556Y8mMdeq23ONUJUPdVY2X
 GAyJYT9OxnMCfoJornSJZQMq0/u9y4qdZpWkq5lJgJsbSM/Fsj+OrASXaCa8j898
 WhQqY2/Dy/ps7HwP4BFL3NtwZ+ISGO4wsJQ1j6lb30QtqwgMTZLmLo/ceS6ke7Gl
 YJ1iMN6xgPVIOXO8toeFtFOw7fULEfR1Gi62QRkBxamzYe/o2UCrypeXmq8ApaHs
 zJ1xvdvfV9+V0UOQA2PVUieuFnLTedeWfm6Tv8Ma4p10s7hXHSKWVWn+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=asBHAlIE0CZ8Q0Zgidif0+AmrxXvFh7uvx3Su/8Lxzc=; b=ECBRU5f2
 ObpjPgJ/FSnM7QgCKbRXkrAi8WYNQ8Av73RyLPHMnQZ7Rt0WdLmmDbdLgyCvHNe2
 Oi0bmgdwY/jRrtPc1fnuV8fKFzfoKQrlpOOeVMpuenD0ijWerUExZbcLO65oa489
 2wXOOctDOV61yb5jBv6v7bEQNDqiR+TbNHOexbMAISCSMLCoF0ZqDUKCdAuPBo8w
 /sxo482SFdmLjS2pGgUk014jAqHawWZfzxkmtY6+O/KpdCsRdFPo+UIHpdV4smMt
 o6XNL3NI6Z9GYAZxyhxb7aMGDPtSoaYuDDvTieb7TIAgePTnuhzgOC2kvgwBC/D1
 WJsk88ligBX8VQ==
X-ME-Sender: <xms:6Kr_XC2CKSGgtkXKezQBs8g3Umf16ihgbSAGh9ckaciQvc8UTTR4Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeple
X-ME-Proxy: <xmx:6Kr_XN7pd8Hjwd7V3jPGZkp8Jxm9bwi_yNinx8v4n8qOq-82LvSM5w>
 <xmx:6Kr_XBf1-sjRFfvh3JSzByq8QVH_3DXqSRsJ1S3-lVrA9l7xeQU-zg>
 <xmx:6Kr_XBOaRN6z-8s5H0t8BW1ydSDkUvygAv11TrNsGcoK18TWFkKyLQ>
 <xmx:6Kr_XAnQiEpoFVzPYoNHV0-z8Puq0LPaD6sPni8ydu7EbNy2bAM44A>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7FA6238008F;
 Tue, 11 Jun 2019 09:21:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:18 +0900
Message-Id: <20190611132118.8378-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/12] ALSA: dice: code refactoring for
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
 sound/firewire/dice/dice-pcm.c | 54 +++++-----------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 6c7a6b7ed743..00b55dfc3b2c 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -231,8 +231,8 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int capture_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_dice *dice = substream->private_data;
 	int err;
@@ -254,48 +254,8 @@ static int capture_hw_params(struct snd_pcm_substream *substream,
 
 	return err;
 }
-static int playback_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_dice *dice = substream->private_data;
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
-		mutex_lock(&dice->mutex);
-		err = snd_dice_stream_reserve_duplex(dice, rate);
-		if (err >= 0)
-			++dice->substreams_counter;
-		mutex_unlock(&dice->mutex);
-	}
-
-	return err;
-}
-
-static int capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_dice *dice = substream->private_data;
-
-	mutex_lock(&dice->mutex);
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		--dice->substreams_counter;
-
-	snd_dice_stream_stop_duplex(dice);
-	snd_dice_stream_release_duplex(dice);
-
-	mutex_unlock(&dice->mutex);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
 
-static int playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_dice *dice = substream->private_data;
 
@@ -415,8 +375,8 @@ int snd_dice_create_pcm(struct snd_dice *dice)
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
@@ -427,8 +387,8 @@ int snd_dice_create_pcm(struct snd_dice *dice)
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
