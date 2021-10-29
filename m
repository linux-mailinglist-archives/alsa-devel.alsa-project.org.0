Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA343F3BE
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 02:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1131416E6;
	Fri, 29 Oct 2021 02:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1131416E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635466433;
	bh=dFfCqLiyAmtVBHjQUitf6B7CMpRwu8IF4SjZKjJA0Q8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ed5dvjlbfc5vuaj3JnpRBjU7EL0SqT0wwXffk9PWFabKh2DJRoBMuEhBOhcJmps33
	 YSQAK7VwQW+fc9unAMeYL62wnAqDBSMAVJ6ynMbxgGbTjiTyHuyL0CbHCoFwlS2gv+
	 hEJo1X9iQtVT2l8H8y8L82iN3anwx+xcbngs3Cxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6194BF80269;
	Fri, 29 Oct 2021 02:12:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A69F802C8; Fri, 29 Oct 2021 02:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98678F8014E
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 02:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98678F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Av48rDYA"
Received: by mail-qv1-xf35.google.com with SMTP id u16so320233qvk.4
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 17:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zCdvHAMPb/U3XpOEmTJBvwKtKMr8OtCBU8SciZQYv0I=;
 b=Av48rDYAzVf/RSt+M91LSQcSgR2dMlUJhcAugutzpsobYfduotKLHEMV4fMB4NOqoQ
 igsM0xvRQUi9F+gcG9ys4/HsosHfBGwOl98gJV46c6r2eBGfHYJq3Qx30j0/GDPChDDH
 yPid3AaULXuqNR8PWnQcMUDcRbIfuMGGrKSWWsOAY2aaEdgfXJZ+N9F8NbyxJ+Y/k/iW
 jGZQwGDlIHk0a51qogNGras2lEkQgtyijMeaLvA2TtG0Nb5DHcopUknxgmhWmlAmfrRm
 b3xS5u569mFrUT3EEi7tQn2xj7dzlGqAv3g1sWoHVcBy2ENZArkKWaZUQpK4HpSHNeap
 KtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zCdvHAMPb/U3XpOEmTJBvwKtKMr8OtCBU8SciZQYv0I=;
 b=yC3hQ/1EHshkEsILNCCxmmiJ9WgqFWZr8Ae1AMftaNJ+2k2HhnHVDGacRlGwWpzsE0
 qlYRtvbxbrYYkdwJaF26LAB1FuIdBjBsxa2KY1SDu3tFzxPy0D+AqzPmxFGMpDzXIbBD
 l/vsI0B6/8RsdIJ95ebZ0cF/Ycl/+phf+7/Gb8sKEv3Dep30Zh8xjqK97cThkDP8EVbI
 T8JvYXqa9CDm92Rt6eDLyXP8goTB6xMalYPjlTbyR88wwKCU7js55JgPPApwtb3SSgkf
 dKhPa7qZY8nobNQ2+X4wJQMk2nO2ownOC6eHluP/Avz8CHs3kGMB4qp1VDOJksIl5tOD
 qNVg==
X-Gm-Message-State: AOAM533+Rd9SuRau8eI4FUESWhKam/pvE5+VQ0A9P6I/upHMeTO8IJy7
 QjLNHZtO4O5qJlm0oiQ6pjo=
X-Google-Smtp-Source: ABdhPJy5ntN/HUll1913v6EiH0jp0EXjSai/uspe5ux/XvPebuhBFbYgC/ThsqZ+6FFFGA8m5zfjMw==
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr7478426qvb.13.1635466346900; 
 Thu, 28 Oct 2021 17:12:26 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id f3sm514334qtf.55.2021.10.28.17.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:12:26 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, arnd@arndb.de
Subject: [PATCH] ASoC: fix unmet dependencies on GPIOLIB for SND_SOC_RT1015P
Date: Thu, 28 Oct 2021 20:12:25 -0400
Message-Id: <20211029001225.27218-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: fazilyildiran@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

When SND_SOC_MT8192_MT6359_RT1015_RT5682,
SND_SOC_MT8192_MT6359_RT1015_RT5682,
SND_SOC_MT8183_DA7219_MAX98357A, or
SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A is selected,
and GPIOLIB is not selected, Kbuild gives the following
warnings, respectively:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y] && MTK_PMIC_WRAP [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y] && MTK_PMIC_WRAP [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8183_DA7219_MAX98357A [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_MT8183 [=y] && I2C [=y]

WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8183 [=y]

This is because these config options select SND_SOC_RT1015P
without selecting or depending on GPIOLIB, despite
SND_SOC_RT1015P depending on GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 81ad2dcee9eb..d10d6a3bf5eb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -120,7 +120,7 @@ config SND_SOC_MT8183
 
 config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with MT6358 TS3A227E MAX98357A RT1015 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8183
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
@@ -138,7 +138,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 
 config SND_SOC_MT8183_DA7219_MAX98357A
 	tristate "ASoC Audio driver for MT8183 with DA7219 MAX98357A RT1015 codec"
-	depends on SND_SOC_MT8183 && I2C
+	depends on SND_SOC_MT8183 && I2C && GPIOLIB
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015
@@ -173,7 +173,7 @@ config SND_SOC_MT8192
 
 config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	tristate "ASoC Audio driver for MT8192 with MT6359 RT1015 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8192 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015
@@ -200,7 +200,7 @@ config SND_SOC_MT8195
 
 config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015P
-- 
2.30.2

