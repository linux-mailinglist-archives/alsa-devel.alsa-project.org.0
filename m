Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7238797B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D916516ED;
	Tue, 18 May 2021 15:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D916516ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343047;
	bh=TrX2UVw7YNm57HDHe/j8twW2pLpMjB2kXU6ogLyrHBI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYxojHVCDMC+nwOUn/OBaz/4uxCy2jEdQesGUPjCqdtnOj8zmVlNtYssGKjHJP4lM
	 SOUFoQeA5wnT7rfLVgVfCqFFSYj0jSSM2aDPCzDEwKNSb+x7qXURgBZ51AJM50tV6c
	 j7YKsuW/B9mt1cS918WnwRix6M+K8XLk/fBH9U04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F10C2F804AA;
	Tue, 18 May 2021 15:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 266A6F80475; Tue, 18 May 2021 15:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56D1CF80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D1CF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="frgbTqLV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t9ko1z0e"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 57EF75C021B;
 Tue, 18 May 2021 09:00:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 May 2021 09:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=uoCkZcIcLbshY
 I2iHoNf00ZEZMYN7kDdyXVMmUq2v6k=; b=frgbTqLVu1iqcPAMTc0yPyejM9Egn
 gdRaGPLD+X9V5zhhBA4HT3/J8/5z/vpXWw6AuXj8I2yGcHLsSggG9HDVP7lJboqN
 pX/FY4MN1nWlKJTb3eDgH79n/bEj2kDkVE55+hyaenCnqigVLHKytvp0Tjonre1f
 bmPwoSGnFBLr7LU35qY2xnIZYn2U3hH0Frlm5PRcf5P/QAc/T2HFIf6mGUUDVOq+
 qqyZBQWho7BsuTe1lrQqzWUJCQI92CKHkmMxt3dp/VhBlNYh+AlVTgSwp/+bFZYV
 ty+i84J+UIf99ysKPZh5AMdZmGxEL7qBDyyq57lXVoFf0IARcXJEcxvxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uoCkZcIcLbshYI2iHoNf00ZEZMYN7kDdyXVMmUq2v6k=; b=t9ko1z0e
 xHNOvwF9HtJ/u6SWqNU+y896xvrD6yPTaf+Mj4FQIcr6DNuL5K56Q3vMKbtgPzWy
 MrAT26s8Ne7FV4ZLp+/fOz3mY6Fqd2SB20bYRpE7EnXXnB07AOQr/iBrqygVyzVi
 Iuaytyi0QAvcRcVnPy9e/HwtAd21d2mXmhSOZ6EPLFl+GnRNPLJ6xscwy4Exc0ty
 g2SprwNJj+W9/8ATqgUBiOsQkMHApfiqtVmvPrWC8UP4Gi8bXCsbZFZZ+5H5H8R/
 HXeEjA/I6tdmhVMIvVIsUqSeFkyRi6YeH/Bfdf2QXQppFaNvkJTW/oDIPLkNYrut
 12sL0CMMMfQb9g==
X-ME-Sender: <xms:irqjYEvNrF7kdP91Gxu2qfUt0GQTIyMLgbaLq01d_6tU1ZSPVXf4wA>
 <xme:irqjYBfnHiM5E0DpQng48mQ3IAvoPoAP0YCHAH26MmzsEuvDe9V2lEGN71S5ZPsMr
 l2Nxs7Sd-ofXTRoebM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:irqjYPxmW6p4ASgfc1LA3V74ooMZS8tsl_Eb6vOtrA5kbcapj4i5Mg>
 <xmx:irqjYHOtpGRSn2kfhSixNSpUPSBHIqhjv0cOuQlnxm6wehUmf31Yxg>
 <xmx:irqjYE_wOqqlFF1UhYtoS0MDFWk5JS7yjKh_WV9g1e6Rw5KZhzv1PA>
 <xmx:irqjYJHnd0mV1YoAhwUuXfuxRTyEt5_kklbmEYhjVLuJoShGQ8Xkuw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/8] ALSA: firewire-lib: code refactoring for sequence
 descriptor'
Date: Tue, 18 May 2021 22:00:42 +0900
Message-Id: <20210518130048.146596-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
References: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
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

