Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4185466850
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:29:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6027A2906;
	Thu,  2 Dec 2021 17:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6027A2906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462596;
	bh=UORYBz1eeo61x50Z3tys3rviKpDlzvxFjX1T9Mjtuqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTcmqn+sE4yAfFo+uctv3V0ob00XL9YfFxxjhrB7n0WIaMWBapC9bOt+fr9mS7jGk
	 XRY+uJfREBYAHH/FFdwj7WqbVsMlEI74L0TOB9Dny0HwHl++8cy+eWSWiyWxb+DmdE
	 b2TMbOLKV6QtQL1FJs6Mp0hPbdG2dJ3bp5EqMEhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A863F80537;
	Thu,  2 Dec 2021 17:25:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD63BF80510; Thu,  2 Dec 2021 17:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD3DDF804E2
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD3DDF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pLQ4GJmo"
Received: by mail-lj1-x22c.google.com with SMTP id d11so709711ljg.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=pLQ4GJmoBOJuH7wLOkufv40oGn+6v3Gytz8bM59miPiudq6sFxymrpgus4KfVo/Rgx
 2um5/3RpKDCATnI9f9SoujwYqxlxpSSh1bYp7EU7phmb3XldHo/1H5lKDnlSaWqtGNQn
 WuiFjTv79YtRFAcAtKQtgmHpoxO+GA5jrjgtPdQtSH3kar4oAzrCjWE0BjIZ1aO3iKyu
 jevLCOpllTOA+bHXXOcUfrwtcziyuvKzGU1hRi2XoVpddsMTIJe7JlVC+3lU5lA0g98G
 4bTrwrRxbAsfMZet31PKmGihDNbFS02bDeAlNTDN6sn4XAqCwlNGoorksOYpqZBjS2tc
 u01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=qH/XoefJCs4oREHYoRUXUOE5EblOM7Z+zJ4xtkERmyYKzOVynT+G7NRXkvCJ2Z1uhc
 Afgv7Se8zRxwSWFZDw5zwtfb8Xbc3jogw9xD0LUBg0a8bIUZvobHAD+dvphDAhxVXKwy
 V7Uwp1/znUoGNUzqa2X4AH2QWuR5M8SWl+P/I2/OoVpUja2VhPGI/qx+w7NDugqZJaTg
 QjHjLcp/ZOjcvKneNW21WQRfOgBuMZ0/pXMSEWEhDRQ/UgysifFW1RU4rVEPl46bWZI5
 u5UOy6QE11ZD24ZAdKdIunE1Fnb3Wz/WdNQwAn151Ykb3KIaS4YyBtPUOAGk3T4w/DhO
 lFZA==
X-Gm-Message-State: AOAM532z3kF3XHYX0lmiHTnrlmoa5O4lf+R7K4V/6XN6IKLVVe1lUa+N
 QKEclgu8K3OMo9n0obgmEOA=
X-Google-Smtp-Source: ABdhPJxgWCKXWtE9NQnfcQEL8rdvlyRa84HGrFT6R25Bd2ruhzIx24D62gwZG3WFq54S3UptLypkqQ==
X-Received: by 2002:a2e:a378:: with SMTP id i24mr13292701ljn.290.1638462321626; 
 Thu, 02 Dec 2021 08:25:21 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:21 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 06/20] ASoC: tegra20-spdif: stop setting slave_id
Date: Thu,  2 Dec 2021 19:23:27 +0300
Message-Id: <20211202162341.1791-7-digetx@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The DMA resource is never set up anywhere, and passing this as slave_id
has not been the proper procedure in a long time.

As a preparation for removing all slave_id references from the ALSA code,
remove this one.

According to Dmitry Osipenko, this driver has never been used and
the mechanism for configuring DMA would not work as it is implemented,
so this part will get rewritten when the driver gets put into use
again in the future.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6f0570cde964..e45e371edc42 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -298,7 +298,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

