Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3FACC2D
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 12:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA181679;
	Sun,  8 Sep 2019 12:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA181679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567939427;
	bh=F63Nz2i0CBohnHe+Oe5INTQqF5eutFRqs+E1pCCNI24=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=prksUqiq64NTttH67Ek8ASGk7GIf4nFtl3cu8F/rPTGwSSr4PhCnscjNoy2s+t5HF
	 Do7vIjYvs8Km4jRJF2HRwzvi3hrsHZxm1cEOk2JSbKtBfUvwsXpF1U75RsNGt/hDSz
	 O34Szd+t99VecmpFinZuiKh6usm2tC1ICSV8Ifj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE4BF8063B;
	Sun,  8 Sep 2019 12:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9529DF8060D; Sun,  8 Sep 2019 12:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_DATE, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24C74F80368
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 12:39:26 +0200 (CEST)
Received: from server.perex-int.cz (unknown [172.16.0.20])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B456AA0042;
 Sun,  8 Sep 2019 12:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B456AA0042
Received: from alsa-devel.perex.cz (unknown [192.168.102.181])
 by server.perex-int.cz (Perex's E-mail Delivery System) with ESMTP id
 14444140059; Sun,  8 Sep 2019 12:39:22 +0200 (CEST)
MIME-Version: 1.0
From: Jaroslav Kysela <jkysela@redhat.com>
To: zombah <zombah@gmail.com>
Message-Id: <15679391594432724-alsa-devel@perex.cz>
Date: Sun,  8 Sep 2019 12:39:36 +0200 (CEST)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] Licence change for your alsa-lib UCM commit (zombah: 1
	total)
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

As discussed, we would like to move the UCM configuration files from the
alsa-lib repository to new alsa-ucm-conf repository with the licence change
from LGPL-2.1 to BSD-3-Clause.

I would like to check, if you agree with this licence change. Please, answer
to this e-mail and write your agreement / disagreement (keep CC to
the alsa-devel mailing list for the archiving purposes).

Thank you for your time and co-operation.

Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html

List of your commit(s):

  24b4e86ddc512acb6b26f97cb958d59586482fb7
    conf/ucm: PAZ00: add Toshiba AC100/Dynabook AZ new config

---
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
