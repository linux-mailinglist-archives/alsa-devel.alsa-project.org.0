Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0CE4382D5
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 11:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8144F1664;
	Sat, 23 Oct 2021 11:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8144F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634982948;
	bh=G/rT9t4eWDcd1L5f9YsLWKxAq/nuK4msZGsxxDoTcIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9y29yLRdNdPTcwqNH9cZDXqz+mE9KTfC+abGJU/oraYAGSpuBk+tZRxwxZcKwsRJ
	 xh3lGkcJ71OmZD5aW1islxmNodZEf4RkGB+yT5nHa78PrNbdg2AtbymaKAPKQsAnEP
	 tcWuEQfrSK0XGsu80Xh+OFcJnmpx3pYk1P61WwVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55F8F80246;
	Sat, 23 Oct 2021 11:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881C9F80240; Sat, 23 Oct 2021 11:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55513F8010B
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 11:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55513F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Dsj6DkfJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634982864; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=C32ao50Oq7HoU0we0KKmIdCM4y3jX8SMjgIkGusdI1U=;
 b=Dsj6DkfJMJD/agNMuCVCXfSVRKVMEOZWegnT5KGjgn0lEkaD37/jTbvnyDPtb4MYKv+HOoj7
 Np36qN9wQxjVwZvgnuJaD8DQBctNEl/a++mGwIGIeKRjMz/EA9GUo/8pDsxgPezzO+szzP9/
 WyKNHuU4/SbV1Eb5EEp/mEBDlqQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6173dbcbb03398c06c983db6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 09:54:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A911C43616; Sat, 23 Oct 2021 09:54:18 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A7F0AC43460;
 Sat, 23 Oct 2021 09:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A7F0AC43460
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
Subject: [PATCH v3 00/10] Add support for audio on SC7280 based targets
Date: Sat, 23 Oct 2021 15:23:52 +0530
Message-Id: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
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

Changes Since V2:
	-- Split lpass sc7280 cpu driver patch and create regmap config patch.
    -- Create patches based on latest kernel tip.
    -- Add helper function to get dma control and lpaif handle.
    -- Remove unused variables.
Changes Since V1:
    -- Typo errors fix
    -- CPU driver readable/writable apis optimization.
    -- Add Missing config patch
    -- Add Common api for repeated dmactl initialization.

Srinivasa Rao Mandadapu (10):
  ASoC: qcom: Move lpass_pcm_data structure to lpass header
  ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
  ASoC: qcom: Add register definition for codec rddma and wrdma
  ASoC: qcom: Add lpass CPU driver for codec dma control
  ASoC: qcom: Add helper function to get dma control and lpaif handle
  ASoC: qcom: Add support for codec dma driver
  ASoC: qcom: Add regmap config support for codec dma driver
  ASoC: dt-bindings: Add SC7280 sound card bindings
  ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
  ASoC: qcom: SC7280: Update config for building codec dma drivers

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
 sound/soc/qcom/Kconfig                             |  13 +
 sound/soc/qcom/Makefile                            |   4 +
 sound/soc/qcom/common.c                            |  39 ++
 sound/soc/qcom/common.h                            |   1 +
 sound/soc/qcom/lpass-cdc-dma.c                     | 195 +++++++
 sound/soc/qcom/lpass-cpu.c                         | 245 ++++++++-
 sound/soc/qcom/lpass-lpaif-reg.h                   | 103 +++-
 sound/soc/qcom/lpass-platform.c                    | 513 +++++++++++++++---
 sound/soc/qcom/lpass-sc7280.c                      | 599 +++++++++++++++++++++
 sound/soc/qcom/lpass.h                             | 157 ++++++
 11 files changed, 1859 insertions(+), 79 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
 create mode 100644 sound/soc/qcom/lpass-sc7280.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

