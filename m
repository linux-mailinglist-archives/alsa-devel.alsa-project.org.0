Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EA547667
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jun 2022 18:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FF618CE;
	Sat, 11 Jun 2022 18:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FF618CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654964566;
	bh=aAJdAsA5taWS9D1G/+QaT24uCPHJLu7iEGi7Yrfyvo4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j04kyx5P/XeGLYwmxeRRcSPvCDAfDrjzYAYjFJarmRQMBQl05i4OpxtpJ93Nvk/Gd
	 7MZ6yG764JQRoJkZvVsgtS/gIqRRzguTBKPK7LCs5H+k7QJK70wy3FstneWOwznVP/
	 KhIrBlz/kz0mFvCT5h5tWI6f1Gm40eYTPuTnDoEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D340F80271;
	Sat, 11 Jun 2022 18:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA7FBF800E5; Sat, 11 Jun 2022 18:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7E71BF800E5
 for <alsa-devel@alsa-project.org>; Sat, 11 Jun 2022 18:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E71BF800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654964502936983109-webhooks-bot@alsa-project.org>
References: <1654964502936983109-webhooks-bot@alsa-project.org>
Subject: 1.2.7 aplay doesn't compile
Message-Id: <20220611162145.EA7FBF800E5@alsa1.perex.cz>
Date: Sat, 11 Jun 2022 18:21:45 +0200 (CEST)
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

alsa-project/alsa-utils issue #153 was opened from LoneFox78:

I'm getting this error:
```
Making all in aplay
make[1]: Entering directory '/mnt/pkg/pkgmk_work/alsa-utils/src/alsa-utils-1.2.7/aplay'
gcc -DHAVE_CONFIG_H -I. -I../include  -I../include   -s -Wl,-s -Wall -O2 -march=native -ftree-vectorize -pipe -MT aplay.o -MD -MP -MF .deps/aplay.Tpo -c -o aplay.o aplay.c
aplay.c:44:10: fatal error: alsa/use-case.h: No such file or directory
   44 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [Makefile:495: aplay.o] Error 1
make[1]: Leaving directory '/mnt/pkg/pkgmk_work/alsa-utils/src/alsa-utils-1.2.7/aplay'
make: *** [Makefile:461: all-recursive] Error 1
```
The configure script already looks for that header, but I guess someone forgot to add the corresponding <code>#ifdef</code>s in this file.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/153
Repository URL: https://github.com/alsa-project/alsa-utils
