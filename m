Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE725CB75
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:46:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6100C1AC1;
	Thu,  3 Sep 2020 22:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6100C1AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165972;
	bh=rGPaazvsw6UUUMLNC7pSLAMKZMR24aj4m3T8eVAFLtU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viwqaxQob+C2RQ30DDezK9WFNhs0ntQ4d7O2fa46uTbHBLUq2oxP6Zn1IzEdIWBDe
	 vKQrMhWC7cqO4KXUsvoU0XJLCc6Ubt9Fh8MIKzfd3H8ti2qXwu3bvVAj1iWse2Dg5L
	 O/5phTuqhnwHwP+lRkrMYx1cG53oCEQAKIwAqjJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AA5F803AD;
	Thu,  3 Sep 2020 22:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B56CF8020D; Thu,  3 Sep 2020 22:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33742F802A9
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33742F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="twPSX/J8"
Received: from localhost.localdomain (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB5142071B;
 Thu,  3 Sep 2020 20:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599165196;
 bh=rGPaazvsw6UUUMLNC7pSLAMKZMR24aj4m3T8eVAFLtU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=twPSX/J8eCw7EPQ43IcfD/idW6US0ZSlCKYsZLrCf6DMYqxT+UmGNZiLO37/ZIJLx
 4HiW95TbPfl+AWwb3sjp21IC0PnPs+DhgWvi4PFuibzUL6uhIFy4B6gpi+jAX3ORbR
 8wlEPqg+kMQifhzYnPq2SpyDMGFD4ekY7H73pvno=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: exynos: Add clocks sound node in Exynos5422
 Odroid XU4
Date: Thu,  3 Sep 2020 22:32:50 +0200
Message-Id: <20200903203250.19830-4-krzk@kernel.org>
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

The dtschema expects "clocks" property if "assigned-clocks" are used.
Add reference to all parent clocks to silence the dtbs_check warnings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 892d389d6d09..fe4266850659 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -44,6 +44,11 @@
 				<&clock_audss EXYNOS_DOUT_AUD_BUS>,
 				<&clock_audss EXYNOS_DOUT_I2S>;
 
+		clocks = <&clock CLK_FOUT_EPLL>,
+			 <&clock CLK_MOUT_EPLL>,
+			 <&clock CLK_MOUT_MAU_EPLL>,
+			 <&clock CLK_MAU_EPLL>,
+			 <&clock_audss EXYNOS_MOUT_AUDSS>;
 		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
 				<&clock CLK_MOUT_EPLL>,
 				<&clock CLK_MOUT_MAU_EPLL>,
-- 
2.17.1

