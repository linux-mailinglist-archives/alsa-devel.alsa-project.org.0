Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E5616BF8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 19:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF3511663;
	Wed,  2 Nov 2022 19:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF3511663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667413270;
	bh=73yq3hSmCgnnBnC9+ZUyzTnv19Mj0CWcIsrmUiNrmxI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kfgZUeh0g1aZUmmhOMmLnNQrx8bYXGUM/brNsi9fd5pb/ZwGjS4qe8j+ALkuR3mwC
	 BqYjzFJLdRYapbqLsmY4ujysmQTewRi3/RW0/MC+6n4f+g6Z0cMv4B7/4Y5IIHAvrX
	 ruaHHusD7U92pyGZPbXN2AClw85ikva0Ob5WJAbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE676F80085;
	Wed,  2 Nov 2022 19:20:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72722F80085; Wed,  2 Nov 2022 19:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E2DF801D5
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 19:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E2DF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="omK34qDx"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC23566028BD;
 Wed,  2 Nov 2022 18:20:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667413207;
 bh=73yq3hSmCgnnBnC9+ZUyzTnv19Mj0CWcIsrmUiNrmxI=;
 h=From:To:Cc:Subject:Date:From;
 b=omK34qDxLzEuDlGtMXDGhcAOcY4mxHxqYYS4VJQp20qGEOIofJX3PmEhQrJXS6RHt
 39fe/AbQJxKAqXZ5KKlg0k2gP/D8pbZGTl18E4kHjW8sgEB7KyxV5F/NifoYyI38q7
 gooAraSdx3SvF0rz3tpLFwGOLuMPcERWAJwZTI8C3m7cDuFfa0uBSwupvNbd6+etB8
 /fuf9ZEXDZJDRknvb7egxXCZ+R56vncD21qZh1ad1nHwQEGPICo018iLqy/CUMuvSF
 6j1KQfr2dKLFmOarx6lC4Hs+V5HFf0VDMCPQxmM0+/G9KxGg7Wo27Hy1iumSxnEUlk
 0WSHSrkT3SLig==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 0/8] Adjust usage of rt5682(s) power supply properties
Date: Wed,  2 Nov 2022 14:19:54 -0400
Message-Id: <20221102182002.255282-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


This series sets straight the usage of power supply properties for the
rt5682 and rt5682s audio codecs.

These properties were already being used by sc7180-trogdor.dtsi (and
derived DTs like sc7180-trogdor-kingoftown.dtsi).

We start by documenting the power supplies that are already in use and
then add few others that were missing to the bindings.

Then we update the drivers to also support the new supplies.

Finally we update the trogdor DTs so they have the newly added but
required supplies and remove a superfluous one that was causing
warnings.

v1: https://lore.kernel.org/all/20221028205540.3197304-1-nfraprado@collabora.com

Changes in v2:
- Made new supply names uppercase to be consistent with the existing
  ones

Nícolas F. R. A. Prado (8):
  ASoC: dt-bindings: realtek,rt5682s: Add AVDD and MICVDD supplies
  ASoC: dt-bindings: realtek,rt5682s: Add DBVDD and LDO1-IN supplies
  ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT supplies
  ASoC: dt-bindings: rt5682: Add DBVDD and LDO1-IN supplies
  ASoC: rt5682s: Support DBVDD and LDO1-IN supplies
  ASoC: rt5682: Support DBVDD and LDO1-IN supplies
  arm64: dts: qcom: sc7180-trogdor: Add missing supplies for rt5682
  arm64: dts: qcom: sc7180-trogdor: Remove VBAT supply from rt5682s

 .../bindings/sound/realtek,rt5682s.yaml       | 23 +++++++++++++++++++
 .../devicetree/bindings/sound/rt5682.txt      | 20 ++++++++++++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   |  1 +
 ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  1 +
 ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  2 ++
 sound/soc/codecs/rt5682.c                     |  2 ++
 sound/soc/codecs/rt5682.h                     |  2 +-
 sound/soc/codecs/rt5682s.c                    | 22 ++++++++++++++++++
 sound/soc/codecs/rt5682s.h                    |  2 ++
 10 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.38.1

