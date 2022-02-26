Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5534C5481
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 08:47:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1101A9E;
	Sat, 26 Feb 2022 08:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1101A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645861636;
	bh=5yQ3QUiFwZtQ/JEaMD8OHf/bSauTnRQJ6v13y7Jfrag=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MAYIpoaDEibrOf+6A/pXDwJn2dpKxl/XHXXn8egohJ4AWFPm8ceik0repcGjkV1pg
	 +Cx0BBD/6tS3aVWFOx0cy1NCF5Jfd80JN24Wqjb8Qd4TXjm3kcHNETnSoPYi1Eks5R
	 OeYaG1X3JwbT1fOtD3u0DiWKk1d4takr78sdU8r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCB7CF800ED;
	Sat, 26 Feb 2022 08:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDE6EF80134; Sat, 26 Feb 2022 08:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4994F800ED
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 08:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4994F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="kzGi91qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645861565; x=1677397565;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DFvRIKD5w7KeN6PhWnYB9eQbok/0NQ0d3MZvSWvCwrM=;
 b=kzGi91qMyP4T30iFh+MJeiElawVSKerxio7fLs8R192X1V5tm68kU+d9
 TCkXYm1HjZrDZc5Vj0Ty70My7x3Y3WE7LQNx3REjRaULy1n/xIhk3IyzO
 cOkyT5YyznKV8cHBB6rll6dF5f36UUnho5SXMN0C+dLDatZrm6TiFVVJM 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Feb 2022 23:45:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 23:45:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 23:45:56 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 23:45:50 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [RESEND v4 0/2] Add power domains support for digital macro codecs
Date: Sat, 26 Feb 2022 13:15:29 +0530
Message-ID: <1645861531-13829-1-git-send-email-quic_srivasam@quicinc.com>
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

This patch set is to add power domains support for RX, TX and VA macros.

Changes since v3:
    -- Add dt-bindings support.
Changes since v2:
    -- Remove redundant local variable.
    -- Update pds error handling sequence.
    -- Update module description.
    -- Clean up pds init function.
    -- Remove redundant arguments.
Changes since v1:
    -- Add missing macros in Kconfig.

Srinivasa Rao Mandadapu (2):
  ASoC: codecs: Add power domains support in digital macro codecs
  ASoC: qcom: dt-bindings: Add bindings for power domains in lpass
    digital codecs

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  8 +++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  8 +++
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  8 +++
 sound/soc/codecs/Kconfig                           |  7 +++
 sound/soc/codecs/Makefile                          |  2 +
 sound/soc/codecs/lpass-macro-common.c              | 67 ++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h              | 17 ++++++
 sound/soc/codecs/lpass-rx-macro.c                  | 12 +++-
 sound/soc/codecs/lpass-tx-macro.c                  | 10 ++++
 sound/soc/codecs/lpass-va-macro.c                  | 12 ++++
 sound/soc/qcom/Kconfig                             |  1 +
 11 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/lpass-macro-common.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.h

-- 
2.7.4

