Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6D32696C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 22:27:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBB716A8;
	Fri, 26 Feb 2021 22:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBB716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614374856;
	bh=rH52LK3JZZjaP5+Xzx8B9qlH13NWC6mCNrNDbwwhC0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RI5ILoWN8LV4WfZuAyTbw44pguSjSaR3+eEzJgccWZMjiEMv/0e0no9eAGij/03O3
	 ukXMSLul6SnfDcoiSA3m/jVS5OAuY4EyqHZAyG+3ezPL4gxGZKCRlJ+Q4MvmqJxvnn
	 9u9m1b9u5FMF2BKk0OZJvjvcbWED9GvhX7rADOWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48AF3F80234;
	Fri, 26 Feb 2021 22:26:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C610F8022D; Fri, 26 Feb 2021 22:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B44AF80161
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 22:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B44AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=george-graphics-co-uk.20150623.gappssmtp.com
 header.i=@george-graphics-co-uk.20150623.gappssmtp.com header.b="z0wP+jbM"
Received: by mail-pf1-x434.google.com with SMTP id b145so7122054pfb.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 13:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=george-graphics-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQuLN6vQ1ptZtp4bMRyyZsTd6BPgreKDQsJfM9SJC9A=;
 b=z0wP+jbM8a/adjYckcngBEkj2zXwVLvEBn3vXSDtf1a6Y0jvtGJFxOg4yRsVtx3EpP
 NNBnzHcf/0Htw5NGifO11vjhzkwDe7TK7VQdOqquglYuMgz1YJQ+USY2KC8nzB55e2lI
 uKDEjnPuLm2IFn1H1AddfMyALhDt2PxSgp7WGKAwBTK65uCk3/csgDFeNJd0ThxKDGyr
 IL7ZfqazEfJw14JeGOkb1+4S6QpLPAi1xEgPYG04K4yl1OEvcDf9StevIGs7shu8g6GS
 tGe8O0QUwi7xsBnur2LqxbJujG9dzrQGvV83Pxlx0jFeoEVTi3uelAbdgXLEzD4jFBrb
 L6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQuLN6vQ1ptZtp4bMRyyZsTd6BPgreKDQsJfM9SJC9A=;
 b=tTbiyIkoJWm2aJXksDzRL3jZQH5P2l8LJrokhvn1Ejz0IcB9UwiJKZDiBa0M5vbroW
 jsF1B/FOijEjdtQ7DOoMq+DxaZzXdQ93evzsVKt+DuNpgDQVB1F2f4SDTbT/GABZZFAX
 gY856a4rW2nsq3dy7/MS0UtVhF3oVzLrTJsdj66M8A6LnrkFidZmg2rPYKoSFb48vdpE
 aOncm5E0jtofSv6ZAZBUyUt1EFXLpY//7wqTXjXrotBbGh2VH7TR4bM/2ca9uyDW2bdS
 NKrHEVtVYobVKVBZv9WamkGJIMrg1Ec6VRfRjXb1kH1Yt1r2Oh/9j15dbuwuEBmIyY9F
 BciQ==
X-Gm-Message-State: AOAM532guNdl9iYoTzVEL45MOAirVEjBNyiDxSybn/0nsdL5xf5m4cYp
 s9rcS1YVlNXnafu0HvWuRrtPXw==
X-Google-Smtp-Source: ABdhPJwKt6VhW0uARrhC1Yo5BYTAj+wNNG5F0IdDYp9dGwXZrVt4dYMh6wS8oGRsvr11C7IBIhtYCQ==
X-Received: by 2002:aa7:9aad:0:b029:1ee:468a:d950 with SMTP id
 x13-20020aa79aad0000b02901ee468ad950mr2812806pfi.40.1614374796894; 
 Fri, 26 Feb 2021 13:26:36 -0800 (PST)
Received: from sequencer.hsd1.wa.comcast.net
 ([2601:602:8000:181:df1d:64b5:575f:9598])
 by smtp.gmail.com with ESMTPSA id 125sm10862073pfu.7.2021.02.26.13.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 13:26:36 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] midi streaming substream names from jack names A number
 of devices have named substreams which are hard to remember / decypher from
 <device> MIDI n names. Eg. Korg puts a pass through on one substream and
 iConnectivity devices name the connections.
Date: Fri, 26 Feb 2021 21:26:16 +0000
Message-Id: <20210226212617.24616-1-george@george-graphics.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <s5hczwpucd3.wl-tiwai@suse.de>
References: <s5hczwpucd3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, George Harker <george@george-graphics.co.uk>,
 Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

