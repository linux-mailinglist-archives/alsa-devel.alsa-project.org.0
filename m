Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA10623A3AA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 13:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 717891668;
	Mon,  3 Aug 2020 13:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 717891668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596455857;
	bh=OUpY1jbei1vfyE44090MOuweMYbVPr0kiyoLzO1Mai8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jtxsB+qtBp1xqXPa3D3XU8lzAgB1834lwJa0fRq2xW+iEaxIri9v8jPEKYO1Efvs4
	 rtGR7K8w0chu8MQNTurmCyus7oeMKjWQaX58ICx+vhjMtgkgLssAkjfMPhOgk9fZbj
	 lebECChd9A8bZxNknn1tlSEaGjxjoRYJxxo0aWqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B9DF800B7;
	Mon,  3 Aug 2020 13:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14242F80218; Mon,  3 Aug 2020 13:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23808F800BD
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 13:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23808F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JfeTdm/1"
Received: by mail-qv1-xf44.google.com with SMTP id o2so17124971qvk.6
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5vBkDKoACkQ2A0d3jhkAsa0pWmFtHWlj6+CEzAIFgtA=;
 b=JfeTdm/1dLwMa6PupMeE+b6AYFoXFeAAaSehUc7g/ZDKppjAZmNzYUeS+Dx+H3MrD9
 lFlZeRG/iFaDBK2huglUjGvEOKQyB5EkVcTogiSUT1r9BKpm5HcBBhtiXuRVBf5qaBg6
 xlDUScWe8Fz9Ze1fcIP1KBY67jDFrzLx+vXRlk+v1+gyD1tmtJVVgFMtDjG3kmep5j4Z
 uz1SYkO/S6acJP5bbwqJ2XeSIcpuxD+eRlZAHPxjhfgoxXPN4AXSsgzYiaRx+u8mN1kB
 FZ4Nb+/+banLKukV4alr0y6fmRWkisSwGngpxqEdWXwjLWX4x3J5nNlT9pa1uWJUgGIv
 aFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5vBkDKoACkQ2A0d3jhkAsa0pWmFtHWlj6+CEzAIFgtA=;
 b=Mzs1lv9U9uwneFWxzOChR3DfxldQufCpxAiquRlDa7MvHKUSrvgsQ9FC6VLDNMA6Nf
 z6bRWB1YlJ5Xx2nKRG6VEzK1EGBWxYqsUwQLG4KSZjAQr/ZjsjqQJ7XJ4um9KiQRbsa6
 6KoxT6ZAtaJ9bNkFBFuX0mlRoFaLBkJEeAHHCYHrnqvAatLUvBDAy2KIF2cqx9GgteFb
 Y14GXGh/8MOvfM/5C36Su5qWHskOd9UHjJZZZJv3qPToTo45JzbrTDsakB+mnx514L5y
 rCf+cAwc8+uI6yilP0BEHhUJLq6KTRgI7WuT05RmbeUvBLLgAFbBZx4dJav8sOD13AZ0
 ww5g==
X-Gm-Message-State: AOAM530Aprvs1l6yQ1Vh89Qcy3joPcO3dmxFcWqpBKoXg/tEXwGkmVWD
 iue+VdgbEjKQ1vaa9AZXrK0=
X-Google-Smtp-Source: ABdhPJzrckX4DiRjP8XdEFcXk6cBiATHM21g0f5ME3ouRUmxTw+30jOhw10IVtB/DL0W+amF/ucD8A==
X-Received: by 2002:a0c:da07:: with SMTP id x7mr16600215qvj.66.1596455747674; 
 Mon, 03 Aug 2020 04:55:47 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id n6sm19114344qkh.74.2020.08.03.04.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:55:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: wm8962: Do not remove ADDITIONAL_CONTROL_4 from
 readable register list
Date: Mon,  3 Aug 2020 08:52:33 -0300
Message-Id: <20200803115233.19034-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Fabio Estevam <festevam@gmail.com>, shengjiu.wang@nxp.com,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org
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

Removing ADDITIONAL_CONTROL_4 from the list of readable registers cause
audio distortion.

This change was sent as a comment below the --- line when submitting
commit 658bb297e393 ("ASoC: wm8962: Do not access WM8962_GPIO_BASE"), so
it was not supposed to get merged.

Keep WM8962_ADDITIONAL_CONTROL_4 inside wm8962_readable_register() to
fix the regression.

Fixes: 658bb297e393 ("ASoC: wm8962: Do not access WM8962_GPIO_BASE")
Reported-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/codecs/wm8962.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 317916cb4e27..0623a2251084 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -151,7 +151,6 @@ static const struct reg_default wm8962_reg[] = {
 	{ 40, 0x0000 },   /* R40    - SPKOUTL volume */
 	{ 41, 0x0000 },   /* R41    - SPKOUTR volume */
 
-	{ 48, 0x0000 },   /* R48    - Additional control(4) */
 	{ 49, 0x0010 },   /* R49    - Class D Control 1 */
 	{ 51, 0x0003 },   /* R51    - Class D Control 2 */
 
@@ -842,6 +841,7 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
 	case WM8962_SPKOUTL_VOLUME:
 	case WM8962_SPKOUTR_VOLUME:
 	case WM8962_THERMAL_SHUTDOWN_STATUS:
+	case WM8962_ADDITIONAL_CONTROL_4:
 	case WM8962_CLASS_D_CONTROL_1:
 	case WM8962_CLASS_D_CONTROL_2:
 	case WM8962_CLOCKING_4:
-- 
2.17.1

