Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8B938F84
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 14:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E6A826;
	Mon, 22 Jul 2024 14:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E6A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653197;
	bh=WdpJmIpDPJ/VygoU7Bxc4nOdSXY4ypscxsKOOgIR+TA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zn22xOciBrCAcrEMGuDWExFtYvoOOI88Zx6MsgIqFBa/mF/23RyHugbMmSClJrRH0
	 Nb6OW9atZBDPMisFMuJLm9UILkkNSgdWeky5Pl7xD8jfnzuJjIK+NUybxXWLwoTkQ3
	 MLZafxUS4vBY79MbUfr8V2Cdabf7/trOm8fMlVFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF49F8019B; Mon, 22 Jul 2024 14:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDFEF80482;
	Mon, 22 Jul 2024 14:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6E68F8026D; Wed, 17 Jul 2024 11:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by alsa1.perex.cz (Postfix) with ESMTP id 80758F800FA
	for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2024 11:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80758F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=a3eyEo7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5noMy
	VEH65r+MCncRbdXscdedw7+GqbdcN8kOZsWqGk=; b=a3eyEo7XO0VLl6Jbca8dj
	1NZ5TG9qVGamJ9RGy6Tfmw1acgngz+aAoVcH0y1z2REp8CI6hzuypCj56CqJREgd
	bYDJpfZGypDb0r3iild1YcVAE1RCFn/pu3UFeoOODRJ0JkC6OU3zgPHdxvvywXhh
	Dwtp9kxPnJ6tPtLcz7SRbU=
Received: from localhost.localdomain (unknown [111.48.69.245])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id
 _____wDXPnNZlZdm+MncDA--.62596S2;
	Wed, 17 Jul 2024 17:56:42 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Fix microphone sound on HD webcam.
Date: Wed, 17 Jul 2024 17:56:38 +0800
Message-Id: <20240717095638.13264-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXPnNZlZdm+MncDA--.62596S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw43JFy5tFyrCF45Xw13urg_yoWrCw15pr
	1Iya97Jryktr17Xr48CayUu3yrXws2y398Ca4qkwnI9ryfK34rta47t39rAFWakrWrC34j
	qryjy3yqg3y5Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pim9aDUUUUU=
X-Originating-IP: [111.48.69.245]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiNRwfT2V4IpRruAAAsB
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LTAM3WB4L3QCJSCF2Q6JJJEPKIGSH6X7
X-Message-ID-Hash: LTAM3WB4L3QCJSCF2Q6JJJEPKIGSH6X7
X-Mailman-Approved-At: Mon, 22 Jul 2024 12:59:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTAM3WB4L3QCJSCF2Q6JJJEPKIGSH6X7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I own an external usb Webcam, HD webcam, which had low mic volume and
inconsistent sound quality. Video works as expected.

(snip)
[   95.473820][ 1] [   T73] usb 5-2.2: new high-speed USB device number 7 using xhci_hcd
[   95.773974][ 1] [   T73] usb 5-2.2: New USB device found, idVendor=1bcf, idProduct=2281, bcdDevice= 0.05
[   95.783445][ 1] [   T73] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   95.791872][ 1] [   T73] usb 5-2.2: Product: HD webcam
[   95.797001][ 1] [   T73] usb 5-2.2: Manufacturer: Sunplus IT Co
[   95.802996][ 1] [   T73] usb 5-2.2: SerialNumber: 20200513
[   96.092610][ 2] [ T3680] usb 5-2.2: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
[   96.102436][ 2] [ T3680] usb 5-2.2: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1

Set up quirk cval->res to 16 for 256 levels,
Set GET_SAMPLE_RATE quirk flag to stop trying to get the sample rate.
Confirmed that happened anyway later due to the backoff mechanism,
After 3 failures.

All audio stream on device interfaces share the same values,
apart from wMaxPacketSize and tSamFreq :

      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass         1 Audio

Interface Descriptor:
  bLength                 9
  bDescriptorType         4
  bInterfaceNumber        3
  bAlternateSetting       4
  bNumEndpoints           1
  bInterfaceClass         1 Audio
  bInterfaceSubClass      2 Streaming
  bInterfaceProtocol      0
  iInterface              0
  AudioStreaming Interface Descriptor:
    bLength                 7
    bDescriptorType        36
    bDescriptorSubtype      1 (AS_GENERAL)
    bTerminalLink           3
    bDelay                  1 frames
    wFormatTag         0x0001 PCM
  AudioStreaming Interface Descriptor:
    bLength                11
    bDescriptorType        36
    bDescriptorSubtype      2 (FORMAT_TYPE)
    bFormatType             1 (FORMAT_TYPE_I)
    bNrChannels             1
    bSubframeSize           2
    bBitResolution         16
    bSamFreqType            1 Discrete
    tSamFreq[ 0]        48000
  Endpoint Descriptor:
    bLength                 9
    bDescriptorType         5
    bEndpointAddress     0x86  EP 6 IN
    bmAttributes            5
      Transfer Type            Isochronous
      Synch Type               Asynchronous
      Usage Type               Data
    wMaxPacketSize     0x0064  1x 100 bytes
    bInterval               4
    bRefresh                0
    bSynchAddress           0
    AudioStreaming Endpoint Descriptor:
      bLength                 7
      bDescriptorType        37
      bDescriptorSubtype      1 (EP_GENERAL)
      bmAttributes         0x01
        Sampling Frequency
      bLockDelayUnits         0 Undefined
      wLockDelay         0x0000
(snip)

Testing patch provides consistent good sound recording quality and volume range.

(snip)
[   95.473820][ 1] [   T73] usb 5-2.2: new high-speed USB device number 7 using xhci_hcd
[   95.773974][ 1] [   T73] usb 5-2.2: New USB device found, idVendor=1bcf, idProduct=2281, bcdDevice= 0.05
[   95.783445][ 1] [   T73] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   95.791872][ 1] [   T73] usb 5-2.2: Product: HD webcam
[   95.797001][ 1] [   T73] usb 5-2.2: Manufacturer: Sunplus IT Co
[   95.802996][ 1] [   T73] usb 5-2.2: SerialNumber: 20200513
[   96.110630][ 3] [ T3680] usbcore: registered new interface driver snd-usb-audio
[   96.114329][ 7] [ T3677] usb 5-2.2: Found UVC 1.00 device HD webcam (1bcf:2281)
[   96.167555][ 7] [ T3677] usbcore: registered new interface driver uvcvideo

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v2 -> v3: Update code to v6.8-rc3,and make modifications based on it
V1 -> V2: align the space
---
 sound/usb/mixer.c  | 7 +++++++
 sound/usb/quirks.c | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 409fc1164694..d1bdb0b93bda 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1211,6 +1211,13 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 16;
 		}
 		break;
+	case USB_ID(0x1bcf, 0x2281): /* HD Webcam */
+		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+			usb_audio_info(chip,
+				"set resolution quirk: cval->res = 16\n");
+			cval->res = 16;
+		}
+		break;
 	}
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 09712e61c606..f222532d4d43 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2185,6 +2185,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.25.1

