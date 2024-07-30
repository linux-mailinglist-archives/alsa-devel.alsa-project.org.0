Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21758940419
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2822C857;
	Tue, 30 Jul 2024 04:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2822C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305205;
	bh=6do6S1o1rR/JVvhc50i1ZnGnhSntXzfeLjtgOocuVwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ff+/xnTL5Jfgrg5wcfBTN5hu07iFaUG3LgkJLonrpcSaIjbIuHOYneDXUoGOX3LSc
	 26nyP/rWc48//Uf+e8g9Zl9HfAJyaErDSTz6/DGApSOw9BAOWtm7eVoDRKyVwyJKWA
	 gdJ8ttIGgCKkJ8XuPxKkl31gxmvi3C3WUBNDmK8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1D9F8062D; Tue, 30 Jul 2024 04:05:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15873F80631;
	Tue, 30 Jul 2024 04:05:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFC14F8058C; Tue, 30 Jul 2024 04:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E8A7F8061C
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E8A7F8061C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BubbG0DU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0p28a3MOA80HC8mvrYO5RyS0Sk/K8t4ICr9PPYpSfMQkCW4IK6x/NiML08FuULxaS6JEDfdHtnSVJ4Ba3IrhSEGgtB5gVFYFkw7Fgr4nmBTP9X93BiyVFEn1m9x/nbKQsyjG4h/R6bNAWjTXSuo8dZ7/QRaUa0RWOg/j6cYKO+479Ob1hkMr2qb6M6NWDlGxOeUh1mzhTMmZ6qP3gjnCbm8CCnNLd3WhXcNHEo/PthnYopXbVVTnEU+8m5rfmNFakb5MLUrZT4xi+tvPV+T5g+Y9aJOGCyILCNnNL3hxYgIBnvp6h+XbI3QJol/Smcmrt5cya04JBdXrH8HMVU0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT/Imv8of4dqCWv5bsyovsBptZBcsLPOYj8SHpWS1cE=;
 b=MKz1UQN5JG/oaf+05LQAb/3k8O6sZgfLa9DQt2AEswWv8KXaxPKk48rqoxEyFERJTNtEyWhF/PH6LyuEsqvv4dTS20FBncd9gqZ2EAIWwinXWz3JNaitWFfScxx1uSiDDgW+P2xfJo4Pakkux7HrXKjzMjpgrCeWdrYG3tsXhhpRkqrHWu3Wdbv2oj9yT96y8SWYgC/g4n+8kLoBVXiK3U1GfvURhZlkM572Ab+hSimoqvBwGoAPjVFIJ+S04y+zUgDSTIcRTSl3BdcvjYApJRZJJH9ovgWfT8RpuXuaz0tIxuOT6WTYBjO0Txkrn1wNepwmMQY4A/Djf+/aXEyd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT/Imv8of4dqCWv5bsyovsBptZBcsLPOYj8SHpWS1cE=;
 b=BubbG0DU7vrTOaxwwUUim7+HdajW3mffuxEXMV3f4pJ7bUbgFNCDIgl/BTor0uNrFf1sqEb8xMJ5tkRe74WEfcv7XcDaA9XjRkMQRa2VkVL9joikbmwrBFOBsq6HVJ8W72IK7GgZmWwRzH4Apcr9RBBoIWrbbldSdOtHU1qKOyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:24 +0000
