Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7E689428
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 10:44:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F332DF0;
	Fri,  3 Feb 2023 10:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F332DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675417496;
	bh=Ujymd4wbfV/WrMh3tXLc0tYqdFS1yCBeQePRGoXk1Dk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Eq9RS0ZfzLCZbEolVoJk6rlyQiabbst3Smc3a41XH73eC0uXZ5wnwvGyYn+WwBTe1
	 vwyg5vDMuCRg1nH892QdeQipgjoroFLgZ7dhCxGtB0ZDBOk9SIS2IpUQ8VGCLsbGXF
	 I9jtyAvYzrih0k3ySN0t46/oSuyTuxnzwJNcJLPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2F56F80553;
	Fri,  3 Feb 2023 10:43:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1587BF80552; Fri,  3 Feb 2023 10:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43969F80543
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 10:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43969F80543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0QiBA3N9O1mzLXdcnMckf9GhEMSileNcLvq7veu6/LpocKa+WEWd38/2R6Dmt/Z+SWUW0ij1K4UgUmHXanrmuMhLjUxoa4lZaOwkM/0xNYLm2MK75hCnwEFeH7JYchvQuPAm8+GkamxGKPDdsSRKGsDviVp223yDQZzhkOZ1AeGluwXnHUkN7RJJBSKlmf4f86izKSBr48MMMi39KKWsJzfMJ/J3OQ8vt8rx4oumuolopBRp8lVnbUCkl8Xx1Fc7rabd7hoE5SG2AFFLfbxvSEu85GB8BilKDPH7O3hziJb8brojroqrVsMWxxdBi+rqkMgqfF+4Dx2FrhUcraHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4j7Y5NWSLhdFECtfSl48pD1bVNC0t6SiyS0rK9/peM=;
 b=IX2+nh4hh+wr8ZRLDwU0GDNsJ5X4lBDgpam6Wc7S8iJbbGDxsqwB3GXWzOjy/Sz+by11V0emXrIqCYZhbgOH303YDbqv8N/OMKcMbgqI0qBCU7a3neHke+e4XCi96K/eShs/OfOwCEeiNaaDO37pj63cLgRJzi9dPUqsBqFvcZwKLq3sBQ9nc8Gons+PnOPem6RoboSdGxi1JqLN0pi7YYZd2Hge3ukXlLP9PZ5Lm3Zwg3KherT/qW9vbgumNbOGPcCpdU9BBXi+Ht0HTWQYd9cSG0hwsIpCKx8Byml0Tyb7MH6YUklPGj3lwwpLx7xTMjZsRcBtF8UzpPKn4h2irw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1485.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28; Fri, 3 Feb 2023 09:43:11 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 09:43:10 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/3] ASoC: SMA1303: Convert the TDM slot properties in
 devicetree to mixer
