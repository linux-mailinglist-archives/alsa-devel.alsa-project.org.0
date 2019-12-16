Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132ED121C3A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 22:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9D3165E;
	Mon, 16 Dec 2019 22:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9D3165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576533466;
	bh=MmYYPyVqq+IPCViV4czVcpLY4TwbdlBqepVfK9Y16sw=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PW40QZhrke85PDknCtppTSlbU1oyYxOJwVKq8s0xk8qE4ZJblSCnkP91Tuqsx3H7y
	 u3YW32FA9LLynhrWisqHBSyfwveWByUth305ME1BG8eqGUf0DKoGrIxJ9a+HIyCizC
	 lO8xL4ESMZOsA3cxzVY+H81Y7xQq7iDiQG6btpcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45E32F80255;
	Mon, 16 Dec 2019 22:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C60BFF80255; Mon, 16 Dec 2019 22:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 76B35F800AD
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 22:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B35F800AD
MIME-Version: 1.0
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576533357364182949-webhooks-bot@alsa-project.org>
References: <1576533357364182949-webhooks-bot@alsa-project.org>
Message-Id: <20191216215601.C60BFF80255@alsa1.perex.cz>
Date: Mon, 16 Dec 2019 22:56:01 +0100 (CET)
Subject: [alsa-devel] alsa-info: lots of mostly syntactic changes
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

alsa-project/alsa-utils pull request #29 was edited from E5ten:

- remove all bashisms and change shebang to #!/bin/sh
- replace use of which with command -v for portability
- remove awk dependency
- general cosmetic consistency:
    - indentation
    - always put then or do on the same line as if, for, or while
- quote much more, especially when the variable refers to a file
- replace many uses of >> $FILE with command grouping and single
  redirects of the command groups
- simplify text processing pipelines, mostly by turning them into
  a single sed command

Request URL   : https://github.com/alsa-project/alsa-utils/pull/29
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/29.patch
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
