Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C553D7BB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 18:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC0818C2;
	Sat,  4 Jun 2022 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC0818C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654359917;
	bh=L4zdy/vZSDUSLVVw8RV0yg76zDFGGIXwDdxh0q3hQ00=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GcIeVv9hABkPH3Bx/+8LJRCgmGwT4pGIC7aurChnpnDNBCxzNhZTHy+dEzzCN2rY6
	 cwtVt6+XYvilGuESkyS8Pi8udGiU0pLVBErYliyHBEknr5BqhoUJPfbvoi3pYg0Yzg
	 50wE3JAL01QozZlEvDhXMJaPdq8YZgKOaZIKHwQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B8C3F80169;
	Sat,  4 Jun 2022 18:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0096F8016D; Sat,  4 Jun 2022 18:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C3F8FF800E8
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 18:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F8FF800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654359857600541115-webhooks-bot@alsa-project.org>
References: <1654359857600541115-webhooks-bot@alsa-project.org>
Subject: ASUS ROG Maximus Z690 Hero (ALC4082) - No audio from microphone,
 no audio on the front panel
Message-Id: <20220604162423.F0096F8016D@alsa1.perex.cz>
Date: Sat,  4 Jun 2022 18:24:23 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #165 was edited from Lastique:

I'm having a problem with getting audio from the microphone connected to the rear panel jack. Also, if I connect the headset to the front panel headphone/mic jacks, I get neither audio out or in. My main concern is the rear panel jack though. The motherboard is ASUS ROG Maximus Z690 Hero, ALC4082 USB Audio chipset.

I have tried this:

1. Installed linux kernel 5.18.0.
2. Copied `ucm2` from alsa-ucm-conf master (rev ef3b6513b6581705d36432428a7f6a4ae23b1276 which is after https://github.com/alsa-project/alsa-ucm-conf/pull/143 was merged) to `/usr/share/alsa`.
3. In `/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf` added hardware id of my USB Audio device (`0b05:1a27`) to the `realtek-alc4080` rule. Also added the hardware id in `/usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf`, in the `asus-rog-usb` block condition.
4. Rebooted.
5. The headset is connected to the rear panel (Front out and Mic in jacks; also tried Line in).

There are three devices for the USB Audio card, and there are three volume controls in alsamixer: "Line", "Mic" and "Analog In". The problem is that there is no audio coming from the first two devices (which are presumably "Line" and "Mic"). I can record audio from the third device ("Analog In") when the microphone is connected to Mic jack.

Unfortunately, "Analog In" cannot be selected in PulseAudio for some reason (I created a [bug](https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1364) for PA), which means no audio can be recorded.

I also tried to connect the headset to the front panel connectors, but got no audio output nor capture. This is not my intended configuration though, I normally connect the headset to the rear panel.

`arecord` output:
[arecord.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8838239/arecord.txt)
`lsusb` output:
[lsusb.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8838241/lsusb.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/165
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
