Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9157B550
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 13:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC563169B;
	Wed, 20 Jul 2022 13:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC563169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658316195;
	bh=kwVJfQAcSUiYHlV1DtyBbivRlbra9enLBjPSXnY5Sio=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eVazorcHmXCWVD9MOU4csWEvxsx6bopskQ+cTQNM2tVMOn2SwLyahrVNITjbCeGGJ
	 x/QGQNcBSy5S0gIWm7Gdvj7goS/HpDLbtyOFjFC+GFzQoXwGwI/7iuPGJ/KLQJhPsa
	 72gSg64nSEqmGHzuoW4WWvsI1qsS+5VrNKdomsvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DEBF8025D;
	Wed, 20 Jul 2022 13:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10DEF80169; Wed, 20 Jul 2022 13:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 264A6F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 13:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 264A6F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y8uILXcd"
Received: by mail-ed1-x52d.google.com with SMTP id m8so9900106edd.9
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 04:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=x6bTFSKyRmleL7Dcjv7zFamUjXAsDrcKNCo9RyO5i3o=;
 b=Y8uILXcdoWMp6Wk6wHyJ4K/lV45McZ2OZJDHGvs7kZgckdf3wvvdV463+0j93hM44t
 +/V1LEF42K2EjEXWl5+naoF8Wl3/mIFYuyjm0UYHSP4g78XihNv9+eiFvxs4YWsJqmb5
 3PQsfBDcmM/xumAd1sNDeL7qlwb4CuJ6sI2t4tQ7VTXXKc+P4irlWgGLszKxNJAhV6h0
 u1Yfs7JFXjM4s1i1R3CnOhPXGlVjLuJCIjnFP8PIlh3AqC7O+gG+m3Nzg1q+2cMacTPB
 VzY3wZIPC2xJ0KMljwSkbXrRON2TgitAp+4++P5Sl9UVew/E+KLPF8hRk7ZCfp2QpKrk
 HrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x6bTFSKyRmleL7Dcjv7zFamUjXAsDrcKNCo9RyO5i3o=;
 b=z0KpBCc3eLEsOwf/39GoPykfnp61iXCM676yrZPvrY9ru+mnpX/HhLDpOiEJO/HpxS
 fJNgowxlyyRfwqNMr3rUQ5gXWONui9ZMyjT02G7C8IFQjy2HDarxihvZ7H02GRppa9sN
 N1sCOPyMiyguRr9rFBHskPu56A4jVJrLPQi4TeVu8lBG4E/xU6xCYS65N8Ym/OhsDm6D
 24GjT2XQ6XIdh+3PjLfZX2PrIOP9hhB5YgYdncQDRNPtHt21aCHQPRBfNWckYCMKduyb
 6KmEI/un2kaCfqD63MCpaT97o7WIA5fPIiy+FTtB5oAe40J9lmI3r+NqJCc0AF+n7g0q
 atgA==
X-Gm-Message-State: AJIora8v+yKkNNkwH4kogGpu5+NAjY+X6owkBKJS6C8k0KQ3TWRVtPfJ
 YOCg3rzSuxc9kuAGU4ehwYkJRo97pfc=
X-Google-Smtp-Source: AGRyM1vR/ULUFptmOZ0qgSdaTMZEkAbK7i0xFniwm23m7Y2zbA29wfKRpfqCK5P/rAu97gaFYExbew==
X-Received: by 2002:aa7:db8a:0:b0:43b:75b1:92e9 with SMTP id
 u10-20020aa7db8a000000b0043b75b192e9mr10819428edt.223.1658316126718; 
 Wed, 20 Jul 2022 04:22:06 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826a11f008020c2fc6e115b3e.dip.versatel-1u1.de.
 [2001:16b8:26a1:1f00:8020:c2fc:6e11:5b3e])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa7cd4a000000b00437d3e6c4c7sm12176965edw.53.2022.07.20.04.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 04:22:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: ti: remove sound support for DaVinci DM644x and DM646x
Date: Wed, 20 Jul 2022 13:21:52 +0200
Message-Id: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org,
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

Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
support for DaVinci DM644x and DM646x boards.

Hence, remove the sound support for those boards as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 sound/soc/ti/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 40110e9a9e8a..35fddd7c501a 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -180,9 +180,6 @@ config SND_SOC_DAVINCI_EVM
 	select SND_SOC_DAVINCI_ASP if MACH_DAVINCI_DM355_EVM
 	select SND_SOC_DAVINCI_ASP if SND_SOC_DM365_AIC3X_CODEC
 	select SND_SOC_DAVINCI_VCIF if SND_SOC_DM365_VOICE_CODEC
-	select SND_SOC_DAVINCI_ASP if MACH_DAVINCI_EVM # DM6446
-	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DM6467_EVM
-	select SND_SOC_SPDIF if MACH_DAVINCI_DM6467_EVM
 	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DA830_EVM
 	select SND_SOC_DAVINCI_MCASP if MACH_DAVINCI_DA850_EVM
 	select SND_SOC_TLV320AIC3X
@@ -191,8 +188,6 @@ config SND_SOC_DAVINCI_EVM
 	  DaVinci EVM platforms:
 	  - DM355
 	  - DM365
-	  - DM6446
-	  - DM6447
 	  - DM830
 	  - DM850
 
-- 
2.17.1

