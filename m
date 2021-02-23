Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54632308C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 19:22:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 609F11676;
	Tue, 23 Feb 2021 19:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 609F11676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614104548;
	bh=MEjpyHn2CDjnPfxkT2wEky1s6pdVTEwsRbTZKg0ovic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1w4kZxjTjXPKOKfP4BWfXOYkFgEAQgno2aogivoFk1ENKsfM8t8Ftbn/yXsSQ/lT
	 u0JR3xJn/c4auRcImsxgCpv0//SugMVCvKf6VC5ky80AOtTDLEnrINDHxNjyCAjLrT
	 tqmN3aGhDQdzeGFY6Pi+oX9zdpVLV18vbhgkM5PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC59F802E0;
	Tue, 23 Feb 2021 19:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E783EF802E2; Tue, 23 Feb 2021 19:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 137F0F8026C
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 19:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 137F0F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="moeu9QX0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614104412; x=1645640412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEjpyHn2CDjnPfxkT2wEky1s6pdVTEwsRbTZKg0ovic=;
 b=moeu9QX0n9rxxmdHztk1SfFQ+M1ZohPrcN/Ys0jk1UF2bmvIxRm/Ze2U
 x1+pIM2kA1wW1OY2Une++jkHNKnBefmIKVmkc5iXGrK2jzame95rtqEg2
 cYi2VuEPRvz2Kz2t+ff0rMs9AQE2Vl68HXdHUu94Pbp13Ix0CC8WW40uY
 Man02nU7ziCXhq2GZvw2xuTG1vVLN1zXSwM/zc2Q2wU0L3WS1V6vFVmLn
 2fYiw7VAL0vRvIMuvP1fIxo/dy4YNkL+R3kKGB7se1bK1uOcZggRKO5Fq
 f6CRBP+rJ9cGDQkOAwpqz4DSxtveWqO0piuctG8WqAT/C9S9zS4TB3dR6 Q==;
IronPort-SDR: rI5ETHQBkcWabJ2Bw7Ta9hW/E3dXsL1sV3yEBAiOVxZI0gvmhAz5cB4y1tdYEfMvApi+F58fVg
 mioJ1+7V7MDv/obCGqJ+LKvWxExfygRdwhXZmTmaHdtlr1j+2x84dU8FLFtZvjcyC38Ao9CpTX
 dTMcVYbWdfDCYBG+YHGpr2L8zpAyP+DZWg5EAXy2ulM8RcZcZhS8hycIgQPM+94VRcF01Ehmw9
 vhLASOJXO0L6HnwYdKuqYbKSowvuyaPTkkzZYkQ59Yv7qJbPXYHF+gZ86MWVqNRmX5fFEC0S7e
 rU4=
X-IronPort-AV: E=Sophos;i="5.81,200,1610434800"; d="scan'208";a="104869134"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2021 11:20:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 23 Feb 2021 11:20:08 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 23 Feb 2021 11:20:05 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/7] ASoC: mchp-i2s-mcc: Add compatible for SAMA7G5
Date: Tue, 23 Feb 2021 20:19:25 +0200
Message-ID: <20210223181929.444640-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
References: <20210223181929.444640-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

Microchip's new SAMA7G5 includes an updated I2S-MCC compatible with the
previous version found on SAM9X60. The new controller includes 8 (4 * 2)
input and output data pins for up to 8 channels for I2S and Left-Justified
formats.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/Kconfig        | 3 +++
 sound/soc/atmel/mchp-i2s-mcc.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 9fe9471f4514..ec04e3386bc0 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -127,10 +127,13 @@ config SND_MCHP_SOC_I2S_MCC
 	  Say Y or M if you want to add support for I2S Multi-Channel ASoC
 	  driver on the following Microchip platforms:
 	  - sam9x60
+	  - sama7g5
 
 	  The I2SMCC complies with the Inter-IC Sound (I2S) bus specification
 	  and supports a Time Division Multiplexed (TDM) interface with
 	  external multi-channel audio codecs.
+	  Starting with sama7g5, I2S and Left-Justified multi-channel is
+	  supported by using multiple data pins, output and input, without TDM.
 
 config SND_MCHP_SOC_SPDIFTX
 	tristate "Microchip ASoC driver for boards using S/PDIF TX"
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 6d5ae18f8b38..0ee01383e307 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -873,6 +873,9 @@ static const struct of_device_id mchp_i2s_mcc_dt_ids[] = {
 	{
 		.compatible = "microchip,sam9x60-i2smcc",
 	},
+	{
+		.compatible = "microchip,sama7g5-i2smcc",
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mchp_i2s_mcc_dt_ids);
-- 
2.27.0

