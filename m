Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698BE3EA3ED
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 13:41:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9141AA6;
	Thu, 12 Aug 2021 13:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9141AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628768484;
	bh=9ViOUdqLkKoyvwNsmfwjvl0GsOfxN2BI11K1Qr8hxtE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r5Gme2A/4/Nd0BCjfRs9yYYfSeGyEJzQZp2OzOFruBt0gX08arUwQwauSxU5FX5nF
	 oDLhQM0YZdPnA5GFIcpxD/C+LzIuYyADxeUlW63hbSXCUGFzUEhJ2Tse9d1Ilq34cV
	 RrkpouSxC28IilA3gx5jPlDylLHZ/1SPdGdYgv+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF6FF804E3;
	Thu, 12 Aug 2021 13:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EACDBF804E3; Thu, 12 Aug 2021 13:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84724F80279
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 13:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84724F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="s/GVh/6p"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="C57xtfme"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CC55D2222F
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628768299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYhKycPLJSQJawvKT2HBIueoNE75yWpRlW0d02LmVi8=;
 b=s/GVh/6pmsMTSdmLkEpbmwRmq/++FCvCJwaMUV29M0+PHS7PFf3wJUGstGttv27CElYENt
 9ZSaE5+BKoqotGXrdVgiTWw+Ee/zEndaAvgjb4IDZdSpgT6BQb1iWuFyrIL29Eb8+Fbo4U
 6d1h3wrQx17kUVkEvlO3ZuFISlrRMUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628768299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYhKycPLJSQJawvKT2HBIueoNE75yWpRlW0d02LmVi8=;
 b=C57xtfme79w6c7kbo/rNbB74S6iEUXthwSWL/4faRljNp0pC2TqGO0P/UwpFrobMW27z4e
 ATcsfzrDf4tm7SBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BD0C8A3EFB;
 Thu, 12 Aug 2021 11:38:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC v2 0/4] ALSA: Support for non-coherent and non-contiguous
 page allocation
Date: Thu, 12 Aug 2021 13:38:14 +0200
Message-Id: <20210812113818.6479-1-tiwai@suse.de>
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

this is a revised patchset to add the support for PCM buffers with
non-coherent and non-contiguous pages, typically useful for non-x86
architectures.  The first patch improves the SG-buffer handling, then
add a new PCM info flag that disables the control and status mmap, and
implements two new buffer types, SNDRV_DMA_TYPE_NONCONTIG and
SNDRV_DMA_TYPE_NONCOHERENT.  The former is the SG-buffer and the
latter is the continuous page allocation, corresponding to
SNDRV_DMA_TYPE_DEV_SG and SNDRV_DMA_TYPE_DEV on x86.

Unlike other page types, those are directional (that need the DMA
direction at allocation time) and require the explicit sync of buffers
around the data transfer (flushing, invalidating).  The sync is
implemented inside ALSA PCM core and automatically applied at updating
the applptr and hwsync via SYNC_PTR ioctl, which should be issued
during mmap operation, so it should work transparently as long as
applications are running with alsa-lib.  For tinyALSA, we might need
to revisit the implementation.

This is currently an RFC -- more exactly, CALL FOR TESTERS, as I have
no Arm machine with the sound device for now.  The needed change for
an existing driver is simple:

* Replace the buffer type from SNDRV_DMA_TYPE_DEV to
  SNDRV_DMA_TYPE_NONCOHERENT (or from SNDRV_DMA_TYPE_DEV_SG to
  SNDRV_DMA_TYPE_NONCONTIG), which is set up typically in
  snd_pcm_set_managed_buffer*() call.

* Add SNDRV_PCM_INFO_EXPLICIT_SYNC flag to the PCM runtime
  hardware.info field

It'd be greatly appreciated if anyone can test and try the changes,
and help debugging.  Again, the code is faily untested.

The latest code is found in topic/memalloc-noncontig branch of my
sound git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git

The patch set is based on for-next branch, i.e. changes for 5.15 are
included.


thanks,

Takashi

===

v1: https://lore.kernel.org/r/20210810122200.971-1-tiwai@suse.de

v1->v2:
* Drop the optimization patch for embedding ops that turned out to be
negligible but causing a trouble with the existing sgbuf.
* Minor code refactoring

===

Takashi Iwai (4):
  ALSA: memalloc: Count continuous pages in vmalloc buffer handler
  ALSA: pcm: Add SNDRV_PCM_INFO_EXPLICIT_SYNC flag
  ALSA: memalloc: Support for non-contiguous page allocation
  ALSA: memalloc: Support for non-coherent page allocation

 include/sound/memalloc.h    |  46 +++++++++-
 include/uapi/sound/asound.h |   1 +
 sound/core/memalloc.c       | 172 ++++++++++++++++++++++++++++++++----
 sound/core/memalloc_local.h |   1 +
 sound/core/pcm_lib.c        |   3 +
 sound/core/pcm_local.h      |   7 ++
 sound/core/pcm_memory.c     |  13 ++-
 sound/core/pcm_native.c     |  15 ++++
 8 files changed, 236 insertions(+), 22 deletions(-)

-- 
2.26.2

