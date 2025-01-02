Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFB9FF543
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2025 01:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2606043A;
	Thu,  2 Jan 2025 01:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2606043A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735776740;
	bh=pkbxvB/QBaDUfihKljVt8qXOuOPJSkHbpbL6oNzeSfY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kHU/ctj/wWQM/WcCTFBou+9Nl0ux3DMrDEdO80IrqWEzfOV74sBqT25rEcV+bWSOG
	 9ncALRorWTvkkFp99UHrdrcs4AOhWyVIXib2VAL8hEKZfcd11u2qIJFoBNohcpOg+u
	 ocKK/0nQQCPVTq18VblnZBn2muVucaZhOi3Rh7ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A64A8F8047D; Thu,  2 Jan 2025 01:11:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B75DF805B4;
	Thu,  2 Jan 2025 01:11:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E793DF80154; Thu,  2 Jan 2025 01:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 53394F80104
	for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2025 01:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53394F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1735776690710883856-webhooks-bot@alsa-project.org>
References: <1735776690710883856-webhooks-bot@alsa-project.org>
Subject: Missunderstanding or a BUG in reported frequencies for audio cards
 present in system.
Message-Id: <20250102001133.E793DF80154@alsa1.perex.cz>
Date: Thu,  2 Jan 2025 01:11:33 +0100 (CET)
Message-ID-Hash: S3A3HLSNLCJ2YP7T4KQBJBMT6FSM3V5W
X-Message-ID-Hash: S3A3HLSNLCJ2YP7T4KQBJBMT6FSM3V5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3A3HLSNLCJ2YP7T4KQBJBMT6FSM3V5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #432 was edited from CapSel:

I use ArchLinux with kernel 6.12.7 with "Zen" patches. HW is ASUS Vivobook 14X pro.

So the problem I'm having is that I can't set pipewire to 96000 sampling rate. I tried all options in pipewire. Nothing helped. But a long time ago it worked fine - I can't remember when (at most week after Baldur's Gate 3 release ;).

What I see in system:
when I do `cat /proc/asound/card0/pcm3p/info` (no other pcm* files) I can see `name: HDMI 0` - it's important.
with `cat /proc/asound/card0/codec#0` on top there is:
```
Codec: ATI R6xx HDMI
Address: 0
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x1002aa01
Subsystem Id: 0x00aa0100
Revision Id: 0x100700
No Modem Function Group found
Default PCM:
    rates [0x70]: 32000 44100 48000
    bits [0x2]: 16
    formats [0x1]: PCM
```

for the other (default) audio card:
`cat /proc/asound/card1/pcm0p/info` (there is pcm0c file too but I did not check it) gives: `name: ALC294 Analog`
`cat /proc/asound/card1/codec#0` on top:
```
Codec: Realtek ALC294
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0294
Subsystem Id: 0x10431ab2
Revision Id: 0x100004
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
```

so as you can see:
- hdmi supports up to 48000
- analog supports up to 192000

I first noticed there is something wrong with alsacap program that reports:
```
*** Scanning for playback devices ***
Card 0, ID `Generic', name `HD-Audio Generic'
  Device 3, ID `HDMI 0', name `HDMI 0', 1 subdevices (1 available)
    2..8 channels, sampling rate 32000..192000 Hz
    Sample formats: S16_LE, S32_LE
      Subdevice 0, name `subdevice #0'
Card 1, ID `Generic_1', name `HD-Audio Generic'
  Device 0, ID `ALC294 Analog', name `ALC294 Analog', 1 subdevices (1 available)
    2 channels, sampling rate 44100..48000 Hz
    Sample formats: S16_LE, S32_LE
      Subdevice 0, name `subdevice #0'
```

As you can see:
- hdmi supports up to 192000
- analog supports up to 48000

so it's... flipped?

here is a output from `cat /proc/asound/pcm`:
```
00-03: HDMI 0 : HDMI 0 : playback 1
01-00: ALC294 Analog : ALC294 Analog : playback 1 : capture 1
```

To confirm this I downloaded flac file with 96000 sample rate and tried to play it with ffmpeg after pipewire,pipewire-pulse,wireplumber services are stopped. I confirmed that these programs are disabled by checking if `ps ax | grep wire` before and after, also I monitored logs from these services. It reported error for device "hw:1,0" because it could not set sampling rate to 96000. It did not fail on "hw:0,3" but of course I did not hear anything since external monitor is disconnected.

Replay command: `ffmpeg -i yuri_korzunov-through-moon_ring-96kHz-24bit.flac -f alsa hw:1,0`
the file is some random file found in internet that tested with `ffprobe` shows that it has sample rate of 96000.
I don't want to attach it since I forgot where I found it ;)

I don't have `asound.conf` files in `/etc/` or `~/.config`.

After connecting external monitor alsacap reports max 48000 for both cards. FFmpeg reports sampling rate problem with both audio cards:
```
[alsa @ 0x586316542b00] sample rate 96000 not available, nearest is 48000
```

I had this monitor connected before and alsacap reported "flipped" results - not like now that both cards are limited to 48000.

What else can I do to discover the problem?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/432
Repository URL: https://github.com/alsa-project/alsa-lib
