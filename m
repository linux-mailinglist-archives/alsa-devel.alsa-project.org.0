Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835C25CB71
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAFD1AB4;
	Thu,  3 Sep 2020 22:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAFD1AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165904;
	bh=6z3I61UrsqdEOlJteYcY9hQ+jdgGM1aWxnw3gt+fAgU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unidITVKumH+EH5P7I0QHz+hR+psosgs6xBTleBivJvShS8Q5xIEYKqq+K+DH6Lmf
	 DBZVxWVRAjy8Dj7VTZ0qqY0Ag0GOfQs/QyXT+TzlSqfrBB7PElYfcfqQ6/KTkWLMTD
	 VpCvmYUgm8SvR6ybI4J1hVmvW9ugjqecM0EYyupA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A1AF802C3;
	Thu,  3 Sep 2020 22:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C52BF802E3; Thu,  3 Sep 2020 22:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24C6F802A9
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24C6F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hL9jVygn"
Received: from localhost.localdomain (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FD7420678;
 Thu,  3 Sep 2020 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599165193;
 bh=6z3I61UrsqdEOlJteYcY9hQ+jdgGM1aWxnw3gt+fAgU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hL9jVygnF3BMdbkCrhqqbkhnCtKbgKYLMxqnpnapF/MU1/gThkESEQcXzOu1V05dq
 sFTDQW7vwIUvfi610Ad/C+0SpRzBbkHs/GvT6SOj8T+TWnIvjYnzEhuRon666IxCp1
 9uH7c96wyX9z+KX/KoBZNVTfSiWe66DJPEaUQnLM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: exynos: Remove undocumented i2s properties in
 Exynos5433
Date: Thu,  3 Sep 2020 22:32:49 +0200
Message-Id: <20200903203250.19830-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903203250.19830-1-krzk@kernel.org>
References: <20200903203250.19830-1-krzk@kernel.org>
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

Few I2S device node properties were not documented and not used by any
of the drivers.  Remove them to fix dtbs_check warning:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@14d60000:
    Additional properties are not allowed ('samsung,supports-rstclr', 'samsung,supports-tdm',
    'samsung,supports-6ch', 'samsung,supports-low-rfs' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9651bb9fdadc..8eb4576da8f3 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1460,10 +1460,6 @@
 				 <&cmu_peric CLK_SCLK_I2S1>;
 			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 			#clock-cells = <1>;
-			samsung,supports-6ch;
-			samsung,supports-rstclr;
-			samsung,supports-tdm;
-			samsung,supports-low-rfs;
 			#sound-dai-cells = <1>;
 			status = "disabled";
 		};
-- 
2.17.1

