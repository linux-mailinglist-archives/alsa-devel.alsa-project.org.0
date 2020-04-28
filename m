Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED31BBFA3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 15:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4EDE1680;
	Tue, 28 Apr 2020 15:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4EDE1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588080884;
	bh=2gI11G+s6lGUIdUz/uJjTHlmPB34Q+ElWj7NZT8+KGU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P5XQX8o4m66UzvHOtFRVciDtM+UHeOHK85HgztNdGXws9+0DqadFLsliptWhzJkBh
	 VFmZ1ik77kZZEE+2D0ydfNZ8+HdY3oBgBPmKZOgiUCe2VOoJ7uhyaNDvyjQznaNJxC
	 JEGYessNmFA9Cdr4Wi6q5c3k2ZIRcBICjMGLiY2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5DC4F801EB;
	Tue, 28 Apr 2020 15:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED91F801DB; Tue, 28 Apr 2020 15:33:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A3376F8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 15:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3376F8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588080772889811039-webhooks-bot@alsa-project.org>
References: <1588080772889811039-webhooks-bot@alsa-project.org>
Subject: please point wiki to github
Message-Id: <20200428133301.1ED91F801DB@alsa1.perex.cz>
Date: Tue, 28 Apr 2020 15:33:01 +0200 (CEST)
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

alsa-project/alsa-lib issue #43 was opened from archenemies:

Googling "alsa report issue" or "alsa report bug" takes me to the following page:

https://www.alsa-project.org/wiki/Bug_Tracking

This page should have a link to https://github.com/alsa-project/alsa-lib/issues/

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/43
Repository URL: https://github.com/alsa-project/alsa-lib
