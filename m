Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9014A14
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58BDA18A4;
	Mon,  6 May 2019 14:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58BDA18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557146689;
	bh=JmbgrmnlV9ECFvsdbWAjzxftayaeN/VwTuboe+j3Wkk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yd1fcJr4T1SOs+i6MZTfmsCtt9dSj6vPVVwyxcrUp/G8zTSwIdBYx4ePX+gGxkKS0
	 HsfXlDZWx9O6fl7hFwMt3XXi+NbWM2NXYWFxlfT1P/WsxjUNFxXKVS87U4KCANaz9N
	 QmeVm/ae5UrGWpirpN5EJK7xIhBoQQys5285i8hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 835E3F896E6;
	Mon,  6 May 2019 14:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D65C6F896F0; Mon,  6 May 2019 14:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EB91F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB91F89673
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1557146578509116888-webhooks-bot@alsa-project.org>
References: <1557146578509116888-webhooks-bot@alsa-project.org>
Message-Id: <20190506124301.D65C6F896F0@alsa1.perex.cz>
Date: Mon,  6 May 2019 14:43:01 +0200 (CEST)
Subject: [alsa-devel] 1.1.8: test suite is failing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #16 was opened from kloczek:

<pre>+ /usr/bin/make -O -j4 check
Making check in include
Making check in alsactl
Making check in init
make[2]: Nothing to be done for &apos;check&apos;.
make[2]: Nothing to be done for &apos;check-am&apos;.
Making check in utils
make[1]: Nothing to be done for &apos;check&apos;.
Making check in m4
make[1]: Nothing to be done for &apos;check&apos;.
Making check in po
make[1]: Nothing to be done for &apos;check&apos;.
Making check in alsa-info
make[1]: Nothing to be done for &apos;check&apos;.
Making check in alsamixer
make[1]: Nothing to be done for &apos;check&apos;.
Making check in amixer
make[1]: Nothing to be done for &apos;check&apos;.
Making check in amidi
make[1]: Nothing to be done for &apos;check&apos;.
Making check in aplay
make[1]: Nothing to be done for &apos;check&apos;.
Making check in iecset
make[1]: Nothing to be done for &apos;check&apos;.
Making check in speaker-test
Making check in samples
make[2]: Nothing to be done for &apos;check&apos;.
make[2]: Nothing to be done for &apos;check-am&apos;.
Making check in axfer
Making check in test
/usr/bin/make  container-test mapper-test
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o container-au.o `test -f &apos;../container-au.c&apos; || echo &apos;./&apos;`../container-au.c
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o container-riff-wave.o `test -f &apos;../container-riff-wave.c&apos; || echo &apos;./&apos;`../container-riff-wave.c
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o generator.o generator.c
generator.c:9:10: fatal error: generator.h: No such file or directory
    9 | #include &quot;generator.h&quot;
      |          ^~~~~~~~~~~~~
compilation terminated.
make[3]: *** [Makefile:640: generator.o] Error 1
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[3]: *** Waiting for unfinished jobs....
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o container.o `test -f &apos;../container.c&apos; || echo &apos;./&apos;`../container.c
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o container-voc.o `test -f &apos;../container-voc.c&apos; || echo &apos;./&apos;`../container-voc.c
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[3]: Entering directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
gcc -DHAVE_CONFIG_H -I. -I../../include     -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -flto -Os -c -o container-raw.o `test -f &apos;../container-raw.c&apos; || echo &apos;./&apos;`../container-raw.c
make[3]: Leaving directory &apos;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.8/axfer/test&apos;
make[2]: *** [Makefile:1017: check-am] Error 2
make[1]: *** [Makefile:650: check-recursive] Error 1
make: *** [Makefile:428: check-recursive] Error 1
error: Bad exit status from /var/tmp/rpm-tmp.VI5lrR (%check)
</pre>

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/16
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
