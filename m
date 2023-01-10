Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7D66424B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 14:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A92BE73;
	Tue, 10 Jan 2023 14:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A92BE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673358664;
	bh=B3grr3Xoie2KJ2/ekrtXDbE+JcVyGtXybYt9jbb5rq4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lxdmcCtQqwiDXdxeZbROtbbndihs3J0avRwl9Pm6qugItR17elgMsua2MrTPyR7sZ
	 C1eLskoUG3duPY1oggJYEnxzxNe94RyHpTPuy3mAtO3S3LDIJ5YVyJSHUIaTIcNh7e
	 xeuEWLpB+rOmfhEBN5BAIRkItqxGZ+q5UY9D3RS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2228F8052F;
	Tue, 10 Jan 2023 14:49:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71916F8052F; Tue, 10 Jan 2023 14:49:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05117F800C7
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 14:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05117F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=RZploBSM; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XL1y1nNb
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 657BA5C0150;
 Tue, 10 Jan 2023 08:49:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 10 Jan 2023 08:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673358580; x=
 1673444980; bh=r1lrn4XUoQqlWpmKS3JEKUiJFtgBdDEV+Q2Xhuz0CCc=; b=R
 ZploBSMwwNAZSbH+0dPcwH2mSK7txXzPQ1gvZtm/wcCw/g4aj0Pwxvs5KOFtl7id
 H8w5TMoDo3zaXK+ObhzIAlVAgZFeNYLSm1M0lpCY5YtF3Ty2A8qoBBolUbSGz0Ts
 gRlA8gvI1oLbVmTbNTsLa2FkaTaQquevbOkVFjVy3zdA/rne6Idi70wyKzrZnnXZ
 4Yh70qOzce+tSN1qDbv5/dC1SsWK5ZuUxHz1ln3qcQmY5P/Z3PnXH7JVTHj+0y7Q
 2K+KgkH2pB3maaFAEAv116dOPSxrXc6t+4Pdd4LoILYM8jbEG6eRKC1DGgykZNBQ
 oKbub7XEiP7m7IlK6yCUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673358580; x=1673444980; bh=r1lrn4XUoQqlW
 pmKS3JEKUiJFtgBdDEV+Q2Xhuz0CCc=; b=XL1y1nNbosLMgCSkROyZffkZUz+dK
 pTJpFNvq+1i8c/Su1tro40OVrA6qr6HGLjIbG9CcuTnhtTbcMgN++w0C15912MS5
 h8NUe1LYZYjq8JwPYxv6RItC7QtEa0ayw9DELOOl5KPqjuBktmE6SXEnhdN4h5xz
 11lt970TQ7bEVh8xuya1l0hrNg1ia0MG1IoNKrbpuKl2UuloMBAfdocbnVHhLWBi
 i2nGIuDJpCTXhRMRSd5GCDHHBchdOegxyO7nLvCQ6qwSnrk1AkskE/9xNIPh6FZX
 yWdfLbmyTdX86fkcALb0OBHjSwPVnQlt90pxaRW5JYnxn3+9Zw9gFchZQ==
X-ME-Sender: <xms:9Gy9YxLWGusl5lzZz_e_qm1i4S262aVAEGsacjeDJwIHuL-e-VuBOA>
 <xme:9Gy9Y9JtT3NZivXmXC4LsvvR21dKnMFDCEFDSnepRhA1js9KwsTtNFmvW1KFUYQzV
 YEz5SqHWLLBfe6mH5w>
X-ME-Received: <xmr:9Gy9Y5vGdMZuFOOiMpZk3Yq2xpU-3SCWMZHEH5PYPImMP5LqndWK2eOVPz5IAfAHaiBN5kKATjZK7_qXtCg2uOfICAFI4m3bCLFyh6po6BRGPJImf9vnCkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9Gy9YyY-7y8_NQ3wkSjc5vOFiobTid6VsEpPRH6RMvsD5v4Z6pgu3A>
 <xmx:9Gy9Y4Ze_9U3OdTG7VKSgsQfqZdZf4ZrBA9PYjA9HnQveVSVU9Lkxg>
 <xmx:9Gy9Y2A_FmVBf4rUJwlBDMYcVBRc5uqKTEtxEL3YukLc_a1NVTr34A>
 <xmx:9Gy9YzyoRXaqqLJsJrueSq2ixH_IUMNsncYQiJGRlzGkLAiDKUfr2A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 08:49:39 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-lib: obsolete return value from context
 payload processing layer
Date: Tue, 10 Jan 2023 22:49:32 +0900
Message-Id: <20230110134933.322794-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
References: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit obsoletes return value from the context payload processing layer
since the multiplier between the data block count and PCM frame count was
moved to the packet streaming processing layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c         | 16 ++++------------
 sound/firewire/amdtp-stream.c        |  2 +-
 sound/firewire/amdtp-stream.h        |  9 ++++-----
 sound/firewire/digi00x/amdtp-dot.c   | 16 ++++------------
 sound/firewire/fireface/amdtp-ff.c   | 16 ++++------------
 sound/firewire/motu/amdtp-motu.c     | 16 ++++------------
 sound/firewire/tascam/amdtp-tascam.c | 16 ++++------------
 7 files changed, 25 insertions(+), 66 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index b849f529fcba..3660c312bf33 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -344,10 +344,8 @@ static void read_midi_messages(struct amdtp_stream *s, __be32 *buffer,
 	}
 }
 
