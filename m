Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8031CA259
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E016E17CF;
	Fri,  8 May 2020 06:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E016E17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912880;
	bh=qikyN8pYwphDCdtvzHKhxpi+alVPeXxSeLcP8Tr8ijQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqbHnze6RRAm586Kr5GMK2nzhXoScknt6itXnjYBcoJ4MuiIwNZRA/JOKSPduDRxu
	 rr6dK8WIHaXzMXSQmej122zu42TEqdwcSrHE31kVLHgqGjb7CwHI+PrZpDnb6b8Jvu
	 SX6aDXrKYjah3gBIsTFUKE+EUyKROEiE9HFTO5eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F030F8028F;
	Fri,  8 May 2020 06:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B52F8029B; Fri,  8 May 2020 06:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 115EBF80249
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 115EBF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iX4obR7Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gObViqA5"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7040DAC3;
 Fri,  8 May 2020 00:36:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=uGkKe+5PhGDWN
 U1zI5sLFDmumQSm/b+21/BkdGFJ/9s=; b=iX4obR7QRzAWbZJIk/5DPHNr2Xyb2
 K+geIKb3lnlL/S7zJWamjYt6DGjDZXjZYdXYPFf5EbVsHxBwSzVLKYb873Qa2bwp
 pkroriTZid5DrQzEm1ECcjZf+skBKuG0q7SpKPyInozs5CLijF0ZgqhlgmHq93VB
 gQmmv5T5erZotCvJf+7qT/IU1+mEL+ShF0tAHRBwzuWhFpYzHQXElcFFRIfeYwDY
 DQ0ndFYYOS2LJFoJ3LZ+FzaQpGxZxxE6kH5rm6zWnzOHXTEvkFM9ykuok/eXWS08
 GLqGFoJHi14p4ivNSlRWAQHjnl9zjb9+KKs5Plc5Imf+aiitR4SUOVVCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uGkKe+5PhGDWNU1zI5sLFDmumQSm/b+21/BkdGFJ/9s=; b=gObViqA5
 rC/3zk4TajKlb4sf+E3rvcGnF1XifNNt+vYpuiR0YwTLG2tdh2iSs3caZOYl7MLH
 7t90iJBF6BBYjpteggC0Yj6pBjLENHWiC4BngfJ0NmxX77YRfahDgr7NX18rdBjG
 WuZmTU9HBOZQO0bl1IVRKg6yaOAZoAMwhuvD1FXzOS8L/+lEKEZGNzR2vpf/p1Kz
 nkm2li79HCsY+uqtwoMxmhUG/Pj9xbZFknZZtu8R4VqfJmkVaPhtDZZAZWXxAvu8
 3v2LZS37fUaFPKEyX54JvcG72w4xH94MKQZ3fuAe9/ExVeaHJAid/Ct6t/UmHNge
 ie3DbUPAzbg7Rw==
X-ME-Sender: <xms:2uG0Xu6bVT2hcIhCj4qJmmlPSIfKeErG79spAtOXMLcgPtLHPQ5uTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeiveffvdehue
 dtlefffeegiedutedtvdejfeduteevueelheeuvdetveejtedtgeenucffohhmrghinhep
 rhigrdgvvhgvnhhtshenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrh
 fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2uG0XsItGMz3YKCLTt5ifMpIHkcesqLAo6mSmVElLScImP6219k0Xw>
 <xmx:2uG0Xoe06sspNUMvqucEQQcyhgiopeiSD82u1rWDd_sWJWxLXLwrxw>
 <xmx:2uG0Xvcwkz4Xe2qWhANXbZ1fFSNVC0blnKsTjoOXVcWDWBcbv61NQw>
 <xmx:2-G0Xq-k9-dJgSkfKcEk9Vow1sPYvoV8puMBlBR0AIxC3dDw-V5Xiw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 069673280065;
 Fri,  8 May 2020 00:36:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 04/10] ALSA: firewire-lib: code refactoring for parameters of
 packet queue and IRQ timing
Date: Fri,  8 May 2020 13:36:29 +0900
Message-Id: <20200508043635.349339-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Although the parameter for packet queue and IRQ timing is calculated when
AMDTP stream starts, the calculated parameters are the same between
streams in AMDTP domain.

