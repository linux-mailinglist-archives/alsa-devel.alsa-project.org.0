Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0B241EC0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 18:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FBC1667;
	Tue, 11 Aug 2020 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FBC1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597165162;
	bh=ddTf7pBqce+Gw8FU4fRMr6xexrWkEn03ctH9iqu2q2s=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIreeLHQTqD60/HO4FD9SYJvy9S41az/pAHO34aOYvSvUgRZlZEn2E05c2g3fEeE1
	 leR/erSc4nrWjKApc9+SAp9x5Pa3Z0u64/1HsCIykGQTEFzgEWo/c5A3klMTfOy0+M
	 wx3J6IIUyI3JVTmEydW/B+2sgXJ57eNTRmfZdlQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB2D1F80118;
	Tue, 11 Aug 2020 18:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B1FF801A3; Tue, 11 Aug 2020 18:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,FROM_WORDY,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA442F8014C
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA442F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="HDKlERFU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nwr4KZgUZGWZViAVN7S8TI4PoESYn8lgdPoLqT2768Y0UEOGJYg61IJ7wAu0IoPhcNnSp7rFz58Rz8KBaSKRDT9TOrT4pJEW1akzeYXWEDTt0bxkx4xrgrAxnYZERVx40kpBtb1TUZXsdPL8B3i/EU7zGIkA/xz4szhGYpIqKug2J6Iq2r0USqGayBQl4adrgD9bDGH6YcTNmu8oJ9q5PfEBwsXA05MnSJuH8ScxfGt+8kHsI968jlZI2XmN/hdSDuGx32ye/PeO7jMDOceySzF49yJr89sZGIMD0RY8p7DviPTgCwyfuN6hUMKwlCr/IJV/q9k6nFyq9Jer2JDBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF9EcLxD1hz4JHRjWWbm7O1KzgQzRYAqlH+/+v+HmfE=;
 b=mwySn27/Y6DNXlrbup8JNufjnC+utBgX1BlPBRd38FNUUGe1pI7UmXIUn9aPJqpOrm6a1QJ2I6QudMdn7svgkqSmnSbEsTGLGIwvtKyKZjH6hjP+qr9EQPbla3yiNcI177jtQD5ZtojcyT0b43XHoPgAjD0rOoRzpLh0551tx1bCW+8MxCLOpa26qS4Pr8IT9QRbffswj5Q2iq3nqYM3nSiKak/usVwdLf+xXLvaIn6gsm8hiqpADJekbhhZdVJl/SluEunH9tNLX2qTxHy7fEKCh5EVJ8iv+Wx23C1NP5W5XQEXCZ2G5EDgtcx7SQHlkRz75iv48PKYMghltzfDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 193.240.239.45) smtp.rcpttodomain=perex.cz smtp.mailfrom=diasemi.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=diasemi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF9EcLxD1hz4JHRjWWbm7O1KzgQzRYAqlH+/+v+HmfE=;
 b=HDKlERFUh7H7gi2D+55yfoj5ChsrWbVltbWICfSl7BLzvEbwR4va6zOjTi0Z3f6eqaZgLMcUWxVMQ4lh3t/LZrjFhaYwnJs+7RAxWrKI7xv27M97hZWJ9XRrWUg7wA/zb1vF+izbvVux8C6DDLVeWkbh0r4z380acLvTSI5gFSA=
Received: from AM6PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:6e::36)
 by DB6PR1001MB1015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:65::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Tue, 11 Aug
 2020 16:57:26 +0000
Received: from HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::83) by AM6PR02CA0023.outlook.office365.com
 (2603:10a6:20b:6e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Tue, 11 Aug 2020 16:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 193.240.239.45) smtp.mailfrom=diasemi.com; perex.cz; dkim=none (message not
 signed) header.d=none;perex.cz; dmarc=fail action=none
 header.from=diasemi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 diasemi.com discourages use of 193.240.239.45 as permitted sender)
Received: from mailrelay1.diasemi.com (193.240.239.45) by
 HE1EUR02FT053.mail.protection.outlook.com (10.152.11.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3261.16 via Frontend Transport; Tue, 11 Aug 2020 16:57:26 +0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 11 Aug 2020 18:57:23 +0200
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22379)	id
 C53E13FB96; Tue, 11 Aug 2020 17:57:23 +0100 (BST)
