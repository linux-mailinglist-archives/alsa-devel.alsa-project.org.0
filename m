Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B52321E5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E5D1725;
	Wed, 29 Jul 2020 17:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E5D1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037727;
	bh=/4ShZvpN/MLkatzay/lTalbUNEjR64BhaCe2fXkgm6c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+jkJusM+B8+Aubu96nhYlFKlm664inF09Iu/AnCVdjTce5ey71PLsc2GzW8C3m1j
	 9DvImv6UKRvckmuz5mJoqUV3P7E1x5t0Ldm5SBkRXu7cKsUbSqOj8rs1UMDsC1LzuY
	 0j7p8hFk+FUTaJC9D+FzLR6mbpjQl23jEi9EQZvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D506F802DF;
	Wed, 29 Jul 2020 17:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA6E0F802DC; Wed, 29 Jul 2020 17:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 936ADF801F7
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936ADF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="XaVnRFyy"
Received: by mail-wm1-x343.google.com with SMTP id k8so3450826wma.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odKL8nfgi2JfYFNsaHMY4SKWdmff32MEW/xIQyAYpOU=;
 b=XaVnRFyyLv/CDI3rNrvt+N1NR94GoD23fiy/1/aev0VHbn3oeX9+0gLViXcHzcPViC
 mwlIFOWJmaj7nZtyvHYwX0VYgYAWhYlilB06hqnszYmsJEMA/ptUEBCYejYVctWNmLvG
 DaXtxBbRu5szTpoi/tqJKw0GDefnpfkG2ef3NB7uRsoJKp358/WBuGwCaFgmhWSEt1Xb
 TdyN1A3/uSX2bqsM9cPHzZ0isZY56UvuXLD7Dfz5VjSyrzzma3a0D2RYNurND6ap+y6s
 vdzrI/4KXtoIAm5gIupf2DJq9ssRajx8xEWOiGD5gNisR6FFXhdyhHxyuvBdWbPxj3Rl
 LPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odKL8nfgi2JfYFNsaHMY4SKWdmff32MEW/xIQyAYpOU=;
 b=uQyaGqGtZvlj1atcj+FOQR+B9s/tYkN1RgyHN5cJ9wjaK2AluX3jxt+izcqEWM/vTu
 eHUZiY2X45Tt5ubW379Knb312xs2233QQudyzvjDq+AyKDqxMldK6uOK320DwLepwBoj
 BFC6Le/3jhDG4YGQQWVbqSxjhIHwG588A7fOHzzqBIIY+aQwR05ovERmckV9oOOf5UdX
 KfjOBxd29iCCDlklDunWJiaSI74JaYDqnSgFoSQSEXXEc6oX6pieoAz/6bK1Il3zlUmW
 t3GONgGjRprrRGBKiBkCXErY2N7Peen8hFgu01tDKbyh6U+Otri7LQdSpRvAwuqYgWJp
 XcPg==
X-Gm-Message-State: AOAM531rhecX7WnBlYuCUGvARPEqcVKWjO5sYxWWu3L3oDj8osW7F91d
 n5pofqVGc5ebz7aqRuq0B5rr3g==
X-Google-Smtp-Source: ABdhPJwJufUM+fr/ccstncgAq56W2HRh9FWgpXsZ5IRILScKbhvt1s8lTYaYBt7VHezKJF6mEIM+8w==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr8667635wmc.167.1596037515187; 
 Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: meson: axg-tdmin: fix g12a skew
Date: Wed, 29 Jul 2020 17:44:54 +0200
Message-Id: <20200729154456.1983396-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

After carefully checking the result provided by the TDMIN on the g12a and
sm1 SoC families, the TDMIN skew offset appears to be 3 instead of 2 on the
axg.

Fixes: f01bc67f58fd ("ASoC: meson: axg-tdm-formatter: rework quirks settings")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 973d4c02ef8d..3d002b4eb939 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -233,10 +233,26 @@ static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
 	},
 };
 
+static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
+	.component_drv	= &axg_tdmin_component_drv,
+	.regmap_cfg	= &axg_tdmin_regmap_cfg,
+	.ops		= &axg_tdmin_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk	= false,
+		.skew_offset	= 3,
+	},
+};
+
 static const struct of_device_id axg_tdmin_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmin",
 		.data = &axg_tdmin_drv,
+	}, {
+		.compatible = "amlogic,g12a-tdmin",
+		.data = &g12a_tdmin_drv,
+	}, {
+		.compatible = "amlogic,sm1-tdmin",
+		.data = &g12a_tdmin_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmin_of_match);
-- 
2.25.4

