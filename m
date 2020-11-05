Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B92A7F00
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 13:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A051684;
	Thu,  5 Nov 2020 13:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A051684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604580700;
	bh=2uGp3txTzBcEfus81BIzcgmm+kobTWdSRDzGDuG0tCs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rPmFfq0lx2exf7hTmLM0fd4XDonr5xnouG2wMsaeVjtQ8anL3+XKH7t7sltnUEnsy
	 oFkkBrlXTeMdKYNy0FNlDre6Fa70GUDGCBLUY3iCZg3cw6tdReZeo9YQaONs7aCmLT
	 xkzfvdALAYLDiG4QVetTMxQ6OIm79ICGdlZZ2EOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C509F80245;
	Thu,  5 Nov 2020 13:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D26D7F80171; Thu,  5 Nov 2020 13:50:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B108F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 13:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B108F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f8u26zDO"
Received: by mail-wr1-x444.google.com with SMTP id n18so1621054wrs.5
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+C+hFQf4fR17sqAg53ZRGOMsBqw3qEsg3zbacKAW2d8=;
 b=f8u26zDOnu1BHe89VUV3H5l7cWUXq3IOJJDl3y9WOFjOWmn9enFSVWlENWcnFAVlyf
 FWW36yGMR49eouTFeMSwwlCN0RzZUoO7J+ZmVG5zfNzP7UJ0IyjS9lEF0PxD8Mg7U8yb
 3TuvgD62sf0Q6+wkpvAPJ7QiZ1jKRwJceI6KW7o9o3iGSISI0HrZi719NZTNn9YaEPBq
 n0q5VzdIkgpGpMmdadSqhXACzqhgQ0hdCvY/ifc3feBtkPGkTxhOZOjjnIsyZGaPmsXr
 pnj/+6oNEMgEaNaZkEEXX5paKK17nM+/J2NZl5aWlAeBCzybf4uFAQhOQuyB+5HfSeO3
 gv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+C+hFQf4fR17sqAg53ZRGOMsBqw3qEsg3zbacKAW2d8=;
 b=YkNSexXqeRHOhPtcczgWbH9+qnhDl/YJLgt88bHmnl0bPUAbLHQ3b8eDIbSacHoxph
 j5PQbZeBylc+0GFaqLUsnU66lyknFLGB2lvd6+4Cx5693KnwL2916Ihx3czzqBoSWal4
 kQcRlmGsz+XbnoH3PlF27Ae4emO7SEJd0xB5JzTXFLg/NwJHkJA2RyYMZlO1VC8WWsTt
 4Fqn3BMg10+/njdTUDkO2IY7mk5KL1pslpIYX0fyHzSMuN+Ht8UFxYjAS+Dg7EPFj25C
 tlVzf8I4+utsGrhf02Ezz0lv7y2U2LgYLnHLlmSAZfvWkaeBMJLE9nWhHw0pJtpMKz55
 EOAQ==
X-Gm-Message-State: AOAM533Y34hMOy+MxJfpMLz/YkTNB3JFihssF1Yss2UC73i8BO/ulbBE
 QGZpCoQLySNpwlX2iwyIxlY=
X-Google-Smtp-Source: ABdhPJy/qX5s2E/jLJsvII8+siT5LuOIrYywzGOEyLvMOrkQ6pRobv0L+e6n83dwD/3JM2IetjjaRA==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr2744512wrv.36.1604580600491; 
 Thu, 05 Nov 2020 04:50:00 -0800 (PST)
Received: from localhost.localdomain (host-92-5-241-147.as43234.net.
 [92.5.241.147])
 by smtp.gmail.com with ESMTPSA id n17sm2188378wrw.69.2020.11.05.04.49.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 04:50:00 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8192: Fix build failure
Date: Thu,  5 Nov 2020 12:47:47 +0000
Message-Id: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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

A build of arm64 allmodconfig with next-20201105 fails with the error:
ERROR: modpost: "mt8192_afe_gpio_request" undefined!
ERROR: modpost: "mt8192_afe_gpio_init" undefined!

Export the symbols so that mt8192-mt6359-rt1015-rt5682.ko finds it.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

build log at: https://travis-ci.com/github/sudipm-mukherjee/linux-test/jobs/428486008

 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ea000888c9e8..fbbe9ed9adb3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -160,6 +160,7 @@ int mt8192_afe_gpio_init(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(mt8192_afe_gpio_init);
 
 static int mt8192_afe_gpio_adda_dl(struct device *dev, bool enable)
 {
@@ -304,3 +305,4 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 
 	return 0;
 }
+EXPORT_SYMBOL(mt8192_afe_gpio_request);
-- 
2.11.0

