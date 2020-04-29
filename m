Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9D1C033F
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC2D1686;
	Thu, 30 Apr 2020 18:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC2D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265867;
	bh=E/QUdf+6WltoWml7fyFKesYEGrZvfjmVdFUKj2qt9CQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gfBEBVnDMYU8pabjBEmW96UcJE6pcR+t9SSOdUKjs8LLU7Rqug/D4XvNSq0ba8ua5
	 edqdusjnzkaJ2NN/ifQSFN6NCLAzgvZQ5sCFHzqWoVoToQcCcbdodlg8c6QS1xqgUv
	 fCwH5hp+m/WQmXiF5ZvCy5g++TPokRKKrU2hbD9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F360F802BC;
	Thu, 30 Apr 2020 18:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C92CF80247; Wed, 29 Apr 2020 11:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C399F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 11:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C399F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee
 header.b="bIEZsR/i"
Received: from [10.255.10.40] (GW.ds.local [10.255.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: dmitry@d-systems.ee)
 by mail.d-sys.org (Postfix) with ESMTPSA id DAD186059B
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 12:48:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
 t=1588153733; bh=E/QUdf+6WltoWml7fyFKesYEGrZvfjmVdFUKj2qt9CQ=;
 h=To:From:Subject:Date;
 b=bIEZsR/iuEW5A/O3BAz5oAdj66/GyMOB0rhHUFb2D44aFGQRHgKTYJy3DJoByD6oS
 aPYOQPaJTgT7Zvhtwo1qRj4OAHmL3U0rtzCvlXKcZZEXzk7+s/sdSNqHaK6A+qQJdw
 lXwfDqyJektU6+A3AlZsgtZ1j8VRTGKPXeGbVf4UllcxWaKBxTaKQKosByEevIym0z
 ROFu/mVDfKWWWQQrp17mcHaLZxudgV85/fLEpFFTALhN0oIECxKW6wjMjO5ecgy/tB
 Wt1RfU+ge8fGqCks/Fjq+w4bkPkYazEe51qzB2go38t0DIuz9b4Ekv+1A0D3y31plu
 ihwLQz2gBy3MQ==
To: alsa-devel@alsa-project.org
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
Subject: Pioneer DJ DJM-900NXS2 support patches
Message-ID: <b1f8414d-81d3-3f8b-e2c7-d536858d1bb6@d-systems.ee>
Date: Wed, 29 Apr 2020 12:56:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------D1BC25FF357A95FDBC9E668F"
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 30 Apr 2020 18:53:43 +0200
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

This is a multi-part message in MIME format.
--------------D1BC25FF357A95FDBC9E668F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Pioneer DJ DJM-900NXS2 is a widely used DJ mixer with 2 audio USB 
interfaces. Both have a MIDI controller, 10 playback and 12 capture 
channels. Audio endpoints are vendor-specific and 3 files need to be 
patched. All playback and capture channels work fine with all supported 
sample rates (44.1k, 48k, 96k). Patches are attached.

--
Kind regards,
Dmitry Panchenko

d-Systems Ltd
Lai 6, Tartu 51005, Estonia
www.d-systems.ee

--------------D1BC25FF357A95FDBC9E668F
Content-Type: text/x-patch; charset=UTF-8;
 name="pcm.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pcm.c.patch"

--- /tmp/linux-5.4.0/sound/usb/pcm.c	2020-04-29 11:56:36.000000000 +0300
+++ linux-5.4.0/sound/usb/pcm.c	2020-04-29 12:01:31.916954625 +0300
@@ -355,6 +355,10 @@
 	case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
 		/* BOSS Katana amplifiers do not need quirks */
 		return 0;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+		ep = 0x82;
+		ifnum = 0;
+		goto add_sync_ep_from_ifnum;
 	}
 
 	if (attr == USB_ENDPOINT_SYNC_ASYNC &&

--------------D1BC25FF357A95FDBC9E668F
Content-Type: text/x-patch; charset=UTF-8;
 name="quirks.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="quirks.c.patch"

--- /tmp/linux-5.4.0/sound/usb/quirks.c	2020-04-29 11:56:36.000000000 +0300
+++ linux-5.4.0/sound/usb/quirks.c	2020-04-29 12:00:04.232521294 +0300
@@ -1414,6 +1414,29 @@
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
+
+/* 
+ * Pioneer DJ DJM-900NXS2
+ * Device needs to know the sample rate when substream is started
+ */
+static int pioneer_djm_set_format_quirk (struct snd_usb_substream *subs)
+{
+
+    /* Convert sample rate to little endian */
+	u8 sr[3];
+	sr[0] = subs->cur_rate&0xff;
+	sr[1] = (subs->cur_rate>>8)&0xff;
+	sr[2] = (subs->cur_rate>>16)&0xff;
+	
+	/* Configure device */
+	usb_set_interface(subs->stream->chip->dev, 0, 1);
+	snd_usb_ctl_msg(subs->stream->chip->dev,
+	    usb_rcvctrlpipe(subs->stream->chip->dev, 0),
+	    0x01, 0x22, 0x0100, 0x0082, &sr, 0x0003);
+
+	return 0;
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      struct audioformat *fmt)
 {
@@ -1424,6 +1447,8 @@
 	case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
 		set_format_emu_quirk(subs, fmt);
 		break;
+    case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+        pioneer_djm_set_format_quirk(subs);
 	}
 }
 

--------------D1BC25FF357A95FDBC9E668F
Content-Type: text/x-patch; charset=UTF-8;
 name="quirks-table.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="quirks-table.h.patch"

--- /tmp/linux-5.4.0/sound/usb/quirks-table.h	2020-04-29 11:56:36.000000000 +0300
+++ linux-5.4.0/sound/usb/quirks-table.h	2020-04-29 11:58:22.921621970 +0300
@@ -3592,5 +3592,65 @@
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-900NXS2
+	 * 10 channels playback & 12 channels capture @ 44.1/48/96kHz S24LE
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x000a),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC|
+					    USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100|
+					    SNDRV_PCM_RATE_48000|
+					    SNDRV_PCM_RATE_96000,
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
+					.channels = 12,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC|
+					    USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100|
+					    SNDRV_PCM_RATE_48000|
+					    SNDRV_PCM_RATE_96000,
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

--------------D1BC25FF357A95FDBC9E668F--
