Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAC539766
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 21:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51A51918;
	Tue, 31 May 2022 21:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51A51918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654026883;
	bh=UkVjJT9g+EEY7zDEmLIPYYxQNQbqxID+oz97QHWFNvE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KW1f5Rdm98usjg66qTc/v2MNYnlWIjMYWYcASJChqHG2ZivIk8nEaTnRK1AOfkvqt
	 IYtM75Zbg8jgCBGJtl8DGuz9fLPk8kAcDu7oxBbmom1QTDVjyOzMg1HqM/2LEqOrnh
	 3mZySVJEIh+qynY4lCS5/6T1S8qOpHopuv2qkbvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB20F8051B;
	Tue, 31 May 2022 21:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6746FF80516; Tue, 31 May 2022 21:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2A7C4F8019B
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 21:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A7C4F8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654026816646328926-webhooks-bot@alsa-project.org>
References: <1654026816646328926-webhooks-bot@alsa-project.org>
Subject: ucm2: rk3399-gru-sound: Add missing symlink from conf.d tree
Message-Id: <20220531195343.6746FF80516@alsa1.perex.cz>
Date: Tue, 31 May 2022 21:53:43 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #162 was opened from alpernebbi:

Since V2Module lookup was disabled my rk3399-gru-kevin chromebook can't find the UCM it's supposed to use. This adds a `conf.d/rk3399-gru-soun/rk3399-gru-soun.conf` symlink for it. The name is not a typo:

    $ cat /proc/asound/cards
     0 [rk3399grusound ]: rk3399-gru-soun - rk3399-gru-sound
                          Unknown-UnknownProduct-

    $ strace -e trace=file pulseaudio 2>&1 | grep -i ucm2
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/ucm.conf", R_OK) = 0
    openat(AT_FDCWD, "/usr/share/alsa/ucm2/ucm.conf", O_RDONLY) = 16
    openat(AT_FDCWD, "/usr/share/alsa/ucm2/lib/generic.conf", O_RDONLY) = 16
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/conf.d/rk3399-gru-soun/Unknown-UnknownProduct-.conf", R_OK) = -1 ENOENT (No such file or directory)
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/conf.d/rk3399-gru-soun/rk3399-gru-soun.conf", R_OK) = -1 ENOENT (No such file or directory)
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/ucm.conf", R_OK) = 0
    openat(AT_FDCWD, "/usr/share/alsa/ucm2/ucm.conf", O_RDONLY) = 16
    openat(AT_FDCWD, "/usr/share/alsa/ucm2/lib/generic.conf", O_RDONLY) = 16
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/conf.d/rk3399-gru-soun/Unknown-UnknownProduct-.conf", R_OK) = -1 ENOENT (No such file or directory)
    faccessat(AT_FDCWD, "/usr/share/alsa/ucm2/conf.d/rk3399-gru-soun/rk3399-gru-soun.conf", R_OK) = -1 ENOENT (No such file or directory)

(Ignore the `Unknown-UnknownProduct-`, that's because I'm using a custom unfinished U-Boot build. For more info there's an [older alsa-info output](https://alsa-project.org/db/?f=9b4102975fa9c0f109af6ad687c856c620d76909) I had uploaded)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/162
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/162.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
