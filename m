Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DA45CFE1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14957181D;
	Wed, 24 Nov 2021 23:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14957181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791958;
	bh=9EcX4jOmIU+43AMkKdabHqLJOG2xOBvSPljvX6kGj/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xg+U0BBGjF2HvT+LoKPX6P1iNSm7pw+QAJmhWkZKy2C9IKsqbxMEzlCFNBQoMPr9G
	 Mk3SKhAl03Q/QKw4ODbWhuHwCHJC8SfGcVeMmdPv2Q5ZDRHXIuvFcFPZDw+NFjBoBj
	 d/PNvBssgo65avdHmEJGgMh3qf+LVLguin10FoXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A438CF80542;
	Wed, 24 Nov 2021 23:07:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3571F8053A; Wed, 24 Nov 2021 23:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D20F8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D20F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qgeNkG/Y"
Received: by mail-lf1-x136.google.com with SMTP id bi37so10958769lfb.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=qgeNkG/YSpN04SgTwmxGtE9fxwMvHmG1tLMQxOvQoP90z2gq9ZepTslJVcIW7s8kEQ
 7zhRy11AKHS8DuzXcprd6y1Qj+W6enzLNeFDEsxy366wgx4goUnG9xLOFA7Av10rUrwU
 p0uxzVIavAr0Sc9Pl0vgE5LfMh+sNZG3MQScL89cLobW6QbuVG7V9li1hH5nPso2/xb9
 O4Qa4e90RWIkqWgHgymHXL4eHB+OwBYGdA7mLxG7grHf0UwLrPIkY/JXndONIHbM9geU
 zdWAKYgHScyHnzGS3P86PxAd6oXgSPe5h8ktUVEgm0xBqL/rG7pefq3pj36n1EqntV6M
 v+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=LK3mmGIcD/82hmoc6rV6g8C8g3pRzdos8ZP6Yi9/G81cAtoIgWyYV5bcDP53AZEQll
 NOCgOOEslfTWcj23Rw5+mgRCerq0TofT3MzwXGGGvKFjuVJmMZ7C+SnpOgX7ZRlFqlkY
 ByQAueZEmx/M11cDN/LWjLbiAzRj0VWD4fN6qAVtkA03LKsSgA+ZyDjAucTox3FDVBio
 T830wFp2lpRMuxeWEBAdChDeRfoHrTNOvBIu3wPHYuwwSXR2hqb+iEmytVBtrj4DFtK7
 pm/9wwvhk5jwj1g5H3yxz6c3993jOVlgAeccrveNL7rhsadj8FLtLB58AtMkj2X6WGh2
 Gigw==
X-Gm-Message-State: AOAM532wa0p+NzbOAkZZJ0CEriLbC7xUfjBtwAK/5Xagk2AgCd4LG2+5
 ITDV2Npqe52WJdXd4D2w7OI=
X-Google-Smtp-Source: ABdhPJw5VhxwaZFlstkQ6hcX5lmByTMobxw76HSVCCUXmrUW+Z7gg08zBntVYZdk9l/Xjm2zSheOyQ==
X-Received: by 2002:a05:6512:3d1d:: with SMTP id
 d29mr19171889lfv.685.1637791603722; 
 Wed, 24 Nov 2021 14:06:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Thu, 25 Nov 2021 01:00:53 +0300
Message-Id: <20211124220057.15763-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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
index 817b39190d54..1b8f8fdbedc5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -235,6 +235,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1

