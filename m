Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03C71B9A81
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 10:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E04166D;
	Mon, 27 Apr 2020 10:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E04166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587976967;
	bh=8V695ec+yCR20bZGikPyZxvTRLGzwSI1ARn9ADe5wPc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXsXgduhsQnn1zRkICCBibd3o5vCFIBqOKINo2ic00M+MjOJeYbkcuEd3cq1j+Cab
	 hw21QpNzNhrkKVhxewlGngGN6I7cvGbBxpaJgPke6wWBy+gDoGvNm6W0kIvN/nyp2p
	 66F2COR+ueYCt+tQflAUJZfC+yXlJKMovfMZXW9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A046F80232;
	Mon, 27 Apr 2020 10:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89321F8022B; Mon, 27 Apr 2020 10:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E4B3FF8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 10:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B3FF8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587976854206866026-webhooks-bot@alsa-project.org>
References: <1587976854206866026-webhooks-bot@alsa-project.org>
Subject: error: possibly undefined macro: AM_PATH_ALSA
Message-Id: <20200427084103.89321F8022B@alsa1.perex.cz>
Date: Mon, 27 Apr 2020 10:41:03 +0200 (CEST)
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

alsa-project/alsa-utils issue #40 was opened from zeerd:

Hello!

Seems alsa-utils using gettext, but have no check in the configure.ac

But my question is , could we just ignore the using of gettext by some parameter of configure?
My target-board-sdk has no gettext.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/40
Repository URL: https://github.com/alsa-project/alsa-utils
