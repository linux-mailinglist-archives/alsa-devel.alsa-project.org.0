Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47515533
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 23:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D153A18E8;
	Mon,  6 May 2019 23:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D153A18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557176577;
	bh=UDgV/ffBMqnmHXUjgU4buh9O96rVCaUK3Bsjc3pvRyU=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHHlzupr4kq7LH6QxCLQlI7F3eVkwSs8T9K0sBGHohTMAxbCLhTJbVIKk49SwqW4m
	 uPnr1u4clnHA9Y6LEunsDciMfRe1M75Og6XsfnWnV9uuD5sTBq2XuVt3Y+nzEOkl0W
	 B4b7/0r0OLkH+Eo64BAKiFkBVdZwTAeU5V9Y0lDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DCBFF896E6;
	Mon,  6 May 2019 23:01:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85150F896F0; Mon,  6 May 2019 23:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 64EF5F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 23:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64EF5F80C07
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1557176467691142082-webhooks-bot@alsa-project.org>
References: <1557176467691142082-webhooks-bot@alsa-project.org>
Message-Id: <20190506210110.85150F896F0@alsa1.perex.cz>
Date: Mon,  6 May 2019 23:01:10 +0200 (CEST)
Subject: [alsa-devel] alsa-utils: axfer/test: fix compiler warnings due to
 uninitialized return value
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

alsa-project/alsa-utils pull request #18 was opened from takaswie:

Hi,

One of test programs for axfer internals has bugs to let compiler generate warnings due to uninitialized return value. This patchset fixes them.

```
Takashi Sakamoto (2):
  axfer/test: fix uninitialized warning
  axfer/test: fix uninitialized warning

 axfer/test/mapper-test.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/18
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/18.patch
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
