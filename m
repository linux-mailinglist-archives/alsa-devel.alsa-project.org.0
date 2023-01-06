Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95965FD6B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:17:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A96730E;
	Fri,  6 Jan 2023 10:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A96730E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996659;
	bh=Uixe9OdB48jor3pV5yP4khlJ1UERWXyO5SWOsYMnLZE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FZ7GoCSFgm8CUctTyTCdtD2Y0ZE803MS116fsR9s+RqKPJHeT1C3al5uvQHZMDsF5
	 OiUzQ8zkVrJNbcMvGnfhDZrxuB7sDODea+Vw6oyY2L12He66fo3xfQgr7CCWcoTJj4
	 PP0mQbla7VGAmxOo1AFIOv03IO5AbwWOlJHqn/bQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E9AF80548;
	Fri,  6 Jan 2023 10:16:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F88FF80520; Fri,  6 Jan 2023 10:16:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC5AF80238
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC5AF80238
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUI3oT3vunw/Ob2nKjSQk1nt7bxdIKI/IAjDw0PWpghlqR1g0cJnIp20Xs5SeL3/99HOA6IS1x3fE2YAw/Uuiza/ra+qhwVNYDVexjZ+UN6TVcUwC/+BruNa6/7sz5oMQ0TMKZCeNcdHeqICrfAohw/mqxUFFvRX2NxNDfoXREq2IWg8ArKKGhb6VOYhesBVLw1eH/oIdp1PECtvNMC85dF5SacigSa6DisLo3v1Ak8brUeYthfFUJkB347NhrzPl6OgwFL5lcgiqo0HC6+osNXGCCjPLqPPeMsxYiPLFNiBaoYw3bzqLwp9/hiWbUG4yRRkvOCy50F9Zr9Y20fJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2ktlz7U4or0UFT99RBslw1vl1GOrk3t25gcHIXATMM=;
 b=bShh81Zw/rL6Cau6bqd1MB/XD7BJP1s530pdueYJ5NHwsPYU5t+yC9GdyAx9RpBaX5TFQka1DcDes411C4pQstPw/9F5wLZ7IyblxRTCZu0stqt7ZPSNfZn4uv+H/fHRyKangIABqEWGb8BazIEUIjE/n9lXRfSm04thMHPMNORuAppLWay7KFP5w3Y96HFdxEZ/86wjm681N2Ju6HK7jm/4icAq4kXKRsC3fEvku2ep7URK5ZVMWCfbc/oaiexkHCQXrCbQ9pJgeGyq/ujh8GixHhio/mzx7n0OR5Q7nhYASTzZWd7ls3FbenY/MlBslSAMi5C4r5vnRlSztFRNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:57 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:57 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 04/14] Removed the usage control and add the power switch on
 DAPM route.
