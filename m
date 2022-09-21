Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9E5C006F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 16:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF64AE9;
	Wed, 21 Sep 2022 16:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF64AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663772138;
	bh=oJOuHrxywHMbUCBBhcRIEynsJS0qMOBFajLV+Bwt9qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuTzdyRGao0zeKSAkiFbbr330Ps9mmOZFi19iAJYkSeyBVNZoux/f7UcNOKlAzWUf
	 HrFhKsXDBoOzNsC81RLRHl8SP7dRF5l42rV6qrV3NY6IY//YvGknJHjKicBGUT5EPq
	 QFeM7FJl63xxA4s3Gnv32Oq1lD0QTe1IYR9Ow5Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E35F80538;
	Wed, 21 Sep 2022 16:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A824CF80425; Wed, 21 Sep 2022 16:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E81F800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 16:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E81F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lgpK/4Ou"
Received: by mail-lf1-x136.google.com with SMTP id k10so9651772lfm.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3xh6qSfnk72aIq5PPq1PboXWTaapoBlxdPaCgFLtKR4=;
 b=lgpK/4OuqSfkaiYhGhtq2E2966wSCB2Sl2SOz4WjFcJb/C/JO5oJjSqfOEpeVKbt80
 WMtMs7hpEeXbSI2tLBpX9gEofcY7LnfnaHatInklDKx0rzBRb8U2Lh9G6s42p5b6XlXz
 sh4HkV+KPh1sJNaVQhH5/YZypLKXpnyEgqEVYoLlaTHDTZG48XyUKLcxdlhBO13Ljpuo
 gt4WXXyALNuQzPooN06izrjfYigYAhusPXz6Ro2cLW2vYRqYrBmP9ReGcDEQnqeez05U
 Lt4MpKtRCB2laihvVk1I4z9xhVeh96q5jh67AOkyjFGbqB/6o8m6BVQDq2O8+juUJbR4
 rqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3xh6qSfnk72aIq5PPq1PboXWTaapoBlxdPaCgFLtKR4=;
 b=bEwrAu0f87jT6/MZ84FSkBwUKHA+TQ3O7yHvnQYKiI0OmZOOwnoFujDrbRFzUuGOzx
 m0ZmqrMHWjRyu8+sk4iSIHpmKEAx71SHNThGfobstL6Ub9/z0Z5cccYj1ARIWwzYbgAi
 SIOdqKOeQe35DBdruyyCfPhpfaUf8JYJh7jmTT3zausvjuW+ewQtKIj7wLnDFVnwGzWq
 q31obOXoidEvujoYE5PQxMRSDtUqz7Rw1qEZKUr9cDBJDVUGH/qdzGIkfZ1y78uDP6bg
 zXWCzKbUGKr6NFiaPSV5xfNY0Lw8OF5YwEs/eumZuB6c/3KxRsIKCLZC7oqR1Pzrd8Nb
 G2sQ==
X-Gm-Message-State: ACrzQf0YUciebw7gv0YqP3vYs/OAOV3N1j30mQQsubgfUSbbkLm7U+NG
 cUsE2LyASSdizyr2DjHSI3fWhw==
X-Google-Smtp-Source: AMsMyM4iJNIrY+YOXPembYGou4Yel/GzNQeJh3rqW/SiaUkEjZsRJ/PsN9t8Fdy7GfD/l5rRB6FiiA==
X-Received: by 2002:ac2:53a1:0:b0:49f:6086:4868 with SMTP id
 j1-20020ac253a1000000b0049f60864868mr8245124lfh.518.1663772043369; 
 Wed, 21 Sep 2022 07:54:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a056512075800b00494a1e875a9sm461981lfs.191.2022.09.21.07.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 07:54:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: wcd934x: fix order of Slimbus unprepare/disable
Date: Wed, 21 Sep 2022 16:53:54 +0200
Message-Id: <20220921145354.1683791-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
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

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index f56907d0942d..28175c746b9a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1913,8 +1913,8 @@ static int wcd934x_trigger(struct snd_pcm_substream *substream, int cmd,
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

