Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18891BC73
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F982342;
	Fri, 28 Jun 2024 12:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F982342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569662;
	bh=fhQZZ4QjPKXRqv6gWUJ77jDFeIWxAGyZqof8ycl13AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bf6Kumjir3PV8Igt4EaeVUk4A7rty1idXoCwhI1BdsKJ3lhXHuf/C2rkApMocQ+iy
	 J0T2GYiAnYMYk26i/tunLhHqkYvV2yk57GeuUneKdBJVQIUbEJlG/3dQ7bRGPH0QS0
	 UlLKi8ZE05z0OPZUK+Cxuxrj9wG78TuQ/uVsDysY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DECF805E4; Fri, 28 Jun 2024 12:13:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0769F805E3;
	Fri, 28 Jun 2024 12:13:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D9EF805A8; Fri, 28 Jun 2024 12:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C36BF8049C
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C36BF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cEg+FKpq
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-425680b1d3aso2921845e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569496; x=1720174296;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+rpmUsm4rhHiHlN8KJCEkTWbouDx20N7nNq4S2dVmc=;
        b=cEg+FKpqChoM4Z7uxtAk6CvhwcGtXo+e9nTj6hOgetLaTy9dUZABS6maycyMWDs41u
         aneLHdUzdBfpBj+a2r756dKJ9gmTuo+vh9wTRvOjpjjLx15IijI4w7ko5D+XZ8aeedjA
         YKBJCMGTJfE9Jlh80gQDpju16ZnmOWkKdIDc9hHHGb4O+1jtYWq+jJN21cH7kJlEIixd
         KIrabb55bDOvkkg53W0mxLcoDhpfhPB25FgoP0AXf/DbXnn2VxTOyHErm4tZSS/Ta9MC
         rUAVHW8xwBUVgSyBS98Np0pfZChOnXj92+NtvibTVRtky8XQTAbrQ8mw6skCMj2En8Dx
         FysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569496; x=1720174296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+rpmUsm4rhHiHlN8KJCEkTWbouDx20N7nNq4S2dVmc=;
        b=NNU0FzMujeushyII73YorCJvMDmfkua/sWpSrtNAUeEIAXqvel+E674O1RGqzNKRzf
         QjDdLYDKUsUooi+49RIAfcHv0x/VhHR8nLL9re7Qgt5pkpA0u1C3M6u0+23TrwFWLA/7
         3q4VYEdf9m/TqChVD/5zcf9wDXavPyeZ1wOskgD/9KCUDAD3MNZfourHQ34CxHhGgcGA
         Z0LnoGv9PPRmBbJ0P4oNVFFLfGmXUFa6KOm8VsjwgLaEOEVZHWeaGguzClcenJPavjN3
         21+vmvgX1HYsf1134J7VCY6dNu2+SoEMbTUWIPpTsV7JeUqwL4iPtj5NqfXIQ4FbmJM7
         R+lg==
X-Gm-Message-State: AOJu0YwWa6eqJ2QJsy6Y3TkjKv4FxMrPIFyebYwGXaGqE9Y8oyDhwUQN
	pT3c8crZputoPcOGb29aNUGf9RLVrARucW/KZPEQrlJf2zihj2lIGRlwVFtko/Y=
X-Google-Smtp-Source: 
 AGHT+IHonegirDh7c82kEa3PisDCySFJqp+wAI8RX/TRs3710R34yTI3kBy+elemSn3wKoSxmIZJLg==
X-Received: by 2002:a05:600c:1c1f:b0:424:8e3a:d02e with SMTP id
 5b1f17b1804b1-4248e3ad244mr124740405e9.3.1719569496469;
        Fri, 28 Jun 2024 03:11:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:58 +0200
Subject: [PATCH v2 4/5] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-4-e9741143e485@linaro.org>
References: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fhQZZ4QjPKXRqv6gWUJ77jDFeIWxAGyZqof8ycl13AE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfoxAtvV6h0PC01XQmUzFGtHvD3AQF3zcnGj8C
 taRAiVUTmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MQAAKCRDBN2bmhouD
 1yTzD/45YqEc5uhFbMbSBNNU9dkOk2qQUblj+TJdVS1CIW3tMXjwpvGfZ2EgMouWgTcz2afrM4m
 ojDfVCYKekEAXfsmxJmXxB8j/7tSP3/X8N0w8t00Li1mZvz7owRSVfzuBNwOVL2q84aUHsuiRMo
 rS2OokjwAkyBMisqCTsIL+zeHodH8fP89yW8pO5qs4tE6cHuQKLAevWWlUNo/IhYECP11wt91AB
 oTgWswftId8J9ODsqHdEexwnEbdAxMazerRzqnG+D7ysICFPoYgaKxJh0UTCdGnL9H88K/cVP0b
 aK0B5Nb5UyzPkt8u6vkzT/i4HHggRVcrf/k+TRMZo4r2Kz1omfz3DdRDHWzXJT2WRlqg+aBKG1o
 2uDRekyO+GCnC1YSedO1NvDjlT0aakVvWscVK/nxtiNXNixDD6ASS8YANb/LqIqQE1fSca8OSvE
 rZGcD/+vE7efrAG/TClGGgax/qKYyOLgD6OkzYMDHi2mY2gNu7bEQ8XQYBVO7B7kM4fBA1j/sU8
 orjdW8G858pBkCMdi7gOCUBvCrbOAQTXKdw0raRamLxk7IWq0FWjdyU35ceP4cWslU+eKUkPXKA
 kfv3h9M3DyeKRw2YWYZbRkV83sCteLle+5kRMh6IsHmnBV9PZIfgsxuXtFlMSieb2JyV9rmJSCq
 MBGNjmdoo4g2Xmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M6JQZ3QEOPI36OSHR4J6OVHWYQJKO7SM
X-Message-ID-Hash: M6JQZ3QEOPI36OSHR4J6OVHWYQJKO7SM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6JQZ3QEOPI36OSHR4J6OVHWYQJKO7SM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 1d2dce1f600c..c101d0b8995a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3612,8 +3612,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0

