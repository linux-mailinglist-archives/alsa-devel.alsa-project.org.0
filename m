Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA68B10CA3
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 16:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A831560239;
	Thu, 24 Jul 2025 16:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A831560239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753365995;
	bh=2xOTWkCftBiLNZMGhkii8IVqjx9lf+LGs62EZiugh6o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NM7ywuG75sPBMQ9z3tca8V6utRGw7X99LJFtjZ1mScGLGMus7qoD6VPxkrzmpK2GJ
	 HLCYVUoNZKGNsoQ6we9b6EAA8EpjXyxrSnSl6L6hwv1luSNKRuS+2LPZ+Bz3LJ6fNw
	 w6MT24D6Kxoj10KJewH2w7PNtII0ptyf1TIomWJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38559F805B6; Thu, 24 Jul 2025 16:06:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0745F805C5;
	Thu, 24 Jul 2025 16:06:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF507F804E5; Thu, 24 Jul 2025 16:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 324A1F8007E
	for <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 16:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324A1F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1855350181c58300-webhooks-bot@alsa-project.org>
In-Reply-To: <18553501818cf200-webhooks-bot@alsa-project.org>
References: <18553501818cf200-webhooks-bot@alsa-project.org>
Subject: HDMI card is marked "off" on system resume and stays so until reset
Date: Thu, 24 Jul 2025 16:05:20 +0200 (CEST)
Message-ID-Hash: A3WJMC3JE7IJYYQMIXNKXEVB6ZSDFQGF
X-Message-ID-Hash: A3WJMC3JE7IJYYQMIXNKXEVB6ZSDFQGF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3WJMC3JE7IJYYQMIXNKXEVB6ZSDFQGF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #465 was opened from j39m:

(Continued from [Pipewire issue 4809](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4809).)

# Basic Symptoms

When resuming, my device often fails to continue playback over my HDMI output. Higher-level utils (`pavucontrol`, `pw-dump`, etc.) report that the corresponding "sink" is not present (until I reset the output).

Pipewire dev `@pvir` read my logs thusly:

<details>

<summary>`alsactl monitor` and `amixer`</summary>

Last state update after resume:

```
2025-07-24 22:15:16,844: alsactl
node hw:0, #7 (0,0,0,HDMI/DP,pcm=7 Jack,0) VALUE

2025-07-24 22:15:16,854: amixer
numid=7,iface=CARD,name='HDMI/DP,pcm=7 Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
```

The next update then comes only when workaround is run:

```
2025-07-24 22:16:02,772: alsactl
node hw:0, #12 (3,7,0,ELD,0) VALUE INFO

2025-07-24 22:16:02,781: amixer
numid=7,iface=CARD,name='HDMI/DP,pcm=7 Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
```

It appears there was no notification for the off->on transition, or the off->on only happens when doing the workaround cycling displays, so probably this is ALSA or HDMI bug.

</details>

I haven't tried waiting longer than this, but I assume that if ALSA thinks the card is still gone ~45s after resume, it's already a bit too far gone to be worried about exact timing.

# System readout

<details>

```
[j39m@flaglock6 ~/Downloads/tmp]
$ rpm -q alsa-lib intel-audio-firmware
alsa-lib-1.2.14-3.fc42.x86_64
intel-audio-firmware-20250708-1.fc42.noarch
[j39m@flaglock6 ~/Downloads/tmp]
$ inxi -A
Audio:
  Device-1: Advanced Micro Devices [AMD/ATI] Raven/Raven2/Fenghuang HDMI/DP
    Audio driver: snd_hda_intel
  Device-2: Advanced Micro Devices [AMD] Audio Coprocessor
    driver: snd_pci_acp3x
  Device-3: Advanced Micro Devices [AMD] Family 17h/19h/1ah HD Audio
    driver: snd_hda_intel
  API: ALSA v: k6.15.6-200.fc42.x86_64 status: kernel-api
  Server-1: PipeWire v: 1.4.6 status: active
```

</details>

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/465
Repository URL: https://github.com/alsa-project/alsa-lib
