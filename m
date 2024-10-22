Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA29A9548
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2024 03:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A5286F;
	Tue, 22 Oct 2024 03:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A5286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729559583;
	bh=rTjlElDCTb1dvfsylNEz5S5rf1ez0dSFrmIAuIdavPg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TMtiyNUY6wDi9tKCENQRB8eOabqICTBNgLcJL6zAxXq0XbJDYRprYSJZYEG/K4pwy
	 HiVBQQMHsPubd00xNlXhtM1IxXjH3y7ajRQGDlfvepEVTDtTZZY+nWlix4gs4+9EE8
	 AJxwJMqD+V3V5xSmORcsnx7gBpW4eYo7NYDP6jDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D7DF80272; Tue, 22 Oct 2024 03:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 726B3F805A8;
	Tue, 22 Oct 2024 03:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EBCDF8016C; Tue, 22 Oct 2024 03:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A02FCF80104
	for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2024 03:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02FCF80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729559552091383696-webhooks-bot@alsa-project.org>
References: <1729559552091383696-webhooks-bot@alsa-project.org>
Subject: AlSA problem , audio on/off across multiple ubutnu
Message-Id: <20241022011234.4EBCDF8016C@alsa1.perex.cz>
Date: Tue, 22 Oct 2024 03:12:34 +0200 (CEST)
Message-ID-Hash: 5WAEE5MJXQEXTYPCTELYDE64Z2UTM6VM
X-Message-ID-Hash: 5WAEE5MJXQEXTYPCTELYDE64Z2UTM6VM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WAEE5MJXQEXTYPCTELYDE64Z2UTM6VM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #414 was opened from Kermilli:

Hi, 

I've been having problems with audio on ubuntu on and off. I'm not a professional but everything seems to point at alsa . The pulse troubleshooting page at some point recommends to run alsa directly/bypass pulse with the command `mplayer -ao alsa:device=hw=0 yourchosentrack.mp3`  which  gives 
`[AO_ALSA] alsa-lib: pcm_hw.c:1715:(snd_pcm_hw_open) open '/dev/snd/pcmC0D0p' failed (-2): No such file or directory
[AO_ALSA] Playback open error: No such file or directory
Failed to initialize audio driver 'alsa:device=hw=0'
Could not open/initialize audio device -> no sound.
Audio: no sound
Video: no video
` 
sudo pulseaudio -vvv gives

`E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="1" name="pci-0000_00_1b.0" card_name="alsa_card.pci-0000_00_1b.0" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.`

 
I've tried everything . The only time it worked was when I added options snd-hda-intel model=auto to  /etc/modprobe.d/alsa-base.conf. , but even then it stopped working after some time when I was listening to audio.


Any help would be greatly appreciated!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/414
Repository URL: https://github.com/alsa-project/alsa-lib