Message-ID: <7a9a2ead6e37820a6025c0a62dc45952d5032ab7.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
In-Reply-To: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Tue, 11 Aug 2020 17:57:23 +0100
Subject: [PATCH 1/3] ASoC: da7219: Move required devm_* allocations to device
 level code
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bbd5ac6-b942-4bbe-3e6a-08d83e17a013
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1015:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB101512C6F1E1B1D82F8910DEA7450@DB6PR1001MB1015.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzO7zrVRFuispZdXo+lttTAjt9TrTAaIU7Fn20eTWIkon6DIBTlo7TiTAlHXxh2zpQ8h0OHkFbaoO/cRYITELxbjw1pxOQ1tT9dZUxVrPG9pRBNbLdmc5N/UYvMbfV3QVysWKnkvA7raCwjVluRX++CwRuvlIghBPDmS3hLAX9tglXH4EY7LciWb6XH85fjzqML8PzYAxTxepJGkRou327Lods2nHSuk0AjSMoJ2gq9DE+C/wYvE6GbRjU6S8p4r+rVI7gKEmlx+M50Kv/exo5rbaxTTQpQo98Ewl6fHQl5/eJaWdYS/cxtGtBpWGhwDtDRS3xBYsIxmYipnuDo0FLRqI5IsAyZ2ngT2EUr+FQFf37jEx36Th1+ogdxIPahXFKfEUFDd8IgdACSQzY3mmKdpJmbrb8PeJtBbRT9Mu9U0pcFla9Htu7nHG347fQwJw6/YyGY0KwB43yMe3Ev0AA==
X-Forefront-Antispam-Report: CIP:193.240.239.45; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailrelay1.diasemi.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFTY:;
 SFS:(4636009)(39850400004)(136003)(376002)(346002)(396003)(46966005)(26005)(82310400002)(83380400001)(70586007)(186003)(54906003)(107886003)(70206006)(356005)(81166007)(33310700002)(82740400003)(2906002)(47076004)(36756003)(6266002)(8936002)(110136005)(36906005)(86362001)(30864003)(42186006)(5660300002)(4326008)(316002)(426003)(478600001)(336012)(2616005)(8676002)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 16:57:26.0822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbd5ac6-b942-4bbe-3e6a-08d83e17a013
