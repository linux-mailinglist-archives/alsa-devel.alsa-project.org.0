Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED8A472D36
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 14:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE5E186E;
	Mon, 13 Dec 2021 14:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE5E186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639401997;
	bh=SOjEvBeZMCgDvnO8WHFAcoaGRU0S+xD6wVu8Y2u1IZk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MrdfouKPZ72+Lu1Z3mHT23WA/gbEvZJ/idKGVP38VDgtXLe4SGKbu/qsA2Lw94cdE
	 ZXuilJeUgTW1iRJ85DIe9ja3A1gGHOOq56HyySacwy7y0IrutVSgbfrWHnDkoZyQtl
	 fHjrOogLDLfA03rs3dh23mkzpWlIbUcRd/AWwpnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A578CF8042F;
	Mon, 13 Dec 2021 14:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACFA6F8025F; Mon, 13 Dec 2021 14:24:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99282F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 14:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99282F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dCAxPr1Z"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="F65hUQ3s"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D01C41F3BE;
 Mon, 13 Dec 2021 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639401885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=57qkfZrnIUr7d6gpj3C6+VuSRqu6+JRJyBBxAbkOA8A=;
 b=dCAxPr1Z/K+fIwmtHIm8d1RxxGrM4PhfIW1pbASjyMMIg0HvziFCSIrhRG/lvXEfeKETH7
 lLwikY+biwy8Zi+8GIvDL5G/6xn4jXURuRQLBls/sPiN1BQ054BC4jQbVazPQk9DEKigyn
 nkCSW/tuyQtlfvTg12V5oLhy9WUz2nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639401885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=57qkfZrnIUr7d6gpj3C6+VuSRqu6+JRJyBBxAbkOA8A=;
 b=F65hUQ3sQhCKXKtJu7EeW1/aNIwg3tOzNC9AlJTZrwvDW7MY+k8sqkYMIKwZEMerUwmNjH
 ieCm3lyYxSjABYCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BF81DA3B8A;
 Mon, 13 Dec 2021 13:24:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: gus: Fix erroneous memory allocation
Date: Mon, 13 Dec 2021 14:24:43 +0100
Message-Id: <20211213132444.22385-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Xiaoke Wang <xkernel.wang@foxmail.com>
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

snd_gf1_mem_xalloc() returns NULL incorrectly when the memory chunk is
allocated in the middle of the chain.  This patch corrects the return
value to treat it properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 4c691dbf2721..5e3ff3137dd7 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -44,7 +44,7 @@ static struct snd_gf1_mem_block *snd_gf1_mem_xalloc(struct snd_gf1_mem * alloc,
 			else
 				nblock->prev->next = nblock;
 			mutex_unlock(&alloc->memory_mutex);
-			return NULL;
+			return nblock;
 		}
 		pblock = pblock->next;
 	}
-- 
2.31.1

