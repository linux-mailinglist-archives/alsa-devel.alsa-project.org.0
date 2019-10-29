Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD63E7F2A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 05:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518A221C4;
	Tue, 29 Oct 2019 05:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518A221C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572323054;
	bh=aju42JJ0DkBkLl37QMsAsZK6fhr1fBf4EmjmWzjzxWY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TR9Ve5l4QjgkzewOJi40X2bp3EWTzL8qGA+cy0HJgk3yRhxnoVl/Mr8hwyxeBcJAe
	 sCDRXuhVXexCYvBqcM9RhY7mEy7vwnw66uIeR3h5YmTTyiCm0TRmkZBuevKB7EX2KJ
	 Fddiq/mYpfxX8IzEuKKACn029flFQzv+pmNagFxE=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62751F8036C;
	Tue, 29 Oct 2019 05:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9036CF80269; Tue, 29 Oct 2019 05:22:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DF47EF80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 05:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF47EF80269
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1572322937155829906-webhooks-bot@alsa-project.org>
References: <1572322937155829906-webhooks-bot@alsa-project.org>
Message-Id: <20191029042224.9036CF80269@alsa1.perex.cz>
Date: Tue, 29 Oct 2019 05:22:24 +0100 (CET)
Subject: [alsa-devel] axfer: call of polling system call never return when
 driver fails to queue no period-wakeup event due to the lack of hw IRQ
 context
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

alsa-project/alsa-utils issue #30 was edited from takaswie:

Axfer calls polling system call(i.e. poll(2), epoll(7), select(7)) without explicit timeout when running for IRQ-based scheduling model. In a case that driver achieves to control sound hardware for periodical hardware IRQ, the call can return due to any event queued by the driver in hardware IRQ context. However, in a case that driver fails to control it, the call cannot return.

Especially, this situation easily occurs when developers work to support hardware newly. It's better to care for the situation.

How to reproduce:
1. prepare sound hardware which driver fail to control for periodical hardware IRQ.
2. execute axfer for the driver/hardware with options to:
  * use IRQ-based scheduling model: `--sched-model=irq`
  * use polling system call: without `--test-nowait`
3. the running process blocks as a call of polling system call (defaultly poll(2) by snd_pcm_wait())

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/30
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
