Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1F460316
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Nov 2021 03:52:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25EE1739;
	Sun, 28 Nov 2021 03:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25EE1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638067972;
	bh=t+WJQKm6Ueh6w/XwCn8WVbaRcmJ9nUzh5tL4mlucnhI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdwcYHSyk0i+z1zunqlRtgPmQ70tV4n5Uj1OIPBg+WBv7cCNKtQfYhc7jcN87AsKP
	 1oYigA/5gKGhikB0/7xstLO14uZeZt2NJ/qUyah+VMXvE7gRbnrPSdCPkxK80YZmew
	 dXy0hFAMfA678I0xjFG08catN9ObcwFqEh58RZIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80FFF804AD;
	Sun, 28 Nov 2021 03:52:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45807F8032D; Sun, 28 Nov 2021 03:52:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A02C1F8027B
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 03:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02C1F8027B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638067917374207020-webhooks-bot@alsa-project.org>
References: <1638067917374207020-webhooks-bot@alsa-project.org>
Subject: Shouldn't there be an error..
Message-Id: <20211128025200.45807F8032D@alsa1.perex.cz>
Date: Sun, 28 Nov 2021 03:52:00 +0100 (CET)
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

alsa-project/alsa-utils issue #121 was edited from auwsom:

..when I type `aplay test.wav` and there is "no soundcards found" when I type `aplay -l`? Instead of nothing. How would I know to check if there is a soundcard, versus some other component of was causing no sound to be heard. Thanks

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/121
Repository URL: https://github.com/alsa-project/alsa-utils
