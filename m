Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CC15D662
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:15:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829481671;
	Fri, 14 Feb 2020 12:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829481671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678905;
	bh=e0JqCyb+OdKceQ9QjeGC+L7kSvxK2wiprm2t0AnFR4U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CRLNWsJUE0IH647iF/a64sK498Pnvqu+P/1GdkrnuUNU6WtA7VE/ox7ospNhL/cpA
	 sb+z4RHa9ag5ZjRsi54ZK7a75m0FDleIqs8aE6/xhIX4EasQD3KEaVnJ5dCC63LU3K
	 hsydFOJpU/ZphyL/EX5XZZtOPmJmRJTFXc8FCfCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97826F80138;
	Fri, 14 Feb 2020 12:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 221EAF80158; Fri, 14 Feb 2020 12:13:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B131F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 12:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B131F80086
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4223AB1CA
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:13:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 12:13:13 +0100
Message-Id: <20200214111316.26939-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/3] ALSA: KCSAN fixes
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

Hi,

recently syzbot reports repeatedly about the concurrent accesses with
KCSAN.  Those should be mostly harmless but still safer to be papered
over, so here are fixes.

There are two fixes for ALSA sequencer core, one about applying the
spinlock for the queue bitmap flag accesses, and another about the
current time retrievals.  The last patch is about rawmidi and changes
simply bit fields to bools.

I didn't mark them Cc-to-stable because there are no reproducer and
the patterns are basically safe -- although it's fine to backport
these patches to stable branches.


Takashi

===

Takashi Iwai (3):
  ALSA: seq: Avoid concurrent access to queue flags
  ALSA: seq: Fix concurrent access to queue current tick/time
  ALSA: rawmidi: Avoid bit fields for state flags

 include/sound/rawmidi.h        |  6 +++---
 sound/core/seq/seq_clientmgr.c |  4 ++--
 sound/core/seq/seq_queue.c     | 29 ++++++++++++++++++++++-------
 sound/core/seq/seq_timer.c     | 13 ++++++++++---
 sound/core/seq/seq_timer.h     |  3 ++-
 5 files changed, 39 insertions(+), 16 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
