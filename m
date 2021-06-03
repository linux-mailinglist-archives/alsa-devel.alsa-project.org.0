Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97862399E2B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 11:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 179CF16CA;
	Thu,  3 Jun 2021 11:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 179CF16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622713978;
	bh=jymY0UU5csv7Cc3Qsm33nZ3EVW4y8i6rASl5KWFr1Bw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WlZ9NkOIokfgb6WR3tPtupg38owU6XOCmhT2EWvIX4IWoHvjS578CHHWwVX73YNyJ
	 xaiuywR9jaHUXynyvUmb80w5Dx58P/zGz1BZpJo/1Y8QZ2oROd/GgzB3it+PHZFIIe
	 et9Mqznnz1jvF/rMCMu1dzyWyIkeS6tJ/DEcZXPM=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 706DEF80253;
	Thu,  3 Jun 2021 11:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3DCF80254; Thu,  3 Jun 2021 11:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9B968F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 11:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B968F80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622713875455584049-webhooks-bot@alsa-project.org>
References: <1622713875455584049-webhooks-bot@alsa-project.org>
Subject: Speakers + Microphone Volume Reset
Message-Id: <20210603095122.AB3DCF80254@alsa1.perex.cz>
Date: Thu,  3 Jun 2021 11:51:22 +0200 (CEST)
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

alsa-project/alsa-lib issue #144 was edited from rosenbergd:

Every time I start up, connect or disconnect headphones, my volume resets to 74%, I've also noticed the microphone is doing the same thing.

