Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89083905856
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A269A950;
	Wed, 12 Jun 2024 18:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A269A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209051;
	bh=44SvPncKGed5222crY2QmWyS1bBJY6ITGdo0S3bUKlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fYFNrZQIwEqgAIbdn5nzo2qncRUpLbzoSTi8bmwTcS8YPskLEmYayC8zP5p+tnbCk
	 zfWQhr/9OD3TncOrfdMy9juUPddqeFWQABPdVMqVw1tTl/xOQ7PsRKh563/qOEjAFv
	 aZQCZybnTPXDMW8L0WtoeWGWjTob65Pkwcjky+TM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67222F8058C; Wed, 12 Jun 2024 18:16:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC9DF80675;
	Wed, 12 Jun 2024 18:16:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BB7F805E6; Wed, 12 Jun 2024 18:15:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9305FF8057A
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9305FF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=C2+pKG1Z
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a68b41ef3f6so8982066b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208949; x=1718813749;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmEnUku8lwCm6C2oNC52aCB1kZkiPbgX5VQWbXgPBbA=;
        b=C2+pKG1ZLgG7WgFfAmf7XIhdP1qxpSR7enqEL9bGjMy/Jk9+WAzCLkdZa3eGGX66J9
         Ty4khHVrH6DlBCy5vuV2xt19uhV0Mzk39VOCpKS3GCXwWpMZsjTEFOIq/JwNAXiRUAiN
         jOrOAn9x2/XLsk6hg+kxZRxxWN+6HeK1tI5O37j74lt4WfTZxznLuw82dZt+0RhykS2n
         u5jTlmGB5Mcpy09TyYxQlQGI2z2T1hTwd9x7EBtfHpJDVmIu41fLg3Nu8YrqJjL2nrXS
         9lL1lJLHE0XCQ63T8S9NC00Ylk/3O5BhjF2m61hBGVDJHlNk8Rye+B6RqEXy0OFE3CK+
         CU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208949; x=1718813749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmEnUku8lwCm6C2oNC52aCB1kZkiPbgX5VQWbXgPBbA=;
        b=pFFfbaC7BucNWtTvYNiQIOqC2bFFYxOmicIdMBEr5lvjNYwyjPaiLnX3zHttphyD6N
         zswZWT9kajdY6yQz7MQn69ngW3UDJKj9tW4jtZhRZsMXuE8qUxT4pCg0+AY7YeZdzmVg
         tSSx7cejGjIWWs/mHu7+RPDZw/E3D4HaCMxoaFiWlk64QJ66eksynQdohpHenlfto5iO
         cUqNnOKGMxHOzFdSUUiOPjcTSg1+Y79QzZOEBoF4ntgr127bM63XWfEifW+NCh6RwipL
         YALQQpMIqoe2FM22Z+2J79D3v1B75rVof3Sf1lcELGV2HfXygCH/G/TTEnvJMl89PlfQ
         iDYw==
X-Gm-Message-State: AOJu0Yzm4ipdNw2lpQayQEuT/0EjJLx2n4g0nlwkF5u5GHFo62eurqem
	I7eX8B35GMoBwjPqro0wY9gMCoOT2TgqG42wp01gedqrKfWfsItvyhZPy4Ls7Q0=
X-Google-Smtp-Source: 
 AGHT+IFoKaDJDYfIyho5GczSHSkqKxu7KN6zUTd+u7cNPd4fAXx5KP0876Uwls0hd/gjuxcHkQ/dtg==
X-Received: by 2002:a17:906:355b:b0:a6f:4e02:ce50 with SMTP id
 a640c23a62f3a-a6f4e0323c0mr68616866b.58.1718208948949;
        Wed, 12 Jun 2024 09:15:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:18 +0200
Subject: [PATCH 05/23] ASoC: codecs: wcd9335: Drop unneeded error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-5-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=44SvPncKGed5222crY2QmWyS1bBJY6ITGdo0S3bUKlg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmbvr1fmPfm/PMxuNcXIa5+ruSQV6ftFq3SU
 UD9sww97xuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmwAKCRDBN2bmhouD
 14i2D/9ENklcp84Bwc6wDhkbkAIOZoKpswTywzAoWiMdry4iky0WUt0gd6WLJT/qv5r7Co4+EhR
 S7yKqdbaTpPQEDfHVshh/lcsePxUi0cfYWgPYOfybJkEslsGWveTrmpl/YGUIGtb+gh+TMu88EC
 r8rXn0ZwL3jAEywWS5sqQ61SK4jXB3fYA7Cuv97vBqqaY+r9Sp7i7N0ivMV+CM2jsZYrptOM0G6
 YcpxzGgBjLaDYRfQx/Bzts2ll7eDKNzMGPivjfX1sDZKly0HxVspivE2lyReNwyuSC5LIDEtDca
 swIpoFbqUa0LIBjwqix+fx+Qm7nmz5BfO7WnohsR41EgR6+G7UzAGqAMLaY2Wo1UwEcN3aRGFcU
 lhwtwDCj1Ft9NxY/D375Eam6tH+uylUnKq9azvGq31IpL3iM3+I7lz9AAdrVxUVKkEZIEbv4azv
 XvJE11BzRVWF7aEWJo7OB/d+3wMQ8KJKEVsWShZrwYA5BNFm/T64dgTH9Ivtz8TD0BoBlEJq1ax
 tVONbpPPUAu8eaRNmyXvSmroCSMi37CDSc/Eh+XVi6oFrLXwk16FrP9kXeCCEtFWVJbpY2IgOCo
 XVjQLRJMmWo97dJTc7RALr6tH6t3DQAWupxZDsUT5GH7oZX9ajL3ULkXGxFW1nRa8r83/mcsIBn
 FGM0S/aIAx0610w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: VOLU3YCEMUMRI7IT3NGK3GSW6ZAAH2PT
X-Message-ID-Hash: VOLU3YCEMUMRI7IT3NGK3GSW6ZAAH2PT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOLU3YCEMUMRI7IT3NGK3GSW6ZAAH2PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Error-level should not be used as debugging.  The code (function
wcd9335_get_dmic_clk_val()) will always be called with same parameters,
so this is not really useful debug anyway, so drop it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 334c5241617f..6a1376b3b98c 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2849,10 +2849,6 @@ static u8 wcd9335_get_dmic_clk_val(struct snd_soc_component *component,
 	u32 div_factor;
 	u8 dmic_ctl_val;
 
-	dev_err(component->dev,
-		"%s: mclk_rate = %d, dmic_sample_rate = %d\n",
-		__func__, mclk_rate, dmic_clk_rate);
-
 	/* Default value to return in case of error */
 	if (mclk_rate == WCD9335_MCLK_CLK_9P6MHZ)
 		dmic_ctl_val = WCD9335_DMIC_CLK_DIV_2;

-- 
2.43.0

