Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C457574E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 00:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C751895;
	Fri, 15 Jul 2022 00:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C751895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657836060;
	bh=amERYQVc3tKsvsWA3FseYJ1rmoxRNe504shpYsBW1Gk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6rx0CAA2V3G2zkelNPZd+8E5IjXYsESKs/wZ9p3Uj/CPR7p2U9FRjJDOCeB5xDB9
	 9kqgoWnLDDpGOmg8oPD1LlJWj3+ShgomI8OLsYM+kZ9itHOhw9hg9ViMh23Uz14D9+
	 QOAre1L+mMb63QuZO1rqjZ/EhLSr/xkHnLil2kQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB40F80152;
	Fri, 15 Jul 2022 00:00:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C707F8014E; Thu, 14 Jul 2022 23:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B974BF800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 23:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B974BF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657835995166182041-webhooks-bot@alsa-project.org>
References: <1657835995166182041-webhooks-bot@alsa-project.org>
Subject: No Audio: MAG Z690 TOMAHAWK WIFI DDR4 & how to build info request
Message-Id: <20220714215958.0C707F8014E@alsa1.perex.cz>
Date: Thu, 14 Jul 2022 23:59:58 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #189 was edited from Dave--G:

My MAG Z690 TOMAHAWK WIFI DDR4 motherboard has no alsa audio support.

It looks like the realtek-alc4080 audio chip is supported, just not on this motherboard due to a missing entry in `USB-Audio.conf`.
The USB audio device id is `0db0:b202`.
Currently it just displays as `USB Audio` and doesn't function at all.
This device works under windows so the hardware is functioning but no linux distro I've tried.

I attempted to address this myself, by downloading `https://github.com/alsa-project/alsa-ucm-conf/releases/tag/v1.2.7.2`, copying it to `/usr/share/alsa` (preserving simlinks of course) and editing `ucm2/USB-Audio/USB-Audio.conf`, changing line 46 to read `		Regex "USB((0b05:(1996|1a2[07]))|(0db0:(1feb|419c|a073|b202)))"`.
However, when I execute `sudo alsa force-reload` it generates parsing errors and `pactl list sinks` does not show any changes to the device properties as expected.

Can someone please explain what I need to do to get this device working?  Am I on the right track?  Do I need to rebuild alsa from github?  It's not clear and I'm not seeing build instructions.  I've been struggling with this for quite some time so any help would be appreciated.

I will PR the fix back to this repo once its working.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/189
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
