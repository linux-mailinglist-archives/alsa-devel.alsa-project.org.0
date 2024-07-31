Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A35944B06
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0E343E57;
	Thu,  1 Aug 2024 14:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0E343E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514322;
	bh=EVyv4o1kWKU9C0RpwE8ZBKEBCpkeLQtTeetB5bkp+NI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Px5xgTngO7qsnLx6Q+qHU0N8rSN9Kd3LvmsNkuKfHFLRNPnRecnDNG4v32/su5l6h
	 4DP2EYCKGPK269Ub44qVJeIzcDzDMhILGwNhfWWkOvUh/ItBwW3td+RhwEw0kXLGiF
	 2mBGaJQdS9FgGoKUeMydXp5V30sT4kMs89MEpOUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 543EBF80588; Thu,  1 Aug 2024 14:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ADBBF805B1;
	Thu,  1 Aug 2024 14:11:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D882F8059F; Wed, 31 Jul 2024 17:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D868F8026A
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D868F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CPJmrd3c
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4281abc65daso31402365e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439566; x=1723044366;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/h0VtcfMml9IUjMbcpLtg90CxFRBSo+axnBjZNg8dc=;
        b=CPJmrd3cI3jaf8E/M6WiZMAmeYFCnS62pwyItEUKp1ontPQV9S6yPqA3xyHJU38oxX
         id6Lj3lElcrhY3RRCrvJ9yEdqdP8brTSZkwOnQOH0ZuCipexAJ0fIUpDcJbbg0ElHs+d
         Z7S73o8DTxMhRbseBc1iIIFI+q1Xm6AHEE+V3QERm9CqgknONs12CNuGgnbfbxIM9ck+
         mPyXWZj9Ema1KHSoRm+YUr4Fzb5ywGyKUnAvbb/EAWi/AwRvmhrDndk4JVRvSRWUPKAO
         1Avr4JiQJPK3feMUdaAmBP4RmjRwvQW8dLyohFCy+olODWi6hDxTIM5AlDQReFk1/QuB
         GZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439566; x=1723044366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/h0VtcfMml9IUjMbcpLtg90CxFRBSo+axnBjZNg8dc=;
        b=odKkgSa+j+1y2GZCGEvr6jFBxTir2a1tw3PUZTGBrXWoY4rAa82/mu6PKCcH6t+a6b
         l+GulDhtyHb0WjlYdYDoP/R1BkaPOnAFDOS0gpsz2gJ/qJsBlR6Lc+bs3Y4ivz5+K0XJ
         j/747ucjJSz+chrTHCpS5m7OI23HVLxmuqJqFqkroeERmY29HASNTqR9Fnm/HxDTMPNu
         X5XHm/Jl/8aRuTUbSOey+sXJXuLtJ7H1OjhtweHTcetcwddZ2Y6CE+lJhpzoAPB7jbLX
         yT0/+IEZw02zxlWVB9wieKJS0ha3HHa88frDNwNJg84b6Xh1g0IYZInYwSkKM7Kp3X4e
         MudA==
X-Gm-Message-State: AOJu0YxXV86qmaJ8HudiGUlUXDY0WU9F7IDmu47bkWnpqZY9q6BI9z2R
	v1cNpsRVSh3kA5aJufCOmr2GpeHivQAlezUyv7EEyUgMjhp2uv0f
X-Google-Smtp-Source: 
 AGHT+IFaIxFIYcq+H0ksfzt6nQVNfYnsBfjPxrNT5e1tHpK2RZqBXDqp7VIHxXKG3HBqlL+UiNXlFQ==
X-Received: by 2002:a05:600c:996:b0:426:59ad:bbb3 with SMTP id
 5b1f17b1804b1-42811dfc5f7mr123868005e9.32.1722439565757;
        Wed, 31 Jul 2024 08:26:05 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:05 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:26 +0200
Subject: [PATCH v3 2/8] ASoC: dt-bindings: pm8916-wcd-analog-codec:
 Document pm8950/pm8953
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-2-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 36L6THG4JGUTAAU5HPKPTSXVYKFAMHHP
X-Message-ID-Hash: 36L6THG4JGUTAAU5HPKPTSXVYKFAMHHP
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36L6THG4JGUTAAU5HPKPTSXVYKFAMHHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..8af8bb747abe 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,8 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
-
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
   reg:
     maxItems: 1
 

-- 
2.45.2

