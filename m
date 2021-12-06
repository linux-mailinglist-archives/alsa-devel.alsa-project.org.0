Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6946A254
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAA1215A;
	Mon,  6 Dec 2021 18:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAA1215A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638810479;
	bh=dXtNaYbZL7AX9MGvEI7aQ1DsACf/GwcgEp4EQX6sTwY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iUl+x3Q6FKKV1SGgCczcJXBnegzbRwWlATsbmGzC797XDQa6b4IZZOhV651EOalYV
	 Y/juwy9TPMRgBYlTFUcVPw87hbAFZOoW9vil1rdABOR8ZEFd3MXNxljioLysQ6YX6H
	 hPWL0rZ6PW7CkQuhuAvWRIwicmmAXkePf1qJYk2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBABF8053B;
	Mon,  6 Dec 2021 18:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CE6DF804EC; Mon,  6 Dec 2021 15:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73EC8F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 15:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73EC8F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="kZDJ/5pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638800594; x=1670336594;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=oMjq8zFrglbyjH+zylWx61MB+80sU/3TxTg+wGA9w1M=;
 b=kZDJ/5pg4HM6QEV7e+mf/KdvzqgxU585gQF5YWJxX6SQ4KF8kjASmt7H
 R06s0/cn3PYM0qD0eQlMaF++Yv3fYTNRBPF1GpE89hKVOgQJO2MJPUlQJ
 sXr/ZeXC83BcRAgwrCipH7rhr6h7n1AnA5+IJqC0L8RKakF5JCtjoX/hp E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Dec 2021 06:23:08 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 06:23:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 6 Dec 2021 06:23:07 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 6 Dec 2021 06:23:01 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [RESEND, v9 00/10] Add support for audio on SC7280 based targets
Date: Mon, 6 Dec 2021 19:52:37 +0530
Message-ID: <1638800567-27222-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Mon, 06 Dec 2021 18:03:29 +0100
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
 sound/soc/qcom/lpass-sc7280.c                      | 441 +++++++++++++++
 sound/soc/qcom/lpass.h                             | 162 ++++++
 9 files changed, 1869 insertions(+), 87 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
2.7.4

