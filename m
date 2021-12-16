Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F48477694
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 17:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10EFA2815;
	Thu, 16 Dec 2021 17:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10EFA2815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639670644;
	bh=V7+kNUO31cBLN7GUhrqjX98uEOyB/PaoNCyZvGNa+P8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vyjnexfk/5W645xNSKkMz8EtzmcZLjcI4wOtaL+fWuNkIJqqFkeVuKSHwp7NA0hpR
	 jk9mfCDo6J1ohQratYTa+53/0r08WQ5g5pgHjbVBijLWCPx+wKDLtstIRBat08+wm7
	 M7d8C8h4M4tp3zXXIs6QMbJi3+SJzik7JHgsY9HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CACFF8015B;
	Thu, 16 Dec 2021 17:02:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B09F8014C; Thu, 16 Dec 2021 17:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A55D3F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 17:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A55D3F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qLgN00iH"
Received: by mail-lj1-x229.google.com with SMTP id l7so39243794lja.2
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNnl/SMgi+a1vZUFpRGO6B+ARNo01gzwBzD98+b1L5g=;
 b=qLgN00iHfIwpINS8s9PGlwsb6lZJctGBLXRl/BOjMq9Wm5/20axqduCVyBxE4T4ADt
 C6kbdM5jxuicE/l5/L7sAEmjjZ4wKmHmrHyhsdU5bO9/5bU4ag/wG+bt0CSZZg3KFwHW
 tp8J+AnPzHv+HLE0gP20Ho2oXRqcmsLo4GbmmEc/y5OsfpFddMspi4gCmNzR9aeuX++g
 z3fGPrJ1JkkpSOy0RFvLGHiDe6yD5sJ8Ch2RuT74ab3oyas2zfimLhho0+cg/3Rb6L1d
 8sr2ZTKW1RLqAWimU+r81cm3enjrteFAgsRzBawTIORWu+IEyG0sng5e05q5XXGCzbsd
 t+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNnl/SMgi+a1vZUFpRGO6B+ARNo01gzwBzD98+b1L5g=;
 b=Xo4UoQ1AwUhjiyqbybWJAWNxh2TFihbsJlw7f4Tt4SO5D1YL0dA5JLbFDefy8bGYv5
 0clFzfvngm3nRelf0/9rZzKOsZARn8TOi8WDqUAExCVr17b0Bln1LLTH4ZriHmM8XUct
 CxKDYJfKoFcgHA52r6IDfEy7+5tlmiCjRkWgD2jYysICkrab7+9ryF9N0SlJEipBWbSI
 khsUPOSoQwNKUZtOffS4UHuke2RcXwQV9F6iGsDenp7ykYpSLrSJRX+QFv/pX8mIK4Y5
 j3umFr1ruS6e8hpg6cY5HIPYCZOTYEHpslkq9eurJ/o0FrvWI6dmQciNnp5qVkd1fifd
 CusA==
X-Gm-Message-State: AOAM531b3VogSGT1p+UgmRaT4WAuokmQ9h5j37n1uFWEwF8T/pXHnZcp
 +CRst4lhq3Absb9u+P1sY77OBOoCMxw=
X-Google-Smtp-Source: ABdhPJzgsEtNfuQPOiRiHdq8hgtrYwB6++vokZQp+eTOApx4GFQIVMVdOHDa4IlEFHEmnBmFPUjbSw==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr16504562ljg.414.1639670568728; 
 Thu, 16 Dec 2021 08:02:48 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id o15sm934802lfd.164.2021.12.16.08.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 08:02:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 David Heidelberg <david@ixit.cz>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1] dt-bindings: sound: tegra-audio-rt5677: Correct example
Date: Thu, 16 Dec 2021 19:02:29 +0300
Message-Id: <20211216160229.17049-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Remove non-existent properties from the example of the binding. These
properties were borrower from the old txt binding, but they were never
used in practice and aren't documented in the new binding. They aren't
reported by the binding checker because dtschema needs extra patch that
hasn't been upstreamed yet to make unevaluatedProperties work properly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml   | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
index 03ff691c26c8..a49997d6028b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
@@ -92,9 +92,6 @@ examples:
         nvidia,audio-codec = <&rt5677>;
 
         nvidia,hp-det-gpios = <&gpio 143 0>;
-        nvidia,mic-present-gpios = <&gpio 132 1>;
-        nvidia,hp-en-gpios = <&rt5677 1 0>;
-        nvidia,dmic-clk-en-gpios = <&rt5677 2 1>;
 
         clocks = <&clk 216>,
                  <&clk 217>,
-- 
2.33.1

