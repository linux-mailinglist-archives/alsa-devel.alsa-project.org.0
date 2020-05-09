Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC71CC0FB
	for <lists+alsa-devel@lfdr.de>; Sat,  9 May 2020 13:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DB384A;
	Sat,  9 May 2020 13:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DB384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589023739;
	bh=k4wxx2uQn2LSuLKFM/Xj+98i0LAzhZXBBHrCWpWdLuo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sh+eZB/JndT7xXFTMLJ34SkLfM2xu6G1eoSFVEPe0QVbpW8QOvgl5Ild9vDzz7EiR
	 d9l7jWE5w5xBw85HX916+uWtZgnfVtQfV0sTl46Bbb0dc+e4ufa8BYvIbgZ1XHYB/o
	 x3BKSwsdZAGkXAJqnCaDU0tffq7qNf0VmfY/q/6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6CECF80162;
	Sat,  9 May 2020 13:27:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2405AF8015F; Sat,  9 May 2020 13:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 77429F800E7
 for <alsa-devel@alsa-project.org>; Sat,  9 May 2020 13:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77429F800E7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589023625704346895-webhooks-bot@alsa-project.org>
References: <1589023625704346895-webhooks-bot@alsa-project.org>
Subject: crackling microphone
Message-Id: <20200509112714.2405AF8015F@alsa1.perex.cz>
Date: Sat,  9 May 2020 13:27:14 +0200 (CEST)
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

alsa-project/alsa-plugins issue #10 was reopened from riddicc:

Hi!

When I send a 800Hz sine wave with rate 12345 to pcm.outmic and
when I arecord from pcm.micend at rate 8000 with 1 channel ([/etc/asound.conf](https://github.com/alsa-project/alsa-plugins/files/4597703/etc-asound-conf.txt)),
then I get a lot of tiny little gaps (see attachment) and a lot of messages like "overrun!!! (at least 0.014 ms long)" (the "ms" vary from 0.008 to 0.043; and arecord continues to record) and sometimes even this error: "arecord: xrun:1672: read/write error, state = RUNNING" (it causes arecord to terminate).

1. > speaker-test -D outmic -t sine -f 800 -c2 -r 12345
2. > arecord -D micend -r 8000 -c 1 -f S16_LE /tmp/bla.wav

twinkle makes even bigger gaps, when I let it use pcm.micend as microphone...
But with hw:Generic,0,0 as mic device twinkle works fine...
https://github.com/LubosD/twinkle/issues/207

"samplerate_best" and "samplerate_order" seems to make it worse...

How can I fix that?

Thx.

Bye.

![audacity screenshot](https://user-images.githubusercontent.com/33246439/81384628-7ad51080-9101-11ea-849d-6afb14bf1307.png)

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/10
Repository URL: https://github.com/alsa-project/alsa-plugins
