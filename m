Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE385B7D5D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 01:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1768217C5;
	Wed, 14 Sep 2022 01:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1768217C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663111106;
	bh=+NVLnZZSRThtW4hC7owedaiJCxp9y9TJqwg71HgfF1E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EHlzqNiKOgTY8vpfRqnjZUHqIIB6UWgDt5cq0UoPOnG/I/7ngkJQL6BzD9KzfiBBE
	 gTrfB2GelpHJsapl2oj6WYGnqq+N9Q6zsqRFhfopW3r6sGwp7QAiT8zfMox56MRVRA
	 wuLzKWIIeYvQPv4XNqFJnPABQRWoNx4hqnClVYTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE9FF8025D;
	Wed, 14 Sep 2022 01:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41256F80154; Wed, 14 Sep 2022 01:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C86ACF80154
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 01:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C86ACF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tv8BGp01"
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so26617082fac.13
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=QtCoq8/DDuk66HiD15M6gihN4tk6Q2nORlmpz8rdjKc=;
 b=Tv8BGp01IUDBVa2j1RT44Ni++QgcMYqbFk+eKaH2LLBC375/1sjVlLfRIMpKS2MDKn
 8F8HdoQJXGqWu8KS5AHQ1pbN0nysxOQKp+w1SddY8jr7GjVQkNoV4txxRRfSj6KAyMjE
 hyMMhlB54XoJvcc8CESvdQxKAw5CR9tZSd8NAZL5AkPWwCTANqJzPedjZTY3W1COkwfO
 vTfeo6LHAMRr8zSMzA2eIJWFHHCCD/SOGl19/TRhb7PuNPyPaUkIcd+yhN5g4YzaScht
 WGMRs+3eqCs2kOMyNxMWbWeyP7frUsaEszX7gE714uno2C4txgQ3MH2vwjI7k54yoj0X
 UIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QtCoq8/DDuk66HiD15M6gihN4tk6Q2nORlmpz8rdjKc=;
 b=0qE9ASfsxOJx98GqGgRZDaZyzy+t/TQoshkNHAKRk5SVUO0rwdexFXttC0SrXpMKu6
 B5FdNIhgECvr25KkEwejh05UIiJW8lVGzMALfi5cFbrpuaqxPryQd1bYl5x/i6ZaRAMP
 xwA+WHf/edyNVZb3U/mtz0x5RzbNKTV9M10cy6y2iBzS6K+oODebKf0mWZBXeg7e5gzG
 mAT+8cJyy6YGYI1Fa8XY9Zg3DK/xOhflQaBTe6jhoz7PiaCMC0gJWrPwq7VBBSUjFtSN
 YFOmTc/TxRttShyLdO8EB0Nyfb5RbAUS8w79hDt21eW5oNfDtN7eUc9JNc/FjNMyB9sB
 oWkw==
X-Gm-Message-State: ACgBeo1OBBOMTfi6Zu/q0d5fl/CXAKClU6N9gFT+w0uQDVvXhSBJYJ8h
 aEIZihIc3ua/074a/HrIqFM=
X-Google-Smtp-Source: AA6agR4a0m1f0qA3g0gEbFY66g9Qr5EqWp5PmL8/W8NoCrR3CDBZPTk56hC6L6ak9vkAva4OMX8gpA==
X-Received: by 2002:a05:6870:70a9:b0:127:9820:f0f7 with SMTP id
 v41-20020a05687070a900b001279820f0f7mr866159oae.296.1663111036545; 
 Tue, 13 Sep 2022 16:17:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5915:3e22:aec9:fa78])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a4a9693000000b0047588e58d95sm2187341ooi.18.2022.09.13.16.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 16:17:15 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: tas2562: Propagate the error in tas2562_dac_event()
Date: Tue, 13 Sep 2022 20:17:06 -0300
Message-Id: <20220913231706.516849-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: povik+lin@cutebit.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@denx.de>
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

From: Fabio Estevam <festevam@denx.de>

Since commit 2848d34c3ba1 ("ASoC: tas2562: Fix mute/unmute") the
following build warning is seen:

sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Fix the warning by returning the 'ret' variable.

Fixes: 2848d34c3ba1 ("ASoC: tas2562: Fix mute/unmute")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/tas2562.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 66149055aba9..b486d0bd86c9 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -439,7 +439,7 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 					snd_soc_dapm_to_component(w->dapm);
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -455,7 +455,7 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int tas2562_volume_control_get(struct snd_kcontrol *kcontrol,
-- 
2.25.1

