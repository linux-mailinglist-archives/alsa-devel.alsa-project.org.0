Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A766FBBA0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8EA911A1;
	Tue,  9 May 2023 01:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8EA911A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590013;
	bh=ZJj6L2IyHkU0m7v70oCDiCV3ec+Xmvy7r5v7h0vA2fQ=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QfRdtwbwbxee76GuuiLpf/xrt5f/f1UbGEM2gVisv08Teqmi3v22QM9+sOP1Ubdo9
	 3DwJIaq9qzu915J+irqzaihNXZeSr3LHf3inHOr9FUxhsN9m05uPAlpbYx6FGUOA8o
	 m4irhXVP2lo8JwypPOZZNR6M4PqDzlgD17lpkfh0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C745F8055C;
	Tue,  9 May 2023 01:52:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66A55F80563; Tue,  9 May 2023 01:52:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD827F80549
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD827F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=idn7JFkq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqRdyv8Y32+TGkzfT/qhSBpS0fhHD4fLmy0auw9xWR62WXsL4M8U5e/SP1zk9UPd6ozwoaCJHa3gTKoMsgA/pfn820Fi8w5+jw/qjPW7BIoqA1ct+3Ct4un/Ta0OSICxjt1UC++zH9Jgzxce6SLwuark2Eyv3hPZzHPwywfHtNFcIm/yfAqhnvIPTwH8MkbAq2keEmcdlmMmu19JaC3Es3loPWbjW/DoYmRwZaOz5/NlE2+ffiqwMa/9Ug6jmFuO+ZMeA7nBWYJHzeQvFUiIRvmj2D2mgzDyO7v5VrBj1aQhUKeDxEXfKQaGesVtSZ46ZSDxsD9NwJkG2w8zJY/SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brsO5m2NcuD7PSPK7lBj8uHBboetIwSFbmapRzxiUcg=;
 b=evKru7Jn3uMY7ebTi/HmLs8j5h2dz7cQRwCegoSCPwQgoiRK31f8ROK3uDyutZWXVygHFOxBk3ra/tJaQT6GDxM4C1ruOFu35c0JDvC80uqATfYcmKE7ZPAA7PmEI/YqfMZ1gUowWofFn/Hv/Gt5CQLw3jKstarqyZEMkne9QybyYIhTXe4EmgA0l3tPvdh80Oa7Ll4yfvgDh+eMvYKxRpLR5dovZzZ4UBU8VwtDV6ZnUP/6vEITR/5lLCKSdCectiw1Nwv9zka61QczxLQ9uF4n+wmp22r08rApcsGEeWhpacryfnCqQWJX+Np/A64+x2QNlUk6ldv+O7z8Rp1iJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brsO5m2NcuD7PSPK7lBj8uHBboetIwSFbmapRzxiUcg=;
 b=idn7JFkq3PJqHpvAfykRxg0mItpq3HdKWif1HWsppWFqzsM9SAwjIf6bHg1VOT9/Y4BSWET+Zurn+frDFl4lQFxFUp2GGjPzAMvDLYv8ZAseg6JBxo3p7j08ymeCX2zJ+7L9I7jD/crSdYA6nT3oai9wXr9hSf1csMce1O4Sc4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:51:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:51:56 +0000
