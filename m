Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F95747AA
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 11:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39C9418FC;
	Thu, 14 Jul 2022 11:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39C9418FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657789413;
	bh=dUisWHaGZNftqPNt37zbEIvIQlfF9UZ65xrr/NUR1K0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MubxR0oR9fUZLwmImULiLb6AXjV/QsuI9bkCtB+WRbU6FSzJWKDl2Uf9rS22dPiO8
	 8lOgND347PNNCoh2gSPCZO7gMbPUha8ZgK2Xs/gACRKTXiGhFCnyqAbA6aeUIClsuR
	 wYqDUJ17eh7tJTJpUeUkgeUAMVi7tnowfBcCNKY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94608F8016E;
	Thu, 14 Jul 2022 11:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA9CBF80165; Thu, 14 Jul 2022 11:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BE30CF800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 11:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE30CF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657789342732518911-webhooks-bot@alsa-project.org>
References: <1657789342732518911-webhooks-bot@alsa-project.org>
Subject: amidi: restore space between bytes
Message-Id: <20220714090230.EA9CBF80165@alsa1.perex.cz>
Date: Thu, 14 Jul 2022 11:02:30 +0200 (CEST)
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

alsa-project/alsa-utils pull request #158 was opened from johnkeeping:

Commit 9a8fcec ("amidi: add timestamp option for dump") removed the
space between bytes when dumping MIDI, changing the output from:

	90 45 40
	80 45 00

to:

	904540
	804500

It seems that this was an unintentional side effect of refactoring the
code to add the new timestamp output but the result is less readable
than it was before.

Restore the space between bytes in the same message.

Fixes: 9a8fcec ("amidi: add timestamp option for dump")
Signed-off-by: John Keeping <john@metanate.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/158
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/158.patch
Repository URL: https://github.com/alsa-project/alsa-utils
