Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C13A1758
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 16:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E01216DF;
	Wed,  9 Jun 2021 16:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E01216DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623249283;
	bh=l2Qtut3VbwZ6UM6Ttgeb7QGVD3my6oi3/TX10/O8b6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSGQV2dKkHbMTwyDonhRfiGfH/rg5qWAly1CWjziljK50Km2WPEru5sU90uQT0vTZ
	 MHVLAD8TLeSqCwaXL1XO5MXo9Hjaw3T1ggtJ3RxiZcp3d3mnVByz3xIr+jbmeC6rFy
	 X7ydy9BQQqgbDc0Ze5wKDqBMHaNFoS8I7A6nZWts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A4DF804D6;
	Wed,  9 Jun 2021 16:32:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52DBDF8032B; Wed,  9 Jun 2021 16:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85493F8026C
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85493F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bavGe0AN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kJf+KzwN"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 68AC9157A;
 Wed,  9 Jun 2021 10:31:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 09 Jun 2021 10:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oXvWhLbwOh/u0
 n7UxIKnxJd7w7AA/kV4i4aL6hsnj80=; b=bavGe0ANPIMohJflK+QdkEna+SfEc
 UmmgnRVWKrS6VIiGd+DjrqATsBZYF0lZSmeA/ZVotLzZTSQY04RPYgtHgOyd1t63
 8LiIT4ipXE2rZHe0MxQM9h0nCgWZgT4wlxEry3avAp0EQzoG9vbuqbjmJLmb9JdB
 +tkpQyQTW7k6LMzU+n1ljTEMKYD54DrQmJHw43MF2Td1N6mJor52kNlwUHNxjJDj
 CtHDBdtGU3cPEzvMaGYhhQwg0ssCJKJTwbbULlfhaaw0qsE0NeJxojjYkIc56ayw
 zH3aPdmac6E/J9gp2/e+fdIcfhAAqBk86zQuc52TpbkUf0Pbe+C+SrFuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oXvWhLbwOh/u0n7UxIKnxJd7w7AA/kV4i4aL6hsnj80=; b=kJf+KzwN
 WpTl/v6zmteZCv3mzq+PQzLbQt4qLObUpECkSx61xx2bFQsE5TWdU6FZg0BeBkcA
 n6KUSqD7D3I5w9yMApQOYg3uJP+3S9mpu1tfL79EIMf1WU89x+G94Lj9MPqZL8PI
 biSC1+Do71Nm36XrH0YkgWAQyAMmuB2ed1ggOzhYxQQPUxSo1DaIOvfk3zM0rjny
 R4KfbCh8J8NHdSlFEMWEs7pLzQF9aHjdersQsBSDXJorO24/iaWXLuBY9RdLZgzo
 +VBuakrfx2avt5pT8DLa1GlmSB9hNaTBkpqYRA7o5TOhhssqHU2yfwAsvFPFiaet
 9DSCznk8J6rMTA==
X-ME-Sender: <xms:3dDAYKSlDljdYjubPaiJfhFvO3EnBORy5YFHxXQMh0WCzSBhTshHrw>
 <xme:3dDAYPz6M9ov3aByjttLE7owzf-Tok7lBx2frUp9MoOCmGiIbp4Lf4abSk2rtn9Z1
 W47DlV9Y3klnTGj_HM>
X-ME-Received: <xmr:3dDAYH2dUHvykWG9eCcVKiQs5Bp_YFZSh0v5GWaiJZUtL8LJfKidmbGkKyrTm6fq9cei4fbKL99g65clxqHcKA7a_bYqOq6K0makAYf3bgXrjkfVgsNp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:3dDAYGDI8MiT2-TrRzIs5TuGyC3eMOnK_Q6VIL8yv8Ql8ozpfXxsfQ>
 <xmx:3dDAYDhVTxc8tk7480r2lJayF3b9wqI6bp4rU7rifwxB2bErjUrp1g>
 <xmx:3dDAYCo13tPKidWHnzQ2CZXLQ9qCQqOYiXCPJoofFPhAW2tRKqdOFg>
 <xmx:3tDAYLZ_tCTBT90vj1iPe4EBh-86JKnel1oZsmUTCmbyp-3JnOXQag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 10:31:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 3/3] ALSA: firewire-lib: obsolete workqueue for period
 update
Date: Wed,  9 Jun 2021 23:31:45 +0900
Message-Id: <20210609143145.146680-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
References: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
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

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 15 ---------------
 sound/firewire/amdtp-stream.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 426a85b56cf1..1d9bc7b07df1 100644
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