A internal structure is used to gather parameters relevant to sequence
descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 36 +++++++++++++++++------------------
 sound/firewire/amdtp-stream.h |  8 +++++---
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fcb70f349a2f..739e73207fda 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -852,8 +852,8 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	// Calculate the number of packets in buffer and check XRUN.
 	packets = header_length / sizeof(*ctx_header);
 
-	generate_pkt_descs(s, s->pkt_descs, ctx_header, packets, d->seq_descs,
-			   d->seq_size);
+	generate_pkt_descs(s, s->pkt_descs, ctx_header, packets, d->seq.descs,
+			   d->seq.size);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
 
@@ -931,12 +931,12 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 {
 	struct amdtp_stream *irq_target = d->irq_target;
-	unsigned int seq_tail = d->seq_tail;
-	unsigned int seq_size = d->seq_size;
+	unsigned int seq_tail = d->seq.tail;
+	unsigned int seq_size = d->seq.size;
 	unsigned int min_avail;
 	struct amdtp_stream *s;
 
-	min_avail = d->seq_size;
+	min_avail = d->seq.size;
 	list_for_each_entry(s, &d->streams, list) {
 		unsigned int seq_index;
 		unsigned int avail;
@@ -945,9 +945,9 @@ static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 			continue;
 
 		seq_index = s->ctx_data.rx.seq_index;
-		avail = d->seq_tail;
+		avail = d->seq.tail;
 		if (seq_index > avail)
-			avail += d->seq_size;
+			avail += d->seq.size;
 		avail -= seq_index;
 
 		if (avail < min_avail)
@@ -955,7 +955,7 @@ static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 	}
 
 	while (min_avail < packets) {
-		struct seq_desc *desc = d->seq_descs + seq_tail;
+		struct seq_desc *desc = d->seq.descs + seq_tail;
 
 		desc->syt_offset = calculate_syt_offset(&d->last_syt_offset,
 					&d->syt_offset_state, irq_target->sfc);
@@ -970,7 +970,7 @@ static void pool_ideal_seq_descs(struct amdtp_domain *d, unsigned int packets)
 		++min_avail;
 	}
 
-	d->seq_tail = seq_tail;
+	d->seq.tail = seq_tail;
 }
 
 static void irq_target_callback(struct fw_iso_context *context, u32 tstamp,
@@ -1323,7 +1323,7 @@ int amdtp_domain_init(struct amdtp_domain *d)
 
 	d->events_per_period = 0;
 
-	d->seq_descs = NULL;
+	d->seq.descs = NULL;
 
 	return 0;
 }
@@ -1438,11 +1438,11 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
 				  amdtp_rate_table[d->irq_target->sfc]);
 
-	d->seq_descs = kcalloc(queue_size, sizeof(*d->seq_descs), GFP_KERNEL);
-	if (!d->seq_descs)
+	d->seq.descs = kcalloc(queue_size, sizeof(*d->seq.descs), GFP_KERNEL);
+	if (!d->seq.descs)
 		return -ENOMEM;
-	d->seq_size = queue_size;
-	d->seq_tail = 0;
+	d->seq.size = queue_size;
+	d->seq.tail = 0;
 
 	entry = &initial_state[s->sfc];
 	d->data_block_state = entry->data_block;
@@ -1511,8 +1511,8 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 error:
 	list_for_each_entry(s, &d->streams, list)
 		amdtp_stream_stop(s);
-	kfree(d->seq_descs);
-	d->seq_descs = NULL;
+	kfree(d->seq.descs);
+	d->seq.descs = NULL;
 	return err;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_start);
@@ -1538,7 +1538,7 @@ void amdtp_domain_stop(struct amdtp_domain *d)
 	d->events_per_period = 0;
 	d->irq_target = NULL;
 
-	kfree(d->seq_descs);
-	d->seq_descs = NULL;
+	kfree(d->seq.descs);
+	d->seq.descs = NULL;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_stop);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index c69042013245..5f5e4d938a0d 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -287,9 +287,11 @@ struct amdtp_domain {
 
 	struct amdtp_stream *irq_target;
 
-	struct seq_desc *seq_descs;
-	unsigned int seq_size;
-	unsigned int seq_tail;
+	struct {
+		struct seq_desc *descs;
+		unsigned int size;
+		unsigned int tail;
+	} seq;
 
 	unsigned int data_block_state;
 	unsigned int syt_offset_state;
-- 
2.27.0

