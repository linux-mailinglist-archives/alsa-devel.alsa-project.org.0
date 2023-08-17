Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAB77F37D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 11:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168F6827;
	Thu, 17 Aug 2023 11:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168F6827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692264880;
	bh=yrL48xpeKtj+DA6H+KVqTYhuL39FRZNm5FE0JViJQ44=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kx4m3UDDZgNGmABodRt4d2E3XW33+rMMCBCdX3k3lhYSrBMyBAkqfN9EiBOOJ9SX3
	 KL4vGlfLNAiVOZxwhRN35XaE/g8pOn9FmKVBSD1WDgC+zK77N/CwcJ0AKREPZoVNVD
	 vzNPUUwdsPKDL+gDcumEWvPSSeUChLfmdevYr5ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9332DF8016D; Thu, 17 Aug 2023 11:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BE2F8016A;
	Thu, 17 Aug 2023 11:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB84AF8016D; Thu, 17 Aug 2023 11:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F3CCF800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 11:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3CCF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=gsir96fW
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37H9X7lX034365;
	Thu, 17 Aug 2023 04:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692264787;
	bh=d2bi7xNYpv55A4isbPGmzxy/NzcyeROLai+rcJ2ZKQU=;
	h=From:To:CC:Subject:Date;
	b=gsir96fWlC7tKz09rwUFsctiJKcq+OXRF6eckgPOlyIn4sxwHt1ptHGwWEczLvmGR
	 8ajcu98YP/s5LI637inxJ0RAvWZCOA56u1vnS5C3DvUCpLLI+NqILDgI9TsnvhAN96
	 KHgc2pYmT3kVvyj/xi6YkrSXj6oXUhstiOrJ7at4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37H9X71I047196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Aug 2023 04:33:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Aug 2023 04:33:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Aug 2023 04:33:07 -0500
Received: from LT5CG31242FY.dhcp.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37H9X0gY101760;
	Thu, 17 Aug 2023 04:33:01 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>
CC: <kevin-lu@ti.com>, <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <mengdong.lin@intel.com>, <baojun.xu@ti.com>,
        <thomas.gfeller@q-drop.com>, <peeyush@ti.com>, <navada@ti.com>,
        <tiwai@suse.de>, <gentuser@gmail.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: fixed register access error when switching
 to other chips
Date: Thu, 17 Aug 2023 17:32:56 +0800
Message-ID: <20230817093257.951-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: I5UROELTAZYDVJZGPBQUFPKFQQLCOYQS
X-Message-ID-Hash: I5UROELTAZYDVJZGPBQUFPKFQQLCOYQS
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5UROELTAZYDVJZGPBQUFPKFQQLCOYQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

fixed register access error when switching to other tas2781 -- refresh the page
inside regmap on the switched tas2781

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Changes in v1:
 - fixed register access error when switching to other tas2781
---
 sound/soc/codecs/tas2781-comlib.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index a88c6c28a394..ffb26e4a7e2f 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -57,16 +57,17 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 
 		if (client->addr != tasdev->dev_addr) {
 			client->addr = tasdev->dev_addr;
-			if (tasdev->cur_book == book) {
-				ret = regmap_write(map,
-					TASDEVICE_PAGE_SELECT, 0);
-				if (ret < 0) {
-					dev_err(tas_priv->dev, "%s, E=%d\n",
-						__func__, ret);
-					goto out;
-				}
+			/* All tas2781s share the same regmap, clear the page
+			 * inside regmap once switching to another tas2781.
+			 * Register 0 at any pages and any books inside tas2781
+			 * is the same one for page-switching.
+			 */
+			ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
+			if (ret < 0) {
+				dev_err(tas_priv->dev, "%s, E=%d\n",
+					__func__, ret);
+				goto out;
 			}
-			goto out;
 		}
 
 		if (tasdev->cur_book != book) {
-- 
2.34.1

