Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C742DE54
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 17:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 055CC1684;
	Thu, 14 Oct 2021 17:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 055CC1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634225954;
	bh=UTw3XGS4nJUKCwYWMNOmTloE9mS0dkumkUpGVDLJois=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DN5A2B159BkKCAIv5T23sGYGWUdHFDZgJKRD34WGYMNskyDsGbNGvU1YLsI2yZ1D+
	 Sxv7ev5VVLDl0Y3mbiY5mktyR804bh1eD9C9as6K/FQwtyW/bT7YbhdEnP222ysQiB
	 R9YJDUy+J8px4k3zI/RbM6K+GKgpYxwgI3B/ocRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE28EF804F1;
	Thu, 14 Oct 2021 17:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD77BF804AD; Thu, 14 Oct 2021 17:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D72E6F80245
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 17:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D72E6F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tw3DfSnz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1Fb1zXEP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8C3F61FD3B
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634225823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x7NkeWT94a+LmnMe7riKyH1Oi2mDDWXPgPXZJYzbRRk=;
 b=tw3DfSnz5jJdE3qe0ExPKdIzR3fjZTwoGHCtPrU9ImpJkolPEPaDe16sC1cxFvaT6dUuYG
 Jj2ruBW6y5KImIDvzGNOzrK2/12QLgd53MT7WY3/OKxLsQZ9HiYDc1Nb3/kvoS3SFdkepE
 kuN/8/pBNNt4CjD2e4m3DioYKs+ODOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634225823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x7NkeWT94a+LmnMe7riKyH1Oi2mDDWXPgPXZJYzbRRk=;
 b=1Fb1zXEP/41CXdPsv01zEN1rLZ9Mvcv5FTYfegyKvnAh0+n5P/XQ0WzFSpkP/lsKTI6jpm
 lpYthKxSEbinkLCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7C13EA3B84;
 Thu, 14 Oct 2021 15:37:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: Support for non-contiguous and non-coherent page
 allocations
Date: Thu, 14 Oct 2021 17:36:59 +0200
Message-Id: <20211014153702.5077-1-tiwai@suse.de>
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

here is a patch set to add the support for non-contiguous and
non-coherent page allocations to the ALSA core memalloc helpers.
Currently no driver is using, but this also gave a nice cleanup for
the existing SG-buffer helpers on x86.


Takashi

===

Takashi Iwai (3):
  ALSA: memalloc: Support for non-contiguous page allocation
  ALSA: memalloc: Support for non-coherent page allocation
  ALSA: memalloc: Convert x86 SG-buffer handling with non-contiguous
    type

 include/sound/memalloc.h    |  61 +++++++++--
 sound/core/Makefile         |   1 -
 sound/core/memalloc.c       | 207 +++++++++++++++++++++++++++++++++---
 sound/core/memalloc_local.h |   1 +
 sound/core/pcm_lib.c        |   3 +
 sound/core/pcm_local.h      |   7 ++
 sound/core/pcm_memory.c     |  13 ++-
 sound/core/pcm_native.c     |  16 +++
 sound/core/sgbuf.c          | 201 ----------------------------------
 9 files changed, 282 insertions(+), 228 deletions(-)
 delete mode 100644 sound/core/sgbuf.c

-- 
2.26.2

