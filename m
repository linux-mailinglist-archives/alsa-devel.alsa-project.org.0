Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA0411042
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 09:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E281686;
	Mon, 20 Sep 2021 09:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E281686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632123448;
	bh=j3wyykRZtffoxP/ynQhBtxpLllGdH2TLef071LNf+LE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QkD4jl143+Cf+Rqerv+jI8gKWKgF4nCYcDb+yDBep3yoWKrotn1iW0ZWKEJyn4nhO
	 IjKHovjnpEAzxn1BxTzx6D/hv6mu7omULxRB/g8Q2J2gv1ph3g7Vm5m/9k2rcKvVdt
	 an5vQxofADzTi2dMDMpLEQd1jqSbgTzLh3OJATuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B000F80129;
	Mon, 20 Sep 2021 09:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2DDEF80279; Mon, 20 Sep 2021 09:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64DFDF80246
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 09:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64DFDF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="QkW6t/cW"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632123368; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ms+B2ZCcZVF2KlK5ntts5I/nDBBo3mTVg8pdBQFTWhE=;
 b=QkW6t/cWM61Ha3SK1vZOAWKo64JkUwgALpjZu9DOF6FX93Nm8TQW3K///KlphDFuCDLzB+0+
 +FKPOC88h5TDi0SZRsRk9qiUE1mif3HGyVLMABLNxRTw6MM9gC3NOaJm2t7RATCGD9LI3CVb
 rPRfxwhgbMtFg5ot/lILNqho6ic=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 614839d4e0f78151d6ca2e7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:35:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26EE0C4360D; Mon, 20 Sep 2021 07:35:48 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 78424C4338F;
 Mon, 20 Sep 2021 07:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 78424C4338F
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
Subject: [PATCH 0/7] Update Lpass digital codec macro drivers
Date: Mon, 20 Sep 2021 13:05:24 +0530
Message-Id: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
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

This patch set is to add support for lpass sc7280 based targets.
Upadate compatible name and change of bulk clock voting to individual
clock voting in digital codec va, rx, tx macro drivers.

Srinivasa Rao Mandadapu (7):
  ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
    sc7280
  ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
    codecs
  ASoC: codecs: tx-macro: Change mic control registers to volatile
  ASoC: codecs: lpass-va-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-rx-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-tx-macro: Change bulk voting to individual clock
    voting
  ASoC: codecs: lpass-va-macro: set mclk clock rate correctly

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  4 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +-
 sound/soc/codecs/lpass-rx-macro.c                  | 69 ++++++++++++------
 sound/soc/codecs/lpass-tx-macro.c                  | 81 ++++++++++++++++------
 sound/soc/codecs/lpass-va-macro.c                  | 49 ++++++++-----
 sound/soc/codecs/lpass-wsa-macro.c                 |  1 +
 8 files changed, 153 insertions(+), 63 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

