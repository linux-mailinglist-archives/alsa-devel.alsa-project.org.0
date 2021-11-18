Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1462455BE0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 13:50:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630B41832;
	Thu, 18 Nov 2021 13:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630B41832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637239820;
	bh=/NslAAIvl8dv8KoGE73AzrEs+KhWMNzOIu/vFDCXIpA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dUt8vO0qLLFahiwjNBd87jLDeH6EmbV5RksIYNiuMFui1Ym4w/NnQgEIc0oSUf9r5
	 emFeACjWGL3aP5MfiG9Nkt62ja9WNfEH12lvigzYQTthsPnmY25YJkNAZH3E2P6rs3
	 LaHDjYE7j+sb0cbcDkX5Xlovr6fhBGfrfXhUPpO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C14F9F802C4;
	Thu, 18 Nov 2021 13:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 562ADF80272; Thu, 18 Nov 2021 13:49:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 630F7F8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 13:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 630F7F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="B73qvhrw"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637239735; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/6NjAs9R9Ro7zWxt9z3NLZSF6WGCXEfxrkRVeyeZ1EE=;
 b=B73qvhrw9O+oJU0uiAmjUYzo6bOH9S7sipPGYj6Wre/OtjBRl7P946ylh+I6wLgtBtTAqeyM
 y3CDXAUsJuU/oefm0qvwEaAWKZmDB7h0fiGijkQt8Jkxlr95xeyRBPXHuQuFJTRcjNH25uLk
 2To4yEIst/XzxfqNwesX2r9/nNY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61964bb6638a2f4d6178c150 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 12:48:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E748C43618; Thu, 18 Nov 2021 12:48:53 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA612C4338F;
 Thu, 18 Nov 2021 12:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BA612C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v5 00/10] Add support for audio on SC7280 based targets
Date: Thu, 18 Nov 2021 18:18:24 +0530
Message-Id: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

This patch set is to add support for Audio over wcd codec,
digital mics, through digital codecs and without ADSP.
This patch set depends on:
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677

Changes Since V4:
    -- Remove unused variable in lpass-sc7280 platform driver.
Changes Since V3:
    -- Remove redundant power domain controls. As power domains can be configured from dtsi.
Changes Since V2:
    -- Split lpass sc7280 cpu driver patch and create regmap config patch.
    -- Create patches based on latest kernel tip.
    -- Add helper function to get dma control and lpaif handle.
    -- Remove unused variables.
Changes Since V1:
    -- Typo errors fix
    -- CPU driver readable/writable apis optimization.
    -- Add Missing config patch
    -- Add Common api for repeated dmactl initialization.

Srinivasa Rao Mandadapu (10):
  ASoC: qcom: Move lpass_pcm_data structure to lpass header
  ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
  ASoC: qcom: Add register definition for codec rddma and wrdma
  ASoC: qcom: Add lpass CPU driver for codec dma control
  ASoC: qcom: Add helper function to get dma control and lpaif handle
  ASoC: qcom: Add support for codec dma driver
  ASoC: qcom: Add regmap config support for codec dma driver
  ASoC: dt-bindings: Add SC7280 sound card bindings
  ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
  ASoC: qcom: SC7280: Update config for building codec dma drivers

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
 sound/soc/qcom/Kconfig                             |  13 +
 sound/soc/qcom/Makefile                            |   4 +
 sound/soc/qcom/common.c                            |  39 ++
 sound/soc/qcom/common.h                            |   1 +
 sound/soc/qcom/lpass-cdc-dma.c                     | 195 ++++++++
 sound/soc/qcom/lpass-cpu.c                         | 245 +++++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 103 ++++-
 sound/soc/qcom/lpass-platform.c                    | 513 ++++++++++++++++++---
 sound/soc/qcom/lpass-sc7280.c                      | 416 +++++++++++++++++
 sound/soc/qcom/lpass.h                             | 150 ++++++
 11 files changed, 1669 insertions(+), 79 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

