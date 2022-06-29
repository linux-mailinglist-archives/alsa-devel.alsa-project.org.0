Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90055FD1F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 12:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C7D1634;
	Wed, 29 Jun 2022 12:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C7D1634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656498533;
	bh=rUg6LSxBYVA4Rx29bbslooRUsu+HxBu/MDqVAGC4w4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtS3cuE92/gCFyo68gnuY/uc2JZUCCwmvoxYPQ7Kvax00qLb4rAM+m2o3QB2R+hgk
	 gScwtwnPmgOzp7sBYm7NwhKPWgu8wuft7CGxleu1KIOemCEGiZLa3kPK787r2rarzP
	 Hn0zYjE/vnjgFv9RBf/81k84VtvnUgmAZFSXRg3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BAF8F80245;
	Wed, 29 Jun 2022 12:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98D8F80245; Wed, 29 Jun 2022 12:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CEEFF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 12:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CEEFF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C2+TpVRi"
Received: by mail-wr1-x42f.google.com with SMTP id o4so17789693wrh.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hg8Agbq4mVHkuTg7yeofSNYUTSRLwIyIHLfG6qwLBeg=;
 b=C2+TpVRiRBe2BxVymZqGsxLurT1OGPL4h9CO7oXcP10zEMb9H+IkUGNt009IJBTPIl
 JuaPnxje+CkdkVqBA4DT0qFHjEWuLcYsRtmtri7KMZMoJeMDBTKtBDI6wSiiy9d+N9Kl
 wl677uKYKqdlFB1f0a6Yp2tRuesScdWfAGt1StvCbFTwl7+b+CTBoV6BonSeD/6A5ocG
 cQaPgSQ8QXadw70bCmjkeqpNp78DhvHiqy4uBhfra3whguxCyfv8/CAdwtA2HHolYwaS
 KKwkzdZnHPY4h5CjbD7/UKWWHDpoSP1tK+K54DPPxBAUicXxwDOU1gLI9EcKlXrBPkJJ
 ChMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hg8Agbq4mVHkuTg7yeofSNYUTSRLwIyIHLfG6qwLBeg=;
 b=F1O4uPHeaBCcDpdatRVrHWHmQLYJ2FY0hMeHq4D688cHAcy+VqY7+kv1RqM0xW/hCO
 5wix0EVWIBfOJoauz/MqJgp82m9zqQXRB/oSNUqd9tPFYhY7Qke6aUWz/vhaWJM01Xnk
 xlfuZY/viJTY8AsPqS6WjAXAHO2CYT9DASfFLprn0jyqP5XQZ3B6TsMucY8wASy1up7f
 dxVAJUzT6MM5oWhle9qnajH/cH8Jd3FBYhqyCU0332VGFDXjvqE+s5/LbVGYFjx7cE2S
 9u3ZXF6zPCT5lkiFvhsKEQDyyVaX0VmmDNptGEHU1MnVhaq88YcrdOrG15KqgVnRtA9o
 Us7g==
X-Gm-Message-State: AJIora+77afJ6HsNcVG8k2j4rTVaA3X3pPPvuelc4aHofoSwBdTpDU8S
 PPt4ZVw+dvLKAmMSpRcDRh9i9UkVskRqEukD
X-Google-Smtp-Source: AGRyM1ufw2P/OIzIfF6EchFfqB3P0dWO5nbggmQs0aSA+PHDT+se1HLVPrFSvZuGO2P//WpKNJCfFQ==
X-Received: by 2002:a5d:43cd:0:b0:21b:8e53:befe with SMTP id
 v13-20020a5d43cd000000b0021b8e53befemr2397726wrr.255.1656498467106; 
 Wed, 29 Jun 2022 03:27:47 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b00219b391c2d2sm19268969wrj.36.2022.06.29.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:27:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: wavefront: remove redundant assignment to pointer end
Date: Wed, 29 Jun 2022 11:27:43 +0100
Message-Id: <20220629102744.139673-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Pointer end is being re-assigned the same value as it was initialized
with in the previous statement. The re-assignment is redundant and
can be removed.

Cleans up clang scan-build warning:
sound/isa/wavefront/wavefront_synth.c:582:17: warning: Value stored
to 'end' during its initialization is never read

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/isa/wavefront/wavefront_synth.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index 2aaaa6807174..13ce96148fa3 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -581,8 +581,6 @@ demunge_buf (unsigned char *src, unsigned char *dst, unsigned int src_bytes)
 	int i;
 	unsigned char *end = src + src_bytes;
     
-	end = src + src_bytes;
-
 	/* NOTE: src and dst *CAN* point to the same address */
 
 	for (i = 0; src != end; i++) {
-- 
2.35.3