I'm not sure if this is a pulseaudio bug, but here are the logs from `pulseaudio -vv` which seems to show alsa increasing the volume to 74% after initially setting it to 25% which is the correct volume that it should be at:
```
D: [pulseaudio] module-alsa-card.c: Jack 'Headphone Jack' is now plugged in
D: [pulseaudio] device-port.c: Setting port analog-output-headphones to status yes
D: [pulseaudio] module-switch-on-port-available.c: Trying to switch to port analog-output-headphones
I: [pulseaudio] alsa-sink.c: Successfully enabled deferred volume.
I: [pulseaudio] alsa-sink.c: Hardware volume ranges from -179.00 dB to 0.00 dB.
I: [pulseaudio] alsa-sink.c: Fixing base volume to 0.00 dB
I: [pulseaudio] alsa-sink.c: Using hardware volume control. Hardware dB scale supported.
I: [pulseaudio] alsa-sink.c: Using hardware mute control.
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Activating path analog-output-headphones
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Path analog-output-headphones (Headphones), direction=1, priority=99, probed=yes, supported=yes, has_mute=yes, has_volume=yes, has_dB=yes, min_volume=0, max_volume=64, min_dB=-179, max_dB=0
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'Master', direction=1, switch=1, volume=1, volume_limit=-1, enumeration=0, required=0, required_any=0, required_absent=0, mask=0x7ffffffffffff, n_channels=1, override_map=yes
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'Headphone', direction=1, switch=1, volume=1, volume_limit=-1, enumeration=0, required=0, required_any=4, required_absent=0, mask=0x3600000000f66, n_channels=2, override_map=yes
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'Speaker', direction=1, switch=2, volume=2, volume_limit=-1, enumeration=0, required=0, required_any=0, required_absent=0, mask=0x6, n_channels=2, override_map=no
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'Bass Speaker', direction=1, switch=2, volume=2, volume_limit=-1, enumeration=0, required=0, required_any=0, required_absent=0, mask=0x6, n_channels=2, override_map=no
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'PCM', direction=1, switch=0, volume=1, volume_limit=-1, enumeration=0, required=0, required_any=0, required_absent=0, mask=0x3600000000f66, n_channels=2, override_map=yes
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Element 'IEC958', direction=1, switch=2, volume=0, volume_limit=-1, enumeration=0, required=0, required_any=0, required_absent=0, mask=0x0, n_channels=0, override_map=no
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Dock Headphone, alsa_name='Dock Headphone Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Dock Headphone Phantom, alsa_name='Dock Headphone Phantom Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Front Headphone, alsa_name='Front Headphone Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Front Headphone, alsa_name='Front Headphone Jack', index='1', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Front Headphone Front, alsa_name='Front Headphone Front Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Front Headphone Surround, alsa_name='Front Headphone Surround Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Front Headphone Phantom, alsa_name='Front Headphone Phantom Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Headphone, alsa_name='Headphone Jack', index='0', detection possible
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Headphone Phantom, alsa_name='Headphone Phantom Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Headphone Mic, alsa_name='Headphone Mic Jack', index='0', detection unavailable
D: [alsa-sink-ALC892 Analog] alsa-mixer.c: Jack Headphone - Output, alsa_name='Headphone - Output Jack', index='0', detection unavailable
I: [pulseaudio] sink.c: Changed port of sink 0 "alsa_output.pci-0000_00_1f.3.analog-stereo" to analog-output-headphones
I: [pulseaudio] module-device-restore.c: Restoring volume for sink alsa_output.pci-0000_00_1f.3.analog-stereo.
D: [pulseaudio] sink.c: The reference volume of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from front-left: 1369 /   2% / -100.80 dB,   front-right: 1369 /   2% / -100.80 dB to front-left: 16380 /  25% / -36.13 dB,   front-right: 16380 /  25% / -36.13 dB.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Requested volume: front-left: 16380 /  25% / -36.13 dB,   front-right: 16380 /  25% / -36.13 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Got hardware volume: front-left: 16462 /  25% / -36.00 dB,   front-right: 16462 /  25% / -36.00 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Calculated software volume: front-left: 65210 / 100% / -0.13 dB,   front-right: 65210 / 100% / -0.13 dB (accurate-enough=yes)
D: [alsa-sink-ALC892 Analog] sink.c: Volume going up to 16380 at 263091695
D: [alsa-sink-ALC892 Analog] sink.c: Volume change to 16380 at 263091695 was written 5 usec late
I: [pulseaudio] module-device-restore.c: Restoring mute state for sink alsa_output.pci-0000_00_1f.3.analog-stereo.
D: [pulseaudio] sink.c: The mute of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from yes to no.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] device-port.c: Setting port analog-output-speaker to status no
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] card.c: Setting card alsa_card.pci-0000_00_1f.3 profile output:analog-surround-21 to availability status no
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] card.c: Setting card alsa_card.pci-0000_00_1f.3 profile output:analog-surround-21+input:analog-stereo to availability status no
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] card.c: Setting card alsa_card.pci-0000_00_1f.3 profile output:analog-surround-40 to availability status no
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] card.c: Setting card alsa_card.pci-0000_00_1f.3 profile output:analog-surround-40+input:analog-stereo to availability status no
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 5578 /   9% / -64.20 dB,   front-right: 5578 /   9% / -64.20 dB
D: [pulseaudio] sink.c: The reference volume of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from front-left: 16380 /  25% / -36.13 dB,   front-right: 16380 /  25% / -36.13 dB to front-left: 5578 /   9% / -64.20 dB,   front-right: 5578 /   9% / -64.20 dB.
D: [pulseaudio] sink.c: The mute of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from no to yes.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 49714 /  76% / -7.20 dB,   front-right: 49714 /  76% / -7.20 dB
D: [pulseaudio] sink.c: The reference volume of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from front-left: 5578 /   9% / -64.20 dB,   front-right: 5578 /   9% / -64.20 dB to front-left: 49714 /  76% / -7.20 dB,   front-right: 49714 /  76% / -7.20 dB.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [pulseaudio] sink.c: The mute of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from yes to no.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [pulseaudio] sink.c: The reference volume of sink alsa_output.pci-0000_00_1f.3.analog-stereo changed from front-left: 49714 /  76% / -7.20 dB,   front-right: 49714 /  76% / -7.20 dB to front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB.
D: [pulseaudio] core-subscribe.c: Dropped redundant event due to change event.
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
D: [alsa-sink-ALC892 Analog] alsa-sink.c: Read hardware volume: front-left: 48583 /  74% / -7.80 dB,   front-right: 48583 /  74% / -7.80 dB
I: [pulseaudio] module-device-restore.c: Storing volume/mute for device+port sink:alsa_output.pci-0000_00_1f.3.analog-stereo:analog-output-headphones.
I: [pulseaudio] module-device-restore.c: Synced.
```

I'm using Linux Mint 20.1 Cinnamon v4.8.6
Kernel `v5.4.0-74` (but this was happening on `-73` as well)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/144
Repository URL: https://github.com/alsa-project/alsa-lib
