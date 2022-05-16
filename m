Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC0527F18
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F3F41696;
	Mon, 16 May 2022 10:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F3F41696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688091;
	bh=Q17ZwnDcaacuZkurLQFv+0FkT/TZrr/KO63JHCVVVnE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2W6Wa9LeRykF218ZjgvO5KAMSnFBz6bCVxg4VpWs+Gf7GXH41kVykKN+MukiBvvF
	 hnPbwk10Q1WkzdJSyNWErsPsygVhMh8ppPEWsvS3bczIl4J5lVGoapQk2eNJDm2Vga
	 7oWq4jzVr6bzLUmN6FvHMEPyQ/4+kdYh/7EbGhCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91D9F80171;
	Mon, 16 May 2022 10:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FEFFF800F8; Mon, 16 May 2022 10:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D8D4F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D8D4F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652688028986454964-webhooks-bot@alsa-project.org>
References: <1652688028986454964-webhooks-bot@alsa-project.org>
Subject: snd_pcm_wait_nocheck - use more finer timeout for the the poll wait
Message-Id: <20220516080031.6FEFFF800F8@alsa1.perex.cz>
Date: Mon, 16 May 2022 10:00:31 +0200 (CEST)
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

alsa-project/alsa-lib issue #228 was edited from takaswie:

Axfer calls polling system call(i.e. poll(2), epoll(7), select(7)) without explicit timeout when running for IRQ-based scheduling model. In a case that driver achieves to control sound hardware for periodical hardware IRQ, the call can return due to any event queued by the driver in hardware IRQ context. However, in a case that driver fails to control it, the call cannot return.

Especially, this situation easily occurs when developers work to support hardware newly. It's better to care for the situation.

How to reproduce:
1. prepare sound hardware which driver fail to control for periodical hardware IRQ.
2. execute axfer for the driver/hardware with options to:
  * use IRQ-based scheduling model: `--sched-model=irq`
  * use polling system call: without `--test-nowait`
3. the running process blocks as a call of polling system call (defaultly poll(2) by snd_pcm_wait())

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/228
Repository URL: https://github.com/alsa-project/alsa-lib
