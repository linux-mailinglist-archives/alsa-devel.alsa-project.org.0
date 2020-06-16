Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E01FBD73
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 20:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E731674;
	Tue, 16 Jun 2020 20:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E731674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592330456;
	bh=xLW/ZPe8/KSEyrZEORA3/XLVhEA73ZUXcukUnWuwTc0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bM5gKxJD+IyNdGrX+9LxOB9EebsgSDwR9WhTrmyFsx3bdtDEoFJfjUWGkGhsA2T84
	 //XdaV4GSXKzfmCKhdo+IhmfaT0NnZ4B0R7Gj0R8hA95HcZTdwlKLh3ZWld6Og6nEo
	 YSS1GtXsl8oWddFVGV8Y6PpFv90pc4NJmHPwqnXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D585F80217;
	Tue, 16 Jun 2020 19:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD7ECF8022B; Tue, 16 Jun 2020 19:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BF0BFF800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 19:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0BFF800EF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592330346106980085-webhooks-bot@alsa-project.org>
References: <1592330346106980085-webhooks-bot@alsa-project.org>
Subject: pcm: dmic: assembly: add x32 support.
Message-Id: <20200616175913.DD7ECF8022B@alsa1.perex.cz>
Date: Tue, 16 Jun 2020 19:59:13 +0200 (CEST)
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

alsa-project/alsa-lib pull request #61 was opened from hvdijk:

x32 is the x86_64 ABI that uses 32-bit pointers, so requires loading addresses into edi/esi/ebx rather than rdi/rsi/rbx.

Note that instructions such as movl %eax, (%rdi) do not require updating, as loading an address into %edi zeroes the high bits, causing the full %rdi register to hold a valid address.

Signed-off-by: Harald van Dijk <harald@gigawatt.nl>

Without this, even aplay segfaults when building with `-mx32`.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/61
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/61.patch
Repository URL: https://github.com/alsa-project/alsa-lib
