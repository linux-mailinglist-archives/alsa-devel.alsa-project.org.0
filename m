Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFE9E3326
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2024 06:35:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CD514DD;
	Wed,  4 Dec 2024 06:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CD514DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733290521;
	bh=KMIul9Cn3g9KtMsUjvC+bK/PpNnEw8ZLa24rpFgBFso=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UHTFtLwRR1hAGUjQR6s6m7jzYHFSQTTDeagxt+UaXaVO+UbR+fGsxDEN+E1UWKzIg
	 n96wm8nx7pfUQra2g3epKJxCz19eVdAgpOLarbf85UPIy1/fiBMRS3DzL16byXyzM2
	 9JQAKSzD8+sqs0V/Rb7aT9dAMBcxw6eQ5xlI0Eo8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCC64F80272; Wed,  4 Dec 2024 06:34:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 467CAF805B2;
	Wed,  4 Dec 2024 06:34:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A8D8F8032D; Wed,  4 Dec 2024 06:34:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF7BAF800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 06:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF7BAF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=g+//8kOH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k48+VmI/jRwKcjQqVShEib5KhzwH7k4GpHp2tNUC2NC4kiAv1QR+svgoT9CCTld8uj9FMWfUi3irEGTKoqQ4SYNObac/CF8styx/2cU3+ziy8PVdUeyK7MRNJL0vR+808XVkv0o+EnD/6iY18S6ATPnDxjhpmujz32oNJa0jaBXLHVl6vH6eGd7WkHkt26hNRNqLMV5fNdSFlFdg2jizyOWITNO/v0r2EP2kTqACe9518XPvmO9BsRMMyLISn6gP5WE1u0tY7NAjP/CSQfBgZcdw+lnA5ZPAmB8LEXma1mppBzN8hvu+lmM2uvg9sb3DrKpyHT5n3rmwdxCt1rWr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=ETve6cUzp7rr51KHMXjmFy3CPqzJQhvqgzkZSmFYHZQUwH/WUvlu9XUCq33GHG0XdYxL+c4S/tuXkkcFOKRKCJ39df6gZYvcAwabAFA7h6bYg1TsLWsdsOQCR1dS9c6hA73OYBPpxI+Cm+4s/2r8NzCYHJtv59oj0NSVAynGojPiXJD+nSl617s1sQLG00VvkEG+C5T05atYW4lJflehBLy+MK15KBXvKZDUDVoJ5qVNpbaxjRjIewkxxHkNPcGiuqplrn4ljrQqUkjc3BHH7us/e7UTnSgkk1/PnqCvDFjHYg49uD/urUYqKAgm3byJKECboY8HBep32XcurGR3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=g+//8kOHB/0zQFHO8hTiq5jzphGLZ8KBWhFul7+1IAs0QGqFTVUCcWEtOk4TbH6jRVXD1Rp5Yc6CnGvViuCMo8GTFb7krO2fvtihGntaoE3NNzfvKTIhm75yKGT1Jn6vAKwuhhepkbKLrWJNxi2mvyHQ1zafEDAHrwYqixHNKBUvfOZ++6CXbMkPBk4/0sJcSbktsJWLyPwQHXogcIDXX7RbsG4fMYB/Cp4CYp0XPAJyVeq5X2XI7Kdtxngn0HRk0gcNF6yQe6+hw8e77y3Q2U73liRK+8o1Fu1cfJdlmfkwFyWGP+NaYp/3D7d17bqcv7Gyos4Vuej1WDulBNM0XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:16 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:16 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 RESEND 0/6] ASoC: fsl: add memory to memory function for
 ASRC
