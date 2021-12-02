Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51C466860
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:32:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146D1296A;
	Thu,  2 Dec 2021 17:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146D1296A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462720;
	bh=F/TcpBb46EwAcwdC7OJY0wG1teOmVGW+DZQ2tTRLynA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDFBuhRko6WKQEv1NJW0OqjIBIdEWJ6A5hXumlUSziMILlhml8ZGckPCKa2y6TrXu
	 lDrmWe57Oku2/9o5wPL25vTq+GEYRyshHsFTT5ykYnfAvkHAT1XEtDnpQywBO/0RTu
	 Vo99X68BaY84naOJLIbjT3fVG4wKp7gqoZrN4In0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34042F80568;
	Thu,  2 Dec 2021 17:25:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B6BF804E2; Thu,  2 Dec 2021 17:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9097AF80507
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9097AF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dOu9BzuY"
Received: by mail-lj1-x22f.google.com with SMTP id m12so727307ljj.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=dOu9BzuYlTpC2xjUx5FiaMQmzvC0Wse24LfnaZaGLEnZl/FIac+px7wWke8QbzNAHA
 AUSCNbsbkHs8U62J8652zcWyqb5SdMFhuU6x6HH3IzkjJyGdJoOYLvCo5TpceADEvsmo
 pVQ8cgX5xW2XmYL4X4xMa4Sy8Xvg10aqJ4SwvMMBCwz67mY4Zfk92fyYIqAzwerVH2vb
 igSfwldVzZTlCAmUTo50E9viuaP2xWAJNuoZ/ZtlbWWjVrG6ZzOxzKR73a8dMnwEXVb9
 SmMKd2QHwszU77E0A0Mm/FsZsLeNP0piWAdNaOoLcsF7oBBnU5wmAT+E9b1/b+thLU5E
 Wezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
 b=aXcJdfHVw4QFTus4d0RgagiBubz9QScUwiz83S6NbAbdgjeBIOC9rYkT7/YoEfvik8
 wE5g8Jstr9FKe2EZS3Um9dN5AavlJn1Fq5fGN3VDhzxOnDCiXdNzGeKFMoxBQDbKzvfY
 5+qQTqD4nhd57dovFYU7nmAe7LzxFxIVJ1EJ1yFhEmkfytVZ8W6UDvlOURsqMmjkde3u
 iL+WivOH0pIIQJI8oGXFKqzvKsCAD+rqLJchAyAqQGKpJVZG0Bvr3qmWZBlBRIAWGR0n
 BqpMKYORj4tIGrp2s3/bsH538NZWwYcKOEMr+GU2gybKW/glnQ0OvWyJwoHjRGSXcETG
 XblQ==
X-Gm-Message-State: AOAM530TSw4Co1s+W8Y+EqpMwQq4uypu8j2ovuxosWDbHI+wS+kwMBCw
 X0Ffv8ATCo5gEcX0UH/i5s662acN17g=
X-Google-Smtp-Source: ABdhPJwFLCUx6fgXehIugB4BT94Un9o4EbO9rkra0kPr/6ZY+CbsP9zrdLCdoVfQd7+OsnpW3h/Glw==
X-Received: by 2002:a2e:bf24:: with SMTP id c36mr13354979ljr.150.1638462330933; 
 Thu, 02 Dec 2021 08:25:30 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:30 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Thu,  2 Dec 2021 19:23:37 +0300
Message-Id: <20211202162341.1791-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Enable Tegra20 S/PDIF driver. It's a part of HDMI audio subsystem on
Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 736a0d25900b..f8b40cfdfb3e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -239,6 +239,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1

