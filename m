Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEB680D2B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 13:10:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BDE5E81;
	Mon, 30 Jan 2023 13:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BDE5E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675080656;
	bh=Zg6MguSNDaqbB/z5cJmHX/RzGSEZnrDsEwnqwyBRCy8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vt185bixGd+MtquEwlqjyM3O39D4ZKloB48nLKjyEikhstIy91Uzn+0z9vua2IjL+
	 NWmikVFRWO9FBJsa01xkk31peXDIlIovavBTUGwijLOnCHD4wquNK5D9PW7ksb0gHN
	 58Z9f/JPZBebq9xBn2VgBpgcuu38iRISz88dNXwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80DA9F8057A;
	Mon, 30 Jan 2023 13:08:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5666DF8057A; Mon, 30 Jan 2023 13:08:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68042F80568
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 13:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68042F80568
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=jt22owD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675080478; x=1706616478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zg6MguSNDaqbB/z5cJmHX/RzGSEZnrDsEwnqwyBRCy8=;
 b=jt22owD95gqejj32VqWnA0l8zahAHFAGhA9SW52lo6JnKxjQmGSJ41C6
 BSsZekVU/DKgqvbXTUGci4AHbNGmFVxmdgpNysdaJVACu65ZYXUa274B2
 S1TY1jRldGOAkcm3gr1tIhScs4vWLXRbpqtaFDEGWX/WvZ5Ssp0NAisH2
 ztTqnHuTL9EUwsAN8jauHsJTqICemle5/YULNDhOdNhiouDqGWEAXLrb4
 Qf1UOByQ1G1QMw8DQtrCfZDsfI1uhXeRzYzpu/lHwhwI2LW1/FJpWCRKm
 heuz1JxJmvDne2FfyRgKngPrYiSL6O6XK+CiGLtap5sEeCL16J158pb+p w==;
X-IronPort-AV: E=Sophos;i="5.97,257,1669100400"; d="scan'208";a="198544941"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2023 05:07:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 05:07:52 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 05:07:48 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 8/8] ASoC: mchp-spdifrx: document data structures
Date: Mon, 30 Jan 2023 14:06:47 +0200
Message-ID: <20230130120647.638049-9-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120647.638049-1-claudiu.beznea@microchip.com>
References: <20230130120647.638049-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document data structures used by mchp-spdifrx driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 796d4ec2b2b1..dab5d93de329 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -249,16 +249,34 @@ static const struct regmap_config mchp_spdifrx_regmap_config = {
 
 #define SPDIFRX_CHANNELS	2
 
+/**
+ * struct mchp_spdifrx_ch_stat: MCHP SPDIFRX channel status
+ * @data: channel status bits
+ * @done: completion to signal channel status bits acquisition done
+ */
 struct mchp_spdifrx_ch_stat {
 	unsigned char data[SPDIFRX_CS_BITS / 8];
 	struct completion done;
 };
 
+/**
+ * struct mchp_spdifrx_user_data: MCHP SPDIFRX user data
+ * @data: user data bits
+ * @done: completion to signal user data bits acquisition done
+ */
 struct mchp_spdifrx_user_data {
 	unsigned char data[SPDIFRX_UD_BITS / 8];
 	struct completion done;
 };
 
+/**
+ * struct mchp_spdifrx_mixer_control: MCHP SPDIFRX mixer control data structure
+ * @ch_stat: array of channel statuses
+ * @user_data: array of user data
+ * @ulock: ulock bit status
+ * @badf: badf bit status
+ * @signal: signal bit status
+ */
 struct mchp_spdifrx_mixer_control {
 	struct mchp_spdifrx_ch_stat ch_stat[SPDIFRX_CHANNELS];
 	struct mchp_spdifrx_user_data user_data[SPDIFRX_CHANNELS];
@@ -267,6 +285,17 @@ struct mchp_spdifrx_mixer_control {
 	bool signal;
 };
 
+/**
+ * struct mchp_spdifrx_dev: MCHP SPDIFRX device data structure
+ * @capture: DAI DMA configuration data
+ * @control: mixer controls
+ * @mlock: mutex to protect concurency b/w configuration and control APIs
+ * @dev: struct device
+ * @regmap: regmap for this device
+ * @pclk: peripheral clock
+ * @gclk: generic clock
+ * @trigger_enabled: true if enabled though trigger() ops
+ */
 struct mchp_spdifrx_dev {
 	struct snd_dmaengine_dai_dma_data	capture;
 	struct mchp_spdifrx_mixer_control	control;
-- 
2.34.1

