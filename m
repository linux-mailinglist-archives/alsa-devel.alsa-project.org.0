Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A61CCCE8
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 20:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C3115F9;
	Sun, 10 May 2020 20:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C3115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589135473;
	bh=O6zELkNrvcEPnNW2UhSZ8t2+JhT8C4aw3PPj6wiJBkQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WtPb71vl72p4jnS6IJoa8WNLmAx9JCITXiNeorXP0j9wCWhQN1Zl1nGNRrHjusgk5
	 XNK6tk1YSOR+qmfN14FdUtwfcB8ntPyX1C1oDwAJNXmK7ZutH8A8B6rB0nEJFYK/f9
	 Co64eNQpbW6M/0yQvvrZkJHC/SK6eQaLJCbUZo8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFDEF80148;
	Sun, 10 May 2020 20:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B789DF80158; Sun, 10 May 2020 20:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from outbound.soverin.net (outbound.soverin.net
 [IPv6:2a01:4f8:fff0:2d:8::215])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CE51F800BF
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 20:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE51F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="vW00Iug3"; 
 dkim=pass (1024-bit key) header.d=freedom.nl header.i=@freedom.nl
 header.b="WO983mgW"
Received: from smtp.freedom.nl (unknown [10.10.3.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by outbound.soverin.net (Postfix) with ESMTPS id F3C9662C78
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 18:29:17 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [116.202.65.211]) by
 soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1589135357; bh=O6zELkNrvcEPnNW2UhSZ8t2+JhT8C4aw3PPj6wiJBkQ=;
 h=From:To:Subject:Date:From;
 b=vW00Iug3HfTDm8mz32d6IX8+Nz6ghaHD3WIsoeOJ0yaThuLnilxxsBE47PuRsEg8q
 37EZisPN7HKGLToqhH0gYlntR1dTXIaSskVaz592ICPJ/DHf/oM0dRgQEzQztd40Dl
 5hbga8sgFhOKVio8ADIyml62OGfiShgc4tLUneMk=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=freedom.nl; s=default;
 t=1589135358; bh=O6zELkNrvcEPnNW2UhSZ8t2+JhT8C4aw3PPj6wiJBkQ=;
 h=From:To:Subject:Date:From;
 b=WO983mgWmnHuYMMg2WcHGeVGM8roPwiWwr1Xs/oAaM8rYeXRSH55Ke0H9Z7vextUS
 iUxm8gRFejVIhOqjsfq3vWSKQtdKULUdeFW+A0XWLUmRayxbcEaTcO8AuL5yrlMKQR
 /oP31+VHsg+XSegdvGwLD0qa4fKdFTM5iqqIdSQw=
From: Erwin Burema <e.burema@freedom.nl>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add duplex sound support for USB devices using implicit
 feedback
Date: Sun, 10 May 2020 20:29:11 +0200
Message-ID: <2410739.SCZni40SNb@alpha-wolf>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
X-Virus-Scanned: clamav-milter 0.102.2 at c03mi01
X-Virus-Status: Clean
Content-Type: text/plain; charset="us-ascii"
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

For USB sound devices using implicit feedback the endpoint used for this feedback should be able to be opened twice, once for required feedback and second time for audio data. This way these devices can be put in duplex audio mode. Since this only works if the settings of the endpoint don't change a check is included for this.

This fixes bug 207023 ("MOTU M2 regression on duplex audio") and should also fix bug 103751 ("M-Audio Fast Track Ultra usb audio device will not operate full-duplex")

Signed-off-by: Erwin Burema <e.burema@gmail.com>
---
 sound/usb/card.h     |   1 +
 sound/usb/endpoint.c | 195 ++++++++++++++++++++++++++++++++++++++++++-
 sound/usb/pcm.c      |   5 ++
 3 files changed, 197 insertions(+), 4 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 820e564656ed..d6219fba9699 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -108,6 +108,7 @@ struct snd_usb_endpoint {
 	int iface, altsetting;
 	int skip_packets;		/* quirks for devices to ignore the first n packets
 					   in a stream */
+	bool is_implicit_feedback;      /* This endpoint is used as implicit feedback */
 
 	spinlock_t lock;
 	struct list_head list;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 50104f658ed4..9bea7d3f99f8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -522,6 +522,8 @@ struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
 
 	list_add_tail(&ep->list, &chip->ep_list);
 
+	ep->is_implicit_feedback = 0;
+
 __exit_unlock:
 	mutex_unlock(&chip->mutex);
 
@@ -621,6 +623,178 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
 	ep->nurbs = 0;
 }
 
+/*
+ * Check data endpoint for format differences
+ */
+static bool check_ep_params(struct snd_usb_endpoint *ep,
+			      snd_pcm_format_t pcm_format,
+			      unsigned int channels,
+			      unsigned int period_bytes,
+			      unsigned int frames_per_period,
+			      unsigned int periods_per_buffer,
+			      struct audioformat *fmt,
+			      struct snd_usb_endpoint *sync_ep)
+{
+	unsigned int maxsize, minsize, packs_per_ms, max_packs_per_urb;
+	unsigned int max_packs_per_period, urbs_per_period, urb_packs;
+	unsigned int max_urbs;
+	int frame_bits = snd_pcm_format_physical_width(pcm_format) * channels;
+	int tx_length_quirk = (ep->chip->tx_length_quirk &&
+			       usb_pipeout(ep->pipe));
+	bool ret = 1;
+
+	if (pcm_format == SNDRV_PCM_FORMAT_DSD_U16_LE && fmt->dsd_dop) {
+		/*
+		 * When operating in DSD DOP mode, the size of a sample frame
+		 * in hardware differs from the actual physical format width
+		 * because we need to make room for the DOP markers.
+		 */
+		frame_bits += channels << 3;
+	}
+
+	ret = ret && (ep->datainterval == fmt->datainterval);
+	ret = ret && (ep->stride == frame_bits >> 3);
+
+	switch (pcm_format) {
+	case SNDRV_PCM_FORMAT_U8:
+		ret = ret && (ep->silence_value == 0x80);
+		break;
+	case SNDRV_PCM_FORMAT_DSD_U8:
+	case SNDRV_PCM_FORMAT_DSD_U16_LE:
+	case SNDRV_PCM_FORMAT_DSD_U32_LE:
+	case SNDRV_PCM_FORMAT_DSD_U16_BE:
+	case SNDRV_PCM_FORMAT_DSD_U32_BE:
+		ret = ret && (ep->silence_value == 0x69);
+		break;
+	default:
+		ret = ret && (ep->silence_value == 0);
+	}
+
+	/* assume max. frequency is 50% higher than nominal */
+	ret = ret && (ep->freqmax == ep->freqn + (ep->freqn >> 1));
+	/* Round up freqmax to nearest integer in order to calculate maximum
+	 * packet size, which must represent a whole number of frames.
+	 * This is accomplished by adding 0x0.ffff before converting the
+	 * Q16.16 format into integer.
+	 * In order to accurately calculate the maximum packet size when
+	 * the data interval is more than 1 (i.e. ep->datainterval > 0),
+	 * multiply by the data interval prior to rounding. For instance,
+	 * a freqmax of 41 kHz will result in a max packet size of 6 (5.125)
+	 * frames with a data interval of 1, but 11 (10.25) frames with a
+	 * data interval of 2.
+	 * (ep->freqmax << ep->datainterval overflows at 8.192 MHz for the
+	 * maximum datainterval value of 3, at USB full speed, higher for
+	 * USB high speed, noting that ep->freqmax is in units of
+	 * frames per packet in Q16.16 format.)
+	 */
+	maxsize = (((ep->freqmax << ep->datainterval) + 0xffff) >> 16) *
+			 (frame_bits >> 3);
+	if (tx_length_quirk)
+		maxsize += sizeof(__le32); /* Space for length descriptor */
+	/* but wMaxPacketSize might reduce this */
+	if (ep->maxpacksize && ep->maxpacksize < maxsize) {
+		/* whatever fits into a max. size packet */
+		unsigned int data_maxsize = maxsize = ep->maxpacksize;
+
+		if (tx_length_quirk)
+			/* Need to remove the length descriptor to calc freq */
+			data_maxsize -= sizeof(__le32);
+		ret = ret && (ep->freqmax == (data_maxsize / (frame_bits >> 3))
+				<< (16 - ep->datainterval));
+	}
+
+	if (ep->fill_max)
+		ret = ret && (ep->curpacksize == ep->maxpacksize);
+	else
+		ret = ret && (ep->curpacksize == maxsize);
+
+	if (snd_usb_get_speed(ep->chip->dev) != USB_SPEED_FULL) {
+		packs_per_ms = 8 >> ep->datainterval;
+		max_packs_per_urb = MAX_PACKS_HS;
+	} else {
+		packs_per_ms = 1;
+		max_packs_per_urb = MAX_PACKS;
+	}
+	if (sync_ep && !snd_usb_endpoint_implicit_feedback_sink(ep))
+		max_packs_per_urb = min(max_packs_per_urb,
+					1U << sync_ep->syncinterval);
+	max_packs_per_urb = max(1u, max_packs_per_urb >> ep->datainterval);
+
+	/*
+	 * Capture endpoints need to use small URBs because there's no way
+	 * to tell in advance where the next period will end, and we don't
+	 * want the next URB to complete much after the period ends.
+	 *
+	 * Playback endpoints with implicit sync much use the same parameters
+	 * as their corresponding capture endpoint.
+	 */
+	if (usb_pipein(ep->pipe) ||
+			snd_usb_endpoint_implicit_feedback_sink(ep)) {
+
+		urb_packs = packs_per_ms;
+		/*
+		 * Wireless devices can poll at a max rate of once per 4ms.
+		 * For dataintervals less than 5, increase the packet count to
+		 * allow the host controller to use bursting to fill in the
+		 * gaps.
+		 */
+		if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_WIRELESS) {
+			int interval = ep->datainterval;
+
+			while (interval < 5) {
+				urb_packs <<= 1;
+				++interval;
+			}
+		}
+		/* make capture URBs <= 1 ms and smaller than a period */
+		urb_packs = min(max_packs_per_urb, urb_packs);
+		while (urb_packs > 1 && urb_packs * maxsize >= period_bytes)
+			urb_packs >>= 1;
+		ret = ret && (ep->nurbs == MAX_URBS);
+
+	/*
+	 * Playback endpoints without implicit sync are adjusted so that
+	 * a period fits as evenly as possible in the smallest number of
+	 * URBs.  The total number of URBs is adjusted to the size of the
+	 * ALSA buffer, subject to the MAX_URBS and MAX_QUEUE limits.
+	 */
+	} else {
+		/* determine how small a packet can be */
+		minsize = (ep->freqn >> (16 - ep->datainterval)) *
+				(frame_bits >> 3);
+		/* with sync from device, assume it can be 12% lower */
+		if (sync_ep)
+			minsize -= minsize >> 3;
+		minsize = max(minsize, 1u);
+
+		/* how many packets will contain an entire ALSA period? */
+		max_packs_per_period = DIV_ROUND_UP(period_bytes, minsize);
+
+		/* how many URBs will contain a period? */
+		urbs_per_period = DIV_ROUND_UP(max_packs_per_period,
+				max_packs_per_urb);
+		/* how many packets are needed in each URB? */
+		urb_packs = DIV_ROUND_UP(max_packs_per_period, urbs_per_period);
+
+		/* limit the number of frames in a single URB */
+		ret = ret && (ep->max_urb_frames ==
+			DIV_ROUND_UP(frames_per_period, urbs_per_period));
+
+		/* try to use enough URBs to contain an entire ALSA buffer */
+		max_urbs = min((unsigned) MAX_URBS,
+				MAX_QUEUE * packs_per_ms / urb_packs);
+		ret = ret && (ep->nurbs == min(max_urbs,
+				urbs_per_period * periods_per_buffer));
+	}
+
+	ret = ret && (ep->datainterval == fmt->datainterval);
+	ret = ret && (ep->maxpacksize == fmt->maxpacksize);
+	ret = ret &&
+		(ep->fill_max == !!(fmt->attributes & UAC_EP_CS_ATTR_FILL_MAX));
+
+	return ret;
+}
+
 /*
  * configure a data endpoint
  */
