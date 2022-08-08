Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C758CA85
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7096682C;
	Mon,  8 Aug 2022 16:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7096682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968810;
	bh=+2sAbln2ufiFwFxtHgKkYUlkkk4JkNYnr+FO3n024p8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gmsw+bqaHy1MwyZuifDYnTT7Wxhlb8SyzoeIOKZbDnENYyTr8QvO8oL1UK71H0idI
	 ceeSav/4fiBEyC02SWQUg8pqsKvoe4HNQvIqnrZLhjYoxe1Q7TPyhZjAPxcRjDQMLK
	 cbu/jT8fkZXbZMEM0iwBisWZLF5Zfbx82PiuEWCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC729F804B1;
	Mon,  8 Aug 2022 16:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1446BF8049C; Mon,  8 Aug 2022 16:25:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A9267F800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9267F800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1659968745172343969-webhooks-bot@alsa-project.org>
References: <1659968745172343969-webhooks-bot@alsa-project.org>
Subject: ASUS ROG Zenith II Extreme UCM2 profile
Message-Id: <20220808142550.1446BF8049C@alsa1.perex.cz>
Date: Mon,  8 Aug 2022 16:25:50 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #197 was opened from nabajour:

Hi, 
I'm trying to get sound working on my ASUS ROG Zenith II Extreme motherboard. There is a [kernel patch](https://bugzilla.kernel.org/show_bug.cgi?id=211005) that I'm using for a while, that seems to get most ALSA stuff working. It kinda also works with the default ProAudio ACP profile (minus some case where it seems to loose synch after a while. But recording works).

Now, I'm trying to get it to work correctly with my Debian unstable desktop, using PipeWire with the PA tools (mostly pavucontrol).

Mostly, the routing of the inputs for capture seem to not work. It's always routing the input from `hw:0,0`, which is `Line In`.

I tried making a UCM2 profile, and got some basic stuff working. but there are some things where I'm stuck.

What I do is edit the UCM files, and then reload PW and WP with `systemctl --user restart pipewire pipewire-pulse wireplumber`. Then, I check with `pavucontrol` what devices appear. If there is a syntax error, it falls back to `Off` profile, or `ProAudio` profile, which was an experiment from me to see if I could just have the same pass-through behaviour as the ACP pass-through. I don't know if there is a better way to debug UCM2 profile loading, this approach leaves me pretty blind on what failed. 

Here are the issues I currently have:

1. surround input channels are mixed up compared to alsa channels (testing with `speaker-test` output, sound goes to wrong outputs with pw.
2. Can't get SPDIF to work. When I uncomment the SPDIF block, it doesn't load the profile. 
3. Mic 1 (the rear mic) appears and reacts correctly to jack plug/unplug. But recording seems to take the input from `hw:0,0` instead of `hw:0,1`
4. uncommenting the Line In or the Mic2 (front mic)  block fails. It doesn't load the profile.

I don't know if the issue is still on the ALSA driver side or on the PW/PA config. I'm not a kernel programmer and don't know much about ALSA and PW, so any pointer here is welcome.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/197
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/197.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
