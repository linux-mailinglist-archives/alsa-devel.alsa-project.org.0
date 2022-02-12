Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA034B32A4
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 03:23:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17079181C;
	Sat, 12 Feb 2022 03:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17079181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644632610;
	bh=3SFzsYIV7tqsiF7Kmlu1v8szWiUfrI/n8FtEqk32AUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDK+EI6ySHLU6jGHZuUPb9rql2TRLBDEhvjcddWORUCu2Z13ojWv7kjHNNgXHJZfv
	 nSDZJiXYqm5qT3NI1y+dx/FMLSmwM8gsb3l9WRSIh1rsw9C5kxqfXzIvm9SUvrF8Ag
	 O14L7u4VV6Kv5IIQ0Tw6uG0G1sCFCWw4n611zw/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E45F804FF;
	Sat, 12 Feb 2022 03:21:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D79AF80130; Sat, 12 Feb 2022 03:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8F58F80130
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 03:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F58F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SU9TfOAm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iybvG0Ik"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E01A73200EF5;
 Fri, 11 Feb 2022 21:21:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 11 Feb 2022 21:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=JWFE8l2LwYg3yX
 aZ5RQpFz+ELRAlfDvXI+Y8nvTXfcI=; b=SU9TfOAmfOd2RM33aQTVx90C+2btNl
 kbRTDHWoFEdvBSZd8FVCz22OvfVC43SD+AHe8K2KPqsLguMYkUtkrmJHVsElN+Xb
 deAYrDCFEnnZvtKbqomgnvu4npNvGbG929/fDNSheun87gvFZANqIyEOQ60IThnZ
 JXJgVvY2EvqF6d5OUCUSpZDNcNFJCjApibBQXqQ93VVfV0w1CJNblvcfM9aCtQDo
 JWsgkYyKDTsLk4Sm3FI6IC6+Oh+88exeCqrG3x4wGEdxQ9HEE/WbjqYPySR5we+D
 zKTPCeR0P0whGf837YCyA/lh5qLceXOv1x8RkpSctICKGZeESL4QuJaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JWFE8l
 2LwYg3yXaZ5RQpFz+ELRAlfDvXI+Y8nvTXfcI=; b=iybvG0IkqLctK1+15AJAw/
 W3C6vogCbXckVWkMJSUYxy/1Sr0pnYh5vQ23zfgxuvHxyUWB0go30Eyaa6JlTssk
 DBJF0gTam3pggSg/BPwkNNcEpj6JEXNwqgWBJ8E41kcAx9HAEsP6NJFeM3hqS3iy
 si+YK1106ucaPdIYl5ZoI6L5UbrUPuIU8wfjj61DllkOnjOB86TbzKzckqrIR/Xz
 MQ1ksJWYKpHFm2mJjdDHgAxDbg9//0Og8O7wbl4ZXCsQ2JAvS7WsWKuRszHwNWjF
 9zYXl8lSZYWIj6Q9NtV3b4hn/R02yb5cl9XrSzPY28gpH0Q6ebrkwXcuNjujz5iw
 ==
X-ME-Sender: <xms:tBkHYsn-1cEYm0O_RKFXOOpiTkJ5XYea1oGMC1v3RuhAzytncQIK1g>
 <xme:tBkHYr0tSEKXxjRGyXnsg1KqycdqXSFm0HluQVWSqcmyJfvtQ0gfk7BIo52OMjDGa
 wr-J6CAp5hyKqVr_5A>
X-ME-Received: <xmr:tBkHYqqfbxlgxEQ7bOqxbZQFEJrKTEUPka553etWjwtLgiuGbkSl2B0stLYskcn_a-0oIlbotsrnQ7mecmW-mIk84xfTa-Q6I43pU7ixSl6dqqAkRabl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieeggdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:tBkHYokjlf9CyHlpxIyjnt8ZbI4jj-lpmYFL85KRqprE2X5ZkLKpzw>
 <xmx:tBkHYq37_Jw04tE_cHMjw_CKWP13L88dn9HCK5X9DpJWcVIkeyd89w>
 <xmx:tBkHYvsyN6yKMkLLw2wwxKr2DG_W2cWj9gpOPqSiQJVeVeLsXnuKug>
 <xmx:tRkHYtQeSoVt8OsOPJMO2CADQVuOIklb1kL0L_i8Kou1vQpJ2DJkdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 21:21:39 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 1/3] firewire: Add dummy read_csr/write_csr functions
Date: Sat, 12 Feb 2022 11:21:29 +0900
Message-Id: <20220212022131.199855-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220212022131.199855-1-o-takashi@sakamocchi.jp>
References: <20220212022131.199855-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
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

From: Hector Martin <marcan@marcan.st>

(Hector Martin wrote)
This fixes segfaults when a card gets yanked off of the PCIe bus while
busy, e.g. with a userspace app trying to get the cycle time:

[8638860.994310] Call Trace:
[8638860.994313]  ioctl_get_cycle_timer2+0x4f/0xd0 [firewire_core]
[8638860.994323]  fw_device_op_ioctl+0xae/0x150 [firewire_core]
[8638860.994328]  __x64_sys_ioctl+0x7d/0xb0
[8638860.994332]  do_syscall_64+0x45/0x80
[8638860.994337]  entry_SYSCALL_64_after_hwframe+0x44/0xae

(Takashi Sakamoto wrote)
As long as reading commit 20802224298c ("firewire: core: add forgotten
dummy driver methods, remove unused ones"), three functions are not
implemeted in dummy driver for reason; .read_csr, .write_csr, and
.set_config_rom.

In core of Linux FireWire subsystem, the callback of .set_config_rom is
under acquisition of mutual exclusive for local list of card. The
acquision is also done in process for removal of card, therefore it's
safe for missing implementation of .set_config_rom.

On the other hand, no lock primitive accompanies any call of .read_csr and
.write_csr. For userspace client, check of node shutdown is done in the
beginning of dispatch of ioctl request, while node shifts to shutdown
state in workqueue context enough after card shifts to dummy driver. It's
probable that these two functions are called for the dummy driver by the
code of userspace client. In-kernel unit driver has similar situation.
It's better to add implementation of the two functions for dummy driver.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/firewire/core-card.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 54be88167c60..d994da6cf465 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -616,6 +616,15 @@ static struct fw_iso_context *dummy_allocate_iso_context(struct fw_card *card,
 	return ERR_PTR(-ENODEV);
 }
 
+static u32 dummy_read_csr(struct fw_card *card, int csr_offset)
+{
+	return 0;
+}
+
+static void dummy_write_csr(struct fw_card *card, int csr_offset, u32 value)
+{
+}
+
 static int dummy_start_iso(struct fw_iso_context *ctx,
 			   s32 cycle, u32 sync, u32 tags)
 {
@@ -649,6 +658,8 @@ static const struct fw_card_driver dummy_driver_template = {
 	.send_response		= dummy_send_response,
 	.cancel_packet		= dummy_cancel_packet,
 	.enable_phys_dma	= dummy_enable_phys_dma,
+	.read_csr		= dummy_read_csr,
+	.write_csr		= dummy_write_csr,
 	.allocate_iso_context	= dummy_allocate_iso_context,
 	.start_iso		= dummy_start_iso,
 	.set_iso_channels	= dummy_set_iso_channels,
-- 
2.32.0

