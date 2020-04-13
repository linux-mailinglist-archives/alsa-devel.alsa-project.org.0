Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD161A6402
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A3A16EB;
	Mon, 13 Apr 2020 10:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A3A16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586766193;
	bh=HP9DVudVJVHQYnNfYXdNXgmdUdxQiEcnkGl0pSU/kAg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GN2sdCBH+uNFwNPQI7DYeSYed2wQCx5P5VB9TtLe8PeAnb/M3W0bYLB29W0OZO6/o
	 6nSMEsT0HtjE9LcTZKGcsPL+agAiqGez06NkGsKDGVwBJuxS/37/7ONo5zlWM6IhaX
	 YzSOwjq2IQCj+1S8iDQEehvzjfQuQgeIepMprAlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E616BF8028B;
	Mon, 13 Apr 2020 10:20:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C42EF8028C; Mon, 13 Apr 2020 10:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24B9FF80245
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B9FF80245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67412AC26;
 Mon, 13 Apr 2020 08:20:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ALSA: hda: Fix/improve no-codec bus
Date: Mon, 13 Apr 2020 10:20:28 +0200
Message-Id: <20200413082034.25166-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Roy Spliet <nouveau@spliet.org>
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

here is a patch set for fixing / improving the error handling of
HD-audio bus without codecs, which can be seen on some GPUs, for
example.

It's been debugged and tested in bugzilla:
  https://bugzilla.kernel.org/show_bug.cgi?id=207043


Takashi

===

Roy Spliet (1):
  ALSA: hda: Explicitly permit using autosuspend if runtime PM is
    supported

Takashi Iwai (5):
  ALSA: hda: Don't release card at firmware loading error
  ALSA: hda: Honor PM disablement in PM freeze and thaw_noirq ops
  ALSA: hda: Release resources at error in delayed probe
  ALSA: hda: Keep the controller initialization even if no codecs found
  ALSA: hda: Skip controller resume if not needed

 include/sound/hda_codec.h |   5 +++
 sound/pci/hda/hda_codec.c |   2 +-
 sound/pci/hda/hda_intel.c | 106 +++++++++++++++++++++++++++-------------------
 sound/pci/hda/hda_intel.h |   1 +
 4 files changed, 69 insertions(+), 45 deletions(-)

-- 
2.16.4

