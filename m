Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86065BE98
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 16:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450DA16A8;
	Mon,  1 Jul 2019 16:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450DA16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561992377;
	bh=JQnhpqW1nMnLPfBSND4cPvmdJQrLeh3L+YqGHjtL+Oc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PSfVdTspUfVcuiTj1A+n04mco8+RreO6YyCjQjMmXG116OTQsJtvOB/8tJsDJ4bdr
	 xiZL0bWnO69ubZqGMtMY8m3fHRPuKuUOm0GwZU4NeHaII/AKAOzoNy9tETNs5OPFak
	 jCDhFY49ts07tmo5DGZ4HOdfiTXB8n5FVv6wgHx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A2FF800B3;
	Mon,  1 Jul 2019 16:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3652AF800AE; Mon,  1 Jul 2019 16:44:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAF0F800AB
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 16:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAF0F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CBW3EpFW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qBcyfRSV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C5EF021785;
 Mon,  1 Jul 2019 10:43:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 01 Jul 2019 10:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=y9UxOCNaIW1NMTXNOLa9uEwlJb
 fea+yfKQ0OmjIzOP8=; b=CBW3EpFWLROkq2EqhCsRrcg67GpkfbhV5TlmlMtCpZ
 mXKhgyOMOURhZWI4J9GpgMR+XN/Y6u2FQVXlQkosrNIDhbrv2mEeong3iOxQoelB
 jkMTJtvdoEy4HYaWeOQFRTyFwwu9PjI3JW9djcHG/f+43779Y5n1t1UkImJXdrRW
 iPJQ5Etfp3FNpfw0+sN2fodHzHEA6mYP3U1/QiEFswrelJhRbVcHMtnL6+cjBB1Z
 ZYcjrR1gms4glj5LY4xY/0Vcl/JuoPyj7GDyK4kqWjIz4FDythFvlIFEI44DQ29H
 zFVjnnKLYvON62EVnMmCJJmJTeRxnl0YqOSajFF+Wr+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y9UxOCNaIW1NMTXNO
 La9uEwlJbfea+yfKQ0OmjIzOP8=; b=qBcyfRSVB/GbXDO3eI8uAwlPKKxtn41oO
 vC2Y//QOHem6DVC/GnznJ6gh30qCT9cdhaTtQx3QAqzyg2Bi7EVM0UKuXVHHsZss
 UyuWCmPjIZHL0N+g6NHzQf+grd9+2WHf5maGupILeKInoRFpen+6OWN2WvB42ook
 qwdoNb6TgMBud6omwdZTkowPyK/et40Q2vAhdUS4VprTmMXnZPQLIECf5z+XDEmN
 2f+CsDwQvjUIMDj7qljBs5BoykjAVHhKzvmkC55H1Cc0vLWH8Y1FI11v45kO62TA
 X5xwYCL4zuIE0tOxyPDxhvcQ20tsDrhGOtO08yEDIrREo6PBxEaCQ==
X-ME-Sender: <xms:LRwaXStB5xMKjwJ8L9dYG_JsF9c7PIv4Xi6BZoo6R4TSic1Euvm6fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvdeigdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LRwaXQ7lk6IwhY2ca3Lhs5DBf6SMJ0xE6xn0c5f0ux1NpGYO6ADs6Q>
 <xmx:LRwaXel1jTX2etEK32yZ8jRyNWCElyiHvw_kpOU9uuz9-64s8ksZlA>
 <xmx:LRwaXYjfYQI7zKnP8PBUBF_GY3UvGm0R57EqGSU1ILYt9ft0Nq5tqg>
 <xmx:LhwaXeKAGE8ER1jjsuVHT7b_7TzScn_meOXmpdVwQYiHszvRmJDGJQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FA46380088;
 Mon,  1 Jul 2019 10:43:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  1 Jul 2019 23:43:53 +0900
Message-Id: <20190701144353.4875-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] ALSA: firewire-lib/fireworks: fix miss
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
this patch and the latest tree. I request maintainers to solve the
conflict to replace 'tx_first_dbc' with 'ctx_data.tx.first_dbc'.

Fixes: df075feefbd3 ("ALSA: firewire-lib: complete AM824 data block processing layer")
Cc: <stable@vger.kernel.org> # v4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index bebddc60fde8..99654e7eb2d4 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -388,7 +388,7 @@ static void read_midi_messages(struct amdtp_stream *s,
 	u8 *b;
 
 	for (f = 0; f < frames; f++) {
-		port = (s->data_block_counter + f) % 8;
+		port = (8 - s->tx_first_dbc + s->data_block_counter + f) % 8;
 		b = (u8 *)&buffer[p->midi_position];
 
 		len = b[0] - 0x80;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
