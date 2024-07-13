Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100493031C
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2024 03:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BB5DFA;
	Sat, 13 Jul 2024 03:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BB5DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720835579;
	bh=tUHBoPpfwV9ww3Rg+vE6njqj2/QAGGdRe8bvcD3tA/E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F8RTqj5PS12QcVdlxbsTc9S1fW1tXFZpiwTuOA12lvfW1zEFT4+bXQpYUk0Nh62eB
	 SDyJ9BG0zccTc9DIrbBDHZi0BiO+ZMvgSX4pmC2pwmMO+26JJ1+2cpw6Ddx+s5mGOy
	 a9RUShpT+K1rGeDIEX2CT36CBvC97N0G0Vdechco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45FF0F80589; Sat, 13 Jul 2024 03:52:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3ABCF805AF;
	Sat, 13 Jul 2024 03:52:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F4EDF801F5; Sat, 13 Jul 2024 03:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B23EF800FE
	for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2024 03:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B23EF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Bjw85pRI
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46D1q1Hx048968;
	Fri, 12 Jul 2024 20:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720835521;
	bh=XCsCoUbllZWzfU40ldOwwVYbrbFWnPwTlY//EdX4WEE=;
	h=From:To:CC:Subject:Date;
	b=Bjw85pRIyyk0Ylb77/9m16gYMU59GtJoN+XE9xJ/VFpasvBAQrsZbkn955a3aJBZ8
	 cYxILH80jwWjoIvS1+F11J+z3sHPngzl42lxONrFceFG83RZE0O9vkR1UNWvxMiVj0
	 jMs5YnkHiIxAqEhbKAcL7VVFXMZZ4i2TvAZ1oMHs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46D1q03n012395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Jul 2024 20:52:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jul 2024 20:52:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jul 2024 20:52:00 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.245])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46D1pnOr126053;
	Fri, 12 Jul 2024 20:51:50 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1 1/2] ASoc: tas2781: Add TAS2563 into the Header
Date: Sat, 13 Jul 2024 09:51:41 +0800
Message-ID: <20240713015145.314-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: OYEJP5MRCXWJPU7DXVGSDHICPOUYHPHT
X-Message-ID-Hash: OYEJP5MRCXWJPU7DXVGSDHICPOUYHPHT
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYEJP5MRCXWJPU7DXVGSDHICPOUYHPHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add TAS2563 into the Header in case of misunderstanding.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add TAS2563 into the Header
 - Add channel no into the log for error debug
---
 sound/soc/codecs/tas2781-comlib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 1fbf4560f5cc..58abbc098a91 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// TAS2781 Common functions for HDA and ASoC Audio drivers
+// TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers
 //
 // Copyright 2023 - 2024 Texas Instruments, Inc.
 //
@@ -64,8 +64,8 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 			 */
 			ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
 			if (ret < 0) {
-				dev_err(tas_priv->dev, "%s, E=%d\n",
-					__func__, ret);
+				dev_err(tas_priv->dev, "%s, E=%d channel:%d\n",
+					__func__, ret, chn);
 				goto out;
 			}
 		}
-- 
2.34.1

