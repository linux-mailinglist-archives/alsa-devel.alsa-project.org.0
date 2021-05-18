Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FA387451
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752F216DA;
	Tue, 18 May 2021 10:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752F216DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327708;
	bh=99duklAdcsAU/2/owCmFV5SIqcq6KJ9N4EHRbLWJM5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZToytYoAj2Ss8R8YAelQkGY1c/b7M8gMTQepyEnOB8mGYxI4juemyPgrtPN5WZhm2
	 DKmoPEWkatba06oXrpyXsplR7Vfj5D4SqZBUC8xKOb89YFk86T6qq+0siedNhNS8d4
	 wiyMuDbBorCe5fdbx4odJOdHV1KcD057LE7/DIho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B14DEF80482;
	Tue, 18 May 2021 10:46:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDDA9F802E3; Tue, 18 May 2021 10:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC60F801DB
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC60F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0dp1aiYc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="twOvfSuI"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A8955C0131;
 Tue, 18 May 2021 04:46:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 May 2021 04:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+YqyiIh+nY8Tf
 tXVmh+T+Vhx4m6t9HLbjBJPP/pdmFQ=; b=0dp1aiYc0intuPnidulUQkLNszkkH
 X4w/2wfkJikz58JLIGgHIVnmsc0SLd0eZeH2T6rgirfEAf5ILinXJ6FMJYPn/JAD
 22imC0iyve0YQCFFMe3Xqr2B1aYymSY3t07mZi60o2WuqWqvVzh2qnmgpFUtpoiJ
 NfXf79vvv77kLSBzFuXp7uutf7GC4bFXmRzn4k0jP8q1zoBpGB5Sn41nsvBPdszr
 Egv/B6HUOHAS+keoO6tnm0jDcHtSDk8nJl1mOli+beQZ4QQbIlt1nl3Ml/nDY6Iz
 Flhun3k1hg3WPyJLZFXt4ghPnGGAAofghcmBawi4HuXzVz5eQlU0A4qyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+YqyiIh+nY8TftXVmh+T+Vhx4m6t9HLbjBJPP/pdmFQ=; b=twOvfSuI
 OMDgTzT2QUp0Rc6bUb9cvlwxIG+eNfiGWDKcQ5tZ9k0zfDqoLNmKzhkmUV26U8Y3
 SCskD+Cw5+jPonY8KouVVLF+9l5WOO3+7BMJ8XeZ8VeCrUU7rtTUsP6QwV7JII3g
 CWDpDSDaJJXwfBcKgItPCiB+bIgyDLfk626pKCQscp9fDgdKxj7Ca4DN3ZRfLZus
 cFn6Kc5c/quyzOdcUeUaH5bFxrI3liFy28/eIMDZX64Wo8MCLVvJYKBpeBXz0OW5
 Bj/ywtvU5hMgcUIiH18Rxqb0jzTkgSFOMuGPjg3DjFnMEEAe9vc5hxmylNYPps9T
 0CSFTQ+Jh00LTA==
X-ME-Sender: <xms:zH6jYLCYA11WtxwVDJKP6-nBuiRcxBOGT_oeCME23mDj_htMVxs7wQ>
 <xme:zH6jYBg_7H_oBJ2KPbrSxCnuPka6RvVBcgpFpyE3aUCWlGspT5SoH-Fk-RktQQLyf
 SKQNt1sHUV7cpRRCYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:zH6jYGnFxqnwvpv2gCxiorzcvrSZiG2YtX611JfChVAXGqrp14-C8A>
 <xmx:zH6jYNzPrS7rlUuE0jC9mMSh0_Kg1OBA-gLCojv4TLIqel504komSw>
 <xmx:zH6jYATt1KvzoEypZ-nAhsRwU9EXOtFBVn02jWq64_JCOfy7scpQAg>
 <xmx:zX6jYJ7GtT5RDdO76mcLAMgHVG1ZEaxZm0BwEQzxkX4cRictNX1wnQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 02/11] ALSA: firewire-lib/motu: use int type for the value
 of bitwise OR with enumerator-constant
Date: Tue, 18 May 2021 17:45:48 +0900
Message-Id: <20210518084557.102681-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
References: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
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
index fea92e148790..d9c700f652bb 100644
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
+		     enum amdtp_stream_direction dir, unsigned int flags)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 
diff --git a/sound/firewire/amdtp-am824.h b/sound/firewire/amdtp-am824.h
index 06d280783581..2b092b1061ba 100644
--- a/sound/firewire/amdtp-am824.h
+++ b/sound/firewire/amdtp-am824.h
@@ -45,5 +45,5 @@ void amdtp_am824_midi_trigger(struct amdtp_stream *s, unsigned int port,
 			      struct snd_rawmidi_substream *midi);
 
 int amdtp_am824_init(struct amdtp_stream *s, struct fw_unit *unit,
-		     enum amdtp_stream_direction dir, enum cip_flags flags);
+		     enum amdtp_stream_direction dir, unsigned int flags);
 #endif
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e0faa6601966..b14c3922efb2 100644
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
+		      enum amdtp_stream_direction dir, unsigned int flags,
 		      unsigned int fmt,
 		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size)
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index a3daa1f2c1c4..0628b6e52fc1 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -112,7 +112,8 @@ typedef unsigned int (*amdtp_stream_process_ctx_payloads_t)(
 struct amdtp_domain;
 struct amdtp_stream {
 	struct fw_unit *unit;
-	enum cip_flags flags;
+	// The combination of cip_flags enumeration-constants.
+	unsigned int flags;
 	enum amdtp_stream_direction direction;
 	struct mutex mutex;
 
@@ -184,7 +185,7 @@ struct amdtp_stream {
 };
 
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
-		      enum amdtp_stream_direction dir, enum cip_flags flags,
+		      enum amdtp_stream_direction dir, unsigned int flags,
 		      unsigned int fmt,
 		      amdtp_stream_process_ctx_payloads_t process_ctx_payloads,
 		      unsigned int protocol_size);
diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index d613642a2ce3..398c57a6fb43 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -396,7 +396,7 @@ int amdtp_dot_init(struct amdtp_stream *s, struct fw_unit *unit,
 		 enum amdtp_stream_direction dir)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
-	enum cip_flags flags;
+	unsigned int flags;
 
 	// Use different mode between incoming/outgoing.
 	if (dir == AMDTP_IN_STREAM) {
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 3d0236ee6716..92effb6e6c96 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -106,7 +106,8 @@ enum snd_motu_protocol_version {
 struct snd_motu_spec {
 	const char *const name;
 	enum snd_motu_protocol_version protocol_version;
-	enum snd_motu_spec_flags flags;
+	// The combination of snd_motu_spec_flags enumeration-constants.
+	unsigned int flags;
 
 	unsigned char tx_fixed_pcm_chunks[3];
 	unsigned char rx_fixed_pcm_chunks[3];
-- 
2.27.0

