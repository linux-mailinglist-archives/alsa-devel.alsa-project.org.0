Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCD97725
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 12:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18B71654;
	Wed, 21 Aug 2019 12:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18B71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566383368;
	bh=QWSDgO78PRJssjkE5oGZsNnhw5fNvL1ovksRf2gRHXk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HEMI68j1IdG4SCeWfOOgJvb92yzpY4IOh7laOWDDQY4346f/xNdUWrovAvjjNDFYQ
	 4SendefYwa3SWY/dghksVrxmo5Ym1sSF2ZR9tdzmNJPbEWMTPakD6Tq9hfXj2WZ+0b
	 oH2bCF/S/VTd6mz2B8qwUUj3FRiTkuGpcPXzZBqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1457F80308;
	Wed, 21 Aug 2019 12:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23CFF80306; Wed, 21 Aug 2019 12:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98453F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 12:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98453F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dEvzziXb"
Received: by mail-wm1-x344.google.com with SMTP id f72so1535987wmf.5
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfcFoGCu+Bqv0m26SvG5wMf49FCbhYgNKFtc/Mu7ArM=;
 b=dEvzziXbyDYjihHBHAQ4og/g6Ul+JzM+1X3WiZ89KPRoO5AfTMcUKgbTjavvmz7+CO
 Mdl5Hq0ZNiWwCuznT9fT4WPGFNLthr/+bIK8/Tns7fW8NXKl0htemLGe87xYMmtp370V
 08UAUrkyuCQ8MuatWKWGV89mJ+b7XPLIQUF2gLDsNlHRayxNHffm6CtrEeynf6a2/E0C
 4ooE1iftKfXqUkdYU+RMGlm8/NZLU4DRnAjbhpUWrqF4NfXaGyOyYAZ13pD/xyDjKWPj
 EBO56Bx2nVKiVj7Vfb3d68rHOjPG/lK3IDWZS4FQeT5yiIjAJrUKBWafViFlOTIi5H8k
 SPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfcFoGCu+Bqv0m26SvG5wMf49FCbhYgNKFtc/Mu7ArM=;
 b=cDvJs+csTJfA7EULaETyS61ZJmiEh92TZPSJ0HCXCra38SFwRkaS+kTDbfJD846hwE
 JOyHmpOdrnJbtRZjOZ0NjK+j5NZ4Ys8o/tmq+OlRblHvNH9k4Uqsbfblk3QP10jN+Ty3
 T6UTZujLOeUt1oNzpZL1mGHOSyp/koKtlzP5ytQ86yx8sGbmg2vHCgpRHu5pOmAAhQI8
 DrbTAJg2b4SAYCt6ZMNogPpcr8xlle7G3u6JyknyMPLwBercomQw4uAApXHFP6ArpmKJ
 J9tYJ2PQw1CxaZLdGxWIqwg+xcCfE0UQe8Ulzj3Cb4Qsuo2JbknzzyZqUxAkW9kLGLan
 i6gw==
X-Gm-Message-State: APjAAAX95cS+knGRM0//n5RhOOiPykqvSks95RlixGLTYQXe/2XYYuNT
 uo6HUHobKanWL/l0BE/sAQ5/vg==
X-Google-Smtp-Source: APXvYqy4ImYkCTgqYv5UHwmc2VUZxv6qDWNrqq312b932pdxf7IsrXoWsMHBZbM4Y0whtwt6pa1bkg==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr4928650wmd.122.1566383257348; 
 Wed, 21 Aug 2019 03:27:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p186sm3475079wme.9.2019.08.21.03.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 03:27:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Wed, 21 Aug 2019 11:27:05 +0100
Message-Id: <20190821102705.18382-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Vidyakumar Athota <vathota@codeaurora.org>, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH] ALSA: pcm: add support for 352.8KHz and 384KHz
	sample rate
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

From: Vidyakumar Athota <vathota@codeaurora.org>

Most of the modern codecs supports 352.8KHz and 384KHz sample rates.
Currently HW params fails to set 352.8Kz and 384KHz sample rate
as these are not in known rates list.
Add these new rates to known list to allow them.

This patch also adds defines in pcm.h so that drivers can use it.

Signed-off-by: Vidyakumar Athota <vathota@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/pcm.h     | 5 +++++
 sound/core/pcm_native.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1e9bb1c91770..bbe6eb1ff5d2 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -117,6 +117,8 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_96000		(1<<10)		/* 96000Hz */
 #define SNDRV_PCM_RATE_176400		(1<<11)		/* 176400Hz */
 #define SNDRV_PCM_RATE_192000		(1<<12)		/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1<<13)		/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
@@ -129,6 +131,9 @@ struct snd_pcm_ops {
 					 SNDRV_PCM_RATE_88200|SNDRV_PCM_RATE_96000)
 #define SNDRV_PCM_RATE_8000_192000	(SNDRV_PCM_RATE_8000_96000|SNDRV_PCM_RATE_176400|\
 					 SNDRV_PCM_RATE_192000)
+#define SNDRV_PCM_RATE_8000_384000	(SNDRV_PCM_RATE_8000_192000|\
+					 SNDRV_PCM_RATE_352800|\
+					 SNDRV_PCM_RATE_384000)
 #define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
 #define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
 #define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 703857aab00f..11e653c8aa0e 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2170,7 +2170,7 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 
 static const unsigned int rates[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
