Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18D33A5CB
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D260217EA;
	Sun, 14 Mar 2021 16:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D260217EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737145;
	bh=aNzIfJR+5Nmbpf5Ys3S6+buSZdGWkFg7hyGwkgiJ9sI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCnAwmHWdbN6CPYm7NYNx/zaScJ/MFvNnrsB3V/I3+5xtEY45ThDsIIQFcmz31RSs
	 b8rcoSYK6JXiZDWkQhjFm8K5T0sdDuJVqdnS8zSI5aJyCJo2CmbIQyP/QoX+sjdIh3
	 9HE+VlFi00XBGuphERpsWvRDxyKbL37h00utLZPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 714FDF8051F;
	Sun, 14 Mar 2021 16:46:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89565F80272; Sun, 14 Mar 2021 16:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F9A2F80272
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9A2F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TTnxonYC"
Received: by mail-wm1-x329.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso18771181wmi.3
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFPZqRdZbdNHKEvFXCrSAmXDgJl8zams6Cvy18zeWXc=;
 b=TTnxonYC5VTIZ1twFzbPolp0axamF7Ut4IK5VEOEOuRvASyNVct3OOKrlmeruqncAk
 BRgL47uCsx9+kXls9oIR5ER/k71DFRKrzbzEOApyNrTGg1cfG0C2GYhdae5ahiQns5/1
 xG08vaPmn/SAPoRpBgpsKMliBW5pHz5aG81Ih88IsgprrsemB79lZFNjl7qoPXXSQrMt
 6I+LPfr0LqpG5+FHXFYDtiKX45Q1LkAPmty17W5slx/0I7EPlEbuTsweT5NFZoCEt3hg
 5qPgX8e8uJBXS2D0mSmgvx/S/lZwI07xbo4VqIPnfjProyZIXVkFzkQLJ2W6/7kAgQXq
 UnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFPZqRdZbdNHKEvFXCrSAmXDgJl8zams6Cvy18zeWXc=;
 b=ieAEzSzkahuN8BcpjFvMCFMeQSgeWBbTjAzzQXn/yaW1hngSCG65idZNYHMdW52V1E
 +g33Y7wxAZY6jYa9sfaIk46tv/261iKhxnTJlXjsBXhkUAwBtVsI+tmxIXFbFWybxwCt
 xeKMdy7lSVtv0N5qWOtF7xy8BJpxOBDKRtIldxjBzsFi+wrAhQ3iB5M4FAhiu5TBUxYQ
 K4gOcif/o/Tdp5u+/LK+6BoWNr/bcWjE2BZ/qdXKG+sCuIExj9vC+KaN7IuDA8qeXC6g
 GWzbMzwZdR5pLqurLOBujru0GtHiaDxtnivPhz1ZqRdwhlHvMgSqQ8tynRAU4W+YOoBG
 0+Rw==
X-Gm-Message-State: AOAM532cIIKAOYbmwJNOVkDnQ0iID0O7zaJSrf0h9GaN94XixMQRJ3x7
 PDqJuiJHEoyjeOHSo9khfEo=
X-Google-Smtp-Source: ABdhPJyNAw8waaCEpxZTcM+qiZa+ugLC/FyHQNxJnz8ojqzssYLkm9hVtJkrv7mc8nkBCSex73XwKw==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr22046494wmy.56.1615736735263; 
 Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:35 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 14/17] ASoC: tegra30: i2s: Remove handing of disabled
 runtime PM
Date: Sun, 14 Mar 2021 18:44:56 +0300
Message-Id: <20210314154459.15375-15-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Runtime PM is always available on Tegra since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence there is no need to
handle the case of a disabled RPM by Tegra drivers. Remove handing
of a disabled runtime PM from Tegra30 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 0ed982548ce4..8730ffa0f691 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -461,11 +461,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	regcache_cache_only(i2s->regmap, true);
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra30_i2s_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	i2s->playback_dma_data.maxburst = 4;
@@ -475,7 +470,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 					    &i2s->playback_dma_data.addr);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not alloc TX FIFO: %d\n", ret);
-		goto err_suspend;
+		goto err_pm_disable;
 	}
 	ret = tegra30_ahub_set_rx_cif_source(i2s->playback_i2s_cif,
 					     i2s->playback_fifo_cif);
@@ -529,9 +524,6 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	tegra30_ahub_unset_rx_cif_source(i2s->playback_i2s_cif);
 err_free_tx_fifo:
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 err:
@@ -552,8 +544,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_i2s_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.2

