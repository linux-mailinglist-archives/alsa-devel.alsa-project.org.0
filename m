Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43250341694
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 08:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DD51694;
	Fri, 19 Mar 2021 08:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DD51694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616138797;
	bh=jUMEM6gZPwJif49DYWVR9BM3vuM1+074I8LSRtISuXU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nfrMs6Tz77LSooGtqZQUGlKGH/gCiq/mZJtHbQ3i0O+KIiH2bIM3vgpB0weKXn3vU
	 WGUuosKMoaQkxB4uo4EfhkifEcU21tUakEGudKnSNAbfwamLui0+4A9VTyv9U9Vz5n
	 nOMiqwvorYi5tLEjHVAKOAF7I6hK9pGsXic2WNJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ACA3F801F7;
	Fri, 19 Mar 2021 08:25:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A090DF8021C; Fri, 19 Mar 2021 08:25:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C798F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 08:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C798F800E0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616138690655929089-webhooks-bot@alsa-project.org>
References: <1616138690655929089-webhooks-bot@alsa-project.org>
Subject: Very unstable and broken after audio device switching, reboots,
 multimedia app usage etc etc etc
Message-Id: <20210319072505.A090DF8021C@alsa1.perex.cz>
Date: Fri, 19 Mar 2021 08:25:05 +0100 (CET)
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

alsa-project/alsa-lib issue #127 was opened from oliiix:

To me this seems to be a huge issue for years now. Running Ubuntu 20.10 very latest.
I'm using an Astro A50 and two HDMI Displays for playing audio plus there's two more outputs I'm not really using. But as soon as the computer ran a little long (yes, that's actually enough to cause problems, probably due to certain apps like Unreal engine and games!), came out of sleep or I switch playback devices (which I'm doing very often and that shouldnt be ANY issue), things get seriously mixed up. Suddenly the routing goes all wrong (i select one output device, another plays instead, or just no sound at all). Sometimes "no sound" problem gets fixed by just switching devices about 10-20! times until sound is back (it either works or doesn't but that it starts working again after ten times switching devices is very weird behavior). Reinstalling as well as resetting alsa doesn't do anything to remedy no sound, restarting computer doesn't fix sound problems, only switching devices ten times does! Alsa Mixer doesn't show any controls for my A50, yet it often works even if some pro
 files are to low volume and the one that has good volume there I can't hear audio that comes from behind me (I have the no sound issue also on my HDMI outputs, just saying). Pavucontrol on the other hand lists my A50 but doesn't show one of my HDMI displays. I mean what is going wrong here (for years)??? I mean I found forum posts about these  issues that reach back years in time -.- When will we have proper working audio where audio device switching on linux is possible without any problems and the sound doesn't just "give up" after some time?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/127
Repository URL: https://github.com/alsa-project/alsa-lib
