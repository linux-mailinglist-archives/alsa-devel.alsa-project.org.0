Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D62CE013
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A8116A1;
	Mon,  7 Oct 2019 13:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A8116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570447154;
	bh=VMA5xaD7rzzZ9CgRd6GgPWOL93Bzx2LNF1Q8CqmeBWg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0ZLMK1j71cGKQO0Jv29nZXKNI0UTZny088rcfoiBo6hLhTspgUj2hL2utMNKW5U+
	 uhF9Bs5U0vgS+lIS7jZUkeMOFouWeWyzwd79ET9zmsmlISeFsA7e0k3MfY+ih2qJE1
	 xmn0UcG9UgOy/jVn6bTVStwL5sTe2PuJs9QCn8gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14AC7F8076C;
	Mon,  7 Oct 2019 13:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77E3FF8071F; Mon,  7 Oct 2019 13:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8FDF8070D
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8FDF8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Kp+319c/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Za+Q5kPj"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 701BC200E3;
 Mon,  7 Oct 2019 07:06:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Zxz5MssRiSYHQ
 lWq6QzyIEXfqIoxF4HWLqkepVWh8Eg=; b=Kp+319c/oEtDCPqciHQGWtrwCBlPa
 a8frl8ppa+tkRRwQlYPLlpp0h0FKO2M3pTxEA+4vNH4yVzSwYNqUIrUGObyxNpFA
 vCJHYVqW9XSi594KBa2lAAAzsW7sUktH1XNZEIkYXpz3oKqxTYCqUh846hiX9OlX
 ERdolb/GSrBaU2RbMTNgrTqJcAc26vUlmKB5kMPhAOmfe/DYCBttfyLhA07K4nBo
 Due/87Gwj3f4JECeK4gqPY9KyAHjj9laa6MRi+nPHKNtTokUeR+O43XLLUE9tQsS
 0Ghkd7LW6rA4SsnE8poF5NQIrHZK3JrH+ohlV20VyN4XHQC3ogA2oNF/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Zxz5MssRiSYHQlWq6QzyIEXfqIoxF4HWLqkepVWh8Eg=; b=Za+Q5kPj
 9a1BD9AyFRLVmfUVZYRqKQ+uQ9zwtnn4p4xWt0/ceIWCoSb3ctMfpU5Id+oH6rSt
 o7vKkvuWf1MeS+vmcpmn1QcbkbQotj+QBxCVP1h3CyE18c5cHm4o16o9bbvLwfKZ
 G4rv6kZDc7HzK72bDwwyhKvsffTwNUkOyMf4HEfEFWfbzVDRbShkgcb7P/Q+z0xI
 w2yF5vSjdgaULQb35x1bWDNjWvqR7TSK6IhWhDP3lkDdyFplZC4acpngxnhCKQMP
 IO9QU4x7Qg7YeUM/6ROdMaH8T7+Gir0ebWAXnaoIykFHA8nX4mH2OWKPUNfwZrsZ
 ZVoJQNrpnCNSwQ==
X-ME-Sender: <xms:GhybXcCLgG4yOGQTMYnapFAHlIbyDexMSMq3zczIv8A2ltui6llz1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:GhybXfzh99z_g9YvnKURIKRTIMIvNCK_Iw_Vr6dln1KssDXmy9i3CQ>
 <xmx:GhybXYfzBuQ_PDPRe7OdHu4ScLWLPNbuYGBHI4cCstyAivN4UjimEA>
 <xmx:GhybXZzk78whQcaz0WQ9CPmHrJYsENvDBAosqPL91CBmZw2CwKCEvw>
 <xmx:GhybXWP1creHK0SPDPjXVD42TW7uz5wxncnsLs_i1fHvaJknht9JSA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1219F80065;
 Mon,  7 Oct 2019 07:06:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:32 +0900
Message-Id: <20191007110532.30270-18-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 17/17] fireface: use the same size of period
	for PCM substreams in AMDTP streams
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

In current implementation, when opening a PCM substream, it's needed to
check whether the opposite PCM substream runs. This is to assign
effectual constraints (e.g. sampling rate) to opened PCM substream.

The number of PCM substreams on AMDTP streams in domain is recorded in
own structure. Usage of this count is an alternative of the above check.
This is better because the count is incremented in pcm.hw_params earlier
than pcm.trigger.

This commit replaces the check with the substream count and the value for
the size of PCM period. Unlike the other drivers in ALSA firewire stack,
no MIDI substream is multiplexed into AMDTP stream.

I note that Fireface AMDTP protocol has a quirk that tx stream includes
blank isochronous cycle. The packet for blank cycle is equivalent to
empty or NODATA packet in IEC 61883-6, thus the protocol is similar to
blocking transmission method of IEC 61883-6. On the other hand, rx
stream adopts non-blocking transmission method. Although the difference
of transmission method between tx/rx streams precisely brings different
timing for a certain amount of events due to their different calculation
for data blocks per packet, it's possible to approximate enough amount
of events mostly has the same timing. Actually current ALSA IEC 61883-1/6
engine uses large amount of data blocks for each hardware IRQ
(=16 packets).

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-pcm.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 4f2208202494..415bc9ccd1c7 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -139,6 +139,7 @@ static int pcm_init_hw_params(struct snd_ff *ff,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_ff *ff = substream->private_data;
+	struct amdtp_domain *d = &ff->domain;
 	unsigned int rate;
 	enum snd_ff_clock_src src;
 	int i, err;
@@ -155,16 +156,21 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto release_lock;
 
+	mutex_lock(&ff->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
 	if (src != SND_FF_CLOCK_SRC_INTERNAL) {
 		for (i = 0; i < CIP_SFC_COUNT; ++i) {
 			if (amdtp_rate_table[i] == rate)
 				break;
 		}
-		/*
-		 * The unit is configured at sampling frequency which packet
-		 * streaming engine can't support.
-		 */
+
+		// The unit is configured at sampling frequency which packet
+		// streaming engine can't support.
 		if (i >= CIP_SFC_COUNT) {
+			mutex_unlock(&ff->mutex);
 			err = -EIO;
 			goto release_lock;
 		}
@@ -172,14 +178,25 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		substream->runtime->hw.rate_min = rate;
 		substream->runtime->hw.rate_max = rate;
 	} else {
-		if (amdtp_stream_pcm_running(&ff->rx_stream) ||
-		    amdtp_stream_pcm_running(&ff->tx_stream)) {
+		if (ff->substreams_counter > 0) {
+			unsigned int frames_per_period = d->events_per_period;
+
 			rate = amdtp_rate_table[ff->rx_stream.sfc];
 			substream->runtime->hw.rate_min = rate;
 			substream->runtime->hw.rate_max = rate;
+
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&ff->mutex);
+				goto release_lock;
+			}
 		}
 	}
 
+	mutex_unlock(&ff->mutex);
+
 	snd_pcm_set_sync(substream);
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
