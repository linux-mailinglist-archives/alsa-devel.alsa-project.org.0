Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481312F5C8E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 09:42:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BCC1683;
	Thu, 14 Jan 2021 09:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BCC1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610613732;
	bh=cJ+p9xpYMdKgMtVn+BqIr9BrFG746Y0KmZJvK9pADbg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SelOiqCXvml7tlRFw9OXyStN2Hpz7s9Dxd1Wjdv4Ww/hYAGA1eU/RJ06je7d+8AvH
	 sOxnZBiQg1BnsK8jvr81KHpOUX+KXhgM8i41wQTm44OjgODZ4INzFPS5OyMrQ/CtGm
	 n77csaGovkdekczdH0RLvLKcVCubkvAnxm+bvOxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 372FFF8026F;
	Thu, 14 Jan 2021 09:40:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AA43F8025E; Thu, 14 Jan 2021 09:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B3319F80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 09:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3319F80118
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610613630844088078-webhooks-bot@alsa-project.org>
References: <1610613630844088078-webhooks-bot@alsa-project.org>
Subject: Audio over HDMI via USB-C Dock broke recently - module-alsa-card.c:
 Failed to find a working profile
Message-Id: <20210114084037.7AA43F8025E@alsa1.perex.cz>
Date: Thu, 14 Jan 2021 09:40:37 +0100 (CET)
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

alsa-project/alsa-lib issue #112 was opened from asgrim:

Hi folks, not sure if this is related to #104 since I get the same error, but slightly different characteristics. Running Ubuntu 20.04.1 here.

I've got an XPS 17 9700, which is plugged into a Dell WD19TB dock via USB-C. Off that, I have a Dell 34" screen via HDMI, into which my speakers are plugged in. My headphones are plugged directly into the WD19TB dock. I do have a Yeti mic as well, which is plugged via USB into the dock also. I often switch between my speakers/headphones using a Gnome extension (I select either `Headphones (USB Audio)` or HDMI something (can't remember what it was called exactly).  However, I noticed recently (maybe last week or two?) I wasn't able to switch. Looked into it today, it's because the HDMI audio output seems completely missing. Does not show in regular Ubuntu sound settings, nor in `pavucontrol`. Checked /var/log/syslog, and found this `Failed to find a working profile` message.

Some Googling bought me here, hopefully you lovely folks can help!

* `pacmd ls` output is [here](https://gist.github.com/asgrim/1788fcae11cd1d0ced106c5d94199f29#file-pacmd)
* `pulseaudio -vvvvv` output is [here](https://gist.github.com/asgrim/1788fcae11cd1d0ced106c5d94199f29#file-pulse)

Hopefully this is just user error, but this did used to work, and I don't know where to ask for help as I know nothing about Linux audio stuff :D

Side note: I'm aware there's an issue with my XPS 17 "onboard" speakers not working, they've never worked; I believe there's a fix out there, but it looks complicated so I have so far avoided it. I'm ok with this as I've got the external speakers anyway.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/112
Repository URL: https://github.com/alsa-project/alsa-lib
