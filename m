Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4E156B3C
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 16:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCE61671;
	Sun,  9 Feb 2020 16:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCE61671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581263511;
	bh=0K+77HeJf7t6SYKxDiqRZ/U4PjheVu9fWBkJPCej6Rc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yiu6u9fSJ8SiA5HwHZa36K8vYXGrzYj4f/wzLPN/dwRJdxW4vMdTAUOA7fpHNPkj1
	 J+nH+cE3pvYR/VTdw/jjwQ83AHM8Yxc7A1wk8ZdHp+FZU2g1ayPnZiLN5rrANSEpm4
	 JepXSxzTGxVg/sNlHLW/dyNv2J8I0lvDeKcmpkkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37722F8028D;
	Sun,  9 Feb 2020 16:48:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D098F8028D; Sun,  9 Feb 2020 16:48:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9511F8027C
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 16:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9511F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="lnVf5zih"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 861D7D00700;
 Sun,  9 Feb 2020 15:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcSDXKU_nL2R; Sun,  9 Feb 2020 10:48:23 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id D36A2D00716;
 Sun,  9 Feb 2020 10:48:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com D36A2D00716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581263289;
 bh=+zB4LnN9LLpPdhU7E7/M9daLcjy7QRsA3nLhYSVC610=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lnVf5zihzXXmqGAdeUCWgq53i5PiqyLPm1d4RtuXtQ2fYNZ0W9+yuDbaaVxcns6nO
 H6f/mlBFE6sn5DoBh25bAHN/BPZrlzhq7aHNnw9M85EXayD/sUNVxysoAffz9o+GGc
 dp+uvPpBThdF5kEtzk33qDa30Skas0vaaxANHxdI=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  9 Feb 2020 10:47:40 -0500
Message-Id: <20200209154748.3015-1-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 0/8] ASoC: qdsp6: db820c: Add support for
	external and bluetooth audio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Changes from V1:

	Rename patch:
		from: dts: msm8996/db820c: enable primary pcm and quaternary i2s
		to: dts: qcom: db820c: Enable primary PCM and quaternary I2S

CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Adam Serbinski (8):
  ASoC: qdsp6: dt-bindings: Add q6afe pcm dt binding
  ASoC: qdsp6: q6afe: add support to pcm ports
  ASoC: qdsp6: q6afe-dai: add support to pcm port dais
  ASoC: qdsp6: q6routing: add pcm port routing
  ASoC: qcom: apq8096: add support for primary and quaternary I2S/PCM
  ASoC: qcom/common: Use snd-soc-dummy-dai when codec is not specified
  arm64: dts: qcom: db820c: Enable primary PCM and quaternary I2S
  ASoC: qcom: apq8096: add kcontrols to set PCM rate

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 113 +++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi   | 162 ++++++++++++
 include/dt-bindings/sound/qcom,q6afe.h       |   8 +
 sound/soc/qcom/apq8096.c                     | 172 +++++++++++--
 sound/soc/qcom/common.c                      |  22 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c             | 198 ++++++++++++++-
 sound/soc/qcom/qdsp6/q6afe.c                 | 246 +++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.h                 |   9 +-
 sound/soc/qcom/qdsp6/q6routing.c             |  44 ++++
 9 files changed, 953 insertions(+), 21 deletions(-)

-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
