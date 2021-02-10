Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E058315FAF
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 07:46:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1DA16E6;
	Wed, 10 Feb 2021 07:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1DA16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612939595;
	bh=8BQd8mGbQEelDG1IXVr7ioBFOIHqFzs2II2b0OsIhdA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUTKWu0l3NvpTqmaZeMxaEFg2WQ6L2kl6kHCUyVcmxslwCzWHtSe4rpgpNGqlHDcF
	 8rSU92DaZKRX6QmjR899uY22beiKNgr87nOr4vSTHJ6/85s9dv+abbzPJRRu38P4zq
	 g1+wUVK/y6/3AyKA5G9k74TxzdY1CZT7fZ38mf0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C86F802C9;
	Wed, 10 Feb 2021 07:44:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9D4F802C8; Wed, 10 Feb 2021 07:44:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A1EF8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 07:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A1EF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="FwIIzewB"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602380b50002>; Tue, 09 Feb 2021 22:44:05 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 06:44:05 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Feb 2021 06:44:02 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH 3/3] arm64: tegra: Move clocks from RT5658 endpoint to device
 node
Date: Wed, 10 Feb 2021 12:13:41 +0530
Message-ID: <1612939421-19900-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612939446; bh=6SW2nvW04ev7nQ4NL1cPmnyz03i1DCHkXGNng6u1qwA=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=FwIIzewBZ0gzhL6UOvyyBHy9Na4CyfxoavNcihNI+DrM+34yih/iKBYQPNaHD0iUb
 cBbndyUKJwAZUVUIhDGxxx4R5+RRa5IGBtroxfVD2ZCqRSuNtYQ9q9FPMa9F89SYIz
 mIWMy/WiFeaj9i1rx7gbMVJci7ePP2Sfmi8gjDl7or2r9AbKAW7NJLJeNVq/ao2r23
 Hl8lUyF06oh3HjkNx/2NcJqLeEfwRhtKQ491RCkoDBj/L+A23VcW7RyLX5mrw8uetQ
 xEZ9kuQxsHBbxCXoneKHMXUumm76Lar3KSt4OvLOKTjbYluc3QBizeNZITTc9fZJSI
 U0DvaW6kRIFBQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

An endpoint is not a device and it is recommended to use clocks property
in device node. RT5658 Codec binding already specifies the usage of
clocks property. Thus move the clocks from endpoint to device node.

Fixes: 5b4f6323096a ("arm64: tegra: Audio graph sound card for Jetson AGX Xavier")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index b079420..ef41349e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -651,6 +651,7 @@
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				realtek,jd-src = <2>;
 				sound-name-prefix = "CVB-RT";
 
@@ -658,7 +659,6 @@
 					rt5658_ep: endpoint {
 						remote-endpoint = <&i2s1_dap_ep>;
 						mclk-fs = <256>;
-						clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 					};
 				};
 			};
-- 
2.7.4

