Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F139D9C53E7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D411549;
	Tue, 12 Nov 2024 11:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D411549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731407714;
	bh=KMIul9Cn3g9KtMsUjvC+bK/PpNnEw8ZLa24rpFgBFso=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=biMocrKRMaeN4j77KlIoXPoQwDDbaN2mLz/cWkFBW8oidcVfv9ayN5Ou+XSRvDaWz
	 7zknMEl7E7gY43mWhwHzwZieNQ0NyLrwPFMP1DVEzmY1jn4gVdpheAAJgB1VB/wClE
	 76xyQ5PPxQfg9EZEV45yenwhI3Rh+nvZYOh4GDKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08556F805C9; Tue, 12 Nov 2024 11:34:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 920BFF80588;
	Tue, 12 Nov 2024 11:34:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82F2DF8058C; Tue, 12 Nov 2024 11:34:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B401FF800D2
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B401FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=i9o7F35e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx3iX4xPx1URmOYq4z2XohmTeG3iIBmFkDrHhsdZSlw7PD7rWp9qltwxSv/BJoXleugCQlN6/vJ0JcqadUAoFxBt8PpRj43ZQP42rXL3Uq+zgjRuEIVmNAJ+V8hhIKKNFj2EHl/QeGD3ShaOOBtKBgb2vnFkjCF1H6NAGPF1r/L9m+yh0g+hWMhXNhTLpRUmASTW4+EhyVds1MfAI5Owa6TKinT4n0HZb3APwGaVSOJoQjU9j9vmGjJ+foGegf6z21YeimFOrnQaYI7jCHxl2ve2uLywGvzqXIJtYJaclHiqJQHds24jEutY8uKdGxE3K9bCArxsVlsg+V6fb+fioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=yw5WeGYGLK8E6jE6CtijuaPTnWzz+1twlomJH6aUkSJMquljM5xxAMLZCjtiXQCIUlOMp+4m9GcB8QFdmp7gVgSmriGWTXP1IywZXRezjseqhecWrX07UoPngJYqs+wloTENjgewm/kCqQAwXvRppON4a3q+IIcHDolBOwUvEfv6tKwdz5GGf58I9aRpviJRWugPXF7lqIYJD6xyZ3GsJFYonWWYjbhgm0jT1TIosWPhsAkVzRdgKBOjFxf0HChO53xbmyRCPZCPdizfCUfAO00GnoU2QmkbZzRwpN9Ycm8oH214EMB/oOwf3niFP91fyOoCbPS9NzFj0iC4BAqK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=i9o7F35ewz6xt+TGXXBnzEcBqaspXTTh4TVTHfkLweAuULn8TjjTUFmalgQXdZTOXHiktmwB/dZw46dVkzEaUY0mH0Xie+oluHftXjNqlN1jViGnTeZWvfvi/bcKzki2LZVwx5Oavwwo6uWAAtm8bC/YWMTEjBlcW+emFxDbRO6LigKjt2VRPDPWQDgLFlxjJ8SkuZYblvdei+T07ylmxJi8H/1nixkk6WhAkq5piCHK0osFkymn59qazSt7VA0ii/N5By5MEknoE4bCVZICI58eFuPxpFPKp6MeCzUtoZBv3PxlIlpeF0TP/iFN4jfL9HqoWGY+YLzVoX5PblQbcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB10757.eurprd04.prod.outlook.com (2603:10a6:800:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:34:29 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:34:29 +0000
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
Subject: [RESEND PATCH v5 0/6] ASoC: fsl: add memory to memory function for
 ASRC
Date: Tue, 12 Nov 2024 18:33:58 +0800
Message-Id: <20241112103404.3565675-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB10757:EE_
X-MS-Office365-Filtering-Correlation-Id: 894c4f98-6a5d-4428-707c-08dd030596a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xceParb7FhFbq1thJ8GDs56I8sO3OdZGCBBly0HbjFlQjRMTgTmcl1pqvzlA?=
 =?us-ascii?Q?9QEs2v2OWXPiyMRAWc7SNx3M8K67XhtvryNsEqTZha66dUwcAaOICGSPJQdp?=
 =?us-ascii?Q?44vJ7Ji+jiGE6LRQ/dNoJlZaW4/6lT/sM/fnHAxUbBsMBmuY1jfUKoQKBii2?=
 =?us-ascii?Q?QJUlwHjjhDniXT1OX8n1Z5/LTBCIMCqkcGAJiOeE6ej3d40xQLXFPUIton+L?=
 =?us-ascii?Q?77yAuhMit2pqjA/f1PGDd5aeMTSQ5UmqP3LgpV2uFswQSBg9lYVzUon7Ud56?=
 =?us-ascii?Q?PZEkrQhk52rBi+E4zgSWfrLYd4ThJSRHeRInICd8jWk+tR85wrk3i0gHfnnZ?=
 =?us-ascii?Q?vLYcQ2nz3AptU2qr88EHvxFzescSDe+jBA/aMq9B8u3JNeY2Q8Bc9VhqEEpc?=
 =?us-ascii?Q?HOIJt2y0QNmNBY3kkTzEplB1bweckSSFVdqAAsECgD86iewiM6DtTd2ML73U?=
 =?us-ascii?Q?lExqn2A/6DdkCntlaZhUvFM6khK6ApeW9y8F7P1W/pEz4ALsko4vbLdvrZvb?=
 =?us-ascii?Q?CkRegPkllaWubJC2ResZLRHET45bBNaQ4FcIsJswFCtrm8aWQqwhXy7/dCQA?=
 =?us-ascii?Q?ZHcNqrQx6fuDxkApxJZwgb2zthoUE/qXsEiVlyr85Jj5P2gGNO3Cehklu18Q?=
 =?us-ascii?Q?iUDz3ekv2hAs4duJKoflsdFBIpikoYCLp9PonChssmEWn6HQGovgwmE1txsR?=
 =?us-ascii?Q?meuGzH99pBQb/tGqthqdncq869yPPkNpQ2O/esVP0N+vw7heTlr3vrRlAboo?=
 =?us-ascii?Q?xQXaqiLLrca2NsVZPhzdgw+8O31wl/fCpIAQvnc/w2cM/x0rNP9lZctr9Yd5?=
 =?us-ascii?Q?H/FWYvOwQ4INq3qzlaZ8DAe2+FzRNS1O49WjlLg5FGkeFO1nO93AdxEhyQcH?=
 =?us-ascii?Q?w4CYO4qB/DqGyqjrssTG2hXul3dQXAQzHPuZ1t1KLV5FmUuhLCponDNqelGQ?=
 =?us-ascii?Q?Q8zewJHsweMme8TyjV5nUaCVl4oZB5fxTWFL92u233myoU+ML+jyxZM0f0S0?=
 =?us-ascii?Q?SvJ8HeAmdkdRaT866A5yqFoRaWIGLD5jo8USLeSNo5QlD+aVqG8gBNeHwpxe?=
 =?us-ascii?Q?Cfu/nTD73j73//PyhsyIypG+NP+6heT9n/2gngBUz51mXt3wmbHEJSJj8J1m?=
 =?us-ascii?Q?e2I6Eu3yGCnsb0eJt1EC3h0cf14YVW/31jDVr1paVIjj/ieJ6S6zclOxPp42?=
 =?us-ascii?Q?epYOmeRhqdirTuXA6t34QUEr/t0O3QeqoVww9Ylc7lPnrbEhhCoRN9TfJSk/?=
 =?us-ascii?Q?t4Hy/rcGVkRBqM3yuO99JBbiFkmvE7j2zqMzo07ukwgj2dW9ak1ntLKXtRRm?=
 =?us-ascii?Q?8tr77bb/xQO6d4qUkfM+EjAhWGKMQD4oPxhvO4mJDNrcf3VHUMYQ26XuUAaP?=
 =?us-ascii?Q?SMis6G/r4ELy5AT26jZ7kUYIpn+rt8aflExTeputTuPYStcK8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bynz14i++tkuu0sYG9He2G7cqJx+Ml5a+uquHIB3BxXp2g8+u9lrirJEnv+M?=
 =?us-ascii?Q?FFMls2VJWsDW9v2s6uOCa4zU3OP4mmC0QTxIZ/xaU8vc1J1t0TAvSEgmPNMk?=
 =?us-ascii?Q?ZHnXwKyZQeCohdIaST5NtJXh2yVngZSM4Jb0BKqcVMp5fSF1uw7ioeWueKsh?=
 =?us-ascii?Q?bEHKBPLCskdJA4obQjNJV+u5xwa+jbl9OF52Qlqj0Um1+JUMAsqSMqxPp9Hx?=
 =?us-ascii?Q?4YlrXKwGrt7Zz48mBO2jwc964SdpfvW7CCn9h0xhDSof1KPwBw2uHof0Dnz3?=
 =?us-ascii?Q?sc4CkTSjJKWKCyPZUXIRFdivhzFJY3kdstI4VbyN1aSXIhRM8v7fSMoshAnc?=
 =?us-ascii?Q?Un7NSPQiedXbjqIWIkxFjpgQNkKfxIHAi74L4VYY3YZrT8RMZbPzUlZ1HzmC?=
 =?us-ascii?Q?au8c1qSvsT02OK8O8vfPhHRUxIxVXOLbKDVp2jwjxjfZp1tn7YaRHFzUqqR+?=
 =?us-ascii?Q?0Iz+leIiDHYKlFusZuVOHRhrGIaI6UrwpIXMGv/3RRObPtJflu2h+pQcDoZ4?=
 =?us-ascii?Q?8E0tY+XumwYvfzj8QBaDgoQnQHy8UmobqtYeWMvTgigNSJDhq+PWAfhd6due?=
 =?us-ascii?Q?1+tWfeyM9HcgynvyR6YAIKWiW48QGKXgFvvJL4oFlIjFsR4w390bKQimo5F8?=
 =?us-ascii?Q?SqS4J1bDKp+v3VJg9RIAiqAjv6/oeQn9jIpg5gtzecHr0Wc2Q0zV3GLGmijK?=
 =?us-ascii?Q?BGvnmPMwj3dsrLYZZQAhvZPv2YRDCqqeHytiaj6yFVD4Y/oybZISU9fggpnA?=
 =?us-ascii?Q?XogxuxMDgk0lLBmphN+vc40LSAukT26pctDlNGgiCctxGJit2o7q+ZliDA8F?=
 =?us-ascii?Q?DTbovqtlsEvbZDsUU98ezEo72fRmk8E8O9AY1KjBPyzbEguoLAISZwn8DTiY?=
 =?us-ascii?Q?9rjkMq5Lfn4LbehPjDKQoPikesqTWxXTsfw5MPLZGc+Zdc9nm9jPd2j87di6?=
 =?us-ascii?Q?aBKvdRm2aEQ/kVxOcHGSTluJYIGQ1nk+EG/Ty/LARfP//dDU5usUp9G62REk?=
 =?us-ascii?Q?K33A8QvvoFbLyGa6vq0K3TcM4i8j3vctJCAL4D5+tYqylw9UbgoXZqTQcdty?=
 =?us-ascii?Q?7U4GGFuJV53qgo8r3ttVS33nypgizRX6GaTwFKVO0ArP+v+Y+sm9VEWSZ/DF?=
 =?us-ascii?Q?dvGyNqG/K3aIoboaKvWfWRe33Wd34hRwy4A4ukZ7Edw/iH5WWbdu4iMqJIdE?=
 =?us-ascii?Q?6/k6pzxvbYax/d5K6tR311DJUy2xbQK+HLiDLVBBJZlvWNUUSS3NiGEeMfln?=
 =?us-ascii?Q?tYe5uZEzGJ6cfZ0BZWuv2zB26QNVqTZ3MZmyiDpW9tX9g2JB+bES0TlYY2Hm?=
 =?us-ascii?Q?31dyfX1KiO5ucbhPIZBK4nY7cRiQIk03OSiwhPuEZMx8ZsemVZy9UNaN7hRx?=
 =?us-ascii?Q?zdo+tsknf8+cmHuamcS7ibT0vQxGuvapr8LVolDzMFD5ZQVZbky+XL/tx+oj?=
 =?us-ascii?Q?G3+dLKWBvWUIGKfjVNeMye/oOd5zQs2mQSfhuGmM/hN9r9sqf7wNFkj15jzY?=
 =?us-ascii?Q?mMNWOPa3zNY4jK8MliNmoWlhxixKwUtJP7NH32E9Kr6sNugqVaWMOGv5CfYJ?=
 =?us-ascii?Q?Vt+DJloeyDNIl1i7nc7zbehcsOCopsKnZwUZ0JIw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 894c4f98-6a5d-4428-707c-08dd030596a0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:34:29.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5YQRnXPn2pKfcnI2HeYxRDszE3OxrUwJ78kW5t4wYFPFXsu/DbNCig/J6bKfP+QZi4aW5qUTOZxQjdzeJiP1yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10757
Message-ID-Hash: PEDZJE47KALCHGDNEM4XTR5U5P2VYKXP
X-Message-ID-Hash: PEDZJE47KALCHGDNEM4XTR5U5P2VYKXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEDZJE47KALCHGDNEM4XTR5U5P2VYKXP/>
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

