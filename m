Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72254F24A7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 09:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4A5171C;
	Tue,  5 Apr 2022 09:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4A5171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649143424;
	bh=OBBonDYJnY5GpXC4W6QwtQODag0TQzExE08D/x1LGhM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QbknOr+/PX265k+Y9ZEj5tKksG/yTw672KjPQRDDX2ADaPdFCfst7Hm/YvIPgUQPL
	 O7JtOu7QgUqeERZBJ3GsbbyQTCVcHxLQ73k5k8Xd1XiRapYBIAhTJAi03I7Vr4hsp1
	 rXVcHCzkjI7IWZ+fhlpfMSY7s4sPRCwUouoLKFIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AEA6F8012C;
	Tue,  5 Apr 2022 09:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745EAF8016E; Tue,  5 Apr 2022 09:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA8EF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 09:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA8EF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="O2/ZX33X"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Xm96IFRA"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B019320094D;
 Tue,  5 Apr 2022 03:22:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Apr 2022 03:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=OOV8kuXy6GkNce
 ksm9I1g6bh1snQdzCvH5QXqMSX91o=; b=O2/ZX33XIh7NTQJ+lsWRH6WY3NEzfA
 9Ygwn6B+yefcnOPMDwBGLAoZn2e9Xwva0k1Gq7LwhZOk+FesalbgvnHWNdniNQim
 8TlwRWS4YMgplQizQ9t2WTQdQhm05frUU24fsINn7dcM9iSgaEWfBC3IbC8RBE46
 qEA+wtGFV9/JA+jaAECVzDuzZTorPfmE9o8Pdm+YZZPUTqc2pMyQsdotD64pamJs
 PyA9kiNOsFu1ZTAvMCghOFKeReswPHCWOXCQaoDKE0tOVaLFXoOP/LMf56Lph8Qj
 Cpi4SBgvOc7R6XAZO1sBNH53ABzrFKQxpNtwdv2yrEMQF0ZbXZ1RthoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OOV8ku
 Xy6GkNceksm9I1g6bh1snQdzCvH5QXqMSX91o=; b=Xm96IFRAk164hn4CEk31IZ
 cGke0NsKZG6KW4e9VTG+4gqCUtKS5zpaFD4g57yraRnWI6TmIfT48FcOYbRY2y3i
 4LCymVow6zofr56ipwNSeKcOEu1Pj5wnQiyw0F4Vtd5ydSXq/g0ciFVg5myYSQO0
 XG9theBE9GJMA2VylEsD4Z647tFkd7+Z+ec7Kbc6eYMTIRKpssb8j4HJGCvQTtaU
 ZCac8P/CObfrNwgo10IyaPT9iH4VWK88gj8TpcEETrhfFYLD0iPhGG7MYqyPm6BV
 61nOZrk/v1xEQo46Hd1azWphALvmDcoVkYolDTUYEItZpijrQtsbkzKwznec4xFw
 ==
X-ME-Sender: <xms:Oe5LYlOiyilVPSSlrxiJACabkmGfB_fwTORRBfYz69rqXnK9p7kAMQ>
 <xme:Oe5LYn_Ll7_KwKh-FWUvZ3WL0L2dgt8gXdglNeEavmqrZ8uYADbQoj8FvIVWt7enG
 hrujCDHqt7VYT3g5mg>
X-ME-Received: <xmr:Oe5LYkQX6qbBkrSPy9l6buakyOkaGBJLIWw0QOCilqt5ceUNfoYvaCkITivWmQPqzv5nnO32IwhbT6EkxIxo8ckXgT7o78B5UiHN5zY0ZlMIF-MWZaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Oe5LYhtsJhKW5iuVExpsB4eXgqD_KwBp25-gZnqnHWph6WFEQes4bA>
 <xmx:Oe5LYtcNpI48Haegpo5W8qMIVBAdnks3Q7ouGC3-JKKIq_OvowJ-8g>
 <xmx:Oe5LYt2qY9Xx4B-t3Su2Hw81Cr4VWlxN4fAX7A70Z29o2yk1baXZdQ>
 <xmx:Ou5LYupenI3jc5C9Bv2rNv0wL2np4GBpzaQNUv24Zxh9qM0VAFXryA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 03:22:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 1/3] firewire: Add dummy read_csr/write_csr functions
Date: Tue,  5 Apr 2022 16:22:19 +0900
Message-Id: <20220405072221.226217-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
References: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>,
 clemens@ladisch.de
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
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
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
2.34.1

