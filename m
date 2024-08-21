Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29E9592E5
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D40839;
	Wed, 21 Aug 2024 04:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D40839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724207395;
	bh=zIaNtsMOHeUUGN1oP7AezTBOKzD5+O2snnv/zzXjooQ=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1b6CxxDJ5gztQ6OWEInjYoalxHg2M/DlQyOuPBdfmGtyvuwSaWYDk8M9M6sWyLlz
	 LFfba06TF7tvJJRjxbx2VoA7IquDwynFaWmAo9MPuXKeaIVgh2h3rZkw08Mxte5rqY
	 3+B30UTnzVtdnYOPY4RmnvKRxBnrAXkicZZBmR+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA96F805E1; Wed, 21 Aug 2024 04:29:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18388F805C9;
	Wed, 21 Aug 2024 04:29:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3D2F805AB; Wed, 21 Aug 2024 04:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B84DFF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84DFF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Fwfiw+9D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohY90jVTR8wDYB4U5zPX1AgUCKuWOdatkfjh78pRhmJTHALNnGik+7vKsmnmQp8dSjOYQZdoWX5wzo6FI0VPh0ID6+VNSprUVOQXmXsKs9IxXlmQpLdp+RkU8d7qZ2B2tLdoKzQvnS5VbsES6an5kTwGqNgIWcNixtNKwin+91T6UWVek59dPZJM/UonhZRMIbPvkoXiOWoKAPqlr6tB2ggXC04Sr9Nmt6w7rnxO6PLVrQ0XsL0y6+gL0EDPnl1pAjkS4TBSCuEE0mOk7uPFEoKmjTQSobiU4jqqRMypZCiyNM5trN//v0dRJRvAgr7e9MQdKBo708dd3YzKcR9qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N7URJglFcbRKOp8/FDpjNEuwFAq7K8FHljQGHY2XC4=;
 b=Oa5SMgKdJCnTqszeKWed8gdZFx55i/vfT3wfLo+yyWAAfnHzZ/Eae5z1eJyDEyjXMWwpTkZ7GD+d2Y96xZStTDhdV4Dif5k0ibVv+tZy1dm9h997FFsDTbam3jDMgFRvmakILAikzcnDg0rHbxyCaVv7r+vaovs1l361ZxxKMrGo1e0gzkdEwHIVlqPfoyAcgw+/UN2rww6ND8XRDxa4p1dV6IdQrS8zzH6NWamYL3agFT0+xSlsBCoAFHbkSM6ZCYq/DNwFJlylaF33IEkNA8XaY0w4JzzeAIXhoPzBwMjVSgo6za7GfNfCEX9CAclw3yKeQSgUTBJokSfBgJxFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N7URJglFcbRKOp8/FDpjNEuwFAq7K8FHljQGHY2XC4=;
 b=Fwfiw+9DngRSJSR4+KnZAEkMZ53l/7frco38t7MZG01dhY201Vk2LRPIZhc+cnLZu89G0SbE+KBaaamXgCNKuqmpVqvi6jG/Vz6X4JINq12348kGetEKEpl1G17rdiVywjXh2tsOC5SUdZ1+yzD4VDOTKHElMU9Rbz2wzXfdE3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12156.jpnprd01.prod.outlook.com
 (2603:1096:405:ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 02:29:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:29:04 +0000
Message-ID: <87ikvua9sf.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
References: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local
 function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:29:04 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12156:EE_
X-MS-Office365-Filtering-Correlation-Id: 141bab90-ad87-476c-a786-08dcc18906a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dL2d37kUGLyWDTuiyixCfJM3tGdb4hlPErpCkA6CyYbEeJQUh5b1c7wYLHTs?=
 =?us-ascii?Q?MlgXkiIC4dmg3jr/rXLKVhKZuhPXmNfClIKyl2t+4gr4EPZesoo4C1mBD6CE?=
 =?us-ascii?Q?rtes391+kjEighqXFSScyUsizjRiGzSgTwq3Vj/eeobJ9bzYr2r4BYos7ie0?=
 =?us-ascii?Q?xa74YhfSkigK6fn5w7Feh5hVXooM0CvezsB5KVXU3c1Y/Yf1r7RJxn49hwVc?=
 =?us-ascii?Q?nqB6LvN89LTYkVmgQECseMKsU12Eb7KtPhsQjbBw2u8+hOLeWwCXBX9K3ioU?=
 =?us-ascii?Q?loOik/wAkqWYllymR7hC1ZmmuDuaRy5i1H5b8QC+PfiXSSDBskskJ8KT+0/e?=
 =?us-ascii?Q?zJWQ+/znwtVWExSLY1KZ0BA/pvqCTEOvqpJ8fHNSDe5tk67e2tKw8ITTaR+v?=
 =?us-ascii?Q?2eLAu49Wbueiv6lXmPLFI/K0ndLahF+kAkL1ltiAeik528xa/amArThqxuzv?=
 =?us-ascii?Q?41OyI3O7RfiZVKqexqOnFRQ5tgN2VeGbV9b3xZAdocQ9o8NC1nPRsiaMrJj7?=
 =?us-ascii?Q?r69wqzBRD6xPIe84e+id+aRNPiiRXNl88lqQhCzGveOfJpL65Puwtw1tUo/c?=
 =?us-ascii?Q?fZ3qbsx/rH4hvybF6NwgNV7no2D8HwxgxYVt7EChopO1GIbymRZVQj0iKjL3?=
 =?us-ascii?Q?fd+YFPC8157KVcNngzuaUiAy+pPP/pcdX7yu0A0K13gy1nAAoS740YA3UNTR?=
 =?us-ascii?Q?0UD9g2tzDX2hx7ylNnkMH8jckOrn1By4OunWrbntbf77v5P+kubO5J4ZJBbi?=
 =?us-ascii?Q?YJ9WrmLeBbrdRbDp+fsDcjU/939hlr/E4D5ZGiAxIPiu+eV6HiWBLUClBzsG?=
 =?us-ascii?Q?nMHvXJw/MvAxK/L4qjSq+NsYp8aD5y4NmOrvG/1LkdWquLeYwHj6az2bE0Lp?=
 =?us-ascii?Q?4d8vHBCYJlCuzGR7BmAcp+m+8PMtp7StneX2AqWuMMexcUvWgduu2TeGYaLu?=
 =?us-ascii?Q?uNycu8W1ompVUO+VNOW2ZhDvr7ecH1yo23AAYT/lJeWcOBbgh0Uc1v5Kc0/B?=
 =?us-ascii?Q?xX9wNHTM8AkzYSV9DEPepDpplT4Vbbmi5i/LfYh4BRCX9LPr+te7GmKWxcgn?=
 =?us-ascii?Q?5o6hrGcRRK5RMdkIsGgfagKzhvGs9P2XALJemuEDXl8rAg37FWZE9baSh1Wi?=
 =?us-ascii?Q?k+BM91aelAFGmcESxP7OAWQH3EPEM/EVEVugY0mAcSqy/yAwTy9unP295U6S?=
 =?us-ascii?Q?KoSo5JsBvJD5Al0sjqE3HQqEgkGLBNKSDlVh3GQHHzO+4e2HraabJaUb6j6S?=
 =?us-ascii?Q?8+gGmxmkZAxwOuzp4biP70Wny6I5tGVqHvwaulu0kibfEN2YJ+89HPVZ0CjO?=
 =?us-ascii?Q?Hd0M6vZ4POvxzaRBPtd2qj8JznQC8By8ixKgTTu5JRr+A199eQl8i5zq2RvB?=
 =?us-ascii?Q?MCb8L7IfWRBg46Yz+v4M8gdUg02KMyTwaoGbtJfTcA8+SKxRHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S+NIGggjS0p5YokkVDj3PhBdAaJno0UT+dVFnU9CnaeeBOBKU3e0+AS7fbah?=
 =?us-ascii?Q?6md9d5PQcU4PACOQsNKyl9TyMdKJhKZyym1qi7Bh7anvW51KuDQcTFX68OtC?=
 =?us-ascii?Q?EtG5GyoVoJjVDiQPfQe7t1/J4e6Hu+LG7l9IFTwc4wwpIOAVBK54R0tMkz+X?=
 =?us-ascii?Q?fVLxfQ2u+FBYSP6bmM/m+Sg9oiu4mO33J/psJT8NjWbz9YON1rZeB/h/duRu?=
 =?us-ascii?Q?wtSn/wamEMFrkqdrifCM7fAwhS5YNdd3GCsWIRLe8KOla35jRVFuxqSkzJzd?=
 =?us-ascii?Q?QptUg+f2/vKdDhbZEcwaUtDzo/+YYvTY/QPK5pz05orvJw1EHB4DGGM1VssH?=
 =?us-ascii?Q?jqKKt7TfzuDPogXlBltV8kbqXvhfVKlr7VnwuY51T5SFXyQreUTjCMYiTHT/?=
 =?us-ascii?Q?DQ1YDfGZfOM9hpT3Lch/LbNvJMMxiu51q3FWVwG/p0vF7pPN+MJx1u9juTE/?=
 =?us-ascii?Q?gj/sJy34KfwexI/f+5HRCzx+Dnjbt2zkVeMEBtCJ+9o79HXNul4dlJW3rfJc?=
 =?us-ascii?Q?jPjBmh7C2gTaArPz/lNC6ZbtRntFWowjgVcw+RY0xJlP3oOkB+xfh0WOX91H?=
 =?us-ascii?Q?MilzwduTGTnPLm2AfXDrTII4cj4zeChoVMOy0syPfIA0/tjpXvvcmCc+MN6L?=
 =?us-ascii?Q?WhD+KpSSFURF/WzKJ4lBHvUzGDtO/fV637jMleQca0dBIPmw+qGtMjoQvMTx?=
 =?us-ascii?Q?NePTrBHn2DxOFLcD5nGmSf3vKOaehz/oS9wShKiYMO9+AXgJk5BKt644/AEH?=
 =?us-ascii?Q?l+cm5Gcu07AeHA8RLfTX6AkMR//kXLC42CyVU73GfFkthP3Y6kTbnvRmcxfU?=
 =?us-ascii?Q?dCaV2S2094UwXirUYIubLgDah9RKWIAFYMum4Tov44MLnLjOlUgoyQwGHstc?=
 =?us-ascii?Q?8RC9Y2HOjq6sOwkE8n/KqhlW2K/KJjySd1h4y542kuMyyaUMe6kwFlRvyHo1?=
 =?us-ascii?Q?BUkPs8vikv0BkLZVin+Vz3fJIcG7ru6YKCLKO+TnO18UyR3TtCgaMHT1BpXT?=
 =?us-ascii?Q?Kw6T39hVKmB8wXtl71/FPXZjAn1nJ8F5v4ce6lAgvuPMapIyBY5iCR43SMEi?=
 =?us-ascii?Q?LKG9dnm7rVitY5lskylL28aervp8wqO7SDEHTwMbVryg3LDn82pbUlFNamZJ?=
 =?us-ascii?Q?fmaGyRYI5TOHdUdApT+4IhfqNkn2q8f5MN0olPDW505eLTOFZ20UHTO8adhX?=
 =?us-ascii?Q?0LhUvxsG/HC/6mpJfKK3Bs/mmEklI2/hCMPJf9J5zCqGGXwC9+iVd1arvtfv?=
 =?us-ascii?Q?gnBQM1j/ajKUO3Xk5o0v5HvVdtn/S0r7nf+sr1NqpoamxKxgakab99w7qr4n?=
 =?us-ascii?Q?pMR0fuRpYwIjHkJiRHTUZLEOuVH8IkP0Xz3hXbhG/GCAoBjBeAkclv1m8ai9?=
 =?us-ascii?Q?/EH8Jw+kD7AElR/eeAi0m3lzK1PsYz7MZoE/hD8SCmMVPNjPZbeiCKD3nzAw?=
 =?us-ascii?Q?vYa9K+iSLPshz+iTkN+5xKgbEwiRa9Wta90yV6/fQgVjL+T7a45Q6Al658fc?=
 =?us-ascii?Q?XhmRHbmeWRhtJyTgW0MnvkGjhbntAqBAV4M86Ci89i2/usI+PnscB10QoViG?=
 =?us-ascii?Q?7i7z0Dh31bS657edVY0k0qI9BeV4hZE99nrbFj6AS/bvgszRt3SPSDMUEYRQ?=
 =?us-ascii?Q?j4NKp6A9yaukpg7z8+jzXS8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 141bab90-ad87-476c-a786-08dcc18906a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:29:04.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lAM5KxSYNGqZng0fBVKTrHyeKOHEoUvtm3wUbIGHQuvQ6WynB3+WsdKpE84fhgjb63BsMZcC5lB5bDMPCdm4upIQCzQ+roKcIZ+I6bRsOGws03TQp3C3CPKr4n28OwM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12156
Message-ID-Hash: 4I2XMG4F2U2OX3HUOBSFUJGERVYT42VY
X-Message-ID-Hash: 4I2XMG4F2U2OX3HUOBSFUJGERVYT42VY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4I2XMG4F2U2OX3HUOBSFUJGERVYT42VY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. Let's makes it static function.
One note is that snd_soc_dpcm_fe_can_update() is not used in upstream.
Use #if-endif and keep it for future support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dpcm.h | 18 ------------------
 sound/soc/soc-pcm.c      | 23 ++++++++++-------------
 2 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 773f2db8c31c..c6fb350b4b06 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -113,24 +113,6 @@ struct snd_soc_dpcm_runtime {
 #define for_each_dpcm_be_rollback(fe, stream, _dpcm)			\
 	list_for_each_entry_continue_reverse(_dpcm, &(fe)->dpcm[stream].be_clients, list_be)
 
-/* can this BE stop and free */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform a hw_params() */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
-
-/* can this BE perform prepare */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream);
-
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream);
-
-/* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream);
 
 /* get the substream for this BE */
 struct snd_pcm_substream *
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 667d8dff1314..c421eb663a3c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -50,16 +50,17 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 }
 
 /* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+#if 0
+static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
+#endif
 
 /* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 			       struct snd_soc_pcm_runtime *be, int stream)
 {
 	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
@@ -68,7 +69,6 @@ int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 		return 1;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
 
 static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 				    struct snd_soc_pcm_runtime *be,
@@ -103,8 +103,8 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
  * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
  * are not running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-				  struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+					 struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -114,14 +114,13 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
 
 /*
  * We can only change hw params a BE DAI if any of it's FE are not prepared,
  * running, paused or suspended for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-			       struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+				      struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -132,14 +131,13 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
 
 /*
  * We can only prepare a BE DAI if any of it's FE are not prepared,
  * running or paused for the specified stream direction.
  */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream)
+static int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+					struct snd_soc_pcm_runtime *be, int stream)
 {
 	const enum snd_soc_dpcm_state state[] = {
 		SND_SOC_DPCM_STATE_START,
@@ -149,7 +147,6 @@ int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
 
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
 
 #define DPCM_MAX_BE_USERS	8
 
-- 
2.43.0

