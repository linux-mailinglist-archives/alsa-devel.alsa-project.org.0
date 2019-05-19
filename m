Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838C22689
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E9C165E;
	Sun, 19 May 2019 12:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E9C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260189;
	bh=GcrlBd0lFmGcun9kV6MwHWOHXkBi+Aa+sNBAkmqd11U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jIMAeHVxqqvfRlOBz8pGFW4+FcYNWQMGVLDNtcxEE0SFXhKiYrZxJQERgY0HuCxiN
	 U0Br8fjvotR63xMh6clqnYyy/NiTr1bLd6h53xtLk3bUn1SRspBj4lv8nUb8SiwRWg
	 Vr6w0tczUe3rLOnIQLIc6GMb4mjRn3yaO3icDb7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BA4F89618;
	Sun, 19 May 2019 12:01:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23412F89670; Sun, 19 May 2019 12:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 146AFF89618
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146AFF89618
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jK4I2ofe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k5hidQsu"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F22A20DC2;
 Sun, 19 May 2019 06:01:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ksLR7NX3W1jz2xPQjnxKCTSshe
 aXMqBr3ilWVFdaKVM=; b=jK4I2ofeGLb/LNpXwDNUBmMiEzXcaxEoTxry09GJPi
 HHWj4YAjihNwBqOuCvqqpzPq74CoeFrVrgLCqXnXbX2iFFcTGKsyKNqVrsUn0dqY
 6C2N9eI1NfLxbLk4NIgzyYw6H+w7qQM6QapbRuMWc5/02TWaD3Z7P1T2ekKZFdai
 d5EYY/xUWrb+ZQcp7547rkAKG795VO/3mMeDnzV68nELoZGqtEm+17UWGVdLuOWW
 LMM7tghE/InyPUW1w1hngeaBqwqnpYbmeSUE/8clU2dpqoE8honijab3hpE1XTDh
 uFWDybF1wS5gxMoeMGPQvJcEw1if+Im7M3SxpzvBwwQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ksLR7NX3W1jz2xPQj
 nxKCTSsheaXMqBr3ilWVFdaKVM=; b=k5hidQsu9klGPyAmNkFeLvaLfVyieOCiN
 0UbWsdyPLBItrZ0SHB7j+0jZ9H987VvhZFpISAkr6Tfx0AUUTBAyKHT2TIWKEOzE
 5n+3wsDHA0vD9IpYQwg8/svwYQtpX39GI87JF4Pb6I0wvkhBcaTtpZZADSM9E/i0
 n6lRF07RSRywHr4Gc8RPDtZS8XjHr7a5AYSRJ+vpAnaKaRV47kan0NTFz56H+HAm
 GhKRd2eGUz8t+sra/BNw1vrUktbmj1WLB/lzezlzGb4ZeeIsmhjfQkhig4tIKMx3
 ANbZPmjqypPPUrXoqBL4pdT0FgSEwctwdya8LOwcJMAwPbCOIVIkw==
X-ME-Sender: <xms:ainhXGtsbVudgqP-ZCMYu3hTpUBIFz5xbQGb946y4EyXb5fOejc3ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ainhXKhGDIhhvGm4UyU4diPg5RXIbsJX-fIpGMeXTUqn6QGeKlb8Ig>
 <xmx:ainhXH_DIVtlUnKlLS6EdLs3g_7qb3bzuLvWR6TNjgJxJJ5HA68mnA>
 <xmx:ainhXNt0AfPHstmtO5l_E938BFWVu8o2euX5v1ZPc_gKvlrQnkHz5A>
 <xmx:aynhXMyHqd_nhT_3wGeNh3kDByucBuNwOUBRECtK5MTXO8bKGakq3Q>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7967D103CF;
 Sun, 19 May 2019 06:01:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:04 +0900
Message-Id: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/5] ALSA: firewire-lib: unify tracing events
	for isoc packet
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

Hi,

This patchset is for Linux kernel v5.3 development.

ALSA IEC 61883-1/6 packet streaming engine has four types of tracing
events to probe data of handled isochronous packets on IEEE 1394 bus.
The most parameters of data are common independent of type of
isochronous payload and inbound/outbound direction.

This commit unifies the tracing events as 'amdtp_packet'. Instead of
named tracing events, filtering functionality of Linux tracing
framework is available to filter out target events, like:

$ echo 'src == 0xffc0' > /sys/kernel/debug/tracing/events/snd_firewire_lib/amdtp_packet/filter
$ echo 1 > /sys/kernel/debug/tracing/events/snd_firewire_lib/amdtp_packet/enable
$ cat /sys/kernel/debug/tracing/trace
...
...: amdtp_packet: 00 0594 ffc0 ffc1 00 002 00 240 41 1 09 {0x0,0x2,0x0,0xf0,0x90,0x1,0xff,0xff}
...: amdtp_packet: 00 0595 ffc0 ffc1 00 018 08 240 42 1 10 {0x0,0x2,0x0,0xf0,0x90,0x1,0x4b,0x3d}

Takashi Sakamoto (5):
  firewire-lib: use the same type of argument for CIP header for tracing
    event
  firewire-lib: add data_blocks/data_block_counter parameter to
    in_packet/out_packet tracing events
  firewire-lib: use the same unit for payload argument in tracing events
  firewire-lib: use dynamic array for CIP header of tracing events
  firewire-lib: unify tracing events to 'amdtp_packet' event

 sound/firewire/amdtp-stream-trace.h | 163 ++++------------------------
 sound/firewire/amdtp-stream.c       |  16 +--
 2 files changed, 28 insertions(+), 151 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
