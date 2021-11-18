Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F00456540
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 22:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C6117F6;
	Thu, 18 Nov 2021 22:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C6117F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637272740;
	bh=NsSLmRXo9UevRFb+VgeD+Zqz1BScEyQxpFvtlNIy2ac=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=biG/xn2YM/538FVuJGaPxvbDyi9plDbWqifDZ8Sj3fPHR7+ipvzcIb686UYrszJcu
	 PAVAPk29cWDnoGBwr+t/b65aCwkBlK+o3VGjBWfescI3LsSmh2OiuNnphDHCRniszK
	 G98KFnxecNRPnlXZuzQiE8Tp3qYUxUL7Dx35EoqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A85B0F802C4;
	Thu, 18 Nov 2021 22:57:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06307F80272; Thu, 18 Nov 2021 22:57:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E295BF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 22:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E295BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="CsHno/Pj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qWQUpv2W"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DC4181FD39
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 21:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637272650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=daydrbczdg/CFUEhbwaBNEaERGNpr5WeYnMrROOrpVA=;
 b=CsHno/PjiH29kqqn0ga2ZvgcVZpzyU0okwFH3Hybm3IkrLWfr40wstHGN5FpDA3/Bzka4T
 qFanEGY52NFhZGf/B93gr3gdzmWkoIVsXHA/nRuXd1w1PJdNnw+huTly4YnHt9xeHXr+mv
 vYKvp+17OFmIX9LznnGzg+C3oKkimy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637272650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=daydrbczdg/CFUEhbwaBNEaERGNpr5WeYnMrROOrpVA=;
 b=qWQUpv2WIN3Y8y69fXKtVl+dSa4kP7GYUQC4A+PIcFrDtZOnatFPGxCCi1bGrqVyULZxu/
 pRduLukwrWFNT0Bw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C6B4CA3B83;
 Thu, 18 Nov 2021 21:57:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ctxfi: Fix out-of-range access
Date: Thu, 18 Nov 2021 22:57:29 +0100
Message-Id: <20211118215729.26257-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The master and next_conj of rcs_ops are used for iterating the
resource list entries, and currently those are supposed to return the
current value.  The problem is that next_conf may go over the last
entry before the loop abort condition is evaluated, and it may return
the "current" value that is beyond the array size.  It was caught
recently as a GPF, for example.

Those return values are, however, never actually evaluated, hence
basically we don't have to consider the current value as the return at
all.  By dropping those return values, the potential out-of-range
access above is also fixed automatically.

This patch changes the return type of master and next_conj callbacks
to void and drop the superfluous code accordingly.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214985
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctamixer.c   | 14 ++++++--------
 sound/pci/ctxfi/ctdaio.c     | 16 ++++++++--------
 sound/pci/ctxfi/ctresource.c |  7 +++----
 sound/pci/ctxfi/ctresource.h |  4 ++--
 sound/pci/ctxfi/ctsrc.c      |  7 +++----
 5 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
index da6e6350ceaf..d074727c3e21 100644
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -23,16 +23,15 @@
 
 #define BLANK_SLOT		4094
 
-static int amixer_master(struct rsc *rsc)
+static void amixer_master(struct rsc *rsc)
 {
 	rsc->conj = 0;
-	return rsc->idx = container_of(rsc, struct amixer, rsc)->idx[0];
+	rsc->idx = container_of(rsc, struct amixer, rsc)->idx[0];
 }
 
-static int amixer_next_conj(struct rsc *rsc)
+static void amixer_next_conj(struct rsc *rsc)
 {
 	rsc->conj++;
-	return container_of(rsc, struct amixer, rsc)->idx[rsc->conj];
 }
 
 static int amixer_index(const struct rsc *rsc)
@@ -331,16 +330,15 @@ int amixer_mgr_destroy(struct amixer_mgr *amixer_mgr)
 
 /* SUM resource management */
 
-static int sum_master(struct rsc *rsc)
+static void sum_master(struct rsc *rsc)
 {
 	rsc->conj = 0;
-	return rsc->idx = container_of(rsc, struct sum, rsc)->idx[0];
+	rsc->idx = container_of(rsc, struct sum, rsc)->idx[0];
 }
 
-static int sum_next_conj(struct rsc *rsc)
+static void sum_next_conj(struct rsc *rsc)
 {
 	rsc->conj++;
-	return container_of(rsc, struct sum, rsc)->idx[rsc->conj];
 }
 
 static int sum_index(const struct rsc *rsc)
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index f589da045342..7fc720046ce2 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -51,12 +51,12 @@ static const struct daio_rsc_idx idx_20k2[NUM_DAIOTYP] = {
 	[SPDIFIO] = {.left = 0x05, .right = 0x85},
 };
 
