Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045DA87259C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 18:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644A783B;
	Tue,  5 Mar 2024 18:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644A783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709659573;
	bh=4nFC5omIFOjOAJ+cP/UoTfF1yurBWzlnntNqzpar1uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sOXDcslKcoOPB7HKJGMJumUqDrJk8mLEC9EoR4lGf9RSO+YR7nRj4s7JDCLMBQ7QP
	 ZloKRlEbju1jyI/Dwb5bJ0EE7w5ACYEV6Zs+jMfWdgrVNUwWIWCLZs40+sJyEGP0ga
	 ioZxIhWYq9p9RZ3aenVKRe6zc8lD9a2O6vEmGM0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F607F805AC; Tue,  5 Mar 2024 18:25:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9354FF805BE;
	Tue,  5 Mar 2024 18:25:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B46F8024E; Tue,  5 Mar 2024 18:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74692F802E8
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 18:25:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74692F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nGIoI2Rq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0C1D61671;
	Tue,  5 Mar 2024 17:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE95C433C7;
	Tue,  5 Mar 2024 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659535;
	bh=4nFC5omIFOjOAJ+cP/UoTfF1yurBWzlnntNqzpar1uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGIoI2RqSSD+o5WgK9vgZYqgif+hg8huqzeRQfiT4srghDdJmIeoqQSII8KF0NwNc
	 WhTFl3lISg2N3BXnnD8honFCDlkWkCLPzATIHWdliP3x3xjDnxmO6KuHzM2zL5APwC
	 sAiyhqYbkWpDmbBP1JA/FAzosdQDSChqnfX/LBUGWTz9WUX/TEx3zPIzORcgYSm99b
	 xYlQr6Z0yT4rAAWNEdQHP02sm4tNCDMnTGNARDBIrNaLW3sU3t2zXk1dvhGbcqpg0n
	 2F/sl6ixgTHrDNsicoFbpZ7owAlaGBnYy+P+Se9N6NqcNkd121JRUA5eDQIObyb65h
	 wno0/gZxqkbdw==
Date: Tue, 5 Mar 2024 11:25:32 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: [PATCH 2/2][next] ALSA: firewire-lib: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: 
 <d3a764eb76909b16b8a22d9ff530e5edf0e59e6b.1709658886.git.gustavoars@kernel.org>
References: <cover.1709658886.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1709658886.git.gustavoars@kernel.org>
Message-ID-Hash: CW6OHME5YW5AJRCFSDT4J56OH2LH2J73
X-Message-ID-Hash: CW6OHME5YW5AJRCFSDT4J56OH2LH2J73
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CW6OHME5YW5AJRCFSDT4J56OH2LH2J73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

-Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
ready to enable it globally.

There is currently a local structure `template` that is using a flexible
`struct fw_iso_packet` as a header for an on-stack array
`__be32 header[CIP_HEADER_QUADLETS];`.

struct {
	struct fw_iso_packet params;
	__be32 header[CIP_HEADER_QUADLETS];
} template = { {0}, {0} };

However, we are deprecating flexible arrays in the middle of another
struct. So, in order to avoid this, we use the `struct_group_tagged()`
helper to separate the flexible array from the rest of the members in
the flexible structure:

struct fw_iso_packet {
        struct_group_tagged(fw_iso_packet_hdr, hdr,
                ... the rest of the members
        );
        u32 header[];           /* tx: Top of 1394 isoch. data_block    */
};

With the change described above, we can now declare an object of the
type of the tagged struct, without embedding the flexible array in the
middle of another struct:

struct {
	struct fw_iso_packet_hdr params;
	__be32 header[CIP_HEADER_QUADLETS];
} template = { {0}, {0} };

We also use `container_of()` whenever we need to retrieve a pointer to
the flexible structure.

So, with these changes, fix the following warning:

sound/firewire/amdtp-stream.c: In function ‘process_rx_packets’:
sound/firewire/amdtp-stream.c:1184:46: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
 1184 |                         struct fw_iso_packet params;
      |

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/firewire/amdtp-stream.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c9f153f85ae6..7ba1cd64d7f1 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1181,12 +1181,14 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 
 	for (i = 0; i < packets; ++i) {
 		struct {
-			struct fw_iso_packet params;
+			struct fw_iso_packet_hdr params;
 			__be32 header[CIP_HEADER_QUADLETS];
 		} template = { {0}, {0} };
+		struct fw_iso_packet *params =
+			container_of(&template.params, struct fw_iso_packet, hdr);
 		bool sched_irq = false;
 
-		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
+		build_it_pkt_header(s, desc->cycle, params, pkt_header_length,
 				    desc->data_blocks, desc->data_block_counter,
 				    desc->syt, i, curr_cycle_time);
 
@@ -1198,7 +1200,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			}
 		}
 
-		if (queue_out_packet(s, &template.params, sched_irq) < 0) {
+		if (queue_out_packet(s, params, sched_irq) < 0) {
 			cancel_stream(s);
 			return;
 		}
-- 
2.34.1

