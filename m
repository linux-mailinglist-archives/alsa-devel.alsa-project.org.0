Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42F217433
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9BF8820;
	Tue,  7 Jul 2020 18:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9BF8820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594139991;
	bh=J2MJ/duH2bS5U1Y0T+/jkmjX+XL5hlBX5Sdwc59rfgg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IeR8OZCVTDtLY7sBUtvvEZBwj9zcxaSSO+tNWsaWtTyBQITDFVHFTgf+Qqn4XIEdJ
	 9fOumUeZxgqD/Zjts6IsnIa2PUU/4UGri7jn0yUxP/DKOphsx01TSqVGcgKGEYgnpL
	 riYrpdSq0TumDyKnG3uMR0e5fz1C9gkPc2FgJiHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF2ABF801F9;
	Tue,  7 Jul 2020 18:37:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D569EF802DD; Tue,  7 Jul 2020 18:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E160F801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E160F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="igUVII5d"
Received: by mail-wr1-x441.google.com with SMTP id q5so45857567wru.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89ssfiDaoOJSnjV248d4sDefUT+7TO0HxUeigRg/Xi8=;
 b=igUVII5dZ2G5KVSukaILRqxVMXxGWlzOmIIK0fjLv5HWnWKekkDNcTXX9hPb1wQwN8
 FTPapeYqOVja2FGOzgs/K81A9eNNe7LdIa2R0rAWj8EssShRgcuphy6vBK/RVDUMJ4ID
 afHei0QePdDSFkpA1Bww2imqh2kbl+5qYpaIq3qicJkR0QAhQ1FD3+pMWVzTqe4+da1z
 1dcLS0wHxrbYzxAjc0SaOoUDlFoh6wL02xIuEffBjmsJocDi2vudx04v9ZV4BXNvBVqP
 Z+ItAR+E3tjX64F0bLJGf3BjW7DeGbI8MUh+OAV+U9eiUsexu89nvkg0yvy+eFnSKIjP
 CQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89ssfiDaoOJSnjV248d4sDefUT+7TO0HxUeigRg/Xi8=;
 b=GNT1kd6+yXXGuNeMauUWLKEYDGYYbbcwT1lCZ2Q+Mn/Sxuc0nCHlbeDPYp10opPBzf
 VSY+a2m/8yvEfMT/c9Gi/G2to2dBYFRCk7BUPbMhtBXwsKd/nuNbihYj2i9ykkT3SVMl
 HxF7uxXJz4miQFBdAqJyxtYhhg6V9o/l++ih4OtBA7Oz4OvT8s3BN6m+poYkist0CiMS
 SfvUk4bYVZgKyJ/0OQTShnBGs8KqQ5hS45bVqMM9mYfml7ZGYvCTPrsA7ThhrGAppRra
 BkJnatkVxkpvqbnCIkSdDF38YFe/BoCDNayEoo0y0zYh6dREn9FNQbPaaKWPEeNEFdFC
 Tf+w==
X-Gm-Message-State: AOAM531ISNKRutcpUZYyX1sX3ar9t/jcgm+M/M7IpCTLGslAeLHkTXJK
 Ev12QAXpMQSZcYUT4SD4AMVBuA==
X-Google-Smtp-Source: ABdhPJwCyvOuGqMhL0YVGz/yoxJtvXzq8/2DIwLjjCWwVY+dCgTdX/SvInkwsOOlCV4xU5MUfG3y8w==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr56186871wrt.5.1594139814687; 
 Tue, 07 Jul 2020 09:36:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 04/11] ASoC: q6asm: use flags directly from asm-dai
Date: Tue,  7 Jul 2020 17:36:34 +0100
Message-Id: <20200707163641.17113-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

use flags set by asm-dais directly!

This will be useful gapless case where write needs a special flag to indicate
that last buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index f5d1f3c2c1ec..d6728304ce6a 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1546,10 +1546,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	write->mem_map_handle =
 	    ac->port[SNDRV_PCM_STREAM_PLAYBACK].mem_map_handle;
 
-	if (wflags == NO_TIMESTAMP)
-		write->flags = (wflags & 0x800000FF);
-	else
-		write->flags = (0x80000000 | wflags);
+	write->flags = wflags;
 
 	port->dsp_buf++;
 
-- 
2.21.0

