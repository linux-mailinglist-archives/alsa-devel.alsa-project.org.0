Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CD98991D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9156914F2;
	Mon, 30 Sep 2024 04:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9156914F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662469;
	bh=HyxQlGBeBDV45/C7EgNSTKuR+6T3qCPkVX7ikEBLsa8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fa8h9x4sLEJAfAbqQ3e+W1OE990Ye3Eb8mHMOp5Cq9C1j810MCrvbQHKm29sqfsKs
	 f0sajE5dn15JhjnWwm2LjxrpTp8N3ekmNSkrtILYATi6SxTGbfYxqIJqAUl6b957Kx
	 ZuT2Ks4xefOpoRilX1KY1lJlNu+X3gL5nmhAUhmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B0BF805B6; Mon, 30 Sep 2024 04:13:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86352F80580;
	Mon, 30 Sep 2024 04:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E05CAF80074; Mon, 30 Sep 2024 04:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6372FF80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6372FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DAhG2f3/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggteJYSUW7oYwTmoAN0/M8doMxdF6lymiaCXB0pWPmdDz/+qR3Z4oA+2PzaXuybVUFmd3FYf465FnPkdRG/PJCLnBxs/Ww7H2acXF6c6ZQInDzkMNxPuaXQnaQLymc+f7n7iNgbK2XYnpAlMa75hXfNnW4L2SfBqIRzpfWkrRdKoIKWP/53xT9+0+78Yk5YTnQnXeTy0ytIRLlAIFIDcCr7Uqi7HhiTub97JdNZ3BtttoA+M2TJxJfwWV5IVV15dgjUa5xr4dgB1tYz6vpss3zvkH2X1VlR1MU4Vu/tFQsMSkHi8rXO6GbACcXEosunPn9x2HOQNj86K6W1Tv6UhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Dxnwq4IBquD89IEv7h8qjFMjuOhEnrekx/IfY3zuQ=;
 b=mLLnFx44IYS9QnRTrmKR0XCWw7X9PH51g9SbtTqeAmwBK4icQgRvE9vAOn8jcfiU9ysi7gZg2nRyabDtKZJ5SORDKRldkaQvFd5pGj4il1qBmrhtEmWPaE+ZkfXYQr2gROvdG1etjEhKfp+6ac7oe9a0hPdHmzF+uIMMbTKoiaVMEGAaqZpWjvmKd9dNKShob1eHLW0HdeqFONHApdkINrptLUy6mwQdlXssLET+x60otA9HQRzqqode8YtI03jqItX8lFOy1+oQ4o1hJMYGPY0WjaEQGtxomL9Le8HswRdy7UWyTWV/SxsWq8b6mdAEOrQecHapi6QRYt3e/ZZDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8Dxnwq4IBquD89IEv7h8qjFMjuOhEnrekx/IfY3zuQ=;
 b=DAhG2f3/5TwpA2LwiY6BzeY5v/70ZWCkG53av2GUWu/mxMNXHSt3jSAIoh5/wjQifZTPZ5y0GdDV6LtHaTq7IBR1cgMKAQbpeu9NsxZ11Q1lNf5+p+Jbk+BDLoqwVgVdOla7k6jARPZ8IUScJYfbw/j1W/rqvfp69+VCpWVw114=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8143.jpnprd01.prod.outlook.com
 (2603:1096:400:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:13:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:13:32 +0000
Message-ID: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 00/13] ASoC: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:13:31 +0000
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 333474e1-b6bb-47a5-78ce-08dce0f57b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u2gjYe1KZoqSYGO7jmRolX3mI0hfNWH/ak+JSsN+FXOJqaozedI+SHEDR+P4?=
 =?us-ascii?Q?uT5OBUBzdJK4NzP05pROe7ePByIUUTAilbTHc2iGPD4CNC2PbwJPefOVnWnK?=
 =?us-ascii?Q?FT+GVuGjBGsG29nN6QVYdt/4juER0fZsU0qeawa/pyyHpEl1EshdQqROgCsm?=
 =?us-ascii?Q?t4laL/ALc+hOw94ExAn9SKVFZxiXtxi4TDC+OREGVrrsYEd+O8dMAofwoKWE?=
 =?us-ascii?Q?Hxf1BVKr2DjYBtL00fpNRhflQT7Lw1I4wLTGICVK/4erT72GfqNLhMu72SB3?=
 =?us-ascii?Q?iVo9g0w14DV3y4B1+7p45uahIae7pJFpFLNoRvmTpjoel0L51PKLjkUKvEnz?=
 =?us-ascii?Q?VX3+uK+qqJhEzC48Aq5RpU1/SGbKBNFO1Do1kZjL44LZxPklKUY7WA2l0Zwo?=
 =?us-ascii?Q?JNGK32+ncMFWAzzrWul8NuMkkf1wHXoFp0BCLmu0E8ZfyZN+l/dSIWlJGSPK?=
 =?us-ascii?Q?gw65QxNEBn1P7Q4J7bsfrf0SXSkR7+IRl3wMgwWvIe4qXw5LxmeArrAyRBcj?=
 =?us-ascii?Q?3PmvbCOOinek5VbcqJGgtZGqHrugPDM1cK8evk0l0XMlI1FoxLEONbcRWUba?=
 =?us-ascii?Q?RxqOJgERbdixGmvB4L7i+YG1Dn+NGuM3UqcCxOaCXnYtswhYLbk3aFBOcUaA?=
 =?us-ascii?Q?u4S/zgm/1L4RVU5cIqsjhncduzgrKfB0JkbFurdm89SRIHdBJ1I5vl1ve8BF?=
 =?us-ascii?Q?OwqxPn7SSt7Hr5o0Fl8v5qf63oG2cOokpGsI5RNHCTrD/cbN/njlAZbhYJjp?=
 =?us-ascii?Q?86asbMacDO5/0XpCwVcOTW2kVDtVtRQoE0ampwjMP+O5LwCEUqN54t/rEJvH?=
 =?us-ascii?Q?tzGjwX7dOBCTu+c2eb/mAH3I+qwEc4FOnRCIKb2UMyfCmMr7nFnZcZyFaZbC?=
 =?us-ascii?Q?VAeyPis80/lPT3ik9hhE3EfsJydA8JkQx1w34AZ4m/vQ+a1daiyCggtuIx3p?=
 =?us-ascii?Q?gYSWhlVTliGRC61flirnEsHMYiHNZ/Oki7JrA8JIqwud4gFQ/NGobD2uHFXy?=
 =?us-ascii?Q?wSu/0mG5028pF0nvOgnIiULiTjWXpzxLCWOMXT8vMlEps6EgeN4ARDFAPt22?=
 =?us-ascii?Q?RvGLCR+A6z9Fa6EU1EPUKOr+FmOBKTX2LfqYnN8vAt6Hgq2+pLZS1B/6CfYc?=
 =?us-ascii?Q?hX0wc5x472lyPG6FVFtMXfqxhaGPAwuwVtk5zAbGbNxy/UcPSMOSSjoLzDNj?=
 =?us-ascii?Q?DAtjnqqypW0WbJ0wDEndyV+jjY1FNCMNZYtwvU5BC8Om3pCCBJPtWJVSG/v/?=
 =?us-ascii?Q?H/6lmCXlgV2RPO9LAXnK37/bIPjUbV+CuMtdBEyqh/HUILKgb3HcKVeQqxUM?=
 =?us-ascii?Q?FX/ryjR0XjYxO6vMs9xC0KPaniKWMZuQ3GGGPUqkuECE/6FTXXXFspdEIfAL?=
 =?us-ascii?Q?c+XQLBXobZsMgsObaVHVWa/ZPWiKLmAM3nr/7znMp69bDLdfxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fv43bYCG4Rv3hijKMWPnRJNk/TmGO0FDUNHmUZtWHlIdEIKeG9AewDmu0x5Z?=
 =?us-ascii?Q?2usSM8Orf4ndALrQnIX3b/BY3fFezF6uCk3aYxuWGkENvRe91OZO3Al5Agx6?=
 =?us-ascii?Q?hASWBDnMkiogxKqoOPfDpNSVqz1hlMpVHTpbXkOilj7qinbelBfJ6bymxlji?=
 =?us-ascii?Q?la+sLyTlG5YaIuXrcXTjz4fHRoLMtu5RL++NMKz60Ke+d2hYEsLpmGaJjAvh?=
 =?us-ascii?Q?VDRSqvHSiEsqbAa0EsgmopNeakTsXf1HbZUmSPt6SlvYukM6MtnsUMxYXC07?=
 =?us-ascii?Q?d2dAcrirPSzcjwoJNlpbc262nR1koEnBA/I+S/SfTBJfBnaibHNWVXKQqVFM?=
 =?us-ascii?Q?2GLeOLBPBsjG5VqaYisVkMyb5Fyif76R7Z5F9kKllrPxax7VzFSUnqTa+hOR?=
 =?us-ascii?Q?YWScTNJW/4Ss+BOu3/le7oCjj9uIm+JddKeYuN0DghYtMJqdXg0tpr7i/r8K?=
 =?us-ascii?Q?NLMNfCKeMAhet7ck4LqRhfbDRLBSWAnyIPZwjuFC6Y5KSInClzd5Wm41zTD2?=
 =?us-ascii?Q?gKQfbmkKEsuSopVM+XAKd+7w4L1u+RCE0SScQxznBATcmlDLWdEmwl4+bugW?=
 =?us-ascii?Q?XWiJQ1D+TKLIeOnhHHFeUa2DJUfLewyNV63vck9X2Q8Co+m4ST37UvQaf3ja?=
 =?us-ascii?Q?yznVD3hsA2DD8j9TuvxLIt9HWqDgHBDJmI6Jg+m/78omKDRwuBIdwAQ0caFJ?=
 =?us-ascii?Q?3/507uod/yUL5ptFhI2SEh3D/HynHYARRtAsHoN1mp0fITLzJwBW8/COQ0tV?=
 =?us-ascii?Q?6OJWvC3qaGQ48A1wTs+LclPyv2sm8qLl7ftlCt+8ng5nw9gn11/gE6K09Bor?=
 =?us-ascii?Q?XlT63/cd9Jc4Fs332j3kzO8cVg7ZH7n2Ea9mGfuEFAOjd76gNS1r/0jP7iLA?=
 =?us-ascii?Q?wuI9Q+YMu8OcMlEzAdgzjESRNafWh7glrriZEf2Dv8rckVuPvtXUG2eZKx11?=
 =?us-ascii?Q?7HS803OxQwkat6j8WQdeGc0osbhExMWttGDcxAHtZasoKPTfP4zWUghPxVzR?=
 =?us-ascii?Q?h5n4+H0Hebywy1nG25tzluObAGEF1PKSs/sHLFh2UDJVId/7iqYHl2xcw8Zk?=
 =?us-ascii?Q?LD5xbdkAA7x+AL45awYh1QopurVzreqn44EL9Sl4TlLWSgcEF9iwVin5eOiF?=
 =?us-ascii?Q?Wu1FC3zUHmMbvx56lEChQzad1RqH1roY0ypiChWP0HKGb7c7Wr2O+NWfZwwo?=
 =?us-ascii?Q?uTqnIg9GrW2oNSNTIvKqTC/Ww15VYBR9Ms463w9utlKd5WlE3oQxcGYrmCVy?=
 =?us-ascii?Q?VmP9f/S5KakrCQDEXtvrhIqjgi2lO60B2BaGnQww0bwv9O/uQKceqn8O07kf?=
 =?us-ascii?Q?GsBxojGiKY/qMFnmhd7H8zo2OMnBzW01UZ3TFdrE7Pmme2RpzoUZ/6A2fg5/?=
 =?us-ascii?Q?+EUfZC6BaubFkpc5oSIK0DBR6nWhqVoFqbWjqWUL4/94vnrG5yfVDmEkGtYj?=
 =?us-ascii?Q?ac0uRNwbT4YhwcpmIeOy05irigdvlomplmfxIVIZ7In3S+VTFNnp9AbjviBf?=
 =?us-ascii?Q?VZ/d6BMIL6AaUzWbV85SZPYwISQvhSq3xcZHAXesWRxq7mqrxyPubu9VbZx0?=
 =?us-ascii?Q?TzdyS7N7Ak4jPDsYWQ4JPIF34+JMdF9UuAd2chwN4tcCBZaGm3MgzyKoQuz6?=
 =?us-ascii?Q?pAPn0VeqLPGK5KpTMUjVkzk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 333474e1-b6bb-47a5-78ce-08dce0f57b4c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:13:32.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cRIlKU90JGa0wJdG9EKheO6P+lsSJa7gA37FTH5xn5lPeQoIrAzV2TQ1mOLXa0TbYHucNrNsu9FCmv/vDv3jUeh7odRc/eLOOP85/JzcZC1zRSTjJpHOJh0eGfowIOu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
