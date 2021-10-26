Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9843AD74
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 09:45:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D9E16D6;
	Tue, 26 Oct 2021 09:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D9E16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635234302;
	bh=/MVSU7cHTcOH59g6doM1jiivt98voM7UlEIsImzVX9Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HMef6Xb0US0/173qaqlpVDlpm+jeIQyzM0npkb5fimeG6K7zuB7a7ViqG2awnKvyA
	 /okFFMCTRa8nIPMVKsrohEOCF6gzd/Cr0hDrF50d9ESSSr+Yx2zwOyWm7/jZdDSbAV
	 H1K7uvXXEf4BgvFSaADAiHY+IO+88dwR7NTKHQtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7539EF802E7;
	Tue, 26 Oct 2021 09:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0810BF802C8; Tue, 26 Oct 2021 09:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB22EF8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 09:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB22EF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="XKVRJWGi"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635234219; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PaEeeWpk+VFgxQta/HBxsdMfg7mxxMaQ87RBH8VBl5s=;
 b=XKVRJWGixVTXGtGZ9ZWjasPOjPDWu/7KcY/77WO6+HQ+4YyBeQgWLg88Xt5t+ECbTP+nzcdO
 H72PyUYvXjFx8NPB/whRtuTHqGJqO8zWK+xMjxi5q+TTV2bjskiVEWgIx8C4ZWwSTvg5JVpc
 qGm7NAQtI+JRVD6FQ40WRBhOONs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6177b19d5baa84c77b631799 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 07:43:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DA1A4C4360C; Tue, 26 Oct 2021 07:43:24 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6309CC4338F;
 Tue, 26 Oct 2021 07:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6309CC4338F
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
Subject: [PATCH v4 0/5] Update Lpass digital codec macro drivers
Date: Tue, 26 Oct 2021 13:13:03 +0530
Message-Id: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
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
Upadate compatible name and change of bulk clock voting to optional
clock voting in digital codecs va, rx, tx macro drivers.

Changes Since V3:
    -- Removed fixes tag.
    -- Change signedoff by sequence.
Changes Since V2:
    -- Add Tx macro deafults for lpass sc7280
Changes Since V1:
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

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  4 +++-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +++-
 sound/soc/codecs/lpass-rx-macro.c                  |  3 ++-
 sound/soc/codecs/lpass-tx-macro.c                  | 25 +++++++++++++++++++---
 sound/soc/codecs/lpass-va-macro.c                  |  3 ++-
 sound/soc/codecs/lpass-wsa-macro.c                 |  1 +
 8 files changed, 39 insertions(+), 9 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

