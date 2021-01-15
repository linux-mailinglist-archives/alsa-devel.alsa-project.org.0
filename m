Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FD2F711A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 04:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960AE16C2;
	Fri, 15 Jan 2021 04:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960AE16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610682322;
	bh=u9dOuYdYVUyirWatW8PDaH7kTefMFggYSVxu+A8MXRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXNAIYtAlupr4EzJ2UgxbirJJmxt5OKBCxk2V87Fc9SW6j9bdhw47lcL5TDQVqb1U
	 wA0YUmeP1LNtthpb2LBFBm+7QChkokACwNIyVUhQdxCO5slmUaJP+isVXm5yE5xFO+
	 m44lHY4PQsAqJl91NkBOen8ZSwNL/stsILTNzDjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CFBF80254;
	Fri, 15 Jan 2021 04:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D678F8029B; Fri, 15 Jan 2021 04:43:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B8F4F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8F4F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Xv/VoopI"
Received: by mail-pl1-x62b.google.com with SMTP id q4so4007202plr.7
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 19:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sEcGePAoFBMEH4d16WagZZsbSiItfDYhk9eQpSDkRIk=;
 b=Xv/VoopIlhpPDTaZXWhUJSubJ7194wHJiA+DPMiM6GrPvyQKoTT7oX52iV9fm+cLGO
 LEpTIEtuI+2XvvH7qPvgJAlLr3pJ8z/TDjomiVFipG1nTS7WP6Kz30rDrs7AoSBwz8dW
 U9NARIqZNqA9ZDZ7Fpk0dafYrQc3y5WRuAzVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sEcGePAoFBMEH4d16WagZZsbSiItfDYhk9eQpSDkRIk=;
 b=IhcCFn7YbJAEZzEqILAC4UJvpHL7zf3YaeB+IbkYnIHEqYZUJlRRsAmLdvJ6T3F50E
 UknN8qR07kTpy4e3NxP/zXeGWZmGWSz5SiZzxmgu7WqQ7mfZARWpUG+EFJcH0b4jicPi
 INw+ZFnZQ8fWpgXI+ZCU44SaR2ABw9WXssI8zFY8OuPoN6RYdCAszKdFsFS5LufLwUeG
 LYJR62r/H+c6hK5rHlMiQvzSHLeMeeWwXWpBcPFBqQsLhM0UT+VG3y5tro6X3E+Xx4OC
 p6C+g5W2i2AUe3g3P97ymL3t3MW1oazuJO7NP3bX5XjNn3uuKX/b0dskIk7h8cKZMAs3
 ycEw==
X-Gm-Message-State: AOAM532YRD1MefA59HQyM3nP77Evma2mpxx7Ht01bm8GVf1JGb9lx8oo
 BuMWfh7sP0KC4GoAl0FSpXpS2w==
X-Google-Smtp-Source: ABdhPJxDvp9I0x93wxUPOVxBAF5Bcl1BTk4Q2oKk5fQ95NoxiwvSrD7NXUc79TFu6VwSIU6d6PzViw==
X-Received: by 2002:a17:90a:cb84:: with SMTP id
 a4mr8599334pju.50.1610682212225; 
 Thu, 14 Jan 2021 19:43:32 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:43:31 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: qcom: Add some names to regmap configs
Date: Thu, 14 Jan 2021 19:43:25 -0800
Message-Id: <20210115034327.617223-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

This device can sometimes have multiple regmaps. Let's add a name so
that we can differentiate in debugfs more easily.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 8437ba31a306..40126202a4a3 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -474,6 +474,7 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 }
 
 static struct regmap_config lpass_cpu_regmap_config = {
+	.name = "lpass_cpu",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -674,6 +675,7 @@ static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 }
 
 static struct regmap_config lpass_hdmi_regmap_config = {
+	.name = "lpass_hdmi",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
https://chromeos.dev

