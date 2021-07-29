Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16A3DA0D1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20421EF0;
	Thu, 29 Jul 2021 12:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20421EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553187;
	bh=CCLKh5oUr8lW9gycgAWWq2lS4rXBgp4COEvWv38S+nw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrTFoPA6WnL0ufjUIx4E4s7gQo1yrrdMVLQ4DycExV5BUPoQGt2I4Ol9IQwALDRb4
	 nj14Jig+Ch0W6QdcF4lloiw91gqZ++tx71BahDTZZdLLh1h6kSKJaey4k0hoWkFfai
	 lrl9zPBEIJ/+3xMOVlVMGq0rsXWhyJs9teXBZJxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB9C1F804EC;
	Thu, 29 Jul 2021 12:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4183EF804E2; Thu, 29 Jul 2021 12:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16833F80276
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16833F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wXbv6XvJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rUW8xm82"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EAA4C2020B
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WB3hel0R994Rt8SOqVo1irgt7PL4nK3QV0WbP/7tYpo=;
 b=wXbv6XvJTOrzC0tTjPpMAL3zYA78DnIIGJm2YkUrfglTlPXKagBmaUU36IAICzTu6VS+7w
 1li90oip7w2nAC5QxyOoO7OCrxtJK4ZU/f5/exFJ/Fp2bSKxjT+Ve2Nhhc3IisTSTQFmve
 ASWG/nWxxTtdjOkzW5t5YUaICnBbB9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WB3hel0R994Rt8SOqVo1irgt7PL4nK3QV0WbP/7tYpo=;
 b=rUW8xm82tq2Bu4ymBWLfcDft3KrVGUgx3+8w/4QnBhUmdarNF4tUc5hue4U5ogTyTU6/Jo
 s0x5D6+rfhf1QTBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EA6A4A3BDA;
 Thu, 29 Jul 2021 07:38:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/15] ALSA: usb-audio: Move tx_length quirk handling to
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:50 +0200
Message-Id: <20210729073855.19043-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210729073855.19043-1-tiwai@suse.de>
References: <20210729073855.19043-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

There is another quirk for the transfer, and that's currently specific
to Zoom R16/24, handled in create_standard_audio_quirk().  Let's move
this also to the new quirk_flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 9 +++++++--
 sound/usb/quirks.c   | 5 ++---
 sound/usb/stream.c   | 2 +-
 sound/usb/usbaudio.h | 4 +++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4f856771216b..16c36e43c16f 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -240,6 +240,11 @@ static void retire_inbound_urb(struct snd_usb_endpoint *ep,
 	call_retire_callback(ep, urb);
 }
 
+static inline bool has_tx_length_quirk(struct snd_usb_audio *chip)
+{
+	return chip->quirk_flags & QUIRK_FLAG_TX_LENGTH;
+}
+
 static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 			       struct snd_urb_ctx *ctx)
 {
@@ -250,7 +255,7 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 	int i;
 
 	/* For tx_length_quirk, put packet length at start of packet */
-	if (ep->chip->tx_length_quirk)
+	if (has_tx_length_quirk(ep->chip))
 		extra = sizeof(packet_length);
 
 	for (i = 0; i < ctx->packets; ++i) {
@@ -952,7 +957,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 	unsigned int max_urbs, i;
 	const struct audioformat *fmt = ep->cur_audiofmt;
 	int frame_bits = ep->cur_frame_bytes * 8;
-	int tx_length_quirk = (chip->tx_length_quirk &&
+	int tx_length_quirk = (has_tx_length_quirk(chip) &&
 			       usb_pipeout(ep->pipe));
 
 	usb_audio_dbg(chip, "Setting params for data EP 0x%x, pipe 0x%x\n",
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5dce068f613a..9f295cb8c3c5 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -95,9 +95,6 @@ static int create_standard_audio_quirk(struct snd_usb_audio *chip,
 	struct usb_interface_descriptor *altsd;
 	int err;
 
-	if (chip->usb_id == USB_ID(0x1686, 0x00dd)) /* Zoom R16/24 */
-		chip->tx_length_quirk = 1;
-
 	alts = &iface->altsetting[0];
 	altsd = get_iface_desc(alts);
 	err = snd_usb_parse_audio_interface(chip, altsd->bInterfaceNumber);
@@ -1909,6 +1906,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
+		   QUIRK_FLAG_TX_LENGTH),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 541ab19101eb..ceb93d798182 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -90,7 +90,7 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 	subs->direction = stream;
 	subs->dev = as->chip->dev;
 	subs->txfr_quirk = !!(as->chip->quirk_flags & QUIRK_FLAG_ALIGN_TRANSFER);
-	subs->tx_length_quirk = as->chip->tx_length_quirk;
+	subs->tx_length_quirk = !!(as->chip->quirk_flags & QUIRK_FLAG_TX_LENGTH);
 	subs->speed = snd_usb_get_speed(subs->dev);
 	subs->pkt_offset_adj = 0;
 	subs->stream_offset_adj = 0;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 170e96865061..4003ca99d4ac 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -35,7 +35,6 @@ struct snd_usb_audio {
 	atomic_t usage_count;
 	wait_queue_head_t shutdown_wait;
 	unsigned int quirk_flags;
-	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
 	unsigned int playback_first:1;	/* for implicit fb: don't wait for the first capture URBs */
 	int num_interfaces;
@@ -138,10 +137,13 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_ALIGN_TRANSFER:
  *  Allow alignment on audio sub-slot (channel samples) rather than on audio
  *  slots (audio frames)
+ * QUIRK_TX_LENGTH:
+ *  Add length specifier to transfers
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
 #define QUIRK_FLAG_SHARE_MEDIA_DEVICE	(1U << 1)
 #define QUIRK_FLAG_ALIGN_TRANSFER	(1U << 2)
+#define QUIRK_FLAG_TX_LENGTH		(1U << 3)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

