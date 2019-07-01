Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C545BA41
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 13:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2F41680;
	Mon,  1 Jul 2019 13:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2F41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561978886;
	bh=SyLdOD9HpL/hidL+ASjyowxw+0gHfbWrGl/o9LHPH4E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z3nleNyqcLS9Zztk6slFoN03CiqRouIMEj3CCPk6SrXZrFT3VLxQqnKPIEgpr7QXj
	 IsSY2WnPyoBODQmMpBU2JP6wmjJQD5bkRSZ/yh6YTp0glqLuAXhJKT3awXhsUdqoM4
	 XDtHrxJMBlXHO8r3+TLSg3csHKMPsHn8bZts/Z6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA30EF80CC4;
	Mon,  1 Jul 2019 12:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44AB6F896EC; Mon,  1 Jul 2019 12:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E2EF8076A
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 12:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E2EF8076A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="u3Xu9lnc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j1r6vQtb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A8C8921EFE;
 Mon,  1 Jul 2019 06:59:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 01 Jul 2019 06:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=CdL3mD7LfGbmKgyOEqreWsUfw6
 XAqpc5nokDFsYBJGY=; b=u3Xu9lncnAfpkadiQXig8QK27A3YgxCK+t+vGk7o3L
 q8ffTbnozwIT+N+Da10RES0UQKaohes/xbt82CTEmP8MiDUwL0LbgRjJRPeM0BKn
 mPUQYIF7dCqYV4ESDe73VafBMNn5AVRpUxbf07xB15PCACuJQgZ67agdMUgbJtfr
 AEs6of9mIrunnewSNdhIrwktMQDem0PVd0YQXl7G00dSeohHcvyCKQ8CkzQjYBCa
 DdagQVzHyHp1imv0nKOSBd8PKV65St2KCFmYTbAx2aWS1CuYDaD4ks6aiTaLNRlo
 WB7EfYJfqTTbNOpuS5IJ6NlYgg8QPNU9EhYUwPHdxhWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CdL3mD7LfGbmKgyOE
 qreWsUfw6XAqpc5nokDFsYBJGY=; b=j1r6vQtb9u90ynw15tYp8SgTn99RPxLpX
 kIRH/jqUOsOf80F1sqvAbWFuDYRhIOl35F0Ftaj+KDJnnH61wrwBzOeVQxCfr3Pu
 gkrJnHgO1hVNct8yUfUfmTIhU/UIX03ZnfM/TCDpOGbhAlfGhG+eF82m/3Kp5yxA
 0AUlLSNID/c/T0GNIK5I8q9V0QI/xUXJ93ETTkxOCs4XqJ2It6ff+voNkiu0aK4v
 v4fbsQBLA9A2ms5QqzDujTIEAlPysvXfUvgiGBN6HAakMzfnvStTvz3Cs7MC2CkV
 M0kbllyPXxeZ2iwIw4ic3oB3w+IeSkm0ewdf4QIA7QXHRJyo6RjoQ==
X-ME-Sender: <xms:lecZXcPRvCouX5WH8yhGkabmXjVlbkYT7LBVK9a1jqnWr_C94VzVtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvdeigdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lecZXdqHSy8XFWVqrfHXrMyRGTY7mL8CNihI0lcwRNum8xZ4wsr2HA>
 <xmx:lecZXb99sPVdXBZmTaoGDmiwD3elK5kGk8Cnj5ryyYjr0iFNOXMW7A>
 <xmx:lecZXb3GKHXtzXpZBulLZHX9D-uZx40yQE14rwoC-omLeRf5ldWE6A>
 <xmx:lucZXXE-o0LH6GBhuhp1mahKJFOEt-w4AVNBRod8VHmZn4pp9LzurA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A3D8380075;
 Mon,  1 Jul 2019 06:59:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  1 Jul 2019 19:59:27 +0900
Message-Id: <20190701105927.13998-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-lib/fireworks: fix miss
	detection of received MIDI messages
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

In IEC 61883-6, 8 MIDI data streams are multiplexed into single
MIDI conformant data channel. The index of stream is calculated by
modulo 8 of the value of data block counter.

In fireworks, the value of data block counter in CIP header has a quirk
with firmware version v5.0.0, v5.7.3 and v5.8.0. This brings ALSA
IEC 61883-1/6 packet streaming engine to miss detection of MIDI
messages.

This commit fixes the miss detection to modify the value of data block
counter for the modulo calculation.

For maintainers, this bug exists since a commit 18f5ed365d3f ("ALSA:
fireworks/firewire-lib: add support for recent firmware quirk") in Linux
kernel v4.2. There're many changes since the commit.  This fix can be
backported to Linux kernel v4.4 or later. I tagged a base commit to the
backport for your convenience.

Besides, my work for Linux kernel v5.3 brings heavy code refactoring and
some structure members are renamed in 'sound/firewire/amdtp-stream.h'.
The content of this patch brings conflict when merging -rc tree with
this patch to the latest tree. I request maintainers to solve the
conflict by replacing 'tx_first_dbc' with 'ctx_data.tx.first_dbc'.

Fixes: df075feefbd3 ("ALSA: firewire-lib: complete AM824 data block processing layer")
Cc: <stable@vger.kernel.org> # v4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 4210e5c6262e..4d677fcb4fc2 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -321,6 +321,7 @@ static void read_midi_messages(struct amdtp_stream *s,
 	u8 *b;
 
 	for (f = 0; f < frames; f++) {
+		port = (8 - s->tx_first_dbc + s->data_block_counter + f) % 8;
 		port = (s->data_block_counter + f) % 8;
 		b = (u8 *)&buffer[p->midi_position];
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