Date: Wed,  4 Dec 2024 13:33:40 +0800
Message-Id: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: ef48e3e2-d79f-4cef-a64f-08dd14254af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DzxOsPw7o5U34IYPwxm0Vjv9QsRnpXQn55cnem+m1+RZd0jU+CPR54eZdgH+?=
 =?us-ascii?Q?z3fbGQSK/jWE43Q0mRp8eGDijNgsyoOZSt9Nk/GNkr5Qyjd3xOW1rM0r0BCx?=
 =?us-ascii?Q?VLQDF00vAw1ZIL747tV1FWwQKxK++IxYwn+UPctpXoODQVjUT1nPZXkhEBUG?=
 =?us-ascii?Q?+E+H9EK0f7RKvi8d0t4aBMty78MPvb5Ktd1Z7o2cEPELSo8eScY98jcXwPsN?=
 =?us-ascii?Q?opiKq8NUiiEmumLXyEUuit4BJvxvbEVtMWr1pVqRb0ZY8NPae6ecN07w4Sq0?=
 =?us-ascii?Q?ZWO9rZT7jvc9abmy3n0LSAwu14H4zii7BjHGZ3lhb+swNAQblDM/wTr6q16B?=
 =?us-ascii?Q?H+5e4Op6as0pGEE24YV2XOz/8B5fX7l5euhAbT85RLltSK2dgKmYiUOZdYdK?=
 =?us-ascii?Q?j6wkurJZcCWLgixtUGZvSKYvXGEnAxWMfaGJlMfSUmSVK5XVFnL86PbcvhFt?=
 =?us-ascii?Q?vPYaRb3oNICcoe6Rx9JcCWD2ISFE+lxRh18C/2OzNRtEx6iEahsmk/lJPItD?=
 =?us-ascii?Q?/8J6WY7KA+7lP6lj2NqWYZEuYxVtjnWcitQgUtDGaHfq5CkGjwPb6ajQv2/3?=
 =?us-ascii?Q?0jb4z9nAHIcYAR8+fp9qWlYVAnLbWuY8ehAsBv3f/1qUuuW4OaUVkZkdOHUh?=
 =?us-ascii?Q?pUvjBVGZx3x0ZI2lqkwMtN3w36Qnh5R1Mi8xflKI8czr+DLB0gIxLi/hDhnW?=
 =?us-ascii?Q?Su1FUFV8B54QvxCCPCx1k+gfQIPKc7lSgTPrKsH2ZBiGmnM5lvZGLK4Tpl22?=
 =?us-ascii?Q?LzEKx69MLB69nWfBctcQqlb1Q9UTIIbv3WP/GUAPmOs+0jebt3LKAO75mu3u?=
 =?us-ascii?Q?b/tmp3OKQznXekrapYCsYOO7xW2Yx6EkGN0+ip+Gyw8vrIK7uC2dtb1+mlCG?=
 =?us-ascii?Q?NLXKK1vPYj/xdC3ymtYOFeQhbdzXXuIss2mVce1jUSPUyx2D1NKNO1yhPjun?=
 =?us-ascii?Q?T/preqkVoX4kucRWOIBgqGN1pC8EGHRSJdZ8nNCA00j92CqdA2a0vGntApB2?=
 =?us-ascii?Q?3XHhskF8uUckwP/YgOXuM9c/XzBwYjVjtInoEfYq/JTpaIi8yvVVPOSxKfeH?=
 =?us-ascii?Q?11uiqUQCUxRJsu9DF9vpUvWdMOr/HmU62HCxokY+F/gnrQYkynvOV1XNEPaI?=
 =?us-ascii?Q?AOIqHvwPrTw5yfjASvx1agI7Z30eisB5Zn3osA3jSAcWL4Xt+tag388j12bh?=
 =?us-ascii?Q?KI9NbqRPaicToPtTc3aY9U87AySPTSf4kszzGvWNzKXDLXp5su9kC6ZzxtJD?=
 =?us-ascii?Q?iQQgiNH0Bg5c1sChGWACojAXFb4GzHeDVkSi5YU0kaP7PgdP8LnGHMyAi1YC?=
 =?us-ascii?Q?UP2JlKZ+RxkH2qhYxNytWS7YbCi4UsrEuKY5sHj+Te5ggYxc7TR4zPY7/OfL?=
 =?us-ascii?Q?t/Cv5M3HLYDvu7hHJbEbsTQW19gTTqwYFO1ctmm2uEUDTrLf0/OkoKF6M0yv?=
 =?us-ascii?Q?bArETypw9gk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VXr8uuKpKWLBgN67qFZ5cWhe9b51dYrFS6N2fCYOiIgW52PnzVZIvi0vsf8B?=
 =?us-ascii?Q?QYJ/Bp8BJUl7D3o1qlOniyd9/BY0SeCrz5I0lC+9L1sOQ9InPY8wLvoI7qUj?=
 =?us-ascii?Q?RS96/6FUaA5UgVwtCTvo+IdykvUXK2to7zwIiYaPE9Nmlz92RHSv3Am0kzBD?=
 =?us-ascii?Q?Cdpvau4hIAFulKxrxiyMu4sIlebM4Ri/Avzkf/oznPNbl8r4ckofF4CBXuTQ?=
 =?us-ascii?Q?6hqnO/NjERttCVh9qr7tYZ3KYr4YMVbzawoiKRqxTLWkfAtXOVde0ON0qyJ0?=
 =?us-ascii?Q?hAwIn/JP/DNem2LFYLJQRjoMoRCI5Ynnb3VFmmiBf969Atl+732w8Ccz9m2n?=
 =?us-ascii?Q?gm+7QNGD9LENu+31cP3pr+G1eI69ixBpQZfdGkhzMRVmY7pRsBL+mhrJ2xAd?=
 =?us-ascii?Q?nADwM9da9cIp0ynckZEmLAkeOFNLTvx6slE9Hi36cC95FuVhef3CdiJ0+dlW?=
 =?us-ascii?Q?hSLdTXTZiPfk3mKlwqRC2WNAmD4pABfr3QtDjrASaTolC9L3+5+X5ZWt3SuK?=
 =?us-ascii?Q?ty2ix9EMnbb9O5uRyvzz0UI/1e6+OS0eldaCEPF7dcK2jasZwims0zlvICW2?=
 =?us-ascii?Q?CuzDospQkvzFIFvGWudjkDczXiMqEntd4aVY3G97dXRSSSykC8L4P5Z/Hm/h?=
 =?us-ascii?Q?Ujr+PnU4hxxG17sXCNGhBsey5PJrCqr/J4zRCXZYBqpErXxmzUOG1+7W/hDI?=
 =?us-ascii?Q?xdDcOXoFV4J683Gk/BiGoyPwma1eHbAJkO700SNLfXO+jdpRJdK6fW0y0Znf?=
 =?us-ascii?Q?O2ahMa31MStzQTu6AEPp6hYPJIicEvTtKAWsUTxu63oBwlD12hDeaPbTwoI+?=
 =?us-ascii?Q?DdIEStjHYFHC29jNrEhOmMmlo5j9UPCYxxCrd6Of1RFb4Ih3T6n78eUzzvb3?=
 =?us-ascii?Q?iPQ6pEVXslwaPuySE0bZ5aTBe7Z5ewzscMKOGNwEAQbGgWxNCTX+50wsubO3?=
 =?us-ascii?Q?Ql/9CpyqnFZZoLNXXVyhUjRyRW8HjrefSr67uOWhqNE5Yd2UGy9WzliGT5jr?=
 =?us-ascii?Q?J+0HIawbJZ/zhYnfRM4xommGehHeMwC6yM1qsBJRhLgHnAHriEX1GSJBpFUz?=
 =?us-ascii?Q?3FXPC+p3mmNqmP4vgfyl0Gj1d/CbGBqLUWCof5C3/X8WSb9VreDzCLaLxbH1?=
 =?us-ascii?Q?TT38qO8pZPBt3lTt74ltRZG68MhQLUXqNLksCpzVfhN2iIOEXrnasVpHQjkZ?=
 =?us-ascii?Q?GdT04yPT/Kw7ViRzJgnw2+3ZAIFcEcOXA1fJ7AyWy2hl6BJ1q2/uoB4Gnodx?=
 =?us-ascii?Q?PP+ADfuGjlVtMwGIQQXCKo9/zzCfB8IJPw+QIZ1pqMexO/7KQbLABBv6m+mj?=
 =?us-ascii?Q?xneYVtDKVnrLTL9i1/9wIOk8XUxu0LaIWGaZjrnU/ZhDGGf+ny7mDifKb6Lf?=
 =?us-ascii?Q?/z5+KFdn8IxvP8gE4TP0+yOd4CjUVkTNL5WjvPs3rhpLCnCl+nIsqhvK1nrM?=
 =?us-ascii?Q?rGYDwaaDqj1DvQdymeE27i+xFPuvp79cje3fcTfT5ThsDhEbbVMixDAGkTp7?=
 =?us-ascii?Q?5IdDwSFznvrsKqDfKeK2PdPxCBTOafVmDhLY+ZWhMpvcS0PID0AOSMgqrzFS?=
 =?us-ascii?Q?DuqbIpktyEV6iwNd2732E/BE5cfAo9h5c8BauViX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef48e3e2-d79f-4cef-a64f-08dd14254af7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:16.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5pGuD3MAUQ+2ulGTuMdeGXOgw4f37+9HaczvpN4OecGcx6DR5uhST0I2E8FyPHzIzDfnPM9cANAtcpjgXixWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
Message-ID-Hash: YQAH2ECMDTXLORRB7ORRSMQ6TRLKCHPC
X-Message-ID-Hash: YQAH2ECMDTXLORRB7ORRSMQ6TRLKCHPC
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQAH2ECMDTXLORRB7ORRSMQ6TRLKCHPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This function is base on the accelerator implementation
for compress API:
https://patchwork.kernel.org/project/alsa-devel/patch/20241002093904.1809799-1-perex@perex.cz/

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v5:
- Drop Jaroslav Kysela's patch as it has been merged.
- Add Jaroslav Kysela's Acked-by tag, received in v3.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 include/uapi/sound/compress_params.h |  23 +-
 sound/soc/fsl/Kconfig                |   1 +
 sound/soc/fsl/Makefile               |   2 +-
 sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
 sound/soc/fsl/fsl_asrc.h             |   2 +
 sound/soc/fsl/fsl_asrc_common.h      |  70 +++
 sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
 sound/soc/fsl/fsl_easrc.h            |   4 +
 9 files changed, 1260 insertions(+), 9 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1

