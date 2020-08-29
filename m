Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED1256831
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 16:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F22918EC;
	Sat, 29 Aug 2020 16:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F22918EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598711230;
	bh=VJgmaHOiFr4Fh3o7/4L/xwE3OpzSFh8uHcUHZhrsTq4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wzi9A85VozFxTdWe3MbcRHgw622KpixE/dJy74R+mllVayQO8yT63QhSa8M8Ci3nU
	 UvFyxu4FnFhSmpk2UL87v4AV784WNqTfbuOliNIBu6+HIunBu1KX1SKckDUUUcZ9Mn
	 nUStGz8LANW95IbshwGEn8NkA41FjLOmjAeExrEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20219F80118;
	Sat, 29 Aug 2020 16:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C37FFF80245; Sat, 29 Aug 2020 16:25:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2315F80118
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 16:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2315F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m/ieACvW"
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D20C6207BB;
 Sat, 29 Aug 2020 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598711117;
 bh=VJgmaHOiFr4Fh3o7/4L/xwE3OpzSFh8uHcUHZhrsTq4=;
 h=From:To:Cc:Subject:Date:From;
 b=m/ieACvW6suXsaUtcmA8tY0AiX8TbuCAQ5yuktwagq3YGnoIoyhEBBUjnUpgM7KHt
 SwsEyA4Q6gaPubpI4Punw3NRCLIaKUslvN/PuE4h6rwvxOK+4qsAvNeHRf+BInb54S
 lieXhxY4hjK9NDcq3cWo9j0ESnXGlQD68AIYz2/Q=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Date: Sat, 29 Aug 2020 16:24:52 +0200
Message-Id: <20200829142501.31478-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Additional properties actually might appear (e.g. assigned-clocks) so
use unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
    'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
index 686c13c14e32..30ff2da81416 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
@@ -86,7 +86,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
-- 
2.17.1

