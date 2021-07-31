Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860E3DC50C
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Jul 2021 10:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC0251FD0;
	Sat, 31 Jul 2021 10:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC0251FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627720579;
	bh=iolEdT0MaZ7+jAYhHUUk6qvDvpmMBEoI3WoUKhRFG+8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iit6XTxub1B8GAgbjSd3dr7u/xhK+LnKyUAaWhvp8zViEpc+1ddiNKwTj+mX1MGe9
	 /dEf0jG5YsIuDdl6lKEFw0EF9zMDODCpdKg/S73giN3P/9my8XvTEB40+J7jWHrOVL
	 p+Vzx370FJWnJSD4QlFHh8uh0uVoZ1eo2FTD1lWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148FEF802DF;
	Sat, 31 Jul 2021 10:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EAC3F80276; Sat, 31 Jul 2021 10:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B83C6F80258
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 10:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B83C6F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hpCNre/G"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zoN4Fkt4"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 161FD2240F
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627720487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tzql9YaQYOHKV65e9pTIvu+mlHPBNjKJEK08KMKiohI=;
 b=hpCNre/GZ55FNm6Lgm6dV5TruZKVZsycmCMKM/IFhzmNE/pASGubl9a0y0p1Q9SIWalQaf
 MS1lXAfhIq7BfK9h2hw20dK8Ett6E+0IPl+Gr8Vtum6KFd7+bm6yVPu8IgMxiHAX3MLemy
 Kk7E9yTGbSfS1a7REiVCHuCoDKckLWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627720487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tzql9YaQYOHKV65e9pTIvu+mlHPBNjKJEK08KMKiohI=;
 b=zoN4Fkt4UEtrBGe82oL9TWHVvMYdjZXSYPRbBnk7yTqcaaCAPgFUq3VMGmLI55IsrCXY+i
 7Ez4EBJa4seZkKAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0CB9CA3B89;
 Sat, 31 Jul 2021 08:34:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Fix double calls of snd_card_free() via devres
Date: Sat, 31 Jul 2021 10:34:46 +0200
Message-Id: <20210731083446.26680-1-tiwai@suse.de>
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

At the transition to the devres-managed card release, we've put the
check of double-free at trigger_card_release().  But this wasn't
enough, as the code path calls snd_card_free() again, and it would
lead to the doubly snd_card_free() calls.

Actually the v1 patch was correct to handle this, but I forgot that
corner case and moved the check to the more obvious place as I thought
it's clearer.  But, as usual, devils live in details.

This patch corrects the check of the double-free to the right place,
with a bit more comments.

Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index e985185ebc91..ac335f5906c6 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -605,6 +605,15 @@ int snd_card_free(struct snd_card *card)
 	DECLARE_COMPLETION_ONSTACK(released);
 	int ret;
 
+	/* The call of snd_card_free() is allowed from various code paths;
+	 * a manual call from the driver and the call via devres_free, and
+	 * we need to avoid double-free. Moreover, the release via devres
+	 * may call snd_card_free() twice due to its nature, we need to have
+	 * the check here at the beginning.
+	 */
+	if (card->releasing)
+		return 0;
+
 	card->release_completion = &released;
 	ret = snd_card_free_when_closed(card);
 	if (ret)
@@ -813,10 +822,7 @@ EXPORT_SYMBOL_GPL(snd_card_add_dev_attr);
 
 static void trigger_card_free(void *data)
 {
-	struct snd_card *card = data;
-
-	if (!card->releasing)
-		snd_card_free(data);
+	snd_card_free(data);
 }
 
 /**
-- 
2.26.2

