Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC63A08FC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 03:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C9A16E9;
	Wed,  9 Jun 2021 03:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C9A16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623201941;
	bh=l2Qtut3VbwZ6UM6Ttgeb7QGVD3my6oi3/TX10/O8b6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZeNyhvfj26S+RAS6T2Y3jtv/5FG2FeVAcnDX2pCwbINgoZ+dEcp+xJOl3sMhgEJ3N
	 Wnd4wbt+vwGHjQtIIZIMb/2eMoLgkHd3m/QHKXIUBPPigxBDqDNRQwmWTu/YFEwraS
	 25XSNi3sp4JiHnYvLe4qOGwtOFBwnQ+o5eTWUIwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E31FDF804D2;
	Wed,  9 Jun 2021 03:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E50A1F80218; Wed,  9 Jun 2021 03:23:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30AE0F801EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 03:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30AE0F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OpDzqIWk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oVjB6iDi"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 820D62092;
 Tue,  8 Jun 2021 21:22:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Jun 2021 21:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oXvWhLbwOh/u0
 n7UxIKnxJd7w7AA/kV4i4aL6hsnj80=; b=OpDzqIWkb0lnvOUZW4VJMJ3a4x48G
 8r3CI8hQN6dTf/2GlM/r3PkLflgwPXw7nPbEKix45hZkjKE1CBfRCXp6LjQzHuCG
 NdAXWLdwyGpCjMk9bLZoU2I7D0BmieGuYo4WN490t8rSiStE+OAnhWJJVk0KIqwG
 i0UP8qPpuWCOQXDiha6ez+pT4up73TO4yrLb4OfKwlLT/30joBwd4VCVC1xZZrJe
 r2R/SXWIkb5LYUq9XanM5qS4G+B7Qe31fRXBz4ETS0OYipLiqD83GCf3YY3Dp2gd
 f6opRVuxPq1wlpLHqeJ+mukkjA5XaQVWdkYdDyLxGGvXxgNZNWHVM7uWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oXvWhLbwOh/u0n7UxIKnxJd7w7AA/kV4i4aL6hsnj80=; b=oVjB6iDi
 ry4ny2UNxl/oG6IwPDd4yHL9MwrFzOb+bDUFP0OG9060IKawPwL510WfF5S3TTuF
 EEtRThZvvgPjmENQAx4YnckijfS1IytgyNVKHLKp/e5+d0ni7CmlEECE1qGCIf+C
 Kr3AxFbuxIF+RmkZipEmNGp6QCnLr1dPlZwLqrt6aqd3Jy6WAU/FMEbq1xbhUU8g
 JqRxgTDl+PL/9fUn13T87YIb3EmzBVHxz4qIcdbim8dSQ5wW75NprC4EmNXIz3ji
 JBwkvtsGpwJcaqROdzGERE6AMKs7KFAqVTuhAT8C3hhOaRb2VbOkAKl10mP9P7f1
 PkKPLKJzCvpp1w==
X-ME-Sender: <xms:8hfAYPTNgyFr-IQTjTZW4-Il2FTyBMvinhFiYt2mu-ksjwOsKqc-2g>
 <xme:8hfAYAwFDm3msj_zfqDVRkTi1TBPTzWmKuybiFfb_2n4VfwfXGQqrMOcMM34_LVWF
 RVSYUAuA6ITq8d1Q5Y>
X-ME-Received: <xmr:8hfAYE1G8Q30_5EZLgBAPEaNmWsjADYZiiJW5Q7i6NBrjqAe27_rY3WOevHaIq_7wX7JiRGJIbrzgA33LPHJ0O9aT7vgEZ8BiQegM1YS2uj3FYT6Tk20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8hfAYPCIw46G7xYn4DWCUA4HdtIymHJpsZqoykESfc0TVdBoCuo3eQ>
 <xmx:8hfAYIiyzA9DjJZiSo17PWzVPZNAWE1z4CWtliJPTUmNJu__hRoC1g>
 <xmx:8hfAYDrQ1Ki2gUf38v1QvGet7ntJ2Bnxx31d6VJVG5_JafkmNEfCsQ>
 <xmx:8hfAYEbCSM_wG1hO3k5Onh-lmg-3pY86syS-bSA0CPOuTaE-cQkfsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 21:22:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-lib: obsolete workqueue for period update
Date: Wed,  9 Jun 2021 10:22:44 +0900
Message-Id: <20210609012244.24296-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
References: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
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

