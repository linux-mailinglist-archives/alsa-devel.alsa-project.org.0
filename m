Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377C41EBC1
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195A716DF;
	Fri,  1 Oct 2021 13:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195A716DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633087432;
	bh=ktxw1hK8HhByRr+fwMDncTnT4x05peAC9fJM+566ptY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=epuVo5SDPJH2RtOJE9Mnl946xqxIPcbcYjJJTr5U6EaQIdPwhj3FDFmFe0egiAEmW
	 sBZWYaZfgyKSpy+tHWXdFkA/foyCP7wvtphvKMi+BttpIUUpDyW9Hq7mjrWvHqrUPm
	 DhAUqM0wpzxVum+C+nx+xxVKS48W74qbGPMisXQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4684F800F3;
	Fri,  1 Oct 2021 13:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA90F80227; Fri,  1 Oct 2021 13:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79409F801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79409F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="oM60a6Tg"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633087328; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DzBh2hJ0M5AMbOUMKQznzdQSW6wxpS0FzHXDuo4qPaM=;
 b=oM60a6Tg7bBSkoRDFTBgBaL1p+Cud8bxjLPEv8NRKBxu6uRjMi5yDHI8rwUXbAopvkZrB+PZ
 joINysnBb/BtBSSoB+Z8Lxl+WRWPoDcu01b1EE1Y9Bf6y/MFYV6EBdvS/fQMbFfxQHyQFvgo
 R1ZVev5toBgSDf/DDH9sBG2CaaA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6156ef4ea5a9bab6e84c7466 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:21:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08C53C4360D; Fri,  1 Oct 2021 11:21:49 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BCF81C4338F;
 Fri,  1 Oct 2021 11:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BCF81C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 0/8] Add support for audio on SC7280 based targets 
Date: Fri,  1 Oct 2021 16:51:24 +0530
Message-Id: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
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

This patch set is to add support for Audio over wcd codec,
digital mics, through digital codecs and without ADSP.
This patch set depends on:
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=549577
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=548765
	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=543829

Srinivasa Rao Mandadapu (8):
  ASoC: qcom: Move lpass_pcm_data structure to lpass header
  ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
  ASoC: qcom: Add register definition for codec rddma and wrdma
  ASoC: qcom: Add lapss CPU driver for codec dma control
  ASoC: qcom: Add support for codec dma driver
  ASoC: dt-bindings: Add SC7280 sound card bindings
  ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
  ASoc: qcom: lpass: Add suspend and resume for sc7280 platform

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
 sound/soc/qcom/lpass-cdc-dma.c                     | 263 +++++++++
 sound/soc/qcom/lpass-cpu.c                         | 334 +++++++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 103 +++-
 sound/soc/qcom/lpass-platform.c                    | 504 +++++++++++++++--
 sound/soc/qcom/lpass-sc7280.c                      | 602 +++++++++++++++++++++
 sound/soc/qcom/lpass.h                             | 156 ++++++
 7 files changed, 1974 insertions(+), 57 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

