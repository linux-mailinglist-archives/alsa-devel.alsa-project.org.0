Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B243C45F1D0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:25:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D5A1AC3;
	Fri, 26 Nov 2021 17:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D5A1AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943959;
	bh=9EcX4jOmIU+43AMkKdabHqLJOG2xOBvSPljvX6kGj/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azlJ/p0fMxCbrddGRPVwM9A/IGo8vFND2yjGJKgbpuEDfK5Td/rhYKzOU7FW7bsrE
	 ONnJI6w5mI8AvjQ8D8mWFJiQUVOfRdRVgDvJLqdjM2ySYkuDV+7lRPtqMcXNOuXYKD
	 UHtBBWiVzdrJa/eKciVAxsv+N2jWfdk0YZzfXbjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 115FBF80558;
	Fri, 26 Nov 2021 17:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F3EF80245; Fri, 26 Nov 2021 17:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17476F804EC
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17476F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fuV2rpY5"
Received: by mail-lf1-x12f.google.com with SMTP id t26so25466623lfk.9
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=fuV2rpY5vWtXLgfFL3kQDRM+ioE76IqkOsczEVCgP55ZUOsM6JRi1k1DUic6KroJPS
 0tKyZlRv6Eyfnu2i63/8F5l3GQ3gMNc9CdD0hLqviK+wvyStY1jg5iC7kGuzI3eIMcEf
 PB+2xvrZY342AogXJzAfszoXobBHB6Q3p0iYRgcdy2pL+5r5mbobIWDkdh/z9DTNnsQb
 x59msvnA+cjRsiH/FH7HPP0qQ5JLIZK47Am2iLsa5Qd3Lq9qRfBeS03r7y+yojAESQhP
 ShNJV3gqMzXfS0qwS2eGeNOLcm9Wh0FHqRbij68DTKDMYHAQ1d0SLguifx4pu026d7wv
 /dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mQGburGzaVO6t6m0C9ToG0s590roHzjwKj9a/U1hq8=;
 b=LKjyuodwV9WLG7zfk1QCB0wP1yzBzRnZVjlIj6EaKWICbl/4exLaCvZTq+52PNad5I
 4gtu20lAeknJ5yJvTHxCE0bQ6iDg70Xfbtg3QO+urbPD2mXOAQHF+gUNVd94S331Uzfn
 BlSrYGqCcM8HwAnmgSNsbeaKljv439MrSVB6hb4Szui8u/tnLaLvoG79Kw7Bj0CYoz5i
 8tNwi2u6qVPXmUAwJgxZQiiH4W3hfp9bMgzBh6NgPKd7bsS1g79iWNVc7mlnQHxyc44m
 bOXHo40aJAE62uCKli8b0tPyM/FTsDA5XG5zDr+8ECtDXz1nT+l2QyfUSBa6532Oav0B
 DFww==
X-Gm-Message-State: AOAM532+v7Qi56EHlPza/jgIN3vD16lE/Vb0oxMToVLc7uzkJggip3uj
 9U/WDlwbXM1cKyxqQ29YVNo=
X-Google-Smtp-Source: ABdhPJylJzqB2ZvlpxpzfeqjArW2IsHMhFnA0BIsWJR6W+91PfSCYZb5GLBH1w9hRPLmfiiTF5DZOg==
X-Received: by 2002:a05:6512:23a7:: with SMTP id
 c39mr31318838lfv.655.1637943596282; 
 Fri, 26 Nov 2021 08:19:56 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:55 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date: Fri, 26 Nov 2021 19:18:03 +0300
Message-Id: <20211126161807.15776-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

