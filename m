Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E744011FF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 00:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBEDC17F4;
	Mon,  6 Sep 2021 00:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBEDC17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630882091;
	bh=rmYjYYtAB9Opp7Tswx1ua3XIjw+/PAfHWI/fHyKxp+c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7YwxNW/2NZ2Fj+1IAOpWjMvoYNkTJ1lgYsavX7/icUQh6W3TOo3zIHcXuH0/0UsI
	 CCasab69hxOGeoE0Up4xKLo2+MZaOX7qEbTddUWkeQEcZUD7h5FZ7QPqxWzRHAY5ew
	 yiglBVGvy/OCCmvjJZuU+ks1TRlTpZsezVsva6Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 467E1F800B5;
	Mon,  6 Sep 2021 00:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A344AF80253; Mon,  6 Sep 2021 00:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 73A0CF800D0
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 00:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A0CF800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630882002477185965-webhooks-bot@alsa-project.org>
References: <1630882002477185965-webhooks-bot@alsa-project.org>
Subject: alsa-lib 1.2.5 and 1.2.5.1 fail to build with --enable-static
Message-Id: <20210905224652.A344AF80253@alsa1.perex.cz>
Date: Mon,  6 Sep 2021 00:46:52 +0200 (CEST)
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

alsa-project/alsa-lib issue #177 was opened from pjbroad:

This build successfully:
```
./configure  && make clean && make
```

This fails to build:
```
./configure --enable-shared=no --enable-static=yes && make clean && make

make[1]: Entering directory '/home/paul/el/el-build-scripts/linux-static/libs/alsa-lib-1.2.5.1/aserver'
  CC       aserver.o
  CCLD     aserver
/usr/bin/ld: ../src/.libs/libasound.a(control_symbols.o):(.data.rel+0x8): undefined reference to `_snd_module_control_empty'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:398: aserver] Error 1
make[1]: Leaving directory '/home/paul/el/el-build-scripts/linux-static/libs/alsa-lib-1.2.5.1/aserver'
make: *** [Makefile:405: all-recursive] Error 1
```

Building static worked find for 1.2.4.  Hopefully someone can help resolve this.  Let me know if you want me to try anything.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/177
Repository URL: https://github.com/alsa-project/alsa-lib
