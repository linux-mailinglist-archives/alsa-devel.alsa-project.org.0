Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25341308C5C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B544E1686;
	Fri, 29 Jan 2021 19:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B544E1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611944978;
	bh=9DWK23MDMJLMr7avnLiJwHkeU/r91oabhttgwP5jZ7M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G7N0D5G2iTszo95aFZewnCnvFmxQxKa/iHeOxJ5axuOwpn+WZ8s+bBMfa0eQWNjWV
	 isbOfOqRjpHu8Qmm0MhgvcMemWdo1CA+186Nji9yqO8jGt5DLJnR3ar3CcPao8r5QH
	 IzEKrTk1T3Qb9ua0rGvgnGkDgcnqDAUCihQWcYNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E86CF8025F;
	Fri, 29 Jan 2021 19:28:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94F3F8025F; Fri, 29 Jan 2021 19:28:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 753D6F80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 753D6F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="bR9x5MXS"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453a90000>; Fri, 29 Jan 2021 10:27:53 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:27:52 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:27:50 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 0/9] Tegra186 and Tegra194 audio graph card
Date: Fri, 29 Jan 2021 23:57:37 +0530
Message-ID: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944873; bh=f4tK4+ew7zaDkDHNwy88ploHD6DplKjmbpxcrClEycw=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=bR9x5MXS7UvtD8+w4C0gNV+kikZdgW0dorzwJzboCJyZ16VuXFa2otoM4FgdIcu2N
 XPx5kFhF2JTh576h/+zLeXtgtxi4f3tt7Ui55bFHFKHkO0NLvrJbvJs8flEOd8VIwY
 WF3lG7itI6seSuiYSJZhbiysc8btxYYtLA90WsRhVcgdHSwR1r6JSGhSj2Pe6QNNqo
 bOVxshqsoC/gOFbIoDDURWepC6tWqx5SJ17EBiH/mrikpPixU7k3FSVn5WuGsyMSQB
 HZ+DOseikPaej3cBuavueP4At6QkUCuGaVOX+6gkMagy/uhU964RwuJ1PuTGEB4p9s
 /RMCn3NUNi9NA==
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

Changelog
=========

v1 --> v2:
----------
  - Dropped patch "ASoC: tegra: Select SND_SOC_RT5659" as per suggestion
    from Mark.
  - Add new patch "ASoC: rt5659: Add Kconfig prompt"
  - Add new patch "arm64: defconfig: Enable RT5659"
  - No changes in other patches from earlier series.


Sameer Pujar (9):
  ASoC: dt-bindings: rt5659: Update binding doc
  ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
  ASoC: audio-graph-card: Add clocks property to endpoint node
  ASoC: rt5659: Add Kconfig prompt
  arm64: defconfig: Enable RT5659
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
 arch/arm64/configs/defconfig                       |   1 +
 sound/soc/codecs/Kconfig                           |   2 +-
 9 files changed, 1138 insertions(+), 1 deletion(-)

-- 
2.7.4

