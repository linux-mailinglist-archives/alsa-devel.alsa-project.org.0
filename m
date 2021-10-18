Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C54317A7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E13319FD;
	Mon, 18 Oct 2021 13:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E13319FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634557329;
	bh=WWpOgCUCU5Qiq3Jm4Z8i9bKJhwN3+JG3E/kub5vRMxU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E9FTIURgQrdX4tk9QXSmow1JDPtP1q/ZgYgaDNp6u2rs0e4tb90OhP+WeYM/x7YR2
	 SmCBjr0UP0dSVvxCPHna2EocCC2E9gy6ocWsIoDMAZmOU38gBRxWEmzgHf30JLSKih
	 j42Tgehx0I/bJFBxPvv6+lFlzDnLa4r12UMNeWfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DE2F80253;
	Mon, 18 Oct 2021 13:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C13F80224; Mon, 18 Oct 2021 13:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BF7F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BF7F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="IJfnJqf2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/UHPnio+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6E70F1FD79
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634557236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMbtBorhJUA25nq741M8pmluVjf4a+++iOD1ERamKLA=;
 b=IJfnJqf2Oau68n/ez9jtCyU1LYFKx9PP+BfHBqL7OErpI/+PLqmzBYLULu/skLuJIiE9N7
 LzvNZqnJSQrp6BNwD8hEvK2vxzLNGfkeMO9RXEOXby0vzGtkWDU8MkULqt+uh3AW3vJqHR
 XgRZvEJlsx0otgyJBsDYAi7rCrgUgqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634557236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UMbtBorhJUA25nq741M8pmluVjf4a+++iOD1ERamKLA=;
 b=/UHPnio+bqOTHeRaOf+mQCyC8+Oi+GlQ4I33YUvOoyI9BctzaRzN2+sJ4Adcc+JSfOS97H
 kBCFq3hxX29A5cBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5D758A3B83;
 Mon, 18 Oct 2021 11:40:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: uapi: Fix a C++ style comment in asound.h
Date: Mon, 18 Oct 2021 13:40:35 +0200
Message-Id: <20211018114035.18433-1-tiwai@suse.de>
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

UAPI header should have no C++ style comment but only in the
traditional C style comment, but there is still one place we used it
mistakenly.  This patch corrects it.

Fixes: 542283566679 ("ALSA: ctl: remove unused macro for timestamping of elem_value")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5859ca0a1439..5fbb79e30819 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1002,7 +1002,7 @@ typedef int __bitwise snd_ctl_elem_iface_t;
 #define SNDRV_CTL_ELEM_ACCESS_WRITE		(1<<1)
 #define SNDRV_CTL_ELEM_ACCESS_READWRITE		(SNDRV_CTL_ELEM_ACCESS_READ|SNDRV_CTL_ELEM_ACCESS_WRITE)
 #define SNDRV_CTL_ELEM_ACCESS_VOLATILE		(1<<2)	/* control value may be changed without a notification */
-// (1 << 3) is unused.
+/* (1 << 3) is unused. */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_READ		(1<<4)	/* TLV read is possible */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_WRITE		(1<<5)	/* TLV write is possible */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE	(SNDRV_CTL_ELEM_ACCESS_TLV_READ|SNDRV_CTL_ELEM_ACCESS_TLV_WRITE)
-- 
2.26.2

