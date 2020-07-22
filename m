Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C930922969B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537A11670;
	Wed, 22 Jul 2020 12:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537A11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595415022;
	bh=jd7Rsmkdci5xlJ+4sVbEUvJ19v3MxaRX+y7a95nIhyU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arINLTm3SIsW0N+TprJTxf65ayBoFfKeQiCxwaNythu/L3rZiADOKmxJ4QOZeUFFL
	 gmUlYDm48EixGwlVdoTqBznDT4rb4FgB8Kfdn1KoEPVC4xuHe4/wlhn5oOZaoQ0Vgx
	 rLOM+h8gnRhhVfK4yuBziJdHKvyA49/M+DYNoeaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95044F80087;
	Wed, 22 Jul 2020 12:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A27F8014C; Wed, 22 Jul 2020 12:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 19083F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19083F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595414913076913118-webhooks-bot@alsa-project.org>
References: <1595414913076913118-webhooks-bot@alsa-project.org>
Subject: Several issues with HP OMEN dc-0019-ur
Message-Id: <20200722104840.07A27F8014C@alsa1.perex.cz>
Date: Wed, 22 Jul 2020 12:48:40 +0200 (CEST)
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

alsa-project/alsa-lib issue #73 was opened from UnicodeMan:

Hi. I am using HP OMEN dc0019ur laptop with linux 5.7-xanmod kernel and KDE neon system. 
Laptop has combined 3.5mm jack and a seperate stereo microphone jack.

With no modprobe changes:
mute led does not work, headphones work, but microphone is not detected, and if i plug anything into microphone jack, it switches to microphone in combined jack.

With hp-line1-mic1 quirk: mute led works fine, headphones are detected, except microphone, though it works anyway. Seperate microphone jack does not work at all.

With headset-mic quirk:
mute led does not work, headphones jack works, microphone (from headphones jack) is not detected when present but works when switched to anyway
Microphone jack works perfectly (detects a plugged in mic, works in stereo).

no quirks: http://alsa-project.org/db/?f=a73a83ba0610e3fd88310999b197fdde4372249a
hp-line1-mic1: http://alsa-project.org/db/?f=f4d08dec7918c79a391fb1898d50c57a2448d872
headset-mic: https://alsa-project.org/db/?f=4b1eeef821f39eea28071ac2f2c0babcf515ef14

aaand, I hope I am writing this issue in correct place :D

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/73
Repository URL: https://github.com/alsa-project/alsa-lib
