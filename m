Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A46427D82
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Oct 2021 23:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF731684;
	Sat,  9 Oct 2021 23:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF731684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633813653;
	bh=2nk35H08mPZU8n9sOGujBsULCVwCkK4psbzXzNcY0kQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlYHE1TV5wChN+Hr5niDIJbkk21fkNoDNpYnxVUdFOjIlUP8noPW1UVV+PPIFl6V+
	 Cf2F4bnCBigdjUbzwWCbS5WtSBhbUeH5CkzFvEbV73CjDGD2tH5Uay+cO5S6g1ptuy
	 bdukMdRMSeV5Cf46kmRvnrt8ZEznyAB51OUuOJak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4843F80124;
	Sat,  9 Oct 2021 23:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83C94F8027D; Sat,  9 Oct 2021 23:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 87E03F800EB
 for <alsa-devel@alsa-project.org>; Sat,  9 Oct 2021 23:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E03F800EB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633813564135840893-webhooks-bot@alsa-project.org>
References: <1633813564135840893-webhooks-bot@alsa-project.org>
Subject: Tenacity throws error when running "build/bin/Debug/tenacity" to run
 it
Message-Id: <20211009210614.83C94F8027D@alsa1.perex.cz>
Date: Sat,  9 Oct 2021 23:06:14 +0200 (CEST)
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

alsa-project/alsa-lib issue #184 was edited from User10987654321:

context: https://github.com/tenacityteam/tenacity/issues/649

`cat /proc/asound/version` output: Advanced Linux Sound Architecture Driver Version k5.10.0-kali9-amd64




When going through the steps in https://github.com/tenacityteam/tenacity/blob/master/BUILDING.md, I eventually get to a point where I run the command in the issue title which brings up the tenacity logo on screen and then provides the following errors in the terminal:

ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2660:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
ALSA lib pcm_route.c:877:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:877:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:877:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:877:(find_matching_chmap) Found no matching channel map
connect(2) call to /dev/shm/jack-1000/default/jack_0 failed (err=No such file or directory)
attempt to connect to server failed
connect(2) call to /dev/shm/jack-1000/default/jack_0 failed (err=No such file or directory)
attempt to connect to server failed
ALSA lib pcm_oss.c:397:(_snd_pcm_oss_open) Cannot open device /dev/dsp
ALSA lib pcm_oss.c:397:(_snd_pcm_oss_open) Cannot open device /dev/dsp
ALSA lib pcm_a52.c:835:(_snd_pcm_a52_open) a52 is only for playback
zsh: segmentation fault  ./tenacity/build/bin/Debug/tenacity


How can I mitigate this to use tenacity successfully?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/184
Repository URL: https://github.com/alsa-project/alsa-lib
