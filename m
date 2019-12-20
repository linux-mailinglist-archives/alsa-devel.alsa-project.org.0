Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD11276B5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 08:47:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D003515F8;
	Fri, 20 Dec 2019 08:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D003515F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576828049;
	bh=lw0y+lHjQYhQiZn7BToqnVUZ1lkdj6DXy5ZRSFLfPFI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFtRIwVSmpwELoUUHytYr9vRDXwosJb3ScjWkxxhuGkO3TF1HHGhScFtui/WekouY
	 lYfplJvJvzn/AJ8YJIm9tBY7+pE/sr6gW8Z5fdBwJkF4gE59kmx53uLULhN/UYQVXW
	 5e0KLtAa/jRYWZ6hkv3NAFtflSW5gPLKKapwiYuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6DCF8015A;
	Fri, 20 Dec 2019 08:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A6DF8015A; Fri, 20 Dec 2019 08:45:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 00EB7F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 08:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00EB7F800B5
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576827938019478083-webhooks-bot@alsa-project.org>
References: <1576827938019478083-webhooks-bot@alsa-project.org>
Message-Id: <20191220074542.18A6DF8015A@alsa1.perex.cz>
Date: Fri, 20 Dec 2019 08:45:42 +0100 (CET)
Subject: [alsa-devel] configure.ac: remove an unnecessary libtool fix
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

alsa-project/alsa-lib pull request #19 was opened from tanuk:

This code was added in commit 75d393a563efb578c79364a277087c6326267f52
without explaining why. I assume it was a mistake, since it looks like
the libtool problem should have gone away a long time ago. The referenced
wiki page https://wiki.debian.org/RpathIssue says:

    Since libtool 1.5.2 (released 2004-01-25), on Linux libtool no
    longer sets RPATH for any directories in the dynamic linker search
    path, so this should no longer be an issue unless upstream used a
    really old version of libtool when creating their distribution
    tarball.

This code caused problems in OpenEmbedded, where the libtool script is
named "x86_64-oe-linux-libtool" or similar rather than just "libtool",
so the sed command failed with a file not found error. Rather than
adapting the code to OpenEmbedded's peculiarities, it seems best to just
remove the unnecessary code altogether.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/19
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/19.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
