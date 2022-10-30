Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D25612C24
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 19:08:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B5E1630;
	Sun, 30 Oct 2022 19:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B5E1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667153318;
	bh=5HYKLQyY44fxcmSvxn5qrHNSejd1EBXXf5e0VVn3Fsc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKTIMAvT5OevscOXcuBdZ7v6EN+ed8ojoW0t5BlUpp8bnhzXesGUjzZNk1ulbE20P
	 SH1sIfwSnDrUyZACPIgD1XECwARVCOQtANsJbJRBb8TThQhshIRuK+MklsM7gG81ul
	 CIpoNKakD1vwwt4FEw8dUl4MiIM+aXlbWFd0hjAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B80CF8023B;
	Sun, 30 Oct 2022 19:07:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7283FF800CC; Sun, 30 Oct 2022 19:07:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 183D5F800CC
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 19:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 183D5F800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667153259322611094-webhooks-bot@alsa-project.org>
References: <1667153259322611094-webhooks-bot@alsa-project.org>
Subject: utils/alsa.m4: include <stdlib.h> for exit()
Message-Id: <20221030180742.7283FF800CC@alsa1.perex.cz>
Date: Sun, 30 Oct 2022 19:07:42 +0100 (CET)
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

alsa-project/alsa-lib pull request #278 was opened from thesamesam:

Clang 16 makes -Wimplicit-function-declaration an error by default and it's easier to just explicitly include <stdlib.h> rather than hope the ALSA headers always have it.

Signed-off-by: Sam James <sam@gentoo.org>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/278
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/278.patch
Repository URL: https://github.com/alsa-project/alsa-lib
