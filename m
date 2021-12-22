Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825547CE97
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 10:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D03E17D5;
	Wed, 22 Dec 2021 10:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D03E17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640163734;
	bh=GpSdyWPeBbT3qd5HqDDVtpcYa9/jUnur4xlafz6PUKs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyGqXEEfi3CJbh6DsAgLPCt5Dc/XZ9151otUwUMmpK9ibJ2ZHBN8kD5ChUjK4L32Q
	 mgE2QmnR8fzB+4oYGwk77mIhuiGHZgmRdUIM1ZtKcpDW0Yw7/HKZx+YpAlPMZwT+lg
	 Ip5kb0WhjYehw2s2lhbZI5TECyOlmwtS2NBfG2mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DD7F80111;
	Wed, 22 Dec 2021 10:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED0C1F80109; Wed, 22 Dec 2021 10:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D857F80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 10:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D857F80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640163660026597977-webhooks-bot@alsa-project.org>
References: <1640163660026597977-webhooks-bot@alsa-project.org>
Subject: compile error: undefined reference to `snd_ctl_elem_id_compare_set'
Message-Id: <20211222090105.ED0C1F80109@alsa1.perex.cz>
Date: Wed, 22 Dec 2021 10:01:05 +0100 (CET)
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

alsa-project/alsa-utils issue #130 was opened from steeley:

Building on raspberry pi  buster (Linux 5.10.76-v7l. 32 bit) using theses commands:

`cd alsa-utils/
git checkout v1.2.6
autoreconf -i
./configure --prefix=/usr/local
make -j4`

I get this error:

`gcc -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKFILE=\"/var/lock/asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -g -O2   -o alsactl alsactl-alsactl.o alsactl-state.o alsactl-lock.o alsactl-utils.o alsactl-init_parse.o alsactl-init_ucm.o alsactl-daemon.o alsactl-monitor.o alsactl-clean.o  -lasound -lm -ldl -lpthread
/usr/bin/ld: alsactl-clean.o: in function `clean_one_control':
/home/pi/alsa-utils/alsactl/clean.c:55: undefined reference to `snd_ctl_elem_id_compare_set'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:528: alsactl] Error 1
make[2]: Leaving directory '/home/pi/alsa-utils/alsactl'
make[1]: *** [Makefile:827: all-recursive] Error 1
make[1]: Leaving directory '/home/pi/alsa-utils/alsactl'
make: *** [Makefile:429: all-recursive] Error 1`

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/130
Repository URL: https://github.com/alsa-project/alsa-utils
