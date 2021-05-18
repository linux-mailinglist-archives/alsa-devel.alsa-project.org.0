Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF9387461
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEADA16DF;
	Tue, 18 May 2021 10:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEADA16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327839;
	bh=PXw8fSI4DC+05mHbIjz9YMZPxHrG/+JhjeRSuxwxIag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+hdNhvDOZUMpQvOk/rKl6CbPFMPX3oad4g2VDHHG3ppdy7Pi+QMhEM/EWi6+aVwx
	 5f9rdCRdJ2C82JZZvHpQvlo7ZLAvtavSZUhXbSVfp3MMtXv6mRzf6YoZGQ2PTd5lPO
	 +0JER2XAxafnxtYyTAbp3oImZYKZZu0Xh5JSwT1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C1FF804E4;
	Tue, 18 May 2021 10:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98A3CF804AA; Tue, 18 May 2021 10:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF6A7F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF6A7F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SBrsgQE+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mN8e01dy"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FA025C019D;
 Tue, 18 May 2021 04:46:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 18 May 2021 04:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Dl4zhhaUElYxk
 Vzb633kXpsz6Z1fkaDBmuQJ1CrWEHs=; b=SBrsgQE+AbS82SO9fjKbrRFuKVROe
 +9IdgxCvMnk4BfI54N7dD3pUo7P6+DGFL4fnkuKVxPKDJvKIeunIFAsbdZpx6hiD
 QKMwC5vyYH92Reo2UfD+BptCgwlR8D0aq/dVMtDPe6PAYAJZ1o+YaFgFoNJTfizd
 ZihfZoY3xyURdj1EzkZ7lw1ZBYokDXQPUfqJ16yg1bv8xn+sfsH1jLYXhFmjPjN0
 Bj1K5TiURVRk5qKfL3Adhrvtuo6SVV7e6CPxS66PdVEKXpxa4/KtwXeFqabj9Bmh
 6btvMnwMsAKhd7nlF7zi0ZXZgYQEXpK8N14uA7vZKUt6OhrkHUwEkgmiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Dl4zhhaUElYxkVzb633kXpsz6Z1fkaDBmuQJ1CrWEHs=; b=mN8e01dy
 qkhBSfrWpQEQh2RJ5IKiIEwB5LX4O/+dbOqTniV0XmSEKrNy0kBc9yjuU5aZ5D15
 CYacmP25Mx6C4mIX2TdLuKW6RsYQGrTV7VUIyh0wMeLwiveA80Plpu7DbM9AOVaE
 S4M/pn3Pz9YyLl6yMyH4gAYMdFRWsDIYlLxMm3jDDB7FpSosmJDkW+hSvG3iDV/c
 CtH3gBCOWtDdMWc7xD+8xXz/gEASsfQ5mX/v+aRF+2vle8zF6/2ANRSscvptiwU7
 JviD3wK1jgWtlifg4OXBwHgOgJyAxbO73LTtxcHKTX4DZpzwnlTUAU8UdeKbDg1P
 TKDQbwaV8RRAXA==
X-ME-Sender: <xms:1n6jYMF29BfxKeE-pJdeH8-6NkmHI4hENTHVyCADKiLsKsFb6WJ44g>
 <xme:1n6jYFUSqvUfXmcRtB0qRQqzIionhTwJwgViIIaHR1SIwkyVelrc9y4OqorkywN1K
 wItptTZgDN5bt4TP-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1n6jYGKEnvlAN7ZZvzyz1V8qh_GaSC9shjVpQN81Ngj6jr97iq0Bow>
 <xmx:1n6jYOHVqf7Pj9WH9tTS_SFMYGeVzPfm9WmSwM9qK5dOb20JCmyTkg>
 <xmx:1n6jYCX7J4oJOT9mqjwOYXMKSsUlKRDSXzlVjqi1v2x-cPshrBHCeQ>
 <xmx:1n6jYLcLH8r4nTn3_E17d17Jf7HKmph-pRGsDsJMqCDHmXsZDtJEcg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 09/11] ALSA: firewire-lib: code refactoring for jumbo
 payload quirk
Date: Tue, 18 May 2021 17:45:55 +0900
Message-Id: <20210518084557.102681-10-o-takashi@sakamocchi.jp>
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

A new macro is added to describe the maximum number of cycles to accept
cycle skip by jumbo payload quirk.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index b14c3922efb2..409274a532ed 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,6 +64,11 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
+// The initial firmware of OXFW970 can postpone transmission of packet during finishing
+// asynchronous transaction. This module accepts 5 cycles to skip as maximum to avoid buffer
+// overrun. Actual device can skip more, then this module stops the packet streaming.
+#define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES	5
+
 static void pcm_period_work(struct work_struct *work);
 
 /**
@@ -316,7 +321,7 @@ unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 	unsigned int cip_header_size = 0;
 
 	if (s->flags & CIP_JUMBO_PAYLOAD)
-		multiplier = 5;
+		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
 	if (!(s->flags & CIP_NO_HEADER))
 		cip_header_size = sizeof(__be32) * 2;
 
-- 
2.27.0

