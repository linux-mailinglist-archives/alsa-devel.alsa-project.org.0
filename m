Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39037205659
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 17:52:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C605617A4;
	Tue, 23 Jun 2020 17:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C605617A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592927571;
	bh=9Bp+zfb4TtHECuiPXEfkv3pUqHqDHmf3p/wdh3XRwV8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lTcw0WkP3OM8TIxxp4vxHAPsJ6LviPRaVGs8Caq3jmhNiOEPpuPlNGXliau0j1R9n
	 ZDIZEPYVUW+RZzrUPtX7h0hvtlEU4I6Kh/IR1qb92kHBcAEqMMVs9s37MESv8YOB5k
	 5u61Ns9pt8GbbmmLc8UYr5H/pB8RhJ8vFx33vUes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC52FF80234;
	Tue, 23 Jun 2020 17:49:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB807F802BE; Tue, 23 Jun 2020 17:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6428AF80234
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6428AF80234
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57239AE53
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 15:49:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 0/2] Make dmix lockless operation optional
Date: Tue, 23 Jun 2020 17:49:29 +0200
Message-Id: <20200623154931.27755-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Hi,

this is a revised patch set for the PCM dmix, to make the lockless
operation optional and fix the semaphore usage in the lockless mode.

Unfortunately I got a server problem in the last week and lost many
posts during the weekend, so I couldn't follow up to the thread (I
just read from the lore archive).

In this patch set, to make my intention clearer, I swapped the
patches: the first to disable the lockless operation as default and
the second to fix the semaphore usage in the lockless mode.

In the first patch, the magic number is changed as Jaroslav suggested,
and the description has been updated.  The second patch is equivalent
with the previous one.


thanks,

Takashi

===

Takashi Iwai (2):
  pcm: dmix: make lockless operation optional
  pcm: dmix: Fix semaphore usage with lockless operation

 configure.ac               | 13 +++++++++++++
 src/pcm/pcm_direct.c       | 16 +++++++++++++---
 src/pcm/pcm_direct.h       |  1 +
 src/pcm/pcm_dmix.c         | 18 +++++++++++-------
 src/pcm/pcm_dmix_generic.c |  2 +-
 src/pcm/pcm_dmix_i386.c    |  1 +
 src/pcm/pcm_dmix_x86_64.c  |  1 +
 7 files changed, 41 insertions(+), 11 deletions(-)

-- 
2.16.4

