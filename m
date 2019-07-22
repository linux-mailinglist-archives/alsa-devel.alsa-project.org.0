Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C57636F80C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EF11748;
	Mon, 22 Jul 2019 05:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EF11748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766995;
	bh=konq9SQgN18D7oKcEuWJQAoqxIBiHpm/tPTQloFoiJk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pI3PHt+GqFd2igp9Gd7piN42lYLSCZ/aWMCkbL0v+NawoTf0NaFFORAJhOyc7vj6w
	 COxwPY09IYAbZgoZmJmAmAKQd5P3FTEfoNRqZJMyfHGOyFtox4MSRrFBKo9OKL9XlD
	 q7HajqTbDBSPoAdOWUB+Nr3mnjfmjgc7bjMCBYno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4ABEF80507;
	Mon, 22 Jul 2019 05:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BAD5F8048E; Mon, 22 Jul 2019 05:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D19F803D1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D19F803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CDPD+c7/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k+HNrja1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 303AA21E92;
 Sun, 21 Jul 2019 23:37:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=7OUPVTUylWTAG
 wAAsBAErB2WoFtFwsHp1SnrrOSiqSI=; b=CDPD+c7/BhzbIkwJ4m3IPoLLAmNnr
 G/pckWkMBm3fNcwRY8PDR2G4kLs0V8NLTCJm1JxvkB2su3II+CdZBRT2aOTJQ6Cx
 Oua5LywWogxvROBe1xjUMdJEcxLHv7myUizMJVkmLTze+BVmjcyBNBzbQPfSasuF
 hScRWBx34rSYrDFe+6oKOCgLi4zNMF4psKeTUsUZT3B9YohfuH61HIBCcyJdI/Sy
 euyge+ucBNXntZcZBXL5xW38easLoHZIF6UQyhxtPL8cjB477Qr1p6cTWfD9K/4+
 EMo6XeLXRvzW0gkpayiST5/wIbfG8Fh7s+V3C6G9OCyIok7woxs0LMC/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=7OUPVTUylWTAGwAAsBAErB2WoFtFwsHp1SnrrOSiqSI=; b=k+HNrja1
 w/5n/o2k0cgvdoY0HbnurefOLBNO5lupr5aIrAVQhyJPxf/OICp8+/eVBOSrZq6V
 LfrkzdMs6TwHZOounqgYakpV+uiuGp/vfddl3xcN62ypuM1yMNJE1kelDZyDMcFp
 sYSdEmpKBArfxXA+xopPi16x/jYMuJiOgSpB4YCylhldn98waPZ91lxmBaG6kvZw
 6QyWiuSYWvvvL5MJJUQCNGnIE8Zmn8ipkHuh1jzNLCDqzfQQClIg7EJtHCQ05CQs
 YKE1etGIZ/lgf4JTZ56BJa4j3k9HlFgkLyZMz7iUXvUzCZT72uaKQ074aDQTMJTx
 /REW6GyFcqp5VA==
X-ME-Sender: <xms:dS81XVcxeuhwZK0Sw3FGWXg7dKij9JOkDvVwrnlGL95l0rry1rt_vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:dS81XT2cchNnLRguio3bCMcGwwVnH3_vH7ZdaoH5cuK2NrcntmTdwA>
 <xmx:dS81XZoj-YTJA_hWtTzYhlAKHfkNr83g6pWxGZd8fFdsee4K1Mel0Q>
 <xmx:dS81XTiPs-zcd9rrgYsPDvUBr2RFcRqOPoXuwHsS-w_8k9ROhmj7bw>
 <xmx:dS81XUFypYrfwCvMrGyPSb5YmKas2kwN6uiSGEb1HMBHNHuI-OQKDA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF49180059;
 Sun, 21 Jul 2019 23:37:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:56 +0900
Message-Id: <20190722033710.28107-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/20] ALSA: firewire-lib: add syt_override
	member for some protocols
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some protocols don't use syt field of CIP header to represent
presentation timestamp. For such protocol, ALSA IEC 61883-1/6
packet streaming engine uses a pointer into local variable for
the value of syt to call data block processing layer. However,
it can decide the value when initializing packet streaming
layer.

This commit adds 'syt_override' member for packet streaming
layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c        | 6 ++++++
 sound/firewire/amdtp-stream.h        | 1 +
 sound/firewire/motu/amdtp-motu.c     | 8 +++++++-
 sound/firewire/tascam/amdtp-tascam.c | 8 ++++++--
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 3435bef97a8b..6242240cd8ee 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -104,6 +104,9 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->fmt = fmt;
 	s->process_data_blocks = process_data_blocks;
 
+	if (dir == AMDTP_OUT_STREAM)
+		s->ctx_data.rx.syt_override = -1;
+
 	return 0;
 }
 EXPORT_SYMBOL(amdtp_stream_init);
@@ -717,6 +720,9 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		if (s->flags & CIP_DBC_IS_END_EVENT)
 			dbc = (dbc + data_blocks) & 0xff;
 
+		if (s->ctx_data.rx.syt_override >= 0)
+			syt = s->ctx_data.rx.syt_override;
+
 		build_it_pkt_header(s, cycle, &template.params, data_blocks,
 				    dbc, syt, i);
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 762ac3c7e902..5b9d4212e202 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -133,6 +133,7 @@ struct amdtp_stream {
 
 			// To generate CIP header.
 			unsigned int fdf;
+			int syt_override;
 		} rx;
 	} ctx_data;
 
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 9693f37a0032..683873699885 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -428,7 +428,13 @@ int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		return err;
 
 	s->sph = 1;
-	s->ctx_data.rx.fdf = MOTU_FDF_AM824;
+
+	if (dir == AMDTP_OUT_STREAM) {
+		// Use fixed value for FDF field.
+		s->ctx_data.rx.fdf = MOTU_FDF_AM824;
+		// Not used.
+		s->ctx_data.rx.syt_override = 0xffff;
+	}
 
 	return 0;
 }
diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 3a4d1f855f79..8fba6fb8ba8a 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -220,8 +220,12 @@ int amdtp_tscm_init(struct amdtp_stream *s, struct fw_unit *unit,
 	if (err < 0)
 		return 0;
 
-	/* Use fixed value for FDF field. */
-	s->ctx_data.rx.fdf = 0x00;
+	if (dir == AMDTP_OUT_STREAM) {
+		// Use fixed value for FDF field.
+		s->ctx_data.rx.fdf = 0x00;
+		// Not used.
+		s->ctx_data.rx.syt_override = 0x0000;
+	}
 
 	/* This protocol uses fixed number of data channels for PCM samples. */
 	p = s->protocol;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
