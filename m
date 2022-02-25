Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E974C42F5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 11:58:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788CB1904;
	Fri, 25 Feb 2022 11:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788CB1904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645786709;
	bh=9MmPXiwcoObQwIgkapRxtb3nFP+OQDV6YVzLa4KzGgA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jTG6r0nauXAsYV+0ue3jDkcCI3Yo0NkTIINzg3gqUvXjlD4+qv4vTAFq80xecVQCi
	 1yCSSqfmRvk7LGyxxb1xSU3cGHcDVdaD2uSw0X+RfvKg1UojEUW3SYG+Zp3ezd3TNg
	 JJvMt6aQR3x5H6SfeT6WEVl74yK2Kq53Z99cD+eI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F60CF804DF;
	Fri, 25 Feb 2022 11:57:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3226CF80271; Fri, 25 Feb 2022 11:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D915F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 11:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D915F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="VXOlsxyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645786645; x=1677322645;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1+Xm1lTvjDcjQeWCRcGMImwqejVQtiVVlRh1Kh69FV0=;
 b=VXOlsxyywMSWvZgKY8UREkMw5b6iPqBULYYx0hEcWXHASmNUzTC3MOZw
 uvVKwq8mma/lmCxkwX1r8pKkFpkdMKRt6XuSJX7of7QhbAsNyJEwvMn7A
 XsQq1Jl+d2z2b5VIwGBexf2CEiRnFsWueS2YMaV4ryw61hBRVLOqtKmkw E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Feb 2022 02:57:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 02:57:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 02:57:21 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 02:57:16 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v4 0/2] Add power domains support for digital macro codecs
Date: Fri, 25 Feb 2022 16:27:02 +0530
Message-ID: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
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
 sound/soc/codecs/lpass-rx-macro.c                  | 13 ++++-
 sound/soc/codecs/lpass-tx-macro.c                  | 10 ++++
 sound/soc/codecs/lpass-va-macro.c                  | 11 +++-
 sound/soc/qcom/Kconfig                             |  1 +
 11 files changed, 150 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/codecs/lpass-macro-common.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.h

-- 
2.7.4

