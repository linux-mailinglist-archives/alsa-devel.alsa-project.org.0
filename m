Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410A2AFA17
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 21:56:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905861786;
	Wed, 11 Nov 2020 21:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905861786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605128183;
	bh=29lT7hGNITa/X7a7JC5rulZnaedTqcAmsIELy5Fc8Kc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QVmkb2qvAa4Blbeg7fRxO6fA3yKtJ//HNYm0k8ajC6gc9er5I1++Ps1W6IQVm0Lf5
	 yDJvfk1tMoGWPASiOkws0fFljE8wo/eGRijv6MeNH1fIYzrQsFBVVV7uZns5btkf8V
	 WQzta9kFUDC5FeQ71QZfShrhdDeT828eoEBlZuGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCEBF8022B;
	Wed, 11 Nov 2020 21:54:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E9A2F8020C; Wed, 11 Nov 2020 21:54:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD4F8F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 21:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD4F8F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ueclBL5a"
Received: by mail-ot1-x341.google.com with SMTP id i18so3494223ots.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 12:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=VgpeWsRTTojekaZd0nKJIZviZMfkuw29mtRuDlp4Q38=;
 b=ueclBL5aYloNM73FTRpAK46UaQtvV4N9obrKltg66JadAKp9kzv2yThjqZNLeAVU5+
 ImPGB4Wrz8k4VnRPx3COlhBID/uCFV1U2ytFIGuvXORDLoJ8t3BYJeNgA5DAItJ8HwWj
 SHuVV3qNKWlWuoq4wYRDIyChUgyZP9U0/tK+8oJBw/X+KJb0LI0WrTG/y9zOnwDvMXt7
 d7zMYfJZcfD/oC2oQwKC9GtHxu7Euv1FeVQizLbwhnsT3EuSDR8qLkJjuqKIVJC5kSMm
 AKPB32BuzpOz9gwT0kbt30kMpCTNrQeFKzPAGVhZ6xyqhfCDKhvI1VR5PJKFV5q7CiZP
 /oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=VgpeWsRTTojekaZd0nKJIZviZMfkuw29mtRuDlp4Q38=;
 b=FKkvlPKcyfV/pPSQ8dcKSc0jwmTAW0Z9k56CsVNFxZXW0W4u0qbabtaUeQJmZWnLe5
 yEW6Q593b5JlGa7RIWKZ5uInazzGTji33RqM55xSWf6el6KrwdBJHkWiDMYGZCaMEzRr
 /iiM1nbXHU/vrLQXvLjlliRKBf4FOOcKIfcbVVhA2Fr1vHe7xV47yFyKjCJ98onWkXFP
 0icXpdspwrzETKhiw9aS2tkRk40eIWeP9vjjMXfY12WR0Eed50kcWdscMWVjP5zcyrpO
 JWFvaB6917SYldfc0Q84pPdikRzFk/IgGB20g8WkSSrjU0KBFgD0YODA0nBGoznXlkCa
 /egw==
X-Gm-Message-State: AOAM533jOm42ET19WmBmOCCjnoH+RI/7JtXuHIyZiaxGvOmOCy1j/krQ
 z/w3nBjF5coBsm6+IFz6Hys=
X-Google-Smtp-Source: ABdhPJw6aPFYn8VWrBcJU1RgKXK7hcAi8FtKraIiknX01BQ4W8eGnJ7DJs6qh75SuuP4AobdzvaXyA==
X-Received: by 2002:a05:6830:2259:: with SMTP id
 t25mr19495062otd.192.1605128077307; 
 Wed, 11 Nov 2020 12:54:37 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p126sm651793oia.24.2020.11.11.12.54.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Nov 2020 12:54:36 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASOC: Intel: kbl_rt5663_rt5514_max98927: Do not try to
 disable disabled clock
Date: Wed, 11 Nov 2020 12:54:34 -0800
Message-Id: <20201111205434.207610-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Brent Lu <brent.lu@intel.com>, Guenter Roeck <linux@roeck-us.net>
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

In kabylake_set_bias_level(), enabling mclk may fail if the clock has
already been enabled by the firmware. Attempts to disable that clock
later will fail with a warning backtrace.

mclk already disabled
WARNING: CPU: 2 PID: 108 at drivers/clk/clk.c:952 clk_core_disable+0x1b6/0x1cf
...
Call Trace:
 clk_disable+0x2d/0x3a
 kabylake_set_bias_level+0x72/0xfd [snd_soc_kbl_rt5663_rt5514_max98927]
 snd_soc_card_set_bias_level+0x2b/0x6f
 snd_soc_dapm_set_bias_level+0xe1/0x209
 dapm_pre_sequence_async+0x63/0x96
 async_run_entry_fn+0x3d/0xd1
 process_one_work+0x2a9/0x526
...

Only disable the clock if it has been enabled.

Fixes: 15747a802075 ("ASoC: eve: implement set_bias_level function for rt5514")
Cc: Brent Lu <brent.lu@intel.com>
Cc: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 922cd0176e1f..f95546c184aa 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -700,6 +700,8 @@ static int kabylake_set_bias_level(struct snd_soc_card *card,
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
 		if (dapm->bias_level == SND_SOC_BIAS_ON) {
+			if (!__clk_is_enabled(priv->mclk))
+				return 0;
 			dev_dbg(card->dev, "Disable mclk");
 			clk_disable_unprepare(priv->mclk);
 		} else {
-- 
2.17.1

