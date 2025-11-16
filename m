Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5DC61EFF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Nov 2025 00:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AF6601D5;
	Mon, 17 Nov 2025 00:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AF6601D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763336866;
	bh=2Qp39G1QcH+SwdbbIRzx8agtJVYh04BzJUD+CnvWZc8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WVeWU9zh7fcbYFbieBnf9IlbEiUw9dmyrFK0Wgwq8opBnN4GoreQs8orYW31QMr+8
	 8dqUj4y8CdHE9x1f/ehR14TChxWSyYRsTytFcxHaim7Y4HxLG3epLcrY9RVQ+07fcl
	 DQIeNAvh5UnRC1Son7i9wewV+dCbSJ5JIifgik2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D311CF805BA; Mon, 17 Nov 2025 00:47:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C92F805CB;
	Mon, 17 Nov 2025 00:47:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9E3FF80551; Mon, 17 Nov 2025 00:43:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A80CF8012B
	for <alsa-devel@alsa-project.org>; Mon, 17 Nov 2025 00:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A80CF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1878a14f7bef0900-webhooks-bot@alsa-project.org>
In-Reply-To: <1878a14f7bdd3e00-webhooks-bot@alsa-project.org>
References: <1878a14f7bdd3e00-webhooks-bot@alsa-project.org>
Subject: snd-loopback does not work
Date: Mon, 17 Nov 2025 00:43:40 +0100 (CET)
Message-ID-Hash: 6LNN3MQ5TVQQXHO4ETHVDGP2MVCOYH6I
X-Message-ID-Hash: 6LNN3MQ5TVQQXHO4ETHVDGP2MVCOYH6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LNN3MQ5TVQQXHO4ETHVDGP2MVCOYH6I/>
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

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/482
Repository URL: https://github.com/alsa-project/alsa-lib
