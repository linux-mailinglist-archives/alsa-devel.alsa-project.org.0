Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1538B922
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 23:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002F016BC;
	Thu, 20 May 2021 23:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002F016BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621547154;
	bh=S8RxCy9+2GZqhvuoC5xp/6j+XqNo78Z2oaDUSOP8hEU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nq9UosMboXpYVAb3c7YI49mN1bO0DCgiZo/rs9b7USQOkduZYNz2GAR4RT2zrRgpe
	 KUXilSGVN1T9tqmSsLNaeCSSO/GMM+b52jSHc6Ae8awZsqbOmFQsWUmgcitTp30Lxy
	 d0B6Zq0ABi/yhqZQOeVAL61tkVI/+rCPkxpvC9tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558BEF800C1;
	Thu, 20 May 2021 23:44:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E81F80217; Thu, 20 May 2021 23:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D5416F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 23:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5416F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1621547055768846035-webhooks-bot@alsa-project.org>
References: <1621547055768846035-webhooks-bot@alsa-project.org>
Subject: Broken out-of-tree build
Message-Id: <20210520214422.28E81F80217@alsa1.perex.cz>
Date: Thu, 20 May 2021 23:44:22 +0200 (CEST)
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

alsa-project/alsa-lib issue #136 was opened from concatime:

Hi.
Due to missing headers, I cannot build alsa-lib if the build directory is outside of the source tree.
```
make[2]: Entering directory '/home/iemaghni/Code/tmp/build/src/ucm'
  CC       utils.lo
In file included from ../../../alsa-lib/src/ucm/ucm_local.h:41,
                 from ../../../alsa-lib/src/ucm/utils.c:33:
../../../alsa-lib/include/use-case.h:45:10: fatal error: alsa/asoundlib.h: No such file or directory
   45 | #include <alsa/asoundlib.h>
      |          ^~~~~~~~~~~~~~~~~~
```
Step to reproduce:
```sh
git clone https://github.com/alsa-project/alsa-lib.git
mkdir build
cd alsa-lib
libtoolize --force --copy --automake
aclocal
autoheader
automake --foreign --copy --add-missing
autoconf
cd ../build
../alsa-lib/configure
make
```
Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/136
Repository URL: https://github.com/alsa-project/alsa-lib
