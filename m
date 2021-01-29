Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BA308C93
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:32:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5F1F83D;
	Fri, 29 Jan 2021 19:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5F1F83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611945137;
	bh=lgfuwVbPAjDM8cAy8fpHCNVe9+ZcFmCMiPsl3/o4IfI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJzAS4nCHRDKsECeR+uUqMC8kOmB+o4DBVwBdBRX7LbOmfDKLH+xBmtlIh1fcbsVq
	 pxu3OhtuXivWzQd57xQL2FoWf6F5OuJnZif7ghodfXkWECl5Q09CBA0V0pl6FpzBPo
	 QsnoMmIJ6I01R9wGfmOv1Zz9e97zsClW2RE/QCNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1076DF804FA;
	Fri, 29 Jan 2021 19:28:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 389BFF804FC; Fri, 29 Jan 2021 19:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF2EF804E7
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF2EF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OmoUYQrg"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453c50000>; Fri, 29 Jan 2021 10:28:21 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:21 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:17 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 7/9] Revert "arm64: tegra: Disable the ACONNECT for Jetson
 TX2"
Date: Fri, 29 Jan 2021 23:57:44 +0530
Message-ID: <1611944866-29373-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944901; bh=I95udSMV/XUfuFEVmUIVdulMrVLxZ9bvj1yUdPIvxCs=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=OmoUYQrg/YSr24+iyc4mBwtIC21nefrGcNzKRO0gpVqfnOAJ6XhBMf3ktqB6jNYzj
 f/BWhzZtg34HHNo1lfpTYa1L1IhmVwveXsNmlm1zukZYy7AlZe9ORbjDX2On4WomHG
 /XUFfxOrlPanTylpJpYvhjA81e1dyJH48Sss4XlLwKV7AMKr45zhH8j35tI02mZpcr
 pNwgQdc+RGNED/mwKgG3DA7a+0wb8VxoCnOFNtAIbKUdt+6ManrAlSKSLPGLnHz+mG
 luQyuyf8mQMc2i70WiBDrHLQ+tXuOmoyNERz7CfEY5ErTVtHdskz74A2lD8SAcWck0
 tEHf7wthl3/mg==
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

This reverts commit fb319496935b ("arm64: tegra: Disable the
ACONNECT for Jetson TX2").

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 6fd2e05..7e1723e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -10,6 +10,18 @@
 	model = "NVIDIA Jetson TX2 Developer Kit";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
 
+	aconnect {
+		status = "okay";
+
+		dma-controller@2930000 {
+			status = "okay";
+		};
+
+		interrupt-controller@2a40000 {
+			status = "okay";
+		};
+	};
+
 	i2c@3160000 {
 		power-monitor@42 {
 			compatible = "ti,ina3221";
-- 
2.7.4

