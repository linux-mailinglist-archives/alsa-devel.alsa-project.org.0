Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D537F63C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 13:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F1D1729;
	Fri,  2 Aug 2019 13:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F1D1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564746868;
	bh=6ZqywYe8F9qwrOGYL6aVb2BdwnZf1moCG+w+P+U0+rE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dva5X/Yf1UJ7ysORXZNsdlWKiv2OhyMHOEHnmyaxIZpy0KoxIUg3J5phzQbOxDzdZ
	 Bh12bQ1yS4NQ0P6tCFQ5kykEs9EmiifmsBSSSdCSQzVMGCr0P1rsxzXIgX4nE2zwEC
	 nppUi7fx5tBCK2/D6nz1tTelPq5H5hNumIwlLOBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C0DF8049A;
	Fri,  2 Aug 2019 13:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 034FEF80114; Fri,  2 Aug 2019 13:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kwaak.net (gw-fsck-sorbs.kwaak.net [82.197.218.155])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D537CF80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D537CF80114
Received: from [192.168.0.171] (port=59312 helo=lenny.kwaak.net)
 by mail.kwaak.net with esmtp (Exim 4.50)
 id 1htW6q-0006ye-Uw; Fri, 02 Aug 2019 13:52:33 +0200
From: Ard van Breemen <ard@kwaak.net>
To: alsa-devel@alsa-project.org
Date: Fri,  2 Aug 2019 13:52:13 +0200
Message-Id: <20190802115215.311-1-ard@kwaak.net>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.168.0.171 (failed)
X-Kwaak-Spam-Score: -2.4
X-kwaak-MailScanner: Found to be clean
X-kwaak-MailScanner-SpamCheck: not spam, SpamAssassin (score=-2.097,
 required 5, autolearn=not spam, AWL 0.21, BAYES_00 -2.60,
 DNS_FROM_AHBL_RHSBL 0.29)
X-MailScanner-From: ard@kwaak.net
Cc: Ard van Breemen <ard@kwaak.net>
Subject: [alsa-devel] [PATCH 0/2] ALSA snd-usb-audio: Add Pioneer DDJ-SX3
	PCM support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Pioneer lacks the UAC descriptors (added to quircks). It also needs
a fix in synchronisation handling for those cases that
bSynchAddress == 0

Ard van Breemen (2):
  Skip bSynchAddress endpoint check if it is invalid.
  Add Pioneer DDJ-SX3 PCM quirck.

 sound/usb/pcm.c          |  1 +
 sound/usb/quirks-table.h | 57 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
