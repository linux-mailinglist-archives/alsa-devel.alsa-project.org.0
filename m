Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C3A2C2F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 03:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FF7165F;
	Fri, 30 Aug 2019 03:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FF7165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567127816;
	bh=CBmJxknImZqHqM1DK4roKufpNAbIp9LGRlS/LtKBOyM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDJ5u1ifoNcaA6+6VswweWQxuE53tSSAPumueMK+KRO1Xym3H6SyOLT4f/0h2tL74
	 33aATXH1kRwDP+t9fzTaBjqbzs3GqHv9bBempByo/ETnYfR0JgkOnpEELQyBvPdgF2
	 qGmSGQyRn+7WIGf5lf2vffZ8FZklgQnpY53CMNgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8D2F800F1;
	Fri, 30 Aug 2019 03:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6954F80148; Fri, 30 Aug 2019 03:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 823CEF800F1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 03:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823CEF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="m6Ez9NFg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="v++upCm+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EDEDD21B42;
 Thu, 29 Aug 2019 21:15:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Aug 2019 21:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=npCSZ/VkUgv+XqZ7pVlxs2W1Mi
 JX5dhpf8HOZbmoxOY=; b=m6Ez9NFgtOJqLWr26sx5xXPBFkDE4eyuFTdEDKo2rf
 0UQPQGpv59jygf/KdZBPV0NPDSFLSp5NZ1wfu6Obw3NQn6BNVYx5wccUYdQAfDbw
 d6K2BjV1UvdLwrHdhztR7kYzuPnVJ333GR3UZPAyY5zAmLh9IWLS4gIELgQYbMYs
 CFu58iRxnE9r4nTMIFKmpL7NK2rylvEko2ms+WQZ8Oz8bbJCiExldA13CzHcEzD+
 Qij+9uQd9S8298V42bR0Xzf3+0z24frwYFbtOYrZ0nNTxG1fbdzZvjE64GhhKJkL
 ltJ7Tl7qRekN4eCcR7PYh+B+dTNQhYb3Vmz5Mg3lNTBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=npCSZ/VkUgv+XqZ7p
 Vlxs2W1MiJX5dhpf8HOZbmoxOY=; b=v++upCm+Ojn8xtBuTcbAAT/tMzKYkaKSu
 8TUHXWBjtNOJxDY51BZIa6PrMB9iea8WAjooBJFFh8G5bd1JH2ch/EOLvMKvuj6H
 TTGk0iCYYGGg1xBI+jwnMUc36S0wKDNj3nFSLTfeWKAGk7qK/cjmj/YB9pUYAZe+
 55gkE6n0zlzr4FUoCSdgE9iG7I4zvH6JSCltflwTombEvFWQ+QMNGa3ODQakFMNp
 Hsme0rQzUlRCFY8q1/DaooCGP8pIeiMi8qZMgHTy1yXpqfHcCbJo2ENtOsLYI2+f
 vNX9Po/agbbimfCzUaI6la3bC+GT+B5cjAAklOVZBKW6EV/h5XrIw==
X-ME-Sender: <xms:lXhoXQNlL4U9H97oQUEOjVxvmqFEMvQ5fmH_X6OrzpKUqkITadFPAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:lXhoXUqbxgu4D_lENftDjPmGrcd01azYSrlHyecOp137rSfgkI3Gyw>
 <xmx:lXhoXZCEvxpHuUa1-6JXiwAPaZrdEA0V__63U5q1LdXCwDOdvKp7fA>
 <xmx:lXhoXVOK0ATC34jcBN8Za8ymbP3fkxpuJdxvwIERVv3ZS7JPET42EQ>
 <xmx:lXhoXfU0lsVhqnBRPPfLhxeoLEnQXjjuQ3Rclyk92TsNJAMkrwG1Vw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0D8E8005A;
 Thu, 29 Aug 2019 21:14:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 30 Aug 2019 10:14:56 +0900
Message-Id: <20190830011456.14720-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-motu: add support for MOTU 4pre
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

MOTU 4pre was launched in 2012 by MOTU, Inc. This commit allows userspace
applications can transmit and receive PCM frames and MIDI messages for
this model via ALSA PCM interface and RawMidi/Sequencer interfaces.

The device supports MOTU protocol version 3. Unlike the other devices, the
device is simply designed. The size of data block is fixed to 10 quadlets
during available sampling rates (44.1 - 96.0 kHz). Each data block
includes 1 source packet header, 2 data chunks for messages, 8 data chunks
for PCM samples and 2 data chunks for padding to quadlet alignment. The
device has no MIDI, optical, BNC and AES/EBU interfaces.

Like support for the other MOTU devices, the quality of playback sound
is not enough good with periodical noise yet.

$ python2 crpp < ~/git/am-config-rom/motu/motu-4pre.img
               ROM header and bus information block
               -----------------------------------------------------------------
400  041078cc  bus_info_length 4, crc_length 16, crc 30924
404  31333934  bus_name "1394"
408  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  0001f200  company_id 0001f2     |
410  000a41c5  device_id 00000a41c5  | EUI-64 0001f200000a41c5

               root directory
               -----------------------------------------------------------------
414  0004ef04  directory_length 4, crc 61188
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  d1000002  --> unit directory at 428
424  8d000005  --> eui-64 leaf at 438

               unit directory at 428
               -----------------------------------------------------------------
428  0003ceda  directory_length 3, crc 52954
42c  120001f2  specifier id
430  13000045  version
434  17103800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002d248  leaf_length 2, crc 53832
43c  0001f200  company_id 0001f2     |
440  000a41c5  device_id 00000a41c5  | EUI-64 0001f200000a41c5

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 03cda2166ea3..72908b4de77c 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -247,6 +247,17 @@ static const struct snd_motu_spec motu_audio_express = {
 	.analog_out_ports = 4,
 };
 
+static const struct snd_motu_spec motu_4pre = {
+	.name = "4pre",
+	.protocol = &snd_motu_protocol_v3,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_SEPARETED_MAIN,
+	.analog_in_ports = 2,
+	.analog_out_ports = 2,
+};
+
 #define SND_MOTU_DEV_ENTRY(model, data)			\
 {							\
 	.match_flags	= IEEE1394_MATCH_VENDOR_ID |	\
@@ -265,6 +276,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000015, &motu_828mk3),	/* FireWire only. */
 	SND_MOTU_DEV_ENTRY(0x000035, &motu_828mk3),	/* Hybrid. */
 	SND_MOTU_DEV_ENTRY(0x000033, &motu_audio_express),
+	SND_MOTU_DEV_ENTRY(0x000045, &motu_4pre),
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, motu_id_table);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
