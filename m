Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115DD4749AF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C80A2039;
	Tue, 14 Dec 2021 18:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C80A2039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503474;
	bh=QVSD3n4WULfUL6JPPUWfpATL7P6ZvqjTiDX7XlxAOsY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KIzIaa3aFqZlXY/S/KTYKBjTJHO51bkDEYE6d5oOoBYbfTvHZLJydGrNplSuBEu+0
	 gFm4lQoPson1eYdIAaJ9CA3KdIAIe4jGMc+oaMyc/3ZD9x/DnijG8P9gl8qjWA3tpW
	 QbjoTXEx2M57agH+DzK6VER+aK/m9jGMXXQASSTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B264CF80246;
	Tue, 14 Dec 2021 18:37:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A909FF801EC; Tue, 14 Dec 2021 18:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB108F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB108F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="N3JhLC1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639503418; x=1671039418;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DToLEAgZqI9uH8mhqKXeXE1UzwNPhIaJIafCfGPsJYs=;
 b=N3JhLC1YCMaPwS3hftRDsS2B79DCU7ycWA4CfSv1xlB+jUaue0JTUCDV
 bUAYEakTxqQJCGjVMBBOf90Vb/ufg/ATcP6DBm1YobR06TTlaHNAxuw5z
 PQeZEvaT1Fr1rWXFThYflvWUwet6RMM7Op6uf/9LEE8LsBBfSAg6i2Eai 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Dec 2021 09:36:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:36:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:36:53 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 09:36:48 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v10 00/10] Add support for audio on SC7280 based targets
Date: Tue, 14 Dec 2021 23:06:21 +0530
Message-ID: <1639503391-10715-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Changes Since V9:
    -- Change individual clock voting to bulk clock voting of lpass-sc7280 platform driver.
    -- Remove redundant clocks in lpass variant structure.
    -- Add mclk for MI2S based headset path.
    -- Remove unused lpass variant structure members in lpass header.
Changes Since V8:
    -- Fix errors in sc7280 lpass cpu dt-bindings.
    -- Move to quicinc domain email id's.
Changes Since V7:
    -- Fix indentation errors.
    -- Bisect patches to avoid interdependency.
Changes Since V6:
    -- Split cdc dma regmap config macros.
    -- Add write dma reg fields for i2s path.
    -- Add helper function to distinguish rxtx and va dma ports.
    -- Optimizing clock and reg name in cpu dt-bindings.
    -- Update buffer management for cdc dma path.
    -- Remove Kconfig fields of machine driver.
Changes Since V5:
    -- Include MI2S primary node to snd_soc_dai_driver in lpass-sc7280 platform driver.
    -- Move dependency patch list to corresponding patch.
    -- Add support for missing cdc-dma ports.
    -- Change if/else conditional statements to switch cases.
    -- Add missing error handlings.
    -- Typo errors fix.
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
  ASoC: qcom: SC7280: Update config for building codec dma drivers
  ASoC: qcom: Move lpass_pcm_data structure to lpass header
  ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
  ASoC: qcom: Add helper function to get dma control and lpaif handle
  ASoC: qcom: Add register definition for codec rddma and wrdma
  ASoC: qcom: Add regmap config support for codec dma driver
  ASoC: qcom: Add support for codec dma driver
  ASoC: qcom: Add lpass CPU driver for codec dma control
  ASoC: dt-bindings: Add SC7280 lpass cpu bindings
  ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  75 ++-
 sound/soc/qcom/Kconfig                             |  11 +
 sound/soc/qcom/Makefile                            |   4 +
 sound/soc/qcom/lpass-cdc-dma.c                     | 275 +++++++++
 sound/soc/qcom/lpass-cpu.c                         | 244 +++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 127 ++++-
 sound/soc/qcom/lpass-platform.c                    | 617 ++++++++++++++++++---
 sound/soc/qcom/lpass-sc7280.c                      | 445 +++++++++++++++
 sound/soc/qcom/lpass.h                             | 145 +++++
 9 files changed, 1856 insertions(+), 87 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
2.7.4

