Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572588B72A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 03:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3589231C;
	Tue, 26 Mar 2024 03:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3589231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711418426;
	bh=godkSQKzA+faGIiVFZsDHyhNsvM15bnkQ1YACwtY2GU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D/iNBKJBMySbTxQOmYNWNCikSMGr6LtPCs3bWt+pYrsNio4Pi2vT/bn1FjTmGHDSZ
	 hY8cwvM3Kl5NJKH/EDDmIBNKP5Y1dF55FmgrLrFr5idL/WRvaeM36NFIF5rjWCJYRX
	 achMNALjTnip6oFhOLhId+sa5q5qgSbVsqsTOICU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 395C2F805A1; Tue, 26 Mar 2024 02:59:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84929F805A1;
	Tue, 26 Mar 2024 02:59:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D31F8025F; Tue, 26 Mar 2024 02:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27039F801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 02:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27039F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vEseGsx9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D7A961057;
	Tue, 26 Mar 2024 01:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E54C433C7;
	Tue, 26 Mar 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711418376;
	bh=godkSQKzA+faGIiVFZsDHyhNsvM15bnkQ1YACwtY2GU=;
	h=Date:From:To:Cc:Subject:From;
	b=vEseGsx9VChXF6uoxfB81/TXxABM0Tm8P30hdOtWQH6VzHSy3gSeFMON0IL7wc44r
	 ZRdhiHS5jriNrOHhmeYJDesXljZs1Rrn17t06sM8kZvEGFgUd6iWyZjnQzoWwYImcy
	 +DzsiGlhCkliNR+Xr9b0nQtSs9UJ9rMaf051oIcoINiPQOqLGDeKHNcKKl71ue4J0p
	 j151q4LQNuT7XvYsSEtS0ohKksohJmPWYnKDp0sKNjrsuUE/t9xFzGQdoH/F6UMaYo
	 +XiTX3QfRWcnP5/9rfSGKmaSBpBdtsrEY2cyPSy5VW+hJUtfn3juyvxwfaqz5wWCE2
	 t8DSj/HZB4uwQ==
Date: Mon, 25 Mar 2024 19:59:34 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] ALSA: firewire-lib: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <ZgIsBqoMb7p3fMDr@neat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 3VRSS4BIVEEF26URCVOOAIAJOBTMP6SF
X-Message-ID-Hash: 3VRSS4BIVEEF26URCVOOAIAJOBTMP6SF
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VRSS4BIVEEF26URCVOOAIAJOBTMP6SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the `DEFINE_FLEX()` helper for an on-stack definition of a
flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:
sound/firewire/amdtp-stream.c:1184:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Link: https://github.com/KSPP/linux/issues/202
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use DEFINE_FLEX() helper instead of a new tagged struct.

v1:
 - Link: https://lore.kernel.org/linux-hardening/d3a764eb76909b16b8a22d9ff530e5edf0e59e6b.1709658886.git.gustavoars@kernel.org/

 sound/firewire/amdtp-stream.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c9f153f85ae6..d35d0a420ee0 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1180,13 +1180,11 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
 
 	for (i = 0; i < packets; ++i) {
-		struct {
-			struct fw_iso_packet params;
-			__be32 header[CIP_HEADER_QUADLETS];
-		} template = { {0}, {0} };
+		DEFINE_FLEX(struct fw_iso_packet, template, header,
+			    header_length, CIP_HEADER_QUADLETS);
 		bool sched_irq = false;
 
-		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
+		build_it_pkt_header(s, desc->cycle, template, pkt_header_length,
 				    desc->data_blocks, desc->data_block_counter,
 				    desc->syt, i, curr_cycle_time);
 
@@ -1198,7 +1196,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			}
 		}
 
-		if (queue_out_packet(s, &template.params, sched_irq) < 0) {
+		if (queue_out_packet(s, template, sched_irq) < 0) {
 			cancel_stream(s);
 			return;
 		}
-- 
2.34.1

