Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236A30886A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 12:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF71116B6;
	Fri, 29 Jan 2021 12:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF71116B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611920616;
	bh=xWkU+Iqo/Yj05/Y7eTh3sVKmg1U4pbZTYfWzjBa4FII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=plJfjbaP3msL3vwqmW+Ojd7Cz4t9fDDxf3htithBINsoA4eVYfEvgJF8eXqV9trl3
	 suykRUP6dDrdsUrngEElR6aAS515eDZ8TlsIIxgp14lVTY7YEZWpCl/PDnl9+RtYBT
	 Fj45ldsc/NDRdhivekUB+YR4dVj8QOHZUHOD3exg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB08F804CA;
	Fri, 29 Jan 2021 12:41:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5FB7F804CA; Fri, 29 Jan 2021 12:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70B64F80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B64F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nmm8F9wO"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6013f4750000>; Fri, 29 Jan 2021 03:41:41 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 11:41:40 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 11:41:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 1/8] ASoC: dt-bindings: rt5659: Update binding doc
Date: Fri, 29 Jan 2021 17:11:03 +0530
Message-ID: <1611920470-24225-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611920501; bh=zegRvFdxvHED4R5W9t6yg7pqQzJOMHOZG7j3dYTBods=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=nmm8F9wOpVCAMRPifRGXLPctBfTScDzQQykcDS6PCSB6DIunkLv9HQ4Yy6YIQsvOm
 W38GnaLtcxFk3SWxOLDPpt+5t2WFowGQlES0QlyvF16HLAYa4nIYamvDSjJzHRaLiP
 Y6puKJ6vg1YRYy+cknRE1iP4WumhmMJRc9VwnTyrLyChIS318kkQ1aSwZ9Nh0PXTxn
 ry1kctUsD13H2QkMKTDpWkJ/XIutrQ6TvXkztOg7j9TmaKNf3Tvmp1Kis8I5xhcFK1
 tbbqf8WmDUJf8Rz6ahfzIIMGUYwMVXlkZ0FrfGbvqaTNArrpafsn61q2+PwlgzBChb
 fDKmZcFkuu88Q==
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org, Bard Liao <bardliao@realtek.com>
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

Update following in rt5659.txt binding doc
  - Add JD source for Intel HDA header: Commit 041e74b71491
    ("ASoC: rt5659: Add the support of Intel HDA Header")
    added driver support. Add missing info here.

  - sound-name-prefix: Used to prefix component widgets/kcontrols
    with given prefix.

  - ports: Helps to use the Codec with audio graph card

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt5659.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
index 56788f5..c473df5 100644
--- a/Documentation/devicetree/bindings/sound/rt5659.txt
+++ b/Documentation/devicetree/bindings/sound/rt5659.txt
@@ -37,10 +37,21 @@ Optional properties:
 - realtek,jd-src
   0: No JD is used
   1: using JD3 as JD source
+  2: JD source for Intel HDA header
 
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
 
+- sound-name-prefix: Please refer to name-prefix.txt
+
+- ports: A Codec may have a single or multiple I2S interfaces. These
+  interfaces on Codec side can be described under 'ports' or 'port'.
+  When the SoC or host device is connected to multiple interfaces of
+  the Codec, the connectivity can be described using 'ports' property.
+  If a single interface is used, then 'port' can be used. The usage
+  depends on the platform or board design.
+  Please refer to Documentation/devicetree/bindings/graph.txt
+
 Pins on the device (for linking into audio routes) for RT5659/RT5658:
 
   * DMIC L1
-- 
2.7.4

