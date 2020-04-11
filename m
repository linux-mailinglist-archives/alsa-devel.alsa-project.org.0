Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235B1A751B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E4F16A1;
	Tue, 14 Apr 2020 09:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E4F16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850232;
	bh=1nNgREj2MZDYhjWrgdE1QO1oJibCSFIRcg5XsD7jfD0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZCXqgt8+i/OurNZ0iyN8C2MVI1bM4LnDWdjOreAEdT1AMLhH4/k4kePmdDYiCdte
	 UNN97iChA6iY1zPTanoUJtYgOPbp9blydi/33FYxmoUHm7pDNE5kN2IAdZzajHmdCI
	 MDU6tE1en4biZMJXAUh3+CoI+evxH6mTKdCRO9gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F33F80126;
	Tue, 14 Apr 2020 09:42:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE8A2F801F9; Sat, 11 Apr 2020 10:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A54EF800CB
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 10:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A54EF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="UJ8v9AMB"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586592223; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=shik54jnyOMg3ZRSwryG1Rwc0uqwahsFZRtNbkOAM4I=;
 b=UJ8v9AMBTeDTzi9GIWrJK2R3nBKHXEwkYbCjVE+iw8ITs0QVrx5W1DnWyTgYePaAiroeLAhD
 mqCVrdbMSHDYcpkeNswblV7sbMEwKHFpQ2blM0HqQhzC76BdLNP9JSp0uOl+3xXqudN945uw
 6Hzi4cfVPkyG8tzDvYTBBFHZz5c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9179d2.7f221144bed8-smtp-out-n05;
 Sat, 11 Apr 2020 08:03:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 93280C433F2; Sat, 11 Apr 2020 08:03:30 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D4573C433BA;
 Sat, 11 Apr 2020 08:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4573C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH 00/11] ASoC: QCOM: Add support for SC7180 lpass variant
Date: Sat, 11 Apr 2020 13:32:40 +0530
Message-Id: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:46 +0200
Cc: Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

We've common ASoC cpu driver for QCOM LPASS soc varaints. This patch
chain add support for new variant SC7180 soc by doing the required
modification in existing common lpass-cpu driver. Below is a brief
summary of patch series:

PATCH 01 ... 04: Update lpass-cpu driver files to make it more generic
PATCH 05 ... 08: Add changes to support SC7180 specific configuration
PATCH 09 ... 11: Add new drivers and documentation for SC7180 soc lpass

Ajit Pandey (11):
  Documentation: device-tree: sound: Update lpass-cpu driver binding
  ASoC: qcom: lpass: Add struct lpass_dai to store dai clocks pointer
  ASoC: qcom: Add common array to initialize soc based core clocks
  ASoC: qcom: lpass-cpu: Make "ahbix-clk" an optional clock.
  ASoC: qcom: lpass: Add support for newer lpass version
  dt-bindings: sound: Add bindings related to lpass-cpu configuration
  Documentation: dt-bindings: sound: Add details for new dai properties
  ASoC: qcom : lpass: Add support to configure dai's connection mode
  device-tree: bindings: sound: lpass-cpu: Add new compatible soc
  ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
  ASoC: qcom: lpass-platform: Replace card->dev with component->dev

 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 158 -------------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 159 +++++++++++++
 include/dt-bindings/sound/qcom,lpass.h             |  31 +++
 sound/soc/qcom/Kconfig                             |   5 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |  39 ++-
 sound/soc/qcom/lpass-cpu.c                         | 263 ++++++++++++++-------
 sound/soc/qcom/lpass-lpaif-reg.h                   | 182 +++++++++++++-
 sound/soc/qcom/lpass-platform.c                    |  36 +--
 sound/soc/qcom/lpass-sc7180.c                      | 192 +++++++++++++++
 sound/soc/qcom/lpass.h                             |  40 +++-
 11 files changed, 808 insertions(+), 299 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
 create mode 100644 include/dt-bindings/sound/qcom,lpass.h
 create mode 100644 sound/soc/qcom/lpass-sc7180.c

-- 
1.9.1
