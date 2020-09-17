Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCA26DCF3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFB01658;
	Thu, 17 Sep 2020 15:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFB01658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600349965;
	bh=GjwX9CyO9LcVg7GLrWrhtp3ISPdAaxlOvarpQYH7A/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GkFxAG98pvd0tPmxgnF5TnqjfdOBI/kdkrFj5rrkN5j8Jb31axs4TNDCy/qATGS9N
	 Mhass8Yu30oGKht0fjsLJnYwI3WJ6Xdwhk7DyrTXoPBsKV2zxHUCfABLUVprNkeIvf
	 HbXUTytJQKAYRVmC4uXcmw9ZsorDTshrS2+bX2Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C11F8025E;
	Thu, 17 Sep 2020 15:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AA3BF80212; Thu, 17 Sep 2020 15:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2944BF80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2944BF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="r6VerNAG"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600349852; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cPHkj+a/0Rl2xRJ1IzjV1BjMb2iMw5KcPWUXja2H2B8=;
 b=r6VerNAGeXCAHqFpe3ulgcoKcV61Y7W8ZAGw4/wpsUFjhZm3VYQhxOoAHLeCRuh6QXK0jjWQ
 DaSBuF5Tqvr10EnBZ3IcmOGUCPmHiWevMkjI7ObM/XcSoZaFReHEJiHNFwq3hNXyJKaq0YtS
 xoKEIQ9zSf1ksQUNnaaQ4Xq8tms=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f63669aea858627d5f66b0d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 13:37:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 65486C433CA; Thu, 17 Sep 2020 13:37:30 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FB9DC433F0;
 Thu, 17 Sep 2020 13:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FB9DC433F0
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
Subject: [PATCH v5 0/5] Qualcomm's lpass-hdmi ASoC driver to support audio
 over dp port
Date: Thu, 17 Sep 2020 19:07:03 +0530
Message-Id: <1600349828-10727-1-git-send-email-srivasam@codeaurora.org>
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

These patches are to support audio over DP port on Qualcomm's SC7180 LPASS Asoc.
It includes machine driver, cpu driver, platform driver updates for HDMI path support, 
device tree documention, lpass variant structure optimization and configuration changes.
These patches depends on the DP patch series 
https://patchwork.kernel.org/project/dri-devel/list/?series=332029
Changes Since v4:
    -- Updated with single compatible node for both I2S and HDMI.
Changes Since v3:
    -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
Changes Since v2:
	-- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
Changes Since v1:
	-- Commit messages are updated
	-- Addressed Rob Herring review comments

V Sujith Kumar Reddy (5):
  ASoC: Add sc7180-lpass binding header hdmi define
  ASoC: dt-bindings: Add dt binding for lpass hdmi
  Asoc:qcom:lpass-cpu:Update dts property read API
  ASoC: qcom: Add support for lpass hdmi driver
  ASoC: qcom: sc7180: Add support for audio over DP

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++-
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-cpu.c                         |  39 +-
 sound/soc/qcom/lpass-hdmi.c                        | 596 +++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 129 +++++
 sound/soc/qcom/lpass-lpaif-reg.h                   |  52 +-
 sound/soc/qcom/lpass-platform.c                    | 468 ++++++++++++----
 sound/soc/qcom/lpass-sc7180.c                      | 116 +++-
 sound/soc/qcom/lpass.h                             | 119 +++-
 11 files changed, 1447 insertions(+), 154 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

