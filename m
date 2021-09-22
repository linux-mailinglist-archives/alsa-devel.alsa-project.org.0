Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D144148FC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 14:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5E8820;
	Wed, 22 Sep 2021 14:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5E8820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632314063;
	bh=DZWxysnme2g/bxy25R1RNyTxs8TVIWS51ngER8TqdP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HVU1ysd8GejU39td46Pm+9FQW9UEp1pyL+6RT5KYEGEj/jW0gAbf9X6M3y3b5zEp3
	 IvHQ4QrcNobZMIZrv7v69xWXLn9FUY1KIoSDvH5fxq30Bkuzl7ly8pumEEZ8WhL12a
	 ol5vCdDa/nmirTCctgvmWzsIqX/8pFNleUiEao28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94B4FF804EB;
	Wed, 22 Sep 2021 14:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4278CF804E2; Wed, 22 Sep 2021 14:32:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3287F804BB
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 14:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3287F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="tDsflMUF"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632313930; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wnjSjUzhn9Vc43/imQhWwvve2fhb7MUsRdjHreJ8z0s=;
 b=tDsflMUFUP5KCzBva3bhtoa6ifKuaA+kNkcKt4Qtxc2RRCIhTyDU96zyCO46Fasmm/QQPFdR
 sOu3k3feX9eAsJtpUFxHogup8W7pjJF0piovHzt4nGGvqWWfjAT89He/fnW6Mxt6gUa4IOr/
 KIh7Ygfu/2TJe9Z9wXjJ3csyv1M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 614b222fb585cc7d24150ec8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:31:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AC638C43618; Wed, 22 Sep 2021 12:31:43 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 96A24C4338F;
 Wed, 22 Sep 2021 12:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96A24C4338F
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
Subject: [PATCH v2 0/5] Update Lpass digital codec macro drivers
Date: Wed, 22 Sep 2021 18:01:13 +0530
Message-Id: <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;
 srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org;
 judyhsiao@chromium.org; >
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com;
 broonie@kernel.org; robh+dt@kernel.org; plai@codeaurora.org;
 bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;
 srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org;
 judyhsiao@chromium.org; >
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

This patch set is to add support for lpass sc7280 based targets.
Upadate compatible name and change of bulk clock voting to optional
clock voting in digital codecs va, rx, tx macro drivers.
Chnages Since V1:
    -- Removed individual clock voting and used bulk clock optional.
	-- Removed volatile changes and fixed default values.
	-- Typo errors.

Srinivasa Rao Mandadapu (5):
  ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
    sc7280
  ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
    codecs
  ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
  ASoC: codecs: tx-macro: Update tx default values
  ASoC: codecs: Change bulk clock voting to optional voting in digital
    codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml        |  4 +++-
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +++-
 sound/soc/codecs/lpass-rx-macro.c                             |  3 ++-
 sound/soc/codecs/lpass-tx-macro.c                             | 11 +++++++----
 sound/soc/codecs/lpass-va-macro.c                             |  3 ++-
 sound/soc/codecs/lpass-wsa-macro.c                            |  1 +
 8 files changed, 24 insertions(+), 10 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

