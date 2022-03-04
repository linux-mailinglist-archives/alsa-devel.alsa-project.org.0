Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16D4CD2EB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 12:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B6731914;
	Fri,  4 Mar 2022 12:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B6731914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646391768;
	bh=Q+NZ4V3B1Izav4nDQIoVNsFTX5KjGcM4+QM2+CZjWkQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bQG/smHDz3VTUME2CPTQqpn7BtE01if4KG4GlzPqEaWGOQFxm0A2cmgS2iz7aQXoC
	 ztNE3f9jwTnyRJQYBtWRdsd9ZMKqzSjGCXHPxbXNwyWKRZy6f2Ks6PlYZ6Ds9XN9To
	 5GcG9tLWSGQnO5UP9s+M37Hs3DPK4TfiViTIGCxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 097A2F800F0;
	Fri,  4 Mar 2022 12:01:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49B5AF801EC; Fri,  4 Mar 2022 12:01:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2401FF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 12:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2401FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="q9bLSKx9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h5AoumAo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 05FB55C012B;
 Fri,  4 Mar 2022 06:01:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 06:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=U60cmbFifzHDeEy3zQmN8cKRqOtxLkSQW8s5FT
 kmqwg=; b=q9bLSKx9PDRbu74yy6V561yaLzplao9oGsS7cZt1ismDd6lZAQXGbT
 LZp9adFjo2+2DgK8cRvzraDEQRkjJUIAFhK/AYctz4/X1qlOx83H/LSOolhnYgPV
 rP81uQ3WrCkJ1bm13FAii6wTYr7xBz87K3AXYPl1Am/WOqwtL9h1n633afOamzZV
 h0T8UWBYfSjjQpwAd8/G9hZWwv4H//qIcepwBQ/x8LyADH84+uLenYHZOz5hYL3E
 6NP95UrOn+wp4nB7XZMs7KVPGXl+C6XmpKivBsp085DErBPv6596Tvi2XBIueGLv
 /FG1tk1dDKVOUEEalSN/hfiK32FFEY5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=U60cmbFifzHDeEy3zQmN8cKRqOtxL
 kSQW8s5FTkmqwg=; b=h5AoumAookwIdOaTRidneU23Jp83Dqzp9Q4fmn6NNO5Nh
 fSKxeZVqIGX5Ioh+xVlyKcH8mi6XXJ29/ZHC8WKAFqMIVnsIsmCwHry1mkvtH0MZ
 h8HB7W+XkuhWDeCXNT5+kZCVD+gxUZ/1CSLD0C5NJPLaAoax/vgg0xKshuVXgHLW
 QxKpVkFmAuCcxzyLjUf5LcHrG6wU5IIjQO2qxvlYNPNIfiNOuG6CvlXBFxAA29Ow
 1wDtvInUwhV9j5aygLPWwA104Wyn0QeIj2ytrNP2wJAvUIoVHFbT0yz2CEXPm5uR
 tI5Zl/M0pLSx3K3ytdCbA38GhgMuXee0a+5/pu3Iw==
X-ME-Sender: <xms:h_EhYhkgVD3m9D4vMOf5WpurXUIcuxs9zXoIoql4ISuAsaIJgmpqtw>
 <xme:h_EhYs08qj4XQv_ooy6olXLBRymx0YOejEENZTLzNF2w-q46TOmDd8atpB_FfE4wl
 -L5Wi19Txh5Jc5umtk>
X-ME-Received: <xmr:h_EhYnppeGsNouEk-6mziS_aE2_w-a-sSLK0l2ces2TxQXIgBlYoQJE9v5tLus5Jx7CvIOpr8VjDDCtHfZQP8K0LHtTeC1igWXvchJ3e1V3lAcA8qjlJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:iPEhYhnxYz5w2Hl0czkQSWqCQxYLcNpdITrdd7Qpm4pHYT3yMQ9I4Q>
 <xmx:iPEhYv3heYhPQR-sxEw9wA5S6853wdfmnHa0aRxvIbbD0rltOrqbEw>
 <xmx:iPEhYgsjEdke5JGN4NMxz6ZTZOcNmS3SdNuHPjVmCwxeFoDjh7UxBg>
 <xmx:ifEhYo-mlJjw7TlzTgCxuyY7-eOgeQjhOwdET4CTg-u9br0d0jTpeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 06:01:26 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: fix uninitialized flag for AV/C deferred
 transaction