Message-ID: <87r0bbk528.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/12] ALSA: aloop: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:20 +0000
X-ClientProxiedBy: TYAPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9f9356-c915-441c-c3fe-08dcb03c10d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xzgR8V/k/3NgmKYEAQzrrHFL9gUKrlSuliHsl6D54NmlatsEOkCpvLfZ0tkw?=
 =?us-ascii?Q?6Ifro6xPxLzGft8gH3r0rMIpanl/02l1e0tpFvT/1hQaJMJ93fUqtKDzwhGS?=
 =?us-ascii?Q?zhBpXF0bIFDGY/7z5Xqc2VTb038Ldnz2jyFgEFXX4BwCVi3mMG1wP6bvBqWG?=
 =?us-ascii?Q?wP085DfO+GhpQNVOcdrpQOnEpRwij2116CZZI/FKwjahkl43XTC/6iJ8LDZL?=
 =?us-ascii?Q?XKfqo760aR5Dyr3+GaPvtof8sdIuM/Z8CO5EwGUi7oNj1AENwhehStvXBCNs?=
 =?us-ascii?Q?SEXyaYQGvcVRFk4seHSNdy7d2rsenhxdG9HGnWWwfEDqW4yRdehpX3EGewk6?=
 =?us-ascii?Q?RMFOw7V2UXSeRrT9lXfviRcG+4PNY6n4+ygTyBkh+1CBZiNd49fYQqCF9C/C?=
 =?us-ascii?Q?etUzjYigCbXOSK38Z6M5azUo9De7BM9nnPIOtJcDhkx/Jn+cWWfGAoNu05aV?=
 =?us-ascii?Q?iZga1MPAFvbSxsObIg88yvm4/Np090ynTFlTmiu/IpHbX5KgKS7J3FdyUH3V?=
 =?us-ascii?Q?+ZpFs9QpQz0p9T2Y5Sb8j04DIuYsACWkDR9FP5PilumPO3LOVtrr/3yPg53b?=
 =?us-ascii?Q?PpwjVh2AJyyOgJTApMc5r+zCEFkt1cDh79wFsHZ6b40o1Ag4wztO/4MlqHwh?=
 =?us-ascii?Q?DehDgFIjO/aFiWA3rQdJFOxBNUS/wD1EilIX7CWwvpjlC4J37AHOJlOCbvCB?=
 =?us-ascii?Q?qzDWMylw5GH6CKflyMRykzcDBMSsMkZdutDt52AfC1N3V6uwp/5bsyBm52zm?=
 =?us-ascii?Q?yxShp+Ve/wIIRVqtNPyKpSyt39eCmYzbA668m3jv1Ocah8+7VziWMeCCS2N+?=
 =?us-ascii?Q?Ew75mOlcrFCHcgpgEK00xaAucwts5vhTK4rdlrlzjsNKKy99uK9TLbiTQDz3?=
 =?us-ascii?Q?xsB1MwnrjKLLeYp+D3w/eIRFff1Cj3thh/4YU508tAY5ACnmHlwt1p++ifX6?=
 =?us-ascii?Q?XnHvcm89kzDWuubjDUz842lj89B0dLfGmrxS/vhF0bbJM6tOq6Zdr9Zj+vZp?=
 =?us-ascii?Q?PcVfbuhsMIz/GrLJIz9dVhvYELFMMnR90ovIlde0NAj0j4o1moo8NPrJq7or?=
 =?us-ascii?Q?Zf4Rh52dGkPfROLNTqbSFqDd+SUtssPPLrLTUbl3w0IMomylt3kWfFMmWxMV?=
 =?us-ascii?Q?KIXO/e5upnVYL6uGXQSnXlkvL2LHEKMXwEFb9erjUPRUiAqFZAjRhLKIulN6?=
 =?us-ascii?Q?TBUeBOjRdKhDHkEHq8ExbqF+wt+oh7hREGt/xXZOpLDYIe+Ohz3hwAWAqol9?=
 =?us-ascii?Q?n3hu6rHd53DXosqN6E6fMlIqgawXr8gaxgZ0olfhDr7o0wjENpVSYvOz+Dls?=
 =?us-ascii?Q?QZOgnuIVSZPjF2+m0/2Z6xssMWtyM23GRbPe/wXlwSI2cJodZQWLg++t08ZI?=
 =?us-ascii?Q?pMRlW8bV38SvIDm8o3SAw0Kwn6KuUO/Z79ydq4jyTFf/5KPMmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z0v9NrZk/Fj8VdbMT04EJ2J6912lvDoTuUQIP8mxnMHV8JLrQAI/vEWV7YqK?=
 =?us-ascii?Q?OVmdywWLDnvH1MsRvG8zpAtCUOp/QBIx8SZJxLgCtookUZIlOv2SLkh93+6A?=
 =?us-ascii?Q?65QJINGrvOdJTPb71uALar2DQgE+rdCf9OcBVzZOw38hSfP0guEJAIbav9Q8?=
 =?us-ascii?Q?Jh6PfyHVOG15YpMHpUKxjWlFRycoEdXo6RdZngTwD+FIW6D/VPri7nwD4L/m?=
 =?us-ascii?Q?Jj1Whl7c19rlEVJk9V+kyI5C8WzF7gC0NbJLVsQzrDe13GpD4OXBcC+qOYBs?=
 =?us-ascii?Q?gHq0dokmddVL0zMFa0a2duI4gPeVPMsLehe/w58kMO/0Wjc7azG/GdfwrT9u?=
 =?us-ascii?Q?dUEYWVOUDzx2aP6/4PSCqdF5BQksKXth7UBhE2OF+1wg8Z+QxI1u0dnnxMxE?=
 =?us-ascii?Q?ClyT4VQPUwJSF4qUxCzosp4rxqbByKKZA9QEMY5emGXbHso/vjC7qHYSCSFw?=
 =?us-ascii?Q?OX12hwmEQAhL0aCtyZPPgU7JnjC26Y7DrXt9Icu7hsSX5eGriaVPDWVpcfFM?=
 =?us-ascii?Q?2IzxlKtko1evU5luMN+lM+VUzmehwlyuo6HZCjdl/TGOa9br5bRp1vaRHXZ+?=
 =?us-ascii?Q?a5u1GxmjBiy0zhTOqbyDewojAb5vmLAdAYSq3SW4qiQTMabY17GSoYH0qVwD?=
 =?us-ascii?Q?tGtf2wv9yCsmhBzbgLVPdcFaG/RjRmi1lcqBayFBbb8Py+I5LkJaM5zUQtOR?=
 =?us-ascii?Q?/ZIpMrIS/YsO0ZGAVPn5TTaPz3gaL9h/JD/xMpfVPlLqugRMoFQgeidK/kxY?=
 =?us-ascii?Q?+M6WDVZqb2JwgDDBzA9YvWYOp7gRS7DmYNFI9OI6CyTOffb2y0ZV78B5kmfE?=
 =?us-ascii?Q?Kuq4r6Y76JFdGrM3vkG5pO/7R2rbESjP4YH7730F6V9PnQj6LnrAL+egxqMz?=
 =?us-ascii?Q?Ur02CYUq1t4HjuaHEfRcI5YNr1L1WbQeZ6RaPGn5u0OocpX7FE5ilbbqbZ5x?=
 =?us-ascii?Q?MlIFv03STCcIPTyNa0QLFZ2JJErPISJTD7IF2P6HY+hkPqqZMJgfZdeBRQQg?=
 =?us-ascii?Q?M3O05AKY0xSgJ2VSWQdXfud7gT9Jvx88r7+N4pYLClsllGWD0N/tomcIiNJ6?=
 =?us-ascii?Q?RAtRwAVffLEvl2ms5PeMvyCnJRgC5K3siU61eWOUg1vRz/fNpW/1abYJMfYN?=
 =?us-ascii?Q?3nCqqpWOpN/bo+Kxr3/h1/keJo9FKWEWlWtmA9goODHF3mdExN1gWL5XFRpe?=
 =?us-ascii?Q?+HTKD4S8/+rI0VGvsXZ1pYDh5TY5KxrPUnJ7bRkG8m6eOa4caBJV36UyhQq4?=
 =?us-ascii?Q?RBTzN8sJLz0LcTvbF9uICatYvXPTNRKnSRHinpC+fk/VeiMswTwMVHQqMdRz?=
 =?us-ascii?Q?7rYmYViCRyE7GkMGH2k2w0AT6GOJb85FQQq+ye7xtomos41cB4l4HtCtf4vo?=
 =?us-ascii?Q?5z/FRoK5uncoKOcMLyKLFtvv9EnPl0eaHaMGO6OsfhlU+g5xCF2P0qFEO8BM?=
 =?us-ascii?Q?k1T51qnCl2DS3NoxHPl+0gQ5zdotca/WOp7ILeJ1LXSgs5+Cn+xsuW4w3lkU?=
 =?us-ascii?Q?7QcL3Prh+XVhIxhUSKZ7zdUHTM+prw14a6ziswh32Je0Ov9A+2G6Kby8xHIo?=
 =?us-ascii?Q?j8VGLAmn7lZoq+N+kzMHZUboEll46zsXgf65C2uUHCX7ov+NK42+On5qj7zZ?=
 =?us-ascii?Q?aopToeUMkaOiW1D21e7T/0M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd9f9356-c915-441c-c3fe-08dcb03c10d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:22.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tIBV9O2pfy3h6yi2F/OkcRNHarTwliwWcKdwerjig1gFxKRPBlF8D9xW36nZIIr0xGGGSfAOIPma+iEl8C1NoFnrf94s6YnS9ks67NFm2hW+OFNgm4gZAd4hNk61NgWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: VI6UFPJANNLLHQVIJLRT4C36ZAD4HTDW
X-Message-ID-Hash: VI6UFPJANNLLHQVIJLRT4C36ZAD4HTDW
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VI6UFPJANNLLHQVIJLRT4C36ZAD4HTDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/drivers/aloop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index d6dd4b8c750ad..439d12ad87879 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -900,8 +900,7 @@ static void loopback_snd_timer_dpcm_info(struct loopback_pcm *dpcm,
 		    cable->snd_timer.id.device,
 		    cable->snd_timer.id.subdevice);
 	snd_iprintf(buffer, "    timer open:\t\t%s\n",
-		    (cable->snd_timer.stream == SNDRV_PCM_STREAM_CAPTURE) ?
-			    "capture" : "playback");
+		    snd_pcm_direction_name(cable->snd_timer.stream));
 }
 
 static snd_pcm_uframes_t loopback_pointer(struct snd_pcm_substream *substream)
-- 
2.43.0

