Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC011C2A94
	for <lists+alsa-devel@lfdr.de>; Sun,  3 May 2020 09:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A83016C9;
	Sun,  3 May 2020 09:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A83016C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588491618;
	bh=6s5A76BTLuqbVeAubUYmvvxJI1NF4P2flFoLKvafZE8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwtY+bYzxgTA/nXw9sZwoqjhuc+xtvi/i8H8g4em4tQdt61WuoD6sQOj5RoyJ7mkc
	 jNHDjpXF1cUS7/JIkrMf1JBttUErdRiGKnyXYWsw31sMODkonYA/7KmZqyUIye/W6F
	 HMvZhIKY+0T2A5ZXmcIwZSzQGVuAyP/H7+Hkg/50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 895A5F8015F;
	Sun,  3 May 2020 09:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0259DF8015F; Sun,  3 May 2020 09:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F2C29F800EE
 for <alsa-devel@alsa-project.org>; Sun,  3 May 2020 09:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C29F800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588491501909075022-webhooks-bot@alsa-project.org>
References: <1588491501909075022-webhooks-bot@alsa-project.org>
Subject: helem (MIXER, 'Master Playback Volume', 0, 1,
 0) appears twice or more cannot load mixer controls: Invalid argument
Message-Id: <20200503073830.0259DF8015F@alsa1.perex.cz>
Date: Sun,  3 May 2020 09:38:30 +0200 (CEST)
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

alsa-project/alsa-lib issue #47 was opened from igrekster:

I have a PCIE Asus Sound Card  (Asus Xonar AE) that uses USB interface:
```
Bus 003 Device 002: ID 0b05:180f ASUSTek Computer, Inc.
```
It's been working fine on earlier versions of  kernel/alsa-lib but at some point the volume control stopped working (the playback still works fine):

```
$ alsamixer -c 1
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.2-r1/work/alsa-lib-1.2.2/src/mixer/simple_none.c:1544:(simple_add1) helem (MIXER,'Master Playback Volume',0,1,0) appears twice or more
cannot load mixer controls: Invalid argument
```
This is on kernel 5.4.37/alsa 1.2.2. Unfortunately I cannot downgrade to the point when it was working to pinpoint the issue. I tried kernels 5.3.11 and alsa 1.1.8.
I've tried building the latest alsa-lib, and it is still showing the error.
I'm happy to try patches to alsa or kernel modules to help debug this.

A few more details:

[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/4569764/alsa-info.txt)
[proc-asound.txt](https://github.com/alsa-project/alsa-lib/files/4569766/proc-asound.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/47
Repository URL: https://github.com/alsa-project/alsa-lib
