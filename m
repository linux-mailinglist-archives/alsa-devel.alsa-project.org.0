Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C06614D6
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 12:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8ABDC67B;
	Sun,  8 Jan 2023 12:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8ABDC67B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673178309;
	bh=Cs2DxQdTvtt/co+pTJ4Kj/b3UwuYx8JSmr0ljLbQVEk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F3J6dbiNEClfWxMtzeEC7z2Ri984ITTUlwslOL6dYwpPRaCEMDLjtmYFP5j6mU3+1
	 u9uIeW7Ee+R3Df2PTV3OLHD8uIVoYxrmLsjBI7ZryPKfjJY9P9FgJDG74cPIVpeN4d
	 VTMhTKFNRa1omZm2L73uuuQHWaNcouC/AD/c6h/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1258DF80236;
	Sun,  8 Jan 2023 12:44:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C68AF804C1; Sun,  8 Jan 2023 12:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2D86F80236
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 12:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D86F80236
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=JZNPMaVe
Received: by mail-pl1-x62f.google.com with SMTP id v23so1616371plo.1
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 03:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9nsM9ze7/IVAFeNx2iL5lzz62WyvKhiLwvesPkswPc=;
 b=JZNPMaVecw2wAD9otYPnQHFnTEF+Tu1oNbEjp5STAi+ECzfPFA8tIGA1EaSGNqEFrN
 q99Ew5DTqSFV+jxLC3M0ei6NrX7va83Dl5iMGSsI2y7CRsF9HRFz1yjOD6rUi2VVACUm
 +lha5iN9Gy5GpL/Orqm0pYrc3I/xgNghbMUdB4UhvbH1zjeCwwJQqeKAlQvTePXNYF8E
 OLQ1ArR9wP6GVMf8VAAirh5vi4NxEnIdFGll43fgy/tKoMSvOu7ySrizB65Zz/5xTSUz
 px2pPVv0AaRBhv+eEV4VoPXXz6fFjs0JHWI4d1Fkg+SZ4tt+hcdLQuEW3jSSvz26IkWo
 pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9nsM9ze7/IVAFeNx2iL5lzz62WyvKhiLwvesPkswPc=;
 b=oSNp9ZXt3EEYX3H28BzYsRhtDhp5c+oiM+4Rsh9W839YlT5X2ft09/jNEr0CvHVc+G
 mqeG1WFLQZ7iGXlbEwvnkO/X+SUKFiSXl9tG4H+E8WjgQBwKK5gQGHyyy8oiGK0Gqp6H
 Baw473rEwD2Ro2s7joh++QV4maiozcjV0pttuLiXXmfKJ3knN6Kgh9WQCiuqCb/+hrPz
 qUr4SOWbSrG77NffkMqALHNJQhkK4dBmF0jc31SxiR6ZGICCN5CkR956/sUHq9Rfxv7m
 f0OmZwK4L3LG6zHYUd/abq/16CrWw2590xJM3RXMxU7ICzNoBe5riFryHnMb6QJCJSfF
 srFQ==
X-Gm-Message-State: AFqh2krK8rOsZ21LRtWPXsEM8qdeVUZE1iEOYY7SYaj+NXYpXlxcF8Hi
 WWBZSV5Df0VRosDU7iajrhGBGw==
X-Google-Smtp-Source: AMrXdXsNwzNBN2wYlF9q0MVzJwVapvLJ3KcrR9ulqvMDas5TSQuWTmnHqjbmnPNZCS5CFVDxoRNluw==
X-Received: by 2002:a17:90b:310f:b0:226:876c:4c57 with SMTP id
 gc15-20020a17090b310f00b00226876c4c57mr20464874pjb.39.1673178239277; 
 Sun, 08 Jan 2023 03:43:59 -0800 (PST)
Received: from localhost.localdomain (36-226-16-237.dynamic-ip.hinet.net.
 [36.226.16.237]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090a061700b002262fcd92desm5621521pjj.7.2023.01.08.03.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 03:43:58 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: nau8315: remove dependency on GPIOLIB
Date: Sun,  8 Jan 2023 19:43:51 +0800
Message-Id: <20230108114351.539786-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, Terry Cheong <htcheong@chromium.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 kernel test robot <lkp@intel.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 amadeuszx.slawinski@linux.intel.com, Linux Patches Robot
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 Ryan Lee <ryan.lee.analog@gmail.com>, alsa-devel@alsa-project.org,
 Sean Paul <sean@poorly.run>, Brent Lu <brent.lu@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

commit dcc2c012c7691 ("ASoC: Fix gpiolib dependencies") removed a
series of unnecessary dependencies on GPIOLIB when the gpio was
optional.

A similar simplification seems valid for nau8315, so remove the
dependency as well. This will avoid the following warning

  WARNING: unmet direct dependencies detected for SND_SOC_NAU8315

   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
                   GPIOLIB [=n]
   Selected by [y]:

     - SND_SOC_INTEL_SOF_NAU8825_MACH [=y] && SOUND [=y] && !UML &&
       SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
       (SND_SOC_SOF_HDA_LINK [=y] || SND_SOC_SOF_BAYTRAIL [=n]) &&
       I2C [=y] && ACPI [=y] && SND_HDA_CODEC_HDMI [=y] &&
       SND_SOC_SOF_HDA_AUDIO_CODEC [=y] && (MFD_INTEL_LPSS [=n] ||
       COMPILE_TEST [=y])

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index bbd401e52be1..e165addec25f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1863,7 +1863,6 @@ config SND_SOC_MT6660
 
 config SND_SOC_NAU8315
 	tristate "Nuvoton Technology Corporation NAU8315 CODEC"
-	depends on GPIOLIB
 
 config SND_SOC_NAU8540
 	tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
-- 
2.25.1