This makes it easier to connect to the correct device.  Devices which
handle naming through quirks are unaffected by this change.

Addresses TODO comment in sound/usb/midi.c

Signed-off-by: George Harker <george@george-graphics.co.uk>
---
 sound/usb/midi.c | 103 ++++++++++++++++++++++++++++++++++++++++++++---
 sound/usb/midi.h |   2 +
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index 610cf54ee..9efda4b06 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1740,12 +1740,68 @@ static void snd_usbmidi_get_port_info(struct snd_rawmidi *rmidi, int number,
 	}
 }
 
+static struct usb_midi_in_jack_descriptor *find_usb_in_jack_descriptor(
+					struct usb_host_interface *hostif, uint8_t jack_id)
+{
+	unsigned char *extra = hostif->extra;
+	int extralen = hostif->extralen;
+
+	while (extralen > 4) {
+		struct usb_midi_in_jack_descriptor *injd =
+				(struct usb_midi_in_jack_descriptor *)extra;
+
+		if (injd->bLength > 4 &&
+		    injd->bDescriptorType == USB_DT_CS_INTERFACE &&
+		    injd->bDescriptorSubtype == UAC_MIDI_IN_JACK &&
+				injd->bJackID == jack_id)
+			return injd;
+		if (!extra[0])
+			break;
+		extralen -= extra[0];
+		extra += extra[0];
+	}
+	return NULL;
+}
+
+static struct usb_midi_out_jack_descriptor *find_usb_out_jack_descriptor(
+					struct usb_host_interface *hostif, uint8_t jack_id)
+{
+	unsigned char *extra = hostif->extra;
+	int extralen = hostif->extralen;
+
+	while (extralen > 4) {
+		struct usb_midi_out_jack_descriptor *outjd =
+				(struct usb_midi_out_jack_descriptor *)extra;
+
+		if (outjd->bLength > 4 &&
+		    outjd->bDescriptorType == USB_DT_CS_INTERFACE &&
+		    outjd->bDescriptorSubtype == UAC_MIDI_OUT_JACK &&
+				outjd->bJackID == jack_id)
+			return outjd;
+		if (!extra[0])
+			break;
+		extralen -= extra[0];
+		extra += extra[0];
+	}
+	return NULL;
+}
+
 static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
-				       int stream, int number,
+				       int stream, int number, int jack_id,
 				       struct snd_rawmidi_substream **rsubstream)
 {
 	struct port_info *port_info;
 	const char *name_format;
+	struct usb_interface *intf;
+	struct usb_host_interface *hostif;
+	struct usb_midi_in_jack_descriptor *injd;
+	struct usb_midi_out_jack_descriptor *outjd;
+	uint8_t jack_name_buf[32];
+	uint8_t *default_jack_name = "MIDI";
+	uint8_t *jack_name = default_jack_name;
+	uint8_t iJack;
+	size_t sz;
+	int res;
 
 	struct snd_rawmidi_substream *substream =
 		snd_usbmidi_find_substream(umidi, stream, number);
@@ -1755,11 +1811,36 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 		return;
 	}
 
-	/* TODO: read port name from jack descriptor */
+	intf = umidi->iface;
+	if (intf && jack_id >= 0) {
+		hostif = intf->cur_altsetting;
+		iJack = 0;
+		if (stream != SNDRV_RAWMIDI_STREAM_OUTPUT) {
+			/* in jacks connect to outs */
+			outjd = find_usb_out_jack_descriptor(hostif, jack_id);
+			if (outjd) {
+				sz = USB_DT_MIDI_OUT_SIZE(outjd->bNrInputPins);
+				iJack = *(((uint8_t *) outjd) + sz - sizeof(uint8_t));
+			}
+		} else {
+			/* and out jacks connect to ins */
+			injd = find_usb_in_jack_descriptor(hostif, jack_id);
+			if (injd)
+				iJack = injd->iJack;
+		}
+		if (iJack != 0) {
+			res = usb_string(umidi->dev, iJack, jack_name_buf,
+			  ARRAY_SIZE(jack_name_buf));
+			if (res)
+				jack_name = jack_name_buf;
+		}
+	}
+
 	port_info = find_port_info(umidi, number);
