Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE791C11F0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 14:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB4F716A3;
	Fri,  1 May 2020 14:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB4F716A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588335365;
	bh=q0oVt3xVQyA3X46V8bTqUytRBVFyNTw00wAR0tddYCg=;
	h=To:References:Subject:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DeWLyLLK68btTO2GulIZjv4zY1rqEyYaEMw1km/gNKztxA0xw63FiA2Y/DMq3lED+
	 Sq2j8LI2UU6qzLgfCuGi+cESlEjf2bBGt4ogG9ui51yL/x+tiIuSVFvUpRYXL7Rwsw
	 COlwkNbGVrKSngONcRqBeZNqJYo9FhEgbMkF4c0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76F9F80217;
	Fri,  1 May 2020 14:14:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC91F8022B; Fri,  1 May 2020 14:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CECBF800E5
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 14:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CECBF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee
 header.b="RYc13EI/"
Received: from [10.255.10.40] (GW.ds.local [10.255.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: dmitry@d-systems.ee)
 by mail.d-sys.org (Postfix) with ESMTPSA id 426E360533;
 Fri,  1 May 2020 15:06:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
 t=1588334779; bh=q0oVt3xVQyA3X46V8bTqUytRBVFyNTw00wAR0tddYCg=;
 h=To:Cc:References:Subject:From:Date:In-Reply-To;
 b=RYc13EI/mU6zpvsBw6IAslRSpMSrzg5csxZ25di2ZGslVDBpATeQjE9d+MBuFY10Z
 dh5ffj+sTcylh4nrpRAK1xnWXbUIEtUs4JgZ40P4ykzQJFyVWIupAcwy5cd4H5N5Sa
 u70ONxhqp4KMOBOWvdW6/aiJ47eqaU8b3cWBdGp372tdQ2x/ENU5zhWqDx0h7AFouM
 uj4HKIVba2RhLUY3fKWFFnOV/mpAqgrn8EcqNXSmZaey8JwaAsICZd23rD7U0c4sGS
 Kw8/POizCn9VSS8DzrpxDBkzeghCNmjnBm8z6YRGPeTJh9WwonBQvhl5JSlMKGm8aT
 VD+s2fxF7DQJA==
To: dmitry@d-systems.ee
References: <b1f8414d-81d3-3f8b-e2c7-d536858d1bb6@d-systems.ee>
Subject: Re: Pioneer DJ DJM-900NXS2 support patches
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
Message-ID: <13d0e6b3-2066-e67e-3499-a72291ce4348@d-systems.ee>
Date: Fri, 1 May 2020 15:14:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b1f8414d-81d3-3f8b-e2c7-d536858d1bb6@d-systems.ee>
Content-Type: multipart/mixed; boundary="------------09144056ABDB4220D61DB557"
Content-Language: en-GB
Cc: alsa-devel@alsa-project.org
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
--------------09144056ABDB4220D61DB557
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Takashi and Alexander, thanks for feedback! The updated patches are 
attached.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>

--
Kind regards,
Dmitry Panchenko

d-Systems Ltd
Lai 6, Tartu 51005, Estonia
www.d-systems.ee

--------------09144056ABDB4220D61DB557
Content-Type: text/x-patch; charset=UTF-8;
 name="pcm.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pcm.c.patch"

--- sound/usb/pcm.c	2020-04-23 11:38:27.000000000 +0300
+++ /root/linux-5.6.7/sound/usb/pcm.c	2020-05-01 14:17:54.785566648 +0300
@@ -365,6 +365,10 @@
 		ep = 0x81;
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+		ep = 0x82;
+		ifnum = 0;
+		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
 		/* BOSS Katana amplifiers do not need quirks */
 		return 0;

--------------09144056ABDB4220D61DB557
Content-Type: text/x-patch; charset=UTF-8;
 name="quirks.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="quirks.c.patch"

--- sound/usb/quirks.c	2020-04-23 11:38:27.000000000 +0300
+++ /root/linux-5.6.7/sound/usb/quirks.c	2020-05-01 14:45:57.545650031 +0300
@@ -1414,6 +1414,30 @@
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
+
+/*
+ * Pioneer DJ DJM-900NXS2
+ * Device needs to know the sample rate each time substream is started
+ */
+static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs)
+{
+
+	/* Convert sample rate value to little endian */
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
+		0x01, 0x22, 0x0100, 0x0082, &sr, 0x0003);
+
+	return 0;
+}
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      struct audioformat *fmt)
 {
@@ -1424,6 +1448,9 @@
 	case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
 		set_format_emu_quirk(subs, fmt);
 		break;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+		pioneer_djm_set_format_quirk(subs);
+		break;
 	}
 }
 

--------------09144056ABDB4220D61DB557
Content-Type: text/x-patch; charset=UTF-8;
 name="quirks-table.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="quirks-table.h.patch"

--- sound/usb/quirks-table.h	2020-04-23 11:38:27.000000000 +0300
+++ /root/linux-5.6.7/sound/usb/quirks-table.h	2020-05-01 14:48:44.665672833 +0300
@@ -3592,5 +3592,68 @@
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
+					    USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100|
+					    SNDRV_PCM_RATE_48000|
+					    SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) {
+						44100, 48000, 96000
+					}
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
+					.rate_table = (unsigned int[]) {
+						44100, 48000, 96000
+					}
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC

--------------09144056ABDB4220D61DB557--
