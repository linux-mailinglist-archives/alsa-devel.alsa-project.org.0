Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D233822D7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 04:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA291669;
	Mon, 17 May 2021 04:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA291669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621219383;
	bh=t9cuxctlH8RB2lJGq6Ib7Pu+tiQtRkbzyGar5vEo5HE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVkETfn9f7lFFS8Ip3I4eVlZJVYDjvVWkrRzo2xaAKa+HPCTv6jDP4x59A3KV2fHe
	 m2oZfvKfknFePkd4BVukkVhX4wqn17QJWhqyYB3rTA8ox1M0kClAP7vKFPiEgP2pRb
	 jaRr6asB2EdOmMSVXzzLq4MfZ0Tj7on7ZAvEUPQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BF0F80169;
	Mon, 17 May 2021 04:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19816F8020B; Mon, 17 May 2021 04:41:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C055EF80169
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 04:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C055EF80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1621219286014741898-webhooks-bot@alsa-project.org>
References: <1621219286014741898-webhooks-bot@alsa-project.org>
Subject: [Question] Different routing + sample formats for input and output
Message-Id: <20210517024132.19816F8020B@alsa1.perex.cz>
Date: Mon, 17 May 2021 04:41:32 +0200 (CEST)
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

alsa-project/alsa-lib issue #135 was opened from flatmax:

One soundcard I use has different output and input sample formats. The input format is S32_LE. The output format is S24_3LE.
There is also a routing change I like to do.

My current .asoundrc (below) uses the asym plugin to manage input and output difference. The asym plugin creates problems for some unknown reason where I get overruns :
`ALSA lib pcm.c:8545:(snd_pcm_recover) overrun occurred`

If I switch my setup to using the soundcard for output and a second USB microphone for input, then I don't get any overruns. I still use the asym plugin to make it work and it works nicely.

I have also tried simply the plug pluging, however I still get overruns.

Is there any way to setup the one soundcard with routing and format changes without using the asym plugin ? Or is there a better way to setup the one soundcard with the required routing and format changes ?

```
########## BEGIN ~/.asoundrc ###################
@hooks [
	{
		func load
		files [
			"~/.asoundrc"
		]
		errors false
	}
]

pcm.!default {
	type asym
	playback.pcm "UMC1820_12ch_play"
	capture.pcm "UMM6_capt"
}

ctl.!default {
  type hw
  card "UMC1820_8ch"
}

pcm.UMC1820_12ch_play {
  type route;
  slave.pcm "hw:UMC1820";
  slave.format S24_3LE;
  slave.channels 12;
  ttable.0.2 1
  ttable.1.3 1
  ttable.2.4 1
  ttable.3.5 1
  ttable.4.6 1
  ttable.5.7 1
  ttable.6.8 1
  ttable.7.9 1
  ttable.8.10 1
  ttable.9.11 1
  ttable.10.0 1
  ttable.11.1 1
}

pcm.UMM6_capt {
	type linear
	slave.pcm "hw:UMM6"
	slave.format S16_LE;
}
########## END ~/.asoundrc ###################

```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/135
Repository URL: https://github.com/alsa-project/alsa-lib
