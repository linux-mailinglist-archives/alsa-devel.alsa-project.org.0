Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C9527F07
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25BD41695;
	Mon, 16 May 2022 09:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25BD41695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688021;
	bh=Q17ZwnDcaacuZkurLQFv+0FkT/TZrr/KO63JHCVVVnE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjkCfBt+o3w22A5zW7w0vjaLt+K2fSySanVA06BW1k0swK9+qEp/C89rM99oMxvmv
	 1DWyO/SqjIEVuZ/SENz2L55JgkDL84AGeenwxSFR7+PlOesoEDFE2MmmQEUcLH53O7
	 yk43CI8w89tHDW4T7sFwcGCIHuylQ2LVBJsXkBxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BB1F8012C;
	Mon, 16 May 2022 09:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1D64F8025C; Mon, 16 May 2022 09:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7A082F80171
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 09:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A082F80171
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652687941442915916-webhooks-bot@alsa-project.org>
References: <1652687941442915916-webhooks-bot@alsa-project.org>
Subject: axfer: call of polling system call never return when driver fails to
 queue no period-wakeup event due to the lack of hw IRQ context
Message-Id: <20220516075905.C1D64F8025C@alsa1.perex.cz>
Date: Mon, 16 May 2022 09:59:05 +0200 (CEST)
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
