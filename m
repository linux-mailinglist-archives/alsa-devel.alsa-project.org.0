Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F069E1CE771
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989653E;
	Mon, 11 May 2020 23:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989653E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232552;
	bh=ljoaQHBwZRHu55eF9o/cNmQXpqSs9ovlhMoT1Q+dd6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCzE3uwzRgdhMxEtTSkI+v7V5ijegCEDilwkCdTspN+k4B5hHWYrSYixD24H3OyZA
	 tzcYjbbSaRbP6c8mks50m7NfG/ilNz3qzPl7iivf+iuwgxPm9Yyxto5ytBZL3RDHMF
	 aD0DDa74s1suwecJtrU/UElPPswDujNQPR2a3m/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D6ADF80329;
	Mon, 11 May 2020 23:21:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E408DF802A2; Mon, 11 May 2020 23:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61018F801F2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61018F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ep7G1d5S"
Received: by mail-qv1-xf2c.google.com with SMTP id di6so5291933qvb.10
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6yBAiNRwLbkpZxa9KOV+ZDmKElx0U2cviHhXRUQNGw=;
 b=Ep7G1d5SttpTIYNaaMFt4Yt/l8e3A6Vbk7N/7wBzcfTqg7G2O2JkhosknzHXjmgTva
 MYajep/fZH/13JRuuJNDp5CTOQUSo0j81bajvKE+AkVSbmp3WHdpZ/PdafRo4U6XTVAX
 uLY4xPdTCnZu720jpiMz6+CXhiYuTg1+vzV+Q1wlSkqYtTC0NB0VHbP7kpUu/0A1uMUR
 gpR98TisNS65622ijCI6ZJ0Vz1AdSagbtKHGNkg17Qdyixl4bLOM1imqOnLSViEKV+QH
 c7BlnEoogNMCZzcSatPf/Iit51MehGMjXgypn8n1DJ0slVN1+hho+wpzduHav+5z0cxB
 S91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6yBAiNRwLbkpZxa9KOV+ZDmKElx0U2cviHhXRUQNGw=;
 b=TJMEE/QzZWqY5SlTFM6+PUal88R2duDj6C1I0sahsAVBvOH1xZhgKHEaTKCkYIdPuX
 CsC/CC4XJ09xZJWy14Z8WZuYpsi5gAcIF4T2VgQpK/gRAGrrzbaIjt0Lm55+c+0CUrIK
 hVbJ7mGF86DRU+7qmmZ3KYwUOZmjME24wf1J8+6bGWtNpzcTRjHkJDEyR87GLNLF2Rto
 UT6xn04Xo/7IU0XvYWVW05Xyt9eatO2TU7Cfel7kZdRx6eBwhsQZrAPUWe27FCs8jrr7
 xvhMdq2YFB2yo6Ggyjkax/ZI5ukuHM2SckPMwuY9WjC53z9fP4ZTehouPsHWpHSpCwqk
 lNcg==
X-Gm-Message-State: AGi0PubeI8c1zrIw79Rdx4dmAnzuFPYjwTGPYPIV6z+Wp4J3tWzNRULw
 UxDuAxjpjlTjoj2tgE3tDgdiSVaI
X-Google-Smtp-Source: APiQypJOEP19nfM64wYRSD+Jiq58dgSsCQKiNrOXKs7WqX0sCv3wm631LWi/RRtl8qnEreoF9xtmkg==
X-Received: by 2002:a05:6214:1152:: with SMTP id
 b18mr5498493qvt.13.1589232040696; 
 Mon, 11 May 2020 14:20:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 14/14] ASoC: amd: enable build for RN machine driver
Date: Mon, 11 May 2020 17:20:14 -0400
Message-Id: <20200511212014.2359225-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

This patch enables build for RN machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/Kconfig         | 7 +++++++
 sound/soc/amd/renoir/Makefile | 1 +
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 5f57a47382b4..77ffdb41bee5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -42,3 +42,10 @@ config SND_SOC_AMD_RENOIR
 	depends on X86 && PCI
 	help
 	 This option enables ACP support for Renoir platform
+
+config SND_SOC_AMD_RENOIR_MACH
+	tristate "AMD Renoir support for DMIC"
+	select SND_SOC_DMIC
+	depends on SND_SOC_AMD_RENOIR
+	help
+	 This option enables machine driver for DMIC
diff --git a/sound/soc/amd/renoir/Makefile b/sound/soc/amd/renoir/Makefile
index 43100515c7db..e4371932a55a 100644
--- a/sound/soc/amd/renoir/Makefile
+++ b/sound/soc/amd/renoir/Makefile
@@ -4,3 +4,4 @@ snd-rn-pci-acp3x-objs	:= rn-pci-acp3x.o
 snd-acp3x-pdm-dma-objs	:= acp3x-pdm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-rn-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-acp3x-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR_MACH)	+= acp3x-rn.o
-- 
2.25.4

