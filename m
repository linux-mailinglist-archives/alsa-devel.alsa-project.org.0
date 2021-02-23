Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7D3224CD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 05:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05466166A;
	Tue, 23 Feb 2021 04:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05466166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614052837;
	bh=QZk08T+WwEOfWGNkUSC00dQ0BrzX5SMjcgfE1UjC4Cc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AECi8Y6Q5E+1BW5lWulrhl5CoXGcVsZTf7OJjOW6qWBmslBNF1inFNBfN5aJ1gQRy
	 83/occRhI7e+uLu5LwRGD1fXpjwL7F71zs8pk8KbbqIWZye8RT6vEd+eoJSDNSgEfb
	 Jf8A6sW1RxM3h/EaIAQBQJZnO/peKnIOY2FAakdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5274FF8016D;
	Tue, 23 Feb 2021 04:59:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8AB5F8016A; Tue, 23 Feb 2021 04:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 30817F80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 04:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30817F80167
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614052736368413925-webhooks-bot@alsa-project.org>
References: <1614052736368413925-webhooks-bot@alsa-project.org>
Subject: yoga 9i bottom speakers do not work
Message-Id: <20210223035903.D8AB5F8016A@alsa1.perex.cz>
Date: Tue, 23 Feb 2021 04:59:03 +0100 (CET)
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

alsa-project/alsa-lib issue #120 was opened from zany130:

this might be the same issue as the c940 and legion 7i not sure, but the soundbar works but the bottom speakers don't

https://linux-hardware.org/?probe=1f0bdc3a66

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/120
Repository URL: https://github.com/alsa-project/alsa-lib