Message-ID-Hash: BA2JXEURDFK6BHAFPTBUXEMASVO4223K
X-Message-ID-Hash: BA2JXEURDFK6BHAFPTBUXEMASVO4223K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BA2JXEURDFK6BHAFPTBUXEMASVO4223K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v2 patch-set

Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
and thus we can use playback/capture_only flags instead too for DPCM,
which is same as non-DPCM.

Let's remove dpcm_playback/capture flags, and use playback/capture_only flags
instead.

[Before]			[After]
	dpcm_playback = 1;	/* no setting is needed */
	dpcm_capture  = 1;

	dpcm_playback = 1;	playback_only = 1;
	dpcm_capture  = 0;

	dpcm_playback = 0;	capture_only = 1;
	dpcm_capture  = 1;

And then, because no-one uses dpcm_xxx flags, we don't need to have the code
for both DPCM and non-DPCM. These can be handled by same code.

This patch-set is based on latest linus/master branch.

v1 -> v2
	- rebased on v6.12-rc1
	- tidyup flag handling for sof

Link: https://lore.kernel.org/r/87r0979uhx.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: amd: remove dpcm_xxx flags
  ASoC: fsl: remove dpcm_xxx flags
  ASoC: sof: remove dpcm_xxx flags
  ASoC: intel: remove dpcm_xxx flags
  ASoC: samsung: remove dpcm_xxx flags
  ASoC: mediatek: remove dpcm_xxx flags
  ASoC: soc-core: remove dpcm_xxx flags
  ASoC: soc-compress: remove dpcm_xxx flags
  ASoC: soc-topology: remove dpcm_xxx flags
  ASoC: intel: boards: remove dpcm_xxx flags
  ASoC: soc-pcm: remove dpcm_xxx flags
  ASoC: doc: remove dpcm_xxx flags
  ASoC: soc-pcm: merge DPCM and non-DPCM validation check

 Documentation/sound/soc/dpcm.rst              | 11 +--
 include/sound/soc.h                           |  5 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++--
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 24 ++---
 sound/soc/fsl/imx-audmix.c                    | 18 ++--
 sound/soc/fsl/imx-card.c                      |  4 +-
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +-
 sound/soc/intel/boards/sof_board_helpers.c    | 15 +--
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  9 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 86 +++++++----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 +++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     | 14 +--
 sound/soc/samsung/odroid.c                    | 10 +-
 sound/soc/soc-compress.c                      | 15 ++-
 sound/soc/soc-core.c                          | 20 +---
 sound/soc/soc-pcm.c                           | 93 +++++++------------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  7 +-
 68 files changed, 318 insertions(+), 583 deletions(-)

-- 
2.43.0

