Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62821F9C86
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 18:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE1D1678;
	Mon, 15 Jun 2020 18:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE1D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592237020;
	bh=JbRUPyLeaiPJE5ACqzhA7KR3HPEIh54zflf7lpT/duQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bdQYe3WDan0eFBeOJYg6/Toe5QkEfgnNT3DeXOaCIijlSuPVdJMYW19gDkAD28a3T
	 UVDAEOzyBzZV3f6WhPwtaOcbyi2E+H5bwqpfU3DXY5SBLyA1QpOoMKQ69FveIEdXz3
	 ++BINez0NoHrvjdWdbo1Dmj/nGv+0fAVYCEf0HG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4377F802A2;
	Mon, 15 Jun 2020 18:01:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCEFF8028F; Mon, 15 Jun 2020 18:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6188EF80171
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 18:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6188EF80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32B8CABE3
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 16:00:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Fix potential issues with x86 PCM SG-buffer
Date: Mon, 15 Jun 2020 18:00:41 +0200
Message-Id: <20200615160045.2703-1-tiwai@suse.de>
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

it turned out that x86 SG-pages that are used for PCM buffers aren't
safe on x86 in all cases, and we need some limitation and workarounds
for non-standard configurations.  This patch set is an attempt to
paper over it in a minimalistic way.


Takashi

===

Takashi Iwai (4):
  ALSA: pcm: Use dma_mmap_coherent() on x86, too
  ALSA: memalloc: Initialize all fields of snd_dma_buffer properly
  ALSA: memalloc: Make SG-buffer helper usable for continuous buffer,
    too
  ALSA: pcm: Use SG-buffer only when direct DMA is available

 include/sound/memalloc.h |  9 ++++++++-
 sound/core/memalloc.c    |  7 +++----
 sound/core/pcm_memory.c  | 13 +++++++++++++
 sound/core/pcm_native.c  |  2 --
 sound/core/sgbuf.c       |  3 +++
 5 files changed, 27 insertions(+), 7 deletions(-)

-- 
2.16.4

