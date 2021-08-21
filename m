Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF13F3985
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Aug 2021 10:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD2A1677;
	Sat, 21 Aug 2021 10:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD2A1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629534657;
	bh=a3AIphFdRcocZMLCZHjn970G5CBNe6lF7QG9ePqsdsc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iIB7bqURdKAMkwcQyamsoq8s9Z8W65TCB+cgMvRuONq+VnzmpE7W1egNoPgCVEp7c
	 nseAyg+ceN2twAeak2cMUxS6k+YjohVDSDznS9//vhBqJhiAWCDs9TDmE6iKlf3IX0
	 wIw2rGnAKDMVH08jyOSdVHBx8rsVXYPVmKkHSZDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ABDCF8016B;
	Sat, 21 Aug 2021 10:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B5A9F80301; Sat, 21 Aug 2021 10:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C300AF8016B
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 10:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C300AF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="rpr5nwb/"
Received: by mail-ej1-x62d.google.com with SMTP id d11so24977018eja.8
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/y3dK7vojFLXCbamFDXBo8dMK9KukRjfR8aixPFIsGY=;
 b=rpr5nwb/AClorHn+ztmsbcPt386tNSkXkADI+wymyermVpxTN9iYKrBoVyfHHPV0KQ
 xwxXR46ztMoG+Hp6whjAGyyLWP3CGsbHLCqXDKi8kq5C4XB2Bmo11dr22t89YAvASd5C
 4S+HNxNs3IYXd5/i6Nv95RUUjGvLtO/U4qOc+6viPKVKwbwhR6wNb2JvPlzql6I70FXV
 NTh978SrqXpXl448UyM77S8NfFkfQb1MTHN412EVDOV6axiBFWbuUW+HM+70AKgmmaEX
 o4Gmjo1RWs0G7C1s1Kc/zx+FU8XGPX0QG7mJwmiJFRaSYAV4hTZ4TFtqozJw8ARcX0bH
 KW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/y3dK7vojFLXCbamFDXBo8dMK9KukRjfR8aixPFIsGY=;
 b=tX3wDv2qK83yoBfHXWst7uSVcIF6jRC6TBRw9kjT9ZFyLdctACUF+/BoaCjojqM18A
 2PWRBYkt1g9BWjcnqiuQ9soe6DkWZ/ZTkY/U8KQxo8lN7xvMGqPCvzkJ+gO1hSo0qc3V
 YaV4or2SbE92VJOCpw4B+93NrtlDmGnUXgaebTPY/r1S9cxZ59NR/nc9sIn/EPghEe0R
 IfbgWcB7f33jwF+5guu5zSPNgSgMc9pll2M4ATrzfz8sF6VDNPAMV2IRURdeMbN5rh+B
 cYcgYXNWPInZtLhhGlL/ea+fUN+9+fL14MUmh3LXrpPgBYkgfA/U22IUKHhiLhrWRY72
 9/sg==
X-Gm-Message-State: AOAM530e49E6brQX4Jhs0jyDPJve+06dW5N9+gcWQBRrZbXlIio3oWGG
 NfNioDPJlyTUXO3v2MW0F8G+WHyNgb7A/jkD
X-Google-Smtp-Source: ABdhPJztfy4Hz8Tzy0ekLnUumAuHcZYy5S1M72kmsD23KFlUJ2+/0HRytWfhjJyHw7MuYdtWoXPTiw==
X-Received: by 2002:a17:906:68c2:: with SMTP id
 y2mr4215046ejr.18.1629534533952; 
 Sat, 21 Aug 2021 01:28:53 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-95-246-39-126.retail.telecomitalia.it.
 [95.246.39.126])
 by smtp.gmail.com with ESMTPSA id a22sm3960296ejb.90.2021.08.21.01.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 01:28:53 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [RESEND 1/3] ASoC: ics43432: add CMM-4030D-261 support
Date: Sat, 21 Aug 2021 10:26:56 +0200
Message-Id: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ricard.wanderlof@axis.com,
 Angelo Dureghello <angelo.dureghello@timesys.com>
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

Despite minimal datasheet differences, the driver seems
perfectly compatible with CMM-4030D-261.

Tested CMM-4030D-261 to work with this changes:

/ {
        cmm4030d: cmm4030d {
                #sound-dai-cells = <0>;
                compatible = "cui,cmm-4030d-261";
        };

        sound_mic {
                compatible = "simple-audio-card";
                simple-audio-card,name = "i2s mem mic";
                simple-audio-card,format = "i2s";
                simple-audio-card,bitclock-master = <&sound_master>;
                simple-audio-card,frame-master = <&sound_master>;
                sound_master: simple-audio-card,cpu {
                        sound-dai = <&ssi2>;
                        system-clock-frequency = <2822400>;
                };
                simple-audio-card,codec {
                        sound-dai = <&cmm4030d>;
                };
        };
};

Audio has been captured and tested successfully by:

arecord -D "hw:1,0" -f S24_LE > test.wav
aplay test.wav

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 sound/soc/codecs/Kconfig    | 2 +-
 sound/soc/codecs/ics43432.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index db16071205ba..cd1976aae328 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -847,7 +847,7 @@ config SND_SOC_HDAC_HDA
 	select SND_HDA
 
 config SND_SOC_ICS43432
-	tristate
+	tristate "ICS43423 and compatible i2s microphones"
 
 config SND_SOC_INNO_RK3036
 	tristate "Inno codec driver for RK3036 SoC"
diff --git a/sound/soc/codecs/ics43432.c b/sound/soc/codecs/ics43432.c
index 47e749f03940..de4c8460ab3d 100644
--- a/sound/soc/codecs/ics43432.c
+++ b/sound/soc/codecs/ics43432.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * I2S MEMS microphone driver for InvenSense ICS-43432
+ * I2S MEMS microphone driver for InvenSense ICS-43432 and similar
+ * MEMS-based microphones.
  *
  * - Non configurable.
  * - I2S interface, 64 BCLs per frame, 32 bits per channel, 24 bit data
@@ -53,6 +54,7 @@ static int ics43432_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id ics43432_ids[] = {
 	{ .compatible = "invensense,ics43432", },
+	{ .compatible = "cui,cmm-4030d-261", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ics43432_ids);
-- 
2.32.0

