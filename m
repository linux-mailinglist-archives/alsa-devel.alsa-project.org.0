Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0695ADAB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 08:38:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 480C07F8;
	Thu, 22 Aug 2024 08:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 480C07F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724308692;
	bh=nPKgfotFKLDbmVAVc+aZQQ4bEpJZAzisMXtdVU3FpWU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aT+TK+mPVdNEi9PyRIsR59juE5nCfWaZH/pKiDaTtcWKa29UIqijH15W6ZlSiTSs0
	 7SAu2Ev2oRaDz5B/1B/Wr64Lan4ib14de+v69rI2F+F7DQFYySdstuVBW9EeesCWbK
	 ABwtnERgyf529R58HvCx2Mb8CmTDmu+us5FqN52Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1231F805AE; Thu, 22 Aug 2024 08:37:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C48E7F8025E;
	Thu, 22 Aug 2024 08:37:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C350EF80496; Thu, 22 Aug 2024 08:32:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE4EF80107
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 08:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE4EF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=baN7jF5P
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47M6WM2w107906;
	Thu, 22 Aug 2024 01:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724308342;
	bh=AqoHL/r24I8oadxHmik/PXjQp1018UUmIX4bxtkOubA=;
	h=From:To:CC:Subject:Date;
	b=baN7jF5PVoWB+3ASf7qC3LzFjhJr8PeZYzL+psQznoUCogoBT5+RUuA+Ls7gidH+D
	 urWD/vTFDazxI9PZO22v1+Fe7uSy6gCxKH1aFVQTUggGrGii24HVA0ygJcBHN9PZYO
	 sw/2tWgAAPWjLD5BdDMCrow0Sz42ypgTHPUXD/+g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47M6WMo1098469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Aug 2024 01:32:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Aug 2024 01:32:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Aug 2024 01:32:21 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47M6WBcx121190;
	Thu, 22 Aug 2024 01:32:12 -0500
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
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: mark const variables tas2563_dvc_table as
 __maybe_unused
Date: Thu, 22 Aug 2024 14:32:02 +0800
Message-ID: <20240822063205.662-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: XDONHXTVXYCDTYAKHKMTVQAHQKXFAON3
X-Message-ID-Hash: XDONHXTVXYCDTYAKHKMTVQAHQKXFAON3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDONHXTVXYCDTYAKHKMTVQAHQKXFAON3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In case of tas2781, tas2563_dvc_table will be unused,
so mark it as __maybe_unused.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2563-tlv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/tas2563-tlv.h b/include/sound/tas2563-tlv.h
index faa3e194f73b..bb269b21f460 100644
--- a/include/sound/tas2563-tlv.h
+++ b/include/sound/tas2563-tlv.h
@@ -18,7 +18,7 @@
 static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
 
 /* pow(10, db/20) * pow(2,30) */
-static const unsigned char tas2563_dvc_table[][4] = {
+static const __maybe_unused unsigned char tas2563_dvc_table[][4] = {
 	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
 	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
 	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
-- 
2.34.1

