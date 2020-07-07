Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A6216F61
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648E382C;
	Tue,  7 Jul 2020 16:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648E382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133612;
	bh=n3zWAvEiKs24KPS3ygF4mWRc5qP7nr5XK3QBPFEFg+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S07txuqyWF5tIvGYEU0RZjCLQQkv94pGJM2kiKAJl1eDfWetfRlfElylnoxSaB0oV
	 x/LX10n9qciEwqsXg6lyBgmCnIsrTmgcQ77AzcXT5QXVqNh4ajV84bZrI95N3VEyo/
	 EXIEOhtqt/Q1wHw1/cxNkrknugfLG4Qf4SxqCNVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B19F803C9;
	Tue,  7 Jul 2020 16:38:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD5EF80369; Tue,  7 Jul 2020 16:38:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01FA5F802F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01FA5F802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XexzV3KJ"
Received: by mail-wr1-x444.google.com with SMTP id s10so45358658wrw.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4/atXJGhj1n0uTQI5cYV/gQNs+sjaOZMgJsAAMgfWA=;
 b=XexzV3KJ/Ugols+x89JArM434s7OMKFDWfksKXZoXwvRPrZMNSE+f1ahUBOak/G6cr
 Keb/Ao22IP697YEQuWmJupSw5F3K/5J4cfUmQ5Fl6aUnL1sST5sDk+u40SDimh/L/lCl
 of3/5TIli6NqTueNigm2UK09ss1j2CEvGpCp00FM4lCEZ7IoFQqsuiKaRVlDj1P9gSLK
 f2gWtR8gu6UZJvkilbAYzBQtLrjTrOV0JNNHsHbp1W1UUPujKE+2HaqwnrtxfyY+9ffT
 4Mx83dlZKFZ5StSTuhzRvUYOKDxMDqDEH3Z078Ltg9OM3w6VVK9I+0Blditu6KMrKP4B
 FRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4/atXJGhj1n0uTQI5cYV/gQNs+sjaOZMgJsAAMgfWA=;
 b=Ji2/sDk7An0W0Qb61uRCe93PSCEwzovQy4pcEoy5KnxOzIv+YF5O3de87i/6V91HCq
 KQ3elZqqTOw5jrqVHbSU9dxO30h2mkyV05wFAmio9IqwjgmljPaV6wTMFCot8gBZY0G5
 ozLj0VkEpAZzPZdC6U/uXbmlEAKRxfC+24mrbANi+OwypQQfgwKL1f6y/svRM7DDRsCw
 SWU0Vn05Chdc3UOyTqS3eEOgoUHfXus4my2x+O4WQAaiQUM2u4oVud4tZHB5ctxQdUyD
 bBFphRqkvxhrsJWpcq4GUfvsTaNv09xbEh1MR3DcDmsrsLykMBHpBEROXyjkxvX6Hgh2
 l8YA==
X-Gm-Message-State: AOAM531LEtyo5ckCWhpcdQGLqyzWCbMTrKLl+m7QQycNtAiLcptUh1dQ
 syrvp73509xs8AlkLx9wetNt6A==
X-Google-Smtp-Source: ABdhPJwUIuU6BxAOBk4GhOQGfCgIR0VqwtdE96hRGr8Pp3rz/+R0BNo2yo13BD/FqfNnN+jvPo7jQw==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr53340540wru.411.1594132700570; 
 Tue, 07 Jul 2020 07:38:20 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:19 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 24/28] ASoC: codecs: jz4770: Remove defined but never used
 variable 'mic_boost_tlv'
Date: Tue,  7 Jul 2020 15:37:38 +0100
Message-Id: <20200707143742.2959960-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, ter Huurne <maarten@treewalker.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Fixes the following W=1 kernel build warning(s):

 In file included from include/sound/tlv.h:10,
 from sound/soc/codecs/jz4770.c:19:
 sound/soc/codecs/jz4770.c:306:35: warning: ‘mic_boost_tlv’ defined but not used [-Wunused-const-variable=]
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~
 include/uapi/sound/tlv.h:64:15: note: in definition of macro ‘SNDRV_CTL_TLVD_DECLARE_DB_SCALE’
 64 | unsigned int name[] = { | ^~~~
 sound/soc/codecs/jz4770.c:306:14: note: in expansion of macro ‘DECLARE_TLV_DB_SCALE’
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: ter Huurne <maarten@treewalker.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/jz4770.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 34775aa624024..4dee585761c24 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -303,7 +303,6 @@ static int jz4770_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
-static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
 
 /* Unconditional controls. */
-- 
2.25.1

