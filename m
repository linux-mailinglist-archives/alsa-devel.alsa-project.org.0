Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3A697996
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 11:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9A8F3;
	Wed, 15 Feb 2023 11:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9A8F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676456078;
	bh=Fadq231BqqbfATFgn7hBFDuE0tKjVbyMlzdBeZcT+TQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KW7AWEFR9VmZaoBrkLR1HKOlhRUyIdoSh+mBRbuauov27qdiPyvmJpNa6r7jAbggb
	 nmRehR8EIoFhTzvvGWJfeS8R5guRAVSrMcWFcZ7tP0Ud+KLkv2RfKEniy76ZeX2yRa
	 59bz6YoKEt3QzZwL/PcKpmzZqiPYw7KD29Uwa3d4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 157D0F8047C;
	Wed, 15 Feb 2023 11:13:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 007BDF80496; Wed, 15 Feb 2023 11:11:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.0 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05360F80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 11:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05360F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=BFyOjrnZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzrdSfGBcBSOPC7zfvqlb1Ac+pgDdMQuR9dcE/xr0UzoItsUxfof6nKEb35vaWIbizaIF88P6ceGxY2xTDqu3o3VilTXTA1Q2DdnQgg3eC7Cnz93UjG7pUzsRcVTDXCBABv+AKlgDP4BP8LwLNPoekLUHdUeUNb9BPp6WV2mppwOzyFSVlqBP5fV6X+kBl7YG3YW4LS3l+IAm2FpQsUilKgcScgtZDifLePbdVrH4GtLMOKMFUusbjZAhplYVWGioJSNn2WYzPQSMuWk1YLFdIw9tHMp606xmzExEyYGfrHdp0na13OBP+PUlm2SNyWk2zv0ou6Ajr7tV1NSFky6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf9hMf10tFpYIOg6ykVmNjOgfYGkvW5d9YodsJqKm2w=;
 b=Kaq6ushtDnu+THgO2Rp2ajRGcnIKaVvI/j6oUaTCh/IrFZpEiGIDLDWv+mgGBC6iCtSKpW/wkcBx9AVwzaF7SM5w28/RcVFD07dXnT76aEXGkZgq9ojmZL2vgIeRk1kUOzLagNfUvAL66Y4JOHBUIylj42Wawd+MhGhLG2cCFt5VEZOzVdFm5I4Z7n6T8Fk4mrqj6NGkwY+woDfonkVAu0FHzqLhIyDpwZvf5Z04Dx/PuCPxiJB2U0f3VFFnFPqJUYc8RKAkUgewn8jElgRYtxCBwQfzC+wnMKYxcW74r1nmvH+ncQ8doFHnwyUtuokWJeYc+fMzOOep4UHjvAAVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf9hMf10tFpYIOg6ykVmNjOgfYGkvW5d9YodsJqKm2w=;
 b=BFyOjrnZZOwaeNEgLPRObS3JfjM8albf+clKCJAl9jRgYkOvyRedkDORIf3bVcWOBrbk7zRdxh6V8kOpeKBlIY51uZ0oV9DMQVaDnpXnls7DEipwYeZd7ivaZ198xUNcG9ZS17du/uhEUI5QrhZVcDy04EMwQK3li7TGdGTCMO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYWPR01MB10791.jpnprd01.prod.outlook.com (2603:1096:400:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 10:11:13 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::9438:5139:7952:d8b0]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::9438:5139:7952:d8b0%8]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 10:11:13 +0000
From: David Rau <David.Rau.opensource@dm.renesas.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: da7219: Improve the IRQ process to increase the
 stability