Date: Fri,  3 Feb 2023 09:42:39 +0000
Message-Id: <20230203094239.25700-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230203094239.25700-1-kiseok.jo@irondevice.com>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0226.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1485:EE_
X-MS-Office365-Filtering-Correlation-Id: 9356a86f-d191-40de-b554-08db05cb0ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: no51ecuibEtnwbxBm04TPV0Mo5k6okihv1jmUHU0AlyuhhMWZdD2684aTxaa/RkGur+c37Adi8DHoeo8kLXFwJXsn2UlvmIFpSiK47S9kHV73CelExQRhiqUzqdODxIsiYCUK3yiz7JwOGegY1eZ+N3eaP5lZkfsEx2fBEyNbPZytmnZHGhZdla4ox1FmXPfjIXhwMSXiBSuvsXEn7JcjH2KlFTU2W2Db+RoOTIDl0EY0ozZ931DeALE5mn/4UpKyJDaIg+RoMFS/qkvseDTfqm+W7vJmBmljgjtpJvlqI4li49O1/tkWkcW1UPqGGkLKaNu2oOsHYBzxyTsIAnD8eSgTXor7acAwzYR/zXt9ERp4vBFDTCmS/thwjkkRgsizy4/NgGJvKcJQxM81bDiNoAWSC+2FcvP7kvc/qjBopdOVBl3wGG5LFqm9QVlBU65YHYmBjSUQcbVQhJxQUR77t90eWDZdovlf3vtJflhQCNgZqUm4et2T6O0GFofRd80BOqwAqkcNvegG9dbE5hTFCJTOMbaxizDKvbh7dhiOLGal8TcaHWCi5BqReySUOvZniX+qnNXw+j3QvYWXlo57t6QtROEGXvk4UQPRwoQw3BBevCoMznYjd42W4+6a5Nlz3UWx57oPWrtnGt3OIRXGw9ur62muTybbDi/IGs7/DuF6NHZTg0XeGsxKhfu9dXH9/1xLStyJO5N/AGF7SlG6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39830400003)(376002)(136003)(451199018)(44832011)(26005)(186003)(8936002)(6506007)(6512007)(1076003)(36756003)(38100700002)(6666004)(38350700002)(83380400001)(2616005)(66946007)(66476007)(66556008)(4326008)(8676002)(52116002)(5660300002)(41300700001)(6486002)(478600001)(110136005)(316002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t6jgOhsX7LNxXvgeN7CsclbfSg+U8CB+tZahLdP266s7gNRxyFNiV9ZqI5v7?=
 =?us-ascii?Q?5QJ1vFPQV/Ps6Y+zqV6slHHjSRlKiJ95yOfa5WbAx4A4E+X7f1AdDSd2XNZv?=
 =?us-ascii?Q?8ApwGNamJ4g1JDZBNyyc4I+7k6+0HibSiSgPH67tWRG8nBhpRxoBH9qJcm4G?=
 =?us-ascii?Q?Mc7jGSHNrqD414sF4k9Gtq45khB99tR9eIyqQOAowHehfwcLZmRruwx8HgXW?=
 =?us-ascii?Q?6f2N6nVHIP/icycs+3uxis9FzK5s4djuuv96pjydBZTIA+6wwj9o4CXSEiE6?=
 =?us-ascii?Q?ASwVqet4MmmyD6vo4PiGuMURzG4bmPGGFj1vi3W+Tu3khJbM1rkuBLpttDTP?=
 =?us-ascii?Q?bOScDV3NjG5fG12fuPB523gJI7Z4ZxGOEczZuCcESukV4qU5/PhciIj7m+ir?=
 =?us-ascii?Q?MQ2JXQdTnuQ164nEniXlZUOM2cvnReKPf3HdJ8zkhCE73LyiQaSJGktuP5Ok?=
 =?us-ascii?Q?wv5yFm2CKLTbT5UYB1TbW5tMF9lYseUPt6Ce6v/GIsyDuHcuSdAl0iHB475a?=
 =?us-ascii?Q?MnPrNH14weZayVxIelBc7s+FOVg78A3hW3QCiTsnA/oGBd9QE7vtO8s+BJAu?=
 =?us-ascii?Q?alqJYU9t/+cm/Lc5mKVD+r/sS2iMQ4h+ZoOX8h87a2xgdlwaXqddfq+yPE+L?=
 =?us-ascii?Q?2ZN7qjndtCIscW5bRLD7TZxvo3DMBH0Nlu6tVe0cQ2PYf6uvZQbNjHTEcSmC?=
 =?us-ascii?Q?te7r4mo6CLW7868liFcz53waTWr3JFDIbMkChzZKgiHZfdp9PaQXvb9IwNub?=
 =?us-ascii?Q?P4L7UTtfmapo5otDTxzP5XSyq5jf5ShMR4HV/0LxY3pOjQdLoBRLYaaEwn00?=
 =?us-ascii?Q?AcxgfVKpRxJMM8YBxmRl3fOA8SahxVKw1Uk399XV5Jo0nxXnpEU1VwE0/XUS?=
 =?us-ascii?Q?/rLn1aItDFn6D/Nn3eZ5+cudofcF/sRlHz6WyAfCCZlqbBj+CLuHG7kpfU2r?=
 =?us-ascii?Q?Pj+Wq1p+0wUrZOqAS+CzKMRYMD/TL6EoDXUIRolUZ4J+phPFq9AHDQ5mqnF0?=
 =?us-ascii?Q?dHEUmSfWn/3En1I6GwVkYAMREGlcyInzSpXM81Hag1/26ih0CAkci17dfSKt?=
 =?us-ascii?Q?3X6kFFrJbDiP0BM9lEIaAnHyvyEcCukAQruaCsAkPrHdV/a7Xgo/z9fWCcXD?=
 =?us-ascii?Q?t7BH/lF5fB3OUhAm2cIdPhMDXAKDMfw3UbMSnwhWG2hlnth1dVxBpnEtaU4G?=
 =?us-ascii?Q?j0em2lR0nvr1/A0BawBn1NgXdyo7kNdiPJc17EGfD9pTk67LryipLzmfCBIN?=
 =?us-ascii?Q?tc8u7v+aN3zRNtVGbtSKsvIQL0XhPU22L6yPe1Q9XQTv1cLn68ATt6es0f6S?=
 =?us-ascii?Q?4nwslBy92FwGKCG5uyG/U4S5+CUys8mhLivXGg0hn+S6tevGCyCavEf9IBIJ?=
 =?us-ascii?Q?ih7zcoWPmjXajZGkNZ4mZiSHMMyUQww4ETB9tf6diQ2dwE+57RsjnIRYAZ38?=
 =?us-ascii?Q?4c489Dd9tucxHqKLmOjQIzyNNfTSw03wcmzzVJ29dJN3NAwB3OgPJeGeKGLA?=
 =?us-ascii?Q?Bjsc9OqukUTs56/Ysl3D3Fb1D1EA5hz0NpawtRpniNhogcOqd72cbhmx45b1?=
 =?us-ascii?Q?EU0m2YtSQx9Q3HKNMOQOxKdBNidbYYdaTWO1lsAyyVAHeFSbrWf0eLcGLObh?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9356a86f-d191-40de-b554-08db05cb0ff9
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:43:10.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0UMUuDHFccPQliAZCDSYufNVResLHRCBoOe9xR10+MlCV7FnjmZMQOuajzIHGj+CLBkCAVo9VVWkQrA3R5Wln6a7dGxm6OxXb5FsaZhAkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1485
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It seems correct that the user changes the TDM slot as needed after
device probe.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 100 ++++++++++++++++++++++++++++++-------
 1 file changed, 82 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index fdcc40f5fc61..9ae4e3cba3ae 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -292,6 +292,9 @@ static const char * const sma1303_aif_in_source_text[] = {
 static const char * const sma1303_aif_out_source_text[] = {
 	"Disable", "After_FmtC", "After_Mixer", "After_DSP", "After_Post",
 		"Clk_PLL", "Clk_OSC"};
+static const char * const sma1303_tdm_slot_text[] = {
+	"Slot0", "Slot1", "Slot2", "Slot3",
+	"Slot4", "Slot5", "Slot6", "Slot7"};
 
 static const struct soc_enum sma1303_aif_in_source_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_in_source_text),
@@ -299,6 +302,9 @@ static const struct soc_enum sma1303_aif_in_source_enum =
 static const struct soc_enum sma1303_aif_out_source_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_out_source_text),
 			sma1303_aif_out_source_text);
