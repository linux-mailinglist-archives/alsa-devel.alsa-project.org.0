Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC15826FF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 14:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56B69FA;
	Wed, 27 Jul 2022 14:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56B69FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658926146;
	bh=RIaQDJvZO/AMVboYMKhm+UG93mkw7vRPU1RCUOd36aU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GNqQGMVoxuYeMHg7VBegLxdBCAQqE8ClcRBYD+238k5K7/id/My8Rt5kfWCvsDAju
	 GlRMXoGaatnuKeNCcm+tkhyACYnc9Cvj43oAUC3GJ203WXzHQ7MUPjtjlBymmc2C5H
	 7oSOJBm+0aD/IfP/yHXuUjaMuUh6ECvIO4k3NTiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C4FCF80171;
	Wed, 27 Jul 2022 14:48:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8B5F80171; Wed, 27 Jul 2022 14:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD60F800C9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 14:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD60F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ASvzG8Go"
Received: by mail-wr1-x430.google.com with SMTP id bn9so13127629wrb.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbIXmqIjdkMi2JSciZ0bPMUrJ9m41pWmErdo7Yp7XLI=;
 b=ASvzG8Gogpot3oN8wT5STKfQTyFMb/mSVeq6Q5nSqyg5mfmI6rJMduP+YYpYKgdRFk
 Jc0adbLOucoOl90q+2gOcollCJYDz2Ii3cSbRW5FIiAhj2rIg+QLU3p/NrOvD2UlsOUm
 mcEHMZj4ZLuOab+BeDzbbeeHUHJKZ/n3bCL8kG03mb9MaYTdTtRrEUcrkPcXKv5CH6fg
 mkzDlRfO/ZyKypfvjvL9OX+PYD9PKcOGCAbaVr0/1YxzTzkjy2ViLV02dZWigtIVqABP
 kFvI7p9UFFatzuk0XpqA3urAJKKhUXHmR3Y6SzM58/SdrKJoHqVOrgGCOdFQexIY774j
 Sjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbIXmqIjdkMi2JSciZ0bPMUrJ9m41pWmErdo7Yp7XLI=;
 b=z3ckOReLI7ZnTQIPoe0yQF/fHjrtMBM53vxdWt3HiJWs07UIVKWTLIF9PF5H9WmohN
 8ZsMjg5E5pQxk79XcYErObAE78wB63iHx0ImrM8AkMLvYcyb6QIgHWfndPJXdZRboK/h
 KrA58GPNxDFjj3QxL3C7NLLJMhqfNf8BQhHYZLlxpRGeRpiDjqJ/sOSX1mAw2/mEd4bo
 5yPXVy4t2473gO4QAhzirzAYd+BwajA3dfAH7dohnEUqMxHiAD59CE3Negj/mc3lKcEj
 ROsolS+pu7i8HHieEiApaeVbhd1SxrcLh+mH1W5Id+ETrXOYDVc7h721QyxudXDZZ595
 /xVA==
X-Gm-Message-State: AJIora/zA8y65hcf3frC4S/5MHJMoXq4E7QUPeDwnT3MBkbu8RAaJ6Go
 BN1XW+OgYB8CJcXhbmotvo8+bg==
X-Google-Smtp-Source: AGRyM1s64lTTZ728IL9ytTtfwVIyDnGmVDjh6LGF9RFAtf7d7cwiHHV6yYwE/uUmhVFkFnJ24zoCxA==
X-Received: by 2002:a5d:58c9:0:b0:21d:9374:1373 with SMTP id
 o9-20020a5d58c9000000b0021d93741373mr13987359wrf.20.1658926074695; 
 Wed, 27 Jul 2022 05:47:54 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n40-20020a05600c3ba800b003a2ed2a40e4sm2459559wms.17.2022.07.27.05.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 05:47:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: va-macro: use fsgen as clock
Date: Wed, 27 Jul 2022 13:47:49 +0100
Message-Id: <20220727124749.4604-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

VA Macro fsgen clock is supplied to other LPASS Macros using proper
clock apis, however the internal user uses the registers directly without
clk apis. This approch has race condition where in external users of
the clock might cut the clock while VA macro is actively using this.

Moving the internal usage to clk apis would provide a proper refcounting
and avoid such race conditions.

This issue was noticed while headset was pulled out while recording is
in progress and shifting record patch to DMIC.

Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index d18b56e60433..1ea10dc70748 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -199,6 +199,7 @@ struct va_macro {
 	struct clk *mclk;
 	struct clk *macro;
 	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 	struct lpass_macro *pds;
 
@@ -467,9 +468,9 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		return va_macro_mclk_enable(va, true);
+		return clk_prepare_enable(va->fsgen);
 	case SND_SOC_DAPM_POST_PMD:
-		return va_macro_mclk_enable(va, false);
+		clk_disable_unprepare(va->fsgen);
 	}
 
 	return 0;
@@ -1473,6 +1474,12 @@ static int va_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	va->fsgen = clk_hw_get_clk(&va->hw, "fsgen");
+	if (IS_ERR(va->fsgen)) {
+		ret = PTR_ERR(va->fsgen);
+		goto err_clkout;
+	}
+
 	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
-- 
2.25.1

