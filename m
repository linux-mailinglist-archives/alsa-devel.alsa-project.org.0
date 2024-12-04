Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E09E4955
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2024 00:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC6B14EA;
	Thu,  5 Dec 2024 00:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC6B14EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733355398;
	bh=L31ERoKNUciY07bSNiO8MeDHGHFrFiRFjMFFtyOc+gU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ApcDpEe1wfUvMNqQEJpTeDedrsKL0XYG7GOfjegd9rAPWUaKw/WxYCSUUrEcojvZe
	 h56j4g6kxhZKaEZuft8mA5BRtQRolxYKb2BGqqt7cU79LUz0fSoew2sdmtl6Gmvxnx
	 cJPwKYdwoYppEZHj3w5G+w+DmmKYzPT68pFOSIRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E768F805AD; Thu,  5 Dec 2024 00:36:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42DA4F805AD;
	Thu,  5 Dec 2024 00:36:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55162F8047C; Thu,  5 Dec 2024 00:35:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C177F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2024 00:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C177F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733355353512914181-webhooks-bot@alsa-project.org>
References: <1733355353512914181-webhooks-bot@alsa-project.org>
Subject: aplay doesn't play audio sometimes "unable to open slave"
Message-Id: <20241204233556.55162F8047C@alsa1.perex.cz>
Date: Thu,  5 Dec 2024 00:35:56 +0100 (CET)
Message-ID-Hash: QTNGGGNQKJLFZSBH65LKBJXTQZE5IBBA
X-Message-ID-Hash: QTNGGGNQKJLFZSBH65LKBJXTQZE5IBBA
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTNGGGNQKJLFZSBH65LKBJXTQZE5IBBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #426 was opened from haoyi-codes:

I have initially thought it was a bug that was related to chromium as stated in #425. However, now I realize it has to be something else that is wrong.

`aplay -D default /dev/zero`

```
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave
aplay: main:850: audio open error: No such file or directory
```

`aplay -D plughw:0 /dev/zero`

```
aplay: main:850: audio open error: No such file or directory
```

`aplay -l`

```
**** List of PLAYBACK Hardware Devices ****
card 0: NVidia [HDA NVidia], device 3: Generic Digital [Generic Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: HDMI [HDA ATI HDMI], device 3: Generic Digital [Generic Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [SA9123 USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

`cat /proc/asound/cards`

```
 0 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0x81080000 irq 17
 1 [HDMI           ]: HDA-Intel - HDA ATI HDMI
                      HDA ATI HDMI at 0x81220000 irq 165
 2 [Audio          ]: USB-Audio - SA9123 USB Audio
                      SYC SA9123 USB Audio at usb-0000:00:14.0-3.2, full speed
 3 [Edition        ]: USB-Audio - Logi 4K Stream Edition
                      Logi 4K Stream Edition at usb-0000:00:14.0-3.3, super speed
```

`ls -la /dev/snd/*`

```
crw-rw----+ 1 root audio 116,   0 Dec  4 23:18 /dev/snd/controlC0
crw-rw----+ 1 root audio 116,  32 Dec  4 23:18 /dev/snd/controlC1
crw-rw----+ 1 root audio 116,  64 Dec  4 23:18 /dev/snd/controlC2
crw-rw----+ 1 root audio 116,  96 Dec  4 23:18 /dev/snd/controlC3
crw-rw----+ 1 root audio 116,  19 Dec  4 23:18 /dev/snd/pcmC0D3p
crw-rw----+ 1 root audio 116,  51 Dec  4 23:18 /dev/snd/pcmC1D3p
crw-rw----+ 1 root audio 116,  80 Dec  4 23:18 /dev/snd/pcmC2D0p
crw-rw----+ 1 root audio 116, 120 Dec  4 23:18 /dev/snd/pcmC3D0c
crw-rw----+ 1 root audio 116,   1 Dec  4 23:18 /dev/snd/seq
crw-rw----+ 1 root audio 116,  33 Dec  4 23:18 /dev/snd/timer

/dev/snd/by-id:
total 0
drwxr-xr-x 2 root root  80 Dec  4 23:18 .
drwxr-xr-x 4 root root 280 Dec  4 23:17 ..
lrwxrwxrwx 1 root root  12 Dec  4 23:18 usb-046d_Logi_4K_Stream_Edition_51C07EAF-03 -> ../controlC3
lrwxrwxrwx 1 root root  12 Dec  4 23:18 usb-SYC_SA9123_USB_Audio-01 -> ../controlC2                                

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root 160 Dec  4 23:18 .
drwxr-xr-x 4 root root 280 Dec  4 23:17 ..
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:00:14.0-usb-0:3.2:1.1 -> ../controlC2                             
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:00:14.0-usb-0:3.3:1.3 -> ../controlC3                             
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:00:14.0-usbv2-0:3.2:1.1 -> ../controlC2                           
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:00:14.0-usbv3-0:3.3:1.3 -> ../controlC3                           
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:01:00.1 -> ../controlC0
lrwxrwxrwx 1 root root  12 Dec  4 23:18 pci-0000:05:00.1 -> ../controlC1
```

For reference I am still able to play audio on my system as pulseaudio is running but for applications that use alsa directly it does not work.

```
Server String: /run/user/1011/pulse/native
Library Protocol Version: 35
Server Protocol Version: 35
Is Local: yes
Client Index: 59
Tile Size: 65472
User Name: user
Host Name: system
Server Name: PulseAudio (on PipeWire 1.2.7)
Server Version: 15.0.0
Default Sample Specification: float32le 2ch 48000Hz
Default Channel Map: front-left,front-right
Default Sink: alsa_output.usb-SYC_SA9123_USB_Audio-01.iec958-stereo
Default Source: alsa_output.usb-SYC_SA9123_USB_Audio-01.iec958-stereo.monitor
Cookie: XXXX:XXXX
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/426
Repository URL: https://github.com/alsa-project/alsa-lib