X-MS-Exchange-CrossTenant-Id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=511e3c0e-ee96-486e-a2ec-e272ffa37b7c; Ip=[193.240.239.45];
 Helo=[mailrelay1.diasemi.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1015
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Yong Zhi <yong.zhi@intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In preparation for cleanup of device level and codec level probe
funcitonality, all necessary devm_* allocations and fw retrieval
functions are moved to the I2C probe level code.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 sound/soc/codecs/da7219-aad.c | 85 +++++++++++++++++++++++++------------------
 sound/soc/codecs/da7219-aad.h |  3 ++
 sound/soc/codecs/da7219.c     | 30 ++++++++-------
 3 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 4f2a96e..3827734 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -460,7 +460,7 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
  */
 
 static enum da7219_aad_micbias_pulse_lvl
-	da7219_aad_fw_micbias_pulse_lvl(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_micbias_pulse_lvl(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 2800:
@@ -468,13 +468,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 2900:
 		return DA7219_AAD_MICBIAS_PULSE_LVL_2_9V;
 	default:
-		dev_warn(component->dev, "Invalid micbias pulse level");
+		dev_warn(dev, "Invalid micbias pulse level");
 		return DA7219_AAD_MICBIAS_PULSE_LVL_OFF;
 	}
 }
 
 static enum da7219_aad_btn_cfg
-	da7219_aad_fw_btn_cfg(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_btn_cfg(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 2:
@@ -492,13 +492,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 500:
 		return DA7219_AAD_BTN_CFG_500MS;
 	default:
-		dev_warn(component->dev, "Invalid button config");
+		dev_warn(dev, "Invalid button config");
 		return DA7219_AAD_BTN_CFG_10MS;
 	}
 }
 
 static enum da7219_aad_mic_det_thr
-	da7219_aad_fw_mic_det_thr(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_mic_det_thr(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 200:
@@ -510,13 +510,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 1000:
 		return DA7219_AAD_MIC_DET_THR_1000_OHMS;
 	default:
-		dev_warn(component->dev, "Invalid mic detect threshold");
+		dev_warn(dev, "Invalid mic detect threshold");
 		return DA7219_AAD_MIC_DET_THR_500_OHMS;
 	}
 }
 
 static enum da7219_aad_jack_ins_deb
-	da7219_aad_fw_jack_ins_deb(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_jack_ins_deb(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 5:
@@ -536,13 +536,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 1000:
 		return DA7219_AAD_JACK_INS_DEB_1S;
 	default:
-		dev_warn(component->dev, "Invalid jack insert debounce");
+		dev_warn(dev, "Invalid jack insert debounce");
 		return DA7219_AAD_JACK_INS_DEB_20MS;
 	}
 }
 
 static enum da7219_aad_jack_det_rate
-	da7219_aad_fw_jack_det_rate(struct snd_soc_component *component, const char *str)
+	da7219_aad_fw_jack_det_rate(struct device *dev, const char *str)
 {
 	if (!strcmp(str, "32ms_64ms")) {
 		return DA7219_AAD_JACK_DET_RATE_32_64MS;
@@ -553,13 +553,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	} else if (!strcmp(str, "256ms_512ms")) {
 		return DA7219_AAD_JACK_DET_RATE_256_512MS;
 	} else {
-		dev_warn(component->dev, "Invalid jack detect rate");
+		dev_warn(dev, "Invalid jack detect rate");
 		return DA7219_AAD_JACK_DET_RATE_256_512MS;
 	}
 }
 
 static enum da7219_aad_jack_rem_deb
-	da7219_aad_fw_jack_rem_deb(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_jack_rem_deb(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 1:
@@ -571,13 +571,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 20:
 		return DA7219_AAD_JACK_REM_DEB_20MS;
 	default:
-		dev_warn(component->dev, "Invalid jack removal debounce");
+		dev_warn(dev, "Invalid jack removal debounce");
 		return DA7219_AAD_JACK_REM_DEB_1MS;
 	}
 }
 
 static enum da7219_aad_btn_avg
-	da7219_aad_fw_btn_avg(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_btn_avg(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 1:
@@ -589,13 +589,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 8:
 		return DA7219_AAD_BTN_AVG_8;
 	default:
-		dev_warn(component->dev, "Invalid button average value");
+		dev_warn(dev, "Invalid button average value");
 		return DA7219_AAD_BTN_AVG_2;
 	}
 }
 
 static enum da7219_aad_adc_1bit_rpt
-	da7219_aad_fw_adc_1bit_rpt(struct snd_soc_component *component, u32 val)
+	da7219_aad_fw_adc_1bit_rpt(struct device *dev, u32 val)
 {
 	switch (val) {
 	case 1:
@@ -607,14 +607,13 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	case 8:
 		return DA7219_AAD_ADC_1BIT_RPT_8;
 	default:
-		dev_warn(component->dev, "Invalid ADC 1-bit repeat value");
+		dev_warn(dev, "Invalid ADC 1-bit repeat value");
 		return DA7219_AAD_ADC_1BIT_RPT_1;
 	}
 }
 
-static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct snd_soc_component *component)
+static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct device *dev)
 {
-	struct device *dev = component->dev;
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct fwnode_handle *aad_np;
 	struct da7219_aad_pdata *aad_pdata;
@@ -634,7 +633,7 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct snd_soc_component
 	if (fwnode_property_read_u32(aad_np, "dlg,micbias-pulse-lvl",
 				     &fw_val32) >= 0)
 		aad_pdata->micbias_pulse_lvl =
-			da7219_aad_fw_micbias_pulse_lvl(component, fw_val32);
+			da7219_aad_fw_micbias_pulse_lvl(dev, fw_val32);
 	else
 		aad_pdata->micbias_pulse_lvl = DA7219_AAD_MICBIAS_PULSE_LVL_OFF;
 
@@ -643,31 +642,31 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct snd_soc_component
 		aad_pdata->micbias_pulse_time = fw_val32;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,btn-cfg", &fw_val32) >= 0)
-		aad_pdata->btn_cfg = da7219_aad_fw_btn_cfg(component, fw_val32);
+		aad_pdata->btn_cfg = da7219_aad_fw_btn_cfg(dev, fw_val32);
 	else
 		aad_pdata->btn_cfg = DA7219_AAD_BTN_CFG_10MS;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,mic-det-thr", &fw_val32) >= 0)
 		aad_pdata->mic_det_thr =
-			da7219_aad_fw_mic_det_thr(component, fw_val32);
+			da7219_aad_fw_mic_det_thr(dev, fw_val32);
 	else
 		aad_pdata->mic_det_thr = DA7219_AAD_MIC_DET_THR_500_OHMS;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,jack-ins-deb", &fw_val32) >= 0)
 		aad_pdata->jack_ins_deb =
-			da7219_aad_fw_jack_ins_deb(component, fw_val32);
+			da7219_aad_fw_jack_ins_deb(dev, fw_val32);
 	else
 		aad_pdata->jack_ins_deb = DA7219_AAD_JACK_INS_DEB_20MS;
 
 	if (!fwnode_property_read_string(aad_np, "dlg,jack-det-rate", &fw_str))
 		aad_pdata->jack_det_rate =
-			da7219_aad_fw_jack_det_rate(component, fw_str);
+			da7219_aad_fw_jack_det_rate(dev, fw_str);
 	else
 		aad_pdata->jack_det_rate = DA7219_AAD_JACK_DET_RATE_256_512MS;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,jack-rem-deb", &fw_val32) >= 0)
 		aad_pdata->jack_rem_deb =
-			da7219_aad_fw_jack_rem_deb(component, fw_val32);
+			da7219_aad_fw_jack_rem_deb(dev, fw_val32);
 	else
 		aad_pdata->jack_rem_deb = DA7219_AAD_JACK_REM_DEB_1MS;
 
@@ -692,13 +691,13 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct snd_soc_component
 		aad_pdata->c_mic_btn_thr = 0x3E;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,btn-avg", &fw_val32) >= 0)
-		aad_pdata->btn_avg = da7219_aad_fw_btn_avg(component, fw_val32);
+		aad_pdata->btn_avg = da7219_aad_fw_btn_avg(dev, fw_val32);
 	else
 		aad_pdata->btn_avg = DA7219_AAD_BTN_AVG_2;
 
 	if (fwnode_property_read_u32(aad_np, "dlg,adc-1bit-rpt", &fw_val32) >= 0)
 		aad_pdata->adc_1bit_rpt =
-			da7219_aad_fw_adc_1bit_rpt(component, fw_val32);
+			da7219_aad_fw_adc_1bit_rpt(dev, fw_val32);
 	else
 		aad_pdata->adc_1bit_rpt = DA7219_AAD_ADC_1BIT_RPT_1;
 
@@ -887,21 +886,13 @@ void da7219_aad_resume(struct snd_soc_component *component)
 int da7219_aad_init(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	struct da7219_aad_priv *da7219_aad;
+	struct da7219_aad_priv *da7219_aad = da7219->aad;
 	u8 mask[DA7219_AAD_IRQ_REG_MAX];
 	int ret;
 
-	da7219_aad = devm_kzalloc(component->dev, sizeof(*da7219_aad), GFP_KERNEL);
-	if (!da7219_aad)
-		return -ENOMEM;
-
-	da7219->aad = da7219_aad;
 	da7219_aad->component = component;
 
 	/* Handle any DT/ACPI/platform data */
-	if (da7219->pdata && !da7219->pdata->aad_pdata)
-		da7219->pdata->aad_pdata = da7219_aad_fw_to_pdata(component);
-
 	da7219_aad_handle_pdata(component);
 
 	/* Disable button detection */
@@ -947,6 +938,30 @@ void da7219_aad_exit(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(da7219_aad_exit);
 
+/*
+ * AAD related I2C probe handling
+ */
+
+int da7219_aad_probe(struct i2c_client *i2c)
+{
+	struct da7219_priv *da7219 = i2c_get_clientdata(i2c);
+	struct device *dev = &i2c->dev;
+	struct da7219_aad_priv *da7219_aad;
+
+	da7219_aad = devm_kzalloc(dev, sizeof(*da7219_aad), GFP_KERNEL);
+	if (!da7219_aad)
+		return -ENOMEM;
+
+	da7219->aad = da7219_aad;
+
+	/* Retrieve any DT/ACPI/platform data */
+	if (da7219->pdata && !da7219->pdata->aad_pdata)
+		da7219->pdata->aad_pdata = da7219_aad_fw_to_pdata(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(da7219_aad_probe);
+
 MODULE_DESCRIPTION("ASoC DA7219 AAD Driver");
 MODULE_AUTHOR("Adam Thomson <Adam.Thomson.Opensource@diasemi.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
index cfa46fb..f48a120 100644
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@ -212,4 +212,7 @@ struct da7219_aad_priv {
 int da7219_aad_init(struct snd_soc_component *component);
 void da7219_aad_exit(struct snd_soc_component *component);
 
+/* I2C Probe */
+int da7219_aad_probe(struct i2c_client *i2c);
+
 #endif /* __DA7219_AAD_H */
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f83a6ea..82d35bc 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1751,9 +1751,8 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 	}
 }
 
-static struct da7219_pdata *da7219_fw_to_pdata(struct snd_soc_component *component)
+static struct da7219_pdata *da7219_fw_to_pdata(struct device *dev)
 {
-	struct device *dev = component->dev;
 	struct da7219_pdata *pdata;
 	const char *of_str;
 	u32 of_val32;
@@ -2289,10 +2288,6 @@ static int da7219_probe(struct snd_soc_component *component)
 	}
 
 	/* Handle DT/ACPI/Platform data */
-	da7219->pdata = dev_get_platdata(component->dev);
-	if (!da7219->pdata)
-		da7219->pdata = da7219_fw_to_pdata(component);
-
 	da7219_handle_pdata(component);
 
 	/* Check if MCLK provided */
@@ -2569,11 +2564,12 @@ static bool da7219_volatile_register(struct device *dev, unsigned int reg)
 static int da7219_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
+	struct device *dev = &i2c->dev;
 	struct da7219_priv *da7219;
 	unsigned int system_active, system_status;
 	int i, ret;
 
-	da7219 = devm_kzalloc(&i2c->dev, sizeof(struct da7219_priv),
+	da7219 = devm_kzalloc(dev, sizeof(struct da7219_priv),
 			      GFP_KERNEL);
 	if (!da7219)
 		return -ENOMEM;
@@ -2583,7 +2579,7 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
 	da7219->regmap = devm_regmap_init_i2c(i2c, &da7219_regmap_config);
 	if (IS_ERR(da7219->regmap)) {
 		ret = PTR_ERR(da7219->regmap);
-		dev_err(&i2c->dev, "regmap_init() failed: %d\n", ret);
+		dev_err(dev, "regmap_init() failed: %d\n", ret);
 		return ret;
 	}
 
@@ -2618,12 +2614,20 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
 
 	regcache_cache_bypass(da7219->regmap, false);
 
-	ret = devm_snd_soc_register_component(&i2c->dev,
-				     &soc_component_dev_da7219,
-				     &da7219_dai, 1);
+	/* Retrieve DT/ACPI/Platform data */
+	da7219->pdata = dev_get_platdata(dev);
+	if (!da7219->pdata)
+		da7219->pdata = da7219_fw_to_pdata(dev);
+
+	/* AAD */
+	ret = da7219_aad_probe(i2c);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(dev, &soc_component_dev_da7219,
+					      &da7219_dai, 1);
 	if (ret < 0) {
-		dev_err(&i2c->dev, "Failed to register da7219 component: %d\n",
-			ret);
+		dev_err(dev, "Failed to register da7219 component: %d\n", ret);
 	}
 	return ret;
 }
-- 
1.9.1