+static const struct soc_enum sma1303_tdm_slot_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot_text),
+			sma1303_tdm_slot_text);
 
 static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -368,6 +374,76 @@ static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+static int sma1303_tdm_slot_rx_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, ret;
+
+	ret = sma1303_regmap_read(sma1303, SMA1303_A5_TDM1, &val);
+	if (ret < 0)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = (val & 0x38) >> 3;
+	sma1303->tdm_slot_rx = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int sma1303_tdm_slot_rx_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret, val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_A5_TDM1, 0x38, (val << 3), &change);
+	if (ret < 0)
+		return -EINVAL;
+
+	return change;
+}
+
+static int sma1303_tdm_slot_tx_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int val, ret;
+
+	ret = sma1303_regmap_read(sma1303, SMA1303_A6_TDM2, &val);
+	if (ret < 0)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = (val & 0x38) >> 3;
+	sma1303->tdm_slot_tx = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int sma1303_tdm_slot_tx_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret, val = (int)ucontrol->value.integer.value[0];
+	bool change;
+
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_A6_TDM2, 0x38, (val << 3), &change);
+	if (ret < 0)
+		return -EINVAL;
+
+	return change;
+}
+
 static int sma1303_startup(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
@@ -781,6 +857,10 @@ static const struct snd_kcontrol_new sma1303_snd_controls[] = {
 		sma1303_force_mute_get, sma1303_force_mute_put),
 	SOC_SINGLE_EXT("Postscaler Gain", SMA1303_90_POSTSCALER, 1, 0x30, 0,
 		sma1303_postscaler_get, sma1303_postscaler_put),
+	SOC_ENUM_EXT("TDM RX Slot Position", sma1303_tdm_slot_enum,
+			sma1303_tdm_slot_rx_get, sma1303_tdm_slot_rx_put),
+	SOC_ENUM_EXT("TDM TX Slot Position", sma1303_tdm_slot_enum,
+			sma1303_tdm_slot_tx_get, sma1303_tdm_slot_tx_put),
 };
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -1621,24 +1701,6 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	}
 
 	if (np) {
-		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
-			dev_dbg(&client->dev,
-				"tdm slot rx is '%d' from DT\n", value);
-			sma1303->tdm_slot_rx = value;
-		} else {
-			dev_dbg(&client->dev,
-				"Default setting of tdm slot rx is '0'\n");
-			sma1303->tdm_slot_rx = 0;
-		}
-		if (!of_property_read_u32(np, "tdm-slot-tx", &value)) {
-			dev_dbg(&client->dev,
-				"tdm slot tx is '%u' from DT\n", value);
-			sma1303->tdm_slot_tx = value;
-		} else {
-			dev_dbg(&client->dev,
-				"Default setting of tdm slot tx is '0'\n");
-			sma1303->tdm_slot_tx = 0;
-		}
 		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
 			switch (value) {
 			case SMA1303_EXTERNAL_CLOCK_19_2:
@@ -1719,6 +1781,8 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	sma1303->last_over_temp = 0xC0;
 	sma1303->tsdw_cnt = 0;
 	sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+	sma1303->tdm_slot_rx = 0;
+	sma1303->tdm_slot_tx = 0;
 
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
-- 
2.20.1

