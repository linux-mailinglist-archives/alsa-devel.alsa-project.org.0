Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C0859466
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 04:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C16DEC;
	Sun, 18 Feb 2024 04:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C16DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708227088;
	bh=2nRBV2fUpHaqb82N/C4deVSrnkTWASajFc9A8riQRbE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XigmPdruTBpTMV0i0H09Jj9nrkPOO0cuqEqcSKiQJXhFyDJKFUW+0fntGcDRJ2dfl
	 JBYaq9I9+nCUI/wclX1pQfDUQR6IhmC23S8OMaDa1GzFprlhaxPzQxMxQwe8nCTSy9
	 Wjao6yh+7jKtDhs2YdaEWUBZ/c0Yhm9KESY6DOdU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C89BAF80587; Sun, 18 Feb 2024 04:30:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E4D5F805A0;
	Sun, 18 Feb 2024 04:30:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D00ECF80496; Sun, 18 Feb 2024 04:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03B19F80104
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 04:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B19F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=NC1PWQQC;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=QNR8uT44
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id D68483200392;
	Sat, 17 Feb 2024 22:30:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 17 Feb 2024 22:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1708227032; x=1708313432; bh=A0j3SW1JHI
	a1O1Iw2bt8CT2eukJao0r8lGkD5zm4FEw=; b=NC1PWQQC3QlJPgKR1uFROzvhAc
	oDP7wMr4rYeLOXrAuReQfkJIFTwgtSrZTKwhVXQvOAhs3YAy/pKPLwNU21MpmfGI
	ZOgwompL+8NFQ8P/ks+nCaspbiaxhLEB2V9h5rg77fjcOAh/7BDIlprugM18AuHV
	yCWuPjv+tH4zVs+NKRYUvN0Z2TNEBev94v9SiKsqqHyQQq4ruCPhLzBDcIbqLYwX
	hIgQum0Erm+qkSFWlhlB2bMb4jYUFUERzYtL1YighQh3Z631FGEiB8nuxcRLQeDB
	A2HSz1G6NsLz1bJAu010qMVAF4WloJYQ8Cuer7SX1BTpcxrWD3Y78T53LZng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708227032; x=1708313432; bh=A0j3SW1JHIa1O1Iw2bt8CT2eukJa
	o0r8lGkD5zm4FEw=; b=QNR8uT44v54QUDHKppXCGufRJKDRWgpx35j/oAR/zNYt
	9guVq4ykQ0NFGE7Qy3s+HCC6QivcbOZ/Ej8ef3CebexegfKhnq+0BjzF0Pz31onf
	LyiO0YnCDZne8m/vn5h2PGd766FZGC/bKa9n6kbW3PyEUmNjgAgEfw7badxDkHgU
	wN+4SkyOG0cPYx0iW3sv9z1kpPMpo5MNQCnNj4cNfJYyr04T3Rr1bqHbmKNCK5i2
	K7OjpnSZwD9GHG7bZ2Ujt3Z13q7G+7/r1d4p6GJjpcBuiSJ0NyjriZAmQP23/EGA
	8OuOQOGLxqQDJ+tYr39qKhUOHRg39X3CXpVczpQ5VA==
X-ME-Sender: <xms:13nRZciqF6-Oi-dmWuPV1krd7E88xRblKOV0khwsiY7m5e3Mr1pgbA>
    <xme:13nRZVCD2fgBcw8HCNKqx5ivuTB6YRRP4uIsVBA05dj1gymQUbdw810YayJA_ot2r
    QGPr-2VNYwdHuhxS1A>
X-ME-Received: 
 <xmr:13nRZUEht8X2T_N2bxG-EGQB1itrWzyeK-GlQiju1X8-IGAR4UNg3MbTGHTSl9cppnl3NKUWPIrzg0s7AZbQrfN9lBmqH2V7gMUtnAxs4geK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
    duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
    grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:13nRZdT6qAG4gJwovNDvasoJI7h2C8i-pWBfDFO8h8CdboxuGZi7TA>
    <xmx:13nRZZwIAdZv_Foka1WcAmCWW5jGtgOwVtxyz9LoSVm--owkAIWaJg>
    <xmx:13nRZb5u48QZS-sLDAfTiZFmIKh5f4w9bRT98oHadRiniOrwBxNXOg>
    <xmx:2HnRZaoMjTJFBYL1vMf23PSrhE_Y3N9JDY_Dw92QigsviB8rg8IM7g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Feb 2024 22:30:30 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: firewire-lib: fix to check cycle continuity
Date: Sun, 18 Feb 2024 12:30:26 +0900
Message-Id: <20240218033026.72577-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BQWKXOJ4Q2BXU4SE2SACSRGG3ZGCDBJQ
X-Message-ID-Hash: BQWKXOJ4Q2BXU4SE2SACSRGG3ZGCDBJQ
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQWKXOJ4Q2BXU4SE2SACSRGG3ZGCDBJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The local helper function to compare the given pair of cycle count
evaluates them. If the left value is less than the right value, the
function returns negative value.

If the safe cycle is less than the current cycle, it is the case of
cycle lost. However, it is not currently handled properly.

This commit fixes the bug.

Cc: <stable@vger.kernel.org>
Fixes: 705794c53b00 ("ALSA: firewire-lib: check cycle continuity")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index a13c0b408aad..7be17bca257f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -951,7 +951,7 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 				// to the reason.
 				unsigned int safe_cycle = increment_ohci_cycle_count(next_cycle,
 								IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES);
-				lost = (compare_ohci_cycle_count(safe_cycle, cycle) > 0);
+				lost = (compare_ohci_cycle_count(safe_cycle, cycle) < 0);
 			}
 			if (lost) {
 				dev_err(&s->unit->device, "Detect discontinuity of cycle: %d %d\n",
-- 
2.40.1

