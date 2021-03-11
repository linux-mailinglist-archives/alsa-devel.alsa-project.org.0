Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC881336963
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 02:03:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541A416FB;
	Thu, 11 Mar 2021 02:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541A416FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615424620;
	bh=oNWfCbgHRYtL7A4nJtiVkXpPo9Q3gq78pwnhfinGqLk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVydbKHTC2G7t2fm8W7IPzbB1REuMBSqYamj1yhRfKv/Fi5dTaz9E6REMX5V/EZHK
	 XbIXK30smFUSgnaGkRIJO0Hy0vues0OOCnVy+R9cqSZOYVRRJTVd+LEZonsQ9x5nZ9
	 R8tvxSXWjzZsz1kNTv+Y7RHNqlGKM31UsRP+znTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C14ACF8012F;
	Thu, 11 Mar 2021 02:02:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 221C7F8012F; Thu, 11 Mar 2021 02:02:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D046F8012F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 02:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D046F8012F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1615424515828613043-webhooks-bot@alsa-project.org>
References: <1615424515828613043-webhooks-bot@alsa-project.org>
Subject: Support for Tascam US-366 card
Message-Id: <20210311010208.221C7F8012F@alsa1.perex.cz>
Date: Thu, 11 Mar 2021 02:02:08 +0100 (CET)
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

alsa-project/alsa-tools issue #5 was opened from sxiii:

Greetings!

It would be really nice to have US-366 card support. I bet this card can be reversed just as the others was. Here's the link:
https://www.tascam.eu/en/downloads/us-366

I am available to test stuff if somebody can give me a hand with this task.

Thanks

Den

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/5
Repository URL: https://github.com/alsa-project/alsa-tools
