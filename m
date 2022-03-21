Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F764E22B7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 09:57:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC97E16E8;
	Mon, 21 Mar 2022 09:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC97E16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647853079;
	bh=UOJT9Lw4OKP2pZsX4wByJo3t6BW2xwAtYgQzOgLi6yk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a7ANAPmkt6A7smPov5eGxmfX2kC9HjXaq8M6TCh0lszjzd0bVr9Gx3BsAH2r6buwZ
	 kg998BARcJMEJjG0QhyX5FeD9n5+rKthAZh73T8iekhX5tM6rbBecpBWYUrRo76hcl
	 r6g9PVyXQgU9g+vNGwVKcIAYxQRnIC2gcU+YwVUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDECF801D8;
	Mon, 21 Mar 2022 09:56:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA41F80227; Mon, 21 Mar 2022 09:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE446F800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 09:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE446F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="LBgg822w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647853007; x=1679389007;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Z7frmisJ/HESWHDo487rDBWlj2TEuAbGN63MQhhGsNg=;
 b=LBgg822wxXJ6FuN+QJvNmdZIAorA4uXCsLpL0p7sYuvx/6Kv40fBtFgp
 c2lA2d2s9g2SDi3QEzsU9YFC+3LXHsiulaP5KnIgrY8/jXz+n1QFRJG5W
 XSXesaXQRGEetXk7yjAaPko01KqWHGaXcOdZ3cXHfUnlwaprq+MXUDwhZ Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Mar 2022 01:56:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:56:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:39 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 01:56:35 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
 <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rohitkr@codeaurora.org>, <srinivas.kandagatla@linaro.org>,
 <dianders@chromium.org>, <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <alsa-devel@alsa-project.org>, <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 0/3] Update dt-bindings for sc7280 platform
Date: Mon, 21 Mar 2022 14:26:18 +0530
Message-ID: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
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

This patch set is to update required clocks, power domain names for sc7280 platforms,
and add mic bias supply for wcd938x codec.

Srinivasa Rao Mandadapu (3):
  ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital
    codes
  ASoC: dt-bindings: wcd938x: Add mic bias supply property
  ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for
    sc7280 platform

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml       | 17 ++++++++++++++---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++------
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 17 +++++++++++------
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 11 +++++++----
 .../devicetree/bindings/sound/qcom,wcd938x.yaml         |  3 +++
 5 files changed, 46 insertions(+), 19 deletions(-)

-- 
2.7.4

