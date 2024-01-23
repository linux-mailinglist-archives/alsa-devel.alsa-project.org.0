Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6B839103
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 15:15:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E156FE0D;
	Tue, 23 Jan 2024 15:15:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E156FE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706019316;
	bh=oMxlIYU8lOKLFt0TEL5h53mUDoaj/hO9QDpO+Y17nsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tAUpEXTQlFGmng5ToNXHe7pyay49nagOjpE4RoGh0WAoH1DkcccbGYVyHY116hizf
	 HKiDCEVODMdBuyFznXXTfm2FZ+MdCj5HdYnEo6gUbNvtD+M35SdGXvtFe72qy2c52E
	 KFdkINvrDvc4x8wsJkukoX5VYXqxMjny7r5YN6ew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCE6F80615; Tue, 23 Jan 2024 15:14:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84448F8061B;
	Tue, 23 Jan 2024 15:14:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C682F8057B; Tue, 23 Jan 2024 15:13:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D323EF80149
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 15:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D323EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uTBhya6G
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-337d99f9cdfso3862336f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706019226; x=1706624026;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=uTBhya6GFfbuWhN1DGsgqfq2JjRTSTKVc3TAWrDncxTaKRkw+kA6BYBNymuBVWNj1P
         7QfqiFm7CswyolaBVeDIVugOXptvWm/3Oj4rePm4fwcM83+JmNfHIS0hE52NO/XnrLsH
         QLcJbgJTTjYe6iPsUgqBFoqyLy8keDako8qbpeMy6wdU+/Xj7rzc4U2mw4sYoUc0YdXv
         av6MXpKyIe2/nuy48CWA/PV5nfp/8K071VgAwcYuMm4xadyRNrusyAC6RIpnjf+I80Kd
         zddBuBWNY7MJZmqIryBHXD4jgKOzYkdtl2TrJeWqLhHAb6Z/nl2m2uSDZVm7zLNQwk3g
         x0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706019226; x=1706624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG0lQDgeayG/ZAaWGjl028iUARha7B2YZJgs2y6qJ/U=;
        b=urHnMt8GbbY4v8ztvp8l3TJH660Jb9nBQyXBvpX0GyxS6ypTUa/gptY2twGi2pKSBg
         9IMuELRzORlMCrxfns3sqdOVAV0KCJHEYmF21CFqu36PU03ySmTWN05mBSrYtQ6KmJAG
         AOyojSnJ0HqTYtOsUGk8OmB8Pp+PS3W64KoX7MD3vWCxkePdK2skB5MB4jpEKNPy4NKd
         goDxB4Hna4nPTx3+stZjGrazA74/W+X1Nn1Q5P1avXUzIPyZ798KOYN3uzzSacJg7HbB
         Rr0pJBsUaLWtpM7hg45jP3XSsX/STqRNN1tl1zqnESofcmZt7pjfSC33IxfeR+SRCevB
         4OWA==
X-Gm-Message-State: AOJu0YxdUY6/9m+OqI2tYJUk56sXfuUCyH639zTYCDA+p2d2Vtf/Knyk
	I3u+n2hz6MssmUq7dc3QsGNFODVj1OWkT5z1IDTrYvA2X/0Ntk2l4tVlebeN28c=
X-Google-Smtp-Source: 
 AGHT+IHqKV7UxmdKdHe6zjaK7RBNZnRE3p6gqEa/c3ykA6FNDvoSpVZjiP8ZtDmiAEKBeFc7P6DV7A==
X-Received: by 2002:a05:6000:100a:b0:337:c81e:cdb0 with SMTP id
 a10-20020a056000100a00b00337c81ecdb0mr2955862wrx.104.1706019226510;
        Tue, 23 Jan 2024 06:13:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b00337d97338b0sm12132298wrm.76.2024.01.23.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:13:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Tue, 23 Jan 2024 15:13:10 +0100
Message-Id: <20240123141311.220505-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2WCB34BTJSFNQNBZQQ5ZYDBMUZ2QCDL
X-Message-ID-Hash: L2WCB34BTJSFNQNBZQQ5ZYDBMUZ2QCDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2WCB34BTJSFNQNBZQQ5ZYDBMUZ2QCDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

