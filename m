Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33528386FFB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A671693;
	Tue, 18 May 2021 04:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A671693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621305930;
	bh=Rvw79c+3uRUqh9JgZiIevSZ31b05xqIVhAvEQWjnRPI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sauGyd8nMrSZm14Ynd6WBXd19fvnh5CtWOaj7d435+oD0b8KSKaW03ElV3UZtB926
	 0/ZMhalIskFYSwlHmdBse2FMgQkzDvpcdUCpr+B3KK7fUnDA0dZ6dTsoVKtOwxw1/A
	 xXXgHalQuJXFON0CAz/auvNdyIWTicyufMnW4kfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0BF7F80475;
	Tue, 18 May 2021 04:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F50F80424; Tue, 18 May 2021 04:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E1EF80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E1EF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RohhWrTb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uGuTP5Yv"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B71EF5C0197;
 Mon, 17 May 2021 22:43:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 17 May 2021 22:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EEtsj6jSdUH/r
 jv6W41MN6qniflbI2Tsd09skg9wR/s=; b=RohhWrTb8L54JspVLHn2wchi3XcFN
 gVYl8fqpronvxoiwAgEhxBMHRBpxHII9zZHodZQ4u9dyo61fp8jOsi+5QW2qFs+P
 qPrB9G1vtTQdn/dkG4RPGDZwhrNmCNtUN2ETn2G4ExtlNxupGE1v7vLhaogXk2Gg
 gb8f0r4KvGDQOtBxg8I/SRmprB0C+Q4ZIA0JAgSiZvFwvgU/7iXYKwSK/T4744S4
 3fSFgK78YYI2ktA7Un9D88ngI4/ZHSOKNP7ACUUd/4A5cRq52GckfD6k00zcWwcK
 2P5+zYOHPSTPeTDESnfQ1HhCEoqukJVViqfrYrTWLVl67HEsuxqX1T2Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EEtsj6jSdUH/rjv6W41MN6qniflbI2Tsd09skg9wR/s=; b=uGuTP5Yv
 Tkng5Sjabh8QmUMd3EaUdEFzs8RvvLmWWzXdrWk9mhbjPuhcHCUw1dwEH773/LFm
 87Ffb4viuo3PAzIcXzNrXJ9BwEnNq+76yQQ9w0n6pilUQ7VY/GNoMI2ckIBK2OVI
 4NEnXg37u24lq+cOgXFbzM7Nk0MF/qtOMUuQbZje3/QI71TCOW/XZOl4XIw0I8rl
 5R4hYVEbjPLCbXir9pR9TwNKGq8IL9ObMaWAW8t7KbAztI4XuNGHHLn+0C5RJAeK
 HvG2kKnB5RmN08+Gh25+gmRZrWtsrN74XVIpHfG247VfAqmVwwMkdNPwqlcZ0FiM
 nQ9z/4wJ0GlVTQ==
X-ME-Sender: <xms:1imjYEdLFHBPbWqiXvjkgEI-li1pLVgEZZsj9HddxIgMhQA6k5Uh1w>
 <xme:1imjYGPzrzMhjIBnzdeyAaCiYMOMsxfcW-YFyXqHGgkffDv1rcBbScsUK6l2gYzgz
 jgJsfOoFZeGu6jqjxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1imjYFjrOUeAvzxQdC-TNLJi9DX5R6_pYTtEfIwFxVW7X0B7AqnnDg>
 <xmx:1imjYJ-wHefy6w6bkWB_eelCMStACUZGu5YZtmk8n-a8twlRsTGc1A>
 <xmx:1imjYAvSKgVjzoM3UrSj2cZkUVqbZ3ISGHhERGPjCvzEOuXxR7T2Jg>
 <xmx:1imjYG0bqPtsMJ_xRNaGWVxwRzPy3VG468R3ryltxU_hM_fSgtST1w>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 02/11] ALSA: firewire-lib/motu: use int type for the value
 of bitwise OR with enumerator-constant
Date: Tue, 18 May 2021 11:43:17 +0900
Message-Id: <20210518024326.67576-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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

