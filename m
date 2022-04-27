Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C92511C95
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 19:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8537826;
	Wed, 27 Apr 2022 19:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8537826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651080362;
	bh=UL5tO6G6Xlp8JFEGHOzSEIwWu4Ognv9CHk6wK1s0ldU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AHfEs1VVO4ESqi60jqN+LmALUcZ4oXSdz0iwJ44FKV/wSqg6VTBojy2LCwus7NmLo
	 JdBxb4GUXKHVIyqPHkPWs0CrIHL7CjxzExJzw8IHrEWh93MBNNIy0m5qsD/qt5vOJ4
	 nMidw3lkOnYwpanRR6QSojsNhfrDXOcBwJ2fmyMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E832F80253;
	Wed, 27 Apr 2022 19:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ADFFF80100; Wed, 27 Apr 2022 19:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675B9F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 19:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675B9F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EYyIJudD"
Received: by mail-ej1-x629.google.com with SMTP id kq17so4792315ejb.4
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P52XUlnvWCDbdpSO0eow56ta8BYIoktLvffWsEefpbg=;
 b=EYyIJudDhVOE7nkfQP1R77baA7wbkc6ve+j0cW06+oPnAeLrfHkIPvjhM8VSs9RP54
 WUrZl2qV8Hp9WrdgrHudUuNOmQAsSwugxTKF0zdZhb98lU01+kJ0uTZZHDnfHo23KF8f
 7vJtUWbeJBZ48O+Rcz70/expiyA/HgPVGjOqzUyb1HzVmRkKPtKel1pAC8TrwJeDHSMa
 FR7WouWdsXS4BTgy5cayvj6E92lge1vx0YVkzM6lujQbbz75L2BvdPJnKRJVjEZyZTx5
 j8y1AT6+O7co6I6cll+Za0mbqMSTkEYbhG2ewGuphRI4UjAVKzM2+G71/z2L2pwD7pCt
 Lhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P52XUlnvWCDbdpSO0eow56ta8BYIoktLvffWsEefpbg=;
 b=EnYfLVzQm8kpIxdQ+fr1hOXZACC6dyGG+yKT/16SK2qQEePkyIqbSeADtGJJ+G16B1
 Qt+CGNmR/lsrXiCDuEWRwbfm7u7TFuZtT1OwDsCb1zfKS0Up6h1SVqpgnbedrHu53hb1
 OZ7cu/eBG1B2yJWhXaZp7Nl90ozgVELNvq8gihCxBEGx+iRPBwicCUNsmnyuDHcifIx7
 XWuVE+QppZtYhhRQoj2fu9WfHND5HdUlE7u83BuGNVoJDIstaqeRijCVpr8KhRdLbwov
 G7Dpw2FGmbojEloNfJHErLYOk7ElpJWxyUBDhskJBXRRRE1u5TIAGAn5gPVxtfHpYdYJ
 91rA==
X-Gm-Message-State: AOAM532Via5Eotk3uOcfIbzxTzN3TkO/wD0xYcpSjnMOYNxXJYGniAJO
 wy2CKejcSyY6W+A9KrEKRWI=
X-Google-Smtp-Source: ABdhPJwtWnz45yI608lXspTGLXjHmcLI45v3raOCKlRDG2j3PHMzL3wk9KyjzWEraDNpDJY3BuR5sg==
X-Received: by 2002:a17:907:97c9:b0:6db:ab53:1fdf with SMTP id
 js9-20020a17090797c900b006dbab531fdfmr27725391ejc.406.1651080298559; 
 Wed, 27 Apr 2022 10:24:58 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05640235c200b00425fff78dbbsm3328443edc.49.2022.04.27.10.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:24:57 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH] ASoC: rk3328: fix disabling mclk on pclk probe failure
Date: Wed, 27 Apr 2022 19:23:11 +0200
Message-Id: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

If preparing/enabling the pclk fails, the probe function should
unprepare and disable the previously prepared and enabled mclk,
which it doesn't do. This commit rectifies this.

Fixes: c32759035ad2 ("ASoC: rockchip: support ACODEC for rk3328")
Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 sound/soc/codecs/rk3328_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 758d439e8c7a..86b679cf7aef 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -481,7 +481,7 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(rk3328->pclk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to enable acodec pclk\n");
-		return ret;
+		goto err_unprepare_mclk;
 	}
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.36.0

