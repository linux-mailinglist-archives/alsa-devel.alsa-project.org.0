Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFE2F9AE6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00E917E5;
	Mon, 18 Jan 2021 09:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00E917E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610956867;
	bh=wm3P/kqbC801iBrIKCM7L9smYhfSGw21OxjuN3xMbdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTppkCpIIj/ExmxN1plGhOeKLlP6ZCz6uyIDVWBsDnGXYbVRPanESTKcTbHdTvVrJ
	 PP+MZjLJydY4U0R/zBC54PVHjjNs2pCq3jIsO5BVE+X6QlMaWXU8G/WUGL7fDZj0Lf
	 6YKwO2rqHJAN2blVZ1EI3SuZA131+Yung4Ss8NUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D32F804D2;
	Mon, 18 Jan 2021 08:58:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E1CF804BD; Mon, 18 Jan 2021 08:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACC95F8019D
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACC95F8019D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 782A7AB9F;
 Mon, 18 Jan 2021 07:58:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Fix UAC1 rate setup for secondary
 endpoints
Date: Mon, 18 Jan 2021 08:58:14 +0100
Message-Id: <20210118075816.25068-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118075816.25068-1-tiwai@suse.de>
References: <20210118075816.25068-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

The current sample rate setup function for UAC1 assumes only the first
endpoint retrieved from the interface:altset pair, but the rate set up
may be needed also for the secondary endpoint.  Also, retrieving the
endpoint number from the interface descriptor is redundant; we have
already the target endpoint in the given audioformat object.

This patch simplifies the code and corrects the target endpoint as
described in the above.  It simply refers to fmt->endpoint directly.

Also, this patch drops the pioneer_djm_set_format_quirk() that is
caleld from snd_usb_set_format_quirk(); this function does the sample
rate setup but for the capture endpoint (0x82), and that's exactly
what the change above fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c  | 21 ++++++---------------
 sound/usb/quirks.c | 28 ----------------------------
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 31051f2be46d..dc68ed65e478 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -485,18 +485,9 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 			      const struct audioformat *fmt, int rate)
 {
 	struct usb_device *dev = chip->dev;
-	struct usb_host_interface *alts;
-	unsigned int ep;
 	unsigned char data[3];
 	int err, crate;
 
-	alts = snd_usb_get_host_interface(chip, fmt->iface, fmt->altsetting);
-	if (!alts)
-		return -EINVAL;
-	if (get_iface_desc(alts)->bNumEndpoints < 1)
-		return -EINVAL;
-	ep = get_endpoint(alts, 0)->bEndpointAddress;
-
 	/* if endpoint doesn't have sampling rate control, bail out */
 	if (!(fmt->attributes & UAC_EP_CS_ATTR_SAMPLE_RATE))
 		return 0;
@@ -506,11 +497,11 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 	data[2] = rate >> 16;
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_ENDPOINT | USB_DIR_OUT,
-			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep,
-			      data, sizeof(data));
+			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8,
+			      fmt->endpoint, data, sizeof(data));
 	if (err < 0) {
 		dev_err(&dev->dev, "%d:%d: cannot set freq %d to ep %#x\n",
-			fmt->iface, fmt->altsetting, rate, ep);
+			fmt->iface, fmt->altsetting, rate, fmt->endpoint);
 		return err;
 	}
 
@@ -524,11 +515,11 @@ static int set_sample_rate_v1(struct snd_usb_audio *chip,
 
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC_GET_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_ENDPOINT | USB_DIR_IN,
-			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep,
-			      data, sizeof(data));
+			      UAC_EP_CS_ATTR_SAMPLE_RATE << 8,
+			      fmt->endpoint, data, sizeof(data));
 	if (err < 0) {
 		dev_err(&dev->dev, "%d:%d: cannot get freq at ep %#x\n",
-			fmt->iface, fmt->altsetting, ep);
+			fmt->iface, fmt->altsetting, fmt->endpoint);
 		chip->sample_rate_read_error++;
 		return 0; /* some devices don't support reading */
 	}
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 89e172642d98..e196e364cef1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1470,30 +1470,6 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
-
-/*
- * Pioneer DJ DJM-900NXS2
- * Device needs to know the sample rate each time substream is started
- */
-static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs)
-{
-	unsigned int cur_rate = subs->data_endpoint->cur_rate;
-	/* Convert sample rate value to little endian */
-	u8 sr[3];
-
-	sr[0] = cur_rate & 0xff;
-	sr[1] = (cur_rate >> 8) & 0xff;
-	sr[2] = (cur_rate >> 16) & 0xff;
-
-	/* Configure device */
-	usb_set_interface(subs->dev, 0, 1);
-	snd_usb_ctl_msg(subs->stream->chip->dev,
-		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
-		0x01, 0x22, 0x0100, 0x0082, &sr, 0x0003);
-
-	return 0;
-}
-
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      const struct audioformat *fmt)
 {
@@ -1504,10 +1480,6 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
 		set_format_emu_quirk(subs, fmt);
 		break;
-	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
-	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
-		pioneer_djm_set_format_quirk(subs);
-		break;
 	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
 		subs->stream_offset_adj = 2;
 		break;
-- 
2.26.2

