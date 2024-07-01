Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007291D93A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAD2C22CE;
	Mon,  1 Jul 2024 09:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAD2C22CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819721;
	bh=Ad+uKCGSDe8rakMGGeF23SfGPaAfcaquc5R5IIxLKwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C8WtwpVJtEDZAUjVgjGOrecI2FrpE36Oyk+VpnE9KhEc6w0X03qJ6ZVqUsrr0Qa12
	 ekSX/dsNJrKUMmf9jSZcVGpCzgS5IqLdi7AmU8pSrwkK48/AanPEsGu1vFbrdPG8ae
	 w487nuEKp7M+8qEy/Ax/LbyD384BeTtoSUPZk6Ao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27298F80690; Mon,  1 Jul 2024 09:40:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6131EF8068A;
	Mon,  1 Jul 2024 09:40:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 848BCF8061E; Mon,  1 Jul 2024 09:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F59DF80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F59DF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w6ygUhaZ
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3626c29d3f0so1354588f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819591; x=1720424391;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PicI/VwwrTj8z258jc72WwlXuJ32jmr5AxPeFVRGEyg=;
        b=w6ygUhaZds8FA+PzlmBT73vHykKtbBf04fDE7fCHuKcCXN5tGrlO3lCA7ihfFG35j7
         3H0XcegPKgQmwjsBPe07ZGTkziHf3AUPTTaERz5CkfIRMOHUKkg83giGnwqAwi0GFeqg
         CUAqOHxeJm9tIpPkOInbAoGUFKdMxHGAHublPCGlub3JzfL9LkDgbjyVtK6x1CdIZbtc
         T5WHD/X8nuQEKhqMLp9OOd39pCeLeewm57szprJRodTNBR1RSZVVHvLvmn3AVd8yh6/n
         yG3hp1cay52o0ieb9v48+cKCPPOQvJsMIJpFhXNmlOxBGpekkuCkRMFAvbv3Lu3h39l5
         7huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819591; x=1720424391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PicI/VwwrTj8z258jc72WwlXuJ32jmr5AxPeFVRGEyg=;
        b=ptfecYpy7loXCqGIBFBxBPj4hViWdO+i8pPX3E5gMVkI1gw/CR88vKbJT/Vb6UydXV
         uFrrLS+mq4a2ycruUlagp04i4+XAIv/xyuNxXvnJsLfSkn1QJOPWt/aXV/KVDvS/5Oon
         yspHch24ZrkQI1AgVOw80+RltOvw8E3Dl6c8KHUyg9mgKkqUz8cH8BZhRt+s2AnagXLj
         lKcS6XG4gO0hMDiMwKqSvSgPU1o+lgpGgK/PLLEEhC2+MRGJS0/2Q4fyAlbVJBwRJZ/H
         e9zzOeG4uSQ3hj6MpcJkmfXRCuUCfzTc/G4cCeyQ53m2qW4KIP7muhlwpEWhj2JKvB8d
         y/0g==
X-Gm-Message-State: AOJu0YyrUtuAnlvrsXKLB4iAoAwCQZZkua7jXvwrQsjy1GU9rvGxT9Mq
	LBLfYsHHIvgU+R0J5rNEBBJKypUVnIxUTPq98vnoljNlxJ8O06IojrmUVyKWRmo=
X-Google-Smtp-Source: 
 AGHT+IEbIUXccj8XAr3Pi+HR8BNf+tQNrJrtODvTWFS72V0zOXk9wxPAEE6XniRcWyYY2+RnDUWHiA==
X-Received: by 2002:a05:6000:400c:b0:364:d2b6:4520 with SMTP id
 ffacd0b85a97d-367756233bbmr4242423f8f.0.1719819591373;
        Mon, 01 Jul 2024 00:39:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:36 +0200
Subject: [PATCH v3 4/6] ASoC: dapm: Use unsigned for number of widgets in
 snd_soc_dapm_new_controls()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-4-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ad+uKCGSDe8rakMGGeF23SfGPaAfcaquc5R5IIxLKwU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGaCXT6gS/qmIwhhz3JQvaEtkfOrO61QWr5ln39pMYOi8vd+e
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmgl0+AAoJEME3ZuaGi4PX1c0QAJl5
 DR2okgESZi49MoN1Ws63ZWEeEn6VoZVEJIgmLYJqu4xMAtfgzvHKeFe7GnlgFOmu2GKIualxJc1
 tzvu+9iOUyYkxvUojTVjT4obSTdZSPt9VJ3rIpzjVb4rdHhl7KWJZH4wYjBdAeydnGVn6KfDrpd
 enKKdUpVAQqwA43A5iZjoYYAq8E2UXS7swMDEEEAhRrAgJMoGDQOAijNlXhllzpVg8g0LfmVIMe
 UG8mSyzUSvUSyTe6dXhqjxsyxmnIPfJbPoqJF2+O2gE4Gktz/mQgcoCApFJ1GWdcGX1vxyO1edS
 Lamz3HAGA4xqNxzZdM3ByU02sOh6C/d8vCy8VZlmkVvfjOiZrIVmSFHmWsEUEUtDsb9HOnOytIQ
 edwPxJ5xtvHfCiTVib0RmgWEaOmvpouSSS7LTBNG5swGHpKbXB3VugNyxCTLR7LQavVrFf8IKC7
 Vbyd5YTkrXrBjGYk8rC0DLlYxwepXDkOqsa0POpgjUVQsXAUIjZqPzs7xUx5pQh1CMAuPLq2u7W
 iA0WvmVzvWJ6YvUY89jXfYfSJ2dEnzPZ8hNqYO4cEX6+5oABVfL2FLtz099Y0cIc7m27rTy1+Zt
 EJoAegi1dzQhXviE9pWxufxXV3Ryb98d8lEtauqgWVgJ4uvCm7EmT/onJU24R7dUcIcFyAhBikV
 YpnPf
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WAHCMSTBCC6FZW5QUXHLWL2RLU55D57J
X-Message-ID-Hash: WAHCMSTBCC6FZW5QUXHLWL2RLU55D57J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAHCMSTBCC6FZW5QUXHLWL2RLU55D57J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Number of widgets in array passed to snd_soc_dapm_new_controls() cannot
be negative, so make it explicit by using 'unsigned int', just like
snd_soc_add_component_controls() is doing.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 667ecd4daa68..12cd7b5a2202 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -457,7 +457,7 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget, int num);
+	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16dad4a45443..32cc90d09bc2 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3857,7 +3857,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_new_control);
  */
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget,
-	int num)
+	unsigned int num)
 {
 	int i;
 	int ret = 0;

-- 
2.43.0

