Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95317167D30
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 13:13:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1011016C8;
	Fri, 21 Feb 2020 13:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1011016C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582287227;
	bh=eji/CelZXRxZi0PLEWrXGWVykB5gG1jE364b4SB8PC0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AYBMeSETO/pzX0EpYivyh3YLcmSXTX/DyUcrTox8+u50i/T7bNXjPInfaUv/QtGfg
	 2ihh0m8rZzxn0j+Xf+jOdDgBMs7I7FdyIZdoub/U+KrK6WppkF2YJUF8jXTrOinP75
	 QGz/1YlgoWCAVBa4Fmj/fMtH02IkWFzF+mP0G30o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3FFF80114;
	Fri, 21 Feb 2020 13:12:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE7BCF8025F; Fri, 21 Feb 2020 13:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31579F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 13:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31579F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="CS/oR3AB"
Received: by mail-wr1-x444.google.com with SMTP id r11so1773547wrq.10
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 04:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
 b=CS/oR3ABVm90GOGwxlesbU5UaRDqDi4937vJIZTYLNgqFuONm21aZHfScF1yfn5sAO
 xdxwA0HkcqUqTryI/sndrYYXkvoPVOAFhEEC3AzBENzt3TA3GfZ5pbXcjskloGHkCTpZ
 a77kpInQpoS3R/nE1wh7iy1tE7R+PB8uZsyNSP/TNDZLndcmcCGV83fW63VZdCSbFDkb
 dGQ/VBQeP6CBnmYAGuZN5H+5VLNTKx9sdLzMAjP/uMS0dgHQej5Z7MhJVnrhhgiIJJ78
 QTReeJZnSZTQJRREy+l5X1Q9RwN4MNBQQw37iC78fTKYq6khyXtgU9FsErbddnK5PQ2+
 ZUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
 b=msFaKEvWW8atwOIauvuBBcypeTs89yZ8ocLF/srCz3hMHgMo9ndMwnqP+du7DhUwc8
 5cEAcYqbqeWtOqm09pEh/lvvLyaf7KnosFimRPNUDi93Nr+VSYFm5fNqFy4dOPdw3Y+q
 35/VmTJRF12SB5fIjhHU9u0pL4/V/kIEF63c12OPumIF1SBgJN+aKKXEAnZgQJUiaSMY
 TSi3WTqiytnlPKIXIlFhuMcp4mkerP7phhYa4r2+19wpkGMc/15CvoHGt0erHYO34tlH
 tCBbx5IECNMt3Vi6OHlzBNPP+wsKh0f5yZIVplVKb3gQ4x6Jp9u17HmW8e4uEy+DPaTL
 hyGA==
X-Gm-Message-State: APjAAAXQIlILRat/9RO+RJmxPHWmR8zmiaZJCh7xASFL7jEfW95Zq3X0
 1TfJJzm/cOvgQ1C2M7QCX5sySQ==
X-Google-Smtp-Source: APXvYqwYh4N7wz2XscGcCwMNShVzzwC6C2HoeJjKHoDg8DxmO/DkVmrmpDieYviHEdy0nbFzFz8hSg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr49634195wrw.187.1582287119261; 
 Fri, 21 Feb 2020 04:11:59 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w22sm3553127wmk.34.2020.02.21.04.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:11:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: g12a: add tohdmitx reset
Date: Fri, 21 Feb 2020 13:11:46 +0100
Message-Id: <20200221121146.1498427-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index f8853f2fba08..9b2b59536ced 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <sound/pcm_params.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -245,6 +246,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return ret;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
-- 
2.24.1

