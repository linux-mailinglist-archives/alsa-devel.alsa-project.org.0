Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A70C61F0E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Nov 2025 00:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A36360203;
	Mon, 17 Nov 2025 00:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A36360203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763337218;
	bh=sz6wIcuXYCeCu0lbqAFtvNvHFXkGteS4Mg8CtBkxh+M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YSqxZrUMGZ/SDv+TMpFaW0emVGkynPK9IqR6M01bGjP9RWRN6Gn60TtNRRnW9c0ej
	 07+8iq8VuWAvl/x2D2t+6s3PmCtB/JQtPWHvyOK7T4zs0Fa+i4DjbcvG+X44eIISZa
	 3sC/4AE8qD9iV6+WspEmoL+3GOnyoT3sJrAz0ewE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FC18F805C2; Mon, 17 Nov 2025 00:53:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E4FF805BD;
	Mon, 17 Nov 2025 00:53:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C08CF80551; Mon, 17 Nov 2025 00:51:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2795EF8012B
	for <alsa-devel@alsa-project.org>; Mon, 17 Nov 2025 00:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2795EF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1878a1c25db8d600-webhooks-bot@alsa-project.org>
In-Reply-To: <1878a1c25d983300-webhooks-bot@alsa-project.org>
References: <1878a1c25d983300-webhooks-bot@alsa-project.org>
Subject: snd-loopback does not work
Date: Mon, 17 Nov 2025 00:51:53 +0100 (CET)
Message-ID-Hash: HS7SYIBFQF4YUWYZIGWLQVONGAPFNDO2
X-Message-ID-Hash: HS7SYIBFQF4YUWYZIGWLQVONGAPFNDO2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS7SYIBFQF4YUWYZIGWLQVONGAPFNDO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #482 was edited from Sameguyy:

```
$pactl list short sources
80	alsa_output.platform-snd_aloop.0.analog-stereo.monitor	PipeWire	s32le 2ch 48000Hz	RUNNING
81	alsa_input.platform-snd_aloop.0.analog-stereo	PipeWire	s32le 2ch 48000Hz	RUNNING
```
These are two interfaces that Pipewire automatically pulled in, and the sound goes into 3.0 and doesn't leave from 3.1



That is, I play a sound on hw:3.0 and when I try to read something from hw:3.1 I get silence

aplay\arecord records silence
$ uname -r
6.17.8-arch1-1 Wayland PipeWire gnome



```$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC892 Analog [ALC892 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 1: ALC892 Digital [ALC892 Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: DACX6 [DAC-X6], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: DACX6 [DAC-X6], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 3: HDMI 0 [SAMSUNG]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: Loopback [Loopback], device 0: Loopback PCM [Loopback PCM]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
card 3: Loopback [Loopback], device 1: Loopback PCM [Loopback PCM]
  Subdevices: 8/8
  Subdevice #0: subdevice #0
  Subdevice #1: subdevice #1
  Subdevice #2: subdevice #2
  Subdevice #3: subdevice #3
  Subdevice #4: subdevice #4
  Subdevice #5: subdevice #5
  Subdevice #6: subdevice #6
  Subdevice #7: subdevice #7
```

```
$pacman -Q | grep  alsa
alsa-card-profiles 1:1.4.9-1
alsa-lib 1.2.14-2
alsa-plugins 1:1.2.12-5
alsa-topology-conf 1.2.5.1-4
alsa-ucm-conf 1.2.14-2
alsa-utils 1.2.14-1
lib32-alsa-lib 1.2.14-2
lib32-alsa-plugins 1.2.12-1
vlc-plugin-alsa 3.0.21-31
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/482
Repository URL: https://github.com/alsa-project/alsa-lib
