Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993D3453138
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A1C1687;
	Tue, 16 Nov 2021 12:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A1C1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063348;
	bh=AxORZepENFqLugX4B6hKOMeUK+eXYOrHGzIJf3oqFTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MU/p86b+9DZr5TmqX9lsOfJVEwYa166BYdxUwIduoSh8ohMH+k0e/9E8Ex+AEFGxg
	 RNG4QlU2jPq9BRkbjMJErzhTDOuX+WQRBrJqSVSX/RpXE913uThQxzQC7xpz65sshW
	 2Hke8Ws3asvoKSjXGxs8x4dCWFZo5HEWefWDOmjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C13A1F804EC;
	Tue, 16 Nov 2021 12:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D087F804E7; Tue, 16 Nov 2021 12:46:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0F65F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F65F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="q6wAjGae"
Received: by mail-wm1-x329.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2148404wme.3
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vU5yaEpd/Y0DZa1Q/uJoC95gJS14ZCBm7xrXmd2b678=;
 b=q6wAjGaeA6r4rXyycstm1UqubMBDnj8KkmEe3inUHwr7tTisgEBUt4wXQAgESktp7h
 D2ayhCAY74WbLD+9BtrTnKNLwOxlPFGJW9p19LMaR+9oBoEmcWxswLwo9wdzBcu2U/XP
 M9BHY8eOjDy0kdd2cfO87vmHlyGdNIxLVaUl9H9+bkFfhBR40JieNFh+eDaj2jlOfMq1
 7QAwTQd3gwD2QXxgOv8YgaL9bCHBEBcSAKkn3b0C8ijP1DYxyVSnLl9M0aeT/Jd9/xJl
 FjIitTuv8lsGPvh0+906Y23QM+O+LSzufDTZWFoVktxJgGjSBwmLrF4Pmp3UcBMQLBQ5
 V1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vU5yaEpd/Y0DZa1Q/uJoC95gJS14ZCBm7xrXmd2b678=;
 b=4LU7nYm1QyuPGibH03N97hS+dfSfkxavfHSDWtSit0TP10edSDEEqW5slfGsDqFtPZ
 9yrfYzVukYtf4BevJvZ4AQTvD3GsWncVdDqx5CT/Easwmc2uZs11dCN9L7KOVVdSVeqv
 ycjCsxk5HgIrmHetT2xjpHYXaAp5OUva9SbYgVuu0oiYoM+AAxA7NHX9WG+opQr2n8GT
 BBgCwyblv7OyMzzHHP7sE+YGyzgQftV04rN+gFA2V/cAyXIqQMakMPmxeyOVyPDgDUdY
 16Bmo0WvTnQczXlQF0BNnBYkqJhg/8SdyecWxEe2MEe3/9wFX/c6/BfNSFMW1jBKuRkw
 2nCg==
X-Gm-Message-State: AOAM5332qHWBmZuZUeDt2gBBo/olKZh8go2FXXTk0Wn9iwmLpdXFVK5h
 WO0XwWcDcuY/Z+dgNSOv5j6dnA==
X-Google-Smtp-Source: ABdhPJwXjeDLbMbYVW6fYTxzvgg2sf1oxHDUYlwcNvj2ok4/I9+uItght9lMpiSzEu5pFYc3mBrOGw==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr68615165wms.175.1637063198772; 
 Tue, 16 Nov 2021 03:46:38 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id z11sm16934698wrt.58.2021.11.16.03.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:46:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/3] ASoC: codecs: wcd934x: return error code correctly from
 hw_params
Date: Tue, 16 Nov 2021 11:46:22 +0000
Message-Id: <20211116114623.11891-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
References: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Error returned from wcd934x_slim_set_hw_params() are not passed to upper layer,
this could be misleading to the user which can start sending stream leading
to unnecessary errors.

Fix this by properly returning the errors.

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index c496b359f2f4..4f568abd59e2 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1896,9 +1896,8 @@ static int wcd934x_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	wcd->dai[dai->id].sconfig.rate = params_rate(params);
-	wcd934x_slim_set_hw_params(wcd, &wcd->dai[dai->id], substream->stream);
 
-	return 0;
+	return wcd934x_slim_set_hw_params(wcd, &wcd->dai[dai->id], substream->stream);
 }
 
 static int wcd934x_hw_free(struct snd_pcm_substream *substream,
-- 
2.21.0

