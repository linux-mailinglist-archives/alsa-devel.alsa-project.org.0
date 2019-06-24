Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4B51CA1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 22:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2C71657;
	Mon, 24 Jun 2019 22:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2C71657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561409679;
	bh=Kj6RLplfUMfnLxwFsMPuqPwmNWmUxZ/MrU0kdUbeSuE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T8Sjqoo63RcNghGWz+vS8BuReWpxnM3wU0EEeKyQKDeXp/1G3C+CFWYmTCCMp/2Jd
	 XPj4jZNpsKdtTQb+DTDFJ8yU6HCx6/xZAVF6cWxMvmXv54TNqMHOhqyT/cSYsTl7ng
	 Hs8MTl2FHUXCpgR1rbBrfOteMd4FP8UEE+yNB4DQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 294BCF896B7;
	Mon, 24 Jun 2019 22:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89969F896B7; Mon, 24 Jun 2019 22:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA260F8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 22:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA260F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XFrtf5GZ"
Received: by mail-pl1-x644.google.com with SMTP id bi6so7560261plb.12
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WF1As6A9uHnJ0r4gMHQD1LVkVSUX8+ZbZaqZ/BdGQI0=;
 b=XFrtf5GZ5CYISGyn/z5MR7k6x08VBdHxF3HtnLEUBBby886yqBzQT6I71NlfT7hAsA
 1uMFQSfSv3/MRxbLEZPzSM4Uk9Jrc+Fpl2Acu2swF/8Epd+skd9i3/IQ4Ou2h28yjnlk
 wdxsnqNK7bOdE4dMtqUGrRsb/h/ukQtiqiDZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WF1As6A9uHnJ0r4gMHQD1LVkVSUX8+ZbZaqZ/BdGQI0=;
 b=pq/y3LtemT7n2Vc1i43uw6HPmbV+waOPjxJRzVnz4FRA3hqiKkEBf9FLJbkQYrlQFG
 9NOVtCsK7KbyMKo+K6tLjI4gvp91AR1UM2DiuugVes8HNGRThQjjEPgbH79Tqb6rKKV5
 7FscOXrIhVK5Ctt/Ir8IEL99Rdj1iVzO/F8zHB4zCF5p5+Cx4Yao9mLDRbPbstWbUvZr
 19dJS/VQIRCKLZYttRW9NV+JRM6juog0asjYgsy6nLRsI9m40rRlsTz2gviiLVYm+Car
 OuP96ZzvwmpREOePa6VQBrty54dRH23Zv/Z/NpvxfyPjH8SvoD+FSGWNo9A/iFOqWhJb
 nf4w==
X-Gm-Message-State: APjAAAWX95zTzA/5o3xnZ2c5dlG596rMflFjX0qCnt0vOX4dn0Ag6xxa
 cmGH6shpdTD0c15/Mf+mMpa/Sms7gQ==
X-Google-Smtp-Source: APXvYqxtfkolCqN1/Hd/zzeQ/uuGG43tndVekKKD2kUKYC+W84LaArheFJxEB8+Me7g/DSNSqyHdtg==
X-Received: by 2002:a17:902:7295:: with SMTP id
 d21mr129558154pll.299.1561409566102; 
 Mon, 24 Jun 2019 13:52:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id h12sm392922pje.12.2019.06.24.13.52.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:52:45 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Mon, 24 Jun 2019 13:52:39 -0700
Message-Id: <20190624205239.150516-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: depop stereo dac
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Upon enabling the ASRC DAC we need a delay to avoid popping the
speakers.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Ross Zwisler <zwisler@chromium.org>
---
 sound/soc/codecs/rt5677.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 20b1d03530bd0..c779dc3474f9e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -2608,7 +2608,8 @@ static const struct snd_soc_dapm_widget rt5677_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("I2S2 ASRC", 1, RT5677_ASRC_1, 1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("I2S3 ASRC", 1, RT5677_ASRC_1, 2, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("I2S4 ASRC", 1, RT5677_ASRC_1, 3, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("DAC STO ASRC", 1, RT5677_ASRC_2, 14, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("DAC STO ASRC", 1, RT5677_ASRC_2, 14, 0,
+		rt5677_filter_power_event, SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY_S("DAC MONO2 L ASRC", 1, RT5677_ASRC_2, 13, 0, NULL,
 		0),
 	SND_SOC_DAPM_SUPPLY_S("DAC MONO2 R ASRC", 1, RT5677_ASRC_2, 12, 0, NULL,
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
