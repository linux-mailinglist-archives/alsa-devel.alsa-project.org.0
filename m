Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A0967E49
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 05:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF7A82B;
	Mon,  2 Sep 2024 05:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF7A82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725248960;
	bh=5Eddywa3/H8kfhmAVIRPUj04OjSS55ABaCz7kGwiRPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVtcHMQwwEAXa6ZgwcEzvKWxHx+mRM1NJP4GMkrx4myNlyWZu28DDzFDnYyD1rRin
	 I5tvMd8Kmzd7fscTLzNu/sh7+iZKgUxyyPZfD/CQCl//UG9ZC5F/5mMdsEUveottR/
	 hHzGxWm9kH6Ln2oqAtzyKwTzQQ5NV/HqTsR1hZ+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0174CF805B4; Mon,  2 Sep 2024 05:48:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B65B3F805AB;
	Mon,  2 Sep 2024 05:48:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB7ABF80217; Mon,  2 Sep 2024 05:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4601F800F0
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 05:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4601F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e1gUQtki
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PToygzhsaEHEz3SZOyBbUiUZT0vMs70SLLU0kR1sf3vj6OS+uRKlWe0Pv7WxNiA86Nd9m8vpIk8m+cQA3zdX1euomJ9OaY4QTykeOkY1BR7yVEj82+XkBJ0AxFvmJkSOP/n9BDwLwhTXbCY4CUrj0fYYTfoZR+mDAOZGaDuoppWQQEdytOjjUb2FkFUS1TBnAqf/+38/lRGxp1vKobJCGZ6NNqnrKVnSm1I3xdhaMrrPi6UhuBRX/hFjIFs6eDNcsoQcc8QF00R9Y0ZhwY8qOB7+Uei9DendlIVPi7ABnlN7Srx/AaXB1PP1wmQIdLWBdVO/tMjiK3+Ttw/FUdUWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJAC9IvqvS6d7GONfJwzMTHTow3q7/rR1hZn51mdLtU=;
 b=lwlciJBpE42YNqSs+qAy2kL88AaeFCO2atTMH0q+lp7VpHJy6KxaPKuJSU9tA9hqgUoYixR3n9irCI9F3Emxpq0VYn6x+dz8I9av2CBqNMuBl2u7hkcTo/dVxToYY7eXWV5gFSRUX6RqZRY3HUKg851HduB8m+oBtXp4PZf2VhiywPoFDqFcb5qPQE2wCeKqeePaU+Vzti3ZmGd1cSBZ+d1G7EU+b255ws/X54R4rkzs9LqXDQwDa37S6lIhk8xtMmpHaNgXcBUJuuHvPMkygZnti/AvBbPxWpnJ4T+mrwbWJZpGbiEbuAWHQvQGUqBf59LjCu9fnsn8DTLZ+zP5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJAC9IvqvS6d7GONfJwzMTHTow3q7/rR1hZn51mdLtU=;
 b=e1gUQtkixVR6Sh8YZ0osICUgfjqBaeUzjPSblCwhXvY8Wtmnav+HyjS54gGDerE9hp8NBpBYZ526bd50U41ex/8k7M1mILGJCjcKWJysFwYd0e2YMsQ0AwMXyheSzLJ2VYRKIwCcDMBIYnXtdyDpXtaYUAF+Oj+21XS6J5Y/X3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7114.jpnprd01.prod.outlook.com
 (2603:1096:604:119::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 03:48:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 03:48:27 +0000
Message-ID: <87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
In-Reply-To: <31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
	<31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 2 Sep 2024 03:48:27 +0000
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1913f5-5e42-48bc-37b9-08dccb021a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ybJN7f9kWLw+BWz8FN/T3lTZNoKPnyQeRfQxoonsrDbOwFuQbuujVsX9FNHk?=
 =?us-ascii?Q?EKNu0OqlW4irntQbv+JjKWbeSSGjCU1UfI5dw5nYu0runLHxKjLqF8imiufH?=
 =?us-ascii?Q?tS/s2l1scTlfs6gIVEAeS0qFbWwL2kiBNtKw7w5TwP+fzHI4IdQsKGib/zyC?=
 =?us-ascii?Q?M7RDV36n7bbtS9jrnNlrN7hKtb8atW+h9hXPrXAuB324ltLsLxeQlo6QR+P2?=
 =?us-ascii?Q?mag40HyYLZ2XeX80rE3iAI/Z7w2fxUK4H7nM5uC/73sB1iS5ZMEnLUH/G8YN?=
 =?us-ascii?Q?Ce9lnsAxSUwcIe52r8vm9r71FSTrNwXNK+dE8P2XlhvMZ965Zc9EGJJ3TcH0?=
 =?us-ascii?Q?Nds6O+GUZWiMoyWi3y67TzEC0HiPaFujDumqLJJtTaByd5Bi7tGqhNLiqFFJ?=
 =?us-ascii?Q?7JPMXfdQMgMslHDa6ETrHHRoYgNJ3Oa+c0aaM0kJjWrmSehiPuy5Yt4Xg4oJ?=
 =?us-ascii?Q?3KOfmOFMWMX05rN04T9aZvYsotFVgPepKnhT9zFEgPamSo3qoFD03w2P7EQm?=
 =?us-ascii?Q?e9pslNdQp0R4XJU4Wi4s+PRc2gjw1ESyFKUlMoHitXPWI5Pj5PkYbHA8YFlG?=
 =?us-ascii?Q?XmdhdQYBidTc843/gVckGQz93AuHyz2RRPB/U41zHOakOJcMN361Slu5gEnX?=
 =?us-ascii?Q?/7wOqDH1ozyfluAXmStZ2sdVuqV/nuEtZjZDTsu6c/mwG7ZetpWYzls1CXYf?=
 =?us-ascii?Q?mthcFJyXLepHXQyePVR7Kzg9zgq1JUwU+do/aSuqO1D/eyTaIRsShyJ9LRXF?=
 =?us-ascii?Q?qdKasdD5w3Ezin3j7Lu8rH8I8xBXEXfVOOiMeP3Hr2yjOQ2NS5atU3NkBYc5?=
 =?us-ascii?Q?RhCg/+fQd7k5PuHOygPkpOmnFE8v7dJXrbU/ZXqGD5qPilBopH7XqMqIMuQm?=
 =?us-ascii?Q?LYEoy2FHtxOhwShKc3FbPCb2cAIZk+5q/SYa2gf75HieWq95SlweVfboS6AJ?=
 =?us-ascii?Q?VCdRpvADKnU3dnSIZmgPUzEf9soMUd8lHcnRCzlzVcPRYzg596SaAb9hZuzB?=
 =?us-ascii?Q?XA++CB+7TMk90HNXN/dVQa7jRlsOceJR15Uk//JXdTkAMrGCpurF6IqQzv/i?=
 =?us-ascii?Q?qYb/5/iQ5nIMIJ5hE97N5TyBG4Ap55sVtGECnd242azqcFWFirr0qxEGNeCB?=
 =?us-ascii?Q?XGtp+YcgQVfAkd9RJaXMZetSdpYpKEQWqDn/WVbFxKtBTddBlbxbNallG0u/?=
 =?us-ascii?Q?AJiP2f+Wq4MWKLFasqKXHXvOKiDxPaP04W350wCHqb+8OcJRAmQnSDOt9UKR?=
 =?us-ascii?Q?Kv8H8G7nPO0PqTgRU5vbh5Kw+ZzZMKphy5FntPg2VfW2tR/EHM0JIIH/AoSm?=
 =?us-ascii?Q?rOBt7iGkSUFURrO6EYcTxG+MqGW369opPRo0z9p2DR1I+8/kGlUHAhQPuTb5?=
 =?us-ascii?Q?RZqDUy9OwBjWG3Ng6X+emmGIWALcz8eMWEKMZtU39I1MqwNnSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?thH5JDseyn2ABBy+OHCDrb6/4j6gj8qTO6s0iw8NwX8zXJtffTXjT3RU5F+R?=
 =?us-ascii?Q?KE6TcXooq9xzScPulnpZ0t7J9/AHvFjYUc5ZW0n0ad81xUe341z8rx4zea/e?=
 =?us-ascii?Q?iKW334a3MOstFxWNGgunWIVvI6n97hmMKdP9QUzOuBeQQuDbFuOkfve+Zsg1?=
 =?us-ascii?Q?A5q/mX6//juNmOx0FIJbtT4lMsIAZlmx9lf4nW62TyCs9BwlLdTdDhaiDg0n?=
 =?us-ascii?Q?0UUV8aeYkpGTB/gm8gIuJxpNbnuXSW4zM6T5FsNdtR4Qz29tgRnhjPm/aDB8?=
 =?us-ascii?Q?RibghkjBf//IaRImcolBAycxRZmmFzhJK4X9mZkiK2HgID110nZzS1ggqPwa?=
 =?us-ascii?Q?KGnMJj1rIc0d0Mvznd8iHWXWWdesCs/K8J1m5DMHP9FGeqJ1NY64Kf9LUIZn?=
 =?us-ascii?Q?B70p+XZ1V+hPXsxqweB863LerdDYqDenmP+R+40vKHwa3Z+SNspBIm2AfDoV?=
 =?us-ascii?Q?h/yONGMS0nMLPgwtyeOpgkyVLDWexioNu4qsgQEf9LBJ2OYeVOPdFSk4sCeS?=
 =?us-ascii?Q?HGhZMKcpfyzX5eGD7auh0X7d/J8dZgKVpw1FRrm8JVJZ4UCdG2Eorx6B7obG?=
 =?us-ascii?Q?b8+7laA8RB/MsYsVURS3BxWRgsmwHSKDCgHfzoljc3WnEABDvOaIrLMS9gIy?=
 =?us-ascii?Q?zhFEPsaq8Rgs/hEUQgGHyhi4fvsSsvRlSnBYcuEIVeKi/fkLFciqktV9aJGr?=
 =?us-ascii?Q?m147zA2byheRHcmiM1EA8KIVY1RpsXtnvZWIg4AgtlpXP/VetiIGZHleIUnb?=
 =?us-ascii?Q?5WFLpgGVva+xTWyzTTnW9LOEn28wLd8wB1WZvt14qwhC04T+4kj9JLxSCK2z?=
 =?us-ascii?Q?lk4a9g1rplhuy/cKZh69HGBmzShA0HMZrQ2Efj8TiVw+tQRTAcquwNSDarGx?=
 =?us-ascii?Q?pWYmw/0RlWwExFucWbeaaZMvIrBizwEP/JUy3lUNA6H7N+cjLcuqju/4U2lk?=
 =?us-ascii?Q?azETeSfVv+iBUnIsqLIWs93AG5Umncg7bocae/SiZznKCXzMxHSIBjXcLKdC?=
 =?us-ascii?Q?jg4bNnteIbseCkh068Lr0Y783UU+/Rk+ig0tQJmdXcPiVPjlWaoJ3RzmmNmK?=
 =?us-ascii?Q?ZErJl2SQwqDPHUBQWP5xv84NxJR2PkQXjjkWkeRsSzH2dTGYklTcv38vpv1B?=
 =?us-ascii?Q?JwzewKsfInjGq2xQEelks1ITtdiLz40EJdVMuYVhbr6bkeN7Ln1E6dINZTc4?=
 =?us-ascii?Q?tnCz2yf0RyZKGZyph1hLAvAsLZpR6JBNPaHpYyyvOyr9Q6gBBLkbgum8xHjm?=
 =?us-ascii?Q?AU5NQWKvr3cVuSFwOkwnEL0Fql7qnt9P/hHpOTrayMyGrortRhpcQv0EZm1Q?=
 =?us-ascii?Q?P1RfEi+gJqYKqSwqFtyLmsyKabETbxtEcrrPSRatKG0mbLCCu5HG5s5L6psj?=
 =?us-ascii?Q?q5/SIGRtzmkH5Ib+qoix4/HK5JnAbjQK+dFIu6kqHi4nxwG3yOtqCeLgjavR?=
 =?us-ascii?Q?rpcvlukbXrNxNWbY1Mf1PM/oNI8xWYD96DutDwd6wsO1bSCTkGlp982Wp1Tb?=
 =?us-ascii?Q?bg5SVWvbil05cTIsIyMjHFHIUEuzlxqqBNV6/FfigiCy0pGeJjCPQ7lw82Sx?=
 =?us-ascii?Q?AO7b5R6hMVK4P68XAcrzn/fh1napxawHk95TskTu5k1Lvt/6iAgQPtgjPdks?=
 =?us-ascii?Q?fiDk2783B3UMbSdsKDQSKfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f1913f5-5e42-48bc-37b9-08dccb021a48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 03:48:27.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JejX8GJ2CU2fk0n/LQplxHOUtoOTV12IAUpGV2YWkpDWA5anRCHAKrJ33okE27hpLioXpv6L3a+TETs/6Kg9M4hPN5BobZpAwUeJuoKDJu+IEbirKz4THGVkqlt2YL9U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7114
Message-ID-Hash: 3PQAUGFO5CQWUGYHST365KSZQTNSHQBQ
X-Message-ID-Hash: 3PQAUGFO5CQWUGYHST365KSZQTNSHQBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PQAUGFO5CQWUGYHST365KSZQTNSHQBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Thank you for your feedback

> > 	+----------------------+
> > 	|CPU                   |     +------+
> > 	|  +--[rate convert]<--| <-- |Codec1| <--
> > 	|  |                   |     +------+
> > 	|  |                   |     +------+
> > 	|  +------------------>| --> |Codec2| -->
> > 	+----------------------+     +------+
> 
> > I think there are 2 issues.
> > 	(1) How to handle [CPU] part     on Codec2Codec ?
> > 	(2) How to handle [rate convert] on Codec2Codec ?
> 
> At the minute this would be a DPCM thing.  I've never actively worked on
> a system with DPCM so I'm not as up to speed as I could be but with my
> current understanding I'd expect the rate conversion to be done as a
> backend fixup on the DAI link for the first CODEC and just a straight
> pass through for the second.
> 
> > I think (2) [rate convert] needs DPCM connection,
> > but how to use it with Codec2Codec ?
> 
> The whole thing is a bit fragile so I don't know how well those two play
> together.  Though your picture doesn't look like it's actually doing a
> codec2codec link?  It probably should ideally (with the SRC being a
> CODEC in the graph) but not right now.

I think we can learn how Codec2Codec is working, and apply it to DPCM
somehow. Then, if we can handle above via DPCM, I guess normal Codec2Codec
also can be handled via DPCM ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
