Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59A31B154
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 17:57:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46731687;
	Sun, 14 Feb 2021 17:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46731687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613321850;
	bh=L3pV3nyEz76No4Letd5EySjIVXgk/0VHmtVWtgd6Hq4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYN21sfZXXoJ6QDD8xgiA+DhizOZ5uub/siJHH+mJjHutvL9cSsqgn8C7xW+Yr5df
	 bamDm3TO85WazUW7qzRBFzShW1GUYecQZ30xIA6H+H+uAKK1sD6ZNRITm1aU4kpXiO
	 klL/lp5VkCEma0bpi4CAHw5IA1j5D27KRRWcYL3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2111FF800B2;
	Sun, 14 Feb 2021 17:55:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C3EF80155; Sun, 14 Feb 2021 17:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C888EF800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 17:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C888EF800B2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1613321745186568022-webhooks-bot@alsa-project.org>
References: <1613321745186568022-webhooks-bot@alsa-project.org>
Subject: amixer: Expand on channel docs in man page
Message-Id: <20210214165556.97C3EF80155@alsa1.perex.cz>
Date: Sun, 14 Feb 2021 17:55:56 +0100 (CET)
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

alsa-project/alsa-utils pull request #78 was opened from mcampbellizo:

Add missing channel params to the amixer man page. Also call out that
the channel param must come before the value to take effect.

signed-off-by: Matthew Campbell <mcampbell@izotope.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/78
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/78.patch
Repository URL: https://github.com/alsa-project/alsa-utils
