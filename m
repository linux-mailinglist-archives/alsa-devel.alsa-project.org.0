Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF794CD498
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 13:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADFC18DD;
	Fri,  4 Mar 2022 13:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADFC18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646398693;
	bh=c9GsidHFer9z4Reazya4U/pdoSFZnMPjcH9x6GJMMko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ujUvT9w6YOXeGxqI9dEaEUS9H3uicuktvm9NTeZUp8a2t6LPGk9eVfW4HYb2A67Qg
	 NobTQshohN8hDoqH6WNQMgV/DUvz3JjQM6mCvS8rZvdFMTttPjvUkAQyPqlfIzFZ6A
	 bbYs6D7c8zWefei/3H8tSni8K4gw3Q+56XDaEDtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9145FF801F5;
	Fri,  4 Mar 2022 13:57:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4472F800F2; Fri,  4 Mar 2022 13:57:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD892F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 13:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD892F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ukNRHifO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HT8xZYlj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 330F95C0167;
 Fri,  4 Mar 2022 07:56:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 07:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=S9+2MFWplu0f54AmUu36RPYDmbTlSVqLmnJd4O
 0e+o8=; b=ukNRHifOM1HIApe53EiiV5W/AZV1us4NO851jhQ/d/DLTmBeImZCBQ
 CRVdr72kkvouv6gV0kWJ3qAaW2XvzeovxM/x72UFI3HDOOL6ETLc0OAuRJTCIbDt
 AT30zcs7WP232Z0pH3PUb31YpPBOxj28FZZYP8FDq1yfgx4+QkU1QrvA0n7FUs/x
 UaUfnXdqrVhA60y2QHoPKsITkfYSuh9LKHyt55EpV0VmscZm8Mhjn4wPNFrriYFt
 UBbZmOOH42r6W/2hDs4fSYixC1wi44FwjYBiWHpkTT4MMNHviQYC+jNs0580imf/
 zR9jbiJetgHJDCfN2v/KoweonoVTvuMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=S9+2MFWplu0f54AmUu36RPYDmbTlS
 VqLmnJd4O0e+o8=; b=HT8xZYljl7xsmwtrS3zG/gMY8EtheipxUmVBahRWmeSNu
 l5GGHNckk+O7IPxfDAvdcV5N2QM8+dkX6GLI8nGMacaEOKmbIWzIo53q2zOu5iO+
 VtDFIMVi5T0NoE/21Dh800CGxSsowxuorcWzMhm2fLzqzaGteFqEiiuUZPaoYGiO
 YsDLTMY9Oq65TiprFnDs5qiY5ZMGKgLfObHN5xqu9YQsRiAaAp8Sopg9Xq9ijYyi
 C9/+tx73DsV0ocRLhZuskPP+1Yf9dPnExZqGP/FXLgJX7xzi8XwPXsTuQtCUY5eS
 natX+zIRjgjcufxAzYAShW6JL4A5X8bpD2iyWeQOQ==
X-ME-Sender: <xms:kwwiYvinpyOq3xFMiVprOSLXD7BRJtiD8XuIiLut-M-I4BJ-OXGaUQ>
 <xme:kwwiYsBw4f8PjmI-lGKtgf0wn29dUK5cXSSf4cTxB9fAtJYFefL1Wzhuk6-EBB6BQ
 EzsHZOvo8wlRh64Di8>
X-ME-Received: <xmr:kwwiYvHZqeZlSalt1IRM3oGaYyMXlsHKP9XXzgnatIehNyaocrBoTYnB5ASIwsR2hYxqtbwqOgI5KZuiNUbavE4mqe42l4IbiI7QLBGgAPW8K76JDETU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kwwiYsS9L_1BGY-9pXUXUDoAZTMrtnGHkoGltOlWhVUfmztNXzae6w>
 <xmx:kwwiYsyoxdboB74ICo5ToBDYV8FHLVrRRQ8kwbYX3lUlqOweghmetw>
 <xmx:kwwiYi7Dxgz41fDa8f4N-T60k32ygtUbMpun70oi03bdYGldGz5g_A>
 <xmx:lAwiYpo9r45mCLZ2YngjqryJJVNIgqPrK4-eKg7Y36t3lQMXUB0tbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 07:56:50 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2] ALSA: firewire-lib: fix uninitialized flag for AV/C
 deferred transaction
Date: Fri,  4 Mar 2022 21:56:47 +0900
Message-Id: <20220304125647.78430-1-o-takashi@sakamocchi.jp>
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
index bbfbebf4affb..df44dd5dc4b2 100644
--- a/sound/firewire/fcp.c
+++ b/sound/firewire/fcp.c
@@ -240,9 +240,7 @@ int fcp_avc_transaction(struct fw_unit *unit,
 	t.response_match_bytes = response_match_bytes;
 	t.state = STATE_PENDING;
 	init_waitqueue_head(&t.wait);
-
-	if (*(const u8 *)command == 0x00 || *(const u8 *)command == 0x03)
-		t.deferrable = true;
+	t.deferrable = (*(const u8 *)command == 0x00 || *(const u8 *)command == 0x03);
 
 	spin_lock_irq(&transactions_lock);
 	list_add_tail(&t.list, &transactions);
-- 
2.34.1