Message-ID: <875y92l6uc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: [RESEND][PATCH v2 07/13] ASoC: atmel: use asoc_dummy_dlc
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:51:56 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f566f1f-7be6-42b7-2b3f-08db501f34ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w9AZLb5tTld2CJ1A1LJhp+lBxZI0q/jcRso7ZqgHuyr61qDxIwqTZCdvlHH6HsVYQThml2MrubviwnkTT76qsXorobK77UJmtM7kYSLcqzc6+OIEC21M1ce5TWBZQJTvFOUhtiINGn/BIzQsai/p1Re17mtB8jyp6Koew5IHueGwN3LMHVpOp5T9eWwyLD/2M2+/qETeHUmZNwD2arFwAYxqhBL1/7MZ7+fIvdDIHZywg3HoFNFOrv1jTGkLdpq1X7FoIfRZaVJ2Jw9EmzRtUJ0gQ3PUxoPaTy4XHUwWiXnYJyn5p+sxQDzV/cZbKegd6dWNVbHeCYZpvn1KRuCoLzffdUsDfLJNTFGZ2BBiIsijBF7xpC6CzqH8nPKhEg6Jw+TC0nAYvA+14IPQrexfA9ICG5hXfPMXbOsLTuW4U69fFwqGdbG/Rp+0sFgR7q5Eqq8IkJN1cxjw5Dz1KzHNv/DY6/0DcWGxrRMaJSSPftxwHAJK4gDwivFfQgzgj/d2Gk0m01G90iRUf2zfEngnGeAbVIKd9qId5qO3o/xgR2mu1GcncNwzM4qQQLyIJK0AJTakiQ7EQ8sfuX49ixJ3KsQ3VDatNi+aAhwnCRKehTXrH0Y69deM8LM7Ib/QB0Zm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zEqZYzEMD8pi5wnmEpRS05r0hmhO/2dN0VR/5Fqztchk/fpAOOCBPWsmdL8C?=
 =?us-ascii?Q?PytyoMYmAAAY/aBABBRKRnPifjWCjEbx/mEJ/ruN3j+i8r+05V4w77+A7TXW?=
 =?us-ascii?Q?tHa/XPXkOlJMBNqVR3PY7D2OfJB+giKmyCCCvfR8Mi6MkrjftazNGHbTiIx1?=
 =?us-ascii?Q?YdVGZQou8ZxCcqGDFiXnGCqb9vWVuo6Ln0TxJ9HogaVs6MSxLqsei36u68PT?=
 =?us-ascii?Q?JzBwPcnAsQayRTvbg3nMYc1tnXmu35sx/vMWBTX0PUGQbruEdsjbGYMXpXnx?=
 =?us-ascii?Q?1eSzCh7/Ft3pPf1uSfP4jDlOt3DCB/mDXGVGAQoj4jY2AjJ4tcAKOuqO31NN?=
 =?us-ascii?Q?O0K5tTU/IAYoagAioOjHNv3qloRL8SXQ+fPrjdSdAbk4Z5B+BPOZydkJ7/PF?=
 =?us-ascii?Q?0dzCisJ5drLK/4awVcns/FU+teVowBKdly4vb1Fzo8G+kBWkd7TWBT5eyg4+?=
 =?us-ascii?Q?4okJHWxS4Az/pcIeLjvegq1/+6hUTKonOOqvCf2IHTz5BM7Rr4KZvPMa/1ID?=
 =?us-ascii?Q?IXfkkMr7IhkVW5Nyd+8z0UdtCj71kJ0iG6l6m3DdnWMuLAwqClczp4Lk7Rql?=
 =?us-ascii?Q?VpGdu9sF8EiTqOfUSBPaPIpTpc6sM0wYURFh1dGOnapXNg2yGdqLw0bY14Qt?=
 =?us-ascii?Q?aDS3MxZZDUs/uv1/aQni4crrjGgnnG2ERr9VMfUr2ThTVL6VUcdKpxYhrs6Z?=
 =?us-ascii?Q?O1gX0+nXsVwpN6xUZUs3qaWVqz9AM3zYitQnQoQaiA5y6ayzXUMlepG4t28j?=
 =?us-ascii?Q?YHodSYSkQz+mkwilLfihobV6Li5ZmjjBBpZx2CaeBO3ejNcCfIdaddZC6ycR?=
 =?us-ascii?Q?K2ISnDFASqIQ3nmzC1HG/5pt1Cf1XEDjZt+Cc1z9cj+dsrYfqLUatwB73ZJN?=
 =?us-ascii?Q?b34UxT3ZNcPwr6DP1ShWIcp76Lj/P0jcFDGxMySvJAh5ergZ2mhwkeJMfSC6?=
 =?us-ascii?Q?MBZzntenKYizUJF9xR99WMb7Ju88xssuYoc3M1LfrdL10+eDr7Io0tzH9DWq?=
 =?us-ascii?Q?viR141wzvnJr3vSW4v6CpbQM0zEzOOMp/fX8q/jht/9EsYLg7R1TJesD3CZg?=
 =?us-ascii?Q?g9pgHgt3t1BJ6EI5rUxLvcizentjHFvYdil9lAvF8YQtEJ/IqtMCn6lpKkfq?=
 =?us-ascii?Q?l2S8qL6am//nmfoMo69ZcbOQVZ/CP7QmUmmqEvnq44JORV0dwmJnr9GH76Yb?=
 =?us-ascii?Q?hCpMUgbBOf8RK/2r25ebZbsu0GqnLlBIbNV1MhHa+OYWt7qSfdyY6kS5P4td?=
 =?us-ascii?Q?9OK/s0KAzNtrdD9/jhQvOeymb1VNvwC+/dOMRv/GQYLMJkpPrJbGXDGpvZSk?=
 =?us-ascii?Q?af4W8ZeQ7QZrN6HHfJvqWMQQCKO6mrkgeRE0sjlk7KhUNOvdd6TTuRlcVXtY?=
 =?us-ascii?Q?13qULsryIwIgs5iTuiqeN2gS9gcloNJnAdZK/l4nYwLGm+/zDnqLgn6/qAsD?=
 =?us-ascii?Q?I4tQe03TjEVhu2GSIP3GatRu+ULXVFlNOz1qw21PEA+F9DVdBwyLOZgEi2gT?=
 =?us-ascii?Q?x4JiEvsgnkOghADHn17sRTM4R5PPOr6xnHpwD9/U3uitZG166hW5LoVJZ89M?=
 =?us-ascii?Q?YoyXUzlTHMqTY+r8Idb5MmIGQUqV/w9jw+h6eYa2VHEE1hHB3ObsZM/vIMpf?=
 =?us-ascii?Q?h9lSYIvXH3NKSJ5Ky8oy/Ek=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f566f1f-7be6-42b7-2b3f-08db501f34ea
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:51:56.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6P3lQ8OjlZIVIzD26i8WicJlasqkqXY4J8KV0wFC6kADg6bybcJ3Bo0yOEYJbfeMth+EMXZZn6o3ZFtIK+DqrT3tKRddkSN83si0euKp7oc3ae8IyQQD2GtMXNOgS+NX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: 7NVQIR52NQRBS4RIDIQTCR5CRXYKFNVB
X-Message-ID-Hash: 7NVQIR52NQRBS4RIDIQTCR5CRXYKFNVB
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NVQIR52NQRBS4RIDIQTCR5CRXYKFNVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-classd.c | 8 +++-----
 sound/soc/atmel/atmel-pdmic.c  | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 007ab746973d..4c1985711218 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -473,21 +473,19 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
-	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->cpus		= comp;
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 00c7b3a34ef5..efcbdd1a629f 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -496,21 +496,19 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
-	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->cpus		= comp;
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.25.1

