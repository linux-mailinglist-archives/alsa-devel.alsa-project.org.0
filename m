Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBB22101E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 17:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F08A1669;
	Wed, 15 Jul 2020 17:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F08A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594825341;
	bh=MkQbC8Sxl8WbztTUL2piVTrFCw6mSTRFm+RUOfTchJg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BLnsUY9zSnt8QPmD+6IZSfTDAggf7xlf6wyBiole7RceX1xA6hsAnGHTAfR/+1wCO
	 w8VfLQgnjBnYLJIOdMpHaiAokC9290qS78dP8+qorz5Ole785rEp/qB1zg4e/YTnTS
	 3/4xOlfSnis4yVKicDYpPsZ/JZOKh+ry4ipnXVEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A140BF80227;
	Wed, 15 Jul 2020 17:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1FBDF8021D; Wed, 15 Jul 2020 17:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B9EEF8014E
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 17:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9EEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ry5LXTgb"
Received: by mail-wr1-x443.google.com with SMTP id z2so3095576wrp.2
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wqhk2njYGDUfvoMiCydF/NDRZ8ScZRwPRcCbCDujnE=;
 b=ry5LXTgbZguG/UbPzILmwKElT6GKBM5G62IceUKmo09VsGFygkrWJmWgxzQz76lEEo
 aLHL0cRraTsvdR/LF9LWJh8Nn97hMd8kAe8V9KrkvSQGoYDADP9sdQKyeuHqyLtMW4qh
 xxC3Cnlla8Xuh+J+2Lg6qknxvSzDUmlnLcpzBN4BMNtxp93AaETvkOjg4W+MEghbT+K7
 tMs8rXohsO3OmNxtnH9BrwkubgWjHesAcsO+i9SHL1vDvXB7M0P6atXH/VLCHaczu1dw
 fgFRit+KR6r3mQymLryq7vEcRXyldu5TlPdyPtlwAmp+O+asuZpqZnvlkaJrRexOm/PX
 RDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3wqhk2njYGDUfvoMiCydF/NDRZ8ScZRwPRcCbCDujnE=;
 b=OdEo9Q8ZQilSFX+EMD+DmyoBabhsK1E5jD3x6kYaYKR2EXkU0g3H6orToyIIRtIjs3
 Ye1GyQ8zWpqH0Nnax4uC+4j5mfHTqO6ugDoUS9NeCMeNw2sbwEQtUXzoKfeZYZd+6vv5
 f51bk6mRXyhtuPM/IcPeANHnwKTz8fdKFEpEj+47PwAGo7ZsuktVG/T7fBr+BfqqEFbL
 7avzaLBr3aRBPpd4lw37sl4YYHAAANYHdh7BDJ45SpTkpRkj95NX3SmRumBH3WUwLKUP
 KAL5TN//CnyQ4GwX9fAoNEKB1LukD3hy84UA+iohg4Cjm9EkxiuHKBXuUG6fEI2Vx3MU
 X4mw==
X-Gm-Message-State: AOAM532TjlU9Iasq3+AkDeHHzLWNGyeLjVkgTV8UMO5/lcxYJoThwmxY
 3TR1gMPaCLaYU6p4uZdbe90LpA==
X-Google-Smtp-Source: ABdhPJwl5O0qynyiyO/vc5c/ivb3JgK51iUfxXzUA/hJSpiRsmDsyxdWa2OMgLVTth8tM/eUlUgRIQ==
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr12567153wrr.226.1594825230041; 
 Wed, 15 Jul 2020 08:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id l18sm4007435wrm.52.2020.07.15.08.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 08:00:29 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [PATCH v2 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling of
 'exists'
Date: Wed, 15 Jul 2020 16:00:09 +0100
Message-Id: <20200715150009.407442-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index faac6ce9a82cb..dbacdd25dfe76 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -92,7 +92,7 @@ struct fsl_asoc_card_priv {
 };
 
 /*
- * This dapm route map exits for DPCM link only.
+ * This dapm route map exists for DPCM link only.
  * The other routes shall go through Device Tree.
  *
  * Note: keep all ASRC routes in the second half
-- 
2.25.1

