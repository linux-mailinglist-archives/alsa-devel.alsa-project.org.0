Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF9138DC2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 10:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E8115E2;
	Mon, 13 Jan 2020 10:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E8115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578907643;
	bh=4UT+3arMoRUl76/eMF3KRvoJcIul+zz3OSRRjyVmzko=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJAIiUWZH+Gj+eKlLWkWPgKlKCoNM8Ws4PfhCHlLh2RMDOElldE5xywYXMrfwKi1C
	 Y6J8UL+8fKmpOWlza4kMoSs1aJ/xlJC0aYif2ocl1RbkQJqqZvau2YNdADf7UF/zXM
	 IQYTQNfJwcfIt5PDVA7J4uyhjUvetkir8M5EFj30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AEFFF801EB;
	Mon, 13 Jan 2020 10:25:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85513F801EB; Mon, 13 Jan 2020 10:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B8B45F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 10:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B45F80122
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578907534036149025-webhooks-bot@alsa-project.org>
References: <1578907534036149025-webhooks-bot@alsa-project.org>
Message-Id: <20200113092537.85513F801EB@alsa1.perex.cz>
Date: Mon, 13 Jan 2020 10:25:37 +0100 (CET)
Subject: [alsa-devel] Quote strings containing [ or ] when saving an alsa
	config
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

alsa-project/alsa-lib pull request #23 was opened from Bertware:

This pull request will fix issue #22.

When saving the configuration for a control, values containing square brackets should be quoted. Please review and test as this code hasn't been tested yet. 

Note: does the '+' character also need quotes? If so, now might be a good time to add it to this list.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/23
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/23.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
