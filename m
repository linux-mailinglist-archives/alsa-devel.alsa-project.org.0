Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C9916EB9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6693FA4A;
	Tue, 25 Jun 2024 19:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6693FA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334939;
	bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a4hMVAE8O84kamugPzX47NgohCtyZZaRpluIp+73k6WXfYB5i04Kf0mLmAVgX/M5H
	 e8abISZClgfKRpfcxq3d3Qp9IcTyYBO02ZBo2+ibFQpPqB9Smk1hgmI3tTv0UmKckb
	 OR586ZBEgyT91ct9m/ciootQmPBv0Ph2wIXCEeC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B6FAF805C0; Tue, 25 Jun 2024 19:01:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D991F805B6;
	Tue, 25 Jun 2024 19:01:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED0BF804D6; Tue, 25 Jun 2024 18:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A60BFF80423
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60BFF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UcR1Z7aw
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso42181641fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334743; x=1719939543;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=UcR1Z7aweAZDGu4AugYhsFBmQlBWc578AXTphzBeod31dOoHOT0hqOZTjbR+jWXR5F
         b4rMAcmRzPGhSoV1BNidUkcyWxloTAGXs+EyxaPxzLbZhTymI9XIvNjtj/hgyyU1WPiT
         SuhMM5xlYhOfcDtzpjk2Ll2eI1vFBBPFetkkaNlM5yxUpYHZPt2BJfzTPFuIui/8GUgn
         NdW/MnY786UZBTahtiZkyDu7yLHpLVcX80cmQaCpOALkej5gURJjbDEhjY28LD/EHpbG
         lBvPQePRwkMMNvH0j475r0I6dkHNBcj9f1FfsYphUtN+BdG65kxXaYWAPATZNgNzcElo
         ZAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334743; x=1719939543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=re76ACXG9OmJmqLT6FZEpdvG6nPrWdtBRKUnS+4yqic=;
        b=JlA7K4qHuLAJNacZJNRr7BUAObS7G74vdtIA1E69U5wPreakTjNWLd00s59luVTXSb
         bAz6J9jVaKaRz4j6oMh9H/TONdprD+NOPJnwM3It5YCE1QvnktZCe1sIZGZGcsdy/Ux7
         9PDIb5dOK7/hzkxquyfFeKH0QdUfQsKTK966g53uXAJvwv+yZU2Bd6/4Ji7lHqaMhYG8
         6RHhVcLfdtQEWb/5w1rO+Lj3DwUhS+lF310b+dwFGXPzpAbpKtOVmK8QHUpOZIf8fnOh
         0M/hiLWvfs/Ig08srDV32OBABy5dApHUnyzanNeCSQNmMOql4PZgTBbYFHCSFROr3BNk
         jhHw==
X-Gm-Message-State: AOJu0YxtfjJx375xDKYrEE9JBWzSQW/8fsvy4oFc1pi4awJqk0WnivDB
	RCnxTf0Vw5GWRVhvTgSa700DhJJaZDPcu2fOqKJ3zkXp4GOM6AP0zn/E/+KMma4=
X-Google-Smtp-Source: 
 AGHT+IGR7Qhyf8Y3HWNl1SPoUEbvvo2YHcOxUjAhBJioVQV9vrofLD/WBQj8YIQ9FREJo6iOttG1lg==
X-Received: by 2002:ac2:515d:0:b0:52b:c233:113c with SMTP id
 2adb3069b0e04-52ce1835167mr5952139e87.17.1719334743050;
        Tue, 25 Jun 2024 09:59:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm217969785e9.46.2024.06.25.09.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Jun 2024 18:58:45 +0200
Subject: [PATCH 1/3] ASoC: codecs: lpass-wsa-macro: Drop unused define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240625-qcom-audio-wsa-second-speaker-v1-1-f65ffdfc368c@linaro.org>
References: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
In-Reply-To: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=701;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vF37Z0aZiJEeLWEKoNSeoRo+xDDMR/tNEztnp1b16K4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmevdR2h79GggPHusd3v4VoaUckqX1xpQHoZro9
 O3/5py+BuSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnr3UQAKCRDBN2bmhouD
 17waEACaU+lphVs4h28nyJ272D/X1VUo+55FfxobbeqYsSpPQ51epzL42gqR6bZv/EAhLTwpt9p
 tIis5PZNOFo84hb8oeOmO+BOQJ2mLXJlXxZqQIyKY5up0QeZVRjsPhiuKEfXgBEMCHNHfHFMN3+
 HphpHgIKzGKXUYKrhe9Ymyz9/idKlT7q+YbJ8kaIMSNGHAmxhnBio7z87BR0u4oepsPiMYb4XRk
 6OwBj/p0uW9Ux2VOb7qn33XJvVRAxJXLVDQIsktfSKvVKaNQWBZouBalLkU7PpAXhxbZt85qgrA
 X2TgQkWpNalV4iUINTzg1xdLleD6++IOMBvrfyLtotLRV95YQwZjjqCgPXCjVJJJzZTUeVBpJgN
 M8F9oqkjDzJVvPd+85LopPzGg/LN7PeJwumRXczq8KZ6un/s+JJNOrYMadyjc39bULymJ7P/CxJ
 IUne9tVtpFoyvXGI6sivNZ0ZlWhPzMo4ysolyQZW6t/VAXU17mxWsZguBDEbwgNlZZSfbWd1Axu
 AgYjSR37ujOpePfPwL+Qw6/fnZxEtLxoGTvXQ6szdtfzkY7r4AaN3GdZ1IxXqOewTt5Lo8iaOi2
 zGCzV+jMP4w2wcumATat+vyR/pQ/kSw8Xd/n8tGi2foCCe6J3y3xQXqUt/Y3zKtvNRPwfDa0TN7
 KvinIJNSTw+speg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WLIDS2QIVNX3AO5OX7IJPXK4XE5BRC7B
X-Message-ID-Hash: WLIDS2QIVNX3AO5OX7IJPXK4XE5BRC7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLIDS2QIVNX3AO5OX7IJPXK4XE5BRC7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WSA_MACRO_MUX_INP_MASK2 define is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..d12aff62a868 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -235,7 +235,6 @@
 #define NUM_INTERPOLATORS 2
 #define WSA_NUM_CLKS_MAX	5
 #define WSA_MACRO_MCLK_FREQ 19200000
-#define WSA_MACRO_MUX_INP_MASK2 0x38
 #define WSA_MACRO_MUX_CFG_OFFSET 0x8
 #define WSA_MACRO_MUX_CFG1_OFFSET 0x4
 #define WSA_MACRO_RX_COMP_OFFSET 0x40

-- 
2.43.0

