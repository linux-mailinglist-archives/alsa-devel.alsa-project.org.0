Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE66F3BF87C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B5416C5;
	Thu,  8 Jul 2021 12:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B5416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625740471;
	bh=khI4EA61kkXi2NivuvRlcOwog9D4NlUGIynkn0DWZr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3lvL0f3JSrTuZOqYAbEzMMu4+cPYj0X2rtT091XThAle14plfEBA0Gi3/SjwBOmb
	 ljeC1t6fJ8bsPPIH8fVv0SLs4UcLyqwo0xyw1Z7nPzQe0mQ7+ZbqYSwhr26XXdNmGy
	 xpiaJUT7umS9SNCfsFaDJ1fEMwf5xkrdQyfoxeR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 085E6F804DA;
	Thu,  8 Jul 2021 12:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43413F80425; Thu,  8 Jul 2021 12:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54448F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 12:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54448F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p1FAx0sX"
Received: by mail-wr1-x430.google.com with SMTP id d12so6277807wre.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMo1FwPXUmdGeHuTylB1bhXZtdOnnUeT5f6CbSUaCzs=;
 b=p1FAx0sXOfW6uoejHheFl6xvVQZqCqeoJDup1pcl51HWurhVMhnRCKEsJ1RAQFooXl
 QJ60l7CT0z5JrFWInnEHnVZwDIkYjw2aTrwu1XB2ZDbggC51KvsGl0/sf/d6AIoUbqrw
 cTjDR63q6xN5qLSHPbnliQAk3djKNdR6PYveqztvQ7zA1n3zovLDGKzbJ7ZieeE7q7+Q
 RaaQb3N7RO94pciVu14NO/AFmQ3dk4RS6clfXnNiaU+uHL7FSdt0b+uHcKaiT29aSCwH
 NGHrQZTN7Kv1AXaDHq10myQ1w6EVxd+QwJsvFXjLPAIVzFqbaCQ00OT53LiKqJxL5WZZ
 oNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMo1FwPXUmdGeHuTylB1bhXZtdOnnUeT5f6CbSUaCzs=;
 b=c0M0ufSpQuCfPjdDUxWY2AToG2Dg8faBV+L4FDvTBKzzOgBIOyJe9m9wJjbK7mgavI
 R429sCi8tYxnDKYsJeNL/bGbeygL7XkBdPPtKfx2dDtgpT7Cjvt1GmDIVwTAC51Q/8Yr
 vln3jOE0oOCcl69UHQUSKBQX59s7b+S0CppfXfUVE4gnBGTjlPkskQmbPH+eR4CMRc3Z
 RRHoQMXxuqlJ4XAhoLd2lU4L5LNb0QBZWiKjtIV8aWhZPZVTwO25+mxobi+cw425RJxo
 D+SfBXvrSnMfkMj/3DpqpAA64nULBT6bIJVidgYA/kpyz1mZRaVTvWh2tl55rVGG1GUF
 PhDg==
X-Gm-Message-State: AOAM533SdrAHD2VDOLtMpt8C20n8rHQtFB7v5nmUEBN1LSXO4DdSurz4
 G5PF8Ij6PGxBTFyLMhiA+L0=
X-Google-Smtp-Source: ABdhPJzlvFcZx5xlorsp2MwJBbqPjX+k+YaeqaloucD+hMVipmfutFPdh/YzQIe6ATjQbbORHM8SLA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr27199118wru.405.1625740327975; 
 Thu, 08 Jul 2021 03:32:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g10sm1383954wrq.63.2021.07.08.03.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:32:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date: Thu,  8 Jul 2021 12:34:32 +0200
Message-Id: <20210708103432.1690385-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708103432.1690385-1-thierry.reding@gmail.com>
References: <20210708103432.1690385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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

From: Thierry Reding <treding@nvidia.com>

Add iommus and interconnects properties to the ADMAIF device tree node
on Tegra194. This ensures that the correct SID is used for translation
of physical to I/O virtual addresses and that the path to system memory
is properly described, which in turn can impact the range of memory that
the device can address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..07e61f084123 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -200,6 +200,10 @@ tegra_admaif: admaif@290f000 {
 						    "rx19", "tx19",
 						    "rx20", "tx20";
 					status = "disabled";
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
+					interconnect-names = "dma-mem", "write";
+					iommus = <&smmu TEGRA194_SID_APE>;
 				};
 
 				tegra_i2s1: i2s@2901000 {
-- 
2.32.0

