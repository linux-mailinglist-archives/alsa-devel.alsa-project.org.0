Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4C5EF637
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 15:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5801215E5;
	Thu, 29 Sep 2022 15:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5801215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664457408;
	bh=YFKla1dufk2LX0RLzC9F+IDpDqw5dngCBYir73x0dHQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c8iudhCGocipmAtD/qu8ayp5+g+iSVETJ97MI1JYJH3FIfBxU3kBgP88dacLillwD
	 AJe4fkYB8YpK8XkorNm67kdsTAJn0qtaGXq3CeaP2kiyUS7KxGA9EC6GScDTuzc50l
	 wSQHnK3oQRpROM3TFfuYhYkuUWgxA9qWXafGVSxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C13BCF80109;
	Thu, 29 Sep 2022 15:15:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C3FF8023A; Thu, 29 Sep 2022 15:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D99E8F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 15:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D99E8F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QjKSMj0m"
Received: by mail-lj1-x22d.google.com with SMTP id q17so1488174lji.11
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=riQobyzwp2LcDSstTSNaZWBzD1tl8SlvgbLUTdoCvUU=;
 b=QjKSMj0mf4wSynBHfJ3wgQvGLExaw8bbk0gGS9hrSkwoSz9BCL1/5u5Z6dTymVMzWo
 WDYScgqAyO6xh+eshaQ2IDe7D496We6Rg6ZCsiaFYgZWRX84Rpvn8npHheqbhWNE8T/6
 7x+bY6bhT32sQ0jP6Yay/Bssx4DGdrYNt/GXdo9dSSbKERsewsCmHauXdR3P6aXSD541
 jBtykxrSXE+Gowg2LlqLs6IfYlhFOkycWk8HsMNOYukLg0NrZLHL52WqF4VLENwllfFp
 2jX2Z90j6hlKwI6DVYV2g8PlfO0qGi+4gH0uv7oC0rvehojOzwgo5SrcxUabTpyOikhW
 R0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=riQobyzwp2LcDSstTSNaZWBzD1tl8SlvgbLUTdoCvUU=;
 b=PbM+Ee1Td+dbRk99omg8gTIK8WCM5dWw8x4zsMFClfmtGDLBHdWP+PbUhjp+osVB1G
 kavMwR6STd6iLrO+Rw8ftC8otQMk8s4ciYC44qv6o3wNs0LP0d4gj4D8x60mhTjINkD0
 pSvdkAkdvQsUCgMBjGUP2jgw/q4Tey5s8JD2UYIG3Ue/jEAt9YuNH0ZHOxvOx9gFBvvj
 ScfRTLkpDL1333uuwO0XrgdibJjJJ+cRW1Bw9QBZdNK7ExcoZKxNt1zwy3qjCAGTmowK
 S+3mC72oF4T9+CzzfbAkNvs9aYg8IAmRAFiN0b/aWa4Uuq3jmxgmETkxHRxzQFCmfRxR
 cT1A==
X-Gm-Message-State: ACrzQf0BjaJwzjiqFpV+nLlODqhD1yM82tyGZuo4bjvpl0bqISw9riaV
 ZsHy7n8ivbj53awlb+sLCSj2BQ==
X-Google-Smtp-Source: AMsMyM4Iupv6RRV4+DR7y2lHR/XVFBoo+AQoc5QCbh7W13suskqTvGGdHeCJAykX/uTzrpYO6+YJiQ==
X-Received: by 2002:a05:651c:1546:b0:26d:9459:1a69 with SMTP id
 y6-20020a05651c154600b0026d94591a69mr1277613ljp.209.1664457341196; 
 Thu, 29 Sep 2022 06:15:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b00499fe9ce5f2sm783555lfn.175.2022.09.29.06.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:15:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use
 pm_runtime_resume_and_get()"
Date: Thu, 29 Sep 2022 15:15:28 +0200
Message-Id: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

This reverts commit ddea4bbf287b6028eaa15a185d0693856956ecf2 ("ASoC:
wcd-mbhc-v2: use pm_runtime_resume_and_get()"), because it introduced
double runtime PM put if pm_runtime_get_sync() returns -EACCES:

  wcd934x-codec wcd934x-codec.3.auto: WCD934X Minor:0x1 Version:0x401
  wcd934x-codec wcd934x-codec.3.auto: Runtime PM usage count underflow!

The commit claimed no changes in functionality except dropping the
reference on -EACCESS.  This is exactly the change introducing bug
because function calls unconditionally pm_runtime_put_autosuspend() at
the end.

Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <stable@vger.kernel.org>
Fixes: ddea4bbf287b ("ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index b16a18dbfe7a..1911750f7445 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -714,11 +714,12 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 	struct snd_soc_component *component = mbhc->component;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(component->dev);
+	ret = pm_runtime_get_sync(component->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(component->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(component->dev);
 		return ret;
 	}
 
@@ -1096,11 +1097,12 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
 	component = mbhc->component;
 
-	ret = pm_runtime_resume_and_get(component->dev);
+	ret = pm_runtime_get_sync(component->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(component->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(component->dev);
 		return;
 	}
 	micbias_mv = wcd_mbhc_get_micbias(mbhc);
-- 
2.34.1

