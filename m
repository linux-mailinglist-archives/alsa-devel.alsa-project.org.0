Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89538DA9B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25C31663;
	Sun, 23 May 2021 11:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25C31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761074;
	bh=xj8SUTbV6H42hASj1pxu3Am9johOmXWpQNqO8Uv6epA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+TxnGWwTbPlvqoXJaR3T4JydldugyBlLK5kTiTLzFgvVkeam3MbRELZtNhrCRS7V
	 YT7pSQHBexfW5nPebYEPYD/ekpcG01mz+5Fk99P9RD7Eu9Za6rXmWJSch4ZXpYSdgP
	 5mco2ST4EHorabpFFxDNWU+e3l+AsgyaP5WU4O1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E3CF8042F;
	Sun, 23 May 2021 11:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02F24F8016D; Sun, 23 May 2021 11:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12861F8016D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12861F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bmfV16dF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6GyHX0uG"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621760963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkc951D3+bLLEMO6dI3hN5sU21SfGlJuLSixW6CAMNs=;
 b=bmfV16dFLrPU4p6pSM/cEF+sizhC77Quhz8YdVMAuuNsd8gxCogfjs1UZIBwF5//TVrjKy
 Bz2HZtXebba9BZLlp4H02nzI6+NP/AUii3AsJt8NaHboMpASdILsU7gBdAbPeNy5IucQub
 d+QpcKzknvMYZI7t6/EK5s8BFHfC2c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621760963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkc951D3+bLLEMO6dI3hN5sU21SfGlJuLSixW6CAMNs=;
 b=6GyHX0uGvhBNZg9id3Hr3UvwtydL0LM6Ey9kdo9CYn+se1f1hjOSiVB6eTXXnvMfBOs+Pm
 mN3hKTvunNrpo0Cw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9DA3AC51;
 Sun, 23 May 2021 09:09:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/6] ALSA: core: Use READ_ONCE() / WRITE_ONCE() for power
 state change
Date: Sun, 23 May 2021 11:09:15 +0200
Message-Id: <20210523090920.15345-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210523090920.15345-1-tiwai@suse.de>
References: <20210523090920.15345-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

We need proper barriers to handle the power state change of the card
from different CPUs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 1f9aef0adbc9..d69dfc6c4953 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -142,12 +142,12 @@ struct snd_card {
 #ifdef CONFIG_PM
 static inline unsigned int snd_power_get_state(struct snd_card *card)
 {
-	return card->power_state;
+	return READ_ONCE(card->power_state);
 }
 
 static inline void snd_power_change_state(struct snd_card *card, unsigned int state)
 {
-	card->power_state = state;
+	WRITE_ONCE(card->power_state, state);
 	wake_up(&card->power_sleep);
 }
 
-- 
2.26.2