Date: Fri,  6 Jan 2023 18:15:33 +0900
Message-Id: <20230106091543.2440-5-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: d4276e91-9c9f-451d-cdd5-08daefc69e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UB9a/qMCtEXKIr2Jm2aNE5ksJ3AI1St+PpwrTCgBqhSl0XarINbZbFmc6Cb1H2jgfHH3nJPTGPPsybHa0jCejSvdMyIOs0gzwnSzDojK1rbMXww7G9cic0z5MqPRReq2LDVPAv1HhEUO42d1l1p+GRB6H15o5uDcU+khuypw217DkQgO8EkSmU9WTZmyzGnkiiBvpK0zfET4+A9HU3eJNuRt31WPvyUFtJCwYc4kYayXsCxMMEIsWFTM2vQB0Obc/xlrMzyDdKWhixQH/xGZdyAzb+Ol4IM3xbseOi3zlOxZejRby9UmCBkuLdjXlNaAfZH/13k/Ut+vGwVzx+SqPTEDsLpg7grqZ+pTcjlBPDf4Xgs47/n/YJmU2Q+Cqq5hkAbCcOWPfAWCUVfZYYK+wz8T2jRmsKTgvO9G9Q5c8ts/jLjawrYPRgN3kMZjlhyBuKOtSRqISZBXplAYVt7l0POojyDofTIJsbSCIIt7THtv3ytOoEarJD3iqY7fQYCIZoEcLRjXPISl88a4nJ6l+4izhZNV4x+evkTLaUTMjlYLXtmpvjHsdpjqI1aEbnL9lRgA/7hwidCFvzH0ji8k7wnQAFpOJRiwSTqxYoPjPT03eQzuCMTEeFTgN98rTXz/z6/sudwKBLieLcgaEkGw9t9zfRGVnRYMgmWeQgyaQ8vUhRAf1QyOHW/8CwSMj9d3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aiYbnOKx3NF1P1hmu1WjMlFwsABp0tEXAorfaU11wkXE4o+8gWlFzqJn/XtY?=
 =?us-ascii?Q?AnIBg4MezhxKcdpwuru0fcs88I+ajbGW6zI0RmDUwegI2cNvb6+ox6N+YXZc?=
 =?us-ascii?Q?4mGOCR+hv92lCyjJLPOj7bVHiwqzPq4GEO5F2gBOLG+Vbe8WT7MJFvmvD8E1?=
 =?us-ascii?Q?Lx+XGH/CNVLQX/5Ub9VySntb4cTdwQUx7V20E33hywc1NYBXp7ccR7KrrmKu?=
 =?us-ascii?Q?70t22Y15MKz1iDm1Bea5X7MioCJxAP8jUPuUB1Ij8gO6qj2I/2UuKsCXVMiC?=
 =?us-ascii?Q?Hq0TeyTxHLGfj2a5x1jKA56/+St6+1GZtoxXeReHtKe3bObLz4YhmIpsYEwd?=
 =?us-ascii?Q?OR324g6xp+2Z9ejsHvs5nOGz5E33noBBPWvwMqnpFxnSyst0EYERdHcQedW+?=
 =?us-ascii?Q?z9mOwXfB1lTc3U9hqHABaYKtSV0XdD5Rvv8Fh3XulB+/5zEquupMgip+vvTd?=
 =?us-ascii?Q?5i8AMx8qyo1gYWkNvtHx0WF0HxdFbklRecJpXvl67URKlzOtOlrTDAgr0hnv?=
 =?us-ascii?Q?6ZOarCj5ngRTTabJnQLI2x6trKP2G6IJ5DxtPp+hhBUdnrvAwE8tQxB+fk34?=
 =?us-ascii?Q?ilGKv68fOqozSzO7jTZ9rGV3H19QS7RJnKxGl1LklRJ5L1MPItYGCyuFHR/c?=
 =?us-ascii?Q?S9vSJ8Oyw0EQA5UTJ34a7LTwhzRPp1mLgNVp6pGcUub+gAJCeYe52E4bIie/?=
 =?us-ascii?Q?6gZ6iubYfSJD09yUVNbxsC5lzp0MI2v2mhV25mmhWmPOYjlH6hDTs4hyFOWX?=
 =?us-ascii?Q?fX2vqjC2mP+csXheBsPsAthqKnj6zUBMBXLgHnPnmqYb+kJIpQJzF0CITdiI?=
 =?us-ascii?Q?j9lQ6qBuZ6D+iOKQSczDaeBVb6hoE2oopThOY+OHOil3iWg3xXr2aHhjcNIN?=
 =?us-ascii?Q?fze2jpLTrhg8xUsbLSCrKiNtx7wZfu7fH1+0Cyww+kTnn/pm/pNqYE1PuyK/?=
 =?us-ascii?Q?1H/EJvPmcdCVATr0Tp062DUjby6yWbm9s0/BmxUgNXiFmzmmYGeL9x/ub6Cs?=
 =?us-ascii?Q?XqSE+Ic1xddnvJbn87Rg6ap0nXTa7r8ZPwiSTn5KMptJtMPB5zNx7D7BA9Y+?=
 =?us-ascii?Q?MbIguiSl1gnHGpiUoyt/X9+AVjZF9Fgs1kGLGpI9OcxHSHH1ZRZU1iLVnvt7?=
 =?us-ascii?Q?zA2JV32kBB8bqKY+XIMdEbwMkPPYAf3UeRfdfPeblRhVF2XwOs+T2pYbaiEW?=
 =?us-ascii?Q?4KYFxl2c1yaLLtPfOec2/4ajsOunPsWDSuwqGoakQgjggXpgIXh3sIuEW4K8?=
 =?us-ascii?Q?YAioPLIlCP7PutU5mGoyx3pNOJeV28N+4fe6afV0hGfOHqgfzUUIDnB8QYkB?=
 =?us-ascii?Q?BZ6rNsgOPsBvV4HFWPEMZtjbYWGnukk02EaFztrN4ukyugySJ2kY9lhwNYCu?=
 =?us-ascii?Q?rMwZrq2QhZ2+GMDf2lhmCIfR1UXXnFxGza360QiFGufGQCwuR9rPYJn3eeiR?=
 =?us-ascii?Q?6fsZ6vQPrJNXQf+F9y7nrZqZNupZ4ao4q9dfn8djvIUU/i0jQlCpqrIyBWrj?=
 =?us-ascii?Q?vtjqb1Kl3kIhTtuzBzipXs8pWY0SvAHahWe/iikgTVlX0AQWUVJsOvZLOE0N?=
 =?us-ascii?Q?wdB7R6YAsnQEb20B8R5Gl3HYcMJZrez2i71VvcRj?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4276e91-9c9f-451d-cdd5-08daefc69e66
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:56.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtU67FK9xMOtgUW3XfQ9ChdALygNgwFLqwucIadEecEIztRA6p2uRwAwtti4OCexpFh4BgsXrOQ6D7QyshCpi3naahoLfrnPZaWtMMSwuVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sma1303.c | 79 ++++----------------------------------
 1 file changed, 8 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 8bd59a481f2d..f78cd2daad61 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -69,7 +69,6 @@ struct sma1303_priv {
 	struct mutex lock;
 	struct delayed_work check_fault_work;
 	bool amp_power_status;
-	bool usage_status;
 	int num_of_pll_matches;
 	int retry_cnt;
 	unsigned int sys_clk_id;
@@ -375,66 +374,6 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int amp_usage_status_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-	ucontrol->value.integer.value[0] = sma1303->usage_status;
-
-	if (sma1303->usage_status)
-		dev_info(component->dev, "Amplifier Power Control Enabled\n");
-	else
-		dev_info(component->dev, "Amplifier Power Control Disabled\n");
-
-	return 0;
-}
-
-static int amp_usage_status_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	if ((sma1303->usage_status
-			!= ucontrol->value.integer.value[0])
-			&& (!ucontrol->value.integer.value[0])) {
-		dev_info(component->dev, "%s\n", "Force AMP Power Down");
-		ret = sma1303_shutdown(component);
-		if (ret < 0) {
-			ucontrol->value.integer.value[0]
-			       = sma1303->usage_status;
-			return ret;
-		}
-
-	}
-	sma1303->usage_status = ucontrol->value.integer.value[0];
-
-	return 0;
-}
-
 static const char * const sma1303_amp_mode_text[] = {
 	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
 
@@ -928,10 +867,10 @@ static SOC_VALUE_ENUM_SINGLE_DECL(sma1303_sdo_source_enum,
 		sma1303_sdo_source_values);
 static const struct snd_kcontrol_new sma1303_sdo_source_mux =
 	SOC_DAPM_ENUM("SDO Source", sma1303_sdo_source_enum);
+static const struct snd_kcontrol_new sma1303_enable_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
 
 static const struct snd_kcontrol_new sma1303_snd_controls[] = {
-SOC_SINGLE_EXT("Amplifier Usage", SND_SOC_NOPM, 0, 1, 0,
-	amp_usage_status_get, amp_usage_status_put),
 SOC_ENUM_EXT("Amplifier Mode", sma1303_amp_mode_enum,
 	sma1303_amp_mode_get, sma1303_amp_mode_put),
 SOC_ENUM_EXT("Outport config", sma1303_outport_config_enum,
@@ -1048,14 +987,12 @@ static int sma1303_dac_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
 
-		if (sma1303->usage_status)
-			sma1303_startup(component);
+		sma1303_startup(component);
 
 		break;
 
@@ -1130,11 +1067,13 @@ SND_SOC_DAPM_ADC_E("DAC_FEEDBACK", "Capture", SND_SOC_NOPM, 0, 0,
 SND_SOC_DAPM_OUTPUT("SPK"),
 SND_SOC_DAPM_INPUT("SDO"),
 SND_SOC_DAPM_MUX("SDO Source", SND_SOC_NOPM, 0, 0, &sma1303_sdo_source_mux),
+SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 1, &sma1303_enable_control),
 };
 
 static const struct snd_soc_dapm_route sma1303_audio_map[] = {
 {"DAC", NULL, "CLK_SUPPLY"},
-{"SPK", NULL, "DAC"},
+{"AMP Enable", "Switch", "DAC"},
+{"SPK", NULL, "AMP Enable"},
 {"SDO Source", "Disable", "SDO"},
 {"SDO Source", "Format_C", "SDO"},
 {"SDO Source", "Mixer_Out", "SDO"},
@@ -1214,9 +1153,8 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 
-		if (sma1303->usage_status &&
-			(sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
-			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK)) {
+		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
+			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
 
 			if (sma1303->last_bclk != bclk) {
 				if (sma1303->amp_power_status) {
@@ -2039,7 +1977,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, sma1303);
 
 	sma1303->amp_mode = ONE_CHIP_SOLUTION;
-	sma1303->usage_status = true;
 	sma1303->amp_power_status = false;
 	sma1303->check_fault_status = true;
 	sma1303->pll_matches = sma1303_pll_matches;
-- 
2.30.2

