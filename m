Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D9217EE9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 07:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA2A1607;
	Wed,  8 Jul 2020 07:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA2A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594185031;
	bh=PrHCkXCaJCsn9TdQiJsiFEgbG7pslUdO4JuzAK3NHQw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SVqaadRHfXgKQ4VE7GQqjojKKUDFnrA2kiYCJZUGx/2H8LC2ZBKEaY7dC+Gcg/iSt
	 hoSkyXDfjUCYvJmc58xtBuWG2j2Hz8PTNd/NTAn88FfeykiZTbghEOjre+xbf1jkKH
	 bZBw0pOXI4biCWnxt6Z9KcjYkEYj2Bu8QGPqTHHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2C9F8015C;
	Wed,  8 Jul 2020 07:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A197F8015A; Wed,  8 Jul 2020 07:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B18F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 07:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B18F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="jsaqKy69"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594184915; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=J/0rtb7ms4jKYAU3mSlVXiZ7/65ZzPwUSJ72i0ViAwU=;
 b=jsaqKy69Z/XrG2xZrcojAje91Z9UKZJdNBZjw3CCB6ev9dT693Ooo3CsIsvPwLwZ/MxgmweO
 uu26vm1Av5EVjdEoeZFhDduuIa6otQcagP46r7ojPfcGe0ULWK84cUBl4m0nFwYuzHtGQY2x
 ZtV5xUGKOHzDle/ch0dypVm98kk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f0554ced8ca07a573d81168 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:08:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23347C433CA; Wed,  8 Jul 2020 05:08:30 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A2672C433C6;
 Wed,  8 Jul 2020 05:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2672C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] ASoC: qcom: Add support for SC7180 lpass variant
Date: Wed,  8 Jul 2020 10:38:08 +0530
Message-Id: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

This patch chain add audio support for SC7180 soc by doing the required
modification in existing common lpass-cpu/lpass-platform driver.
Below is a brief summary of patch series:

PATCH v3 0001 ... 0005: Update lpass-cpu, lpass-platform drivers to make it more generic
and support newer soc registers configuration. This also updates existing lpass-apq8096.c
and lpass-ipq806x.c.
PATCH v2 0005 ... 0007: Add documentation and platform driver for newer SC7180 SOC variant.

Changes since v2:
	- Moved yaml conversion of Documentation to the end of patch series
	- Used REG_FIELD_ID instead of REG_FIELD for DMACTL and I2SCTL registers.
Move reg_fields to struct lpass_variant as suggested by Srinivas.

Ajit Pandey (5):
  ASoC: qcom: Add common array to initialize soc based core clocks
  include: dt-bindings: sound: Add sc7180-lpass bindings header
  ASoC: qcom: lpass-platform: Replace card->dev with component->dev
  ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
  dt-bindings: sound: lpass-cpu: Move to yaml format

Rohit kumar (3):
  ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
  ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
  dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node

 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 --------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 154 +++++++++++++++
 include/dt-bindings/sound/sc7180-lpass.h           |  10 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |  86 ++++++--
 sound/soc/qcom/lpass-cpu.c                         | 193 +++++++++---------
 sound/soc/qcom/lpass-ipq806x.c                     |  67 +++++++
 sound/soc/qcom/lpass-lpaif-reg.h                   | 157 ++++++++-------
 sound/soc/qcom/lpass-platform.c                    | 156 +++++++++++----
 sound/soc/qcom/lpass-sc7180.c                      | 216 +++++++++++++++++++++
 sound/soc/qcom/lpass.h                             |  63 +++++-
 12 files changed, 886 insertions(+), 302 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
 create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
 create mode 100644 sound/soc/qcom/lpass-sc7180.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

