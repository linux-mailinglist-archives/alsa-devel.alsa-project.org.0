Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CC2AF833
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCA41777;
	Wed, 11 Nov 2020 19:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCA41777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605119807;
	bh=lbEdkKJmbIgj0FBvHS2fSEG1dh/F/XwpMr6pQIQf8y4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OKQwEZeUQoav9xe+MjVqo8UVGJSrVkQbsQnhbWLGUpx9iRcsbxQKhmguSFnHw6nFg
	 RV0EDP8EVnsm1QxW2YOugkNq0sUpfEOvChe+8izT3ZK9rB7cZGh57m+hDTQsYPQGMp
	 KFXpMYbexfp6U+LbA0yv5pTO+906YzRl6s8SvS3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E9AEF8022D;
	Wed, 11 Nov 2020 19:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90151F8022B; Wed, 11 Nov 2020 19:35:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39609F80059
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 19:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39609F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kEA4/XC9"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fac2ed20002>; Wed, 11 Nov 2020 10:34:58 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 18:35:03 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 18:35:00 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH v5 0/6] Tegra210 audio graph card
Date: Thu, 12 Nov 2020 00:04:30 +0530
Message-ID: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605119698; bh=9pnGPueh9Jd4q76quuL9r1PLuTKpulNOZjgLkEmE5bY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=kEA4/XC9lwQwVATr/lOxrV0bWZwZqeeJe3xG2/2x+bCTlOoK9+W4AJF4LW++WbFB6
 g2b6xybZEfvK2yfylUx1yfyyf7jT7/CKVROq8Q8WuMP4rvP4wp7RqY7Ng6dsMsYNNH
 zHs5lwfvR1lDCT9Iai61kC2WbFvlzi/d7AF3UsMUwLdkx/1zcQC7zCpRZGOwMHia6N
 BN4qT5vytcEY9AJpChuyTZJZrdz6F7Y4DdT+7kss6ZZqz6e+EtWTL95ZkkUK8WSRoU
 qaMokeuC3nHWIrt7lnHy6qOUJIPfeg5zm1Uez0lwMm37WMVbGy2L55rLN5YjXpFWq8
 zDUUBIRYi1NLQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

This series adds audio graph based sound card support for Tegra210
platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
audio graph enhancement series is already merged.
 * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*

Following are the summary of changes:
 * Add graph/audio-graph based schemas or schema updates for Tegra210
   component and machine drivers.
 * Add Tegra audio graph machine driver.
 * Add required DT support for Jetson-TX1/Nano.

This work is based on earlier discussion of DPCM usage for Tegra
and simple card driver updates.
 * https://lkml.org/lkml/2020/4/30/519
 * https://lkml.org/lkml/2020/6/27/4

This series has dependency over following graph and audio-graph series.
 * http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20201102203656.220187-2-robh@kernel.org/
 * https://patchwork.kernel.org/project/alsa-devel/list/?series=382009&state=*

Changelog
=========

v4 -> v5
--------
 * Audio graph related changes were sent in separate v5 series as
   mentioned above and are dropped from current series.
 * Graph and audio graph doc patches are dropped from this series
   and are sent separately as mentioned above.
 * Minor change with phandle label for TX1 and Nano platform DT files.
 * No changes in other patches.

v3 -> v4
--------
 * Added new patches to convert graph.txt and audio-graph-card.txt
   to corresponding json-schema files. Later these references
   are used in Tegra audio graph schema.

 * AHUB component binding docs are updated to reflect the usage
   of ports/port/endpoint

 * More common stuff is moved into graph_parse_of() and this is
   used by both generic and Tegra audio graph.

 * DT binding for Tegra audio graph is updated to included "ports { }"

 * As per the suggestion 'void *data' member is dropped from
   'asoc_simple_priv' and instead container method is used to
   maintain required custom data internal to Tegra audio graph. 

v2 -> v3
--------
 * Dropped new compatible addition in generic graph driver
   after reviewing it with Morimoto-san. Instead added Tegra
   audio graph driver and new compatibles are added in the same.
 * Added new patches to expose new members for customization
   in audio graph driver.
 * Added new patch for Tegra audio graph driver and related
   documentation.
 * Minor change in below commit where mutex version of helper is used
   "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
 * DT binding is updated to use the newly exposed compatibles
 * No changes in other patches

v1 -> v2
--------
 * Re-organized ports/endpoints description for ADMAIF and XBAR.
   Updated DT patches accordingly.
 * After above change, multiple Codec endpoint support is not
   required and hence dropped for now. This will be considered
   separately if at all required in future.
 * Re-ordered patches in the series.


Sameer Pujar (6):
  ASoC: dt-bindings: tegra: Add graph bindings
  ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
  ASoC: tegra: Add audio graph based card driver
  arm64: defconfig: Enable Tegra audio graph card driver
  arm64: tegra: Audio graph header for Tegra210
  arm64: tegra: Audio graph sound card for Jetson Nano and TX1

 .../sound/nvidia,tegra-audio-graph-card.yaml       | 187 +++++++++++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |   6 +
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |   6 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |  13 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |   6 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |   6 +
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 sound/soc/tegra/Kconfig                            |   9 +
 sound/soc/tegra/Makefile                           |   2 +
 sound/soc/tegra/tegra_audio_graph_card.c           | 255 ++++++++++++++++++++
 13 files changed, 1050 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
 create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c

-- 
2.7.4

