Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A8AF925B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jul 2025 14:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CADD160224;
	Fri,  4 Jul 2025 14:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CADD160224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751631439;
	bh=xcaAV4fgHILHGbeXPuCYVyWzm4CjE9OTYgdu4iXec/w=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=agG9VsoejPXGWF/kYoGjR5RBrBQ+0r7sBDQLZR2OIAyloP56S/U0HoWTyVD+c+C57
	 wSTMWUrAEzVPArvUBhgWY4rw7A9eaD2syY43Bb3CRpxQYt+87zCtoPydjReDP3cDlp
	 Dr1uUg5aQ3LMgJEBQz6ihJEARxZXQOG/EkoO9abs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FBAFF805F2; Fri,  4 Jul 2025 14:16:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C94F805E2;
	Fri,  4 Jul 2025 14:16:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9830FF80424; Thu,  3 Jul 2025 02:12:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4194FF80038
	for <alsa-devel@alsa-project.org>; Thu,  3 Jul 2025 02:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4194FF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ACBwzBDs
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56306flX4061309;
	Wed, 2 Jul 2025 19:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751501201;
	bh=zTShQvNmYJsUbdqrutBggdEFTR1g+rS+ikJtmUsfF60=;
	h=From:To:CC:Subject:Date;
	b=ACBwzBDsLK/nxNfHEcv2fQdi6OiJJjVzof6WNTafSjEVQbZZT+NrcM4HEgrE9dVoh
	 +9qg0wgtKESB4XyZkGOM63Whp++YJtDaBKx6NYLHglvEENV8mqXtG70Yf4BOQRHqfu
	 2w7ta5irKRaR0FCNQ5UiqM/NnFUdN6vEWmAln1FU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56306fCv1313797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 19:06:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 19:06:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 19:06:41 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56306ZSx4057921;
	Wed, 2 Jul 2025 19:06:36 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
 <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
Date: Thu, 3 Jul 2025 08:06:08 +0800
Message-ID: <20250703000608.20815-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CSGGHMWNNPEBXD7BRNDKKVG7AYREKOGT
X-Message-ID-Hash: CSGGHMWNNPEBXD7BRNDKKVG7AYREKOGT
X-Mailman-Approved-At: Fri, 04 Jul 2025 12:16:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSGGHMWNNPEBXD7BRNDKKVG7AYREKOGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device name start from bus name, as we use strstarts()
to do compare, need add it for TXNW2781 device.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index b9cdbca95..530c2266a 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -588,7 +588,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	} else if (strstarts(dev_name(&clt->dev),
-			     "TXNW2781:00-tas2781-hda.0")) {
+			     "i2c-TXNW2781:00-tas2781-hda.0")) {
 		device_name = "TXNW2781";
 		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
-- 
2.43.0

