Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334FE782038
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 23:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA5F42;
	Sun, 20 Aug 2023 23:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA5F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692567358;
	bh=gyY9YJWRXpLxzqVi/cWEoH0KoIYFZz0hFPPaf87BfxE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kPYpwUU5bL8/AO99n8v4LLRGY7rJG5c4fd9imjuu1utxBOO6Obge0SOZtb01ikP2c
	 clxg1cvvfhS4NDRDDH5vqslhRV8AcMrvgdAoOh/eWpnuo0jwSsMLYSLCnIm9hkLPWF
	 ivdwhEpFOmmmwI2gxcwMgQlZI/DdzvxdUOFr/Aq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9CB5F80536; Sun, 20 Aug 2023 23:35:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2A5F8016C;
	Sun, 20 Aug 2023 23:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDF68F80199; Sun, 20 Aug 2023 23:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB9CF800D1
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 23:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB9CF800D1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692567298916019440-webhooks-bot@alsa-project.org>
References: <1692567298916019440-webhooks-bot@alsa-project.org>
Subject: How to determine which files were read/parsed
Message-Id: <20230820213502.EDF68F80199@alsa1.perex.cz>
Date: Sun, 20 Aug 2023 23:35:02 +0200 (CEST)
Message-ID-Hash: AJV6DDKTLZCKOGI5EIXOWRIGEGGEPH6Z
X-Message-ID-Hash: AJV6DDKTLZCKOGI5EIXOWRIGEGGEPH6Z
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJV6DDKTLZCKOGI5EIXOWRIGEGGEPH6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #345 was opened from bmariuszb:

I would like to know which files were read by alsa doing `alsactl restore` or `alsactl init`.
So far I know that there is a folder `/usr/share/alsa` and it has `init/00main`, and this is probably read first, because when I deleted whole alsa dir I got error about this file, then  I don't know what is read. Also there is a file `/var/lib/alsa/asound.state` which from my understanding contains values for different controls that are visible in alsamixer. There is also "user" config file in `/etc/asound.conf` and optionally any user can create `~/.asound.conf`. Am I missing any other files?
getting the list of files in order they are read for each card or all cards would be helpfull in debugging.
For example by default I found out that my card HDA Intel PCH has two devices ALC1150 Analog and ALC1150 Digital. Digital is probably one of the six jacks in the back of my PC that are unplugged so I don't care about them right now. However Analog in my PC is connected to speakers and also from motherboard comes another cable to front jack panel that I plugged my headphones. I have a few problems with the default configuration: 
1. Headphone slider in alsamixer, known as control doesn't work.
2. There are too many controls in Playback that are useless in my opinion.
3. I haven't found yet how headphone and speakers jacks where merged into one Analog device. I wonder if it's a software merge or a hardware thing. I would like to combine card 2: NVidia [HDA NVidia], device 3: HDMI 0 [X2483_2481] with the merged card 1 device 0 (headphones and speakers) and I was wondering if it would be better to merge all 3 devices at once.

Correct me if I'm wrong, but from my understanding you have to connect different devices to be able to dynamically switch between them, because normally every process, e.g browser connects to a pcm device at startup and you can't change it later. So the actual audio switching is unmuting one thing and muting rest of them. All "things" are connected to one pcm, right?

Please correct me if I'm wrong or use wrong terminology.
![image](https://github.com/alsa-project/alsa-lib/assets/57236506/2d73bb21-e9ee-4172-8e8e-04785cf0a887)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/345
Repository URL: https://github.com/alsa-project/alsa-lib
