Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AEAB4F9CA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:12:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B8460252;
	Tue,  9 Sep 2025 14:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B8460252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419947;
	bh=ASrD2JtGMf05hPofucsns7C4b7WHIdf5F7xA4oDrF4w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R6UvlJ7oawjjYpZvebe8K7PLFj82Nkb7P9mbQJP6/its51CdkrVdXXk+kbCeDyPqU
	 g0Cj8JBy2nRHI7W7tipAwa4+/0oIadmvulnbjrclpyZbfbWCMfLA674UMf91cdKQDQ
	 dV/Whok7G9fPziy0IG+SV2puLfbcV4zD4tc6qMwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E26DCF80603; Tue,  9 Sep 2025 14:11:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 240C3F80619;
	Tue,  9 Sep 2025 14:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D621F8058C; Mon,  1 Sep 2025 07:12:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 82D79F804FF
	for <alsa-devel@alsa-project.org>; Mon,  1 Sep 2025 07:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D79F804FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=x/6KB+5I
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5815CFaA2730454;
	Mon, 1 Sep 2025 00:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756703535;
	bh=QFqeAu2Zwav9G75HW6VtxbePyYQ8XhiYZgfrxthpelo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x/6KB+5I2fjnnMMxvICuTg2QhxhZubFfCwE4rwVCMqJqFC0w+cAd0kMBbvqV+Fsfn
	 OgcyUTl2mF8S2eHEuUrqBrJl3bST1OIoEsnAmt/soIenOU6i+zzQcty1hyvZxbgoGe
	 ckZYgVgm17Gdiba6H6Z5DowaraiA7n73VQDL38yc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5815CFB11302446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 00:12:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 00:12:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 00:12:14 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5815BvJB1628562;
	Mon, 1 Sep 2025 00:12:10 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 3/4] ASoc: tas2783A: add machine driver changes
Date: Mon, 1 Sep 2025 10:41:42 +0530
Message-ID: <20250901051144.1112-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250901051144.1112-1-niranjan.hy@ti.com>
References: <20250901051144.1112-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JJTFIDAMSVXJGN6GKRUVL57R5HVN7F6E
X-Message-ID-Hash: JJTFIDAMSVXJGN6GKRUVL57R5HVN7F6E
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:11:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJTFIDAMSVXJGN6GKRUVL57R5HVN7F6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add tas2783-codec for codec_info

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 38 +++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 1580331cd34c..56c72ef27e7b 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -35,12 +35,12 @@ static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-static const struct snd_soc_dapm_widget maxim_widgets[] = {
+static const struct snd_soc_dapm_widget lr_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_kcontrol_new maxim_controls[] = {
+static const struct snd_kcontrol_new lr_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
@@ -58,6 +58,24 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.part_id = 0x0000, /* TAS2783A */
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "tas2783-codec",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_ti_amp_init,
+				.rtd_init = asoc_sdw_ti_spk_rtd_init,
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x700,
 		.dais = {
@@ -450,10 +468,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_maxim_init,
 				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -469,10 +487,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_maxim_init,
 				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
+				.controls = lr_spk_controls,
+				.num_controls = ARRAY_SIZE(lr_spk_controls),
+				.widgets = lr_spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
 			},
 		},
 		.dai_num = 1,
-- 
2.25.1

