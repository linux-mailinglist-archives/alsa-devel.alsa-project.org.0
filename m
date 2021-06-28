Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E044C3B681D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 20:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9191675;
	Mon, 28 Jun 2021 20:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9191675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624903900;
	bh=jfwAQtORPUWIjFWGqXGLhjZrcKb142S2EhRxS0dVAP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CVhzGmeLYDb5dZN4O6K1TC087EZA+nQ4ug0uHIQ03LT+8rXBazp1osv1Pm2tZiS16
	 dcGSOOzBbQL7uW/Z4PIvib7UDdn7CRUrsLh6Q04jZp4dAjGBdS52PZncMxlS8cSjEB
	 8C4uQU1ZdGuSejJyrNGn5uZfzKgSBepTuAGrRb+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D23F804E2;
	Mon, 28 Jun 2021 20:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F803F8012A; Mon, 28 Jun 2021 20:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F4F8F80229
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 20:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F4F8F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GQPlJqWy"
Received: by mail-wm1-x331.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so358187wmf.0
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PU5EmP0vK/zlk943bOw9IRW6hnBl12QCnUBMMsEYT4U=;
 b=GQPlJqWyKI4Nzj5T3iDayxFsget1QW5dDoyzUyE3y1TlFebvKsHuZnuKDQenwaUYfh
 jt1boZZiaYfpnCCMeZkuZUs1DyXNpU7j9xh6PCG7iyVcHsAFLAPZrTwdi6atm97OpMsl
 Zi341mI9S7nzIAHshizb2K03fuhosrY0SNB8hSABv0q8Jv0Ed5gN5DCsVJic2qwYQeRF
 xrJ76i3/76qwG+S/5Z/KNeGqQ4VyUp2E2Hon59M6GUge0L9H9/YEPRq7QG85TxCqeryb
 Bw9MkznJcXlspDjH2obckej3cLpW4J4rp9tAYacv0Quk1bYlvyvKYvF+FwN13ClikKXZ
 uNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PU5EmP0vK/zlk943bOw9IRW6hnBl12QCnUBMMsEYT4U=;
 b=V4xe3EcO5npLN311FFwF3gr8YK05qs7j7iciJiSpCIkNtFLVyArsQRnOuMgEzqTieA
 b9jICR+hEMRC4hr6xjG+p7aL+4pE7rnA2z3AnMbDmoQ19gB/VLrX+TM37hEgyygAphkH
 BgjAWr+QpWLwu+543DkplGA1vD0qPK5T3tiq2s4FO/+6Aa8zyMDJQT0WdtbL1BVTtbvO
 FPE7k0wNL2mjqqmoYS4AVL9FxJV1fori+XMHqjZdu8uvjmt0q3NJwGoD2ccpZs8AuyYP
 Y74r0M7C6dmxRlXiXwl0OtfYumELr7r0nhR/Kj56HjarxCzAAbF9MMn2g8co4Qm3btRq
 W54w==
X-Gm-Message-State: AOAM5301xH1QXcmZ/Th4L5f7FteccGt93KJpswGtT800dGFqYfVxFydr
 f9uO3ufRYJzxSCplyUjioYk=
X-Google-Smtp-Source: ABdhPJww6WnF4wM3vbqWQ+u10Xvub+eJ62684M7pvUTgTJ6LKkMx8icKe24+3ov2Q2JXwDJgW3U29w==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr13396114wmc.24.1624903754624; 
 Mon, 28 Jun 2021 11:09:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n4sm15720917wrw.21.2021.06.28.11.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:09:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date: Mon, 28 Jun 2021 20:11:18 +0200
Message-Id: <20210628181118.2295007-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
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
index 1fa503ab390d..b957cb8df927 100644
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

