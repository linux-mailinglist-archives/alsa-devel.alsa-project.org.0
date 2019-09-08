Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4AACC38
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 12:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA4115F9;
	Sun,  8 Sep 2019 12:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA4115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567939796;
	bh=zBX2pKvk2qEZuDz7yRiROqDOWYirYzZ4hhm5bDUUotY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=phBSWCu1v8emuXSZtZXvim6Z+mVO14zqhittkFdUvj990p7LObayOeBiPFKrHVOre
	 BzRLfTNvuB7IAVcyF0CFzMALW7S/x+hdtos/tYppEL7zW/PL9BZq7WvCuzig/S6jiX
	 YheXKptnSpSTYppVA3xXm+M+nTRaSwHaYyDFmPkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B927F8070C;
	Sun,  8 Sep 2019 12:40:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C08F8065E; Sun,  8 Sep 2019 12:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_DATE, RCVD_IN_DNSWL_BLOCKED, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D05F80393
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 12:39:35 +0200 (CEST)
Received: from server.perex-int.cz (unknown [172.16.0.20])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 68260A003E;
 Sun,  8 Sep 2019 12:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 68260A003E
Received: from alsa-devel.perex.cz (unknown [192.168.102.181])
 by server.perex-int.cz (Perex's E-mail Delivery System) with ESMTP id
 CC5E914005C; Sun,  8 Sep 2019 12:39:32 +0200 (CEST)
MIME-Version: 1.0
From: Jaroslav Kysela <jkysela@redhat.com>
To: Carlo Caione <carlo@endlessm.com>
Message-Id: <15679391594432724-alsa-devel@perex.cz>
Date: Sun,  8 Sep 2019 12:39:59 +0200 (CEST)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] Licence change for your alsa-lib UCM commits (Carlo
	Caione: 4 total)
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

  b22a50651180c946fbd69945c8e783c1c3f6d015
    conf/ucm: rt5651: Add UCM config for bytcr-rt5651
  764302ebddefa77e7b014c2043adbf563d5b1c90
    conf/ucm: rt5651: Fix HiFi file name
  5a78f1e2590ed60bbc1012b97992158a0167a52f
    conf/ucm: rt5651: Add missing cdev
  9f941cb1d7b7afce24922857017e89c4c76659a9
    conf/ucm: rt5651: Mute speakers on boot

---
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
