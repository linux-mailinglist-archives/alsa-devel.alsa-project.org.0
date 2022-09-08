Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D15B12A5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 04:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C4516B3;
	Thu,  8 Sep 2022 04:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C4516B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662605197;
	bh=rlCgPBuf6KA+iNLucTp4yu5TJxaOFhKFSnCqbtXxVc8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4alAimZfo3HLY+d0JdVTlVWrmbL+xGdMPbO2V9p+uzn5RROgIZY37rqBIKjiPQC5
	 cblxHWlSth3PG0DSJNRcCiwXIY0XBttEy1iQ8gFkcgm68c35lAvVSD4AlU070q8lgw
	 FkChducVuieGekyADqQUI0/Z56N19poUSGCvW4Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198D7F80515;
	Thu,  8 Sep 2022 04:45:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6645EF803DC; Thu,  8 Sep 2022 04:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F07E6F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 04:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07E6F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="TDpyjap2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT4eHDYINVDMPz6RSZbPkw5BfKpkOc2Qy/pfa1xL2BjJPKXdU7HQMNYk3B0rkEaCsj1q+KKrHn1r4NtVFJ4i5RyIQYXGprM8L6pT80RTjuTjB9JOt6ZXXfRIwHKaUzeLf45vWcWh6PKxnpDDnJj19m/lXcPJ7GrQw145kaPZuX6GLUV3SdHo1gnNLFvJF6TWhJgGW5/gE8J+PI8iE5yfD4waWKWnaDiV/JpNeKIKIu2nAEsdqnHFnVlrtrLDuyC8/AKCzEv+qkQmHlUPSnbFtOt/iNJaf+tukZNMm13YkxfcOSteEnP/swbrU1m3Di9AGEsqXdYUgtt7pKLTmfpq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOQdMKMgEOAHnRiB7MwzTizDLfubM7+kfXGyzPo43i0=;
 b=CpB9aSKEOkmNUJQwgs6wxhNfl+Ro+ZSAWCRm/0TnCI7V7iPZZyiM6X1Rc316Yc8HzrpbK5oYAab9bz6z4XYqudPfm/LXq02/PBzQInLNtcki7LA6N6EFE9nF/UF5JHXkMksIGoHvNF9WiuFPuJtNVkCxH02bohbI0Qp+e3FAzgBIQeyYxlXPSMTU+iAt6jqHXci3DidCSmfaeqqfQayri9GuCL0WYZDxvy+5PrqIeL2FKP0ySciO3YT2Cbc8f0cjLH7W+txkwX3dIkjvX6gaoIPO+1dtMR1A9K0obk8sJYOYs3Aq353qmLM7zqKY6ZXFTsJ32Vshc2uJWK5F9af9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOQdMKMgEOAHnRiB7MwzTizDLfubM7+kfXGyzPo43i0=;
 b=TDpyjap2L+UibrOi/onMb6XQRtoDK1U6ez8vsRyNOhtFi9YRhH980MKoyaWdCs/iblvmxMyw96KCESo3hJDMsGXEaqSEl1bNGfcld9/XeJbl3zqjadv5CipjEPhDCuvFelW0Phi41a1Pwx168OdQmQqdR+C12iazukl3/sb9I90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9425.jpnprd01.prod.outlook.com (2603:1096:604:1d7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 02:45:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 02:45:27 +0000
Message-ID: <877d2ebn3t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
References: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Sep 2022 02:45:27 +0000
X-ClientProxiedBy: TY2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:404:a6::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3459a356-473d-4de9-f64f-08da91442fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EzteU7juTnAKt3AS1Y0RWUCQYbo7PNLR5vElsNxH3y52ClzuGH2Ju7RAjaMLR0lG5UlUPE5i/PLmHohI5EaOMeUjxgLxIcJtV+jkg5NojqjSC2Nv/vqaoBMb66UEJ4w06UrRrgY+augpesQ+SWGBrnYuC4A7rgYbZUI7QKNP7XZN/f7kQ/M6sOAj4fezOCwm7a63RXXrL5G9cd4/gZmfFFVrhKXEKz4QySgWlLqBz+ybJcmOwvgkJ11EuHTJH2HU3gQfk7IlHA02AUiMuDymzjruHV8NzZMYuu8gHFuO+1z9q9HKPtciVnnkP5kfItXAPfTLNNFfKgXQP5UHpo8TOa4qg+uHyITqEGcK6FaIxchrmjg8q5fAITa+ZENpex9KmFm8/tQjy7Gow71TX49Bhmdfd4b8hlsfPGGVDGljOgIw59pYPT8BGqJlA2plwUFFQhS5Zp3dl8Lw4Zruzu28jM6tS84O+Ptb6N3tDcYaGsJT6YABlVIspR3+K6L1dEylc45IZ0OCa7ObK6vQVYffg7BT1MbjmVrGmpljp3DiLb5gUy7ocEN7NRbgt50ceTtlZkGeFue82hlX7tMFYEVVnpvmIovcDqGopn8eqLFHYL9xHgFN0yhHbDmQsUIkw2DfecAI84AsQWJe9CifEokM7GLkj2WfVJqHoehf04ARte3DxPuI1QmtaLZmzq8amC2kiIZ/7vB311ULdIcfec83NUOl+CvVGC0fv907BZsreZynafpHVhZa/fPxcUlXLJG2pP93x18SFW2DfhqAguUjTA1E/FzFzlSs78GXLiGsstKMabJBKxlj+lX9M7Rvb1Rc03y/vJTh0yqxIAogFmJ5QjoWZwl00ICALs7PEo6fjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(5660300002)(41300700001)(2616005)(26005)(6512007)(52116002)(2906002)(86362001)(6506007)(38100700002)(38350700002)(8936002)(66946007)(66476007)(83380400001)(186003)(6486002)(966005)(8676002)(4326008)(478600001)(36756003)(66556008)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?566c1v1u+CmxrmjdlKMTQbhUgXyac5E1HopAlteS/c2C3XLk7rDttaiugDgL?=
 =?us-ascii?Q?dV2S5izYbrMdbFs70oaSF+hEIjNRaEGw16pV+kZoh68G27+rBprTlYQExOTW?=
 =?us-ascii?Q?hbD9KZHipNzZM93i/cj3DBuVEudn1UZMMleoj/YQJpwvgXnQx4YvQYt5r/FS?=
 =?us-ascii?Q?LpmtDdO7F+HMOSv1oiHV7fELpREA/G+7dECezoNABD2WHWoNovntcLmn/uuj?=
 =?us-ascii?Q?RIzCqDou3ejxiBlbHcydwDdSsz+92bZHDMl6COc4KllYP+42sEcyJBLE9Zd4?=
 =?us-ascii?Q?IpXd13MVFxqgQdJFZiUQxiWUwV+aG7WhSdIXQoRkjU887ed2bxECEACTTfZl?=
 =?us-ascii?Q?kJn9IzY2cRARTqOti5GjIzXRJZuHvQ2Ql3/3pWEFhdeNMpUkal1yzu2PIVGc?=
 =?us-ascii?Q?JLCcdNcts4TiLwCrN8xMVlkSqBc2y4v1J8ns58GLKqRKYCUejMqcexTQK3Kw?=
 =?us-ascii?Q?KTQCzZMWSgzfkhguhCQWRFNp6FZGFBE69pLd8HkMxH4QiIEiXFoL4W4+HhYf?=
 =?us-ascii?Q?b5MzwniiDHaehASgSrADiGVcRLjvQRlXUIVtJeW4nmVGjE0YLcUy1DUIpJgR?=
 =?us-ascii?Q?rp6wX+J6z7LceiLqJ9FpmrjecXMzM0IOA92DObVJ/NtCX0T0EaOlYo+U4m43?=
 =?us-ascii?Q?xooB6P/3cG+Vk5I3dQZFAF2fLeH7/VI6drEmw7saPcdtKTdzpIZeDVXHV1VI?=
 =?us-ascii?Q?QrDo04FpFr1Wba901L4aBgO4KK/anv1tZOH/H5572xkfCj1QncpADpHYdvM+?=
 =?us-ascii?Q?ycHOqjPinNYUZtxcAXqqlVyxsAAFYp5OGpl4cRtyCQ2177CD82mdOf5mekxZ?=
 =?us-ascii?Q?nSpIW70ldMHoFxGRd143LMhHc317a0XZhOYs0X+7HKuCuDJJ+flhnhDtJGIN?=
 =?us-ascii?Q?AF8l9ZRRDbGJ9x/miZmd/M1Q/GO4rkt+kMVcAbOyIcSdLG9jVPq7riEFBkeN?=
 =?us-ascii?Q?8i3GoEHBe5I5mcxD8X+maaOKBNdeaI30FHP+y4tYxEZeS6f/5Gs3/5pNvSq2?=
 =?us-ascii?Q?ZNw823zE8t91/knFRx508h3zMrE+jacq12213hiRX1/TYV94V2BU323GHVV3?=
 =?us-ascii?Q?x383glx+IqyVK4QO0d6XcP8JZQZgdt264rm3hLGNUZRuyZxtgwRnE8xj2cML?=
 =?us-ascii?Q?AoYCQNEduif2LlQC8GM72QaR2Vo4LLt+gGlB4Etvtf4ozqV0N34VwEl1IBx+?=
 =?us-ascii?Q?FXdAcPfGBCN6dP3vwL5mzOaEYip7LLHgiRQ5rxJSlpqO1QetjI57wjDO8+WJ?=
 =?us-ascii?Q?2aLnzx/RNfsMPs61ThrOhhrQPjbNs5PzXaxhFqET7dtA/WJi2QmTA3GDZbTi?=
 =?us-ascii?Q?cRVOpMVg0TBYoNvA0UXc16XIF+SgEaYhnywi+YGMuaRj4vHrEsXQGoB8LHzI?=
 =?us-ascii?Q?MlabckZCE/cZK4WQwiyHbYCyHA3z/rqXhP8fH1CzQtsvNTDZXoCy8y2tlLEh?=
 =?us-ascii?Q?Sw6Ekm4R2WFOHpAnQb1mySl+sZo2om4IzvIzMeeONokzmMksExYSu4YCsj2a?=
 =?us-ascii?Q?/tolpobF0JKDqfbvb9nLyWrETvSVRTRRhILa/6rdMIOeGpsp3Zqgg1QClhQb?=
 =?us-ascii?Q?82S0yC28QRc7Y1jx3EWCPKf6sHf1/eMB5l43JuwGx5Gf3cyZ8ytycSIcz2OB?=
 =?us-ascii?Q?wG0IVOZp8a4ciGYSBlBD2aA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3459a356-473d-4de9-f64f-08da91442fd1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 02:45:27.6344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o17XHqtxgdLvvI3hw/Xc6f+ir5jHYacz2zMyhVC6kVaz1lasYk0aObo+YCvxb/hc0thEqzICw6+bAKbAyn3XX6BfSiWV3XDPzNxRljbNK6fZnEmhYzD4rEDsVR1esIjB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9425
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_link_event_pre_pmu() is using if/else for config->formats
check, but "else" case is for just error.
Unnecessary if/else is not good for readable code. this patch checks
if config->formats was zero as error case.

Moreover, we don't need to indicate config->formats value in error message,
because it is zero. This patch tidyup it, too.

=>	if (config->formats) {
		...
	} else {
		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
=>			 config->formats);
		...
	}

Link: https://lore.kernel.org/all/YxiDkDOwRsbXeZ17@sirena.org.uk/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index fc2f75ed190d..47a7bf99472e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3900,16 +3900,15 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	}
 
 	/* Be a little careful as we don't want to overflow the mask array */
-	if (config->formats) {
-		fmt = ffs(config->formats) - 1;
-	} else {
-		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
-			 config->formats);
+	if (!config->formats) {
+		dev_warn(w->dapm->dev, "ASoC: Invalid format was specified\n");
 
 		ret = -EINVAL;
 		goto out;
 	}
 
+	fmt = ffs(config->formats) - 1;
+
 	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min =
 		config->rate_min;
-- 
2.25.1

