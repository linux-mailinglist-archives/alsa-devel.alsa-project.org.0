Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C915984FF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB9E1671;
	Thu, 18 Aug 2022 15:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB9E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660831203;
	bh=jcEyK4DU7PObFoeRrAm0XsfzmkzJNIp2Mj7naF3dSJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lH5IYuDiVtAyk5/7KA7zkbL+kspRJ+MYEb7Ut3vBnYdBHC7Eyog6w8xorTNY7Z6nd
	 LGw/6+IMLcTWwasWI2FPKD4o0A03tF4yLtp60k1hqltBKeu51WjeMcWVeCOBPMMPqk
	 Rm/sRDZgJvw9hMrBS6dDf5lCUzIfW+VfiQGNT5BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C859FF804C2;
	Thu, 18 Aug 2022 15:58:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B245F804B1; Thu, 18 Aug 2022 15:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 442A3F8013D
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 442A3F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LvxJhbZ6"
Received: by mail-wm1-x32a.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso970642wmr.3
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DkLvDp1vbSt269b1f6wV/xHq6I5W5tUasXS/Aq5agqs=;
 b=LvxJhbZ6hr5Q2ii+L3kadNeOWeoG5D/FRC8u3hJyqQwn8KY9wk4Q6mmmw9SmEoFgiI
 1A9nak6aNsTfKPoxTmiP8bAj7jgjWGbezpDDgErzWsQBAHTp1SwYHUf3dQbU6vFn8fwT
 TJiZeqUcHvJFhLICeQQVxSqdehQWisuCSqeVXbBRcv6IKGZBF+kDS6EJfh8XY+u8EQj+
 34XcG4p6ydPX4/RSuom28ALvfAIu5F+0sqjXR66gFUs0ImW738oWVFrdZ6Smo/IMxKkD
 jYqWyCOGd5HPDQKxft8vg6GKkkRiuzyPp6IBIzc6IUL0+nQI61v5/jcaw659cMjScm67
 G/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DkLvDp1vbSt269b1f6wV/xHq6I5W5tUasXS/Aq5agqs=;
 b=dVwHOXlLdqs/AIAGbX+TRX5/UZ4s3sJ54Pwz+GLopDld96Ys7OSnhQkICAYAs5MhXI
 y9LPL08G5eiLaGVCLmma7/8yCnrx2/eRAG77D7Obx/gjXUfqur/v6MAzrakqn6fMrSeh
 PXtBWIa0JaRrfjP/rQawzdjaZDz5Np/y4v3+IRPdigSLDXHBNsxmLbUjj8Lezg08rsCx
 LXqkAkcgKqv0L/R7BJRd4IjHyQOw9mrxUziqg2iYgnMVvNJuQfskgi52fYf7nG8ZmhTh
 8HLxRFlsl/c+NYr6yJ8LfJgvzY88JjisjSGHGV8mhqsVBoBPd3njC0lbMwZBS3aAkCfl
 +9Ww==
X-Gm-Message-State: ACgBeo12aiP5Qh9HsKCPKl0/3hl6dIcJQYt/sS5SOjDUZqgi0ro6Ks13
 mOTtpanoKtCaQVzhyGKwLCneJw==
X-Google-Smtp-Source: AA6agR5ASJ0+kWLVeryJGGbjeE1j1nLglNJ2ljbdzAxpXDLaWFyyHIY1mUHqsVKUig1QIWMunzFVeg==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr1991210wmq.12.1660831110329; 
 Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm5335937wme.8.2022.08.18.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:58:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,
 sm8250: add compatibles for sm8450 and sm8250
Date: Thu, 18 Aug 2022 14:58:15 +0100
Message-Id: <20220818135817.10142-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

Add compatibles for sm8450 and sm8250xp based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e6e27d09783e..317340215c24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sm8450-sndcard
+      - qcom,sc8280xp-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