@@ -886,10 +1060,23 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 	int err;
 
 	if (ep->use_count != 0) {
-		usb_audio_warn(ep->chip,
-			 "Unable to change format on ep #%x: already in use\n",
-			 ep->ep_num);
-		return -EBUSY;
+		bool check = ep->is_implicit_feedback &&
+			check_ep_params(ep, pcm_format,
+					     channels, period_bytes,
+					     period_frames, buffer_periods,
+					     fmt, sync_ep);
+
+		if (!check) {
+			usb_audio_warn(ep->chip,
+				"Unable to change format on ep #%x: already in use\n",
+				ep->ep_num);
+			return -EBUSY;
+		}
+
+		usb_audio_dbg(ep->chip,
+			      "Ep #%x already in use as implicit feedback but format not changed\n",
+			      ep->ep_num);
+		return 0;
 	}
 
 	/* release old buffers, if any */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b50965ab3b3a..d61c2f1095b5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -404,6 +404,8 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	if (!subs->sync_endpoint)
 		return -EINVAL;
 
+	subs->sync_endpoint->is_implicit_feedback = 1;
+
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
 	return 1;
@@ -502,12 +504,15 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 						   implicit_fb ?
 							SND_USB_ENDPOINT_TYPE_DATA :
 							SND_USB_ENDPOINT_TYPE_SYNC);
+
 	if (!subs->sync_endpoint) {
 		if (is_playback && attr == USB_ENDPOINT_SYNC_NONE)
 			return 0;
 		return -EINVAL;
 	}
 
+	subs->sync_endpoint->is_implicit_feedback = implicit_fb;
+
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
 	return 0;
-- 
2.26.2




