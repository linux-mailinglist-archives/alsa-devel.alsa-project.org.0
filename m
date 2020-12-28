Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C342E362A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 12:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C5B1706;
	Mon, 28 Dec 2020 12:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C5B1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609153633;
	bh=9vBx+J/sDuMjtptigZEX7ERw1jwLKpEAXKQsVEUjb/E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5LhZkGAcE0Gf5LNI+mXzKPt5/HwNlUCS0w/QJ1gtbi5mbtbw7YNRutv82HW0cs2y
	 u2JJKRAyTrAD5ACFmdHUutLZLVqMmzDV5ogIQ+8anrj+jDvVGCQO4rLZC2uQUIEf/5
	 nW8UGKmMTJPvRtR1CWZGsigjuapwNG3c0Xlzf0WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8771F801F9;
	Mon, 28 Dec 2020 12:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51EA8F801F5; Mon, 28 Dec 2020 12:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0C648F8014E
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 12:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C648F8014E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1609153532068211079-webhooks-bot@alsa-project.org>
References: <1609153532068211079-webhooks-bot@alsa-project.org>
Subject: pulse: handle reading pulse stream hole
Message-Id: <20201228110536.51EA8F801F5@alsa1.perex.cz>
Date: Mon, 28 Dec 2020 12:05:36 +0100 (CET)
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

alsa-project/alsa-plugins pull request #17 was opened from i-garrison:

If there is a hole in pulse stream, handle it by generating silence.

This should fix #16

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/17
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/17.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
