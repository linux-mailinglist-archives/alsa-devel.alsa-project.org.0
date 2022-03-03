Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE854CC002
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 15:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6096F1939;
	Thu,  3 Mar 2022 15:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6096F1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646317948;
	bh=IQwjbyBma7TD0vQ55GAK/z5CpkkYXUxg+ar6LzrOGxs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uaa/U2kow5L6MU53VaoTEJyenhaBU+Qj7bMwA+hmhY+RoWDjX5029C/cVCNx8xiuL
	 /hYZm+taFLS3hhRkKcKYtG0Is+YVt6y82wB6ZQ20dyCHtZnxFE0BSUGlYXsC5pMGj4
	 2IavejHcXuUE0hYPWy+YS5L9DdZbXoJY8dtozHKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A14F80166;
	Thu,  3 Mar 2022 15:31:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE05F80152; Thu,  3 Mar 2022 15:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F28ADF80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 15:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28ADF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="zO8nzmBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646317876; x=1677853876;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=q3nQUbvoUVhuvtL8hT3x3bxzCoG1VYLBMmyxslJbAcY=;
 b=zO8nzmBxprHz0rWlSpP1WqEr1ZjEPhRiGZ37CZlrhQW5uy7vDhRsML20
 /kMffVL4ti/Vlf7Y2jkEtTY/17F/kggaDy3CFGjdQLaOrS8Z226AH44Hy
 YtQLXKNpz56h/yGVVGazK88xOVjIrRneqA0cxdVOJwRGaGG7A2gti0umv w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2022 06:31:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:31:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:09 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 06:31:03 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <sanyog.r.kale@intel.com>, <vkoul@kernel.org>
Subject: [RESEND v7 0/2] Add support for SoundWire1.6 audio cgcr register
 control
Date: Thu, 3 Mar 2022 20:00:49 +0530
Message-ID: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
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

This patch series is to add v1.6.0 compatible name for qcom soundwire
driver and corresponding dt bindings.

Changes Since V6:
    -- Update commit message
    -- Update Example with reset control in dt bindings.
Changes Since V5:
    -- Constify static struct qcom_swrm_data global variables.
    -- Remove redundant swrm_v1_6_data variable.
Changes Since V4:
    -- Dropped audio cgcr control patch due to dependency on clock patches.
    -- Update dt-bindings as per new reset control properties.
Changes Since V3:
    -- Add v1.6.0 compatible name and soundwire data structure.
    -- Change macro define name properly.
    -- Update bindings for new property.
    -- Change commit message description.
    -- Change signedoff by sequence.
Changes since v2:
    -- Update error check after ioremap.
Changes since v1:
    -- Add const name to mask value.
Srinivasa Rao Mandadapu (2):
  soundwire: qcom: Add compatible name for v1.6.0
  dt-bindings: soundwire: qcom: Add bindings for audio clock reset
    control property

 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 14 ++++++++++++++
 drivers/soundwire/qcom.c                                 |  1 +
 2 files changed, 15 insertions(+)

-- 
2.7.4

