Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31FD686913
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760FEDFA;
	Wed,  1 Feb 2023 15:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760FEDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263336;
	bh=qPSF7/vc/TcSlTWxuqcPV5UHfVvTf6+QFrEaCbWXSns=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sjsOU8AesAlHFkt+wmowMbUm2Y+iaPGR0thYgjd24IE0w473xvCsBmgdBeDesmCB9
	 NvqakjoCATs0LjF1Gz9weyNI3dc0hxTuNM1kwWdQt5fpLB6Shx2OFdzMd2fEEVim61
	 OV1DE1T7zUM3Hxr/zCv2nyYrNqDECnkx+kd3tn9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DDE2F80570;
	Wed,  1 Feb 2023 15:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBA73F80423; Wed,  1 Feb 2023 14:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BD9CF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BD9CF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=jiUbQGCW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259479; x=1706795479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5pZy22fgi/Cqs6/TrC4Ul5oC6fmyYexDIjImkw1GxWI=;
 b=jiUbQGCWF8w5aEbePmfWG4INcx4hexUO+0P9FGowXNHuKfoUhstHXyix
 vszXmGWfrygjoBfKcx2naRivEFFjVUm64dRDE+2KoeiLCM1WqDpTHbMOI
 c3W4ErEXeAVzwYzPF+Cyq9DZw9te5/qtUxEqMSTYsUN9nhzzQveXDKsXa I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 05:51:13 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:51:11 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:51:04 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 00/14] Add support for compress offload and gapless playback.
Date: Wed, 1 Feb 2023 19:19:33 +0530
Message-ID: <20230201134947.1638197-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:52:51 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for compress offload and gapless playback in audioreach
platform drivers.

Mohammad Rafi Shaik (14):
  ALSA: compress: Update compress set params for gapless playback
  ASoC: qcom: SC7280: audioreach: Add sc7280 hardware param fixup
    callback
  ASoC: q6dsp: audioreach: Add placeholder decoder for compress playback
  ASoC: q6dsp: audioreach: Add support for compress offload commands
  ASoC: q6dsp: audioreach: Add support to set compress params
  ASoC: q6dsp: audioreach: Add support for sending real module ID to
    ADSP
  ASoC: q6dsp: q6apm-dai: Add async compress write support
  ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress DAI and codec caps get callbacks
  ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress DAI callbacks
  ASoC: q6dsp: q6apm-dai: Add compress set params and metadata DAI
    callbacks
  ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks
  ASoC: qdsp6: audioreach: Add MP3, AAC and FLAC compress format support
  ASoC: q6dsp: audioreach: Add gapless feature support

 sound/core/compress_offload.c     |  12 +-
 sound/soc/qcom/qdsp6/audioreach.c | 299 +++++++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h |  56 ++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 464 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 117 ++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |   8 +
 sound/soc/qcom/sc7280.c           |  21 +-
 7 files changed, 950 insertions(+), 27 deletions(-)

-- 
2.25.1

