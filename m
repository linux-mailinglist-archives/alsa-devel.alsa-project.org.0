Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD456680E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 12:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0DE1631;
	Tue,  5 Jul 2022 12:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0DE1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657017245;
	bh=pwbEfdUHN9Oqlu9FwgCmB/JRJRN/RpnyE6rSVgpFhmw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V3XcyjGiYpuLZTXhcdGlSsiphgVOeMi3ObJBu3WBrmmaE7ToFY9yq+RJ/dhc8jGCJ
	 i4vM6p2lbrYPXdscLAHP/g9smTFf8WjhbxH344DJyvIk+7qs6QRfGRJXeNkGY6U/e5
	 65GqNeBKB5MCgGoL5dfyV7QhSJqT5w46+jQAENN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB4E6F80212;
	Tue,  5 Jul 2022 12:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE1FF8015B; Tue,  5 Jul 2022 12:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 986E1F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 12:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 986E1F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CLXsjGhp"
Received: by mail-ej1-x635.google.com with SMTP id pk21so20900147ejb.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=jY5FjsixWEcU8zWWnoT9i17TwQs6gwoN4AcRetl459A=;
 b=CLXsjGhps7gMkknzEejhsqeXGH97V6MUc8+1rvRng+RCUolyNyxRSjRnpe0IclsK5e
 YYRN5JHrfj7XOXa9vWKxCbw7mEDKJSaR/ywYKw0jIEGtRY8S/LayzRbvfvKX3csZR36f
 Br6uh63jmTgncimGaDumlZAhkZBWplIsKCz7Toi32BLIGHz8hIvBJEDHnxkCFp5+Zp6f
 ZKzVQfSoAW0rPlVYOSeRthMhkh3iLJBPHoWVRtBYp/0KBi5BQQR3fjWNnieqXOjFWGZt
 e7UwHoDELvPxzOhhiWbA4dHPGA4rguCmnAkZEJnjk3iHcvg0yfW6jYTuy1u1HyuOMVrW
 FeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jY5FjsixWEcU8zWWnoT9i17TwQs6gwoN4AcRetl459A=;
 b=KdEXbmMMfYHxeW4F28RU0gDzrkm4yKonC60AIjO3MSHVjOFXMZCh5OJVcKC8aqWaVH
 cHxcWe1odbImk1pNS9LMEgw2tvO+Zc9W7iEgu7WSwDp6QycodxRKtyt5cdeFEmM37KmX
 izPzJS1zEia8mNjBq6Ve3az4ittyhX7uBrqp5NxYVLryCHnYkL2EyFlWNPZsH3zUSMTr
 vJAKj3ogYnkgMtTQmRZ71HkRyLn2ZbhJ9Z9zJcSB+RIhIfTHIo+NYpONmTzkvgvST94+
 znW/pvqMjgbyG37ZGkUYq4uCJgBxDOp5wHeifrKIZ2Qr23cdui5xhBifIHGCdXUMQJGx
 eISg==
X-Gm-Message-State: AJIora8447JXTkyFcc2I5vHXsCN1lawrHVaFE2PkfK92Z5oRHuvNMBSa
 ZZwYzzM3O8rGdn8Tde5mGas=
X-Google-Smtp-Source: AGRyM1vbRqvZJ1bJMfKQceJ+JeD7Wl2liAwNwopQ2x8qJrxF1kBDubDhMTHNKcVUtXWF2qb02ic21A==
X-Received: by 2002:a17:907:271b:b0:72a:72bb:6f47 with SMTP id
 w27-20020a170907271b00b0072a72bb6f47mr26019412ejk.634.1657017177777; 
 Tue, 05 Jul 2022 03:32:57 -0700 (PDT)
Received: from felia.fritz.box
 (200116b82698ad00a9019cf0f015ae6b.dip.versatel-1u1.de.
 [2001:16b8:2698:ad00:a901:9cf0:f015:ae6b])
 by smtp.gmail.com with ESMTPSA id
 p19-20020aa7cc93000000b0042bdb6a3602sm22540880edt.69.2022.07.05.03.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 03:32:57 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: avs: correct config reference for I2S test board
Date: Tue,  5 Jul 2022 12:32:38 +0200
Message-Id: <20220705103238.7484-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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

Commit e39acc4cfd92 ("ASoC: Intel: avs: Add I2S-test machine board") adds
the config "SND_SOC_INTEL_AVS_MACH_I2S_TEST", but in the Makefile refers
to  config "SND_SOC_INTEL_AVS_MACH_i2s_TEST" (notice the uppercase and
lowercase difference).

Adjust the Makefile to refer to the actual existing config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Amadeusz, Cezary, please ack.

Mark, please pick this minor build config fix.

 sound/soc/intel/avs/boards/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 25e8c4bb07db..bc75376d58c2 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -16,7 +16,7 @@ snd-soc-avs-ssm4567-objs := ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
-obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_i2s_TEST) += snd-soc-avs-i2s-test.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_I2S_TEST) += snd-soc-avs-i2s-test.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
-- 
2.17.1

