Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617596CE57
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 07:15:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67818A4A;
	Thu,  5 Sep 2024 07:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67818A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725513317;
	bh=uZA0ftQRMJdJ6WvIhkMzbtP/STTMDzLPtHjivliHdJI=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kcXDm6NYEP64s0zt8WWOtU5ULPcV9q8D28qPZ/nxKzpCgsFbnHOBhMhiWh35LhxPH
	 1qwJLFE3cEbuCuEAkWbIBwnIKmK5iL8FYZIezC6poohxpdiwAHh1K9ZiHEsRU1Isu/
	 XRS1wqriceaTBUIIAXq5SvPjC65jRjYoD2jKRprY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3E45F805B0; Thu,  5 Sep 2024 07:14:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E15E0F805AD;
	Thu,  5 Sep 2024 07:14:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BE4BF8016C; Thu,  5 Sep 2024 07:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83F34F80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 07:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F34F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qpo2WOZ4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA6fg+jkyG2lk4SImruzXSTtgzOu5tv6WRP7BnyTG4l28ctoJIwsHMyn89AzSu5K83Sl9SsJA1SubCSb2iSveFcmc78EBD99LWZ5hK+E9I9NNE7k0cXTwi8i+gMtwsXCEyuS5TUHCsn4C1BP16lFTjLaZ4TPc+dkAhARh0cJUrr5f2+HD+1fiOX/PE2zljQX4KlpcoCMj76Vxo2Wu/iqWGUGWe9gIhqSXQJg0xhGPQXIUwqaul49MC9z2zM2DI2srf9zu9RxmLNuAMmiJvicOHVXF5xXedQuimtB3YKtaEYhTWwJIegVNJ2XLh0zJkzVQvcLHCrEi+SWLDy+zyeQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tl5cz9/6UBIBlw2/mxcNPlOtI/yikIFTW1Uuz2Ki3g4=;
 b=hKGlS8iWbYKX95M3xKUfWo8EejNfBS+2th3eQrx6Y9RGsCsyb9C63VgUv8we8hL2A02tT4sAqbuDdqX8ucMc3DKXi8zlqNinScgotc/8WWAQqTvtn70+bG7URk20hEZySytKdpfHbFh1a2h7qVOlWzyTAwlUKQ5bXELUHTC0pw4QG/u+6ndNp4U0pWCVR+v2Sr71cZpBTpOW8SRMARZh7K1ObpyofpNy7Ru8HHYBNVPxnXf3wa+1AOYbJeIc9NKk5WKvtWN1zLlxq+EydX+/fhY+WHQcgOdAbK5K+gm/NzcqTTASEuMxGZDFqPwWuA8DKGgw19gZ4ob3IbVQ+2mU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl5cz9/6UBIBlw2/mxcNPlOtI/yikIFTW1Uuz2Ki3g4=;
 b=Qpo2WOZ4+LOFLpBaS09E9JG7LUwwEvm7sMwiD8P4DkCdIdmCXbXgQ9jmg7r7Mmu4EGson7HPzGCpy1SCpBledUHhBIFHXszzIHNZkXfLHehhFbkwQoILeMNEYiy9CCiwZ7D3msozbZLYU2ErLUsw++YtNCO2LYSosDR98i1yJDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13391.jpnprd01.prod.outlook.com
 (2603:1096:405:1cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 05:14:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 05:14:29 +0000
Message-ID: <87o752k7gq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: makes rtd->initialized bit field
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Amadeusz =?ISO-8859-2?Q?S=B3?=
 =?ISO-8859-2?Q?awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Sep 2024 05:14:29 +0000
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13391:EE_
X-MS-Office365-Filtering-Correlation-Id: f12bf14c-db82-4b5b-5d14-08dccd699ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-2?Q?7CADR8hMFZXVwNgi+yHxvgS/+2qwvlHFC5fhG1T/j8effxvCMVZs4gvBwH?=
 =?iso-8859-2?Q?RUdThx9CpDgsvNULzJ7u1ajIfaCCyf3D/Be6jedRe6hLKE+adNQp+rUPdn?=
 =?iso-8859-2?Q?h5FyJGzCPGqzvtnr1y/02yskYg8k+wCW0mCRyRKmNACaaKI1ZdwbZaNbAC?=
 =?iso-8859-2?Q?ncaSZgH9DH57TIXI1nT2xGDLqRcv4oGKFX41jy6mRWOXQAcYlhQ1cBB9Z0?=
 =?iso-8859-2?Q?Z5/5jjDW9yz7TL44mCeUTcQeyQwh8mVJx6nj45dQwQUSWlEnGZdaz7rf3p?=
 =?iso-8859-2?Q?SKB16GEwIt1yGh4s0Sd9fzfePXzuIjnUYilNiOInhidQJAMt7dw45ymWkq?=
 =?iso-8859-2?Q?V6bD66RRGiuDj2GQMf4QBv5VoRNXcdFAMz253cwRrZZ7El6d5kB8kRujoF?=
 =?iso-8859-2?Q?TH3lDbQOO/bdWRQAyq3apFAg9Zzpg0KgcKeWeVxhUbSbaZXPDJ/QT2Rx/1?=
 =?iso-8859-2?Q?sKFw7pWC/m64UCqhoE8rjHFVlgYkjyKqo37T6pq+qd6htr3CiOM4MBvjFR?=
 =?iso-8859-2?Q?ffKsAUw2bJKq3rmegxnEBRmWBTH3uGf6ndAvZkRdGWPmWgnlHp+wY1LnOb?=
 =?iso-8859-2?Q?wdZOM/yRY0ktw+BlOY9FkNyZ5qNgghpN25IX6kmvsBdpOkCQjrA6H9L0B8?=
 =?iso-8859-2?Q?rNptKxZkPaUpZXQ6jtLsoKnPmQSY5IIzkLY9drmOUv4PitrbOIRhli4pZN?=
 =?iso-8859-2?Q?ZbyguC9qXrcQGeFkF0HEVPlHB+Nh/3tSpFj5nSm3+FJR5DZVt1z7he3W0u?=
 =?iso-8859-2?Q?HAIBn7Xjo0C02vnsdDqtL/5V0H+6sVG4EflOHk5+Q3/tcvT00TBSSHSQAg?=
 =?iso-8859-2?Q?nMb/HGwHSAikxMQPyn6FSDi8iZPL0QC+qS/PWQo+ypl0fujRJ7qihCjiQ6?=
 =?iso-8859-2?Q?IyhXLfTw3Foph0N30+XXkkyo+AA7VQVR3sb1s9tzFI0QN4ol/+mIK95lg7?=
 =?iso-8859-2?Q?i5THUeX+0fOj/XJvmucO/HSrgZL9uq5Xs4ce/uAOnjKYCDsE17JCb7w8yP?=
 =?iso-8859-2?Q?w3/nMSREQPwuA08B0CzuLhf+1D+5EmkXhhJJ0Yd0qvbBDEH5Tvr8RxaRja?=
 =?iso-8859-2?Q?fRdYuxkaULsrV1X/YZzc9cxpPVxLssd7p4xF3FqNwyUyl47IvvOImv1bcJ?=
 =?iso-8859-2?Q?+1lAQHRjqHA8h4b44vwBa4d6oczhl3tBvDpSM2CwAOaCbJqmnBicZMk4RE?=
 =?iso-8859-2?Q?kwsHmzvDWOu1YwkdR5H8qp4GQSxDWUmEOMJpH4o05OSzgrH1dhS7/OdzLD?=
 =?iso-8859-2?Q?aLZ6i+BTfFQgpe6OGWLGExMc+cs7QvxxF9UwNij42yOUAjiuJgA8GLranl?=
 =?iso-8859-2?Q?/8ICAJhxxNx/q8n17k9nHFdJnyEaNDMdkvh2r2q7oFNwwUuNtteXMp7ISJ?=
 =?iso-8859-2?Q?6a6xtS/uRE5RVnBsAUxS6dKDojUFFNrxfzPLZW52nAvDWtS4Y7KJaxxinL?=
 =?iso-8859-2?Q?QJoBiTd6IHoaHicjBv/3lfHrKgTcs4GiUEIFSQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?oAtiaUHndZuMzNvul4mHaGshq9oxpkzlJ+x6JRKPcSitc+M30QvZu49/RP?=
 =?iso-8859-2?Q?YRP7DuhC6XZLTLVNEpx7ZDlWWupGyxG/YfW2txfE/KmKW1cc5iTc+fnUhu?=
 =?iso-8859-2?Q?suG1zctiiXRprS719t5UlAYP5NXqbIyihxmLEVicAZZpJico0172434M6S?=
 =?iso-8859-2?Q?YlLY8W8Fv0eMVWiB5WB8T50S8Nkesv0i+DYRjfibaCSrI+ULP5V2ydZoRc?=
 =?iso-8859-2?Q?TbuQQIFpeNOHD8bv1rlUdy4Uh4RIgcxdZHQUU3uwLbMxgGtimDFdbM2l0g?=
 =?iso-8859-2?Q?tVOXQm4bUnyNtIS9jMLFzgS9fGIASUhvoSiXZDpgvkE8Xu+EWrvTumBEJr?=
 =?iso-8859-2?Q?26Qs1LbGYMiqgTHDDQzailEMVd0YTq9NB0lKvc7zLYy5EqfKDc126v1bNz?=
 =?iso-8859-2?Q?frgJ+0OBVLysWQmAydPlsWfmNQpI5939+opoNTgaYgVI9HdY/95t9I3wiv?=
 =?iso-8859-2?Q?sFgmcYKoyXiZFB/hqbp4pC21kyEqWQ6vBUk42XHl4jD+5N22gjesQcHKCb?=
 =?iso-8859-2?Q?JwaTWKdofZNotm1HcrbydFIHsIT2WiKprbZJlqakj0dMYJ2ddPiY+n69Ig?=
 =?iso-8859-2?Q?IjSaQL+ymUgjLiNs9XsoNo86f6P/rJF9AdqQgct3jmF+8eoIdzsgzNCOYi?=
 =?iso-8859-2?Q?+nvNkutuQ3Ckf4U1i8OuZQDyxNborn02Dvrh1Ji+xPkO7Xq6u0DKokeV48?=
 =?iso-8859-2?Q?vm1a6vXEUPw6JK+CthZ45yi9jGMXjNt4YyIRCLAFoXSKJDI/53baUIpuZw?=
 =?iso-8859-2?Q?nnJ59PpB2ZD8vRAR5c8RXD+CA3szMoE6cw8TRtSrxOD6QQahONhS6TgEKx?=
 =?iso-8859-2?Q?Bnul7jxQsjFdfB3Joe5XCiLBLwP3YiPBJU8hn6zLWwFQbNLZUfETmWYVgC?=
 =?iso-8859-2?Q?j7qElNYuCRxI7E9HgpPq0xYnS5lS3rFvkNSbe4ThGbOacBzjL67IW7hpeA?=
 =?iso-8859-2?Q?uoE/oRp4N9bQZwUrlQrmGIqFIdm0iXIUl2VLhkzq2OWFAbmhGUGR5mHtxJ?=
 =?iso-8859-2?Q?muw4IWwTvbFZT2oX0U7V/rZZsxRtrAzvVjIG/cFvZ2jmLUDcX32gOIHN3/?=
 =?iso-8859-2?Q?pQRNKvPPs9WLMkROeCmItSgGGkT6aw0YKCeDNDkojAbhD936RPBPAy+Jtn?=
 =?iso-8859-2?Q?4p0Tt9jWKH28lO6mSobsPwZliaHlbAZdahMkJbBrMtfptjuhWJ/gMwnP/n?=
 =?iso-8859-2?Q?TM8gzEcfpke1bP2RzsVOFWtxo3NPLmigS1LI47xAsiUb0qHiRWsh///CYR?=
 =?iso-8859-2?Q?bwK6sa0FCkYwmtP1LoPG/UokmAQKpPmKWE3Azmvamywdob8s5cJvEvSsgH?=
 =?iso-8859-2?Q?g/UTHEAMSULt+ZIX00aTcvUhvb5c+Fe+3BPZRlWzqFBy4/63kPYtzJDkkV?=
 =?iso-8859-2?Q?8NDCbDPOSGVnYggTY35bCeFhN2JnY7ONHKRID8hYcqCq3gywGTMktZsDON?=
 =?iso-8859-2?Q?vUdK/m+yEGBEhBNulA+i/kxX5hFsxLBuFpmhgB/0yCST+8bIBGmy6LnTFQ?=
 =?iso-8859-2?Q?TDfoXrGrSMUcY8zVxUJfDBQc7ogAIIGS6oIvhO3g6L/cjxejRG/g4X8bil?=
 =?iso-8859-2?Q?nKnEWlYG7BfADBSxPHPGe/7OdHcXwyL47jYBicgD3/2N6hRYk2gMLI/JAD?=
 =?iso-8859-2?Q?8UPW7oQhwbr5LJWR+dWbsSkz+xee4jherMGUd5825i7nba7NdyhLharJgO?=
 =?iso-8859-2?Q?xtGCuRPABleLlFM/9w4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f12bf14c-db82-4b5b-5d14-08dccd699ec2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 05:14:29.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ktZbjxLw69X+cEVmQ3v3CRw7SwfCK1Tr9FHx0gDD6jJwsIaBpY/p5e3Nw5NXbFkfN+GhgqQAS544eXPH/KZUGNncyymkkzhn3g5m/VL++W4MydYWjxBXlei+iqC81ADN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13391
Message-ID-Hash: CQATD5DN3XVZFY7N5H36GK3WK6FMCPMK
X-Message-ID-Hash: CQATD5DN3XVZFY7N5H36GK3WK6FMCPMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQATD5DN3XVZFY7N5H36GK3WK6FMCPMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

rtd->initialized is used to know whether soc_init_pcm_runtime()
was correctly fined, and used to call snd_soc_link_exit().
We don't need to have it as bool, let's make it bit-field same as
other flags.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 81ef380b2e06..e6e359c1a2ac 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1207,8 +1207,7 @@ struct snd_soc_pcm_runtime {
 	/* bit field */
 	unsigned int pop_wait:1;
 	unsigned int fe_compr:1; /* for Dynamic PCM */
-
-	bool initialized;
+	unsigned int initialized:1;
=20
 	/* CPU/Codec/Platform */
 	int num_components;
--=20
2.43.0

