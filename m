Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05231114ECF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07D51671;
	Fri,  6 Dec 2019 11:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07D51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575627183;
	bh=5y6lNmLaduidXjQjbNYbCi30oKMeW0QxBqClcBxVcb0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnvSZk/kH+6Pp1vj8Mwi3jJ8mTaP6hfRoMXXtVcT2XEbRzWizJUkihq6lAShnxbQL
	 SrXDDjVxiI5uZzJRzAwnL9uFG3giMeQKaDTeM4ekOUTKQHUHHtiAbUbwIcn/EIhXTU
	 zjIjSPTS5kGGatn2vSEhrbVPx9agch+YQbFsmEko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F11BF8025E;
	Fri,  6 Dec 2019 11:08:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 022DFF801EC; Fri,  6 Dec 2019 03:49:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 783EEF8010F
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 03:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 783EEF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RZ86f6Pc"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de9c18f0002>; Thu, 05 Dec 2019 18:48:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 05 Dec 2019 18:49:04 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 05 Dec 2019 18:49:04 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:49:03 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 6 Dec 2019 02:49:03 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.171]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5de9c19e0000>; Thu, 05 Dec 2019 18:49:03 -0800
From: Sowjanya Komatineni <skomatineni@nvidia.com>
To: <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <digetx@gmail.com>, <mperttunen@nvidia.com>,
 <gregkh@linuxfoundation.org>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Thu, 5 Dec 2019 18:48:44 -0800
Message-ID: <1575600535-26877-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575600528; bh=63eFiSPz4MqupbpIiCdG57XX3PH0P9e9XUqT1iGtGIk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=RZ86f6Pcz2o8OxuW6Ta0VXgzvDiuN9OOtLf7ayKm3fd44XcKmIbuwLIRR+4mwx2Mo
 uYxJ2xZeUYaIQQrQ+07MgTiyNiq7iFOLgbISI011gHGwZVZ+NT2CX85Jf1JRICZUgq
 6EORgYudLtHyQ4LdAkpAq7pBhtAXHYLTB8J2/b8mgsfGC97gSYs2/8YHCbwrNpnWfE
 ggFbGvizvbE33J91+1ugKAwewrArnNLDbsL1ynuUAxnEKC96EagTiRm6PZb6jpscHF
 RUgC30UIApQ1DtQZuKGMvUDENIW5rY7dql1/YVU5sBjBYUnm7w38E1sVgSrS6iFK4Y
 eEr9PoP57iLPg==
X-Mailman-Approved-At: Fri, 06 Dec 2019 11:07:58 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: [alsa-devel] [PATCH v3 04/15] dt-bindings: soc: tegra-pmc: Add id
	for Tegra PMC blink control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Tegra PMC has a blinking control to output 32 KHz clock to blink
pin.

This patch adds id for this blink control to use for enabling or
disabling the blink output through devicetree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/soc/tegra-pmc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
index 705ee8083070..6fe28516017e 100644
--- a/include/dt-bindings/soc/tegra-pmc.h
+++ b/include/dt-bindings/soc/tegra-pmc.h
@@ -12,7 +12,8 @@
 #define TEGRA_PMC_CLK_OUT_2		3
 #define TEGRA_PMC_CLK_OUT_3_MUX		4
 #define TEGRA_PMC_CLK_OUT_3		5
+#define TEGRA_PMC_CLK_BLINK		6
 
-#define TEGRA_PMC_CLK_MAX		6
+#define TEGRA_PMC_CLK_MAX		7
 
 #endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
