Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08BF95FDD4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 01:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A8B829;
	Tue, 27 Aug 2024 01:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A8B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724715815;
	bh=GXeUJ9fg23rkvrqD5SU4jpikB8IOKn6erzXmvyQGBWM=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sz3PS3mKCpPhGzJZ83R8W2liUKC0ptdt37UbLY0eStQ7L0pg8LGOvW0Ls62z6VsNT
	 eSGyn6CRwaGx6eWP3LZPehnkpLPrrDpupqfXGPGZiiMssGqHFz7aRvg/oNJiKBF01h
	 krczg//Ut89dnwp5sVgKGmaZGUMUsGlXMOw2JyI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBC3BF805B0; Tue, 27 Aug 2024 01:42:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C87DCF805AF;
	Tue, 27 Aug 2024 01:42:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44831F80423; Tue, 27 Aug 2024 01:41:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08CFCF800AC
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 01:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08CFCF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=adsRVyi3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfXowG/Dzvmqbe9JowebhZZzGy0qaE77LKKYrSt45EdS51rYWgFSLTe1+CS4Xu21aWoLAttyGPasYqMNNRu1ncLh9JNhCe8Pixr68rn+QviyzIZVrumaWaXC3ETzG4flYQpHtQw/zCDGZAEFm5R9zHU5OOZOlF7wwr9qFF5jNc5h7O1HX2jtiD+8ZwYHzgm50y4zmRsxYngJiqtS0bhZLJxoHJ+S4MghRTganySPPDPOuO7RWU9A2aF8jNMOPllteQqLrY3r2ZOMPZy1LNa1eDKfDgcbRAiAbvzhdv/AIfdGYIypB4TbqtuKtBP3OODnCQ8xjrVzcp752brSGYgTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aigsaxXD2NqUHS7rJO4upfArWorgSOvzEp0vl86cx0=;
 b=KrIa2Mfz5k3d4Fj8ROJztP0bkm+zAhwqUNq+eKQkrddTURIrvf5wdDSo+RwTm5P9K9QdzDqZz7mbUgD4aaxA+BkledamV1V7CXEdQKXo49rTsj/Ev7+G6rwr0JNlv0n6zaIra0Nw/hq9PLhy6Hdo9CNZye3ecOr3a9kER1r7yFJ9Vc0c50QB9EFiKUoXOJk8HQmKb3uyOMzgiBZ699qfcxJHpj6+O1VNXEEHZQHcg+DkPi3PV11ya3tiKh0soa7P/VnEsV5XN1BYMVj43kWeZs59AARrdk5mGoDlHKQYKwrS4mFhp2EGrLeqIufPB4oA3i05KWhDs+Lx6dUvUsckSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aigsaxXD2NqUHS7rJO4upfArWorgSOvzEp0vl86cx0=;
 b=adsRVyi35boIfL0BHorBpr/d/4ZssrK1ltwj7pWoAD9ANGLjEAs16/uIcUfEnw85FAH4kiMPxdr2u5zEVfkej0aA2bKrOiNrLoQuAJf4UTkUFEXiaacjyGyxDtqZjrloRgba1WAfIbuNIaIdUaEmXWxVLRbuGi0qvpVGC17aAqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8196.jpnprd01.prod.outlook.com
 (2603:1096:604:176::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 23:41:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 23:41:38 +0000
Message-ID: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2-resend 0/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx()
 local function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 23:41:38 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e7ee4e-db59-4e7b-c504-08dcc628a153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?umnDV0ARr5E46gOkrhYpy22h8eGdZ8dOQxtmsJq1EamhYbzLuHhugqOmo2tD?=
 =?us-ascii?Q?EbRWnyNBXdspnIedA4/IE56yOtsTaXJVxVlGOAKyCYclybWGFV3GMK4qqNC/?=
 =?us-ascii?Q?WHzIpr7Mc0ELeGhqobEBl7OI9TaMN5KACzcJTUs1LOBH8LLEUR0tGOUYo+h+?=
 =?us-ascii?Q?Ac+Z82dsKtzxLxh4ol+HFz+sOEdwNqvesWNtL1MfSnj18URhKenGSdBstj9Y?=
 =?us-ascii?Q?Vyvu+79HU3HtXsyb/SoGt4Hq5sMqFIZFJB98xREh/eDqRarhdYsZ3uk3RJTn?=
 =?us-ascii?Q?X1rdelZh9Ng89S3BdU0LDuI7dqA3pTy4QVe8hTT45PCJ8JlxrOD9peu9DVFn?=
 =?us-ascii?Q?LHMsrQbd4WoGSTHUkwTYzfTYMERTTry2tB73XPJT4Xk3tTx+XwAE/4POE9ty?=
 =?us-ascii?Q?efmYrAeSiJEk49a8ykvpdjA0EyBx4DFaxMMi1eegcWgJAzn4BBSUPvACn+3C?=
 =?us-ascii?Q?P5UcJ2JPtTKABUWB7rfhUdVkADBKq0U8RkNPucnyXZoPo6X7GJNgZRlZdgr1?=
 =?us-ascii?Q?JeZnKA3yAryF7Ypc+oo60wbaNJL5q2ge7EZi/GLp1AgnZJmQ+RG49YJEbY8e?=
 =?us-ascii?Q?tj/iKoFj548dV7SUTQC0yIrdIT1f1aHuc1fop6vb48TVkOVbc4DHqRNkYUip?=
 =?us-ascii?Q?t1uiZNJpUiuUs4ZL2O05svS26el6rUQLrc6F7Vkxwf8xfdFfh9dH2Xl2RtXP?=
 =?us-ascii?Q?K72fqqFQq6BjnHk8hwe29hiyig5swTcoF8/shZ71eCjWqvJoCLFmBbpFvtOR?=
 =?us-ascii?Q?8ppZSfzPryLKgUtxYwfN//6VsS1aG3npSoB4rnIqEPJmKEDPjp54IVNLOKgV?=
 =?us-ascii?Q?QPjB9wJbgoLYEA4Ct+uY+c7q6CyQ1j14o4iayjfYjs4ogRO0wYu7zIaYJDIe?=
 =?us-ascii?Q?mZ8Z0tgBS2OTpNfHeCXlOR51tbI4KVI0ibPtBkdpFTOOxvSUEPenK61wh3gl?=
 =?us-ascii?Q?XyPSzsxR/rRMaXidgjM/taXexVrj61ME1KeVv5uRQoek4pH0WIHYmXz+t7ir?=
 =?us-ascii?Q?6HrA22QNcTfMSLUxG746p9cb6TdWDp6xH/sQ29LZ96xLJuqB2NTQ3aAzMrKb?=
 =?us-ascii?Q?M1t453vkP5FiTX4isYxx1mzPkwiWyhc87o8i/VVPmNRiSbmeCsIitiyR4TKv?=
 =?us-ascii?Q?V3a3yJBmYw8955UZ041veNDo2v633DDgABmRQzn0c1GiDhmzFO9/azZEgN8n?=
 =?us-ascii?Q?uNxJhvZZg7vF/4n80uNEwMtK+jmYLEnqsJtrW6C0aL+NySKzCGmmyRtxOehQ?=
 =?us-ascii?Q?ARL9LaMNj3ytFHm/GBGPe3UFKHDECLgp6J0qF2mBkYNOddW+SqF4pN62WiyV?=
 =?us-ascii?Q?iV46GgUSLgDMaojqBavGr/r13CCqpEvmEFwmNLqaSdheRCAsGhqjGnJZh9Is?=
 =?us-ascii?Q?lM8EFuHKRAhiPSx17m7tSTCp9ImcPfs7Joiur3hFcvyBhM3Bjg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?04tkOzGbE876vveQSyZ0BppCzjUEALQFg5m6RTFL2NHdaALHnfuDh02jI70+?=
 =?us-ascii?Q?7DRW0m7oZDZwQH4UkBaw4mWMiVERWKTAdyvDDn1ZF4VlLeq1N5KcPs7EBURF?=
 =?us-ascii?Q?TmAop8KvTTLyDZCbmV7O6kUUZuoBukP7Alq0n3I7Da9KRycwENlh367QBCdD?=
 =?us-ascii?Q?o3+KDM8+s9PxeU9VYfbwY0ONoNG2/M7tqoBxNOWZ34J4GcggIohKT+ThISTm?=
 =?us-ascii?Q?89aD0ichoI4ELm4BAa4CPj/IGCdyr633TU/OTMVQrFhEGC1xkRC1ihjZLmuh?=
 =?us-ascii?Q?S7tsLhh5fy3NgDRehN6GVCkoJemV/OqbN9SomVh0Fktzhg1eGOyvGvnGJ6nW?=
 =?us-ascii?Q?o1xRQfCVci82+DW0JfDh9uJtoQDT7V8dWpKvT78y6G5iVc9sALHvEHcfti55?=
 =?us-ascii?Q?MW82OvEQaKLJWYlPqkxkqka5RBXAxOjcM8+sklzuPS7fg6pOqcxgEwpZtncX?=
 =?us-ascii?Q?ACF97rZW943K7yoM8jb20GaiPVqiLVkJqaq4N8mnaI9xMsi32Meul9VyQmWz?=
 =?us-ascii?Q?hTPXhNkew+6epYjTEV3/hMlkpLaWlV1UyNtpMSHFPc1rZQxTMwRefk7i1VDj?=
 =?us-ascii?Q?CvzRH2d62gfJtyBGNGWkiELIMipT2WEYlUXYGcl8VIsusgT8dpQRA/GSvJ8A?=
 =?us-ascii?Q?3WcugTPPnMbLqaaVOGUFgCcKxIWw3ELTvkCmVQzT2BpOhURgh4C33kFFQFzA?=
 =?us-ascii?Q?DnpIQxYcHoGLnz67CeGk2GV104Mhkc1+RtrxX8bckC2yrVRw803OAYOV92sT?=
 =?us-ascii?Q?oQNwVXZlCEbLFTycYPl9s2RrrAvYfo988Ugk8MlxQCcLsIXDpyxx9njURDRy?=
 =?us-ascii?Q?JwfXdsAwbb7OsEiIOd2+LmQo1NGEvMb8lEPHve98qVtR0vOL4vVcAw+ERoxw?=
 =?us-ascii?Q?Hgy2Zule8S0Cb3Ts19jnCRlnMUBYAz4OdZm9nDfYNkZRP4vw5nkTbL9bn+W+?=
 =?us-ascii?Q?CL8tp93TpqjIYsfd0QFDqB83ksLG0oFyxVgaTozW7MrTQhu+uenJyy3QxGc4?=
 =?us-ascii?Q?J4zXBatLYAQd0SEiUD3wWbbM64fKLZ08weXp+QT02gXURujpsdfzB6+J8nHx?=
 =?us-ascii?Q?ZkKYravNc4WwGg2xw3B6bGOpVt9W2iRdR6Z8wobjjxomgfnoAJx2cG1/YU5x?=
 =?us-ascii?Q?UJ7MiBn5fHaE3humQG1hiIHJa21xDaFPYhlfv2PpXfA8ZjvToL3vuLIVCKhd?=
 =?us-ascii?Q?tH8HxzfHLlXBsqrLDLDrOlJQHv69gozPMnNfY/qiOJpeCfbedr9jQvEt1IMl?=
 =?us-ascii?Q?bV+IphFfQ6oHUXTQ6DuMNQmSMwkYFgMeUvVY8NFHwg8v8/i54IW2KtQVRIuf?=
 =?us-ascii?Q?FA2wvqQitp93ZkEUhoLo63abM5gaoRepkpjHllisrNFsVOLcdZXXbyICG0cf?=
 =?us-ascii?Q?G3HMP6utFTgiaOWVBoI3yBlAju9LMRgH/IHXm+XeM5VFLmoOaYHvG/+XGLA2?=
 =?us-ascii?Q?dt7roK7S5kgx8WpWcZ2b886f0j665j3rK3FT1xLpyh/cutst12kHBBZo53uB?=
 =?us-ascii?Q?EP9GcvNK7NYUdx3eO8P2Lpg3pOzL9Wmc7k7cqcnMxf/hObnPdC+NOmsLIZ4e?=
 =?us-ascii?Q?GKA5FfQp7isDfuDn2uyObcdCXR7vo0mJURDEwpx3hR38HkaX12+YIPsEx9eT?=
 =?us-ascii?Q?AGrr5hcrQ8+JZTNthbnbGwI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37e7ee4e-db59-4e7b-c504-08dcc628a153
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 23:41:38.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kQ7SKDVrE4sheErsAB447fIpTRvYtF6XmUbVkO70gmIUY63+leZYFVLn9zOpGngcWnFMUB35g6QEUiK4BDI/EEC0RD6ZD/shI2rUFuDB3XKQAINO1Wm/XWqmrRptd0bg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
Message-ID-Hash: Y3ENEPWOVI4EVDNBIHTIDNWUEYN7D2YO
X-Message-ID-Hash: Y3ENEPWOVI4EVDNBIHTIDNWUEYN7D2YO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3ENEPWOVI4EVDNBIHTIDNWUEYN7D2YO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is resend patch-set

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. This patch-set makes it static function.

v1 -> v2
	- rebased to latest branch (for-6.12)

Kuninori Morimoto (2):
  ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
  ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function

 include/sound/soc-dpcm.h |  18 ----
 sound/soc/soc-pcm.c      | 201 +++++++++++++++++++--------------------
 2 files changed, 99 insertions(+), 120 deletions(-)

-- 
2.43.0

