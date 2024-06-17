Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A190A97B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 11:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A16ADEC;
	Mon, 17 Jun 2024 11:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A16ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718616282;
	bh=xervD/akNAn+3bajOSvxHM3QVMxTAKhY2J5D0oWTDdw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qWq2URkCjcmH3GeZylnqOLNMF7omLInwZHEJakFiwyJ+rEf5hRLP7PxLyxfR9RLvU
	 JjEe6coGv6NzVPMmNLImu7CXz14k4ploolNLPm956QIZmh5J8o+umjtLDszIaIa9XS
	 s2qxovnQG8AlEAYZL1XP0re2ey9fVHEMhz0V5Zi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD4AF805A1; Mon, 17 Jun 2024 11:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C579F805AE;
	Mon, 17 Jun 2024 11:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73DFDF80266; Mon, 17 Jun 2024 11:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05357F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 11:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05357F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vSQBdbon
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f1cf00b3aso638749966b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 02:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616115; x=1719220915;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AL9vCWb26ggkgGLF0K/9fugVAtzgFV6EBJsc+Ci/VT0=;
        b=vSQBdbontboevN5m5s7ofd/aNJL9KKeMDd+E5B955u+492uQ0ziqKtEnzPpmhk0y/U
         V2M+y+abvSLl6LTJ5OClKtMFrLnbdkQ7UirfdU2w8K5wHLBIdIvtBMcBYT7D8DbhumZ3
         BmcU6DScyDJ8Zd15zLnnS8iHFhIUCTBGarGknZ7pGeAGrKIHoZpsYLo371GfHhOaw8H7
         iltB449jnX435NHCAzo3yr/a+lfM5uPUPdr5ENW26xZ9LRCqvGvueYjZucstygdxpuKV
         UKXLa+bE2qRhld7PoTVU4O1V0e/BIzbaYcOujInEjUliqlynN2Fadev1JJ1G6KZ2o7nZ
         Smlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616115; x=1719220915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AL9vCWb26ggkgGLF0K/9fugVAtzgFV6EBJsc+Ci/VT0=;
        b=owj2xqOm9w7rorU/3hn4I9bRJDxOzhYR+8MBEI6o9Lrw4oHPErar3oldbuP3mzjvn6
         5pBS/8psv0tKolae/qg9wVIvb+Zp9IiS2DpPBJ3+ONb1bq4dMqULc+0g9/fOMKlJAvBN
         cHa35fXmLJfOY+N/B8PyCj2Hu+mmWB0zXWg2yo3L8GBCqBfEZ0lfwbqKc7RtQDDFm+HD
         Cw1h+CIwbh0dWCYHAnWUN5SEhG/Ooo8qJAV4jgQ0ca4LWH2/ULj00E4oumrmcoR55ZEd
         X1sUN8PxR9eeEFCZDn5dj+GD+DsdAfYNPZrk5buvmnkjja9yU5X6Z68t0VmMV3t3JWad
         3Ibg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv/1gRH6KhcxNX92xEOOUPWm7ZFlvEzEeVcktD54me50wytcElgz1qNC5GYmKCkTVy3nh2RmY2CHPR0/uwSwfUCKPONui+rAQLRUc=
X-Gm-Message-State: AOJu0YzGuUWK2ZGzusIZFqz101DtcQmje8BHJruMhuJsUNkUdno5PWcg
	52I2BClYLCFeyd79EchiN3xPuS5tPlgbq9CGlcfPMIjRIy31x92IBVgaVz27Y9Y=
X-Google-Smtp-Source: 
 AGHT+IFLPbl4cACD6B5wyibfTQu8bh5NfSr1rfSOwZYEb5WkGOlYQmmuS5S7vCodWDvRJd2pyBRJcg==
X-Received: by 2002:a17:907:b9d5:b0:a68:b159:11ee with SMTP id
 a640c23a62f3a-a6f52403808mr813822266b.12.1718616115319;
        Mon, 17 Jun 2024 02:21:55 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed359bsm497944966b.137.2024.06.17.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:21:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: soc-dai.h: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 11:21:51 +0200
Message-ID: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I5RTIWPXEOHEEWZNOJPQWFALIXB3ICK4
X-Message-ID-Hash: I5RTIWPXEOHEEWZNOJPQWFALIXB3ICK4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5RTIWPXEOHEEWZNOJPQWFALIXB3ICK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The core ASoC code does not modify contents of the
'auto_selectable_formats' array passed in 'struct snd_soc_dai_ops', so
make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 15ef268c9845..279223c4ef5e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -361,7 +361,7 @@ struct snd_soc_dai_ops {
 	 * see
 	 *	snd_soc_dai_get_fmt()
 	 */
-	u64 *auto_selectable_formats;
+	const u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
 	/* probe ordering - for components with runtime dependencies */
-- 
2.43.0