-	name_format = port_info ? port_info->name : "%s MIDI %d";
+	name_format = port_info ? port_info->name :
+		(jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
 	snprintf(substream->name, sizeof(substream->name),
-		 name_format, umidi->card->shortname, number + 1);
+		 name_format, umidi->card->shortname, jack_name, number + 1);
 
 	*rsubstream = substream;
 }
@@ -1794,6 +1875,7 @@ static int snd_usbmidi_create_endpoints(struct snd_usb_midi *umidi,
 				snd_usbmidi_init_substream(umidi,
 							   SNDRV_RAWMIDI_STREAM_OUTPUT,
 							   out_ports,
+							   endpoints[i].assoc_out_jacks[j],
 							   &umidi->endpoints[i].out->ports[j].substream);
 				++out_ports;
 			}
@@ -1801,6 +1883,7 @@ static int snd_usbmidi_create_endpoints(struct snd_usb_midi *umidi,
 				snd_usbmidi_init_substream(umidi,
 							   SNDRV_RAWMIDI_STREAM_INPUT,
 							   in_ports,
+							   endpoints[i].assoc_in_jacks[j],
 							   &umidi->endpoints[i].in->ports[j].substream);
 				++in_ports;
 			}
@@ -1846,7 +1929,7 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 	struct usb_host_endpoint *hostep;
 	struct usb_endpoint_descriptor *ep;
 	struct usb_ms_endpoint_descriptor *ms_ep;
-	int i, epidx;
+	int i, j, epidx;
 
 	intf = umidi->iface;
 	if (!intf)
@@ -1895,6 +1978,10 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 				endpoints[epidx].out_interval = 1;
 			endpoints[epidx].out_cables =
 				(1 << ms_ep->bNumEmbMIDIJack) - 1;
+			for (j = 0; j < ms_ep->bNumEmbMIDIJack; ++j)
+				endpoints[epidx].assoc_out_jacks[j] = ms_ep->baAssocJackID[j];
+			for (; j < ARRAY_SIZE(endpoints[epidx].assoc_out_jacks); ++j)
+				endpoints[epidx].assoc_out_jacks[j] = -1;
 			dev_dbg(&umidi->dev->dev, "EP %02X: %d jack(s)\n",
 				ep->bEndpointAddress, ms_ep->bNumEmbMIDIJack);
 		} else {
@@ -1912,6 +1999,10 @@ static int snd_usbmidi_get_ms_info(struct snd_usb_midi *umidi,
 				endpoints[epidx].in_interval = 1;
 			endpoints[epidx].in_cables =
 				(1 << ms_ep->bNumEmbMIDIJack) - 1;
+			for (j = 0; j < ms_ep->bNumEmbMIDIJack; ++j)
+				endpoints[epidx].assoc_in_jacks[j] = ms_ep->baAssocJackID[j];
+			for (; j < ARRAY_SIZE(endpoints[epidx].assoc_in_jacks); ++j)
+				endpoints[epidx].assoc_in_jacks[j] = -1;
 			dev_dbg(&umidi->dev->dev, "EP %02X: %d jack(s)\n",
 				ep->bEndpointAddress, ms_ep->bNumEmbMIDIJack);
 		}
@@ -2228,11 +2319,13 @@ static int snd_usbmidi_create_endpoints_midiman(struct snd_usb_midi *umidi,
 			snd_usbmidi_init_substream(umidi,
 						   SNDRV_RAWMIDI_STREAM_OUTPUT,
 						   cable,
+						   -1 /* prevent trying to find jack */,
 						   &umidi->endpoints[cable & 1].out->ports[cable].substream);
 		if (endpoint->in_cables & (1 << cable))
 			snd_usbmidi_init_substream(umidi,
 						   SNDRV_RAWMIDI_STREAM_INPUT,
 						   cable,
+						   -1 /* prevent trying to find jack */,
 						   &umidi->endpoints[0].in->ports[cable].substream);
 	}
 	return 0;
diff --git a/sound/usb/midi.h b/sound/usb/midi.h
index 8c38aec22..3f153195c 100644
--- a/sound/usb/midi.h
+++ b/sound/usb/midi.h
@@ -13,6 +13,8 @@ struct snd_usb_midi_endpoint_info {
 	uint8_t  in_interval;
 	uint16_t out_cables;	/* bitmask */
 	uint16_t in_cables;	/* bitmask */
+	int16_t  assoc_in_jacks[16];
+	int16_t  assoc_out_jacks[16];
 };
 
 /* for QUIRK_MIDI_YAMAHA, data is NULL */
-- 
2.20.1

