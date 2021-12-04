Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD14685BB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:44:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD1C2589;
	Sat,  4 Dec 2021 15:43:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD1C2589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629083;
	bh=wNxPW6eLRdciKT704yaY1trEmuk9k1wsD5CrULcNw/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfAVFsZl7c0M0lUuqHkXIpetO+jKnvf1qYv0v8YKC6gd5WUKHeXmRIQw9eHTobwEp
	 yhd4oP0ckMb5ZiG2VIrtdKRr/8yxLvzFiukKWFmNHd2gXwZJPovzpvnl21mXFJCPGI
	 09BJ9E6Xccl9c5KN+szwN6/GKVnWctknujp+8U8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D861F80570;
	Sat,  4 Dec 2021 15:38:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E4BF80539; Sat,  4 Dec 2021 15:38:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,SUBJECT_DRUG_GAP_L
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8683F80506
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8683F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BT6hF6T3"
Received: by mail-lf1-x135.google.com with SMTP id k37so13823882lfv.3
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LOjZjTQZlhp+jMD4XSw/sLUK6fzJWwcAyuJDWpowbN8=;
 b=BT6hF6T3DsytuOd6SZTcNzXERs13rmeoOu3/mz+D2wWE2AEXMz5AePtAKjON5adhiv
 4Eg+x6YMh0CmlZn29bmGzIUhZXTblIjx+gJIW5X+MLpbWUwJQq3t5PUFtUHEYOqpoXUj
 N/s3bjtzOgj4kf14X1ujZUvJ4TRdA5W+5DWqyx6jGpSj9XZgngr7RYky1XfCqbZpkcIb
 6BQPPAfxfQAUlhDUa9m3O5LiPcRAToD8BYhHqf28PXgIp50KAXh7V9unj8WtUV9aVTXA
 AUhfIcMScoN74mYSp/mdxpnhY6ggEUe2k6I2K7X8MbexqLi+kCyO/lJtkJWGRoSzZ7Qm
 qL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LOjZjTQZlhp+jMD4XSw/sLUK6fzJWwcAyuJDWpowbN8=;
 b=3fBQyvGP0B2dca2HaK5ZnddqZvzrMyzzoC5eH7dDLtj+LfWnwhTdJt/isCu+S7/bGL
 X+axSkZfWxDo3fRXF+2f4/pBy9KMuHH79mfce1CDAAbEHqFJ9bv3zN5kEBL7Jvx/+EI6
 D1jShkUheXX3B3Q1905HI4vX0G7Rs1tph3V28XXO9TnW6Vv97mfs5DpUR/fhyWlRxlRK
 UOvMVW5mNggvGgQIjfdu0qh7QH/m10BwrrcEY2KxIeMwFZYGAcWq7CsmoQto/LcEtVIq
 tJl/bHubbTvKtaefNxMC9vTF7MoPEVtMHLyT+kiiDkFxHXNnzjP5ruhV3S05yBajiuyy
 Wf7A==
X-Gm-Message-State: AOAM5322JYIwvmJi43GSkBSy0jjxj5PYX+L2OQOSW+JEvwHp45iQtUMB
 I88Tr1K65QWwERnQhu37aG8=
X-Google-Smtp-Source: ABdhPJxhAPoQB2zlY6ocg6tiCwvhZiauqouZ0jiz1JFXhJD0zm6ESqo3oOCFAyGe4uYC5aPabMjVTA==
X-Received: by 2002:a05:6512:114e:: with SMTP id
 m14mr23806948lfg.418.1638628665202; 
 Sat, 04 Dec 2021 06:37:45 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 17/22] ARM: config: multi v7: Enable NVIDIA Tegra20 S/PDIF
 driver
Date: Sat,  4 Dec 2021 17:37:20 +0300
Message-Id: <20211204143725.31646-18-digetx@gmail.com>
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

Enable Tegra20 S/PDIF driver that is a part of HDMI audio subsystem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3d509bc13444..172838566ecd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -762,6 +762,7 @@ CONFIG_SND_SOC_STM32_DFSDM=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA20_I2S=m
+CONFIG_SND_SOC_TEGRA20_SPDIF=m
 CONFIG_SND_SOC_TEGRA30_I2S=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
 CONFIG_SND_SOC_TEGRA_WM8753=m
-- 
2.33.1

