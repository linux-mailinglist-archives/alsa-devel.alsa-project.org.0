Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903F5D0CBE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 12:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F9D1616;
	Wed,  9 Oct 2019 12:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F9D1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570616666;
	bh=U4XN1lJWo30d80AfhtswIoHw8VH1rnpI48A54jur0Wc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NPJaJgT3HUXLWnV5F24opwOgFQbI4hXGCC7h8VP7paO7TrLgmv2iJ09KMj4SMRVEx
	 xa0r6ywgcUEhrsYdssEvruZ2+E3kwPOCCQWSaicGXlIIQ71qCwK9sYDVV0xQljy+CP
	 DoNbveH5r8iU0uzvwduGPYygdAq0ja/EK4LHVqGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B834F802BD;
	Wed,  9 Oct 2019 12:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF26F802BD; Wed,  9 Oct 2019 12:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8404F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 12:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8404F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X4t2Dq/u"
Received: by mail-wm1-x344.google.com with SMTP id r17so4424619wme.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sstpw1xzoTcys4bTI2z5iT/eq7Z/Z/zzCvHhmA4A8rU=;
 b=X4t2Dq/uhpHhMBk6MlJ5LGM/9j59VfzyXMcipbRZXLDmuFaszNoIi7uuNObDq9DKVI
 DZDbdXUxdsdQed/9mO21N71hPS9dduzZQKaflkEV+tTaQzsJD7Jdruo0u76ZHW2d0/xz
 rDTK/jP8jQL7cbpBPpdy8M/6R6ZTRV7cvjqkoK52SseFeXi5/hhmRyikwRLXZzK0tFg/
 aORskQ7zGOeMH36xr6NrI311cxs6oCR5SHTjsC1y8uN6ZyjAXZsBjmOfvDgkyC17adAq
 BuzrR368owE+VkR/zaqNESXB5Gokxx9bv+2GsZD1T67/y4W6k9amHdySCvP66sER4K5j
 isUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sstpw1xzoTcys4bTI2z5iT/eq7Z/Z/zzCvHhmA4A8rU=;
 b=nVzD6heTsmUBu40NolWKbXdL/sfhzX1Ssi/U3OSzeud+f+xepWgN33lNyEjtztD9JK
 itCMH2xNKEJr3+Xqe+/ZYgqdF/m/3YkOZVATt/FG+jAT93bnqI1rZuoyDgTf8Vwg7n2P
 iUxDOzhu4BVOWkf507JskCUC2kfbk1THjXsEtmyBisYOwy28BpzBjihxvJ0eb//9sYaU
 r43cuCCQbZWn9uJftN6cXpkAr1fTn0Nv96+3fcNWSUUuLwZZopr4s2hFnTk4d9C60mnP
 Zjg/Lr+4Z2lpoM4oEBXl2Luml9viWR2H6+S/zcvRUBkVQ80U4ngh5TLXVjlOd5n8OZSK
 XsEg==
X-Gm-Message-State: APjAAAXr/zcsP0djQlAGLPepZSsUIbqK9mUObBzQKG/HB9xkMOkoCmt6
 iWMlKnb2VqgedulbiwRes8U8Fw==
X-Google-Smtp-Source: APXvYqySTdm1+ZynCCZE5I6c+aQVO46sCHFw7En9hCntPJymIhkKXfobUTWKUmKX2Hfeo1ALaRjGrA==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr2036135wms.166.1570616556682; 
 Wed, 09 Oct 2019 03:22:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q22sm1657407wmj.5.2019.10.09.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 03:22:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  9 Oct 2019 11:21:27 +0100
Message-Id: <20191009102127.7860-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH] ASoC: soc-dapm: Invalidate DAPM path
	during dapm addition of routes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sudheer Papothi <spapothi@codeaurora.org>

During sound card registration, dapm adds routes of
codec and other component paths, but the invalidation of
the widgets in these paths will happen only when the
sound card is instantiated. As these routes are added
before sound card instantiation, these widgets are
not invalidated until a playback or recording usecase
is started.

Audio playback or recording usecase is not started in
the case of codec loopback. So, if codec loopback is
performed just after soundcard registration, then the
widgets are not powered up as those widgets are not
invalidated, results into codec loopback failure.

Change is to remove the sound card instantiation check
condition in dapm add paths, so widgets get invalidated
whenever they are added.

Signed-off-by: Sudheer Papothi <spapothi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-dapm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b6378f025836..13544f7c850b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2862,8 +2862,7 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 		dapm_mark_dirty(widgets[dir], "Route added");
 	}
 
-	if (dapm->card->instantiated && path->connect)
-		dapm_path_invalidate(path);
+	dapm_path_invalidate(path);
 
 	return 0;
 err:
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