Date: Fri,  4 Mar 2022 20:01:24 +0900
Message-Id: <20220304110124.68988-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

AV/C deferred transaction was supported at a commit 00a7bb81c20f ("ALSA:
firewire-lib: Add support for deferred transaction") while 'deferrable'
flag can be uninitialized for non-control/notify AV/C transactions.
UBSAN reports it:

kernel: ================================================================================
kernel: UBSAN: invalid-load in /build/linux-aa0B4d/linux-5.15.0/sound/firewire/fcp.c:363:9
kernel: load of value 158 is not a valid value for type '_Bool'
kernel: CPU: 3 PID: 182227 Comm: irq/35-firewire Tainted: P           OE     5.15.0-18-generic #18-Ubuntu
kernel: Hardware name: Gigabyte Technology Co., Ltd. AX370-Gaming 5/AX370-Gaming 5, BIOS F42b 08/01/2019
kernel: Call Trace:
kernel:  <IRQ>
kernel:  show_stack+0x52/0x58
kernel:  dump_stack_lvl+0x4a/0x5f
kernel:  dump_stack+0x10/0x12
kernel:  ubsan_epilogue+0x9/0x45
kernel:  __ubsan_handle_load_invalid_value.cold+0x44/0x49
kernel:  fcp_response.part.0.cold+0x1a/0x2b [snd_firewire_lib]
kernel:  fcp_response+0x28/0x30 [snd_firewire_lib]
kernel:  fw_core_handle_request+0x230/0x3d0 [firewire_core]
kernel:  handle_ar_packet+0x1d9/0x200 [firewire_ohci]
kernel:  ? handle_ar_packet+0x1d9/0x200 [firewire_ohci]
kernel:  ? transmit_complete_callback+0x9f/0x120 [firewire_core]
kernel:  ar_context_tasklet+0xa8/0x2e0 [firewire_ohci]
kernel:  tasklet_action_common.constprop.0+0xea/0xf0
kernel:  tasklet_action+0x22/0x30
kernel:  __do_softirq+0xd9/0x2e3
kernel:  ? irq_finalize_oneshot.part.0+0xf0/0xf0
kernel:  do_softirq+0x75/0xa0
kernel:  </IRQ>
kernel:  <TASK>
kernel:  __local_bh_enable_ip+0x50/0x60
kernel:  irq_forced_thread_fn+0x7e/0x90
kernel:  irq_thread+0xba/0x190
kernel:  ? irq_thread_fn+0x60/0x60
kernel:  kthread+0x11e/0x140
kernel:  ? irq_thread_check_affinity+0xf0/0xf0
kernel:  ? set_kthread_struct+0x50/0x50
kernel:  ret_from_fork+0x22/0x30
kernel:  </TASK>
kernel: ================================================================================

This commit fixes the bug. The bug has no disadvantage for the non-
control/notify AV/C transactions since the flag has an effect for AV/C
response with INTERIM (0x0f) status which is not used for the transactions
in AV/C general specification.

Fixes: 00a7bb81c20f ("ALSA: firewire-lib: Add support for deferred transaction")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fcp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/firewire/fcp.c b/sound/firewire/fcp.c
index bbfbebf4affb..564607e083ca 100644
--- a/sound/firewire/fcp.c
+++ b/sound/firewire/fcp.c
@@ -240,9 +240,7 @@ int fcp_avc_transaction(struct fw_unit *unit,
 	t.response_match_bytes = response_match_bytes;
 	t.state = STATE_PENDING;
 	init_waitqueue_head(&t.wait);
-
-	if (*(const u8 *)command == 0x00 || *(const u8 *)command == 0x03)
-		t.deferrable = true;
+	t.deferrable = !!(*(const u8 *)command == 0x00 || *(const u8 *)command == 0x03);
 
 	spin_lock_irq(&transactions_lock);
 	list_add_tail(&t.list, &transactions);
-- 
2.34.1

