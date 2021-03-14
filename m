Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A9133A5CE
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 16:53:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7951811;
	Sun, 14 Mar 2021 16:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7951811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615737191;
	bh=ZfEjQD6vml11tT8+GwfnTrPvotB2NMus3N7hexGM88E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRcWhN7+3ttKErP39zr1TyCXFcCmRMDA1od8oROZ646QlIUyhZ8lgSNJoRmko+ggF
	 aGez8ozyuNtPR7soEqaysw+d74PR9U07ZcTVxDQZjzyU0emq48MrAJ9WKihbEmDRQ/
	 LRyU7LFp7xLQ4rQXusPdR4ywr76AmTgUuI0j3/mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2CFF80527;
	Sun, 14 Mar 2021 16:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09DDEF804AE; Sun, 14 Mar 2021 16:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 377B7F80430
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 16:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 377B7F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bRLNLTAB"
Received: by mail-wr1-x42a.google.com with SMTP id k8so4445373wrc.3
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpHXgChknEzhzYi4Q8rqZSYE4y3Oym7aFx47bTQjCRA=;
 b=bRLNLTABvbDYFY599i2T//8iHkJMDYKj6tzFPHL5SRb7AcALZZ0tKjQ5HdxlWBKjWt
 SyQ8A7RJU2hkiRLLJtJhOPzsDbpsLT/2dkHYZfviDM5OBmhMUumILoFGotrAY8soWdmY
 iKzKwqaZgmgpZsx5W23qofLLZaie4fRDfIg01+S70kAdvLXNbGAfhkNN4dnyZehpkVYV
 nF8qR7+vHHQikU6mecPKMNDN5E/JQVnRhgn2B8c8Njs9BsUUJIR9PewiDzSTy3aUCMn2
 1hmnjgAZXcjogfiAAxxCg4d3gfteOrRJuowIVdRkdmpzvi3bDsxpD9bUkaEDeAgVzEbc
 CMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpHXgChknEzhzYi4Q8rqZSYE4y3Oym7aFx47bTQjCRA=;
 b=RwH0eI4ZeKdjfPB5RxLTSRwEr32cp00OsgZbhQfiFuiSwxFyYXz6LpmgPdIps7yFAm
 ZlELEcplLBO17FCckdGZM+WlqStK8WFDk2T63HMlOXxKercFPWLnOyxdIhRmuUeqONCQ
 J+vEUISne3/08L7nMrkam0CRd2LE/jFbu9j4CjaDVYb17+clOBJEDdBCKL0aDvC/FgeM
 VvOm0RvFzchmek69DBrpysHVH3Ur0S6R3IM7BUdMVi2Ukc/L8xP5g/NDfZ2DkZ0L91bT
 yEy/nxGiiqRqgjgDnULTDVaLADonIZT4/8Ilx3JZDPAvpgG+FPF+OgCtptca/F1AjZwT
 S8wA==
X-Gm-Message-State: AOAM530Hk8EBHESyIbTdglJRvIjMz38TELWCGo3qlT7TX6C8C7L5TnUj
 3fo9BMwbTFVZsr6yuSdnkcI=
X-Google-Smtp-Source: ABdhPJyd0+Gt/PLPpYiHZG8ky3XiLj8yZZzNOhE6OO/1QCc4KEUkdkf0+qyy74cpcV5yufuKG140NA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr22810754wrs.34.1615736731999; 
 Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id f14sm9673507wmf.7.2021.03.14.08.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 08:45:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v5 11/17] ASoC: tegra20: i2s: Remove handing of disabled
 runtime PM
Date: Sun, 14 Mar 2021 18:44:53 +0300
Message-Id: <20210314154459.15375-12-digetx@gmail.com>
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
of a disabled runtime PM from Tegra20 I2S driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index fe569198b17a..1b27f81c10fe 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -401,18 +401,13 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 	i2s->playback_dma_data.maxburst = 4;
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra20_i2s_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
-	}
 
 	ret = snd_soc_register_component(&pdev->dev, &tegra20_i2s_component,
 					 &i2s->dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
-		goto err_suspend;
+		goto err_pm_disable;
 	}
 
 	ret = tegra_pcm_platform_register(&pdev->dev);
@@ -425,9 +420,6 @@ static int tegra20_i2s_platform_probe(struct platform_device *pdev)
 
 err_unregister_component:
 	snd_soc_unregister_component(&pdev->dev);
-err_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_i2s_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 err:
@@ -438,10 +430,7 @@ static int tegra20_i2s_platform_remove(struct platform_device *pdev)
 {
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra20_i2s_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.2

