Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25790C045
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E871FA4D;
	Tue, 18 Jun 2024 02:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E871FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718669702;
	bh=oZBVFazvPYAGsa3ulPPfb5etUhygpu7OlWaJgQQKGG8=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EB2PaUbkj40687NOwmfOpTy47fMMMs9cyYjtzCG4H2DjaUBPaLgsxEW5GCVbhZ2aJ
	 DJ/54IagPmp8RiJEiAy7a2nfOLQzOOSrfUzJ4vPux97bWWdHj/Iicyn0aYSt58IAxI
	 5Bz0lHXrK7inyluWWxXD/KE6bXgTa1Juy4UOfRjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6973F805B0; Tue, 18 Jun 2024 02:14:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9823F805AF;
	Tue, 18 Jun 2024 02:14:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0232F804F2; Tue, 18 Jun 2024 02:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DEB9F800ED
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DEB9F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=L2TbSHdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQkclwixxtI87XQj1XXwli12/UoGvZGQwpELE2j/1oDLY+vo99umAHZeZ0upZlf+W5u/SfFooD7QgvXgBc1pLCrGIficOwFJ4ANS3yVlxSjqLwDn5rzFnxm6+XxUUl2IehuRPRQiL0KFh/zRRVHAiF4zOD2cm2xVw+Myasb/nzsVgCLoKM//BPjoItSR9kkQJGoDB2/007kJyNoI0PKMuojuhOficgDqKdCtCwCinV8dlQRfMMOWUoNC1ZQeV1uaQwW+nwKxoL0XlVlDZOSNfq7HwYLZs04F75zSoSImucu5eKr7k1hbX9mgj7NN79Hz2t7yQ5THw2FUFHSoFGgxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/pKL+P3XyVT2Pk+9VDU/mSgiuNJT+zX25RAzs61kPE=;
 b=CDlOYk0e6wU8QlMxaXhFoN+9hX7ze5KtOOqcWmW2B25QpKptoZbiqR5PWodrihfJtYb7XiF2s+xDhpTUG22V/mpk0tkvryFK2etdnxaVKNdhOaHYmYd/sSODkALViSFvPMf+DCGbSYm89Z5ywmwA7p0RsUWJ98pewmnI6gjdKO0SjYBKf8XioxPyvQ7FTGe2g7IGtuiXc7qAC9GDFBWJHngyGrx4jAgZPC7A20Z3AoqVi+6PSriwNWG/Xk73YVLysnOkbyh8YJL0d6xTEVrjIqFdoFLHCGxrSb4oCM0o2758dz7XO792Ot0P7zvBYfo0AKC5n9V1/YWUB4Zw9Ow/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/pKL+P3XyVT2Pk+9VDU/mSgiuNJT+zX25RAzs61kPE=;
 b=L2TbSHdCazZxY0je6dm9bXpkYvRxyfYUZX6XtTxzxYT2uSFBxScdlGJfRnR+ioObwuyqrqE8lvJexJrf6kMzLUB6Tv0yR7fknLsd5U/j10HEs3/tyLGarYYiLgdm4m/3kXQivpJCjtlFjfKRLmtJgrVYHINUKK/a5H3FRAulWpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6362.jpnprd01.prod.outlook.com
 (2603:1096:400:a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:08:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:08:11 +0000
Date: Tue, 18 Jun 2024 09:08:11 +0900
Message-ID: <87sexb3yfo.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: dt-bindings: rename akXXXX to asahi-kasei,akXXXX
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYAPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb8b5f6-2000-4791-a4d5-08dc8f2abdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a2FUlok82Wpw64QDH97fhHwF8R22QAfdftAmACNpMCiqhhBH9DsU9Gp6TIy9?=
 =?us-ascii?Q?TE4Rmh9DNSPKd7ye4rtaHmC30gDhqb7Tbpch3JnRq+8NwCKHOX44E0a4mI9s?=
 =?us-ascii?Q?VgS/2N2zJd+OpoYGoR842lIFA7s07cfCJVnP1wdePB+1iB/wspHgmrQ+/NMk?=
 =?us-ascii?Q?6o++9HT3ERs+WbJdjMKyEXjuTthhtFHhDNnMcTdXdrP+WnBtDqM0r+I9sNHp?=
 =?us-ascii?Q?dhWS7iOi89wvFdpupQQNe3ChzF5A3My8rRvu/bkuzLqfpKwg3iw0Z2WEUelm?=
 =?us-ascii?Q?qxCmXQvm8yMQ8LnRV8d4yAXUozL3mKAf2UUa7rIIUmOWS6jdHUHb0BGaOjTv?=
 =?us-ascii?Q?RiYWl4tyoSFzzda/ITVZNiWGLbiJ0bnil/WAZmU04BiCS+Vd3kI9bE6gpkxU?=
 =?us-ascii?Q?AyYDC8Yxb2lVmXuAifn0gWTShdt9q2xa9ZcgwmNIQwGPfmLlFAl5xFzUwSrj?=
 =?us-ascii?Q?G0slSOlSj3xiXyZBB79382/AcrILJDJGPQC/HKeGRd+8PGhcwXHq3ks8/9zH?=
 =?us-ascii?Q?2Zb1Kd+22J1EwdQsvMXPqPyQHKtKdhx+3tJsgP9cD4o0Rtsgljg5YltwKICA?=
 =?us-ascii?Q?A5cN3PHSkucXDT5ZZVjh0txODjRIF5OhYu7UQov6pZayvOjaMf3l6EOveIyb?=
 =?us-ascii?Q?RC5ecU+PUNjQgIlU3Ut+oK3YBzCqMxxoo6xcv12fAwzREgmro/OA25qYZULw?=
 =?us-ascii?Q?SRy/ZJWE+R1nxEF5Yy33XVOYh5J8muHw5CIRc6q4Z/B/gKMUCiKWwQSETmHd?=
 =?us-ascii?Q?+SSiEIF0uKEBx63Q29i6tH8AqpasSSefsS3Klyp5NfkzXYYLddB43Si9R+hj?=
 =?us-ascii?Q?uHlUT+8vGNkn71Jrwq9eWRF9LXimMRrLhKqlZPX6xC25bUtfUhq6CymVQ8/f?=
 =?us-ascii?Q?N1uB16iQ8D3FfyjMeeB6kJ+bsaaWvTdukCTVdyieWRvp14ol7jvWI9FsIqQI?=
 =?us-ascii?Q?XOFGHzBGttPG1ngn43ej/lyICDDwYOUOMbT/C/5wVfJW6uv46f5Rpb/34aGE?=
 =?us-ascii?Q?PD1eJJrMWvw8oI77SEDA9lM00jI+WQ4o0J3TO7ahC38VwtLc8P8W5FQMEuGe?=
 =?us-ascii?Q?lsmHCeIJH9PQnkcnVixXVwC6F8X9koACJyWAaUVbTPJGC85wBrnRLwtU6W06?=
 =?us-ascii?Q?/09d1hDBLSIwqzWLMS1RmxJWRbZGS+A8gjR4Lv0BBAVIwU7hOaZVW4mpo3tN?=
 =?us-ascii?Q?MSJtMULALjWaunxd6yN882xSBlDd45aXELdQZ3o/8wJUdsT0cGTmjg8AEB5K?=
 =?us-ascii?Q?gnazBFg5N7gEzr+vND5k9uPQNsvs0dvuoOIV64BEwRCWLxpG+fK8IEZPL7IT?=
 =?us-ascii?Q?jp291xv0MBHZlgtiaoJspIaSLuccl/m2e+ZXff6xmMdPgkCwn/l3Wj0Lr9AR?=
 =?us-ascii?Q?Flo7UCg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/PQLqlJ/AKbbKKec293gIWbCrU28XzhHUB8AIWSNgMVnVD5xsDSVYQUwcUrr?=
 =?us-ascii?Q?kQ78/r4K2VKDLwF9sbpXJlxxoYaiaYj8jyhlPwzAwiWFTCP1Jam+HdNGmK9x?=
 =?us-ascii?Q?GhmsQfBHaGaABp3LXCihgt87t4a5bBFG+IxiN94u1e1eEYVJom+YqbI2ppU+?=
 =?us-ascii?Q?v17qZLaE5se9H4OynZbmF9HOxqWOhFdAYSI8G+3UcKtVqc8Wkw74aoaW55hU?=
 =?us-ascii?Q?dlOuL5vQtsP6ailqFrejXIM3gW/gml2ssYeYfI4eUVx4m3e/CZlOw1BJleCK?=
 =?us-ascii?Q?pyWPVNmKvaICQSF1QPHz7MZ1kFeCAEQZZn0DK564cm61jWPr9vzILehOTykf?=
 =?us-ascii?Q?+ymyszMPNYaxr4VzdP9PdmRky2YfD/9E9EjCRiPXkSfSP94R9ju3Df/ytP/f?=
 =?us-ascii?Q?J7Dg7LfZWCc/AoJMooi4cVWh7xzi8UXSxPMtBLHfcxEm2EesfwbHD8cdLHCX?=
 =?us-ascii?Q?qGywyXkaBOjcIOVJzUm2AmToT7JimTryO2P6VVM9r7G/nSZyLo4Vi6nXgSN0?=
 =?us-ascii?Q?e9lxRCSfWUqFTJ1okWhVyxpeIa2Pv8lf1iphNv5N6IchEndpaCf7VgnqdBC2?=
 =?us-ascii?Q?jeXveTd30yVe2pbsFVfGXuxc08iAOZhr3oSG12PiueP1Q/PVBRc2xyztAv5g?=
 =?us-ascii?Q?VxAAEitUIP/e1SIjyRv7qeOFaXdrc6oxMf7kjHduwA4BZ0EdHIPAsvzMIOCM?=
 =?us-ascii?Q?WXPKPVik1CEXxQa1I4hONkc9lrPoLa1COz5RgAKNbpuz6ghZaB7c3z5sMb8q?=
 =?us-ascii?Q?1O7Olj0Dh4jgtK2S4PVS/3Z4rvmDuV75bNmDlPJaY9NVG5vSKTnThrS8qjWM?=
 =?us-ascii?Q?6QHHp9DvLGH0NslTljdLl4hhdP/SO6QjemQsDQcQKR1iCTlWp+n5qCCoz/j2?=
 =?us-ascii?Q?cNrwpNvVxF5C21O08q7318sNYgEe9+5nNGRB2fHigCSscjpAMGBUfjYUstHA?=
 =?us-ascii?Q?mCKJ/NAXMq6NZxHtnTx/rf6NapFquzIaOwNK+hfUlsxf5EceL1hzw+b/qwEK?=
 =?us-ascii?Q?aGloC+PtgODx+PgfFjjwSu6WOC9IwZN32L8ACLfa5PhWcDwU+VQAQGNd0NK+?=
 =?us-ascii?Q?l2v3Ax+xXDvMG1Dps2qLWj2qyyqkEki64uKfK8xbjbIylVACetmONDURNMFg?=
 =?us-ascii?Q?hbdx0kFIoj0n6+uVAR73VY6wR5nm5zGf7mwbTqkz5K9p7LJQjY8kZ6PVSuRN?=
 =?us-ascii?Q?KuZzIDsqSeeNvgYZev0+jjY43kw5Et355kVCDUmELmPdITQJ3XlfUfpdSfzj?=
 =?us-ascii?Q?f8nBSnPqykMPmPXLZGBQAWwnf1xjYl5Pe1s7TCnG45FJzLDp0fU+3V3+5HJk?=
 =?us-ascii?Q?DWbKsv9FBCR+4tbRgTz7PN2kONi2wDELLyVb1wSLi+A/1RGyq3Z9oHCKynlb?=
 =?us-ascii?Q?mf/tPdp4kUZnaWBqxXhgAMC2EfH+rgMWV9w54XexvUdNKVJt3EL3quUVX1ns?=
 =?us-ascii?Q?LMescw6EjPX9Z8VP46XUwNuXuTJFlvim+Rh/E/hzu7tugTAuGVucDMtcE8k8?=
 =?us-ascii?Q?tTAKvLMn90FnhR456nniTCAqe+gZjxlvPXHYm8fVJfa5SuPDn4/x0ImCm/73?=
 =?us-ascii?Q?LNSFMMKUedfUcWd2NZjBPIe1DjClajbS9lydofkh1ooEDjVr/xFqCaAeml1y?=
 =?us-ascii?Q?MdpHfZ7ROfaV7lmQ5BJN5GM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dbb8b5f6-2000-4791-a4d5-08dc8f2abdd2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:08:11.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 maUyhgwnRUk/bS1YnSJnMrHWfUMIswXNQkqZEZteSyj4zywmiKsAiJ/dYGhE3f6Nu0AAqE5z72rwoLpTYeDxdJbCAPzpgVgABZJI5ATx+dl8bZ8gGH0myfbiQ198ySnU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6362
Message-ID-Hash: 2OAX4QN2CB4OWSCVES5W5PSTOCHTXXDW
X-Message-ID-Hash: 2OAX4QN2CB4OWSCVES5W5PSTOCHTXXDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OAX4QN2CB4OWSCVES5W5PSTOCHTXXDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Rob, Krzysztof.

These patches adds vendor prefix to asahi-kasei

Kuninori Morimoto (5):
  ASoC: dt-bindings: rename ak4118.txt to asahi-kasei,ak4118.txt
  ASoC: dt-bindings: rename ak5386.txt to asahi-kasei,ak5386.txt
  ASoC: dt-bindings: rename ak4375.yaml to asahi-kasei,ak4375.yaml
  ASoC: dt-bindings: rename ak4613.yaml to asahi-kasei,ak4613.yaml
  ASoC: dt-bindings: rename ak4642.yaml to asahi-kasei,ak4642.yaml

 .../bindings/sound/{ak4118.txt => asahi-kasei,ak4118.txt}       | 0
 .../bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml}     | 2 +-
 .../bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml}     | 2 +-
 .../bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml}     | 2 +-
 .../bindings/sound/{ak5386.txt => asahi-kasei,ak5386.txt}       | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/sound/{ak4118.txt => asahi-kasei,ak4118.txt} (100%)
 rename Documentation/devicetree/bindings/sound/{ak4375.yaml => asahi-kasei,ak4375.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{ak4613.yaml => asahi-kasei,ak4613.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{ak4642.yaml => asahi-kasei,ak4642.yaml} (94%)
 rename Documentation/devicetree/bindings/sound/{ak5386.txt => asahi-kasei,ak5386.txt} (100%)

-- 
2.43.0

