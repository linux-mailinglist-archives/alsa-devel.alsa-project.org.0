Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574064A4FE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 17:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB36A2A2A;
	Mon, 12 Dec 2022 17:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB36A2A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670863110;
	bh=5xjzRZVtRE1cVlsbZZS0eIcjhBI2JgzIzQmwqEVYM3I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X9CeKKpHbelKmtJ7FWeiHbL8ydFQQgAKwAywOR8y41uB+R53yEC8DM5+suzPcHoRZ
	 2SmbhjlBo3epWEq4eM9LY6EBM6r6DTPDtBt3ZhaQwM1f5c2ZeMU+rPmnG/OqUKT35w
	 osIHPnGBZTjKXBA3bP7MFg+iGRltl0HnNonjx6vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A09FF80535;
	Mon, 12 Dec 2022 17:36:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923BFF80533; Mon, 12 Dec 2022 17:36:53 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E3CFF80518
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 17:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E3CFF80518
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=J/nhqMfo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670863012; x=1702399012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5xjzRZVtRE1cVlsbZZS0eIcjhBI2JgzIzQmwqEVYM3I=;
 b=J/nhqMfoX0sD/03JR4YbBPbPjLdrcZehDqN9gDBewGovABQyHgQQsizB
 fY03VVs5QtZ5WuljWA82Ly8Gi2hVJu+6p+DdjEafvIcsh1G2a6KcgU3VU
 3LZpyee2qA+2RtzsfGB3xds5pHbgRFRGunS1cJjLRXSJwyR14K83d7ASU
 D2cLMAIqIu/tvXoUwpqDiP66yB5yEDc+7jDAa/LuXIVQZtXgcLWTzq6eK
 uI9RMlbY0+aYx4/vCdyH5CykuUUeuYlBVUiKy7yGKaJp7jUklsJU1QVox
 3r2UC4N2fxuY+l9mqm/T+P9lrAs9sWckey80s6ESLYiGZoN2bBYBymtVk g==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="192721522"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 09:36:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 09:36:46 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 09:36:43 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 4/4] ASoC: mchp-spdiftx: use FIELD_PREP() where possible
Date: Mon, 12 Dec 2022 18:41:53 +0200
Message-ID: <20221212164153.78677-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221212164153.78677-1-claudiu.beznea@microchip.com>
References: <20221212164153.78677-1-claudiu.beznea@microchip.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use FIELD_PREP() in macro definitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index dc96a6fbf514..20d135c718b0 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -6,6 +6,7 @@
 //
 // Author: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -71,11 +72,11 @@
 
 /* Valid Bits per Sample */
 #define SPDIFTX_MR_VBPS_MASK		GENMASK(13, 8)
-#define SPDIFTX_MR_VBPS(bps)		(((bps) << 8) & SPDIFTX_MR_VBPS_MASK)
+#define SPDIFTX_MR_VBPS(bps)		FIELD_PREP(SPDIFTX_MR_VBPS_MASK, bps)
 
 /* Chunk Size */
 #define SPDIFTX_MR_CHUNK_MASK		GENMASK(19, 16)
-#define SPDIFTX_MR_CHUNK(size)		(((size) << 16) & SPDIFTX_MR_CHUNK_MASK)
+#define SPDIFTX_MR_CHUNK(size)		FIELD_PREP(SPDIFTX_MR_CHUNK_MASK, size)
 
 /* Validity Bits for Channels 1 and 2 */
 #define SPDIFTX_MR_VALID1			BIT(24)
@@ -88,8 +89,7 @@
 
 /* Bytes per Sample */
 #define SPDIFTX_MR_BPS_MASK		GENMASK(29, 28)
-#define SPDIFTX_MR_BPS(bytes) \
-	((((bytes) - 1) << 28) & SPDIFTX_MR_BPS_MASK)
+#define SPDIFTX_MR_BPS(bytes)		FIELD_PREP(SPDIFTX_MR_BPS_MASK, (bytes - 1))
 
 /*
  * ---- Interrupt Enable/Disable/Mask/Status Register (Write/Read-only) ----
-- 
2.34.1