-static int daio_master(struct rsc *rsc)
+static void daio_master(struct rsc *rsc)
 {
 	/* Actually, this is not the resource index of DAIO.
 	 * For DAO, it is the input mapper index. And, for DAI,
 	 * it is the output time-slot index. */
-	return rsc->conj = rsc->idx;
+	rsc->conj = rsc->idx;
 }
 
 static int daio_index(const struct rsc *rsc)
@@ -64,19 +64,19 @@ static int daio_index(const struct rsc *rsc)
 	return rsc->conj;
 }
 
-static int daio_out_next_conj(struct rsc *rsc)
+static void daio_out_next_conj(struct rsc *rsc)
 {
-	return rsc->conj += 2;
+	rsc->conj += 2;
 }
 
-static int daio_in_next_conj_20k1(struct rsc *rsc)
+static void daio_in_next_conj_20k1(struct rsc *rsc)
 {
-	return rsc->conj += 0x200;
+	rsc->conj += 0x200;
 }
 
-static int daio_in_next_conj_20k2(struct rsc *rsc)
+static void daio_in_next_conj_20k2(struct rsc *rsc)
 {
-	return rsc->conj += 0x100;
+	rsc->conj += 0x100;
 }
 
 static const struct rsc_ops daio_out_rsc_ops = {
diff --git a/sound/pci/ctxfi/ctresource.c b/sound/pci/ctxfi/ctresource.c
index 81ad26934518..be1d3e61309c 100644
--- a/sound/pci/ctxfi/ctresource.c
+++ b/sound/pci/ctxfi/ctresource.c
@@ -109,18 +109,17 @@ static int audio_ring_slot(const struct rsc *rsc)
     return (rsc->conj << 4) + offset_in_audio_slot_block[rsc->type];
 }
 
-static int rsc_next_conj(struct rsc *rsc)
+static void rsc_next_conj(struct rsc *rsc)
 {
 	unsigned int i;
 	for (i = 0; (i < 8) && (!(rsc->msr & (0x1 << i))); )
 		i++;
 	rsc->conj += (AUDIO_SLOT_BLOCK_NUM >> i);
-	return rsc->conj;
 }
 
-static int rsc_master(struct rsc *rsc)
+static void rsc_master(struct rsc *rsc)
 {
-	return rsc->conj = rsc->idx;
+	rsc->conj = rsc->idx;
 }
 
 static const struct rsc_ops rsc_generic_ops = {
diff --git a/sound/pci/ctxfi/ctresource.h b/sound/pci/ctxfi/ctresource.h
index fdbfd808816d..58553bda44f4 100644
--- a/sound/pci/ctxfi/ctresource.h
+++ b/sound/pci/ctxfi/ctresource.h
@@ -39,8 +39,8 @@ struct rsc {
 };
 
 struct rsc_ops {
-	int (*master)(struct rsc *rsc);	/* Move to master resource */
-	int (*next_conj)(struct rsc *rsc); /* Move to next conjugate resource */
+	void (*master)(struct rsc *rsc); /* Move to master resource */
+	void (*next_conj)(struct rsc *rsc); /* Move to next conjugate resource */
 	int (*index)(const struct rsc *rsc); /* Return the index of resource */
 	/* Return the output slot number */
 	int (*output_slot)(const struct rsc *rsc);
diff --git a/sound/pci/ctxfi/ctsrc.c b/sound/pci/ctxfi/ctsrc.c
index bd4697b44233..4a94b4708a77 100644
--- a/sound/pci/ctxfi/ctsrc.c
+++ b/sound/pci/ctxfi/ctsrc.c
@@ -590,16 +590,15 @@ int src_mgr_destroy(struct src_mgr *src_mgr)
 
 /* SRCIMP resource manager operations */
 
-static int srcimp_master(struct rsc *rsc)
+static void srcimp_master(struct rsc *rsc)
 {
 	rsc->conj = 0;
-	return rsc->idx = container_of(rsc, struct srcimp, rsc)->idx[0];
+	rsc->idx = container_of(rsc, struct srcimp, rsc)->idx[0];
 }
 
-static int srcimp_next_conj(struct rsc *rsc)
+static void srcimp_next_conj(struct rsc *rsc)
 {
 	rsc->conj++;
-	return container_of(rsc, struct srcimp, rsc)->idx[rsc->conj];
 }
 
 static int srcimp_index(const struct rsc *rsc)
-- 
2.26.2

