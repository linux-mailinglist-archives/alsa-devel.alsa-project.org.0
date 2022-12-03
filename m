Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47BA6417C6
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Dec 2022 17:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8061A1775;
	Sat,  3 Dec 2022 17:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8061A1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670084600;
	bh=SBU1XUFgP5mmJRlDYh79C/wLFkAPuCHhi5g5Mfp1D0I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r6CbdCTzr3OYQcV1XYBTAo7Rau7T5tKEEXr+BBNOiK3X+icTEuFCqUAhoIy1EwEbo
	 T9NPDNfZOP0E0AxM9qGseRx6MYt05/qJgtMfykHoWDUTfQB6ARmdSnEfBKm2Q6VGSM
	 pKVQ35B2DRmYSUXtsWeN8/x3hOHRhmrAswYFgbf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2400BF804D2;
	Sat,  3 Dec 2022 17:22:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9882EF80249; Sat,  3 Dec 2022 17:21:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 211E2F8025D
 for <alsa-devel@alsa-project.org>; Sat,  3 Dec 2022 17:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 211E2F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IA251Nt6"
Received: by mail-lf1-x134.google.com with SMTP id f13so11984566lfa.6
 for <alsa-devel@alsa-project.org>; Sat, 03 Dec 2022 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzcwhdiyD/Q33ZvF0rEIEBBj6MaYk3GPfXyKlwUxX/8=;
 b=IA251Nt6Xcc3Xc4GjmQAov6Ml+2Bevcx+RocH3fpU9Hc1HwqvbvWGSwM4NaeN2NIOO
 HkchpiBL0CboifjCr6JaQVtDL5rwQ1mVMPMMTiafYFiWo+slUOFsNvR/Ggr3gg0TJlWH
 FiIAHEwcCs4yfXSinTqYCPn5s8kGNU5mW/3qQSEeiEzOWwMjyEuQP3O8ut43FkgF/69k
 aq0mtB+j0rSKJ63BsGJcI1YziuGVyjQfQmDdBCvstsCMccefgsBEVU4LW4LcFkSonOY3
 3gp6nLo74h2xaMJLyFmN6gfuEozh9ox+jGl1uBRKbtBWwzh76Y5R5gyUVNLqQ7Ov4CPD
 dFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzcwhdiyD/Q33ZvF0rEIEBBj6MaYk3GPfXyKlwUxX/8=;
 b=CUxFMifWx15ZbKtLYTvAK0bizuc4PM7GAJbOn1+8p5ApYzBZxDYB65hsDHeaSae1EL
 +CY8HlkyAD1RRGp5HJIwhNLigYFRjZxTabnV8RvjxHeElgG4eSZmytimCdZv/31gel4W
 +LSg78jU9+7DrspHKdLOUOpScB/kXRKrh2zXr5dSElrCpj56xCv3sDVYu5VIrlWKKZPX
 oww+uPJXEuAZt14YUB7bZ0zfNrQU8RaoGnqMSOQtLkrJcs4A/Vtxfs+ijSae9sm2TIyS
 uK+ohtqKjVhCHJD+G4UmqhUhPmRm5LfwpfAYmk4Lxz+cVm50dxaCxYjBIsV0nPI9iGsk
 vHlQ==
X-Gm-Message-State: ANoB5pnbHDm0TUjhf7NnodsEslS/8zeSaNT7qwSf0mcnyVpvOkc8mIfl
 nQGbCZ0MZJf6lDqcJQXjaHVz1Q==
X-Google-Smtp-Source: AA0mqf7Lwc3YeYZdxgkprTOWEMJC8O1f+aQqo4H1mCRSujMIbT1nT2tPvuzpVfJNT7y3N6zhlEsTxQ==
X-Received: by 2002:a05:6512:3e13:b0:4b5:3f5f:da27 with SMTP id
 i19-20020a0565123e1300b004b53f5fda27mr4089537lfv.666.1670084511051; 
 Sat, 03 Dec 2022 08:21:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bi35-20020a0565120ea300b004ac6a444b26sm1443935lfb.141.2022.12.03.08.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 08:21:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: dt-bindings: Correct Alexandre Belloni email
Date: Sat,  3 Dec 2022 17:21:44 +0100
Message-Id: <20221203162144.99225-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
References: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Correct domain name in Alexandre Belloni's email address.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/adi,adau1372.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index f1ba70723e6a..044bcd370d49 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Analog Devices ADAU1372 CODEC
 
 maintainers:
-  - Alexandre Belloni <alexandre.belloni@bootlin.om>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
 
 description: |
   Analog Devices ADAU1372 four inputs and two outputs codec.
-- 
2.34.1

