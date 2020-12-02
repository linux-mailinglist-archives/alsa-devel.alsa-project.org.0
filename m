Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471802CC388
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 18:23:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E5EE17EA;
	Wed,  2 Dec 2020 18:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E5EE17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606929829;
	bh=+Tn7sxY0qtSV69rlrnf0/Eumfqgx793Uc/lnR9gwviw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q5BlQyg9TpuoDk43sexyq4BUi8Y1J3zKc3d6GSGFncQVr7zcD9wwJw6aQoc65zTiV
	 VV/wGJhvdguzwCOIlmMtqDugLF91GWvZErXtNcZHFWgwLngHHW62jEgtsu5k/e8Wxf
	 oeOgJgIVEDw5BQMa1S5Va6BjfU9NTuQs05raxHC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DDAF8049C;
	Wed,  2 Dec 2020 18:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14D3F8026B; Wed,  2 Dec 2020 18:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from a2.mail.mailgun.net (a2.mail.mailgun.net [198.61.254.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD00F80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 18:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD00F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="LlPu3Wsz"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606929775; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=du06zc/jHcGsUafhmo+6BZJPLrel+MajZ6mJGJKue0w=;
 b=LlPu3WszT3RXL8gNWlgc5QQzMR9UzoR6W0n/1zmS0Kz/iFfW2IKMfCOA+I+TUXCeKG3t67aB
 sAympL4amTHoS2lWuCBXWtDcNNag21pPE00VDHQDSa946RlwA8wVZyfB925S/itnZoUfGVHs
 DCONq077hGTjacPq8vM13ONUq9o=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fc7cd66e8c9bf49adc745ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 17:22:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5723C43463; Wed,  2 Dec 2020 17:22:45 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C30DDC43460;
 Wed,  2 Dec 2020 17:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C30DDC43460
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
Subject: [PATCH v5 0/2] Platform driver update to support playback recover
 after resume
Date: Wed,  2 Dec 2020 22:52:26 +0530
Message-Id: <1606929748-16828-1-git-send-email-srivasam@codeaurora.org>
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

This patch set is to add support for playback recover after hard suspend and resume.
It includes:
1. Reverting part of previous commit, which is for handling registers invalid state
after hard suspend.
2. Adding pm ops in component driver and do regcache sync.
Changes Since v1 and v2:
  -- Subject lines changed
Changes Since v3:
  -- Patch is splitted into 2 patches
Changes Since v4:
  -- Subject lines changed

Srinivasa Rao Mandadapu (2):
  ASoC: qcom: Fix incorrect volatile registers
  ASoC: qcom: Add support for playback recover after resume

 sound/soc/qcom/lpass-cpu.c      | 20 ++----------------
 sound/soc/qcom/lpass-platform.c | 46 +++++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 29 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

