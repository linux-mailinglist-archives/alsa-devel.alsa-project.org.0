Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E743A4641
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 18:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0145918C6;
	Fri, 11 Jun 2021 18:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0145918C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623428144;
	bh=/zUvRIWbgqk9erTQ2rYolQG6iWyzGxIu0NsO58sSLN4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDjaeTcFB9Tsv6HvQCTTAXZLTYvFTbuyal+6d1IOcZnvCg36ZPhOwyWd71oFUlVk+
	 LNtG83upoIIC2Gg8KBqGYWz7IRMdRW74Os9QPCfkrhYoxe67tkYXP1+XCp++fwFVd9
	 /t1cm9T9ZBdR1e/4ZPpESD5r9wlUwOsHS1dYX2nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F08F80276;
	Fri, 11 Jun 2021 18:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C667F8026C; Fri, 11 Jun 2021 18:14:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 366D4F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 18:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 366D4F800FC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623428046352953911-webhooks-bot@alsa-project.org>
References: <1623428046352953911-webhooks-bot@alsa-project.org>
Subject: Config parsing of pcm_rate broken since 1.1.7 (at least for a52 pcm
 plugin)
Message-Id: <20210611161415.3C667F8026C@alsa1.perex.cz>
Date: Fri, 11 Jun 2021 18:14:15 +0200 (CEST)
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

alsa-project/alsa-lib issue #154 was opened from quequotion:

As noted [in the mailing list](https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/159426.html) back in 2019, config parsing (for alsa-plugins a52 pcm at least) has been broken since alsa-lib 1.1.7.

As far as I know this was never bisected to a single commit in either alsa-lib or alsa-plugins.

Looking at the mailing list discussion, it occurs to me that it may have given the impression that the config parser was broken when using [a patch that ports alsa-plugins to libswresample](https://git.harting.dev/anonfunc/alsa-plugins/commit/9cdbbb9874757b6f8fda7fb4ac2e3fc59da65946).

Config parsing is broken *regardless* of that patch.

@IdleGandalf worked around this by applying a patch to alsa-lib, in [src/pcm/pcm_rate.c](https://git.harting.dev/anonfunc/alsa-lib/commit/646bc80a63b0220300678a38e0c26a9a13af6fc0), but never got a response if this was an appropriate method to resolve the issue.

Should this be fixed in alsa-lib or in alsa-plugins?

Note: above links are to mirrors of the original patches, also in a repository owned by @IdleGandalf as far as I can tell. The links in the mailing list discussion are now 404.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/154
Repository URL: https://github.com/alsa-project/alsa-lib
