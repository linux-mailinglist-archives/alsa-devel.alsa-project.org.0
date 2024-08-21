Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9695A81D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 01:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED51D208;
	Thu, 22 Aug 2024 01:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED51D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724282658;
	bh=F96Q8FxTMXYKdOv0frq8HcrBLbfXvZ2cNKx+vn3wdjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UUYOca4P868646Lx5pGwxpqNnqZnTOf/a4qlZbNFD3drP3ufqmIoAxWho5gaEmlFe
	 YA5r5Mr+g6WeUMk5teUtBzvOA7/lxe4CjeTWsMClcdZ9b3Ir6y8GsIrApj931/TsFS
	 +2iD5QjSIXNRxiTzkOp7fFml1UpSgUsBqiKcR8oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3643F805B3; Thu, 22 Aug 2024 01:23:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A75D2F8058C;
	Thu, 22 Aug 2024 01:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84C9F80496; Thu, 22 Aug 2024 01:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 742A5F800F0
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 01:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742A5F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=plF+KfIR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTuvA6qL1EXSjzmF4BuPuVuKrD2XdruDcb6jrb8XBTkKQfzPc8+aMuMbovcsfmrKST3wyVbUasGyWlx0TMUC8CKcGAd4FTtKtqeP9gXIO0bFsB7CKs5YfTGf8FLjgrdQ3/3vdjtKnOhg/X5cKIPMHKrELnM2QIekB8TODqbdRRVtrhPmlYVBL0Wc51QXgRP6cP8FuAUP4b8MbWAm+74YmsuWeuiTIXJ8X4dl2kBQqD6oR9mcjDGLUROILCVUxww6sB6Tbw1OLgaxtRB994iEyltvH0Me6f54Z+RqwKy/n5D0ThiHIKdcJwjCSt7bpWAiNxlkZWZN+8TN4UwQXfte4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0mBHyz/8BJ0uSbmBlZl4QktEVXE7yfEVvYdG2njIUE=;
 b=BTdvnLdTdwiYoKvhoziUFzLrcP3mMgzCdRURfc4LcXTgnYp0gY4fncmHfAtu7AOiMDkWZSfceiQ4FWBOukk+ilmHLIgr4dWmr1d70S/2r2NtAbYmlCghpeX5s71Qvnnv7bHKkLRTfJ2BPNMUAp/7seyrKYfjTArOfpUgRQIRXBtCT1f0LRp+GQmou3xdFSptvIc3D+E0j3nOMcuc3A3xYDDek5zhVgabqxO452dsJM/uRlFJsA6Rt7XTBvWjNed0TpGINFCraPS9HCYSQJw/c8zj5vXwjl+b9D45bwx+63qNqofg1hu/AfOUCIjFmewMOy+BGhnvs8ujFEI4CdVcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0mBHyz/8BJ0uSbmBlZl4QktEVXE7yfEVvYdG2njIUE=;
 b=plF+KfIRt3V0XhsG3NROblMn/GnWeZffse1I+LMo7uoFTnyllr2H0SOh4r1FBYjN6PUmscU6ZZ28p5FhdO/vIeE2ktONKXYj+bOFjPhW2aK5cF4hiTXrK9uGsrEEspTaUcrF17FVh/mtNi8tQCfAft0vlsaIsaJk/m2DCBl8JwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10394.jpnprd01.prod.outlook.com
 (2603:1096:400:24b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 21 Aug
 2024 23:23:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 23:23:24 +0000
Message-ID: <87v7ztjw9f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx()
 local function
In-Reply-To: <110f01db-f5e2-46ff-a3cf-90e1b00d289a@sirena.org.uk>
References: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
	<87ikvua9sf.wl-kuninori.morimoto.gx@renesas.com>
	<110f01db-f5e2-46ff-a3cf-90e1b00d289a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 23:23:24 +0000
X-ClientProxiedBy: TYCP301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10394:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c08014d-9273-4ad7-882c-08dcc23840f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fKv7HSKH0zrryy10RhWf3jXTneDdC+zlfz+et3YlgBXWuKu1E4zzt+++MLmn?=
 =?us-ascii?Q?ZFq96empelP6xFUWN/jku+N+wGvSlGpkhaLhYGHwwREd8zMR96BkCVHSNS8W?=
 =?us-ascii?Q?AL4aE12jLmKkdI1qowZZ7aTlR3SIeUvryVAFosnigEYjfl0BDTkSsK7Q9sjz?=
 =?us-ascii?Q?ByjbPkywf6zpOwb2ZDE6nRtVijrrekEsm1u0qiZwtuocgAKnzr7OmMELkTfs?=
 =?us-ascii?Q?j//aMB/ClSvB1r5RWK1k3wG7NySog1XfTzv9ylkjYiTiP3MZ7a2pjw3RcirO?=
 =?us-ascii?Q?oe/8vjMHU/vLlM77bTd9UCzbydkUaKTyQVh4m1YgPMXDw8ukwdV4n26HtUP/?=
 =?us-ascii?Q?4/h908R2cQt5rZCQ5kMfSBqqCibhM+wZH+PzB59xLJZbPCOMYCyzzgBFn1p4?=
 =?us-ascii?Q?zqWojUpl+EbJt63ZSQkYh2oW5hh97xMysq/z3Vx7aCQOIqGs1ek8ecC8Jlg+?=
 =?us-ascii?Q?obxDE9u9ZthXIiNtvgRbxBIcAwObmuVUBBSIqINlhuOw843hpggz5qkJk/WZ?=
 =?us-ascii?Q?PYBQfsNsF5JbOmnDodNR7uduMiDi+rcSAabG3UP0/eMu0zHaIimmYqd5ojhl?=
 =?us-ascii?Q?CMPWSgZlIk2g32is9Lx9qXzLOGC/w+kXq4KzLOTB04vdBc5NiYBjZ5e7WWby?=
 =?us-ascii?Q?bkr5n3VmOLOr/8cs70TtBB6VDglV8m7XNx0eD6dkyhZbEK+68tiCO4gRGOB9?=
 =?us-ascii?Q?wCCT+EPJLKCYvmLUXD7ByR8k7T9nIz2GH7jdtdCVBng597kfEv0NDQS6EgtQ?=
 =?us-ascii?Q?OfvwVeCsWz651gMaSLUg/Eo0neyP2/bI/tZrpda3gX5EsWLU5TsOIxFMeQRi?=
 =?us-ascii?Q?hK21WPkEHqjLVJwV4e6KnaRlQ/OIAd8f8hIZzQmsDiRvvX2U7cigsz051DXU?=
 =?us-ascii?Q?gkoO6cKqOuP+ZINq70p0MLc/HLIEICd50S5oeHVIbJch2xEkJnbxjcUmm+Uq?=
 =?us-ascii?Q?hyYd01ituypzGj5YvtJtpXi2jCWvzbyG4BtV8uoEVF/Ell37TQOxygOcivQL?=
 =?us-ascii?Q?Fi83RR01xsm/7/Yj2V172EpXBCitM8kPByevXDsDZ9D+MkPcNKoeIYqEtkob?=
 =?us-ascii?Q?WZV6RG34f2vSfWCOL86jtxcETgASIhPoqjHr6S7liLHDtAlZnEcrBFVXoehi?=
 =?us-ascii?Q?/V/LG8pUrXzztCQCJaKi9xL0JD/YPhmI3E5UbVTDuIHMEvDfPUeOB9p6HTzZ?=
 =?us-ascii?Q?XsxJkLe8wAs+VX88NzdZWu8b5s9qnq98jyfx6sZz8YoKbjzEqfNPZYzovBOY?=
 =?us-ascii?Q?Dm/UlLmIqIKvC9UOYNgzG2qrcmfhfZoTBOsWW+lbiYoX5wwZmTcrK/OXD+ZE?=
 =?us-ascii?Q?XibV38l1nvrI9g3FPPuk9JdpSx1/i3gU8YkGW1wKKKPGuHIx3xEg3Dl/pRzP?=
 =?us-ascii?Q?t4Ce1B2zMywSIZe3oo/c+aclTP6jO2WHklApYcSQe+atRdTgnQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fiUc5pecA0/d8RFmzCs86Co7v79bSvvdQ2c1dMGsvB0vDM3E71NVQIFsCOmu?=
 =?us-ascii?Q?nEdDN8z3Sor8sARg8asUUVopghXNwrnHogY41UcrO0vnx0nz0NHhuJf3mRia?=
 =?us-ascii?Q?UV25ZsRuDyyH3vvftXgfjh2ozpMQFGUQthMga+JDh4szjZCeLUKnMiP39myY?=
 =?us-ascii?Q?bHFK1iacN1qXw9IdTeoRzVry9HDni01OBs3JrB1SU6sy0r5iuNq4m5JayQoH?=
 =?us-ascii?Q?ohJUlJM1WIrvPOVqws+4C4XuKeLiCzCne99xHCvS62GcitMrE4VqLkR31CGG?=
 =?us-ascii?Q?8ec5+EMKjOALzHiNhDvekzJyp96t5R8OkOToy0n2MYnhVudn47dGb1w0ezlx?=
 =?us-ascii?Q?6vbgxqq1Pu5UhinFHsL/w3ZaYCcfkVSP+D9yx8WdauQNGghvSt+fbTWFHu/P?=
 =?us-ascii?Q?rE/RfRpjr9+hwUkRkYsD+x0W9K/fjXQISB9qxL+EfgKsujsfpePSZO/YHhsj?=
 =?us-ascii?Q?xz95lLk2Y+YX3BbCb9uCiUybXo+jwbrQjItoyUv1JVXBSgCIt1ZpuxnfXDBT?=
 =?us-ascii?Q?kmZRWl59OC1cVG/ukLH1q96DUGajfgRotbgBRU6vgN6+TUACidoVDjejfcx5?=
 =?us-ascii?Q?+icguOhURTEgpdrnDgnJLOujTjbZKBF2TrUnXjd9zhA8734Q3iswOfbg3axc?=
 =?us-ascii?Q?y0ZavnEPUzFL8SdGXndxA3KThIPfJXGCxweZLjy/FazhEEzxXWzw3H6PCKpv?=
 =?us-ascii?Q?H/AKmrnczsnXtDuHc8kCAn1HKyhv3lzPG1czK5y22MOiZQNFJbWg3sFFxHj9?=
 =?us-ascii?Q?dafW+wBCVkVbgqJnTWv50a0RFlTZlKi7fT2qDPhsRXHnyjejUX/spnENdJgu?=
 =?us-ascii?Q?i+cGGzJqM4xmErgxsSUZjGGq8l0OfJ5yTDOFtr7Bnx3AbQmRZ+u3Mc9gAEB0?=
 =?us-ascii?Q?XUPinFZf9gyuJwKoBfIaQ6a3qLVtWzZQE6xm6BTGWh7ET+i8XukATHanka+K?=
 =?us-ascii?Q?kWMA0bfCsm1Q5zynJE5USbjhdjAe9nzKCVnRxo9E53Wi2E53jeUirJbraKsA?=
 =?us-ascii?Q?VOVOHChK3Rz3hRR0RUsT1biqvQdThj5vG3SsqqzDrnt8TT3jAbgztL+X+z/e?=
 =?us-ascii?Q?W710un3b1S0DrV2idvA1z+GLVtN8NCrnVYARfUfLyAyfOy8tt9q7q8Kn+HqU?=
 =?us-ascii?Q?YjKDjxy2tWi2oue38YwTwuWDFkY7Sl35JK4ck4ycXlprrE2id80ktkd8vwVQ?=
 =?us-ascii?Q?INMRHMAghUPXqNrRKfF8vAg+7l9JejrIzEl50zewW/3hALfRrEyQRtlkvD0d?=
 =?us-ascii?Q?gO3pWNRSl1mpKkPFVelsUoXcurU9WkVWz4b6sZmIlPYOx3OpyeUgLFinOX9u?=
 =?us-ascii?Q?tsuFyLvyT9d49PsfNvOSfWYMPx1y5krtMZz6SIIbsYyxLXqwvLD1dk2tmsRt?=
 =?us-ascii?Q?GzwiZj+EiwrVO1dwCA18GvwBl2Ev4VeYE4cMzkE/erBy6m5l5sDtZwy0XwDD?=
 =?us-ascii?Q?vgkWfXajYC5vHqbHyrd3ZAHskctxWjV7u+eH69TPAqEkOMTz0yKHZSK6jPNT?=
 =?us-ascii?Q?IMcqPbI4H5WVgdrlvb1t5XXEh5u/AT2EKqwih9M5CLlTImBy8np/RmpUrzs0?=
 =?us-ascii?Q?rjO6VvISUN3TMbevwAegS7txBttErF099DjaQdJlZl0D6YP/sACcoky2H4TX?=
 =?us-ascii?Q?R3aTmRgtMlmPIXBS7SAnjv8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c08014d-9273-4ad7-882c-08dcc23840f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 23:23:24.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5VbYx6BbtfhL0NxsK6Xod3k8xGPzfFSdhjyBC+kEreTvCoLWyMbS3s5cxQHZBetKvfSE8deYIsvRsbGfYSKt/cQdeN1ze4/sVn8mk4dzA6+mHBUEv/3yfZMwjWy1wBMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10394
Message-ID-Hash: LR5T7VVX7CMTQGSM3QD3DAKBGEWFDA5H
X-Message-ID-Hash: LR5T7VVX7CMTQGSM3QD3DAKBGEWFDA5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LR5T7VVX7CMTQGSM3QD3DAKBGEWFDA5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
> > to have EXPORT_SYMBOL_GPL() for them. Let's makes it static function.
> > One note is that snd_soc_dpcm_fe_can_update() is not used in upstream.
> > Use #if-endif and keep it for future support.
> 
> We should just delete the code if it's not needed, it can always be
> re-added later.

Thanks.
The reason why this patch try to keep the code is that 2 functions
(for fe/be) determination methods are unique. But be is used, fe is not
used.

	snd_soc_dpcm_fe_can_update()
	snd_soc_dpcm_be_can_update()

Of cource we can remove it and re-added later, but I'm afraid the person
who will re-add it might not noticed that there was a code before, and
re-add different determination methods, etc.
To avoid such things, this patch disables it by #if-endif.

But I can post v3 patch which doesn't have unneeded code.
Please let me know which one is better.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
