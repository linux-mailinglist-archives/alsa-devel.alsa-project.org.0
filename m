Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3E39CE62
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 11:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D321216B6;
	Sun,  6 Jun 2021 11:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D321216B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622971274;
	bh=yBsPCfgXFVIAbtxHN5ME7XC3PSyuPcKV3PBsl45Ht+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eoo/Un/suD6U4nLAhusaZavcK3NFZbr34WmsTl0PL/U7+se6Mj/cPSm7Q+NlPIIEk
	 ykIyWju/lvKNxUkDy28jrWTVls2MfoSkbdvJU5l7PNASyKSycyXNEhSUF4Gc9oH1nL
	 lyAwVgcEpvB/K0z/SHfk+FNPMuCQO5c4rLFDyvIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E6FF804C2;
	Sun,  6 Jun 2021 11:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D343F804AD; Sun,  6 Jun 2021 11:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DF07F80218
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 11:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DF07F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="l4e2THQV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Gfr/WZNM"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 78C4A5C01B4;
 Sun,  6 Jun 2021 05:18:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 06 Jun 2021 05:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eeUQAUXZsE+Q4
 Yv0jnFg7asD5FuC06naD0KIaBOaTdQ=; b=l4e2THQVTX5hQGIkPa78BGRHmv6ib
 k5HhUcQaMc92FL2/4fVgvIGal6m0gykX+cGA1cFCZt//MmrtTFQ1MgP4h8Uu9Df4
 VnonaV64GfIkHq5FVzEnAtiQd4w1MAQJvwOPKqVCTJYbJ3SUCKHrvkEoePpDd17/
 KIn8ouluxyrrh+L0lyQKKvJJGkRxQAxUblvn5Isx/obQTV5H1XQHr1OQCtCYKMo0
 F9LORnqlDCvw9XRK1rDQZ3nhpjgxuoRRF9rqYtWs64DGbF6nPEHYS2drhEuZM50m
 UjiTbnM5rcv9yO8CB6bdFVbLqv5hCc81Mb4g6m8MuIHE9FU1XkFOqH6HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eeUQAUXZsE+Q4Yv0jnFg7asD5FuC06naD0KIaBOaTdQ=; b=Gfr/WZNM
 40/H86eOV2dCA2F1YPRLKVwKkcAKxmzur1/FcMKUW9SpSqJjO6OJxitbY2vsy/Oq
 Fi89dOzQ9FAoCnbz5KaHx1UraRnXKZ9/jPb8Hy85Ixb99VV0AHKsfWLwL072GH9R
 JvaXTnalYaqlGfOST8mkqU9B+bDAWuz3QFOrzaV30jXxSp0Qul6DHQgyzU+zGnmP
 G7wcMoksqlSTpD9zujMgYqcXfv84ZFZJVmhac/sD9in6ntdsv9VyS8KIbMHlu7jn
 Fg/6KrNBTAX6hYH872O4rlxa9t+eMmvBtHCAZV44mRExxxhCHexsuq50VW83qMz0
 qGaa2JvrkihFew==
X-ME-Sender: <xms:-ZK8YMpa-Lm0WCfNcDvExRFkw9asmkykzr_eD6jIpnjW-r6gLAxQsA>
 <xme:-ZK8YCpAfnYZ1cZeucrQ5ak2zPASoTnlzAUjnkVCTizKByJ-mUvV71mwU5tnLwfQN
 OQJWkSmymvyfFWx6yg>
X-ME-Received: <xmr:-ZK8YBNmf2sfcDaY3jvCGScUpoLZPODBypO6YDZUXidcZ2AnA_27Jb3tstPCrJE-g4agHZp_t5G8YAUhy1pK1XIzeDSq_4bNHrmLZ8jnQxTzGEtq7mkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedthedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-ZK8YD70WhMskcuA2MJbilrMhSO-_VkDxdqOc32nFCaZunvxZL4hZw>
 <xmx:-ZK8YL52lR6XNdTSuPR4EczxQpcPpwjDFCXj5oTz2VHiw-qmk2Y3YA>
 <xmx:-ZK8YDjfYAogmgieAqSFSPJXcx9lIWJ7SH2JtOJWH__j-NJ7ANFA7w>
 <xmx:-ZK8YFQJueZGQibJslj_RChWWbHp_SBz4aO3a852sp4PHXnhsaLc-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 05:18:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [RFC][PATCH 3/3] ALSA: firewire-lib: obsolete workqueue for period
 update
Date: Sun,  6 Jun 2021 18:18:38 +0900
Message-Id: <20210606091838.80812-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
References: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

The workqueue to notify PCM period elapse is not used anymore.
---
 sound/firewire/amdtp-stream.c | 15 ---------------
 sound/firewire/amdtp-stream.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b39328eab67e..7946d5e800c1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -77,8 +77,6 @@
 // overrun. Actual device can skip more, then this module stops the packet streaming.
 #define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES	5
 
-static void pcm_period_work(struct work_struct *work);
-
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
  * @s: the AMDTP stream to initialize
@@ -107,7 +105,6 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->flags = flags;
 	s->context = ERR_PTR(-1);
 	mutex_init(&s->mutex);
-	INIT_WORK(&s->period_work, pcm_period_work);
 	s->packet_index = 0;
 
 	init_waitqueue_head(&s->ready_wait);
@@ -346,7 +343,6 @@ EXPORT_SYMBOL(amdtp_stream_get_max_payload);
  */
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 {
-	cancel_work_sync(&s->period_work);
 	s->pcm_buffer_pointer = 0;
 	s->pcm_period_pointer = 0;
 }
@@ -626,16 +622,6 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 	}
 }
 
-static void pcm_period_work(struct work_struct *work)
-{
-	struct amdtp_stream *s = container_of(work, struct amdtp_stream,
-					      period_work);
-	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
-
-	if (pcm)
-		snd_pcm_period_elapsed(pcm);
-}
-
 static int queue_packet(struct amdtp_stream *s, struct fw_iso_packet *params,
 			bool sched_irq)
 {
@@ -1808,7 +1794,6 @@ static void amdtp_stream_stop(struct amdtp_stream *s)
 		return;
 	}
 
-	cancel_work_sync(&s->period_work);
 	fw_iso_context_stop(s->context);
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index b25592d5f6af..1f957c946c95 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -186,7 +186,6 @@ struct amdtp_stream {
 
 	/* For a PCM substream processing. */
 	struct snd_pcm_substream *pcm;
-	struct work_struct period_work;
 	snd_pcm_uframes_t pcm_buffer_pointer;
 	unsigned int pcm_period_pointer;
 
-- 
2.27.0

