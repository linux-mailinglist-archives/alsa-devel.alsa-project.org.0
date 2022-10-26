Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0F60E59D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 18:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 239CF3AE0;
	Wed, 26 Oct 2022 18:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 239CF3AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666802659;
	bh=M3LvEQIP7b2qt7lMFYMr6HIIlkS6fKalgL8DHP52nqE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=viR8FsEkjZaHFn7UQp3t5CxvYTXilvZ24Fj6nCXXbwloKDXuN27V+pF/y+S+c8icL
	 vglEfGXtZbsvpETftaxUJ2wIIYxeYeNf/bPJmyKreryNPp24Rlt7RTtiztJBxJjOlt
	 EKt4ic64WODHeY/M6xVyWhvzv0cq4zY8cAenE+fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E7DF8027C;
	Wed, 26 Oct 2022 18:43:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E254CF80271; Wed, 26 Oct 2022 18:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 695C2F8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 18:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 695C2F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KOkEfP2x"
Received: by mail-qv1-xf2b.google.com with SMTP id u7so11968253qvn.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzWvOz4xlS7L3D9T4rYd7JcZn+pzJHU2kPLw2mhBPuM=;
 b=KOkEfP2xpRurEbYg+xQTVNwiZfGj3RiNZiEcehd4CgcqnnG4IFx3UKtOjlGSemDbPQ
 0OnIs/LTiX2qwceK4CMeaxVEwrzkEfSRa8S7l5FS1SdMXA5GTBkMXY/24hwIPJXP2eQb
 s3bYfXUbUpb65zOyBbZC0B7YfrgaMcFn6rz01Wc1k82pcL3/hBFEyLa01MUXlcQLmNZB
 i1oIVykGn16gBLLLlq4lAx2i1M8SqQykQ2EfLg6o7i0OQOewgwOpuwUERwW74CSMc1X0
 eO6iX0gjFeuplDPso9WHI8nrpFIr0kjWVwS1ldABtBxDnwKiGyR3MWaUN1UvUdbXdKFq
 2EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzWvOz4xlS7L3D9T4rYd7JcZn+pzJHU2kPLw2mhBPuM=;
 b=BEM0O5ZvKlqPy9ify9ASb7gbM7R6ucVJXjZbko+cGQJtMnStFfbf06MV8Qfn6iLCGc
 zj+VWGn4ZP/GbMU5LM1J2nmwlvDJUgPO9qlrWowtw0kpWtFZbcM/yJaw0ou56+H3Nebh
 VSaH6Mz5bVNMBxCmLjD3Wtebn6kx4AL09RKpV6h9js4tUR+tP9C4791RaCK2mVtfeY1/
 Zz93KC7DbH5it2bFefxDan74mI27QqxDncgWrAkBnC2vPDrMPgt9Ragd6Y2Exqm5MaEl
 tZmb5rTUwV2zQ8ws5Gxhkfj8bnMBF31WC3++zGSJCLbUZFOGSkGAWM45Ol+KLKV5QhUZ
 fR+A==
X-Gm-Message-State: ACrzQf1K0XsPXql0O8z3En5Ahg1Sdy/WskyQ8zB++B3iFFJPfZfMoqH8
 wTomuSQWvbmr8xmo8hhlIhg/Pg==
X-Google-Smtp-Source: AMsMyM4iAG3FrGgLa5u3fVo4ArWXqF/ECAWI08B9jzMkRd9NbPYsZvn6nwCH0MlU4TpX4OF79c3ACQ==
X-Received: by 2002:a05:6214:d42:b0:4bb:75aa:7d7 with SMTP id
 2-20020a0562140d4200b004bb75aa07d7mr13016281qvr.22.1666802599432; 
 Wed, 26 Oct 2022 09:43:19 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 j6-20020a37c246000000b006eed47a1a1esm3989938qkm.134.2022.10.26.09.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 09:43:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] arm64/slimbus/dt-bindings: convert to DT Schema,
 minor cleanups
Date: Wed, 26 Oct 2022 12:43:12 -0400
Message-Id: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Changes since v2
================
1. None, rebased and dropped applied patches.

Changes since v1
================
1. Fix commit title typo (Steev).
2. Add Rb/Tb tags.

Dependencies
============
No dependencies. Binding patches are independent from DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: slimbus: convert bus description to DT schema
  dt-bindings: slimbus: qcom,slim: convert to DT schema
  dt-bindings: slimbus: qcom,slim-ngd: convert to DT schema

 .../devicetree/bindings/slimbus/bus.txt       |  60 ---------
 .../bindings/slimbus/qcom,slim-ngd.yaml       | 120 ++++++++++++++++++
 .../bindings/slimbus/qcom,slim.yaml           |  86 +++++++++++++
 .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  84 ------------
 .../bindings/slimbus/slim-qcom-ctrl.txt       |  39 ------
 .../devicetree/bindings/slimbus/slimbus.yaml  |  95 ++++++++++++++
 6 files changed, 301 insertions(+), 183 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/slimbus.yaml

-- 
2.34.1