It brings some inconvenience in practice to use enumerated type for
variable to which bitwise OR with enumerator constant is assigned.

This commit replaces declarations of enumerated type with int type.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c       | 4 ++--
 sound/firewire/amdtp-am824.h       | 2 +-
 sound/firewire/amdtp-stream.c      | 4 ++--
 sound/firewire/amdtp-stream.h      | 5 +++--
 sound/firewire/digi00x/amdtp-dot.c | 2 +-
 sound/firewire/motu/motu.h         | 3 ++-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index fea92e148790..9662a3ba9139 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -410,10 +410,10 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
  * @s: the AMDTP stream to initialize
  * @unit: the target of the stream
  * @dir: the direction of stream
- * @flags: the packet transmission method to use
+ * @flags: the details of the streaming protocol consist of cip_flags enumeration-constants.
  */
 int amdtp_am824_init(struct amdtp_stream *s, struct fw_unit *unit,
-		     enum amdtp_stream_direction dir, enum cip_flags flags)
+		     enum amdtp_stream_direction dir, int flags)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 
diff --git a/sound/firewire/amdtp-am824.h b/sound/firewire/amdtp-am824.h
index 06d280783581..fe6652bde4a5 100644
--- a/sound/firewire/amdtp-am824.h
+++ b/sound/firewire/amdtp-am824.h
@@ -45,5 +45,5 @@ void amdtp_am824_midi_trigger(struct amdtp_stream *s, unsigned int port,
 			      struct snd_rawmidi_substream *midi);
 
 int amdtp_am824_init(struct amdtp_stream *s, struct fw_unit *unit,
-		     enum amdtp_stream_direction dir, enum cip_flags flags);
+		     enum amdtp_stream_direction dir, int flags);
 #endif
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e0faa6601966..094c9b2d772f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -71,13 +71,13 @@ static void pcm_period_work(struct work_struct *work);
  * @s: the AMDTP stream to initialize
  * @unit: the target of the stream
  * @dir: the direction of stream
- * @flags: the packet transmission method to use
+ * @flags: the details of the streaming protocol consist of cip_flags enumeration-constants.
  * @fmt: the value of fmt field in CIP header
  * @process_ctx_payloads: callback handler to process payloads of isoc context
  * @protocol_size: the size to allocate newly for protocol
  */
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
-		      enum amdtp_stream_direction dir, enum cip_flags flags,
+		      enum amdtp_stream_direction dir, int flags,
 		      unsigned int fmt,
 		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size)
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a3daa1f2c1c4..1f294df1d64f 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -112,7 +112,8 @@ typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
 struct amdtp_domain;
 struct amdtp_stream {
 	struct fw_unit *unit;
-	enum cip_flags flags;
+	// The combination of cip_flags enumeration-constants.
+	int flags;
 	enum amdtp_stream_direction direction;
 	struct mutex mutex;
 
@@ -184,7 +185,7 @@ struct amdtp_stream {
 };
 
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
-		      enum amdtp_stream_direction dir, enum cip_flags flags,
+		      enum amdtp_stream_direction dir, int flags,
 		      unsigned int fmt,
 		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size);
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index d613642a2ce3..a47d9800e0d6 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -396,7 +396,7 @@ int amdtp_dot_init(struct amdtp_stream *s, struct fw_unit *unit,
 		 enum amdtp_stream_direction dir)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
-	enum cip_flags flags;
+	int flags;
 
 	// Use different mode between incoming/outgoing.
 	if (dir == AMDTP_IN_STREAM) {
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 3d0236ee6716..c0de2720aeac 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -106,7 +106,8 @@ enum snd_motu_protocol_version {
 struct snd_motu_spec {
 	const char *const name;
 	enum snd_motu_protocol_version protocol_version;
-	enum snd_motu_spec_flags flags;
+	// The combination of snd_motu_spec_flags enumeration-constants.
+	int flags;
 
 	unsigned char tx_fixed_pcm_chunks[3];
 	unsigned char rx_fixed_pcm_chunks[3];
-- 
2.27.0

