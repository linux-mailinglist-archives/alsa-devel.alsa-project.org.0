Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B802617F2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DC8A1688;
	Tue,  8 Sep 2020 19:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DC8A1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599587168;
	bh=3qPkkzUdtMV75S8+zuGzlHL+G4N4P1hrr2hLyHD6G3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=desOKp9YKWSfB93nYNps7GXubTjLUlBpzrvo6FShY51WQ6Xp4/j9Zhcw8mHrJiO62
	 +AruusPP/OPAtiY6UWbB2v9gMZeaWcUOdSmEcwyxG3L53bp2pXVYyT+x+aBlbqkdUZ
	 BImPix0LDH8GYu0GylbCOF1VD1q/URzXPV4RBfuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E201FF802DF;
	Tue,  8 Sep 2020 19:44:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CEA6F802DC; Tue,  8 Sep 2020 19:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E601BF801F2
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E601BF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="aPBCTXE8"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="SLIQ7adc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587062;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=3qPkkzUdtMV75S8+zuGzlHL+G4N4P1hrr2hLyHD6G3o=;
 b=aPBCTXE8B9n0nh7wpB0w5KtF6U6PzoYsxu74MN5+fXf80PdbqZqnPtTVFSm+wFLH
 lHp2plJi9YTwhRXFu2ZrEifNUL6qSh5q0kiLHo4ZZ4ak13KJBC2JATnRj/vTAALzjoO
 Q4k/pW4Fe31K08N9BtaKbH+ZEeWldoNFp49vb6cU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587062;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=3qPkkzUdtMV75S8+zuGzlHL+G4N4P1hrr2hLyHD6G3o=;
 b=SLIQ7adcEOfXUOqxAhbqKJjURMS5Z+fCJYpuMEuDZwvY+koG0jhp2kYB3Qrfv4I9
 M/J3pmJBbfwlp6qtnzB12uNRWRnxtWLZMQDYmSLzfnWj6r2xmZ+GIy3rR4FxkeV2yZ/
 Ll5orcnmGksTACn5IybJyJXErQKpDbJ5k+hoY4Ys=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12781C433C6
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
Subject: [PATCH v4 0/5] Qualcomm's lpass-hdmi ASoC driver to support audio
 over dp port
Date: Tue, 8 Sep 2020 17:44:22 +0000
Message-ID: <010101746ed19404-25116f32-5558-41dd-b684-76c12ea85536-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2020.09.08-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
Changes Since v3:
   -- Removed id in lpass variant structure and used snd_soc_dai_driver id

V Sujith Kumar Reddy (5):
  ASoC: Add sc7180-lpass binding header hdmi define
  ASoC: dt-bindings: Add dt binding for lpass hdmi
  ASoC: qcom: Add support for lpass hdmi driver
  ASoC: qcom: Add support for audio over DP
  ASoC: qcom: Optimise lpass variant structure

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  51 +-
 include/dt-bindings/sound/sc7180-lpass.h           |   1 +
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |  24 +-
 sound/soc/qcom/lpass-cpu.c                         |  93 ++-
 sound/soc/qcom/lpass-hdmi.c                        | 685 +++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h                        | 129 ++++
 sound/soc/qcom/lpass-ipq806x.c                     |  24 +-
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 304 +++++++--
 sound/soc/qcom/lpass-sc7180.c                      | 146 ++++-
 sound/soc/qcom/lpass.h                             | 121 +++-
 13 files changed, 1486 insertions(+), 150 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

