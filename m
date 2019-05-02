Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00011388
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4541782;
	Thu,  2 May 2019 08:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4541782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556779784;
	bh=n9LIXaa3bDF6iMwdZxtV/mvMHjnLPJxa8D5BTsjX8og=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TmIYQ6ffN8+vPsZAr48hP0P7dyAzG3kHfIJo++4/ZUJlw9x3aggIWcikv7fL/Re0b
	 96kHae5ft3GXM94DTVaU9qP1adUVTDMlPtdRLnYgblLlWRPp6YZnQoywDcIrMuoCjZ
	 ym9V0oiTS4AT7vc9TI4l+iNMpCNVEQsZrhUys9/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A56F896C7;
	Thu,  2 May 2019 08:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52BBCF896C7; Thu,  2 May 2019 06:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00B27F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 06:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00B27F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OM63BoL4"
Received: by mail-pl1-x643.google.com with SMTP id ck18so417818plb.1
 for <alsa-devel@alsa-project.org>; Wed, 01 May 2019 21:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fOwKWUPB3XYL5vqCBpfMhq2ycc4DNiuOgeK/TTjRmug=;
 b=OM63BoL46xvlrzeumkV1LZA93RUL3Tn8qyNAtNyvef+IRAl9lg08hzIZVDBLnB43l9
 faSzDUTKXqhKzADVxeVXcKYh3EscgVnyI2P3JuY0rzwfvhkjCIZK/sLhRkz6YTnjy8U3
 ac8Rq85iP1+dm+tMt6U5hhlK0hwcuOiV2/DAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fOwKWUPB3XYL5vqCBpfMhq2ycc4DNiuOgeK/TTjRmug=;
 b=DLe9LlFB8WeR7JkJNYZ8rygsYnF3GZjz7mDLb3Vu/gSrUI2sIAdowuu12wRpvUMJXl
 pvpD/b2Jk3YzyPInruGElycxEVy+0RLayYUc9AeZ04iORneD0nejeKCT487pjjZx3iLl
 65aq09kyK1i3tKJULXbNgEyh7nahkBOXv9a4t7T1WhVAViKbCBltC5ZW1QfFbY4GNbcs
 gJCQh9HqJ1yKaes54nnMvgatHSE5C7CkOpIhsCuloR6iiDChslGKo9NXb4aKUGeWrbKe
 WQBkASMdEQHfzTXs7SGtkiIZeoeHzDslHVjEpuvSNQo/uQCQPByQm9cUmAWY9oeYtYpI
 XjhA==
X-Gm-Message-State: APjAAAWO9ZKATWaTOnoZozxNJX5lblARY66GXZizVSHQNyXsHzA5/mjR
 QdeC7maVFh2s+f9+0lSa6+38jQ==
X-Google-Smtp-Source: APXvYqzB3uwZbHEMviHNeD8m1xkKNL2FXm123P94Bp57SbqrASolvKxjmDOyHF1jlW5+fb0pShkuzA==
X-Received: by 2002:a17:902:8642:: with SMTP id
 y2mr1343912plt.104.1556770072646; 
 Wed, 01 May 2019 21:07:52 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:6cc8:36d1:3ceb:a986])
 by smtp.gmail.com with ESMTPSA id d5sm31527869pgb.33.2019.05.01.21.07.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 21:07:51 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  2 May 2019 12:07:43 +0800
Message-Id: <20190502040743.184310-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 May 2019 08:47:52 +0200
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, dgreid@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: da7219: Update the support rate list
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

If we want to set rate to 64000 on da7219, it fails and returns
"snd_pcm_hw_params: Invalid argument".
We should remove 64000 from support rate list because it is not
available.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/da7219.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 5f5fa3416af3..7497457cf3d4 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1658,20 +1658,26 @@ static const struct snd_soc_dai_ops da7219_dai_ops = {
 #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+#define DA7219_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |\
+		      SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
+		      SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
+		      SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
+		      SNDRV_PCM_RATE_96000)
+
 static struct snd_soc_dai_driver da7219_dai = {
 	.name = "da7219-hifi",
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = DA7219_DAI_CH_NUM_MAX,
-		.rates = SNDRV_PCM_RATE_8000_96000,
+		.rates = DA7219_RATES,
 		.formats = DA7219_FORMATS,
 	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 1,
 		.channels_max = DA7219_DAI_CH_NUM_MAX,
-		.rates = SNDRV_PCM_RATE_8000_96000,
+		.rates = DA7219_RATES,
 		.formats = DA7219_FORMATS,
 	},
 	.ops = &da7219_dai_ops,
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
