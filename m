Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5AFF891
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B4B168A;
	Sun, 17 Nov 2019 09:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B4B168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981003;
	bh=8GYmw0ibVvhAKpdQP5VaUfC3kE6+HnCWXNn89FyMxwo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BSt4FaqLvWMKNJoRKCfhrdHGZigevy/RamqwiKObRN1pYKCAW9H48Y7jlabvg3CyP
	 QN79OV2wyuPo1PhiUc0tG+pwKR28Pl3X/X0276jCKH9/WEtHzYor3uWipiXPZWkcux
	 6oYS0n7RaKIjIzO96HJOqjCi7VbU9h7wm+2fNh4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB3BF8013B;
	Sun, 17 Nov 2019 09:53:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72DA5F8013E; Sun, 17 Nov 2019 09:53:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B244F80123
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B244F80123
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEC24B1A4
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:00 +0100
Message-Id: <20191117085308.23915-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 0/8] ALSA: pcm: API cleanups and extensions
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

this is a patch series for a few ALSA PCM API changes.

Basically the patch set introduces three changes:

* Add the "managed buffer allocation" mode;
  this allows many drivers to drop hw_params and hw_free callbacks
  that simply call snd_pcm_lib_malloc_pages() and *_free_pages().

* Make PCM ioctl ops optional;
  almost all driver can drop the lines to define pcm_ops.ioctl.

* The new sync_stop PCM ops and card->sync_irq;
  it's used to synchronize the pending task after stopping the stream,
  for fixing the use-after-free or such problem.


I planned originally merging these changes to 5.6.  But since the API
changes would influence on many drivers outside sound git tree, it
might be easier to merge only these core changes at first during 5.5
merge window while keeping the rest (the actual driver
implementations) intact -- that's why I post now for reviews.  The
changes are additional, and they won't break things by themselves.
The drivers can / need to change the call patterns for following these
new APIs.


thanks,

Takashi

===

Takashi Iwai (8):
  ALSA: pcm: Introduce managed buffer allocation mode
  ALSA: docs: Update for managed buffer allocation mode
  ALSA: pcm: Allow NULL ioctl ops
  ALSA: docs: Update document about the default PCM ioctl ops
  ALSA: pcm: Move PCM_RUNTIME_CHECK() macro into local header
  ALSA: pcm: Add the support for sync-stop operation
  ALSA: pcm: Add card sync_irq field
  ALSA: docs: Update about the new PCM sync_stop ops

 .../sound/kernel-api/writing-an-alsa-driver.rst    | 148 +++++++++++++++------
 include/sound/core.h                               |   1 +
 include/sound/pcm.h                                |  12 +-
 sound/core/init.c                                  |   1 +
 sound/core/pcm_local.h                             |   2 +
 sound/core/pcm_memory.c                            |  83 ++++++++++--
 sound/core/pcm_native.c                            |  48 ++++++-
 7 files changed, 237 insertions(+), 58 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
