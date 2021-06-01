Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44743396AFD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 04:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25DC1662;
	Tue,  1 Jun 2021 04:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25DC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622514188;
	bh=V+PPCh3d+/QxgvgrWTodyEMGTcG05QBoGPKuUQACq/w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KiVi5jljC5LLjDORvflBCi8zMg+JRQW6ZoeICi5TWN/+3FKNYcq5jpPjbclSk7OnF
	 lmsnDKyG4HyZeOad6qKAT5zX6+MHlSOOpDP5OMvHfnCRcAmz2Mm1T9jRViFUAxwbAN
	 OWDq5KAVaSmn6HdQkiZVRbMsI7HWBhIX0g38OGJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B43F8025B;
	Tue,  1 Jun 2021 04:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E734F80254; Tue,  1 Jun 2021 04:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A347BF80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 04:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A347BF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bMl5mgjY"
Received: by mail-pf1-x436.google.com with SMTP id z26so6229412pfj.5
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 19:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G7LsGLmMOn0RCf1NWPI0jTR/YPJV/uz3PsfA5w2kCWY=;
 b=bMl5mgjYlnR3D9xJOq0kwO1H6utjThPiRUDlo5uvzPZFjXhXXLqE838OmSKJLfNmIm
 H6f3yImB6nt/Hwd2V14xjPOomtM4mnElEV4CPs/KWAUnaimTw4O5D8OB0L9LMSuv4so0
 tpR2ZeuWcHTkGNNWNY4pEoRpepxBoJGEVS1a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G7LsGLmMOn0RCf1NWPI0jTR/YPJV/uz3PsfA5w2kCWY=;
 b=B8tMJGQF8H7jT2GrIknBP2RyO4i54UYxbx9Lv79rf9DUhXyM4C94odqaF/aG4P8Khg
 In15W/D7OHB8ZNH9ReFJXUCW+ULaJ50sttxNYJOOm2vx0YWYNFhbmux/Z5H8AIDpO2ZQ
 Xif/eSZZhqpIF546rQ+qeoTvqRulpyNelYolnrRC9qSSrMo7ex5lbiT4wznWbs8nKrsf
 9smD1T1Hz6EnBy0uijfJzRqkRGYPD6FVapb2IxuYTPXCdye4YKtL3Llb36RpOVplKU1/
 7gHFZDQkfLPkHw/ZKzyfSW3MV8gHdpcVvSgDExxC16xsQWRqAtZqUZc+jS7A1eFn/vYz
 5VPQ==
X-Gm-Message-State: AOAM531sQe5jW36U97yfBzeO9M/YUrpzmRwIkDG96VRt8284/awbYMwd
 58zMzWDa5rDFQUy7Vnwbn20CYw==
X-Google-Smtp-Source: ABdhPJxN7Qm65U09tF7lVMDcXuKIvj4QgVk52a65hbjIuF1Bt95TBlmlV2sQ3UN4lpyqHz7qrp9kVg==
X-Received: by 2002:a62:87cd:0:b029:2e9:a7c8:ad45 with SMTP id
 i196-20020a6287cd0000b02902e9a7c8ad45mr14001596pfe.8.1622514087296; 
 Mon, 31 May 2021 19:21:27 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f7e8:2d6:ddb7:af4e])
 by smtp.gmail.com with ESMTPSA id y205sm473797pfb.53.2021.05.31.19.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 19:21:26 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: add label for secondary mi2s
Date: Tue,  1 Jun 2021 10:21:17 +0800
Message-Id: <20210601022117.4071117-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Judy Hsiao <judyhsiao@chromium.org>
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

Adds label for MI2S secondary block to allow follower projects to override
for the four speaker support which uses I2S SD1 line on gpio52 pin.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..2027914a0bed 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -772,7 +772,7 @@ mi2s@0 {
 		qcom,capture-sd-lines = <0>;
 	};
 
-	mi2s@1 {
+	secondary_mi2s: mi2s@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

