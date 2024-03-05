Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995287259B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 18:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B8F206;
	Tue,  5 Mar 2024 18:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B8F206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709659551;
	bh=0lwIjheUVVinIAmrLyBNdgK66HWaAqekBzSfCyt9IXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rjb+Oao0iM1xXktmUio2hYBUUY/Gk/znnZXFdC8IOpU5dAVHfFMMv+aLu99wpkY0D
	 iu6NiFUWNzre2jYmes11TuRFyd2WDWbtgwcRDylpFy4r6k7NDkG4xuaxV1KoPQZRJb
	 J1t3uzq+WDeRQYdGtCCCqm9o88iBb9v4LTmnTGig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CE72F805AD; Tue,  5 Mar 2024 18:25:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 361E4F8057D;
	Tue,  5 Mar 2024 18:25:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2E7EF801F5; Tue,  5 Mar 2024 18:25:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D04D7F802E8
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 18:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D04D7F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z903NSju
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6DBACE1AE7;
	Tue,  5 Mar 2024 17:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427CCC433F1;
	Tue,  5 Mar 2024 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659498;
	bh=0lwIjheUVVinIAmrLyBNdgK66HWaAqekBzSfCyt9IXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z903NSjuRS54CjitvIUAHCtyiTeYD9kpF16xaR6iCL0pBoY7G2j1sdFwYrxw9llc3
	 vAneSCEfELCgq9mk8dxSj/AJSDfxpBXh9Of7zHDuhZgbHAJVxkAPbYfl++P3FK7PFB
	 ep2fLKsOtkra6ll9CtSwoHrap4qqibhT7NhvSAsbvhhSAbPu4D6lEVM+8v8wbrxjeD
	 J+RXr4lNozZ6SEp6K5qX54J4yelJI2ZD5Q14HEPyj3rVU/e1/PvAXhhSsVP7b+Ay2T
	 fI6tLHe/LNMDZMrS3K4cUImbIQPtrpmQ8XFYMUZCyUphwI5obMSq0gHxYRJAXyh1z/
	 gC/rlOZXKIS3Q==
Date: Tue, 5 Mar 2024 11:24:55 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: [PATCH 1/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: 
 <eac86b3b9b84859528c346977a8f879188dc61e0.1709658886.git.gustavoars@kernel.org>
References: <cover.1709658886.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1709658886.git.gustavoars@kernel.org>
Message-ID-Hash: 7LFPF7EMD2LHS3WWH4MW3THWJOTV6F7X
X-Message-ID-Hash: 7LFPF7EMD2LHS3WWH4MW3THWJOTV6F7X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LFPF7EMD2LHS3WWH4MW3THWJOTV6F7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

-Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
ready to enable it globally.

There is currently a local structure `u` that is using a flexible
`struct fw_iso_packet` as header for an on-stack array `u8 header[256]`.

struct {
	struct fw_iso_packet packet;
	u8 header[256];
} u;

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
        struct fw_iso_packet_hdr packet;
        u8 header[256];
} u;

We also use `container_of()` whenever we need to retrieve a pointer to
the flexible structure, through which the flexible-array member can be
accessed, as in this case.

So, with these changes, fix the following warning:

drivers/firewire/core-cdev.c: In function ‘ioctl_queue_iso’:
drivers/firewire/core-cdev.c:1129:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
 1129 |                 struct fw_iso_packet packet;
      |                                      ^~~~~~

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/firewire/core-cdev.c |  9 +++++----
 include/linux/firewire.h     | 16 +++++++++-------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 6274b86eb943..e1f1daa2e667 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1126,9 +1126,11 @@ static int ioctl_queue_iso(struct client *client, union ioctl_arg *arg)
 	u32 control;
 	int count;
 	struct {
-		struct fw_iso_packet packet;
+		struct fw_iso_packet_hdr packet;
 		u8 header[256];
 	} u;
+	struct fw_iso_packet *packet =
+			container_of(&u.packet, struct fw_iso_packet, hdr);
 
 	if (ctx == NULL || a->handle != 0)
 		return -EINVAL;
@@ -1192,7 +1194,7 @@ static int ioctl_queue_iso(struct client *client, union ioctl_arg *arg)
 		if (next > end)
 			return -EINVAL;
 		if (copy_from_user
-		    (u.packet.header, p->header, transmit_header_bytes))
+		    (packet->header, p->header, transmit_header_bytes))
 			return -EFAULT;
 		if (u.packet.skip && ctx->type == FW_ISO_CONTEXT_TRANSMIT &&
 		    u.packet.header_length + u.packet.payload_length > 0)
@@ -1200,8 +1202,7 @@ static int ioctl_queue_iso(struct client *client, union ioctl_arg *arg)
 		if (payload + u.packet.payload_length > buffer_end)
 			return -EINVAL;
 
-		if (fw_iso_context_queue(ctx, &u.packet,
-					 &client->buffer, payload))
+		if (fw_iso_context_queue(ctx, packet, &client->buffer, payload))
 			break;
 
 		p = next;
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index dd9f2d765e68..becd3a60d0fb 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -456,13 +456,15 @@ void fw_core_remove_descriptor(struct fw_descriptor *desc);
  * scatter-gather streaming (e.g. assembling video frame automatically).
  */
 struct fw_iso_packet {
-	u16 payload_length;	/* Length of indirect payload		*/
-	u32 interrupt:1;	/* Generate interrupt on this packet	*/
-	u32 skip:1;		/* tx: Set to not send packet at all	*/
-				/* rx: Sync bit, wait for matching sy	*/
-	u32 tag:2;		/* tx: Tag in packet header		*/
-	u32 sy:4;		/* tx: Sy in packet header		*/
-	u32 header_length:8;	/* Length of immediate header		*/
+	struct_group_tagged(fw_iso_packet_hdr, hdr,
+		u16 payload_length;	/* Length of indirect payload		*/
+		u32 interrupt:1;	/* Generate interrupt on this packet	*/
+		u32 skip:1;		/* tx: Set to not send packet at all	*/
+		/* rx: Sync bit, wait for matching sy	*/
+		u32 tag:2;		/* tx: Tag in packet header		*/
+		u32 sy:4;		/* tx: Sy in packet header		*/
+		u32 header_length:8;	/* Length of immediate header		*/
+	);
 	u32 header[];		/* tx: Top of 1394 isoch. data_block	*/
 };
 
-- 
2.34.1