This commit moves the calculation and decide the parameters when AMDTP
domain starts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 56 ++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ce63ff6b7f03..6130c240ff33 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -957,13 +957,16 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
  * @speed: firewire speed code
  * @start_cycle: the isochronous cycle to start the context. Start immediately
  *		 if negative value is given.
+ * @queue_size: The number of packets in the queue.
+ * @idle_irq_interval: the interval to queue packet during initial state.
  *
  * The stream cannot be started until it has been configured with
  * amdtp_stream_set_parameters() and it must be started before any PCM or MIDI
  * device can be started.
  */
 static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
-			      int start_cycle)
+			      int start_cycle, unsigned int queue_size,
+			      unsigned int idle_irq_interval)
 {
 	static const struct {
 		unsigned int data_block;
@@ -978,9 +981,6 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		[CIP_SFC_176400] = {  0,   67 },
 	};
 	bool is_irq_target = (s == s->domain->irq_target);
-	unsigned int events_per_buffer;
-	unsigned int events_per_period;
-	unsigned int idle_irq_interval;
 	unsigned int ctx_header_size;
 	unsigned int max_ctx_payload_size;
 	enum dma_data_direction dir;
@@ -1032,30 +1032,11 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 			max_ctx_payload_size -= IT_PKT_HEADER_SIZE_CIP;
 	}
 
-	// This is a case that AMDTP streams in domain run just for MIDI
-	// substream. Use the number of events equivalent to 10 msec as
-	// interval of hardware IRQ.
-	events_per_buffer = s->domain->events_per_buffer;
-	events_per_period = s->domain->events_per_period;
-	if (events_per_period == 0)
-		events_per_period = amdtp_rate_table[s->sfc] / 100;
-	if (events_per_buffer == 0)
-		events_per_buffer = events_per_period * 3;
-
-	idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
-					 amdtp_rate_table[s->sfc]);
-	s->queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
-				     amdtp_rate_table[s->sfc]);
-
-	err = iso_packets_buffer_init(&s->buffer, s->unit, s->queue_size,
+	err = iso_packets_buffer_init(&s->buffer, s->unit, queue_size,
 				      max_ctx_payload_size, dir);
 	if (err < 0)
 		goto err_unlock;
-
-	if (is_irq_target) {
-		s->ctx_data.rx.events_per_period = events_per_period;
-		s->ctx_data.rx.event_count = 0;
-	}
+	s->queue_size = queue_size;
 
 	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
 					  type, channel, speed, ctx_header_size,
@@ -1341,6 +1322,10 @@ static int get_current_cycle_time(struct fw_card *fw_card, int *cur_cycle)
  */
 int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 {
+	unsigned int events_per_buffer = d->events_per_buffer;
+	unsigned int events_per_period = d->events_per_period;
+	unsigned int idle_irq_interval;
+	unsigned int queue_size;
 	struct amdtp_stream *s;
 	int cycle;
 	int err;
@@ -1354,6 +1339,17 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 		return -ENXIO;
 	d->irq_target = s;
 
+	// This is a case that AMDTP streams in domain run just for MIDI
+	// substream. Use the number of events equivalent to 10 msec as
+	// interval of hardware IRQ.
+	if (events_per_period == 0)
+		events_per_period = amdtp_rate_table[d->irq_target->sfc] / 100;
+	if (events_per_buffer == 0)
+		events_per_buffer = events_per_period * 3;
+
+	queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
+				  amdtp_rate_table[d->irq_target->sfc]);
+
 	if (ir_delay_cycle > 0) {
 		struct fw_card *fw_card = fw_parent_device(s->unit)->card;
 
@@ -1394,14 +1390,20 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 
 		if (s != d->irq_target) {
 			err = amdtp_stream_start(s, s->channel, s->speed,
-						 cycle_match);
+						 cycle_match, queue_size, 0);
 			if (err < 0)
 				goto error;
 		}
 	}
 
 	s = d->irq_target;
-	err = amdtp_stream_start(s, s->channel, s->speed, -1);
+	s->ctx_data.rx.events_per_period = events_per_period;
+	s->ctx_data.rx.event_count = 0;
+
+	idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
+					 amdtp_rate_table[d->irq_target->sfc]);
+	err = amdtp_stream_start(s, s->channel, s->speed, -1, queue_size,
+				 idle_irq_interval);
 	if (err < 0)
 		goto error;
 
-- 
2.25.1