Date: Wed, 15 Feb 2023 10:10:45 +0000
Message-Id: <20230215101045.21456-1-David.Rau.opensource@dm.renesas.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To OS3PR01MB6641.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6641:EE_|TYWPR01MB10791:EE_
X-MS-Office365-Filtering-Correlation-Id: a8088117-26bf-4072-5609-08db0f3cf7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UrIlbD8S9kqQ/YIYPz1E5yHvYScaNsECXMrgj2it7ABXmayE0ANpFIWnh9GhqhfHF4Iar8jw6wNIK+pTtyIQ8wCj+ZG+1sqOGF4dzg0EmBoqoS82V9qR3nZ7g7Fo3osj0PfcH1AEm95+3HM9YdVcYubYzKyX1eMomSey9rSYNTwhKmNpAWZr37pBr17JHF5loDTx5hVqKXCSLH825Agrg/ig6AcXWy2ySAN8kFRP9IB8O0L4PrySuEqYJJG9aYg0XsVwCryE6hf/xSjkLchZxBNfF23h5HCIwDkbBRU1P0GoEOlHFHAU1e5no7XDcayOMMNitzIIyh/U+BryhZhwl7FYXNdn0gykerDAjr+Kb8p8IcPQ8D1rzo3CGNg5Rp/3R/08oDI3iyfCRpxoIIhR2uMMtWnv6sT8OqR5v1XhI+93xBoMdCe41ADS6J+sHBqNeClhAf6btcRPHb52t7nlw1QXLgQWbIZQFzU34f0g2VmzEc4qy5Zjh5/IRaW4I7/fQISzNHo8bDS/3MBj9d95snjrzflP93pEFHBkv5GR6W+5frPhR9m/KTlIwyS0+YTLlMMVlRWnZuw5YlGGjG8Lh2JLxoG8HVLV36t8NahKx55RFpa732RP009aGhLWN+R6uIbhaP1wh+eOVsRTRDaiooSIC1ikBMief14bnVcGCc/r1YqXxIPD1CWMjM4YtvHWUS/BSBvkLDxW06rD6brRhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199018)(186003)(6512007)(26005)(8936002)(41300700001)(316002)(86362001)(38350700002)(38100700002)(103116003)(2616005)(5660300002)(83380400001)(8676002)(478600001)(6486002)(66556008)(66476007)(66946007)(4326008)(6916009)(2906002)(52116002)(1076003)(6506007)(107886003)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jlQk8h0x+7V/dRxtFyHDm4EkA3kQRJJYZRVc5C3yCLW5kzETZlyl1dsy3LQE?=
 =?us-ascii?Q?DvVbPL6r0DHwhh/NlnmuhpRADCHkk/MNUWN0VtrnmvHqpQSNJ+m/60w9PBfO?=
 =?us-ascii?Q?bxZ2bMQJ92bn87YtqyUOluLndJZ5LTF+ybjm67Lq3GasPt+zvhgtCrQB5j9z?=
 =?us-ascii?Q?hke6BJLwWOkSwEtWGZdHdvPfZ+I9PtZ0UepPWOOz9s4cisFYpTU26esM7TaM?=
 =?us-ascii?Q?UAWeFbIGG7BCcDOhxAITAN3+NO/CJn7UxgUHeQ/BJkVJ+Fn7rBttfdI4TRds?=
 =?us-ascii?Q?lyUph/f9jcabf/NaTqmokUCuH4LYPR/RuE004vOWMiAcrps2yE4/MkZi0V0S?=
 =?us-ascii?Q?MZawxzdLaR8VX9fSUu70Zy/PsLMWKMJk4kODykW5MNRvenrhSnhbI/78l9bv?=
 =?us-ascii?Q?+T6H6o9SgzcmM8wXYMrPwUBlb6hF5carGNx/hBUUF6pWA+pxnNhFH3hOZF8+?=
 =?us-ascii?Q?LhfFg/rdOQlikWB0Br7wJNS0iyO3hJuvZiBfl1TWMhSRaMw/2daf1yFAWi6h?=
 =?us-ascii?Q?Iw+3nWRsTfHYBLBI5oMe5vkhpscyBw1sc5lpzb5rK84U4nvVm/HZJNoGqEES?=
 =?us-ascii?Q?B3kN0aLuSDMO63SztnSaJD0RVlO/hkLZHeKmfUN2FXQh8rj4PZbqzGmNiw8H?=
 =?us-ascii?Q?iZnyUSiIfvhi/7BMGKlobeBFOU9SvCOK5LLJpAKHrKz9Y2oR+ipSKh0aCcnI?=
 =?us-ascii?Q?jMK4RdivLpBc8oAjRejX8NHkC28Dx87jZxhYXST/Id/Pk1v6tH8SygVsDtnC?=
 =?us-ascii?Q?zEXbgIK+p5sK8Z/8v3QYmP/NwZQad/rF7SaAQgpwhTmrLTS68sYbYK/AqS4a?=
 =?us-ascii?Q?VQ2UgLEL1IOvPtCe63Sa6/adtGE1nBqoJyCdC77gSGrnrSXlSA/vDi30n7Go?=
 =?us-ascii?Q?0PX6DYbHZ0cnY6PYfazIJbJUGtbxka5RhVViujc5+WgbeKVPTnnEeNl6aiQ5?=
 =?us-ascii?Q?ypjaeQv+pVKH/m3eGlacalFB92d4rjQHIaVottGzXiVexmoXWO8S5P97YOi4?=
 =?us-ascii?Q?4nkBTz0vdtaNcJYMaoIERmSdSqi/BmTK0uRbJCzud4iFHtE0Ba1T2k7slUlt?=
 =?us-ascii?Q?FixfsYeKbDwSFgYIynb5wv3/OCMe0FQgHhrvSoTUEZjbyP82G/Ry5bdvRloC?=
 =?us-ascii?Q?GxPfPY1MH7dFxGh2H+vJmKw8WHYZNm/tQ+pRXp2K7IgWPvAobUqLQs5usdj2?=
 =?us-ascii?Q?zMLuquo2G+kmY/uhjcuF8IVkDRfK2paYkWIdcwbTQazs/0JhR0YdcRp+UJo0?=
 =?us-ascii?Q?wluNDk5cY66c3M/T2/vXUP0oKmkNjzGvW5vGQr200SD1eqkj3VFmClgUM5D6?=
 =?us-ascii?Q?17KAoLuU6wac7PcSqS3trQWBQhrNbvd7IiWc2L1vbqHazHIZOVc+l3iS+6Au?=
 =?us-ascii?Q?wyZBHO20Z9Ejq7U0P25ERIxZvTsxzz9SCQ3vSddgcDt9DFgvBfW0EbLBwwis?=
 =?us-ascii?Q?Rieobm4pNzTVzYuTsKkhbseoTuhgjs3rH/k/KUBk/m4QjtaLZGCiblei7WZa?=
 =?us-ascii?Q?oWMCtxsZLQm3XYMzRGeTtLS78HfC9LjLVUT4d4iv6m2wNYd+GKKyY5ZX0dja?=
 =?us-ascii?Q?o0Dzr+rP1GP63qdnwMPHbSI/DljHnKhzplZcw92A2hphtU7vdB+3g0dABMd5?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8088117-26bf-4072-5609-08db0f3cf7b5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 10:11:13.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TIWbfe3YqU4XviwSW16M3A9uFvRPku8x7pyeKoDkTYGFXCU/qBwh7r7BLs2IXOkoBNNer8FlM7L+px75IwgtIo8WEGRIKI6NZjmUbXJVP2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10791
