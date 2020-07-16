Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B4223531
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 09:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAC61615;
	Fri, 17 Jul 2020 09:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAC61615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594969777;
	bh=tYiqX/LaE6Kyd0RzdMjNAa2mBOs+hEW1cdfa6PNCyp8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VUA9pXcvdNbNtSbBCeBLPL4TyMqU3LS97z6uR4lOZ5X2LmH6q0LeoT2h3Zgzqz+t6
	 2+p0Mz/pOXnnkD6kGLjSTv+hoiIh/4fgRp5NIdIanun4dDN6yG2ZDILw8p8HfjJFMI
	 Ua3kZIcXlJJmngP2BkmlryJ2iGbTGf74JjD389eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 053B2F802F8;
	Fri, 17 Jul 2020 09:05:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29724F801EC; Thu, 16 Jul 2020 23:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from dobby.base.nu (dobby.base.nu [138.68.107.154])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA66AF8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 23:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA66AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=base.nu header.i=@base.nu
 header.b="QRyA/Bn6"
Received: from base.nu (unknown [IPv6:2a02:8010:6391:0:8ac5:72c1:80e9:afbd])
 by dobby.base.nu (Postfix) with ESMTPSA id 37E0F4B0EE;
 Thu, 16 Jul 2020 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=base.nu; s=mail;
 t=1594934120; bh=tYiqX/LaE6Kyd0RzdMjNAa2mBOs+hEW1cdfa6PNCyp8=;
 h=Date:From:To:Cc:Subject:From;
 b=QRyA/Bn6CXijYVIMwQx/ImW1F7kmRstB3maRzOqFQPL3OeASoh/nFPY+pdmOsHqEp
 7j4UEaATXKiZoZloP2/QnNVqrr8T7MlCmzp1HA2xyr9ahzTAggtnlxrIWoOLeI+HBL
 Ju1K2v2/sNTo1vzUlwRB6hnvQr/vozE6XPsBuFR8=
Date: Thu, 16 Jul 2020 22:15:16 +0100
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: Adding USB device quirk - packet format?
Message-ID: <20200716211455.drnwxzpfxljbdgnt@base.nu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qdcuq47cajesnhni"
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:05:02 +0200
Cc: tiwai@suse.de
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


--qdcuq47cajesnhni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am trying to add a device quirk for the Pioneer DJM-750 mixer. I have
attached a patch to illustrate what I'm trying to achieve. It is nearly
identical to https://patchwork.kernel.org/patch/11521019/ except for the
differences in channels. I have verified the settings against valid USB
transfers.

While observing behaviour with a Windows 10 VM, the 8 pieces of data
appear to be 8 isochronous packets within a single frame as opposed to 8
microframes (each with their own transfer). Should this have any impact
on the ability for the device to function? If so, is there a setting I
am missing to account for this? Or, am I simply clutching at straws and
completely on the wrong path.

This is rather device specific so I would not expect anyone to help
troubleshoot this specific device but what I suspect is the problem is
the way the audio data is arranged in the transfer.

Any suggestions and pointers on how to proceed are very much
appreciated.

Kind regards,
Olivia Mackintosh

--qdcuq47cajesnhni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="djm750-quirk.patch"

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 0bf370d89556..35323d010415 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3570,7 +3570,6 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
-
 #define ALC1220_VB_DESKTOP(vend, prod) { \
 	USB_DEVICE(vend, prod),	\
 	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
@@ -3610,5 +3609,64 @@ ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */
 		.ifnum = QUIRK_NO_INTERFACE
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-750
+	 * 8 channels playback & 8 channels capture @ 44.1/48/96kHz S24LE
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x08e4, 0x017f),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x05,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x86,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d7d900ebcf37..5017ff9d5bcd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1458,6 +1458,28 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
+/*
+ * Pioneer DJ DJM-750
+ * Device needs to know the sample rate when substream is started
+ */
+static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs)
+{
+	/* Convert sample rate to little endian */
+	u8 sr[3];
+
+	sr[0] = subs->cur_rate&0xff;
+	sr[1] = (subs->cur_rate>>8)&0xff;
+	sr[2] = (subs->cur_rate>>16)&0xff;
+
+	/* Configure device */
+	usb_set_interface(subs->dev, 0, 1);
+	snd_usb_ctl_msg(subs->stream->chip->dev,
+		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
+		0x01, 0x22, 0x0100, 0x0086, &sr, 0x0003);
+
+	return 0;
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      struct audioformat *fmt)
 {
@@ -1468,6 +1490,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
 		set_format_emu_quirk(subs, fmt);
 		break;
+	case USB_ID(0x08e4, 0x017f): /* Pioneer DJM-750 */
+		pioneer_djm_set_format_quirk(subs);
+		break;
 	}
 }
 

--qdcuq47cajesnhni--
