Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E390133A5C3
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:50:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1BE17BD;
	Sun, 14 Mar 2021 16:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1BE17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737052;
	bh=HX3mEOg9d3uCuZEy4E/mCTiWcus4ISkCH9Sdy4A9fp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwWRqbhk3AR1Fovym49pJI53HqNjk1DtoDFwk1VQzBUkp7YmZ1sTCo7d7kRpgxPQs
	 aUUyC9sWxHP07q7jld+SdexekdPo7DDyc5ECMSdndt7rHZQqbtfYAEyoB76URIysJC
	 TWfwWVsfBc8dsN95uS9aTUqHQTXaLCTpujuQBSUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCFFF804FB;
	Sun, 14 Mar 2021 16:45:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF872F804E0; Sun, 14 Mar 2021 16:45:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1381F8049C
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1381F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PqY8pspj"
Received: by mail-wm1-x32f.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso18033320wmi.0
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JzwcPFMRL4SCj5tKsLwkCgmRXrfYV7RwVK3lOrEUoZY=;
 b=PqY8pspjct7c05jJSezcs85mAeuYf73dp7Szi5jnqSaTZRKSiZUNhYfMKdF5y1XvR4
 1youylwgU7aKIKRwIaJZyVOy7D7iOhp9YJHv8G7f1MsDhqkyhoNufh2qPNYtG9W1QV/x
 wTI6qZ8jUTyG0YGS+t2oedPd0Fw8jcBzeXi2uAzLZbFDYJsc5gROXXAv+6V0DRhTUfCc
 DE7Xz0bv9xUfThPlljFe7FMU9HUbO8DKBaDv+7Z2B21uRMPg2oD3HM2QRUVSeGRkyWts
 ibSxsGUX3q8o+4XtW/IikvjhDDEoOL0WHVYmTMoxIERpIs0ZPx5cRYKc6DACFm24dgs+
 KYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JzwcPFMRL4SCj5tKsLwkCgmRXrfYV7RwVK3lOrEUoZY=;
 b=V4gHltoGYDPziuk7dhjignMkIcRQ8iqJPWnqLr/ZDuKA2u6NvCxqP8WyRIYLUvKkm4
 E8wkgJdvR5Ou9Adxyxy0OLJt0GnXP/lI2w46xF6o2O5HNUxukvzvC3+7ytOwOIYr9/28
 TDt7dBhCzaSouJsAUzGhhTXVarnlNLnMxD86QaeoxdJX/NmRHbEP9HTzxbnPOV/B8O7Q
 uCbvatcCSK53j8/x/+zUKpdEdvAdX3+QIWshDlbmZz/RPblNmtlt+G9WsBfrodPHC/vE
 yf2jMYseNZaR4gxiSxpgxPhLVEHVglK0sVZIBfnTPfaHC0idBSrSgB0MMRxRPlPkHEqP
 Sj/g==
X-Gm-Message-State: AOAM533n7iYMyzfPWnSQ0X2RJcrcRPh1E3nUBN02Vc3GM/1MXnI80ll4
 WI1+ZSX2MDa+Gvo08eQsAN8=
X-Google-Smtp-Source: ABdhPJxAdO+J40W47Rep4O6fTXvR5JrD5THBQUw12KxSOR5d5ay1lUZWilaKKcsQK0emtmamSDHRtg==
X-Received: by 2002:a05:600c:608:: with SMTP id
 o8mr22841970wmm.42.1615736733234; 
 Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:33 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 12/17] ASoC: tegra30: i2s: Correct driver removal order
Date: Sun, 14 Mar 2021 18:44:54 +0300
Message-Id: <20210314154459.15375-13-digetx@gmail.com>
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

Tegra30 I2S driver has a wrong driver removal order, which should be
opposite to the registration order, but it's not. In particular the
runtime PM is disabled in a wrong order. Fix the order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 614b67be1dd9..31e08c5c1405 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -544,10 +544,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra30_i2s_runtime_suspend(&pdev->dev);
-
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 
@@ -557,6 +553,10 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	tegra30_ahub_unset_rx_cif_source(i2s->playback_i2s_cif);
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
 
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra30_i2s_runtime_suspend(&pdev->dev);
+
 	clk_put(i2s->clk_i2s);
 
 	return 0;
-- 
2.30.2

