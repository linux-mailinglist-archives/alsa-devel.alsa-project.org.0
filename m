Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264781C628A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6C3178C;
	Tue,  5 May 2020 23:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6C3178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712483;
	bh=46QogPjZFBqkuJdusvCEayi0DL5x0yBvEKe8e3F4Tbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lF0GPiDopYLWCSk/jPod8o6CiZGp9rZNooNWPI6Tl9K/7+jP4X9SNPfZDW5oGm7Hq
	 4x2Dej41MVliyyzNspzbqNByfSLUh4l3G44qtntEaupgz4WczH9Y/Nags4bhT9kvyz
	 /KUJdWVXcgaDWjY2oZGMCfpu0goublweXl6BTiTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7630CF8031A;
	Tue,  5 May 2020 22:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40FF6F802A9; Tue,  5 May 2020 22:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86176F80292
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86176F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kh9+fxMF"
Received: by mail-qk1-x744.google.com with SMTP id q7so287829qkf.3
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xRY1m0KErmIZ74UyW3hlsHxRbMaFCXzo35FkgVl92k=;
 b=Kh9+fxMFyzREdS+9NW9f4oYzmmlZl77IT089pgdF/VpCnnTHcDW7E/rZXd0g/1OwZr
 YmKjqJGwS8VKWSgY8QoqlxiPS9vrZYn6LxLUIU1B/j3eTRYwM0ItPjUUSSeN6RTMKSDN
 de9xhjp8FQWuFgytzkmHd/vzU6Wyuk722hQ6G6Tm/f1R/kNXQKsb0m+5uURwEQZiUb06
 pNmbrdt54+SBBDI6LUeoBszw9RV498JwufaBSTgdIFdkaT7/bXgOIV5y/IgJ3coGkb3w
 ayUajhrl+xwuxwYgR4CSb5+G+qd6ZAaH08VLuiG+AMMtv8VI2C7Z3k34PwzNaW+YwMz2
 OEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xRY1m0KErmIZ74UyW3hlsHxRbMaFCXzo35FkgVl92k=;
 b=tPsd8SaE2IBxekKEfdlpOofEGL+vhQdiq23Vg23Yvvgux80xixOfL+y5AzyS37Sxsj
 SXtIVlcEnWXpqQd63NUc6FmFlDx/lCW787uSXP4RmBGMPIiuB2SWLQF8th3Hs23l5Vxu
 WoX7uS3mTiowcWcgAYbMlivATg5qaT611uLu01hpBV31B8z9QjdPrFfLr/8GzYTNqRjz
 phP2KpKLIRO4OxV/l2bgtENuYSpVdr+QvrZbbrPD0vMdQN5HOSNJbzHj29H8Vkw11pwV
 NnerhDaPIKy+xVrH0r2ZLj0V1F0kUJO9Zq+kqeew9C6SWrc7rge8wd5hRWQj/gOypNWt
 g6uw==
X-Gm-Message-State: AGi0PuaBAynAnYuB71dezLPKnLytB1cV1fbWhkOkaiA8Mtet+Kg+LFo8
 SpOtpJpiRawkrCUpJ/ZWAMfbDWko
X-Google-Smtp-Source: APiQypIjnf/u48vLXwshKrliXcsBtrKL++Jdh72y/gkMah5laleoPDsVOkroqeobv8M3k6RDKErhAA==
X-Received: by 2002:a37:a542:: with SMTP id o63mr5740656qke.332.1588712031086; 
 Tue, 05 May 2020 13:53:51 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 11/14] ASoC: amd: enable Renoir acp3x drivers build
Date: Tue,  5 May 2020 16:53:24 -0400
Message-Id: <20200505205327.642282-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200505205327.642282-1-alexander.deucher@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
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

