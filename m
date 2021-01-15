Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368762F711B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 04:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C40E16CC;
	Fri, 15 Jan 2021 04:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C40E16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610682333;
	bh=Pr5lrqThYJAKV8qLm/s3ikyhhGqHx2WwiwL5WcexZc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aY1hls2dhd5q7neqlnxqwi23zU5bZJigfMiesd1F8yj9FBI9QfmsW6xEi28o9ROmF
	 hrQjLfqc/L8TNplFLIbe9UEUFMLf3cOOnvOuoeAiJgyN3bVJ+JD8lXJ+VmDJC853QU
	 mjDjid7nnhts5eAPNHlmsxNFvxbF5dMHvpCfgBVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED26CF8026D;
	Fri, 15 Jan 2021 04:43:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B304F80134; Fri, 15 Jan 2021 04:43:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11019F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11019F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="V10CYWip"
Received: by mail-pj1-x102f.google.com with SMTP id u4so4419323pjn.4
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 19:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8+6id4FMr4SPdv6wqygG4dWXcEsMutT0RtJWURXdQKM=;
 b=V10CYWipJQsCu5sL5XCAnjC3haYwD730yz1qPpI8CgJA/+0ZkIm25SpKbytyd5Eues
 /mCJQ97o2xb//yPshh7FIhKnN/6FefBBvmjMuWS3znBhqntTqaRKY4SxNbssBdcPRa8k
 mqLwt1JqOao5miFB83brJrdPymg2cr/5n+HZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8+6id4FMr4SPdv6wqygG4dWXcEsMutT0RtJWURXdQKM=;
 b=QYtwS/K9Hc0NoqUnu+IIhFKen8fMYSEysf9Z8ebIyq5nvg+mBzuLbD2Qxs76LrpQv2
 PCFVm+jHvU5CEEtIWLTNF6WD6IRjZ8LZxg5IJRBi9uf970PWxuRgiqEHVUF5CKFLqX/7
 k3p3YAQ+VlYD2LA59fKdhzZHTtL9s9BLmUVqFljuc8+s6knY04H3Iej/zA6tcErCG5et
 k2YTKz8RwWDB6rhW7uSoyCrIx9m5D2rReySrbjvFMIdN0pi4RjttXXknqMNS/lI84JXo
 bSSgOTGJ3y1Mm7YzAEmzDPsBouNlzro0xHFW82SRGEJ1vBDJnYlUrXuxCwvEunZCi7/J
 UeEg==
X-Gm-Message-State: AOAM533Y9/izDx/YFAKjfLEgS8Xy1brxxuk/G0nMiVYJJZWjL2LfrbdS
 kL1VcGaiQR8bJrHn1fVTGW/yIA==
X-Google-Smtp-Source: ABdhPJxTXrQGI8wE/h1KySTvszP44FQVjSR+Shglh1Xb9Br5YOFlis8sa2Vln82nmraLneI8skEAWA==
X-Received: by 2002:a17:90b:e82:: with SMTP id
 fv2mr8325643pjb.164.1610682209502; 
 Thu, 14 Jan 2021 19:43:29 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:43:28 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: qcom: Minor code cleanups for lpass-cpu
Date: Thu, 14 Jan 2021 19:43:23 -0800
Message-Id: <20210115034327.617223-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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

Here's some minor code cleanups for the lpass-cpu driver. I noticed that
it casts away const from the driver data from DT. That's not great but
fixing it is a little more involved. I'll get to it later. There's also
some questionable clk_get() usage that should probably be
clk_get_optional(). For now this should help a little.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>

Stephen Boyd (4):
  ASoC: qcom: Remove useless debug print
  ASoC: qcom: Add some names to regmap configs
  ASoC: qcom: Stop casting away __iomem for error pointers
  ASoC: qcom: Remove duplicate error messages on ioremap

 sound/soc/qcom/lpass-cpu.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
https://chromeos.dev

