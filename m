Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1646130AD
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ECC31671;
	Mon, 31 Oct 2022 07:47:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ECC31671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198895;
	bh=YMOtPkOlPZk8uyFF900L+p9YhZlveegjIkZ1s2ts3I0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMcGTxTfCC1BIUuyJ0M3EBaALbDfotZpgqRky9ixRVUUEMwvBUt28n5QvGhjOkw28
	 cZvlsM1iMPlDS1xeqU6h0xs1517V7w92F2/51FDr/bQTCtQp9LsgEroSaqWdN4E7i9
	 cxsSmNETJuEiGb0x++PUMuPar0KjFZt76lsMo8xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A51F8056F;
	Mon, 31 Oct 2022 07:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D65D4F804C1; Fri, 28 Oct 2022 17:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD05F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD05F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="A9tM9pd5"
Received: by mail-ej1-x632.google.com with SMTP id kt23so13685681ejc.7
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWOXtZdeE7MXcWYkV9UqH7xJWnsDsrChaSh5X+0ymME=;
 b=A9tM9pd5l2CdvVGQhJ9hSPryXHIi3u3k5PvNLdLItJWafLR3Mz9QQCXpsQJHcYDxY1
 1GpOIJEHJpegytu5MENt44AgAUdDFP+h7HObOzqEd1gASFiK7tCocoQnyDsnYYlX4uUG
 0G/JXcIRm9pLLVRiDrN+bICu8NFfvCqar3Ifkqm8Pin7Ezm39JktPAuTD6B+5uvn8pET
 pqcQN46LVvX5NJMDwHLGbHxgibD3+cYVR98HaGPcImq5eSXXYxYwBZPlu+HiMEXvgVoH
 3Q9/NV7S7yXI+M9b5X5rmf6CiBDS9VxDApVoIjzcGmz8AB+c1NsPov04khEdmo5u5J/s
 Zu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWOXtZdeE7MXcWYkV9UqH7xJWnsDsrChaSh5X+0ymME=;
 b=1XmtH/n6/l9OmVUVhhtxcQfX6aBJvkvtqDpZPO5BL+c1DF4OiONe1hiQL2On5FqttM
 QoLr8pYd3VpcDAeYxAECJcLevaO1okGwm0zTrsmoX8sjV5jiP21IHYOVAF1WSAviqPS+
 xS3u15WmsX3HytK3djjWGMwdp7OmoiCjs34W8ZYEma1NNcVZZx2j8pqHPEJdZDOPiy/z
 N8dr2yiRa85nFA/dhgeEXgDRe5Z3c+bz9Q+V+PTc/q8KZQXYCGcTPr9Pdo/mr43rpKc7
 6cW1v+IhtNr3I1v0c7VKg5l4xzawlceM1bVM0Iy5AoZo8bqJrBhhaBPZ0CSLc2YzaR6z
 eBmQ==
X-Gm-Message-State: ACrzQf1HQ+OGra9QaOQa04zt3FfaGiVjUqlr567Pz0C9O0+7NJ6iWl9y
 6CxeD1m1TBdIf1pdQfaYnEwceg==
X-Google-Smtp-Source: AMsMyM7s4zQhZSZe0Gwp4o8LLInXxkJAz9VOMp7gKPhy4+xNy/Geo2aAiMWI5r+csh+Y04c6Ix2YwQ==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id
 mp31-20020a1709071b1f00b0072f56dbcce9mr46674745ejc.605.1666970812645; 
 Fri, 28 Oct 2022 08:26:52 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906319100b00730df07629fsm2349839ejy.174.2022.10.28.08.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:26:52 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: adau1372: add support for S24_LE mode
Date: Fri, 28 Oct 2022 17:26:24 +0200
Message-Id: <20221028152626.109603-3-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028152626.109603-1-maarten.zanders@mind.be>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linux-kernel@vger.kernel.org
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

The ADAU1372 contains 24bit ADCs and DACs. Allow the driver to use
its native mode which uses the same settings as the current 32 bit
mode.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/codecs/adau1372.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 00d0825e193b..6b35981c8777 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -662,6 +662,7 @@ static int adau1372_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		sai1 = ADAU1372_SAI1_BCLKRATE;
 		break;
+	case 24:
 	case 32:
 		sai1 = 0;
 		break;
@@ -699,6 +700,7 @@ static int adau1372_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	case 16:
 		sai1 = ADAU1372_SAI1_BCLK_TDMC;
 		break;
+	case 24:
 	case 32:
 		sai1 = 0;
 		break;
@@ -869,7 +871,9 @@ static const struct snd_soc_dai_ops adau1372_dai_ops = {
 	.startup = adau1372_startup,
 };
 
-#define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
+#define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+			  SNDRV_PCM_FMTBIT_S24_LE | \
+			  SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver adau1372_dai_driver = {
 	.name = "adau1372",
-- 
2.37.3

