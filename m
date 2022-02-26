Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3B4C5750
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 19:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9E61899;
	Sat, 26 Feb 2022 19:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9E61899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645899059;
	bh=vWBDdWgd7e7hudPYeEQqHo2C84Fz1scy1ql/L17oXSI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=doMSVy62K/vbmHpN2QMmAVwY784m8ep1aZBSTpUoYdMeQPY9119+SOJS2mpByT/zf
	 BWAMKJpGa67CVC3XunKaOpoiO8xaWzuGxJXePIP3vbCAO+KChxuQxlTQzfPhmlLuY4
	 EKLWjyouRXYgsyFXqA9w8xqkNE4huniExI9x2Y7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AAC0F80134;
	Sat, 26 Feb 2022 19:09:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5767BF8012B; Sat, 26 Feb 2022 19:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5CCEF800B6
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 19:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5CCEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="tO62cZio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645898989; x=1677434989;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FQfWBCeIW1a+N9lwVV1LJBMV0dL7okPKEQ3y6MfBCYg=;
 b=tO62cZiowpRhldMeX/F1+1t4sumGGGb8qrwLAC7TUyGOX+gGNOgsPU8q
 vTD4aZlw7PYtu9RKNQUXXRwyZ5KVgcN/jh+32YGPgFB1Y5GKnBk8FebRd
 K2ELhp+42xx7nl+1uiCERNWpVphgS99wVW5E2VpPoe8fxtjb1yvPcAClH 0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Feb 2022 10:09:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2022 10:09:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 10:09:42 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 26 Feb 2022 10:09:37 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v5 0/2] Add power domains support for digital macro codecs
Date: Sat, 26 Feb 2022 23:39:17 +0530
Message-ID: <1645898959-11231-1-git-send-email-quic_srivasam@quicinc.com>
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

Changes since v4:
    -- Fix uninitialized variable return error
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
 sound/soc/codecs/lpass-rx-macro.c                  | 10 +++-
 sound/soc/codecs/lpass-tx-macro.c                  |  9 +++
 sound/soc/codecs/lpass-va-macro.c                  | 10 ++++
 sound/soc/qcom/Kconfig                             |  1 +
 11 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/lpass-macro-common.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.h

-- 
2.7.4