Message-ID-Hash: 7BQKVH3AMNPXQQSILQAFJMCWYQXBYT5W
X-Message-ID-Hash: 7BQKVH3AMNPXQQSILQAFJMCWYQXBYT5W
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com, David Rau <David.Rau.opensource@dm.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove the sleep control in IRQ thread
and create an individual task to handel it for Jack plug in event.

This commit improves the control of ground switches in the AAD IRQ.

Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
---
 sound/soc/codecs/da7219-aad.c | 41 +++++++++++++++++++++++++++++------
 sound/soc/codecs/da7219-aad.h |  4 ++++
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index c55b033d89da..4a4f09f924bc 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -339,11 +339,39 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 				    SND_JACK_HEADSET | SND_JACK_LINEOUT);
 }
 
+static void da7219_aad_jack_det_work(struct work_struct *work)
+{
+	struct da7219_aad_priv *da7219_aad =
+		container_of(work, struct da7219_aad_priv, jack_det_work);
+	struct snd_soc_component *component = da7219_aad->component;
+	u8 srm_st;
+
+	mutex_lock(&da7219_aad->jack_det_mutex);
+
+	srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
+	msleep(da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 4);
+	/* Enable ground switch */
+	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
+
+	mutex_unlock(&da7219_aad->jack_det_mutex);
+}
+
 
 /*
  * IRQ
  */
 
+static irqreturn_t da7219_aad_pre_irq_thread(int irq, void *data)
+{
+
+	struct da7219_aad_priv *da7219_aad = data;
+
+	if (!da7219_aad->jack_inserted)
+		schedule_work(&da7219_aad->jack_det_work);
+
+	return IRQ_WAKE_THREAD;
+}
+
 static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 {
 	struct da7219_aad_priv *da7219_aad = data;
@@ -351,14 +379,9 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 events[DA7219_AAD_IRQ_REG_MAX];
-	u8 statusa, srm_st;
+	u8 statusa;
 	int i, report = 0, mask = 0;
 
-	srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
-	msleep(da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 4);
-	/* Enable ground switch */
-	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
-
 	/* Read current IRQ events */
 	regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
 			 events, DA7219_AAD_IRQ_REG_MAX);
@@ -377,6 +400,9 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 		events[DA7219_AAD_IRQ_REG_A], events[DA7219_AAD_IRQ_REG_B],
 		statusa);
 
+	if (!da7219_aad->jack_inserted)
+		cancel_work_sync(&da7219_aad->jack_det_work);
+
 	if (statusa & DA7219_JACK_INSERTION_STS_MASK) {
 		/* Jack Insertion */
 		if (events[DA7219_AAD_IRQ_REG_A] &
@@ -940,8 +966,9 @@ int da7219_aad_init(struct snd_soc_component *component)
 
 	INIT_WORK(&da7219_aad->btn_det_work, da7219_aad_btn_det_work);
 	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
+	INIT_WORK(&da7219_aad->jack_det_work, da7219_aad_jack_det_work);
 
-	ret = request_threaded_irq(da7219_aad->irq, NULL,
+	ret = request_threaded_irq(da7219_aad->irq, da7219_aad_pre_irq_thread,
 				   da7219_aad_irq_thread,
 				   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 				   "da7219-aad", da7219_aad);
diff --git a/sound/soc/codecs/da7219-aad.h b/sound/soc/codecs/da7219-aad.h
index 21fdf53095cc..be87ee47edde 100644
--- a/sound/soc/codecs/da7219-aad.h
+++ b/sound/soc/codecs/da7219-aad.h
@@ -11,6 +11,7 @@
 #define __DA7219_AAD_H
 
 #include <linux/timer.h>
+#include <linux/mutex.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include <sound/da7219-aad.h>
@@ -196,6 +197,9 @@ struct da7219_aad_priv {
 
 	struct work_struct btn_det_work;
 	struct work_struct hptest_work;
+	struct work_struct jack_det_work;
+
+	struct mutex  jack_det_mutex;
 
 	struct snd_soc_jack *jack;
 	bool micbias_resume_enable;
-- 
2.17.1

