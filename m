Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49824035B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 10:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E0083D;
	Mon, 10 Aug 2020 10:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E0083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597047971;
	bh=2I9SDIqqVVIf7bNDgIMLZde/Y/OpDUkHNu8pRpuG/3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CbNMqfR0X5K4IuvPDQ9+uQJ9FPy47ql8qz25BP+j7o9kKUw75wdSpPNoavS6BV1jl
	 +S+Z/N88PPKCGnz2kEphacfaFR2+3nxxwQi9j2bgXUI0h9yhiZZFIjz1PfLxdn/31u
	 95aMvPqjtdg4dL4J9bMbeoDOcU6xSOWK6tE/rn9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F00F8022D;
	Mon, 10 Aug 2020 10:24:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB8BBF800BC; Mon, 10 Aug 2020 10:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D84E0F800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 10:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D84E0F800BC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0878141A78;
 Mon, 10 Aug 2020 08:24:13 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: work around streaming quirk for MacroSilicon
 MS2109
Date: Mon, 10 Aug 2020 17:24:00 +0900
Message-Id: <20200810082400.225858-1-marcan@marcan.st>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hector Martin <marcan@marcan.st>,
 stable@vger.kernel.org
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

Further investigation of the L-R swap problem on the MS2109 reveals that
the problem isn't that the channels are swapped, but rather that they
are swapped and also out of phase by one sample. In other words, the
issue is actually that the very first frame that comes from the hardware
is a half-frame containing only the right channel, and after that
everything becomes offset.

So introduce a new quirk field to drop the very first 2 bytes that come
in after the format is configured and a capture stream starts. This puts
the channels in phase and in the correct order.

Cc: stable@vger.kernel.org
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 sound/usb/card.h   | 1 +
 sound/usb/pcm.c    | 6 ++++++
 sound/usb/quirks.c | 3 +++
 sound/usb/stream.c | 1 +
 4 files changed, 11 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index de43267b9c8a..5351d7183b1b 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -137,6 +137,7 @@ struct snd_usb_substream {
 	unsigned int tx_length_quirk:1;	/* add length specifier to transfers */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
+	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
 	unsigned int running: 1;	/* running status */
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 415bfec49a01..5600751803cf 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1420,6 +1420,12 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 			// continue;
 		}
 		bytes = urb->iso_frame_desc[i].actual_length;
+		if (subs->stream_offset_adj > 0) {
+			unsigned int adj = min(subs->stream_offset_adj, bytes);
+			cp += adj;
+			bytes -= adj;
+			subs->stream_offset_adj -= adj;
+		}
 		frames = bytes / stride;
 		if (!subs->txfr_quirk)
 			bytes = frames * stride;
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c551141f337e..abf99b814a0f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1495,6 +1495,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
 		pioneer_djm_set_format_quirk(subs);
 		break;
+	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
+		subs->stream_offset_adj = 2;
+		break;
 	}
 }
 
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 4d1e6579e54d..ca76ba5b5c0b 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -94,6 +94,7 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 	subs->tx_length_quirk = as->chip->tx_length_quirk;
 	subs->speed = snd_usb_get_speed(subs->dev);
 	subs->pkt_offset_adj = 0;
+	subs->stream_offset_adj = 0;
 
 	snd_usb_set_pcm_ops(as->pcm, stream);
 
-- 
2.27.0

