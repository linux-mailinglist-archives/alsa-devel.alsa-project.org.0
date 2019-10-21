Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B7DE8BB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 11:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D0C1615;
	Mon, 21 Oct 2019 11:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D0C1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571651805;
	bh=FRKRZWr2Zk7aijmj/K5y2yp7T5qtWgocH1WNk/6tTLQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C767qnlH44ktQ2fRzIN7JziBmmO3wSbtYXawg4j359oEhDgTEfFTXExuPUJh45R7o
	 EC0stwjz/3fIhjgDRYvVFFACTF+eF8eo51YfarorHXr/DxjF0YqWGJRxndKI4FLnik
	 xvUSWvbWpKHNwub2A9YtjHy3v1SGX0FpA4gMVLQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3868CF8036F;
	Mon, 21 Oct 2019 11:55:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85403F80368; Mon, 21 Oct 2019 11:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E08EFF80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E08EFF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e1AsVdc8"
Received: by mail-wm1-x342.google.com with SMTP id g24so3365568wmh.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l0PmgB8vQ7ayVyix5K/Wkc67Lw4jYhDf6SJZvdZy4h8=;
 b=e1AsVdc8VihT2c2OlLCjWb5VLG7pyRJ4T55phPemU7G4sWlW34Lvt95lTaydF1icpA
 +zU5+DfY4DvLijMUV45po1l2oozJXcn5DE1oTFSzEhFSxNcYqAH7ePcLWhH3byUk0r46
 7XFEtSlSvtWh7wBVMut6ZquVplJMCt+1b2XC+zhRobOyHKa2u4DLku1Bk4VNdgBgFK0E
 L7JEE2Uf9jYYNx1mQ/yP9gd1vEcGpH+JtGwuchn7HsqrDuDUSXRDZPVD4Nui0p8PAK4I
 xXp+QbWsw465VGPlmZIDxQAFJXVr5nLOzZrMV14g+HA/lgnTyFBfbrMD/OeiKt7Y+Skr
 T4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l0PmgB8vQ7ayVyix5K/Wkc67Lw4jYhDf6SJZvdZy4h8=;
 b=Uev8GyC1IGfYMZd5vOcUaUDlA/1d2S2XPoC3nLnhVJ2uLY6Hp9ZSCUEzW7aq73yl0p
 cRTkrIG4hM6B1JG3Fa1amGerfJTCLZEg4m0rkdB3yv4E5RGho1R5dzlkZJdejGL8H6xt
 BaxUOJUcSqhih4u3J7tUPElgkqJGVRNeB2FHxNi+iY7ZOmK/muYOsxxNSFaudW7dq1NM
 5rQ3TDqfDb906RAYYc4dy/0eTfHlaFDqLcU9Bv1bHPFfca6qQMM3qUaeKsS2rwqbRMQZ
 OC5w2QsZBnhlzmGC9UZZxVfYO7NG9qp/I0lBYa+Jnj0Azokda/2x6JmW/enK3jBRtqmv
 lVzw==
X-Gm-Message-State: APjAAAUbzglXCI2wXLYbrMPoXVxbOd7BqehZgCmoKRaiOAc5hvSVexId
 1YVbu5BCRziys9iWc/aOFPf1Og==
X-Google-Smtp-Source: APXvYqzPFx9XzxEnT1i23LUwKiFnLQGT3YA6PskIYIlobCBL8ThRsnhMtCJyhmLtlI0/hI9FW7aeZA==
X-Received: by 2002:a1c:5609:: with SMTP id k9mr18142735wmb.103.1571651695736; 
 Mon, 21 Oct 2019 02:54:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id v11sm12356283wml.30.2019.10.21.02.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:54:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org,
	tiwai@suse.com
Date: Mon, 21 Oct 2019 10:54:32 +0100
Message-Id: <20191021095432.5639-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Xiaojun Sang <xsang@codeaurora.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH] ASoC: compress: fix unsigned integer overflow
	check
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

From: Xiaojun Sang <xsang@codeaurora.org>

Parameter fragments and fragment_size are type of u32. U32_MAX is
the correct check.

Signed-off-by: Xiaojun Sang <xsang@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/core/compress_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 41905afada63..f34ce564d92c 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -528,7 +528,7 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 {
 	/* first let's check the buffer parameter's */
 	if (params->buffer.fragment_size == 0 ||
-	    params->buffer.fragments > INT_MAX / params->buffer.fragment_size ||
+	    params->buffer.fragments > U32_MAX / params->buffer.fragment_size ||
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
