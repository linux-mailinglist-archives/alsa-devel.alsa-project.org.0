Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5558F8053A9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 12:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970D483A;
	Tue,  5 Dec 2023 12:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970D483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701777488;
	bh=ZJmmgGQj4jAV3KYH5fYtmjQVep9d62adk4MBhOi7Ru8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=daoHITRf7+f/VJNDyQ8SMzUeKhgj0oAOjuoTi42jILrdTp32wS2a8PFN1PrDGrYw+
	 7j9+3a7Kz+vz5EvxUe4ejjZiUhSn5+3gHOceqOuRU2wSkC6Zw/ZyTXAQZzFs3qf5wa
	 Fkic65nOFfSs45tqn2y2ZcKUJUop0zsejTnf9f1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D895FF8057D; Tue,  5 Dec 2023 12:57:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EEAAF80578;
	Tue,  5 Dec 2023 12:57:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AA3DF8024E; Tue,  5 Dec 2023 12:57:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98287F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 12:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98287F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ncowCnTr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B56Q8Dw003885;
	Tue, 5 Dec 2023 05:57:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=z
	DLALbyZh6I9uDhyNX6OYJI2uOcXDuFhbmIPNGNpiVI=; b=ncowCnTrliqfTm/9b
	lYMjhAOJCxU9R2sAkT61P+SWCM48oFKkDKnfFrMmUeuK1UKGsU30yqAv03+XpfCQ
	rnv+JPzbCEer5y9/J2upe77KBTywcm5+4McXM0k3Kx9BVolpCeqeqWMpwIfX5xUi
	+xrEdu520dLnPf60EIOvzrvelMNzLvwhFxUkKfb09ZvbaaLVLqYn6nE3OCyuNhbY
	3ocUuc7Lbb1P6ZE7rTao6x3HciCytye1ipbMry9XU0Bxli2nU5k2pkMg927fiD0P
	EMR83jVVpXJKKg5GjhIgDzhT6EE7vMcs/+rgM8ZPCEZiE5RbNhTW4fqxCB3kc98R
	w9b6Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnk6cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 05:57:32 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 11:57:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 11:57:15 +0000
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CD6CC474;
	Tue,  5 Dec 2023 11:57:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
CC: <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <cezary.rojewski@intel.com>,
        <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-mtl-match: Change CS35L56
 prefixes to AMPn
Date: Tue, 5 Dec 2023 11:57:15 +0000
Message-ID: <20231205115715.2460386-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: u_Z-suDzWBBvV_Jjv4TSiVPNc79YICfc
X-Proofpoint-ORIG-GUID: u_Z-suDzWBBvV_Jjv4TSiVPNc79YICfc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 45P5ZMZ2TP6CX2FJ3ALBL3X4CFKIHR53
X-Message-ID-Hash: 45P5ZMZ2TP6CX2FJ3ALBL3X4CFKIHR53
X-MailFrom: prvs=7703294ba3=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45P5ZMZ2TP6CX2FJ3ALBL3X4CFKIHR53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the ALSA prefix for the CS35L56 to "AMPn".

This keeps them consistent with the CS35L56 HDA driver. It also
avoids coding the chip ID into the control name, so that other
Cirrus amps with the same controls can have the same control
names.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 05fe62842804 ("ASoC: Intel: soc-acpi-intel-mtl-match: add acpi match table for cdb35l56-eight-c")
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index f2c17cee1a5d..feb12c6c85d1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -352,13 +352,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 		.adr = 0x00013701FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
-		.name_prefix = "cs35l56-8"
+		.name_prefix = "AMP8"
 	},
 	{
 		.adr = 0x00013601FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_3_endpoint,
-		.name_prefix = "cs35l56-7"
+		.name_prefix = "AMP7"
 	}
 };
 
@@ -367,13 +367,13 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
 		.adr = 0x00023301FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
-		.name_prefix = "cs35l56-1"
+		.name_prefix = "AMP1"
 	},
 	{
 		.adr = 0x00023201FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_2_endpoint,
-		.name_prefix = "cs35l56-2"
+		.name_prefix = "AMP2"
 	}
 };
 
-- 
2.30.2

