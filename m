Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B84493DB8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 16:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154BE319E;
	Wed, 19 Jan 2022 16:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154BE319E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642607649;
	bh=S23ctfz1rnEL/OfqB0hG9fbrr9xwMTj3Evp6bA8Cew4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uql+I9dBb4Eky7KklpWaKK0yFl1g4u0/OOWu0EHdfbm1j1vNq9h1uS0zgPQgb/V9n
	 N9ZAc64O88EWq/tsJRZzxa0S6OfzLj7CM/u4AccoE+Q4fPD8m9mBaOaTUpvzv0+eK2
	 gjnEy2WKxiVuFD/PuxbzIn4ogC1yu8rvIsu5mk1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 658F8F800F8;
	Wed, 19 Jan 2022 16:53:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17FCEF801F7; Wed, 19 Jan 2022 16:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7992BF80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 16:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7992BF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="PcjfJo9b"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Zf5ZuFkm"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AC2AD2113A;
 Wed, 19 Jan 2022 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642607578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+Z1qAXliCZNUmjYe+qRdP6RGgEi3gvs4s59JbSm0b8=;
 b=PcjfJo9bV1Nnp8fm6BU+/u475zAj2su2IfSz6E4Ukf/Z3eY/0u9RTC3U0r3UqKMCAJWVZT
 VPecf6gTb1lWJL8OVcIkqolIn3ccUNKiFKzg5iMV0FZGR5bUCw+rdIGOSy6hfYIFPaffFy
 +EDxY8gGcD3XV76vYVHLyErEcWWeh7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642607578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=x+Z1qAXliCZNUmjYe+qRdP6RGgEi3gvs4s59JbSm0b8=;
 b=Zf5ZuFkmcJRt8ghRCCgfKw9Qy5m9f1jRl6pwBQBOz7+3VbSPRzXLVCvY1l4/C8AggEkGif
 mK6lO/MBOn55x1Aw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 54149A3B87;
 Wed, 19 Jan 2022 15:52:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC DPCM lockdep fixes
Date: Wed, 19 Jan 2022 16:52:47 +0100
Message-Id: <20220119155249.26754-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

this is the revised patches for addressing ASoC lockdep warnings due
to the recent DPCM locking refactoring.


Takashi

v1->v2:
  - minor correction in the changelog for nested lock
  - debugfs removal workaround

===

Takashi Iwai (2):
  ASoC: soc-pcm: Fix DPCM lockdep warning due to nested stream locks
  ASoC: soc-pcm: Move debugfs removal out of spinlock

 include/sound/pcm.h     | 15 +++++++++++++++
 sound/core/pcm_native.c | 13 +++++++++++++
 sound/soc/soc-pcm.c     | 18 ++++++++++++------
 3 files changed, 40 insertions(+), 6 deletions(-)

-- 
2.31.1

