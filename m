Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1A308869
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 12:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C23316AF;
	Fri, 29 Jan 2021 12:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C23316AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611920601;
	bh=I9CWcLc1QcQIklz9Zkkv8BEVBwmF+8FfQdp+tmWstBI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fiYV8kecOoZN1XB1aGadwUJA9UoJR6vi/69uk0+DJECc9ihAKt7ynAjzZsXmPOCqT
	 uKCAJOw+2/a6LOnSxoZNLmNT1dMYViWSj94d4e7goCxYMD+imSGsWvkDJbRA2xkScU
	 3VrQP/auybkFPsNIRYDqySCCHAj2njqGvU2tPwRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A2AF80260;
	Fri, 29 Jan 2021 12:41:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E1D6F80259; Fri, 29 Jan 2021 12:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EADCF800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EADCF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="gCzdzD61"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6013f4700004>; Fri, 29 Jan 2021 03:41:36 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 11:41:36 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 11:41:33 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 0/8] Tegra186 and Tegra194 audio graph card
Date: Fri, 29 Jan 2021 17:11:02 +0530
Message-ID: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611920496; bh=uzYYaM4zlINnc73292rURhcTc3bLVJxAy+ph9Qzfsms=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=gCzdzD61HKlLgULr7aMrxahk7ConrVGkD83nrIIuSKre7xcUS3tSP9DUA4o3yiVwS
 BRkUzjzQrkR4KhEpsG9e4GBGNVBMCIZEpOdfjUhV4WzM1NlFSHq8iIQUkPXTw47/rV
 dllFfZW9OFtaQ34Lqx/UCszgajjNfQmUKTJKIAVadwRp+s9ItaacsiotVdKwmKkclm
 utklVnMhRqVRjRJHiHbJjcJSN2s5aX78StebJSEUfAJsLJ6YWvoMg6cHnM8cpqaFv5
 sIUDBJlSuThlOZ+DXy733ZufMfAM8hi3D+prMmf+X1r6V/N46O37TULuncKFctFpx9
 Zo4dyKUzNlF/g==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com, sharadg@nvidia.com, linux-tegra@vger.kernel.org
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

This series adds support for audio graph based solution on Tegra186 and
Tegra194. This enables audio paths for I2S, DMIC and DSPK modules.

Depending on the platform Jetson TX2 or Jetson AGX Xavier, required I/O
module instances are enabled. Since the latter board has on board audio
codec, DT support for the same is enabled and external audio playback and
capture can be used.

Sameer Pujar (8):
  ASoC: dt-bindings: rt5659: Update binding doc
  ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
  ASoC: audio-graph-card: Add clocks property to endpoint node
  ASoC: tegra: Select SND_SOC_RT5659
  arm64: tegra: Add RT5658 device entry
  Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
  arm64: tegra: Audio graph sound card for Jetson TX2
  arm64: tegra: Audio graph sound card for Jetson AGX Xavier

 .../bindings/sound/audio-graph-port.yaml           |   3 +
 .../sound/nvidia,tegra-audio-graph-card.yaml       |   3 +
 Documentation/devicetree/bindings/sound/rt5659.txt |  11 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 609 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 468 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  20 +
 sound/soc/tegra/Kconfig                            |   1 +
 8 files changed, 1137 insertions(+)

-- 
2.7.4

