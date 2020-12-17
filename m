Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0772DD02C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 12:13:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01CFD1868;
	Thu, 17 Dec 2020 12:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01CFD1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608203630;
	bh=vYPYhYSfwkdbSNgKQdyuWBhNzfV8dLv4+VzvzwJ0l7w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdOxhZ95eqL8UsHwknreWZ3aKIpq/BjyWZ+iR4jGOFzrxjat9p9OSHA8W7DiPvZPH
	 wZxycfFVK4QzdaXDsNiv5pwOGUGuBlDnY95CDlaW1lDKQlA1qAKHosC38kP/guJiSC
	 FY2i9l7Fprs+HvuZt70xDwrDyXzGwLghwV+oIsWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A173F800C7;
	Thu, 17 Dec 2020 12:12:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 827FFF80260; Thu, 17 Dec 2020 12:12:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5DD14F80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 12:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DD14F80148
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1608203526273194075-webhooks-bot@alsa-project.org>
References: <1608203526273194075-webhooks-bot@alsa-project.org>
Subject: utils/alsa.m4: update for newer autoconf.
Message-Id: <20201217111212.827FFF80260@alsa1.perex.cz>
Date: Thu, 17 Dec 2020 12:12:12 +0100 (CET)
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

alsa-project/alsa-lib pull request #106 was opened from sezero:

fixes autoconf-2.70 warnings. should be compatible down to autoconf-2.59.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/106
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/106.patch
Repository URL: https://github.com/alsa-project/alsa-lib
