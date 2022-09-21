Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395A5C0069
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 16:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE4B15C3;
	Wed, 21 Sep 2022 16:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE4B15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663772110;
	bh=Xo8f+aQDM8SYXU7JSdKGodnPpGeKP1GdKSj6ZKodQ4M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dLXKthtMSLrz7NB473pnSilA+cAbwdPWopaoP86x/hmD2/sgGqsVrDdhYGUDnvcfG
	 5OgyxdhBnGJln/ASln6ZnEnUhrUmAMoEJUDo6swdBeKJHWGguQZLRewSaBaNzEjt4Y
	 ZkUg56X/oLWDyA/ZgCTphFb6SzqeDID5Sb4a7fj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1387F800C9;
	Wed, 21 Sep 2022 16:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AF4EF80425; Wed, 21 Sep 2022 16:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AD60F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 16:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD60F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F4Gm9tI8"
Received: by mail-lj1-x22f.google.com with SMTP id b6so7298220ljr.10
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fc9rvJk53jSt+31V+DshEMPT99txfYe0aFmQRodV1Rk=;
 b=F4Gm9tI8bRPXoj3MXzslfn42dKJ9CgrIkN+dQlksRQKb2QLs69cZEM0rHakPqe4mcu
 up6+zxUBsLdj0T2BXHtQdgNVXWrMZesU27ALdOMc38XiOmvh5GMWAC5cVSVz6SQoxbx9
 ZHMwDp3ZjpbkxgL3Hxq5EkIXlZv+d7pbZO0ynDSDGWqWBqJMlLYB5xOqcgu+XpcWT7Tb
 GbabFZlH0rtEyW1Ee0eaC8P1Q9vzWucAf+hZuTksj5oB3Ahjp4C3kNIVxKgVbSTrPY07
 s0+uJlvEYH+Sy/8Bk1JCF1/rZB2P5OANFbxtBFwA0H4bL4bblkOrFgtEwL8LlOOMI2/R
 Q8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fc9rvJk53jSt+31V+DshEMPT99txfYe0aFmQRodV1Rk=;
 b=8EhA+DifpKnm6+nxelZaFtrna9XmaMGuP+9ERonCFLiDiUWY5jqN+Wcm1B/36ZEPy3
 Claf4hpoTlXtbCf6blrDxTKX4GpJ1BT/9BVFC0V2e9PbGOavc7flo8fCXLLN5ytLDKdX
 Y3g9LKPPOQLl8pGgW0qxpjiy46ZT7rv2d87wOc/egvWre/8PeWNatNMxazFa2LcocPbv
 iI0NKuD2kT6VvgVK132jLO4T4LG5Fi+zMRoeowcW9OaIb+N+pRtKnYF99ZAhgI1vhvyY
 a/2TbSa/FWMgEIJZYXJGZTkYClFKYF/cbdXF/38WISBB3B4LRpo0E7noYZVSsIK+WqM7
 Z/GA==
X-Gm-Message-State: ACrzQf2rhn7UEpDKzUpIwO7nG526i04k/HOYaNFV1AP0c5EG8uRsfxEN
 YJNYaJrUO6PG58kYWNTMOgu6jA==
X-Google-Smtp-Source: AMsMyM4tHSgnHedkMCUmL9LyyL8xnzoHnFXiLsg6lWP/gbuPqkGj9AKlLPlXgXc33q+Uy5gjk24+AA==
X-Received: by 2002:a2e:5344:0:b0:26c:417b:aa78 with SMTP id
 t4-20020a2e5344000000b0026c417baa78mr7614255ljd.298.1663772042208; 
 Wed, 21 Sep 2022 07:54:02 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a056512075800b00494a1e875a9sm461981lfs.191.2022.09.21.07.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 07:54:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Date: Wed, 21 Sep 2022 16:53:53 +0200
Message-Id: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
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

Slimbus streams are first prepared and then enabled, so the cleanup path
should reverse it.  The unprepare sets stream->num_ports to 0 and frees
the stream->ports.  Calling disable after unprepare was not really
effective (channels was not deactivated) and could lead to further
issues due to making transfers on unprepared stream.

Fixes: 20aedafdf492 ("ASoC: wcd9335: add support to wcd9335 codec")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 06c6adbe5920..d2548fdf9ae5 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		slim_stream_unprepare(dai_data->sruntime);
 		slim_stream_disable(dai_data->sruntime);
+		slim_stream_unprepare(dai_data->sruntime);
 		break;
 	default:
 		break;
-- 
2.34.1

