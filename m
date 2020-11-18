Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289172B782A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 09:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5C11616;
	Wed, 18 Nov 2020 09:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5C11616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605686961;
	bh=2SgWWwDvv44DiI6rNvGMwIqmxgDg0cOwSZP17jgBE1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzwGOMDrtji/xIZtHSJstSzyLLZIOSvSH9P1jKeEdf5hnvglPhT0j8pE6kgkC+F2L
	 UpFc95/4N8tsmp4BvEf/6OJoj7BaOGZVzDaQJR/g+ZAblV5vsk+FeyQ/T5bSAbGC6q
	 v/QB1qY2Mes7Ixuwn07mp0H0wuH5q0rjxwSc0DJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A149FF80158;
	Wed, 18 Nov 2020 09:07:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E03EF804BC; Wed, 18 Nov 2020 09:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06920F80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06920F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="jz8pZt0U"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb4d6120000>; Wed, 18 Nov 2020 00:06:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:37 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:34 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <broonie@kernel.org>
Subject: [PATCH 1/3] arm64: tegra: Fix Tegra194 HDA {clock,
 reset}-names ordering
Date: Wed, 18 Nov 2020 13:36:20 +0530
Message-ID: <1605686782-29469-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605686802; bh=5+i2Us2XoqokmBo59PMW/PDmxf9BY2baahXD2ObGdOo=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=jz8pZt0UlfYGjujrBtGkxBbEEcPt2tA0RLOS2IHsfP/36DUM6itDIISeaDpiIzZsh
 iu/cO1UCMBYgPXkdaTeE8kAzSLDa27GzJ9irjBiifR+l4F+JDE7BZx+PysUkEuUb6V
 D3IuoCnrKUdTjYQVQVSeT+haQRs1DZ/8goBTHAXESWt1Ah4fftSIESeGWA/zd523Gt
 wYno5mAUsUSavI1nT4XCHDp94INKCLXNx6wePDJsfvYdD4k6MCmUU3n9O2ZfAXUqCq
 KWoIz0BZ7m5T+59uJJMn34UVST/JrcTSCYCRQUTdUha53kKOftv26annTWuPp5xhqN
 7RNwPa6LtAS0A==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

As per the HDA binding doc reorder {clock,reset}-names entries for
Tegra194. This also serves as a preparation for converting existing
binding doc to json-schema.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6946fb2..e3cab26 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -782,13 +782,13 @@
 			reg = <0x3510000 0x10000>;
 			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_HDA>,
-				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>,
-				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>;
-			clock-names = "hda", "hda2codec_2x", "hda2hdmi";
+				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>,
+				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>;
+			clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 			resets = <&bpmp TEGRA194_RESET_HDA>,
-				 <&bpmp TEGRA194_RESET_HDA2CODEC_2X>,
-				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
-			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
+				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>,
+				 <&bpmp TEGRA194_RESET_HDA2CODEC_2X>;
+			reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
-- 
2.7.4

