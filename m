Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187EB77E75
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2019 09:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FFA81AB3;
	Sun, 28 Jul 2019 09:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FFA81AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564299312;
	bh=NaZtdB3q3aHSOaVuQa+1ZN0O2Ou7ndvkuCUAb52MSNk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KEfnYmIDot3aIDNFmUhHBPb1gnxJbWaBRoIZqOyrUAUZHdLZXCkOZQPakysMyBlJp
	 jzgsMBOwYm3gEzVXU3PGq88MU0mzbDAIXNYFAv4m5KEOgabTj9dSNWpawCFMSGTvv+
	 3tzYinQPpDTGrBbYLUJDZgOQU8fPWvG9soxnq100=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEA8F80506;
	Sun, 28 Jul 2019 09:32:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FBCCF804FE; Sun, 28 Jul 2019 09:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_BLOCKED, SPF_FAIL, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C03DF804CF
 for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2019 09:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C03DF804CF
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1564299164820060015-webhooks-bot@alsa-project.org>
References: <1564299164820060015-webhooks-bot@alsa-project.org>
Message-Id: <20190728073247.6FBCCF804FE@alsa1.perex.cz>
Date: Sun, 28 Jul 2019 09:32:47 +0200 (CEST)
Subject: [alsa-devel] axfer: test: fix invalid comparison of 64 bit storage
	in ILP32 data type
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

alsa-project/alsa-utils pull request #25 was opened from takaswie:

In system V ABIs with ILP32 data model, bit shift for '1ul' can brings
undefined behaviour when the calculation result is over 32 bit width.

This commit fixes the bug.

Reported-by: Rolf Eike Beer <eike@sf-mail.de>
Reference: https://bugs.gentoo.org/681652
Reference: https://github.com/alsa-project/alsa-utils/issues/23
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/25
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/25.patch
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
