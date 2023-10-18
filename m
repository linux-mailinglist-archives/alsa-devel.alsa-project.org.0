Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B437CDF04
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768AEE11;
	Wed, 18 Oct 2023 16:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768AEE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638568;
	bh=ugI4bNdB+LkM72VAXRe6Oef03e0Xgc0r5ZLnTsKxObI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8g+9fbIs+xdZHQg0ChNpEz2S67m+ihoH/aJKF+vwZk/T5StI/mhnbp53XD+4d45+
	 6Ku21Os0Abspt7Lo1JyK+1uaqA2Ji7Wfn4aDYasfjduwieIFtrsjnSyM4rDi1ccRW8
	 aR09EU3IrjbQbKpALjbrD8ABZFGPPtqnO46WrYvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C143FF80579; Wed, 18 Oct 2023 16:14:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 466B4F8057A;
	Wed, 18 Oct 2023 16:14:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AC8FF8057A; Wed, 18 Oct 2023 16:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF1D8F8056F
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1D8F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LTynJikB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 055A361802;
	Wed, 18 Oct 2023 14:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACB8C433C9;
	Wed, 18 Oct 2023 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638436;
	bh=ugI4bNdB+LkM72VAXRe6Oef03e0Xgc0r5ZLnTsKxObI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LTynJikBdn/ytk2qT2p84enGGk5nd/NLUQgNYzFs1ZUqInlUkvlOXAhnRl8Zmg4DH
	 x55vV7PGkQFziHxlf34SCYlxgJX0Xe+TPKVanbjbkinxzVSReo5P0EJmIooVrHXLdu
	 jn6FyqbwZCMtPMjIaVhr7As+uH+HuNwfmZt8wHode69yxy5X+TURPI3FNMTDDBbkuv
	 EX+0BV9lLbHVnStXJ+vgQwtQvWmU0k4h0R+7wLo6hu9PSS8McMx09PmaUa6yyQn1Bx
	 7flQWtf4esqwplJkpLjcTt5EymHteGtyZxEQ2tygsyc9X2hzCUTyKzokML0R6Liise
	 L9W+4sXyltZKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christos Skevis <xristos.thes@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@linux.intel.com,
	maciej.szmigiero@oracle.com,
	jussi@sonarnerd.net,
	aichao@kylinos.cn,
	ltyl@hem-e.com,
	whalechang@google.com,
	john@keeping.me.uk,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 14/19] ALSA: usb-audio: Fix microphone sound on
 Nexigo webcam.
Date: Wed, 18 Oct 2023 10:13:16 -0400
Message-Id: <20231018141323.1334898-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141323.1334898-1-sashal@kernel.org>
References: <20231018141323.1334898-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.58
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LSFORLD3R5PPKYAY55Q4BIRQ73ZRRBQN
X-Message-ID-Hash: LSFORLD3R5PPKYAY55Q4BIRQ73ZRRBQN
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSFORLD3R5PPKYAY55Q4BIRQ73ZRRBQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Christos Skevis <xristos.thes@gmail.com>

[ Upstream commit 4a63e68a295187ae3c1cb3fa0c583c96a959714f ]

I own an external usb Webcam, model NexiGo N930AF, which had low mic volume and
inconsistent sound quality. Video works as expected.

(snip)
[  +0.047857] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[  +0.003406] usb 5-1: New USB device found, idVendor=1bcf, idProduct=2283, bcdDevice=12.17
[  +0.000007] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  +0.000004] usb 5-1: Product: NexiGo N930AF FHD Webcam
[  +0.000003] usb 5-1: Manufacturer: SHENZHEN AONI ELECTRONIC CO., LTD
[  +0.000004] usb 5-1: SerialNumber: 20201217011
[  +0.003900] usb 5-1: Found UVC 1.00 device NexiGo N930AF FHD Webcam (1bcf:2283)
[  +0.025726] usb 5-1: 3:1: cannot get usb sound sample rate freq at ep 0x86
[  +0.071482] usb 5-1: 3:2: cannot get usb sound sample rate freq at ep 0x86
[  +0.004679] usb 5-1: 3:3: cannot get usb sound sample rate freq at ep 0x86
[  +0.051607] usb 5-1: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
[  +0.000005] usb 5-1: [7] FU [Mic Capture Volume] ch = 1, val = 0/4096/1

Set up quirk cval->res to 16 for 256 levels,
Set GET_SAMPLE_RATE quirk flag to stop trying to get the sample rate.
Confirmed that happened anyway later due to the backoff mechanism, after 3 failures

All audio stream on device interfaces share the same values,
apart from wMaxPacketSize and tSamFreq :

(snip)
Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           8
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
        tSamFreq[ 0]        44100
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x005c  1x 92 bytes
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

Based on the usb data about manufacturer, SPCA2281B3 is the most likely controller IC
Manufacturer does not provide link for datasheet nor detailed specs.
No way to confirm if the firmware supports any other way of getting the sample rate.

Testing patch provides consistent good sound recording quality and volume range.

(snip)
[  +0.045764] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[  +0.106290] usb 5-1: New USB device found, idVendor=1bcf, idProduct=2283, bcdDevice=12.17
[  +0.000006] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  +0.000004] usb 5-1: Product: NexiGo N930AF FHD Webcam
[  +0.000003] usb 5-1: Manufacturer: SHENZHEN AONI ELECTRONIC CO., LTD
[  +0.000004] usb 5-1: SerialNumber: 20201217011
[  +0.043700] usb 5-1: set resolution quirk: cval->res = 16
[  +0.002585] usb 5-1: Found UVC 1.00 device NexiGo N930AF FHD Webcam (1bcf:2283)

Signed-off-by: Christos Skevis <xristos.thes@gmail.com>
Link: https://lore.kernel.org/r/20231006155330.399393-1-xristos.thes@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer.c  | 7 +++++++
 sound/usb/quirks.c | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9105ec623120a..783a2493707ea 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1204,6 +1204,13 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 16;
 		}
 		break;
+	case USB_ID(0x1bcf, 0x2283): /* NexiGo N930AF FHD Webcam */
+		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+			usb_audio_info(chip,
+				"set resolution quirk: cval->res = 16\n");
+			cval->res = 16;
+		}
+		break;
 	}
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 80ee3b54bfe9c..6129a62316422 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2175,6 +2175,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
+	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.40.1

