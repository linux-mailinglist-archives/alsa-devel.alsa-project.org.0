Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F52612274
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Oct 2022 13:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCE01630;
	Sat, 29 Oct 2022 13:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCE01630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667043467;
	bh=OOLnL/nFHcH+QaTbHVtCqkJWuPEJ8VXNPUa1qNR1tIA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7k47swzDrGLeZTTLZSfcZOLMawY3ZJ77HAVtlyl3NQCHFypyogF/u4TUyuPfZ1yo
	 YGHDgurSquHYH+TsAjZqRE1cAm2XjY5zXh4y4d4/YHHLSEmZF8ONsQLFGVN/RGsdMw
	 aKz1yPOKigs8Apt18YI2ic9zAM6Iwzc9cFMWCyT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B058F804E0;
	Sat, 29 Oct 2022 13:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2623F804CC; Sat, 29 Oct 2022 13:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 94A07F80095
 for <alsa-devel@alsa-project.org>; Sat, 29 Oct 2022 13:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A07F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667043405011606932-webhooks-bot@alsa-project.org>
References: <1667043405011606932-webhooks-bot@alsa-project.org>
Subject: wave: add <time.h> missing header inclusion
Message-Id: <20221029113651.A2623F804CC@alsa1.perex.cz>
Date: Sat, 29 Oct 2022 13:36:51 +0200 (CEST)
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

alsa-project/tinycompress pull request #19 was opened from jolivain:

When compiling tinycompress with some libc other than glibc (e.g. musl libc), compilation fails with the following error:
    
    In file included from wave.c:11:0:
    /path/to/gcc/sysroot/usr/include/sound/asound.h:404:18: error: field 'trigger_tstamp' has incomplete type
      struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
    [...]
    
According to POSIX, `struct timespec` is defined in `<time.h>`. See: https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/time.h.html
    
This patch fixes this build failure by including `<time.h>` prior `<sound/asound.h>`.

Note: the github master branch is currently not including the tag 1.2.8, which is why my pull-request is also showing commit 750ebbe.

Request URL   : https://github.com/alsa-project/tinycompress/pull/19
Patch URL     : https://github.com/alsa-project/tinycompress/pull/19.patch
Repository URL: https://github.com/alsa-project/tinycompress
