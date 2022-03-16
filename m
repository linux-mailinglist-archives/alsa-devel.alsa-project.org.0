Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BA4DAC94
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 09:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DB0172C;
	Wed, 16 Mar 2022 09:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DB0172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647419872;
	bh=FBtUtJs+hjUhmnYKyznGlSL5ghpMvd3de6pX3TrFFfg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SBiujHlJdH5dB3FyvriYZU4kNntarsAZjGX9MXHgpKs9xBRkL1ogPNCOjF88+yfla
	 olkWUSanVljoShvH7cY753A7Ld+RIlSOpVtuw/rGXxunEIl2ijxcOypJwXgMs/dT4z
	 eK1LRHidP888RrAkMudqz5A+PEOEZe2Ud2vo2irk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E05F7F80095;
	Wed, 16 Mar 2022 09:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E659F80095; Wed, 16 Mar 2022 09:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A31F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 09:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A31F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CNDnNE9K"
Received: by mail-pj1-x1030.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso1784584pjb.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=fY/zaLzCuGHO00tXLKrc5cYu1RxjEzrTCpzH+5kdjtU=;
 b=CNDnNE9KZy+3df6cRpaus30OZLx3PmJ7daQwTY/ZAkNcugLK6uvHFdQ/jm1WRkssdr
 0VemyHlCitsLQ2xxJh9pl0/f3oDCS+l9Z+n3999w628BOOGjsmFsKAyNdt/EPCmMUnlW
 Icb9BPtmYub98o4KGgk66Uqace8bAZ6JbXFHKFWe3O8MM6qrZSUUUwPBCmMxbNY/toWC
 znRCXSqyySHAQzqPI5R2f1IgqsoOzd/3/mv3jbPRB9qfPmHPKw6sqUXHUzahYy+eIZuk
 tDbewJILUS/mmKiBhRfrpCupE4/LPYDgP914mB74jaiAdTpsnRdhnaDIM21DZ5BCXvmp
 y5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fY/zaLzCuGHO00tXLKrc5cYu1RxjEzrTCpzH+5kdjtU=;
 b=xOr2WRjKRoQ79EX8rSUJSOILWMVqtzsvvP9eFZQG4Og929ijfe3lvVGRbSMhQNcvRM
 K59o4rSzbF/s9q6mR7ELtWkQhiEvowmG/QAGRSnAtfbx820hrTqAr3w1pVIZmmfz/60w
 3be2BIqUk4B6Uz9md+fmaiLdk6f0Avt6C04/O2sVq65rXw54G9ub7vjbg9BXPIYnMpRX
 +VDEyLeFNxgCz1JNmo98eVPujkQzG8OmT8uMEnj3ibNjoX1msCszQAbZchVhfc423XJD
 rJUo5kdDEFpjCj+HzNuy8FNkYDikDMoUbN0MDeQesaRQUbbbAOxhmJFIU5511gaL/hpy
 fJoA==
X-Gm-Message-State: AOAM532y3dJVO0JzOw+/MiYREfj4zdYsbG57uNh3xoxLmp3G07dCWULP
 wzUeVDiK9JjWwtRE8kNS2to=
X-Google-Smtp-Source: ABdhPJyzDQP71kpiZTM8gd8+SZoVddtqgb+feTmdopJLJpiVBmMmFLxFBmLZMo2rnfxTGipeqUpXrw==
X-Received: by 2002:a17:903:244c:b0:151:bb4d:d8d8 with SMTP id
 l12-20020a170903244c00b00151bb4dd8d8mr32181559pls.121.1647419796782; 
 Wed, 16 Mar 2022 01:36:36 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 t7-20020a056a0021c700b004f7916d44bcsm2060381pfj.220.2022.03.16.01.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:36:36 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd934x: Add missing of_node_put() in
 wcd934x_codec_parse_data
Date: Wed, 16 Mar 2022 08:36:31 +0000
Message-Id: <20220316083631.14103-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.
This is similar to commit 64b92de9603f
("ASoC: wcd9335: fix a leaked reference by adding missing of_node_put")

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/wcd934x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6c468527fec6..acd344c4a37a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5883,6 +5883,7 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	}
 
 	wcd->sidev = of_slim_get_device(wcd->sdev->ctrl, ifc_dev_np);
+	of_node_put(ifc_dev_np);
 	if (!wcd->sidev) {
 		dev_err(dev, "Unable to get SLIM Interface device\n");
 		return -EINVAL;
-- 
2.17.1

