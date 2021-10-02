Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938441F970
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 04:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99531703;
	Sat,  2 Oct 2021 04:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99531703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633143016;
	bh=GbBsnq29YNcF5ddwc/oZRjltlWqvyb0WBG4rCUaXKbg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FeqpMkapo//hHYd4YRcBDgF0fFUmsOVYbkDueOKSGpvpEjkslwY3QmSOxgOsu0mM1
	 LkajSeK/Wh1+eagrug2J6gjJRGet/gtKirXQgAmrFhXp9a3Te3gCEIohWsGrDLXIuP
	 r5ov8oDjAyKTdwTSu4YEhEifcgI8Xc21M9q1+XFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B83AF800EF;
	Sat,  2 Oct 2021 04:49:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81A3AF804BC; Sat,  2 Oct 2021 04:48:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4A8A9F800D8
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 04:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A8A9F800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633142927797873020-webhooks-bot@alsa-project.org>
References: <1633142927797873020-webhooks-bot@alsa-project.org>
Subject: mpv segfaults in a52 plugin
Message-Id: <20211002024856.81A3AF804BC@alsa1.perex.cz>
Date: Sat,  2 Oct 2021 04:48:56 +0200 (CEST)
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

alsa-project/alsa-plugins issue #35 was opened from ykurlaev:

When using mpv with the option `audio-device=alsa/<a52 device>` it gets a segfault on this line https://github.com/alsa-project/alsa-plugins/blob/da157e978d73f1947bb77637c324e19d003366d4/a52/pcm_a52.c#L566 because it calls `dump` before `prepare` has been called and `rec->avctx` is NULL.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/35
Repository URL: https://github.com/alsa-project/alsa-plugins
