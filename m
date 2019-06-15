Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EE46F3D
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F38F182D;
	Sat, 15 Jun 2019 11:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F38F182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590095;
	bh=8yWjQobY7zEhAEMAs+oMd3BHKvkQ0SNUvSvdH1isDMg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZnGkqC0FgzH393N7R08egbPE4Bmhx8ghB1qotKcXw4l7cl76sxEszM7sZfG+5qn2m
	 kGPztC6Pa57xVzfR1h0ijjutr2/8KGj3xzSIExwJ2BFFuQxcVWHWgLO8yOAdMkixbB
	 4Fk+DxOSHTEQNa2qx7NWHLNTqYfyhHUYDicteV5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E887F89739;
	Sat, 15 Jun 2019 11:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4516BF89714; Sat, 15 Jun 2019 11:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C55F8F89711
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55F8F89711
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Eo/Rd7g+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="zLs3cxDR"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8EF4F46A;
 Sat, 15 Jun 2019 05:11:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gJ7D3VvLW82pV
 8MLYlrx72+CAe3mdS/dje6j+Cuxe+8=; b=Eo/Rd7g+pc1AlTIhArP2g9oN1lvSU
 SU7YiBDJz6yK8w/QJm9Lfu5Nti++FvxEZLwqcWNdTyizn5+P0+chTPf1dqncuO9y
 Hm1jCsgrPuY1imT2HKcU5nNHi+C8Yfh5DdD2Wr0/NiPbY8YlIWtf2ts5eREmJPWt
 gEfEXxK9v5QbDiuRgB0i8Y6oeUX9duZnczWbJ5mvM8y6hQkfdUVnwg2ZoMZnyl46
 fbbPYeGfXqvuPxpn8JzlhmNNTsCvKA1PChGFvoMgRGcxYl888Qy2eEwSI8M1XFAW
 y7Mhdr5RnS59TcUpFuwDaJoCYIX3o+ySpRz0i2QO3dgtxNLvViWl2EcMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gJ7D3VvLW82pV8MLYlrx72+CAe3mdS/dje6j+Cuxe+8=; b=zLs3cxDR
 fbDXVwAxFMTUo36caS77ZDZX5jExgkXv1nWTffcvFB2tNQhWOvuRvL1uvxFttYco
 J1WMn+SBbG82vc/OnJtajxK+gMPVI2V7QA2aXz65c6fquL8y5802kRqrQXTpwgVX
 9lE4oxSPjlrzybeBHrQ2ANiRI7ixCy3VrKrxb8VcnR8ZLZbFtS2GYRE/XJ4cr/aw
 9OhwEH1dGhDcvclll+Ub4co4pryAgcE4dV8k+OJxgpU2vNctbVA/1ojkdJxTjQ2K
 aaZOJ0tlOTteZ0GkIhd6k4tZOp8iOtTy7SGmGY5Xzzkjcm6OBJTHkt2MKfrzpxbl
 cdk4xwU+aZQlEg==
X-ME-Sender: <xms:MbYEXVm95aGfOayTsbnm3e8XGpOK8GzvzqEJ6Go8WP9rNhiyDOVI7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MbYEXQqyM7dTbTVXP17th5XRu8SEvhFsKVTQ4mqyVMq307w4w9TT6g>
 <xmx:MbYEXeNRYs27IkHZ0B3RHR_I9B8p3gDl7sOb0GT6D3JaTtTNpPunNQ>
 <xmx:MbYEXSIou4Y_wc8WFfnK5SR9BbYldKd88jExIWMWrObN0Nu4YSGiwA>
 <xmx:MbYEXbkJButWKWRM-xZurbxO41E5c2zbPTevF5JyPpUVQuWXWxSN9Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A899E80060;
 Sat, 15 Jun 2019 05:11:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:10:58 +0900
Message-Id: <20190615091101.7515-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: bebob: change the range of critical
	section for stream data in PCM.hw_free callback
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

The operation of duplex streams should be in critical section.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 530db7a7844c..e21de44deaa9 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -213,14 +213,15 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_bebob *bebob = substream->private_data;
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
-		mutex_lock(&bebob->mutex);
+	mutex_lock(&bebob->mutex);
+
+	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
 		bebob->substreams_counter--;
-		mutex_unlock(&bebob->mutex);
-	}
 
 	snd_bebob_stream_stop_duplex(bebob);
 
+	mutex_unlock(&bebob->mutex);
+
 	return snd_pcm_lib_free_vmalloc_buffer(substream);
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
