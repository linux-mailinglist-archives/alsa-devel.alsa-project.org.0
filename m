Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530F373E8F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 17:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D81A16AC;
	Wed,  5 May 2021 17:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D81A16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620228731;
	bh=m8bKivVk80eOZuvvdiAqtLWqu6gJ9tNazJ0B2/pGTRw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjZ8+GXPPAWY3bYD/Rt0nAFfgGN1DHSTWfEVDqwsYG6VtMiJg9tTiMqlISdjr3aRc
	 p2QghWFss2mqG5fw0F2BMbjWUbwQZybIKV+FaRCxM3YOTnNhYtwerXmqJCQiWc3C0u
	 6xHIEJkApHeKYWENAfOq+ho3+yhpZnbjyRVwNx2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A8A3F800F2;
	Wed,  5 May 2021 17:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25081F8025F; Wed,  5 May 2021 17:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 21DB9F80108
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 17:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DB9F80108
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1620228632301090002-webhooks-bot@alsa-project.org>
References: <1620228632301090002-webhooks-bot@alsa-project.org>
Subject: Setting volume of headphones seems to apply to Speakers as well
Message-Id: <20210505153041.25081F8025F@alsa1.perex.cz>
Date: Wed,  5 May 2021 17:30:41 +0200 (CEST)
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

alsa-project/alsa-utils issue #87 was opened from roboknight:

When using amixer in the following way:

amixer -c 1 set Headphone 0% mute

I receive the following partial output from scontents:

Simple mixer control 'Headphone',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 0 [0%] [-65.25dB] [off]
  Front Right: Playback 0 [0%] [-65.25dB] [off]
Simple mixer control 'Speaker',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB] [on]
  Front Right: Playback 87 [100%] [0.00dB] [on]

which looks good.  However, it appears that the volume is applied across both the Headphone control and Speaker control (or maybe even just the Master volume) as there is no output from the speakers after this even though it would appear they should have full volume and are not muted.

I am using the Ubuntu Groovy Gorilla update, so Linux kernel 5.11.  The default installation uses pulseaudio, but I've switched things to pipewire and both cause the same issue presumable because both use ALSA.  I started here because amixer seems to at least allow me to identify the problem.  When I change the Volume for the Headphones to 100% using the following:

amixer -c 1 set Headphone 100% mute

the audio from the speakers is then fine.  amixer appears to be showing the correct information (as per above) according to the audio, but the Headphone volume seems to be applying to the Speakers as well.  Maybe someone can point me in a direction that I can find a solution to this, as it would appear that anytime headphones are plugged in, removing the headphones causes the same situation: no sound.  I suspect amixer is working fine, but wherever the volume from amixer is applied, it does not appear to be set appropriately.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/87
Repository URL: https://github.com/alsa-project/alsa-utils
