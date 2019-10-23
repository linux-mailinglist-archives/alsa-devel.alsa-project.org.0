Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F9E21C9
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 19:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E70165F;
	Wed, 23 Oct 2019 19:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E70165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571851947;
	bh=wWxI0xwO4MaCwQUeXmATFYM+z4chyKBYpWQD9YUY7g8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMvvclzuwwXNYcnAxzYbMPDoVNKyO2ayV4uIcmfBuzXe2z+bANNZqNiYol11c9Beh
	 L9KtHw0vUknUHA5oVDbULlwabaKJzmgLI8kmzqderHE51NzGpMREewLb78EeF/GM8w
	 beY6Gy4BsDyFBCAt+dYGAbZVSasIbLh9VeKh3M1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01EABF8036F;
	Wed, 23 Oct 2019 19:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B8BF80368; Wed, 23 Oct 2019 19:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3E46DF802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 19:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E46DF802DF
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1571851836428162098-webhooks-bot@alsa-project.org>
References: <1571851836428162098-webhooks-bot@alsa-project.org>
Message-Id: <20191023173041.38B8BF80368@alsa1.perex.cz>
Date: Wed, 23 Oct 2019 19:30:41 +0200 (CEST)
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

alsa-project/alsa-utils pull request #29 was opened from E5ten:

- remove all bashisms and change shebang to #!/bin/sh
- replace use of which with command -v for portability
- remove awk dependency
- general cosmetic consistency:
    - indentation
    - always put then or done on the same line as if, for, or while
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
