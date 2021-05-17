Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EE382D24
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F851662;
	Mon, 17 May 2021 15:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F851662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257441;
	bh=qqoBwprYDs6M4lNPsoIMp3gyIcDlrqRNYdXpp40WGX4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qXUd4yOPlzsNp/OBcfIVn2TGvozLt6nUBBMzv4IHBtz0P3tVklO2rUAPCUnz9xix3
	 K4Fm5qOdqZ7oydcY4VeoOiVeHqBNe3mN7YruRNsPCy00/zuB+PK56Adak2S83d2pjW
	 vWN3objRmFO1gVrjBWdtoQsjmClFXGSiZ5pRxr24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4FEF8016E;
	Mon, 17 May 2021 15:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1E27F8020B; Mon, 17 May 2021 15:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86ECBF80082
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86ECBF80082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF995B162
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] ALSA: usx2y: Fixes and cleanups
Date: Mon, 17 May 2021 15:15:34 +0200
Message-Id: <20210517131545.27252-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

this is a patch series for usx2y drivers.

Most part of changes are about cleanup of the code.  The current usx2y
driver is fairly unmaintained code, and this was the cause of some
overseen bugs (or rather confusion) as happened in UMN fiasco.

So the initial goal is to make a bit more readable for further
reviews.  The remaining part of changes are actual fixes.  At this
time, I concentrated only on the obvious issues that could be spotted
out after the cleanup.  The driver is likely broken in other ways, but
the identification and the fix would need the actual device, so I
leave them for now.


Takashi

===

Takashi Iwai (11):
  ALSA: usx2y: Avoid camelCase
  ALSA: usx2y: Fix spaces
  ALSA: usx2y: Coding style fixes
  ALSA: usx2y: Fix potential leaks of uninitialized memory
  ALSA: usx2y: Avoid self-killing
  ALSA: usx2y: Fix potential memory leaks
  ALSA: usxy2: Fix potential doubly allocations
  ALSA: usx2y: Fix shmem initialization
  ALSA: usx2y: Don't call free_pages_exact() with NULL address
  ALSA: usx2y: Cleanup probe and disconnect callbacks
  ALSA: usx2y: Nuke pcm_list

 sound/usb/usx2y/us122l.c          |  61 +--
 sound/usb/usx2y/us122l.h          |   2 +-
 sound/usb/usx2y/usX2Yhwdep.c      | 135 +++---
 sound/usb/usx2y/usX2Yhwdep.h      |   2 +-
 sound/usb/usx2y/usb_stream.c      |  82 ++--
 sound/usb/usx2y/usb_stream.h      |  23 +-
 sound/usb/usx2y/usbus428ctldefs.h | 104 ++---
 sound/usb/usx2y/usbusx2y.c        | 389 +++++++++--------
 sound/usb/usx2y/usbusx2y.h        |  65 ++-
 sound/usb/usx2y/usbusx2yaudio.c   | 684 ++++++++++++++++--------------
 sound/usb/usx2y/usx2yhwdeppcm.c   | 627 ++++++++++++++-------------
 sound/usb/usx2y/usx2yhwdeppcm.h   |   4 +-
 12 files changed, 1146 insertions(+), 1032 deletions(-)

-- 
2.26.2

