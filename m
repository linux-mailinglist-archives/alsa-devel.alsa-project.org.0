Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE628B06D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DF55167F;
	Mon, 12 Oct 2020 10:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DF55167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602491966;
	bh=pisuaYDy/Gn02amLmf7Xbb3GoeCg2iX6ywsGSmVO8hQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOewD5kDYze80wNvPB2RAX0jluh/76tLn/lrpN5vMwa43GEtVCioNIS61/6duEYuq
	 1MeL9uxLDPWIdghzZp1NZBODxj4/w9oQB1ZzHlvaS6PYx5ME9wJ09RuBHsI73otUnz
	 C7oP7RRFopy8ldACqaBQNgsK3M6y8npT6y696Ofk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36DFF80141;
	Mon, 12 Oct 2020 10:37:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F7EF80217; Mon, 12 Oct 2020 10:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D50EEF800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D50EEF800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1602491860368252039-webhooks-bot@alsa-project.org>
References: <1602491860368252039-webhooks-bot@alsa-project.org>
Subject: Can't aplay/arecord simultaneously inside and outside of linux
 container
Message-Id: <20201012083744.66F7EF80217@alsa1.perex.cz>
Date: Mon, 12 Oct 2020 10:37:44 +0200 (CEST)
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

alsa-project/alsa-utils issue #62 was opened from fearless-fan:

Hi,
I run into a problem that can't aplay/arecord simultaneously inside and outside of linux container. 

Steps to reproduce:
1. go into container's shell and exec a record command. 

~ # lxc-attach -n Default -P /tmp/run/lxc
/ # arecord -d 60 /tmp/test.wav &
/ # Recording WAVE '/tmp/test.wav' : Unsigned 8 bit, Rate 8000 Hz, Mono
/ # ps
PID   USER     TIME   COMMAND
      1 root       0:00 /sbin/init
      3 root       0:00 /bin/sh
1519 root       0:00 arecord -d 60 /tmp/test.wav
1520 root       0:00 /bin/ash
1521 root       0:00 ps

2. exit and exec another record command outside of container

/ # exit
~ # arecord -d 60 /tmp/test.wav &
~ # ALSA lib pcm_dsnoop.c:641:(snd_pcm_dsnoop_open) unable to open slave
arecord: main:830: audio open error: Device or resource busy

[1]+  Done(1)                    arecord -d 60 /tmp/test.wav

3. playback has same problem as below

ALSA lib pcm_dmix.c:1089:(snd_pcm_dmix_open) unable to open slave
aplay: main:830: audio open error: Device or resource busy

Expect:
It should be allowed to play/record simultaneously inside and outside of linux container.

Here's my asound.conf:

~ # cat etc/asound.conf
pcm.asymed {
    type asym
    playback.pcm "dmix:0,0"
    capture.pcm "dsnoop:0,0"
}

pcm.!default {
    type plug
    slave.pcm "asymed"
}

ctl.!default {
        type hw
        card 0
}

Is there anyone has experience of how to address it? Thank you.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/62
Repository URL: https://github.com/alsa-project/alsa-utils
