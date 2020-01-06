Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F4131A9C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 22:40:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA36A17FE;
	Mon,  6 Jan 2020 22:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA36A17FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578346851;
	bh=RLEIfRmzjfSEBgiMut/3VmXUrVy00QhNFoiOghp42zc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBrn5tAboX/EzjlO4zTmMBPI/UecgMuU8aMawyIJh3wjdhxx5eLxMeJXjcDazii8j
	 CJFFYtXEkE2y4ZmtNKkG3cPoliBntLfang3mJG1mUFPhpZRKe6UD+Ix7syDKn8Ls8b
	 3dD/P0XQswaWD2hUSDKsO38t1Gsp8Xkm+dT+j0Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1649AF80149;
	Mon,  6 Jan 2020 22:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9264BF80159; Mon,  6 Jan 2020 22:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EAA1BF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 22:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA1BF80116
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578346740562442064-webhooks-bot@alsa-project.org>
References: <1578346740562442064-webhooks-bot@alsa-project.org>
Message-Id: <20200106213905.9264BF80159@alsa1.perex.cz>
Date: Mon,  6 Jan 2020 22:39:05 +0100 (CET)
Subject: [alsa-devel] mixer: Fix memory leak for more than 16 file
	descriptor case
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

alsa-project/alsa-lib pull request #20 was opened from dfries:

I saw this when digging through the source code, wrote up a test case, and verified with valgrind.  I don't have that many sound cards so I modified mixer.c to always take the conditional.  alloca seemed like the least effort way to fix this.  Other thoughts were to test pfds != spfds and free, but given how little bytes would be allocated putting on the stack seems reasonable.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/20
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/20.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
