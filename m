Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 461432A7DAB
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 13:01:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E030D1688;
	Thu,  5 Nov 2020 13:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E030D1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604577704;
	bh=Us6oadXHLhAgtAsbsUBmg0oC1P2KWhKlp96m+6h8vto=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TlRxNNG2Ui75UgAXuFndY/nJO3MilBDQc+aDFPG9LRkNxUKNTDvmsLAEx6YFmcX3u
	 GUYQynCxT8+g2KRw0XcT24ejhan/686s+bZdJhxKnCCezbCu/V7txVvrG2HRUV2dQH
	 0oLta/3KVGuR0SnfpNTBV4UJsz59YDZnKv5qifBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A1C0F800BA;
	Thu,  5 Nov 2020 13:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23155F80171; Thu,  5 Nov 2020 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE244F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 13:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE244F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="se/DLfBp"
Received: by mail-lj1-x243.google.com with SMTP id m8so1302946ljj.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hD+jTA+3CFbm6Cc6YXWQOBtuekF/Hqs80WB365oy6RQ=;
 b=se/DLfBpwBk2kG2zcKQ1QbC/k7rlYtozlHPB89l89B0J9DJimFbaCvwAaqaqjuU1VS
 1z1yJM5RfY9UqOKj+y1YwINuAWbr66pWiPOTFbN5dK5K3cwnzj73z7jMz4Akxx8TTUNB
 mIXU07VN1CWxp0VJtD9+oH2qV7rskSX21CWBjOuHFMQ3x9zCzd1ROXjSTaCadav4J4j/
 4diuQfz0ntcAdVMQw+ZIa5s55VCU5PiCsLnTuErkY9GxmUBIwmeQsM5d7SruoK1oSf2V
 3OpI+j5s34L7QbupBHwew6QWVlszJBXpIlZKUaY9wf5jHiYzGfXZh9icMVFtWYUvMebp
 V5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hD+jTA+3CFbm6Cc6YXWQOBtuekF/Hqs80WB365oy6RQ=;
 b=Gy5H5+89EBSYG6dyXzVrYDgAkL6yFtMol6EI2kw0qurVy2Q44sTcIe+71iB1CtapBP
 pM1w+/p1uwFL3Cvd/SoceugIEMSMjeKn1b6bbnOLpjeuF8YBYC5ZzmOg4UjUxzq5w9KE
 FjH5XZOAWeQuDEYxu3+8AzeQ+VnsVUxQqF5uP3mh9xAoFiJJcMODtDmmM5cdbGyTfr0U
 ve3ic2M0HO5q1JbH+SciUCvFkMowuGpnn9WUj71HVbM+JFunaqwMbYv935ZpDc2yCdr8
 dXUcN2sBVc72EKDdUM1H0AjFcJa03m8ohK8raQHJ+5ipcffVw30eLT1ZudXy0ywFeWWk
 PH/Q==
X-Gm-Message-State: AOAM530ZxKlXOwiXGrsfBKYaEvdysuDLEKYeNDdQDQs0zbxVRbxvPCm6
 /O9OPyAb8bednKMr9dciOr4Y1w==
X-Google-Smtp-Source: ABdhPJxeGuSBmYyt3qkq1O4rs5PG3FDY0/PQS6egAACC/rH4szeNgwoAH/lrBc6CgnyvcOW6aXZ/FQ==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr709140ljj.297.1604577604283; 
 Thu, 05 Nov 2020 04:00:04 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id s5sm161307lfd.58.2020.11.05.04.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:00:03 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com
Subject: [PATCH] sound: soc: mediatek: mt8192: fix modpost ERROR
Date: Thu,  5 Nov 2020 12:59:58 +0100
Message-Id: <20201105115958.1850123-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anders Roxell <anders.roxell@linaro.org>, alsa-devel@alsa-project.org,
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

When enabling CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m the following
error shows up:

ERROR: modpost: "mt8192_afe_gpio_request"
[sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.ko] undefined!
ERROR: modpost: "mt8192_afe_gpio_init"
[sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.ko] undefined!

Fix the link error by export the symbols mt8192_afe_gpio_init and
mt8192_afe_gpio_request.

Fixes: 18b13ff23fab ("ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ea000888c9e8..0286c95ed2b8 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -160,6 +160,7 @@ int mt8192_afe_gpio_init(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt8192_afe_gpio_init);
 
 static int mt8192_afe_gpio_adda_dl(struct device *dev, bool enable)
 {
@@ -304,3 +305,4 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt8192_afe_gpio_request);
-- 
2.28.0

