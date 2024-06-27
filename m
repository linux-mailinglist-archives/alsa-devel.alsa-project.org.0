Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00E91AB2A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19BBF2119;
	Thu, 27 Jun 2024 17:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19BBF2119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501932;
	bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TM0vbfuZUNAMIA7Uw6ZJf0JrU00K2h/8ttUHQDDhdA7OmJbe+vyr3Y6armaj01k31
	 vt8c+ds/RhcTl8xgCglx21JdgRNlhLlV6NOvh4PEQTgwVsOueb6j+um3Q4K5GZjPaf
	 zRL2F7M5azL0lS8gnup0fENfPl8esCOMDcO8fPW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC80F8064F; Thu, 27 Jun 2024 17:24:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CFBF80651;
	Thu, 27 Jun 2024 17:24:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78743F805E9; Thu, 27 Jun 2024 17:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81413F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81413F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ya2WAK39
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so26584695e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501834; x=1720106634;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=Ya2WAK39nRbNAeXCi2QYvin4y4i72duiPeL/vQxOJOxs5RRhTJvxH3L/F5RGjiSWqR
         /4koD4J+Vb77pME8xKfVePHjpcN4lPJ2J8RZFsp/ZA1QnQUnvgfFJy9BA9qUyVt04Hab
         Hzqc4d/9R83tpv+1oEe1s7I04FS4I5KLTfGkJR2H497z5vuQGK0c4eKxkGgxKuASeEI0
         8A3OJCEJ7xd4j6vE7Wm43gm6iIqKWCkrut3+6dqE5dUy1iU4mE6TpCHvDayIVOBb7HKW
         vRQhv/IueTgjvYPs2X+dl9VT8nV30rJ1N0yMMDbx7MljGZpRIo0M92wlhcnmp7CnZMAb
         gv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501834; x=1720106634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7JX1Bcmrsym1bUeGPwa5YrFI0Ft58jDDZJ4/xxAojk=;
        b=XxeUoUcmzhxj3um06i3aAzOsRxOWTtmLAGhbLTJGGUDK810yHlBDLM5JvpN3UJrnwn
         ltPeQ6W5LpVxFWZ3jHKlhpX6epCEIail41lPrzOE5Se/u+sVKnsxdVq1ZjcqA7WddIya
         dyr8oG/jJtllN+1bow9DWilyFQ4h/AMbBs+63OldfmDcnfDZrSiBnAYW8JRzi4iin0OE
         wdwcVHUta7XMg+q1Gt2deGnyplylSXxV6y5XOoOBFJAcPClYGbcYsuE2ijgPsjE9mcmP
         iuaw552dVYYpSKzkpMg0cDx1mbmXcCfBmNJsuj0O2BATDDmscoHJNeoDtz4S/5fbh6d6
         7iug==
X-Gm-Message-State: AOJu0Yx34KAdfGrOYI4DmGrejlxzZ6JJeW5EL1EpKckpmGEcsW8EhwLG
	Urah4h9BVetzReGNQgQu2vHA0DGscn6VMo6zSqpMGyUdMTLOSN56wB0cXl+zbk0=
X-Google-Smtp-Source: 
 AGHT+IHU0uHfAgbvO3wWQFz4VkorLowhWrH3I6Q0ilQ6xxfYkyzq0SbVy9LBPiGmf7/YXOrhPlwUkw==
X-Received: by 2002:a05:600c:4451:b0:422:62db:5a02 with SMTP id
 5b1f17b1804b1-4248cc586ddmr102982145e9.32.1719501834317;
        Thu, 27 Jun 2024 08:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:46 +0200
Subject: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for number
 of widgets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l8Fs7uNm1FChU4HgNrAzvxr0CjT3lQ1EHDABQ5Se0aU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQD7NGFlFAPZPk5oxOO2+MovrmCbj4uOIsyP
 e/OfXBPY16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAwAKCRDBN2bmhouD
 15n/D/9qgH86TgweMDT2rs2qJsT1XmlVEPhyqpMP/R9xme0SJMtfcuduTkwsrgdmqKSINPbIQf9
 u3d/5f8FCg8Eb9FhBU9vJJC5JYMLnU1gTKMoGG/DVrc28B4nTWP+FtO3VMEoYagqUJK/h9Z73RP
 HAUXqZ+R+Naqh4KBkVy5HW2m773Y7w2QRH0DdDHOC+hLjjL3nSr29P3ymYl0IBzza5eevLAxmx1
 /bJLceFRg8tedElAOIyRliiJq/z9V/zM0WKHyeVrxea90Jq2bnJ0c/KyKQpigZlyJjHRa+N6wa+
 Hr/aWoCzC1t599cRI3v+lROegFbtmpv6IgC1XPPoW8UwUNZk7JY+wy0PLBLwyvaQaEg8xLE+WmM
 HN6C6+dAz9zhak70UZ/oGbaSTx5UhcO/SVeTOteIzaxSyGF/BSwxy+b3R/hfKk0ORfgzBLUxMEh
 aJMTnkAnYopE185qHVVsSd7zNktFrNBouS33h5HPi7DSi6+Qs3RFHwjI5D+6x/pdKa0UpCpk8ot
 KFEIUX8fyfloTZrs0gvzm336tjIiuJohOp9kh0z2+VJ8kTlxd0deYc8BpqPbQFAtNiortgQZvnK
 p+CWP1afNQhnCiliM1vaAutzd21oORxUBoRQD9s2auCRtUilOI26FPIi8ULQvPAgBEz23+vLVan
 j8qaYgqDZPJsEaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: TH3YU42AGF5A5DUAV3VIDTDRPXFPXHSB
X-Message-ID-Hash: TH3YU42AGF5A5DUAV3VIDTDRPXFPXHSB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TH3YU42AGF5A5DUAV3VIDTDRPXFPXHSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3d8149665439..bfcbfbe8b086 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3611,8 +3611,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
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

