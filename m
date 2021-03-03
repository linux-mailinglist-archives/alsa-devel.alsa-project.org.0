Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C317C32AD75
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 03:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52ED51AAB;
	Wed,  3 Mar 2021 03:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52ED51AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614738085;
	bh=9CDeYLI0NI0gbEGmTitfRpN8EWBw1qDb/Um7bCgbeHQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJuusBdaFeYK10VuPcgjWciqxGUn8rpfBq0xqIVUHv3RfWK8hyj+46JD9HEqhay78
	 qHsb3VsUFGkG3O7gWulE0myCeTBFqG7NCSv6KqxS1rWIhGgKtk1WBmRoukieC9221q
	 PRYEEy8CeYSVKGyCg+ByUqfWO+pR2O8gQ+2/5owY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EE55F8026A;
	Wed,  3 Mar 2021 03:19:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C00DF800B2; Wed,  3 Mar 2021 03:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C727EF800B2
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 03:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C727EF800B2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614737984612071991-webhooks-bot@alsa-project.org>
References: <1614737984612071991-webhooks-bot@alsa-project.org>
Subject: Fiio M3K: Failed to find a working profile
Message-Id: <20210303021953.4C00DF800B2@alsa1.perex.cz>
Date: Wed,  3 Mar 2021 03:19:53 +0100 (CET)
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

alsa-project/alsa-lib issue #123 was edited from x1unix:

Hello, I have a [Fiio M3K](https://fiio.com/m3k) player which I often use as an external USB DAC.

It worked well with Pipewire, but I had some other issues with Pipewire so I had to rollback to PulseAudio.
Unfortunately, PulseAudio and module-alsa-card cannot setup this device, so it doesn't work.

Here is a small portion of PulseAudio log (full log is available at link below):

```
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-GuangZhou_FiiO_Electronics_Technology_Co.__Ltd._FiiO_M3K_FiiO_M3K-00" card_name="alsa_card.usb-GuangZhou_FiiO_Electronics_Technology_Co.__Ltd._FiiO_M3K_FiiO_M3K-00" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
I: [pulseaudio] module-udev-detect.c: Card /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/usb5/5-1/5-1:1.0/sound/card2 (alsa_card.usb-GuangZhou_FiiO_Electronics_Technology_Co.__Ltd._FiiO_M3K_FiiO_M3K-00) failed to load module.
D: [pulseaudio] module-udev-detect.c: /dev/snd/controlC2 is accessible: yes
D: [pulseaudio] module-udev-detect.c: /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/usb5/5-1/5-1:1.0/sound/card2 is busy: no
```

I'm using ArchLinux with Linux 5.11.2 and PulseAudio 14.2.

**Logs and debug info**

USB device in `lsusb` output:

```
Bus 005 Device 022: ID 2972:0044 FiiO Electronics Technology FiiO M3K
```

aplay, pulseaudio debug log and other info I've posted as gist:
https://gist.github.com/x1unix/dae3fb810ac499cc63362a805220968f

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/123
Repository URL: https://github.com/alsa-project/alsa-lib
