Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C8308C92
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7831683;
	Fri, 29 Jan 2021 19:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7831683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611945119;
	bh=9yNvczujMbAHZ+LztQHdstL/bOaWoRxaZttkKyG/moc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otkGmWKouWV+lwyH3uu0MMKc7RdHJheoN3rWXwBwuCpALNSJLpyKENjQhIMGT+6Sz
	 rTGEbBK5WddbOxHMsulbQG7P9VmzE9cSQ21/fmw1O3bZR7xYToO99KBw/3Xe2IhjMq
	 CvDKDg0dCDo10j+ePPmoCI+XKJJalX89ESTe48+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F294FF804F2;
	Fri, 29 Jan 2021 19:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D22F804EB; Fri, 29 Jan 2021 19:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD49F804D6
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD49F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Kc9GNouV"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453c10000>; Fri, 29 Jan 2021 10:28:17 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:17 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:14 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 6/9] arm64: tegra: Add RT5658 device entry
Date: Fri, 29 Jan 2021 23:57:43 +0530
Message-ID: <1611944866-29373-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944897; bh=kUDuAR+PUTUVvEzciIgYIxo2Rqb7F6D5EW+M6G9chIs=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=Kc9GNouVBTC7R9ls6rMDCasfiC7Q7FhU0oWIJB2JANESZH0w4uwQt9W1boElXF/aR
 4TpHvdCcOOt5TpcTPgxSXjcIBG2P354Xwc0maV78/5hoMq3tFnOMnFSXyHAkepAZmJ
 3X+GW466P5xS0IkrjDnYDCrklrGld925TNGLfHT4+WIHXGMpOW+OKSzV6cSS25wMks
 vGktssYdwvl8qJ6mpenfkEB9JJ2OjrEdjsVELlkimQcSkUGkhLJtCkzqYP4la14XoB
 fWiSoForuZTCfX2H1+KA8DbMB8jBOCZm7qgOfikybU7rvnhQ1edJPxHb8X5ePXohUu
 quFi19RH/0Irg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com, sharadg@nvidia.com, linux-tegra@vger.kernel.org
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

Jetson AGX Xavier has an on-board audio codec whicn is connected to
Tegra I2S1 interface. Hence add corresponding device node for the
audio codec.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 8697927..36f19c9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -41,6 +41,21 @@
 			status = "okay";
 		};
 
+		i2c@c250000 {
+			status = "okay";
+
+			rt5658: audio-codec@1a {
+				status = "okay";
+
+				compatible = "realtek,rt5658";
+				reg = <0x1a>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				realtek,jd-src = <2>;
+				sound-name-prefix = "CVB-RT";
+			};
+		};
+
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			status = "okay";
-- 
2.7.4

