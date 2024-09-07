Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E196FEA8
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2024 02:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449B9AE8;
	Sat,  7 Sep 2024 02:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449B9AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725668206;
	bh=gkPEigLMTWUGAx6VsLdundaGMjqNVqS65oX9hyU3sBU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B02c5p0fMLYWAReLxef0v6rDkSZg8dQcFqgdpp5qED9vpJNWVCx199VyfpYIBhmaF
	 52HvbPrF8wnpYdGw3GY/Kqzw1xvJOeqP5GJUP1YB38UWXr0Y7BJC9nRHG5cZ7xBcDI
	 B8dJTrrDK6h1g3NrlpHUAdLb8SXqJCVxXKCFlGtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A336AF805B3; Sat,  7 Sep 2024 02:16:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C74A7F805B1;
	Sat,  7 Sep 2024 02:16:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1701F8016C; Sat,  7 Sep 2024 02:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A85AF80107
	for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2024 02:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A85AF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=HwuvbIsH
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4870FvA9089500;
	Fri, 6 Sep 2024 19:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725668157;
	bh=HUZgT9X7GWHEPsPLf6n/anCxkM0/wa5mrWbzyuPdTxM=;
	h=From:To:CC:Subject:Date;
	b=HwuvbIsHJCwpYrjJauY4hJsMf3yP1yZ3PkZoKEgpWhhs8za9gTu6ssgG0qDNqSlQS
	 h8iWC34TnwOTY25ASAl6qnjQPJFQY7P7cGuATPgOjQq0fLccgUZQcz/o3F0hgswYuu
	 ZBeq8L+ISPtpXaO/o2F9cZKaXrKiOfGN3CdZit2I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4870FvUh065533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Sep 2024 19:15:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 19:15:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 19:15:57 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.161])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4870FkoX017869;
	Fri, 6 Sep 2024 19:15:47 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>, <jim.shil@goertek.com>,
        <jeep.wang@goertek.com>, <will-wang@ti.com>,
        Shenghao
 Ding <shenghao-ding@ti.com>
Subject: [PATCH] ASoC: tas2781: fix to save the dsp bin file name into the
 correct array in case name_prefix is not NULL
Date: Sat, 7 Sep 2024 08:15:36 +0800
Message-ID: <20240907001540.944-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: 4GNAH25JLWMTIS3OKK4XAF2CO77O4SBR
X-Message-ID-Hash: 4GNAH25JLWMTIS3OKK4XAF2CO77O4SBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GNAH25JLWMTIS3OKK4XAF2CO77O4SBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

fix to save the dsp bin file name into the correct array, coef_binaryname,
instead of rca_binaryname, in case name_prefix is not NULL.

Fixes: 55f0a1fa6ea4 ("ASoC: tas2781: Add name_prefix as the prefix name of DSP firmwares and calibrated data files")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 59fcce7fef7b..3bc10d615fd3 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -498,7 +498,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	 */
 	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
 	if (tas_priv->name_prefix)
-		scnprintf(tas_priv->rca_binaryname, 64, "%s-%s_coef.bin",
+		scnprintf(tas_priv->coef_binaryname, 64, "%s-%s_coef.bin",
 			tas_priv->name_prefix, tas_priv->dev_name);
 	else
 		scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
-- 
2.34.1

