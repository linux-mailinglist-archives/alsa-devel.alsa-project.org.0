Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32DB446226
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 11:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3104E1684;
	Fri,  5 Nov 2021 11:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3104E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636107754;
	bh=4OhHVQQIs0bF+HMW3FUiJ54PFpzy7+RMtDKxrL7AmXc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EAy5blxAAKLLDPRUr8Nie3JUZERsaf/fCXGDKYKVjh+UDpLOOqkMrSpvDaEWyfgcR
	 wkHi0wYztZAnI+xI3EXmM6KKxEdijnuISux+5iItRDdNJQwtJlHDrwaTrW+K76Yp+i
	 FQy4K3uG4oTH/KwkcqmugTyZJz9/72kOvl/bS5Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B33F80269;
	Fri,  5 Nov 2021 11:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D00B9F8026A; Fri,  5 Nov 2021 11:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC563F80224
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 11:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC563F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1vdMVCeB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5h0USV7U"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AD7AE212BB
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636107665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kZw4A7Tixt7gwkJbsdNVapGkXdC6w1fot026JxImMzo=;
 b=1vdMVCeB0P9cnZogiyqIicLDpb1QJmlXkXT4hNSlgtD8jGPZqIf/gKkte0JiF1lO1zcJFP
 bIAn0INtCFxGIPMXwqRitg26T8VHQLCsAo588sgmLCJsOQ0BZBEeB/vP2SLtBMO9bPdtss
 Ak9BCsX/d1HbhnThVrIhP6UNKaE45Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636107665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kZw4A7Tixt7gwkJbsdNVapGkXdC6w1fot026JxImMzo=;
 b=5h0USV7UTaFaMie6x4wUwXor5FQEkwM7UHNFz9MdT/EfByvQV/4t/QbWD1u349IWMl2adX
 OUpEijdrg59sA7Bw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9E9352C157;
 Fri,  5 Nov 2021 10:21:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Catch call with NULL snd_dma_buffer pointer
Date: Fri,  5 Nov 2021 11:21:03 +0100
Message-Id: <20211105102103.28148-1-tiwai@suse.de>
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

Although we've covered all calls with NULL dma buffer pointer, so far,
there may be still some else in the wild.  For catching such a case
more easily, add a WARN_ON_ONCE() in snd_dma_get_ops().

Fixes: 37af81c5998f ("ALSA: core: Abstract memory alloc helpers")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index ea778f868cf3..ea9698cea2e3 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -631,6 +631,8 @@ static const struct snd_malloc_ops *dma_ops[] = {
 
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab)
 {
+	if (WARN_ON_ONCE(!dmab))
+		return NULL;
 	if (WARN_ON_ONCE(dmab->dev.type <= SNDRV_DMA_TYPE_UNKNOWN ||
 			 dmab->dev.type >= ARRAY_SIZE(dma_ops)))
 		return NULL;
-- 
2.31.1

