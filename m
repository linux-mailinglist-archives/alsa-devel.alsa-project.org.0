Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9624685BE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48CAF25D5;
	Sat,  4 Dec 2021 15:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48CAF25D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629137;
	bh=jDXAsCTp5fOt/TVPSYsZfrXP7WjDF9AwiKGOH1Q/i3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxZVElzWxo0lJMj6IXb/lHEa21a1fvjDRYPZqk/iZoTUsiRJPyqE56OMrlVid6S+p
	 2F9hZPIWenD517nyiGNd7Ax/gCk3CEDcMnlix51gVYBAFnbZbwhBPmtXeFNbwgo7wO
	 d4CwI2+xpD6WTdEZPgwlnCVvRxZbQW4wIMfk/ROM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D480AF80520;
	Sat,  4 Dec 2021 15:38:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D07F8053D; Sat,  4 Dec 2021 15:38:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,SUBJECT_DRUG_GAP_L
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A93F80516
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A93F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J4nAQrAk"
Received: by mail-lf1-x136.google.com with SMTP id k37so13823933lfv.3
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJMd0+EtuV8FsgOp2tgrhJ12mBC/qiVsCflNDi5Px6s=;
 b=J4nAQrAkwH/Gnv10HYyAjYclVHwZ+Dc+e/HU24jpCQyfQIGuL/LYsyHcT9aqu9mBlx
 2ZHGA6QHLDHz50XWqOBT+vAeYt6WoD+kq5GEPUMaGtalmcJLgDCYbGDhPww7PTQnoFd3
 TdDvinyvBhzu/c+25gWOGq2vRncyxEQeLYZORThcTukOn5+6KGofzmtR3Qb/rf7mdzYZ
 dhm9fQTmPgZQrrQxvnsoRoy1U28BLOLbQp43sjLlU2REomLfcKEyLWvJz25ftJzrh2C5
 Dhl9Eq0R/X3teSl9udi6jfE/tTEND4svSK+icdKmX3EQDfRvdMrJNUi/A3D0N5iU4h12
 9gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJMd0+EtuV8FsgOp2tgrhJ12mBC/qiVsCflNDi5Px6s=;
 b=ZF/kXCdTZ0y55d2i5qc8UEXImR1knEDyKVWxiigH30TlJ1I9xvGdZHecia+XE+4lae
 TpdknMt0XPqDnheRTj6aVqwMxSxfos/egw+hmbfD/328EvYm9T+deUErcp7n8QQHPKE3
 QmBaaaU4j5c6BbysSaua6i00VaHg6dU2xzHIOGwLxckBsKWDazhd+qaRza4NBErnwIOB
 m+S5JtzpLinoBlobA3PbgIeTeBnrBesFGPZfTcQly90QV5zvxlIngEf9O5YhIJmtTcvY
 ru7ZyOV8zYikUL9nbSxsfcqz3o+5zgxY5jrIIwWmbDo0SMydKKKtHHkXB8+8EmytiSm2
 NDVA==
X-Gm-Message-State: AOAM532FmlF1/HYylOyX2/To/XG/p+Ex2PcmzwnbDBkuwhabGokdTFOL
 8hOLC4Uf7D71LQwlbG1IYQqF0jbQqeM=
X-Google-Smtp-Source: ABdhPJxC+zJx/5U6pfryZSqx3wxezgPHC4eT68U4AvDzjCAnen7V41d2UBAvXQDOy6dpXUUxt/FC9w==
X-Received: by 2002:a05:6512:22d3:: with SMTP id
 g19mr23416505lfu.404.1638628665976; 
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 18/22] ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA
 driver
Date: Sat,  4 Dec 2021 17:37:21 +0300
Message-Id: <20211204143725.31646-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
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

All Tegra20/30/114 serial and audio drivers depend on the Tegra20 APB DMA
driver, enable this DMA driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 172838566ecd..8863fa969ede 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -958,6 +958,7 @@ CONFIG_ST_FDMA=m
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+CONFIG_TEGRA20_APB_DMA=y
 CONFIG_UNIPHIER_MDMAC=y
 CONFIG_XILINX_DMA=y
 CONFIG_QCOM_BAM_DMA=y
-- 
2.33.1

