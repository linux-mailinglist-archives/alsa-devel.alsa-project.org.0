Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD31ABEB1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 13:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE121660;
	Thu, 16 Apr 2020 13:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE121660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587034901;
	bh=7s9F/XNsbGsOimewojKrYJ1aFHWQOlL+e7GqYuLDXhE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpaUcJ/+aunPKt8wtucBmKi4sqPM+vY8+sgOpnxSN5lNnQ/SbL7aSR8JvoIol5tTk
	 /AFJO9Pnfi+RN4CL5DINwgDmCppQ7CcNxTmcbhPkpRaVaFv51bCnxiNeEuxpBkIO+K
	 vTMUvuSt2GR8Ge0Z7FSKsz3f7J9ORIVXxL5rSS/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C297F8013D;
	Thu, 16 Apr 2020 13:00:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88DD6F8014E; Thu, 16 Apr 2020 12:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0E708F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 12:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E708F8012E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587034793425049067-webhooks-bot@alsa-project.org>
References: <1587034793425049067-webhooks-bot@alsa-project.org>
Subject: alsactl: Wrong line if (!sched_setscheduler(0, SCHED_IDLE,
 &sched_param))
Message-Id: <20200416105957.88DD6F8014E@alsa1.perex.cz>
Date: Thu, 16 Apr 2020 12:59:57 +0200 (CEST)
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

alsa-project/alsa-utils pull request #38 was opened from Oscar65:

As man page says: "If successful, the sched_setparam() function shall return zero."
So the if must be without !

Without update I got this output in the syslog (journalctl):
abr 16 09:25:30 mypc alsactl[1652]: alsactl 1.2.2 daemon started
abr 16 09:25:30 mypc alsactl[1652]: /usr/bin/alsactl: do_nice:165sched_setparam failed: No such file or directory

That I think that is a wrong message. The call to sched_setparam is correct.

This is the output with strace:
getpriority(PRIO_PROCESS, 0)            = 20
setpriority(PRIO_PROCESS, 0, 19)        = 0
getpriority(PRIO_PROCESS, 0)            = 1
sched_getparam(0, [0])                  = 0
sched_setscheduler(0, SCHED_IDLE, [0])  = 0
write(2, "/usr/bin/alsactl: do_nice:165: ", 31/usr/bin/alsactl: do_nice:165: ) = 31
write(2, "sched_setparam failed: No such f"..., 48sched_setparam failed: No such file or directory) = 48
write(2, "\n", 1)                       = 1

Call to sched_setscheduler returns 0, so it means that the call was successful.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/38
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/38.patch
Repository URL: https://github.com/alsa-project/alsa-utils
