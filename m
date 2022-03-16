Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882E4DB5E4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 17:19:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5AF163D;
	Wed, 16 Mar 2022 17:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5AF163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647447540;
	bh=u7YvbIJOw2RLQ9UZO8rr21mQP3qqd2QqUC1alynzebw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IfVKXlX5G/RLh5JtaBM+nuD0a6aqIFeGy4DdzILsoHrIrTNl+f0pTj5nMq9Has1Q/
	 utdtm5bfQCUK9i5GXX9Z/W0xPfGoNaFEYgbfq2ZnwtyjevCbSSnUiiL1rhj7dOO9Ok
	 VngoZVY+TacMiEG2AbRSTE8FkNQkClsKgQ/or/NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0104DF80240;
	Wed, 16 Mar 2022 17:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 603ABF80084; Wed, 16 Mar 2022 17:17:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D04CFF80084
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 17:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D04CFF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Xodg1bIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647447466; x=1678983466;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AVFaJFntyexxQhyOsQBteV8HyEDV0UX5Izwh1Qofwv4=;
 b=Xodg1bIXS3SG4haRcIToCrGdW3lNn4Mn3aGHcXninYKQ4SLGpuV/Zy3n
 xtLfYZGVRTrm49ijR3ZgOTuZhD9NBx80po4BE8chmCYYmtwxt6pH573O0
 Hrxv0Bj0YolanPHK1MryoNr0/Ff7CEvt9Od28g4W1v77iCJsPQDu/w5Ft M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 09:17:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:17:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 09:17:39 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 09:17:33 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v12 0/7] Add pin control support for lpass sc7280
Date: Wed, 16 Mar 2022 21:46:59 +0530
Message-ID: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

This patch series is to split lpass variant common pin control
functions and SoC specific functions and to add lpass sc7280 pincontrol support.
It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.

Changes Since V11:
    -- Add pinctrl_generic_remove_group in lpass lpi driver.
    -- Make proper error handling in lpass lpi driver.
Changes Since V10:
    -- Modify driver's custom functions with pin control framework generic functions.
    -- Update sm8250 and sc7280 pin control depedency list in Kconfig.
    -- Update commit description of few patches.
Changes Since V9:
    -- Add pinctrl groups macro to Kconfig.
Changes Since V8:
    -- Remove redundant headers included in v8.
Changes Since V7:
    -- Update optional clock voting with conditional check.
    -- Add const to lpi_pinctrl_variant_data structure.
    -- Update required headers and remove redundant.
    -- Change EXPORT_SYMBOL to EXPORT_SYMBOL_GPL
    -- Fix typo errors.
Changes Since V6:
    -- Update conditional clock voting to optional clock voting.
    -- Update Kconfig depends on field with select.
    -- Fix typo errors. 
Changes Since V5:
    -- Create new patch by updating macro name to lpi specific.
    -- Create new patch by updating lpi pin group structure with core group_desc structure.
    -- Fix typo errors.
    -- Sort macros in the make file and configuration file.
Changes Since V4:
    -- Update commit message and description of the chip specific extraction patch.
    -- Sort macros in kconfig and makefile.
    -- Update optional clock voting to conditional clock voting.
    -- Fix typo errors.
    -- Move to quicinc domain email id's.
Changes Since V3:
    -- Update separate Kconfig fields for sm8250 and sc7280.
    -- Update module license and description.
    -- Move static variables to corresponding .c files from header file.

Changes Since V2:
    -- Add new dt-bindings for sc7280 lpi driver.
    -- Make clock voting change as separate patch.
    -- Split existing pincontrol driver and make common functions 
       as part of separate file.
    -- Rename lpass pincontrol lpi dt-bindings to sm8250 specific dt-bindings
		
Changes Since V1:
    -- Make lpi pinctrl variant data structure as constant
    -- Add appropriate commit message
    -- Change signedoff by sequence.

Srinivasa Rao Mandadapu (7):
  dt-bindings: pinctrl: qcom: Update lpass lpi file name to SoC specific
  dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi pinctrl bindings
  pinctrl: qcom: Update macro name to LPI specific
  pinctrl: qcom: Update lpi pin group custiom functions with framework
    generic functions
  pinctrl: qcom: Extract chip specific LPASS LPI code
  pinctrl: qcom: Add SC7280 lpass pin configuration
  pinctrl: qcom: Update clock voting as optional

Tested this on SM8250 MTP with WSA and WCD codecs.
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

 .../bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml   | 133 ---------
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml     | 115 ++++++++
 .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 133 +++++++++
 drivers/pinctrl/qcom/Kconfig                       |  19 ++
 drivers/pinctrl/qcom/Makefile                      |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           | 309 +++------------------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  86 ++++++
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    | 168 +++++++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    | 164 +++++++++++
 9 files changed, 732 insertions(+), 397 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c

-- 
2.7.4

