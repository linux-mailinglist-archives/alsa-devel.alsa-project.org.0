Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC611CE772
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209CE15E5;
	Mon, 11 May 2020 23:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209CE15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232590;
	bh=46QogPjZFBqkuJdusvCEayi0DL5x0yBvEKe8e3F4Tbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFoxfd55ayLK7q23GQRrqg7g80IVX4NcNAbjOl9okhMvK5pAnSwX+7/xd5mtY0w5/
	 0usqZbAWKDnOPl0Gw/NI49T/SX4Cg1P3mrl4+G8L+qCGYn3JGdoehtcmGVvSi/6cE7
	 Fiotx+ZUMZ+LwckrlSa8fRjlZhfkjZKt5Ij7MhWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90233F80334;
	Mon, 11 May 2020 23:21:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4410BF8028F; Mon, 11 May 2020 23:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75D2F80292
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75D2F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JnNRBOM4"
Received: by mail-qv1-xf42.google.com with SMTP id v15so1192430qvr.8
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xRY1m0KErmIZ74UyW3hlsHxRbMaFCXzo35FkgVl92k=;
 b=JnNRBOM4v2g1i49U+iT+4/3pcoNCEAsSPXMsrPsrKwfpgNyjgS21/YvkkXsMrcfVFg
 E4JZKzXYjsJ+r6MVF6aZDff8jyZqs44G/RLCYrs4tMDCDI1w6GyKM/4bIFIqaChPj7hU
 spSjauu+hdwXFhebEfoNEqD5eKFBKvgkKqC6BrmtLc/e0j1FsR2l/1x1AZwAHx6GRcB+
 XMGest6d6L0JHAXw99SrFM5mMGYdKPpN09WARI0PdLKKGU54uyYtDP0LmLY2nBEDMFRC
 E41sv+zHDmOR1hyA2mIjTp99n2Rn4XdJOGvfjl6SsuYHd4N4llL1P3PCGWbzofiNSO+k
 mMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xRY1m0KErmIZ74UyW3hlsHxRbMaFCXzo35FkgVl92k=;
 b=ObeZF37Z/4IuljMkINhgCppQ4BUujljiW8zQcEPyPU1AgcDl6VnxSEMzXl3JaIEjTf
 A2pGUu0t/wwSxS9bKi11bxBIpxPbwnKoQBtCNT1YNIJXyUAnLweW0FmhReHfpbQz70Ys
 301XtGH3QM99e3Qu8D154pxDQCYpk5M6Q/E9eqd4irtj1RRLSVnKWAl1rdKfM4stiWeN
 bt8gwRdipBrxfpVe9iwrnoTZic9nZ9FBBZXsUwlKePyUc/82IguPvtdjk4f704YZAiWe
 UdWudpg0aizG2Q27L3Dpqn04B5boYAPYzB5sI39JZDfrxjrQf7ixMdtXqLth5dOw4VXA
 ZGtQ==
X-Gm-Message-State: AOAM533rVcXHZuANCuCKCelBrFb0yDcyzcEFhB27Sq2AEZGMM9WZQF9J
 WTU84Y9Gxl4C74Ig0uGQtXY9kZSd
X-Google-Smtp-Source: ABdhPJxpciJ0oacFnDhlfiQFhv+72B7BwMoHOwYWUCB/SWnTDj0gQ2B01Yd8nmxKsF+ZqtlZ7vsqxQ==
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr1115967qvb.85.1589232036803; 
 Mon, 11 May 2020 14:20:36 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 11/14] ASoC: amd: enable Renoir acp3x drivers build
Date: Mon, 11 May 2020 17:20:11 -0400
Message-Id: <20200511212014.2359225-12-alexander.deucher@amd.com>
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

Renoir ACP3x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/Kconfig         | 6 ++++++
 sound/soc/amd/Makefile        | 1 +
 sound/soc/amd/renoir/Makefile | 6 ++++++
 3 files changed, 13 insertions(+)
 create mode 100644 sound/soc/amd/renoir/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index bce4cee5cb54..5f57a47382b4 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -36,3 +36,9 @@ config SND_SOC_AMD_RV_RT5682_MACH
 	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
 	help
 	 This option enables machine driver for RT5682 and MAX9835.
+
+config SND_SOC_AMD_RENOIR
+	tristate "AMD Audio Coprocessor - Renoir support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP support for Renoir platform
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index e6f3d9b469f3..e6df2f72a2a1 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mac
 obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
diff --git a/sound/soc/amd/renoir/Makefile b/sound/soc/amd/renoir/Makefile
new file mode 100644
index 000000000000..43100515c7db
--- /dev/null
+++ b/sound/soc/amd/renoir/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Renoir platform Support
+snd-rn-pci-acp3x-objs	:= rn-pci-acp3x.o
+snd-acp3x-pdm-dma-objs	:= acp3x-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-rn-pci-acp3x.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-acp3x-pdm-dma.o
-- 
2.25.4

