Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC244C2FE6
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4D5172B;
	Thu, 24 Feb 2022 16:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4D5172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645716925;
	bh=VaHh8yVxnNwjusUmzHdYQ2tp8ERIO/nj7DkjaUAclWg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ea5MgofCBFCFCv3yfmUlxcVVBlpZrTWyR5728Hb1W3JRDlCcFVLLA8lxngWWrzBOZ
	 1Deaa2CnpiO6woMYLrDKD/myAdpG3TwDXcfiqSQ7tbUADhP4MHRROAZp8AEQtbXZLu
	 zlg2cXFWUQ0AP9UpYNpY5b0e3BQxLX1ftzm8gFjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A49F80310;
	Thu, 24 Feb 2022 16:34:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C272CF8030F; Thu, 24 Feb 2022 16:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AA99F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AA99F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="xGCMvtOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645716853; x=1677252853;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=EpIXWae+G9lfElx7qaQlLyXt/zO4Kstfz079ACqe7Ik=;
 b=xGCMvtOFTc7Vu9N96IzrF9+OmEtlovxazpO2J5xJw0G0aVvNqQsJ7j9U
 W+7I8LhLecy6/QdtWBe3EIdKVwdY0ucOQprjpYigS7buqobSLCRYNaTZ1
 DqzFTSYeTDq7lSQdHTeFncpM2R3WA6P9tZApPLnL0qpy8z/aHa2xGfhWf I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Feb 2022 07:34:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:34:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 07:34:06 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 07:34:01 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v16 0/9] Add support for audio on SC7280 based targets
Date: Thu, 24 Feb 2022 21:03:39 +0530
Message-ID: <1645716828-15305-1-git-send-email-quic_srivasam@quicinc.com>
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

Changes Since V15:
    -- Bisect patches to avoid build failure in other architectures.
    -- Remove redundant variables lpass variant structure.
Changes Since V14:
    -- Split common wrapper function to separate wrapper for each handle in platform driver.
    -- Update cdc dma buffer handling with memremap with ioremap.    
    -- Remove redundant error prints.
    -- Update irq flag.
Changes Since V13:
    -- Change bulk cdc clock voting to individual clock voting.
    -- Remove redundant code, conditional check and prints.
    -- Fix typo errors.
Changes Since V12:
    -- Fix arguments type mismatch.
Changes Since V11:
    -- Fix kernel robot issue on arguments type mismatch.
Changes Since V10:
    -- Split bulk clock voting to individual clock voting as per use case in cdc-dma driver.
    -- Add missing codec dma clocks.
    -- Update rxtx lpm buffer size.
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
Srinivasa Rao Mandadapu (9):
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
 sound/soc/qcom/lpass-cdc-dma.c                     | 301 ++++++++++
 sound/soc/qcom/lpass-cpu.c                         | 253 ++++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 127 ++++-
 sound/soc/qcom/lpass-platform.c                    | 628 ++++++++++++++++++---
 sound/soc/qcom/lpass-sc7280.c                      | 438 ++++++++++++++
 sound/soc/qcom/lpass.h                             | 141 +++++
 9 files changed, 1890 insertions(+), 88 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
2.7.4

