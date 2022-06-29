Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F055FD20
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 12:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB651662;
	Wed, 29 Jun 2022 12:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB651662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656498564;
	bh=rUg6LSxBYVA4Rx29bbslooRUsu+HxBu/MDqVAGC4w4g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1Mc+Ze4kYoYSiycZeRoEc1pRPEH6/Ixe7hf4THO606TZMjVY7Mig97HtiVRdVyG2
	 dk/ZHhzNwgfk6TAskgw7zeYXSTu7Ca13puOpk3hVRc3oIGK4PyXLCkryXU+7MMECpq
	 I+2kAq7wXunW3wL041rrTLdFxraS0u/5NujhKd6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E32FF80107;
	Wed, 29 Jun 2022 12:27:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D246AF80115; Wed, 29 Jun 2022 12:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23420F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 12:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23420F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gbsb5zJu"
Received: by mail-wm1-x333.google.com with SMTP id n185so9046053wmn.4
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hg8Agbq4mVHkuTg7yeofSNYUTSRLwIyIHLfG6qwLBeg=;
 b=Gbsb5zJuVLRm7Da9Jr8RdNRb4c18Dy5l/Envmga0FP8skRJl9vegZvr6zWcv3ho0eD
 OcazvVvO86d9o7aqVpR6fRQZzdQbbgT56o8lqr/Mz6sLVhOumuK+6+S59ITxmWB5uAK1
 CiAnrf/APbNafVXL0dXfi75d8nd3jo4PTk5O4XipYLtyR0+E6QxbS1IB2VGPbRcLz/aF
 0FA0+v6PTERW99mIdv6ITvN6iQQCMK5zcW9yaA+dAmEdXC+ubZ3sLzvF5S6K7E62/tsH
 CCCx6fM+zTpSxS5wyQFzwnbu74aihqAAX5oYK5nkgXnGcgOdxBMs/szaXUOvSH7L0qEK
 IHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hg8Agbq4mVHkuTg7yeofSNYUTSRLwIyIHLfG6qwLBeg=;
 b=F3zyvnjmNlyAuFiw0RnoI8DscC38iU/c9J2a9ZGfIICF6GzrjfypV4WD98XoLoBHD2
 +2EYva1jWuACcLzV+3bzUz8YE7d/kBr/FyURgI+gkX8W+W/Mj1cVOSeTgPHG1v9Lrh6E
 PiURkTfSximXzENQ9TV5crzjuZ0fgnWcxC/8ldsbgfrQEQe76O+nVlqut1hqqTP+eVAw
 FPgyERAnF2gjWZ6MkFiZHbIAFX3YupwS1V7e0AegZntSlOVsHIGw+M5pfYIKN1LF8tmz
 L7Yw7+FbvzHGAVtq5sGZr9heaF4KFLQioDQvqZnkkADBM29EnNvgANv2lZyccgu5bCtG
 LPNw==
X-Gm-Message-State: AJIora9g3pPMbvq8DMW07m8JJ1HpqcYULymlx3LJska/G4s8NP4OhHHG
 60Jz0nKWmbsoZdE8fbZ8d4LmrabfRLUEZvfG
X-Google-Smtp-Source: AGRyM1soYIu0yqbLqBPz5blI3gO9sqPT4fLgv1ey2BFKUtMpLfhggg4dGfA55XA5R19+t43NuTDDBg==
X-Received: by 2002:a05:600c:1d85:b0:3a0:3d28:bdd9 with SMTP id
 p5-20020a05600c1d8500b003a03d28bdd9mr2962462wms.114.1656498469396; 
 Wed, 29 Jun 2022 03:27:49 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm2765494wmq.44.2022.06.29.03.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:27:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: wavefront: remove redundant assignment to pointer end
Date: Wed, 29 Jun 2022 11:27:44 +0100
Message-Id: <20220629102744.139673-2-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220629102744.139673-1-colin.i.king@gmail.com>
References: <20220629102744.139673-1-colin.i.king@gmail.com>
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

