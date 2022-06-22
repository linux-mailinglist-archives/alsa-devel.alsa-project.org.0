Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1FD55785D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14A51EEC;
	Thu, 23 Jun 2022 13:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14A51EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982346;
	bh=/kgWZkF3RtAUGxpCpzQmzUibXTvsQfDb1D5QiefBwJs=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HkWLTlyZSjmfzijD4+VDCgAUwKdhzNCSaRenUJoYFp8rnvkQo7hwKYtnuU9fVwkgn
	 3OwCB6nH5qBeBkeAAa2J+pr/wNAouCYz/iGukoaRVrjfgdGcZqgTttM9KsLXI2tTBi
	 5Q7puIv+HflEVRN1S1RTHk3q9TJaR4i6UADg1xMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B3AF804EC;
	Thu, 23 Jun 2022 13:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A57F80118; Wed, 22 Jun 2022 22:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE0C6F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 22:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0C6F80118
Received: from [217.155.36.16] (port=59752 helo=[192.168.1.22])
 by mailhub-cam-d.mythic-beasts.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <john-linux@pelago.org.uk>)
 id 1o46tW-00EZqt-1x; Wed, 22 Jun 2022 21:24:10 +0100
Message-ID: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
Date: Wed, 22 Jun 2022 21:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: John Veness <john-linux@pelago.org.uk>
Subject: Quirks for MacroSilicon MS2100/MS2106
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:19 +0200
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>
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


Hello,

This is my first ever kernel work, so I hope I am doing everything
correctly.

I have a USB analogue AV capture dongle with a MacroSilicon MS2100E chip
inside. PID 0x534d, VID 0x0021 (534d:0021). Apparently the MS2106 uses
the same PID/VID, so hopefully acts the same, but I don't have one to check.

For audio, the MS2100E has the same problems as the MS2109 USB HDMI
capture dongle, namely claiming 96kHz mono sound when it's actually
48kHz stereo, and with left/right channel problems.

Luckily, the fix is the exact same as that for the MS2109, as first
implemented by Marcan (Hector Martin) in July 2020. Below is a patch
which is basically a copy and paste of his, with a different VID.

I have tested this patch in 5.19.0 RC2. I haven't recruited any other
testers.

Even with this patch, there is a remaining problem, which is not present
in the MS2109. The sound sample values range from 0x0000 to 0x7fff, with
silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds OK to
the ear (although half as loud as it should be), but looks odd when
looking at the waveform, and makes volume meters always think the sound
is very loud.

To convert to s16le, I can bitshift one bit left, and subtract 32768.
I'm told that this isn't something that can or should be done in the
kernel, but should be in userspace. Any more advice on how to fix this
remaining quirk would be very welcome.

Nonetheless, as I say, with the following kernel patch the captured
audio certainly sounds right, so is a big improvement and makes these
dongles usable:

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4f56e1784932..853da162fd18 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3802,6 +3802,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
         }
  },

+/*
+ * MacroSilicon MS2100/MS2106 based AV capture cards
+ *
+ * These claim 96kHz 1ch in the descriptors, but are actually 48kHz 2ch.
+ * They also need QUIRK_FLAG_ALIGN_TRANSFER, which makes one wonder if
+ * they pretend to be 96kHz mono as a workaround for stereo being broken
+ * by that...
+ *
+ * They also have an issue with initial stream alignment that causes the
+ * channels to be swapped and out of phase, which is dealt with in quirks.c.
+ */
+{
+       USB_AUDIO_DEVICE(0x534d, 0x0021),
+       .driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+               .vendor_name = "MacroSilicon",
+               .product_name = "MS210x",
+               .ifnum = QUIRK_ANY_INTERFACE,
+               .type = QUIRK_COMPOSITE,
+               .data = &(const struct snd_usb_audio_quirk[]) {
+                       {
+                               .ifnum = 2,
+                               .type = QUIRK_AUDIO_STANDARD_MIXER,
+                       },
+                       {
+                               .ifnum = 3,
+                               .type = QUIRK_AUDIO_FIXED_ENDPOINT,
+                               .data = &(const struct audioformat) {
+                                       .formats = SNDRV_PCM_FMTBIT_S16_LE,
+                                       .channels = 2,
+                                       .iface = 3,
+                                       .altsetting = 1,
+                                       .altset_idx = 1,
+                                       .attributes = 0,
+                                       .endpoint = 0x82,
+                                       .ep_attr = USB_ENDPOINT_XFER_ISOC |
+                                               USB_ENDPOINT_SYNC_ASYNC,
+                                       .rates = SNDRV_PCM_RATE_CONTINUOUS,
+                                       .rate_min = 48000,
+                                       .rate_max = 48000,
+                               }
+                       },
+                       {
+                               .ifnum = -1
+                       }
+               }
+       }
+},
+
  /*
   * MacroSilicon MS2109 based HDMI capture cards
   *
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e8468f9b007d..a72874bc0936 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1478,6 +1478,7 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
         case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
                 set_format_emu_quirk(subs, fmt);
                 break;
+       case USB_ID(0x534d, 0x0021): /* MacroSilicon MS2100/MS2106 */
         case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
                 subs->stream_offset_adj = 2;
                 break;
@@ -1904,6 +1905,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
                    QUIRK_FLAG_IGNORE_CTL_ERROR),
         DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
                    QUIRK_FLAG_GET_SAMPLE_RATE),
+       DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
+                  QUIRK_FLAG_ALIGN_TRANSFER),
         DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
                    QUIRK_FLAG_ALIGN_TRANSFER),
         DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */


Thanks for reading and considering this patch.

John Veness
