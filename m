Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D94614E0
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 676241667;
	Sun,  7 Jul 2019 14:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 676241667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501486;
	bh=X67bm1Rs1jV2t9gKM9OigCwFr6wXLXGNq0AFH5BkIzs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HVnJMZVx0p/Fdc6AihXjOXBXqW6zjG3PICRVeYoBmxCmqkhKZuNEbl4M8iqjSlaH5
	 ExnAsn5+NdGYDQ+PODoJmTWDHtDM2JD9nM/dx7XHlcX5Q7yZsRy74rOofxN5dutPXi
	 Kj2tT24YMgvVUsAm3WYVa/uLYX8PSxS3xgHCsABg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E79B9F80273;
	Sun,  7 Jul 2019 14:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F32F80213; Sun,  7 Jul 2019 14:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB4C2F80212
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4C2F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="etzZjgCc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tl0SrakQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C39CB423;
 Sun,  7 Jul 2019 08:08:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5xAFGf5x+J2/x
 2IdTBF9OdBnxOjGZVSya2Z1caroaIc=; b=etzZjgCc7iJgrM/bwoROhspjz3bgn
 4ajlmvVae2T6ipY0TI/CakuBsRvtRvIGaNWDI8kFRtAYXS6qMl72YOtUan4hMSWE
 4o88bZAlMDe4q3S+l21Mj7CYAQBxwinRZquaEdVR+YYi8TYmRl0pcPYPJ5bTmQaS
 IdMSM2byWTi5FCefZ4kAox4cWdaQ24u1trU6iq+H+rn+uuSxhhI9BVmN4/PqcMX9
 HgOHMWVyPArwPjPQag1n1Z1vL+ovP9OFMJL/YXkSl6DNTTgimB1Te8QzUiIBAqdo
 X0B35CPFT3OuEKpuwFf0nk6cmQiCbMPsQ9voEHoDfygKLC7D6Dz3ZjNSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5xAFGf5x+J2/x2IdTBF9OdBnxOjGZVSya2Z1caroaIc=; b=tl0SrakQ
 OjvIipY18Kb6X9nZIdrZrUkbIzDjT0EzIS2ZMCsju3KAaRtsXGs91lGDT1rP2dhv
 Ks1XKISlMB6vges28v+ya5wSr2kbqTu129dEloTNNxfLVWbT6Ek8fBVBCjYDgQDP
 X9sZJn98LknNLSG+FUDJzqxarKwt5kvsj4TUTPwiBs3F31nU4Oisgf2NSdUYMK2w
 hr7oyB/e/b3QsAQmVP09wW0+v0MOrW/ksdYo/IbZ7YL/fnAhZ9C1X7MkglkfXmwU
 GMppLs5QD+huj3GPTrJJW7NEaQNu2DZJTyA/PCwal78iScQOcnbcBOPJL5C7aqLz
 B/NfcYEw48XyFg==
X-ME-Sender: <xms:p-AhXZgm3ESdQD9puru4eGaI-CspbDTBYM8xEacosGQFN8Z1YAHx9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:p-AhXad_GGTY8DIOptBsb4y9A6F2joHWN6SS-fgZwPCuhsFx1rzFDQ>
 <xmx:p-AhXQWv8CsSlIo27i7lBJHGs1r6kNpTnsqMsmbFGqlQzrP9qnq98Q>
 <xmx:p-AhXUwfql4jFnvV91xUQWTt4VGZtUu7Dk4TX2YQnhNEEPGTbjo7Jg>
 <xmx:p-AhXc54LFuYnpsuFXAKtAGynUD8MJUnL3ZPKZL8yHRys7jsyibGlw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E423F80059;
 Sun,  7 Jul 2019 08:08:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:54 +0900
Message-Id: <20190707120759.16371-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/7] ALSA: firewire-lib/fireface: fix initial
	value of data block counter for IR context with CIP_NO_HEADER
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

For IR context, ALSA IEC 61883-1/6 engine uses initial value of data
block counter as UINT_MAX, to detect first isochronous packet in the
middle of packet streaming.

At present, when CIP_NO_HEADER is used (i.e. for ALSA fireface driver),
the initial value is used for tracepoints event. 0x00 should be
for the event when the initial value is UINT_MAX because isochronous
packets with CIP_NO_HEADER option has no field for data block count.

This commit fixes the bug.

Fixes: 76864868dbab ("ALSA: firewire-lib: cache next data_block_counter after probing tracepoints event for IR context")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 6c9f4d026505..c8d77bb05798 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -646,8 +646,12 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		err = 0;
 		*data_blocks = *payload_length / sizeof(__be32) /
 			       s->data_block_quadlets;
-		*dbc = s->data_block_counter;
 		*syt = 0;
+
+		if (s->data_block_counter != UINT_MAX)
+			*dbc = s->data_block_counter;
+		else
+			*dbc = 0;
 	}
 
 	if (err >= 0 && s->flags & CIP_DBC_IS_END_EVENT)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
