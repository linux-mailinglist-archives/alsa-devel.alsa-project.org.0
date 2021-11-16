Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7358452B69
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 08:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595B41699;
	Tue, 16 Nov 2021 08:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595B41699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637046910;
	bh=sC2Oarsm1QwXbJj4I/WRNHrfG8GoqbSDb6AqJNSMkUA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/wXGOVpxmjh1Kh5OKOjQVNZSHPCgADY6IW0d8P35vMQGw+reDU7658OqdCicBIy5
	 7l6AKi4YA6lmd0LK+gTC8yXO39hfUiZe/5KeDFuEFcGn4nPKnFqZPfJpDfhaELF3fq
	 T+Tx+yGNDywz9y8nDBz4kX+vESjq4kCa5gTKeS4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F1ADF804E0;
	Tue, 16 Nov 2021 08:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA218F802C4; Tue, 16 Nov 2021 08:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62745F80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 08:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62745F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZjmjYvAQ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="CZfnCoah"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A7720218CE
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637046798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7p4WeaN8eE2dq5mxU9fmogRj+7uZWhYN5IEeSyBYAo=;
 b=ZjmjYvAQLJ4MDlWxmkR9Ha0QZB69LKN8bjX7dBsmQpqsex50SKR8HTlVom5qrPUpF+Ue9M
 WyNx8g39EApJx0+B8rPuNbCc4M9IeXSuIA4MGb2pu0oEd1BKaxnTnPDKcl07ipu6WykbXK
 KE77qenW2YjJErhiBS1lzx5MdtXiadY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637046798;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7p4WeaN8eE2dq5mxU9fmogRj+7uZWhYN5IEeSyBYAo=;
 b=CZfnCoah/u0PLU/79oLzflMMZkpweb5C5ZGVuy7W+e48a7XsXVG5Fgv+gV76aQxdEgHfcu
 o9QzGOcsfBeAJuAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 96905A3B84;
 Tue, 16 Nov 2021 07:13:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: PCM: Add missing rwsem around snd_ctl_remove() calls
Date: Tue, 16 Nov 2021 08:13:13 +0100
Message-Id: <20211116071314.15065-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211116071314.15065-1-tiwai@suse.de>
References: <20211116071314.15065-1-tiwai@suse.de>
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

snd_ctl_remove() has to be called with card->controls_rwsem held (when
called after the card instantiation).  This patch add the missing
rwsem calls around it.

Fixes: a8ff48cb7083 ("ALSA: pcm: Free chmap at PCM free callback, too")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 6fd3677685d7..ba4a987ed1c6 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -810,7 +810,11 @@ EXPORT_SYMBOL(snd_pcm_new_internal);
 static void free_chmap(struct snd_pcm_str *pstr)
 {
 	if (pstr->chmap_kctl) {
-		snd_ctl_remove(pstr->pcm->card, pstr->chmap_kctl);
+		struct snd_card *card = pstr->pcm->card;
+
+		down_write(&card->controls_rwsem);
+		snd_ctl_remove(card, pstr->chmap_kctl);
+		up_write(&card->controls_rwsem);
 		pstr->chmap_kctl = NULL;
 	}
 }
-- 
2.31.1

