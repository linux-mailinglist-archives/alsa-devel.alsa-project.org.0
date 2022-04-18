Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A85051AC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 14:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8FAA15E0;
	Mon, 18 Apr 2022 14:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8FAA15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650285524;
	bh=FAMC/2VYyDVZoTkuWPCq8kqYCMSX+0+Lx4wcBfFSQD0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gNe/B7bipV3QjUBuWzCJTQWB9zkE5J4fvm0dCZMqZcuIzjM0ColgVN9FFnTprwGcK
	 vpOhlt/ZMi4k83oxjGwcqlv/AY6l+E8f6x3k9T8CevwLutV/D166/j+YgszbXaa2fC
	 ovk/oyHyuXwoeRVWfmIqP7LfGrEMJuaOCMYesB2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F05CFF8012A;
	Mon, 18 Apr 2022 14:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12BC2F8014E; Mon, 18 Apr 2022 14:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F238F800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 14:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F238F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="nYpqc+Vx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650285459; x=1681821459;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1x4VyMPXIHgTtdoHhJRhQIKdvxvswuRWwu2tUv+TvXk=;
 b=nYpqc+VxGUgzxu3yRnZsyncZQspJMROPhdWEniOAbkgZna4mQHBQnKjq
 uD+Ka2Mr0acRi9R5lJY7M9PZfIrxOfMR2qPUyv9Tpb/igcokwFCT7GMMp
 tJQD6M3/brvkmSxzhVgzAf478HZxb/ZJ39P13L+Cnc6+8vuPg15vxMaqz 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 18 Apr 2022 05:37:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 05:37:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 05:37:34 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 05:37:27 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v13 0/7] Add pin control support for lpass sc7280
Date: Mon, 18 Apr 2022 18:07:00 +0530
Message-ID: <1650285427-19752-1-git-send-email-quic_srivasam@quicinc.com>
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

This patch series is to split lpass variant common pin control
functions and SoC specific functions and to add lpass sc7280 pincontrol support.
It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.

Changes Since V12:
    -- Remove redundant comments in sc7280 and sm8250 lpass lpi drivers.
    -- Rebased on top of latest kernel tip.
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
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    | 167 +++++++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    | 163 +++++++++++
 9 files changed, 730 insertions(+), 397 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c

-- 
2.7.4

