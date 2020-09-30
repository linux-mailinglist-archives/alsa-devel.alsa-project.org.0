Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702427E164
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 08:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6591801;
	Wed, 30 Sep 2020 08:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6591801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601448108;
	bh=uqVyE24O0sGdmRrFAC8JxPUePZwObTJ1dSsMX6ofmlw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d1uk4AtY7vCf/LsETuIrk3Dv1pL4VtJp4n3GV0CIKkE+r5OHWOLXqtgzf+4YGonqj
	 FI52yvzZdNUO7KpMmVHHJHS5s7bTlt7gw+uYFGJXVViwjGHihw4qeZljcaBMjYW5rR
	 z7+I1Dzz2slF+t9rTWRrB3BAvJY/bxAdeFDlOIkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E7DF80228;
	Wed, 30 Sep 2020 08:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE991F801ED; Wed, 30 Sep 2020 08:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA2D5F800AB
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 08:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA2D5F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="M642QpOR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601447996; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wLH8zQ0NW7Ibp+2QyAKze5Jui0juOUuUFVPPoOCJrq8=;
 b=M642QpOR0aw2iT/PlxXhQMLukZcXkHVGK3rsS8T1BgcmekVF8smy0/GnCrO/7Q3dJRt4NCgc
 RCXKNSQI71NdVNusDteLmyFHjuLWZk2v+LMpAF4hvpvscGFNlDSkskaSltGgMUPYThFmzkXR
 CteBHdlQv9oCWJxkibJ0pQP+piM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f74283a3a7e097c8c565be4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 06:39:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 904ADC43382; Wed, 30 Sep 2020 06:39:54 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A143EC433CA;
 Wed, 30 Sep 2020 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A143EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] Qualcomm's lpass-hdmi ASoC driver to support audio
 over dp port
Date: Wed, 30 Sep 2020 12:09:30 +0530
Message-Id: <1601447977-18115-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
Asoc. It includes machine driver, cpu driver, platform driver updates for 
HDMI path support, device tree documention, lpass variant structure 
optimization and configuration changes.
These patches depends on the DP patch series
https://patchwork.kernel.org/project/dri-devel/list/?series=332029
https://lore.kernel.org/patchwork/project/lkml/list/?series=464856

changes since V7:
    -- Fixed typo errors
    -- Separated buffer size change patche
changes since V6:
    -- Removed compile time define flag, which used for enabling
     HDMI code, based on corresponding config param is included.
    -- Updated reg map alloc API with reg map bulk API.
    -- Removed unnecessary line splits
changes since V5:
    -- Removed unused struct regmap *map in lpass_platform_alloc_hdmidmactl_fields.
    -- DMA alloc and free API signature change in lpass-apq8016.c, lpass-ipq806x.c 
    -- Keeping API "irqreturn_t lpass_platform_hdmiif_irq" under ifdef macro
Changes Since v4:
    -- Updated with single compatible node for both I2S and HDMI.
Changes Since v3:
    -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
Changes Since v2:
    -- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
Changes Since v1:
    -- Commit messages are updated
    -- Addressed Rob Herring review comments

V Sujith Kumar Reddy (8):
  ASoC: Add sc7180-lpass binding header hdmi define
  ASoC: dt-bindings: Add dt binding for lpass hdmi
  Asoc:qcom:lpass-cpu:Update dts property read API
  Asoc: qcom: lpass:Update lpaif_dmactl members order
  ASoC: qcom: Add support for lpass hdmi driver
  Asoc: qcom: lpass-platform : Increase buffer size
  ASoC: qcom: sc7180: Add support for audio over DP

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 +++-
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |   4 +-
 sound/soc/qcom/lpass-cpu.c                         |  53 ++-
 sound/soc/qcom/lpass-hdmi.c                        | 470 +++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 122 ++++++
 sound/soc/qcom/lpass-ipq806x.c                     |   4 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  52 ++-
 sound/soc/qcom/lpass-platform.c                    | 403 ++++++++++++++----
 sound/soc/qcom/lpass-sc7180.c                      | 116 ++++-
 sound/soc/qcom/lpass.h                             | 119 +++++-
 13 files changed, 1280 insertions(+), 145 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

