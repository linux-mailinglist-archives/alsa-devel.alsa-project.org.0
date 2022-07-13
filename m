Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C957348E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C372B1703;
	Wed, 13 Jul 2022 12:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C372B1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709352;
	bh=oShFLlxMmsF1DK+dybJUa85xzF89PL+yXnfSKV6vUs0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uEIj6FEdmcbhJ8o5PFVxBGS2Bgrj11kGv2ceWb0pRYgbn0miFXHsrIo9UrmgQq2vx
	 xy5D7YG8auRQf8TEAhalvFVnT91I6TkQj2vRaogFk3WtcBCAIctAgb3X/uQSRR80zQ
	 KpzC0ctwliKck7nYdt4qe9rSKbfppC4xWTTN0QZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E580F80543;
	Wed, 13 Jul 2022 12:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B563FF8053D; Wed, 13 Jul 2022 12:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05B79F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05B79F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1xq/Z2L9"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Lc+ZnrFO"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BF3B33B0D;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e7hFDI7FkjSpmTl1cteHrn0v2a6BDPfpdkn1dLlynfA=;
 b=1xq/Z2L9bFTOSHwE4e9hsuuIybuJTn9kT54VHVoa9fpoL1x9k+EzlD+bv2ECn6h5ob6NYZ
 Zi8xo+/l5/rZ9Ua9Pi7WyGXxbsMEs4+tDdAYHajtd5YD1UkuRN3jVNW7SF85YjnQ8GMlbZ
 H2P3gyAZZ/nYDVT53AAlsJMd9ljOIWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e7hFDI7FkjSpmTl1cteHrn0v2a6BDPfpdkn1dLlynfA=;
 b=Lc+ZnrFOIqdnmyIw8PJlf/6c2wkDH3P1OP7BiF/GN5Y+Em/qRnK5r3pokPKlR/dsdlXfPv
 oA6TKLP0Kn6b73AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FDA913754;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VsbOCuaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ALSA: kernel doc fixes
Date: Wed, 13 Jul 2022 12:47:52 +0200
Message-Id: <20220713104759.4365-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

this is a patch series to address minor warnings at processing kernel
docs.


Takashi

===

Takashi Iwai (7):
  ALSA: compress: Enable kernel doc markers for some functions
  ALSA: pcm: Fix missing return value comments for kernel docs
  ALSA: dmaengine: Fix missing return value comments for kernel docs
  ALSA: compress: Fix kernel doc warnings
  ALSA: control: Fix missing return value comments for kernel docs
  ALSA: memalloc: Fix missing return value comments for kernel docs
  ALSA: core: Fix missing return value comments for kernel docs

 include/sound/dmaengine_pcm.h         |  2 ++
 include/sound/pcm.h                   | 50 +++++++++++++++++++++++++--
 include/uapi/sound/compress_offload.h |  2 +-
 include/uapi/sound/compress_params.h  |  6 ++--
 sound/core/compress_offload.c         |  9 +++--
 sound/core/control.c                  | 16 +++++++--
 sound/core/device.c                   |  2 ++
 sound/core/info.c                     |  2 ++
 sound/core/init.c                     | 10 ++++++
 sound/core/isadma.c                   |  3 +-
 sound/core/memalloc.c                 | 10 +++++-
 sound/core/pcm.c                      |  4 +++
 sound/core/pcm_dmaengine.c            | 30 ++++++++++------
 sound/core/pcm_memory.c               |  4 +++
 sound/core/pcm_native.c               |  6 ++++
 sound/core/vmaster.c                  |  3 +-
 16 files changed, 136 insertions(+), 23 deletions(-)

-- 
2.35.3

