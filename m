Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F49727342
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 01:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC7C6C0;
	Thu,  8 Jun 2023 01:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC7C6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686181484;
	bh=YPPFaKxsTT1WPSTrgY9xvXdog409P7PgJLwPY1F4Dts=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mTVh2xCcugscRA7CI3A94649Jg5KiMFrrngam8Ez5VgGEUthyl+mzUrmYN1F6CCjt
	 dIwnng7d3ETl4ePnmvjxM0cRUHwK+8YHa+flvAykM/kDFdigSTKmJHZLPMx1eicsuh
	 CDPLGn+F8BTe2AO+dDM8DWycO9fRYL1ApJrxNnns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51C05F80290; Thu,  8 Jun 2023 01:43:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EADE8F800ED;
	Thu,  8 Jun 2023 01:43:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EB55F80199; Thu,  8 Jun 2023 01:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 860BBF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 01:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 860BBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=O9mFRmUt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W41seQX6DtPYpa/DdtmrF96INj4n7+o7K5wl4XL07mV4RvFIWt1iErAcZ4WwZ6evaM4k6DGnCHSpmBFmDjL8mg0Ieue8FcnbjyBy7DnEaeBicI1tKUVFYGveOn4NFS9rOkcmHSH0Sj1bJCKtnm2bcY7TSQPf+RIzqL0UZ4/5gDOCadbxBL6HwLp3yfD6B7J/pTz84yMH8HyWnWPQ6/PJ2pUzJe3i8wCkJNgM5BGqcPYWI1ZltNzJbI8pFhBQKMMAGPxvs+/oM8zWlmnXCREMNPJ2PakdhSmYY3G91hlDh/fHsX1388ntyurIqOcQYdXra0nzzs5eThaM1Arw9WGPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxkLSn19auHolldu2SHDCTfn9FEvWDeoVNDVBgs/iyk=;
 b=kFdRz2zQfxFwUQwW8ByTQ+5I/Tq6ZND7FEyLWWQ6Lwjnsgl+FaloBvDSAl3b/zbN9Twew20QVCPP109Zh7org114Mvef/3aswkWEkgvJ6fe3XXVGGHEoqSgQLCtB6TmUVkBM2T8cc5vjbaDdg0MBp7EP9lbkhIb9yEJgqToJIUUrSqW8xpHQtM1c3fLRWis7jRmNyH6qea55jVGkHHHkVwy5VZ4kIIkiqsQjuqCxgJDFp+nJzDTtSmDFDHPGbZbkfYlCfJOc8JYgcYWYNrTqduA6VytwqdnlCHQXFGWuxqjh0XEEYwvKo9uWhI/ZDOQH3Bgz+4Fz+/co0vjlb5NCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxkLSn19auHolldu2SHDCTfn9FEvWDeoVNDVBgs/iyk=;
 b=O9mFRmUtQ+N4P2ObC9AlDxjiE3id9gw0iyN51H6GvY8zTGeN2ITT51CxUSukJTmgcB5qeYItw1G4HL147+LU9w1fTdXErQVB4guT+BpUVtxdCdhSBnKiyViNk+lkEyeeiNtoa97gwbLEBfQaJChspT5slQDdOTKhJhnGjmE1tmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11782.jpnprd01.prod.outlook.com (2603:1096:400:3fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 23:43:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:43:34 +0000
Message-ID: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: add new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jun 2023 23:43:33 +0000
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11782:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc679f1-21f3-40f1-fbb7-08db67b101df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZMK9+5gezu08KFOBDrwis1SaNg0gUNWJ9COEZNq1ZN6YipVcXR69HdeexBsZbYvJxAwjzcJpSJf75dXXSY40AeS+qFHhMyMICDPA4k2HJLc0PKXd0u/NgGEk9xyZf15fCbSHT070n7Xd+CaLx/Mr14Ku4ZPvK+P6oxVg1De0FE4fKJrlt3TSCs008uMqVx43TwCHCGtnaV7R0BDKMtYvCnmV01vx8Qmq3AxFjFQUZk/UFKT90Iaw0vpw2iTzPr004biXzLXXApDzEtbd64q8dKXFFVsyGYj6fyNzawyo+bu2iidbjOan82VEnx0rSUhwoesHr7RED9ibLXbgRoDYabdTI18Fg/+HO+IlxFn2kgGG6QiGw6L7vpVcfyeahD5XkwpuY3GV5tdBrHQkRAHsm4YNIomzj5B8UzLk+aDh64wE7e7qjzZylzGqw6+Mu78Qoyh1yr6sfpJj+mdgtQP9i8Siiv//bstvGjn90X/ip7SjBRc9PVpFTSNkR7H/mr0WS1W9Rj+XYhgDe+isGnfYvMd6+MCqjFsneh4aDzDGr6136DLTjrZUMQ6vraNsEDuT6c+OMvQ7z3ty+FMoImDxCZlkKT6DD90CkzAFBQ2zA2M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(4326008)(66556008)(66476007)(5660300002)(66946007)(316002)(41300700001)(110136005)(2906002)(478600001)(4744005)(186003)(38100700002)(6512007)(26005)(6506007)(86362001)(38350700002)(52116002)(36756003)(6486002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xnt6twYE09J25SJbnpWOgHyEXAwy8H09CoAzTmTlX8I0G2jhYYZVWINidxhI?=
 =?us-ascii?Q?YfZb58aGr7pdsfHByUl9rOo7dupl+q/SPWfW51ztwoVH8yNJ/xg8WnoxjUWK?=
 =?us-ascii?Q?LBm6hOdqz/GiQk5uKyYe9WClBAma8Hj4WX9pw5Tz3Kf4DATBGJ7jgX2PB0WC?=
 =?us-ascii?Q?LVHyc6hXGqut8P1zwK5nyteE2lAqHCU9wA189j8W66L0mCtQLclOSGm9ijgA?=
 =?us-ascii?Q?s/OjA3JKJdM6vXLzUZsZX5QkJkQe5yzjg92IJW3hjc26NiEOu0FlVYZfutbR?=
 =?us-ascii?Q?PM5suxAIIDwNQgjM9fGwLRKcpi4qnqrwUxM1ZG4EKXeT97UtzT+mToU3mLvU?=
 =?us-ascii?Q?5JSCCVfdRozzu7pTpr9bL7Xn5VRYqfyWMaBA9chAa8jT0VE2O51UnF5nUCcB?=
 =?us-ascii?Q?vgWOxHZ9iNwPgWj3/o9blaGC2aLgw9hCmk/WpO0SVQYyV8NGfb9sSy0Reh7r?=
 =?us-ascii?Q?DEon+NlqT2nVTt71hmm1Qc12H10ekriQuo1POwkZJyI85sPL6L+iKKg4ncOU?=
 =?us-ascii?Q?3N1mAOm6fTUAjRK57m6ZR+h8a4FFilI0Ta4a0tn4Dxdq+YDhyJHzZSo+9EiE?=
 =?us-ascii?Q?6o5R4BzKHiKcH85jl5v0zddwO/JLFNTBIaEqdWrCMSwvugDSzcLYKh1j+elG?=
 =?us-ascii?Q?V3vGevYwmL1r+GkkK6SWZJ5ZSSzS0to3ZnoseTfCX9oEvcr+jNAM0xTgBklm?=
 =?us-ascii?Q?zaT6BJIr6B01CUEAmJvbyD9l7UyiGPSyvV0osHxf44StMFm2AMiMTtGKmZuU?=
 =?us-ascii?Q?RJgUtz/C5hbmN9hJPs+rg0bvbKC2oNSp/K4PECI6CyUZ7e/RwwTGoXnfrjvQ?=
 =?us-ascii?Q?5RuIo5imgbBrM7FYt3lrVuDl0u7lKg0AiaJl+w65uJz8y09aV9fMNkNYkKJI?=
 =?us-ascii?Q?nGLZa/KJUXOfPX9nAiUXfXProkPsT7mQJsX+TxF0/T/qFRQPpzHpxxPP7Zwb?=
 =?us-ascii?Q?sf5q3p8a2jtf1LS7UahLlbzjDXjvdq1h/fEceFDfqxwoQkLMEP8om129sL3k?=
 =?us-ascii?Q?VvBnRfQXc2KSKmvtnaPsvgUOIZ/0Z5I70rOtlbGaL1dI0cBOT4c/jnd0WI4u?=
 =?us-ascii?Q?ZOm66fHv3EknYe6cJmhRvaRmFD1zfOclnSMzIorWmBcVC3ptvDmSEjjzcFeC?=
 =?us-ascii?Q?PwC3JBDxnz1+78mVn9GIzo8Lhb6yF3dcaiLZ2umP2Az4o/RxjMfOApiiIBRU?=
 =?us-ascii?Q?HV04wJYPPHpeWhWbBBpJ+rV7ksd/KNEt78CeBsHwRbamvXAoRQdEzsjdAQ0B?=
 =?us-ascii?Q?GOXck8U0V6+v5HmCWS/0I0oqXEjTeeckR/N/+qViln99PG9Mddmsoa10Q+p/?=
 =?us-ascii?Q?9U2MAp9yRvMbOndyWTfR6aK1s2PaAS23hkx7HvT6JRtDdBT3f54WIQH4fmn7?=
 =?us-ascii?Q?gzop51lu665E/JnpcSTl/vUl5FdfyWzsalbD1VstngkwoGK1ou8qrkizfuoH?=
 =?us-ascii?Q?5UzSPjVtyz2dO8iOgvlqC7LEbj17COJT05Gu4PvcnNtpgHhPBAHEp8CBxWTd?=
 =?us-ascii?Q?AfJWa6HIIxuyGB7KUZxZmVEAAla9cT5eBktYJYZxqzOfwidR2IMTPCQtbjip?=
 =?us-ascii?Q?ZQnEsd+06NeVbPXNcmKLUZtKB3xXGlaRYOcPEN7JVYkmoBXuYjXJCKfjConz?=
 =?us-ascii?Q?3jPKSmPTSyII6amImo+D0Cg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2dc679f1-21f3-40f1-fbb7-08db67b101df
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:43:34.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 leyhDbEMfUkzf+mQeRm4RABGWex4yx/zibhEzuF6aBdXoHpTgJJMHwzefqbatRCLf8eRt6cvIez+5AtTascs0y6ipqqr5j6gZc+socMwJRX1vtQIRNT+dcqVscLw2fON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11782
Message-ID-Hash: IRGD47GJZVWRUO7A47MXIWZBGJIYNWZ2
X-Message-ID-Hash: IRGD47GJZVWRUO7A47MXIWZBGJIYNWZ2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRGD47GJZVWRUO7A47MXIWZBGJIYNWZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This patch-set adds new "trigger" starting/stopping method.

Kuninori Morimoto (4):
  ASoC: add new trigger ordering method
  ASoC: amd: use use new trigger ordering method
  ASoC: atmel: use use new trigger ordering method
  ASoC: remove old trigger ordering method

 include/sound/soc-component.h        |  11 ++-
 include/sound/soc.h                  |  23 ++++--
 sound/soc/amd/acp-da7219-max98357a.c |  20 ++---
 sound/soc/amd/acp-es8336.c           |   2 +-
 sound/soc/atmel/mchp-pdmc.c          |   2 +-
 sound/soc/soc-pcm.c                  | 105 ++++++++++++++-------------
 6 files changed, 93 insertions(+), 70 deletions(-)

-- 
2.25.1

