Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830D83F6F59
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 08:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09DED1680;
	Wed, 25 Aug 2021 08:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09DED1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629872399;
	bh=a3AIphFdRcocZMLCZHjn970G5CBNe6lF7QG9ePqsdsc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IYcI8/uiauXdfY0jybozrEWvIN0tR4KDUEOiFSnJxip8/EbaDkk5U/MAxn9iIQYN3
	 ruTaIj9/KSdjHQR9NOgW3D2Ahb09nm/gZvSn/ZIddKN0DMdtjmfI5+JKplHIb0CS2/
	 Q3oSAzrpf4XawZoxQZTMruTzUt2oksEQFHjosLfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A74F3F80171;
	Wed, 25 Aug 2021 08:18:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD655F801D5; Sat, 21 Aug 2021 09:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B326F801D5
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 09:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B326F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="YRPrdmYY"
Received: by mail-ed1-x531.google.com with SMTP id cn28so17429444edb.6
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/y3dK7vojFLXCbamFDXBo8dMK9KukRjfR8aixPFIsGY=;
 b=YRPrdmYYrCHs0o9mm+bACHrIo3O6nAMih5C5jCxMonrmFoou6dSLLJRmSW5fXK1gAK
 NH9WXCHRe37WsRXUh4v6ZiZ41xxTjkWjpLxLWn48zGtuCXkzRDJapBecd5XcLJt/dQfy
 mZ8lBXkMiKNz3+9u7Ym44mvODAa9hu8dYXp8ymTA2i7WNVRqLF5j4jBQIRjjsLYmB/EB
 2Di9oFsLk3j4w66nwDxC3IKJGW1mLbY87yHtsKhSPiphxbTDfuDCDIsBufA08PqybwPf
 aoGlYbEqCvCSfeEcITj6anAiZfBc19KK7n4/BAX9C03IxqSP+I5NTRSlnhKUe/JxiEz5
 KYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/y3dK7vojFLXCbamFDXBo8dMK9KukRjfR8aixPFIsGY=;
 b=N5nxZLRu3gsd7RyTHDEXFRVimlgMYPGkPvQTqcuo357K4RRW8YevFUUv92RuPF1Cyp
 krE3aG1xViyMTQl/KdAEqsQXP7aBZgFJ+HTNfUyOeYkYnV+99LLaVv4Effe1r6h6pObM
 RTxCNAB6iERXAFxkjhWioNn0YdgkfRegdAgCQCha2slayByqhCgfvt+JEe5Byjl4Ib6m
 RREd5aaCy+wJxUN6IgX060QxSJ1K8iNY0MsslP+WyRWZkUDUJYcbVxLpPp+K0KH9kRSr
 oopUditN8WBZ6ZKo1NxTS/jQ3VdjVqmwIOfmPFhwxyXYBwijNB66Wp+SFSyu13gZcBTv
 fLpQ==
X-Gm-Message-State: AOAM533MnhjR0MP3MF9SBTq81zxel7NwF6e1jmMHLn1ScYjC8Uxo4fSD
 2dYx5ZkhuH9GgMLue94ogrNUoy1isAbXyBLV
X-Google-Smtp-Source: ABdhPJz+pk+DO1Kixhyo9Y+PcbhbEfXeR0Fm+rdN3MMGikCbYJQc11Q0HUcJcavVNI69cT6mXLgS0g==
X-Received: by 2002:a05:6402:40c9:: with SMTP id
 z9mr26897065edb.159.1629532549514; 
 Sat, 21 Aug 2021 00:55:49 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-95-246-39-126.retail.telecomitalia.it.
 [95.246.39.126])
 by smtp.gmail.com with ESMTPSA id i11sm4848914edu.97.2021.08.21.00.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 00:55:48 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [RESEND 1/3] ASoC: ics43432: add CMM-4030D-261 support
Date: Sat, 21 Aug 2021 09:53:52 +0200
Message-Id: <20210821075354.4140327-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:18:36 +0200
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

