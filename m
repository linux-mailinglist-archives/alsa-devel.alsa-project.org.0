Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E07473AAE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 601871F2F;
	Tue, 14 Dec 2021 03:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 601871F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448214;
	bh=iCSLQIV1p7eqSx0ID7CBYht3D+ADNuEBgCjXELq2UJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O10XsmGH0CCnWLRI7h1gfDQm1BATEbNZ9mRwV90uI3Obqzu6sO5Z7ee+vs/xK5Ika
	 MIsw7XBKFLzcyoI9jDrPufgTVVrUXSJhh93cat236vBjnUXFTZl/Tu4ZYwdTsB6/jH
	 K5j9ssqscXIieFTo9w83gPOz63B/KMJCB1zMBNcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62793F805C9;
	Tue, 14 Dec 2021 03:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72337F805AC; Tue, 14 Dec 2021 03:10:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C18F80557
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C18F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AI77NfqB"
Received: by mail-pg1-x52a.google.com with SMTP id 200so7294307pgg.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zn3f2v1RnSuzwZCr3P85CfLfluboubsWMDufKMeA5xQ=;
 b=AI77NfqBWPiy/8ceo0u3NOy8sb9hNK5V7eQNS/RE7CB35z7YqdXGN480caaZH56MAO
 QFRYR0rCrjte/vhOKN712euBPC2wXcadSkCVtkbjpCfO7yrtvep41V1/9g6rHiYPF4RC
 yKw/RAogOI7jx8bSdPiLlt5TJMp5iFO393s4blOOopSanQWEtd2k7x2mMkJOLw8fwGk5
 Gs1uAEUGl16HvsszRGfPcniAx3kjMXaqLrc5yMozGj3hUgFOhl3bhUuiPMDTciewpd3a
 tLHkrC8Y6V3cKJhhAFm3pAck6Fkmje7TVy9i0NgcmsSpo92fJilyfTFNqysPwv2jtGdS
 g2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zn3f2v1RnSuzwZCr3P85CfLfluboubsWMDufKMeA5xQ=;
 b=xm5nmLmMZrSHh46iFpDQdiVAaMe6TSO9sDqcbeZ3+NuW3pYChURpAnhrvQ47uckPS0
 7VN8R+4s1DVC9xNwTFAJXCG2cPCupuYt+5wa5ZQpN+JfQwxb1B5v9lw7O/xseGTiMwQK
 PXxHd8e+/gAbjhbP30L3UbMLRiF3SfPUSpeOL+NVkcT4gqYyZxLmZ/SRuHYiHDv3Teqr
 PopLnr71+nAjt0zVy+XEzIJuDT2UwFYiblcdsSPhjKIXF1iWRk/dUs38vXUyI3ZlKtz2
 nI2WtooCSHckqGc/q2OCzFhaivM1Docog6ch++Q+wpyJf2l3P8e95CBFrNzGMYPCpOhT
 g2vA==
X-Gm-Message-State: AOAM531NONgfe/PzbQKNd4KWsCdvD4g+tUURdvQwVoe7/D8oKF0aYwOL
 I/7wSYuzHnTlV6aIYaFfXi0=
X-Google-Smtp-Source: ABdhPJy7wAA4qa+qw5W8KV452pWbeQ0veVVnNQHzvIxsfakLNvXDShCldkGy94SiC3NXZmtRJkL8xQ==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr1732831pgr.398.1639447789586; 
 Mon, 13 Dec 2021 18:09:49 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:49 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 19/22] ASoC: rockchip: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:40 +0900
Message-Id: <20211214020843.2225831-20-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 33a00774746d..b052642ea620 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -249,13 +249,9 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Soc register card failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Soc register card failed\n");
 
 	return ret;
 }
-- 
2.25.1

