Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1C5935A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 07:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA021679;
	Fri, 28 Jun 2019 07:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA021679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561699439;
	bh=ZJvtsafUdMfsn6n/bKN5ZKgDebR29k/FJhK3gp6GBmY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TUoC+t3EVsAArzC8WOJGtcjHj8HcHLqAe6U6KieORyXhoF5jAullJ5CofV7bUJBIy
	 8Rk/OMEkNedqxJdJFOHBY0VaeVRxSSwOuFp6pBFOvuiNnWHtLpCS2nr94sOI4HEuhH
	 3ipKhE6kD8nVgIuqDs+CenPvIM27Up9kQidLlS6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2BA7F896B9;
	Fri, 28 Jun 2019 07:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90331F896B9; Fri, 28 Jun 2019 07:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A31F80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 07:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A31F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XYZfq4Xm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="i4teDIJh"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 51D6721111;
 Fri, 28 Jun 2019 01:22:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 28 Jun 2019 01:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=9uHbDy+yscQcQ9si3v6fybcJcZ
 oszIfrJ/wKIKt3L5A=; b=XYZfq4XmRbn9uY7fFd73NGF1UJ6t7cX2LWeX7sVae4
 wq8ehNPcZ5cjIimlRl6lmunR+QtAUsVAQDDOvmNJu5Pkh1S7rRWlScu1JHcF7E2G
 I57eY0XnzA5vyt3GHpkbJBQ8Er6S9eCJMVzJ9tPT0+q/2HyoDMknpde3ujuV2XXi
 HcPW4PWdugujw5359bM0sbZho4mwtLRJ7EonBljjpeeyr2O/k+g8R924Pp7T31Lz
 WAfdPdqlHD4pWq04HD4IHoT4bDb6D6EwQWkzNoX5icCic13dhOMM3vx7Trhwhprp
 LOcxAQuf7sXkUY3qcfGFo0U58jjT14i7HSTmC9umYHLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9uHbDy+yscQcQ9si3
 v6fybcJcZoszIfrJ/wKIKt3L5A=; b=i4teDIJhHJ8efm3U7K077V3lHwzV1IoTz
 UzKwl3g5V6G6scim31YbNk/Y4/fLeUPk1asyo6K5NifNdlXo/WHS7bCEldTch1qX
 iEBWMbyVi0AmMLaliHddwgI+sC0eKNNlEwtMxwuOMAbCxdqPUlLHjdr6qx7ieCyt
 ykR6OqgCXJOjQoRwNjttBSs172geXA2UnBci+zB/Z85H9TM9kCoxFBmuh2D9ULDR
 iBhjLyVfxDVRvTEucHfnVDf8BYFv8bACpBTVGU2b78IBgwtMXMrla4Ca1e/s3agP
 lMOYzFrLJAaWrcHE8ScdE8Xk/8svfApEMS+RZw3wbeT7a4GSU96Yw==
X-ME-Sender: <xms:-6MVXWdN7QJE64n8ktEXMj5JlliWhu5oV4VdwwwfjYy39KuwMDa6lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:-6MVXVeIhy5itQyao3MC9YYCpy5UkaoikWCwc1c7vd03CBbOpSOgUQ>
 <xmx:-6MVXZPW-o6iUVImsSMTQT40XEtxMXN-UpdPnny8FRpVRNUz7CsYAg>
 <xmx:-6MVXcJkYrtqJ474UFxx8W1Fs99OMKavdE0OzmWvRjIwwj1K9FBBTQ>
 <xmx:_KMVXaL8xAA6tQISqPY7aVkPfC2Oo20oa9lmrqy1HQYAx19Qlgdvhw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D35A080063;
 Fri, 28 Jun 2019 01:22:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 28 Jun 2019 14:21:58 +0900
Message-Id: <20190628052158.27693-1-o-takashi@sakamocchi.jp>
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

Fixes: df075feefbd3 ("ALSA: firewire-lib: complete AM824 data block processing layer")
Cc: <stable@vger.kernel.org> # v4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 7019a2143581..623d014c0e7e 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -321,7 +321,7 @@ static void read_midi_messages(struct amdtp_stream *s,
 	u8 *b;
 
 	for (f = 0; f < frames; f++) {
-		port = (s->data_block_counter + f) % 8;
+		port = (8 - s->ctx_data.tx.first_dbc + s->data_block_counter + f) % 8;
 		b = (u8 *)&buffer[p->midi_position];
 
 		len = b[0] - 0x80;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
