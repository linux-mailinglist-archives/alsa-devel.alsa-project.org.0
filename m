Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5504678E1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 14:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76FC522E4;
	Fri,  3 Dec 2021 14:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76FC522E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638539547;
	bh=hJG58SYAVGNpPYo2IcIUWsajkYlXBANCyhYcff6ZNmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Va6omIWUpYWTGRmNDeApaZtmrZSA/ucyGKIsxsRXTc4fjaDA+pXF79/KMts3ECZ7f
	 OCBTqFDyFvkWS0CQfYX+72vqlioO61I8V61zf9jO/gm/L3tTEKNUt+W7tpwmxUUpK2
	 5vRuRR5EU3IHzO33P1cQfSDG2hkm+2g134bS9GkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A8DF804F1;
	Fri,  3 Dec 2021 14:50:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE8CF804ED; Fri,  3 Dec 2021 14:50:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CADDF80256
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 14:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CADDF80256
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="ezOB+UXh"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 480331F46E6E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638539406; bh=hJG58SYAVGNpPYo2IcIUWsajkYlXBANCyhYcff6ZNmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ezOB+UXh06vKoBdD+FQrYCJoW+clB2VJVJFPYn8itvWBcBR23nHjSXtLe7HEq6N5Q
 lRPKyMKRqk5oa4iJu3ZbMGJ6npcdZpydysHrCh0TFKUM3+C2V+Jy/K2VMxbn2ugmFL
 b2TdQ1wE10ZBOpehM/4htHj/Wb2NqpwcEZJ6CgSfRbLVEm6mPJ2iut11INo40TL957
 aVN+V/cm74me8bw+F+TOwZBDLOG53k5aCjLKpBN+OAF2M+haJY7mz0HnR5YYHa1obV
 r5/Cs6TmwMWliNKWESVQ3zDI4y0UhC7v1ztfkzIRZefp1GJTr0Dldq9HHVC/QWYL9o
 SbpNOmKK7sKrA==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] ASoC: fsl-asoc-card: Add optional dt property for setting
 mclk-id
Date: Fri,  3 Dec 2021 10:49:29 -0300
Message-Id: <20211203134930.128703-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

Sound cards may allow using different main clock inputs. In the generic
fsl-asoc-card driver, these values are hardcoded for each specific card
configuration.

Let's make it more flexible, allowing setting mclk-id from the
device-tree node. Otherwise, the default value for each card
configuration is used.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 1 +
 sound/soc/fsl/fsl-asoc-card.c                             | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 23d83fa7609f..b219626a5403 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -82,6 +82,7 @@ Optional properties:
   - dai-format		: audio format, for details see simple-card.yaml.
   - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
   - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
+  - mclk-id		: main clock id, specific for each card configuration.
 
 Optional unless SSI is selected as a CPU DAI:
 
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 90cbed496f98..bb962e04d40b 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -693,6 +693,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		goto asrc_fail;
 	}
 
+	/*
+	 * Allow setting mclk-id from the device-tree node. Otherwise, the
+	 * default value for each card configuration is used.
+	 */
+	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
+
 	/* Format info from DT is optional. */
 	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider, &frameprovider);
 	if (bitclkprovider || frameprovider) {
-- 
2.30.2

