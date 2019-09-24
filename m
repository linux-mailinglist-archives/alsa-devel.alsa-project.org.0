Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD50BD37C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 22:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D606516B2;
	Tue, 24 Sep 2019 22:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D606516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569356576;
	bh=oEdL8lC1wKfdX/YH4nBfKthp8XoS/4aquBgwtpJn2p0=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zkv/ysJkGtL2RNE+tzU5MKPpPXsf2Pj1jgS3QiAxvvfLXtTeix76XFVQW2fIQN77k
	 Qa9t74jnoHrNL7QmZSL2Us+6t202RL3HghTW7HhalwvSCTBU/LEGahaBZeaZ85Yo8F
	 vV4tEOZsNf/vdVU9VKMJWjceY8ElYw5RmbLJ/LWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 721B0F803F4;
	Tue, 24 Sep 2019 22:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06891F8045F; Tue, 24 Sep 2019 22:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_25,SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AEDECF800B4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 22:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEDECF800B4
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1569356467848001957-webhooks-bot@alsa-project.org>
References: <1569356467848001957-webhooks-bot@alsa-project.org>
Message-Id: <20190924202111.06891F8045F@alsa1.perex.cz>
Date: Tue, 24 Sep 2019 22:21:11 +0200 (CEST)
Subject: [alsa-devel] Making alsamixer configurable,
	adding mouse support + minor fixes
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

alsa-project/alsa-utils pull request #26 was opened from braph:

Hello,

I'm using the alsamixer, but I am missing mouse support and the ability to configure it.
I implemented those things for myself now, maybe it would also be useful for others.

There are some commits that would even fit in the original alsamixer code without my rather heavy modifications, these are:

6eb0bc8f0848567f302e94ea5ee3a6d7c6966e65: _alsamixer: remove redundant sprintf() calls_
bef5b723a43f310ba73bcaa52f3da74ef5e08dde: _alsamixer: use mvwhline/mvwvline for drawing lines_
ae0604c93aa4bacbb678eb8ec832ad9e17c8b56a: _alsamixer: device_name.c: recognize DEL (ASCII 127) as backspace_
And maybe
485f3b0da1ffead2f88cffd9f2203516000415b5: _alsamixer: fix window_size_changed()_

Regards,

Benjamin

Request URL   : https://github.com/alsa-project/alsa-utils/pull/26
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/26.patch
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
