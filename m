Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04205E404
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D667169F;
	Wed,  3 Jul 2019 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D667169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562157163;
	bh=S1HDl7ncPFWOxsc5cdGclrYlvVVwo6ZGRW/xoIOlKjI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ITFPi6WGB9kOwOLk05FInTqUUzPxiOh/4KWHddsBVg5DVjm8Te8fSJ90NYNHT9e4o
	 gNZ/SHdh3IEkW3/I+EY8AJ59kuGxiqgCOmGsU93BgpM2ZN14rlonk+2i3LvYonowhk
	 Ovo75HqAzAx+OSUezkSVHsku7cl4hwm8XZv7b6B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD0CFF800F3;
	Wed,  3 Jul 2019 14:31:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78329F800F2; Wed,  3 Jul 2019 14:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F42EF80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F42EF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mhe4l/yr"
Received: by mail-wm1-x343.google.com with SMTP id 207so2032501wma.1
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AxglDiX94WPnqXrSEk1SzCIMDeBwY3y0/Nzs/gI/ip8=;
 b=mhe4l/yr2qFmPayuD04uWKlBfiLSA0wH0f75/+TGlp3xuAPaSkQfI2NbXMuMwkfjzx
 Mn2S5X9Ntk8SBRnPLmGd8w+509wQprHcXDqLneSqMpjOTj+P/L+eRgzm5G4AI8/FVO3U
 t+R3RaALCYUQtXs0cYhI9CrVbDVduS5nSmvnsO1oXJH5jRp5QylGh46POBF4E1CH5qrg
 SXD0bqJ1hyzCQbkgelVNJv91sf3ulGqnPyj12D4mrU5FEzqCJ139thNs0ezi29pXvelX
 Ekz4SD0DMZWOGh8mpQoKQ4E6jh9tIx15ar6z56q8AiCZzLUo+XuUXKI6MOq4QbTWFr0T
 c+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AxglDiX94WPnqXrSEk1SzCIMDeBwY3y0/Nzs/gI/ip8=;
 b=Zki0k6fwRj4ZDYEDb4HzlZ8KlYNdcGGXm0Cugez7jFoXuOjLTvMQENJF4RETIzNpls
 kMIQLKu+Fqc/0N6bYyTZGs2a8j2+eFK26ZjF6uK1soTUvq3TFqtdOkNSWHfdw5doeFDe
 4iMxEKpYDs+vtisux0n4uFJ1BYRWpaeliLKcgy0mBz1Ln78PELNGK4PSdIUF2l225ynk
 XQgCeqx09CY/IrjrP4l8RMqGC6I37d7xI9wfLNgCAk2W2T82cAZSCDf+xPfKs7XhFA4K
 Vn9dIAKkV313tcZdKioC2hO8XZsv7JSnHYYDCXPIdfwktsj++vE0EMKLK8WYZzt4lDnj
 RdOQ==
X-Gm-Message-State: APjAAAVUTqlgLFjZgWGdybuDEDpppmqu2EqNFCgyKjVn7782xhcv9ODR
 CqGPnkXwqNg/ojyOkshnLe/qEQ==
X-Google-Smtp-Source: APXvYqwwWXry4L3Lb+fx8ZBdyzsFkxixQSnGfQZ/xSNtA95SIiFOnqWAblqcHWZesNoklYE6ka/iyg==
X-Received: by 2002:a1c:7414:: with SMTP id p20mr7649872wmc.145.1562157069363; 
 Wed, 03 Jul 2019 05:31:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id j7sm3017079wru.54.2019.07.03.05.31.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:31:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  3 Jul 2019 13:31:02 +0100
Message-Id: <20190703123102.12626-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: qdsp6: q6afe-dai: Add missing Slimbus0
	audio route
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

For some reason SLIMBus RX0 playback is not added to audio routes.
This patch adds the missing route.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index dc645ba4d8d0..c1a7624eaf17 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -447,6 +447,7 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"HDMI Playback", NULL, "HDMI_RX"},
 	{"Display Port Playback", NULL, "DISPLAY_PORT_RX"},
+	{"Slimbus Playback", NULL, "SLIMBUS_0_RX"},
 	{"Slimbus1 Playback", NULL, "SLIMBUS_1_RX"},
 	{"Slimbus2 Playback", NULL, "SLIMBUS_2_RX"},
 	{"Slimbus3 Playback", NULL, "SLIMBUS_3_RX"},
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
