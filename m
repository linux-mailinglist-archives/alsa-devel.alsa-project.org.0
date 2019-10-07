Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF8CEA4C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 19:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620E186E;
	Mon,  7 Oct 2019 19:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620E186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570468367;
	bh=HnzE3r2Hm3JuiPxMPffhftQ+Zs8lMdgfvPcKGdBzpow=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdECO6luPrLdUSqIkCwBtHtXIWsq+2xzFnR4HEn2dwZtBBgHYtd9hYeHC68YmaonD
	 lHfeUdOn0TgR5jATDyuR6f8Dp5FKXOp2PzDJCLIEXSoyMlIQaVj/dOoESM9gewKlHO
	 +Iz8yj1tGvCRS4PHu5Ii5wIAlbpQSFhpUV+QUhiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01CC6F805FD;
	Mon,  7 Oct 2019 19:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A071CF80323; Mon,  7 Oct 2019 19:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FB7AF802BE
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 19:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB7AF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ss1qvHOt"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97H9HDV034666;
 Mon, 7 Oct 2019 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570468157;
 bh=qqvkpyb/zkfTPkxgRMnn6l/UTJ4GrNMbr9o3D9e32hE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ss1qvHOtn/k3L5BBiwEn+HG2R0xjf3yJP3LNZiNpgbp7011gHXPKoYeQpIEPEt/6I
 7Nz2VGN3FXe8mKAfXJQKpLZWH2wey5puHCybYHtBKCoyhvabHURK3STkStGToinHlJ
 xdUnMlu+cIMwK7kFYBGG/8dfH5odZRTISmh3VeSA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H9Hww083178;
 Mon, 7 Oct 2019 12:09:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 12:09:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 12:09:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H9G9s118747;
 Mon, 7 Oct 2019 12:09:16 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <shifu0704@thundersoft.com>, <broonie@kernel.org>
Date: Mon, 7 Oct 2019 12:11:57 -0500
Message-ID: <20191007171157.17813-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191007171157.17813-1-dmurphy@ti.com>
References: <20191007171157.17813-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, navada@ti.com,
 Dan Murphy <dmurphy@ti.com>
Subject: [alsa-devel] [PATCH v2 3/3] ASoc: tas2770: Remove unused defines
	and variables
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

Remove unused defines and structure variables that are not
referenced by the code.  If these are needed for future
enhancements then they should be added at that time.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - New patch no v1

 sound/soc/codecs/tas2770.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index d597a8280707..cbb858369fe6 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -125,40 +125,19 @@
 #define ERROR_UNDER_VOLTAGE 0x0000008
 #define ERROR_BROWNOUT      0x0000010
 #define ERROR_CLASSD_PWR    0x0000020
-#define TAS2770_SLOT_16BIT  16
-#define TAS2770_SLOT_32BIT  32
-#define TAS2770_I2C_RETRY_COUNT      3
-
-struct tas2770_register {
-	int book;
-	int page;
-	int reg;
-};
-
-struct tas2770_dai_cfg {
-	unsigned int dai_fmt;
-	unsigned int tdm_delay;
-};
 
 struct tas2770_priv {
 	struct device *dev;
 	struct regmap *regmap;
-	struct snd_soc_codec *codec;
 	struct snd_soc_component *component;
-	struct mutex dev_lock;
-	struct hrtimer mtimer;
 	int power_state;
 	int asi_format;
 	struct gpio_desc *reset_gpio;
 	int sampling_rate;
-	int frame_size;
 	int channel_size;
 	int slot_width;
 	int v_sense_slot;
 	int i_sense_slot;
-	bool runtime_suspend;
-	unsigned int err_code;
-	struct mutex codec_lock;
 };
 
 #endif /* __TAS2770__ */
-- 
2.22.0.214.g8dca754b1e

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
