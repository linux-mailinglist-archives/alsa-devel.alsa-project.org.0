Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E263E308877
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 12:45:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF1016C1;
	Fri, 29 Jan 2021 12:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF1016C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611920721;
	bh=lgfuwVbPAjDM8cAy8fpHCNVe9+ZcFmCMiPsl3/o4IfI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5S7d7C0xE0Maub5nQG6TZmJBEQf3ug5QRzoBzw8tNFYpue1pB45Ku0/gAqG7xe7v
	 KiX9WWDiSPoursZEXA18ltq2dgmh0XyX6Ogrdg0g56Pk/QEbJvsBsizgIfrTAQlWlC
	 5sG4LvRZkmqM1M+DpHYm5+i+5qD8hBJhqrBFlUZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A56EBF804FA;
	Fri, 29 Jan 2021 12:42:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237CBF804EB; Fri, 29 Jan 2021 12:42:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7DC1F804D6
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DC1F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="F8UV3lKp"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6013f4890000>; Fri, 29 Jan 2021 03:42:01 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 11:42:00 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 11:41:57 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 6/8] Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
Date: Fri, 29 Jan 2021 17:11:08 +0530
Message-ID: <1611920470-24225-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611920521; bh=I95udSMV/XUfuFEVmUIVdulMrVLxZ9bvj1yUdPIvxCs=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=F8UV3lKpdt3pJgbDbcuhOi23g1BqYeRSYQsbQ1VNWHwSGC1EYYWyHA92RuYVQiwE/
 PMoxlfmgM4myZ7hiAuQN8wxTmmOefNZY/Ei/Ke7oWS1W2JxgqvnQIp0cYyDTR2aSNK
 1VMx+bVn5xLNTNoOJy/ZmmijA7l+1pYEopewALrFf6d+W7fWE3ekX1JYsHCIAdDfgO
 FKUM5x1kl8dsomJxXGE2m519haJAaitmBu5KUqOKSSEs7/4B03tmy4LaXkPupYCiNk
 yXXRpwmRH9igsHlLUPBSu6VO0eCge6NykAKM7/fS8GSegWZPmAAlwoYMt8ZOCwif/D
 524fJ97XIuSCA==
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