-static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_it_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
@@ -371,14 +369,10 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
-static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_ir_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	struct amdtp_am824 *p = s->protocol;
 	unsigned int pcm_frames = 0;
@@ -400,8 +394,6 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
 /**
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 98a033afc5f8..03e97faca797 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1043,7 +1043,7 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 	int i;
 
 	pcm = READ_ONCE(s->pcm);
-	(void)s->process_ctx_payloads(s, desc, count, pcm);
+	s->process_ctx_payloads(s, desc, count, pcm);
 
 	if (pcm) {
 		unsigned int data_block_count = 0;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 35b48f9ddbf7..b7ff44751ab9 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -107,11 +107,10 @@ struct pkt_desc {
 };
 
 struct amdtp_stream;
-typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
-						struct amdtp_stream *s,
-						const struct pkt_desc *desc,
-						unsigned int count,
-						struct snd_pcm_substream *pcm);
+typedef void (*amdtp_stream_process_ctx_payloads_t)(struct amdtp_stream *s,
+						    const struct pkt_desc *desc,
+						    unsigned int count,
+						    struct snd_pcm_substream *pcm);
 
 struct amdtp_domain;
 struct amdtp_stream {
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index b3f67af2d3b1..7db0024495b7 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -341,10 +341,8 @@ void amdtp_dot_midi_trigger(struct amdtp_stream *s, unsigned int port,
 		WRITE_ONCE(p->midi[port], midi);
 }
 
-static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_ir_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -362,14 +360,10 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
-static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_it_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -390,8 +384,6 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
 int amdtp_dot_init(struct amdtp_stream *s, struct fw_unit *unit,
diff --git a/sound/firewire/fireface/amdtp-ff.c b/sound/firewire/fireface/amdtp-ff.c
index 27943b7f86fa..76c9d33ed572 100644
--- a/sound/firewire/fireface/amdtp-ff.c
+++ b/sound/firewire/fireface/amdtp-ff.c
@@ -112,10 +112,8 @@ int amdtp_ff_add_pcm_hw_constraints(struct amdtp_stream *s,
 	return amdtp_stream_add_pcm_hw_constraints(s, runtime);
 }
 
-static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					   const struct pkt_desc *desc,
-					   unsigned int count,
-					   struct snd_pcm_substream *pcm)
+static void process_it_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -133,14 +131,10 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
-static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_ir_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -156,8 +150,6 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
 int amdtp_ff_init(struct amdtp_stream *s, struct fw_unit *unit,
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 4153527b5e08..39ed57d2c5a0 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -328,10 +328,8 @@ static void cache_event_offsets(struct amdtp_motu_cache *cache, const __be32 *bu
 	cache->tx_cycle_count = (cache->tx_cycle_count + 1) % CYCLES_PER_SECOND;
 }
 
-static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_ir_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	struct snd_motu *motu = container_of(s, struct snd_motu, tx_stream);
 	struct amdtp_motu *p = s->protocol;
@@ -370,8 +368,6 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 	if (trace_data_block_sph_enabled() ||
 	    trace_data_block_message_enabled())
 		probe_tracepoints_events(s, desc, count);
-
-	return pcm_frames;
 }
 
 static void write_sph(struct amdtp_motu_cache *cache, __be32 *buffer, unsigned int data_blocks,
@@ -396,10 +392,8 @@ static void write_sph(struct amdtp_motu_cache *cache, __be32 *buffer, unsigned i
 	cache->rx_cycle_count = (cache->rx_cycle_count + 1) % CYCLES_PER_SECOND;
 }
 
-static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_it_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	struct amdtp_motu *p = s->protocol;
 	const struct pkt_desc *cursor = desc;
@@ -435,8 +429,6 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 	if (trace_data_block_sph_enabled() ||
 	    trace_data_block_message_enabled())
 		probe_tracepoints_events(s, desc, count);
-
-	return pcm_frames;
 }
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index bb4cf2d26d1b..0b42d6559008 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -176,10 +176,8 @@ static void read_status_messages(struct amdtp_stream *s,
 	}
 }
 
-static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_ir_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -197,14 +195,10 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
-static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
-					    const struct pkt_desc *desc,
-					    unsigned int count,
-					    struct snd_pcm_substream *pcm)
+static void process_it_ctx_payloads(struct amdtp_stream *s, const struct pkt_desc *desc,
+				    unsigned int count, struct snd_pcm_substream *pcm)
 {
 	unsigned int pcm_frames = 0;
 	int i;
@@ -222,8 +216,6 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 
 		desc = amdtp_stream_next_packet_desc(s, desc);
 	}
-
-	return pcm_frames;
 }
 
 int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
-- 
2.37.2

