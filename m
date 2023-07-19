Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C07589F4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 02:13:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B35D1E9;
	Wed, 19 Jul 2023 02:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B35D1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689725600;
	bh=UoIjqlxe3Mh+q0KLT2fFgE9DZCj7tKlsEmRuWQYqbSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5khCLBYSs6TvJeagLZJzDnn+4L/lJpbwGMZYYIQ0apvkLP/6s+otd/PDFiWaAQdm
	 3rBd09LPum/cHzvrOkGYQl0fpORLgKHqDpSsgpmOkJxwd2DWuylp9Liz1nVJOHast6
	 MpJDQiScOVl6Do4GeSWbbJxWZ4JB12arlAw8r6+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44443F80520; Wed, 19 Jul 2023 02:12:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE15F80153;
	Wed, 19 Jul 2023 02:12:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F27D2F8047D; Wed, 19 Jul 2023 02:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C697DF8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 02:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C697DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GziQRFx+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdJw+liiZKZNFSK8UDHxJ+5/EVM/ZA9eqiNftOFNeMA39EDZaK8dddbnlzk/JEXG3bOWilX3looLIL7ggdIsamsRnIrnjVt19/8ICMgIpHI/KHtTbddVu734tnfIyU9yeC0X+6TFvO2wuxmNLPXaMmwBdMf10XA6zVf1dPJYJfFWtJJzG93o7tbWeX5ma3ovnZA9H0jT3Lb7tSdWYJAuES3ln3g5RQRe5WKDfEQCEkoo46h7pvXI0mvXueSfI7s0hNEH4mWrQjRxxR4J7TYsK2y9UYPAIdKzn75fG6NGGB/SY95BeUo+V4kiktsLQZiv1Dd7lUzDPQjJLkpPLeT4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCHOEyXWME3T4OUcdO6bBCBVmKMxAcV71smILCDDJzg=;
 b=ACZGmiWX1qFLD436m+fC2jf6ozYWKez0yxAEvJAvRak94Ru7llqdhtKKzbejdrwSbF0L/Mi6DdJc+JResGggZ9PpcCkTYESQsOuTsrLK/DYkBAhoO8d1adkLP0XBOfF6TUdtlUrg48E6jYxqll7K25J+8/SDkb7kuygtWqUh9gfQ6sGLoJIHLvF3lu5k+nrAY7N3ynwWxRrsnEvnXerdV9as6bGbgPGELi9qRSR3UNdHsspQXq1hAm26Qutz4+zQ7Fv/+c9NFAbrtMquHOldHAjONTWX6Tawlq30jxrNNzYfPaByjn2JJiPkIuK8p5xjSqkhrKJPyScWzawwJ8BAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCHOEyXWME3T4OUcdO6bBCBVmKMxAcV71smILCDDJzg=;
 b=GziQRFx+PN7O7kZxBtv6XRO6HyB3IclX6eVjlfRjkexNeHzDXpfmIoVevano0PCsb1DFVElBC24Gp6LFDi/S7ryRwd9iixIjDlRNbk3l2ufXDiWoo/BHVmBM5khHrvIetBbh0f8kQSJlB52+397gzH6rD2kdS+uvhxHRmpR3Rbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6208.jpnprd01.prod.outlook.com (2603:1096:400:7b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 00:11:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a3a7:e0b8:ca7:bdb4]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a3a7:e0b8:ca7:bdb4%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 00:11:58 +0000
Message-ID: <87h6q0iwtu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	=?ISO-8859-2?Q?=22Amadeusz_S=B3aw?=
 =?ISO-8859-2?Q?i=F1ski=22?= <amadeuszx.slawinski@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,	Linux-ALSA
 <alsa-devel@alsa-project.org>,	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 14/15] ASoC: dt-bindings: renesas,rsnd.yaml: add common
 port-def
In-Reply-To: <20230714144245.GA3492124-robh@kernel.org>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
	<87351wo921.wl-kuninori.morimoto.gx@renesas.com>
	<20230710151956.GA1992791-robh@kernel.org>
	<87lefn8gh9.wl-kuninori.morimoto.gx@renesas.com>
	<20230714144245.GA3492124-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Jul 2023 00:11:57 +0000
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c256c8c-24f2-4f46-ae0c-08db87ecc44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l9ZPmw+z7W2BDfTnQ4pyzHnLmrSnGv4gZQfMZ49JPY65Zjusa896osVjatya22zUNnJnIWTY1lepTgWDAJxz7AbEqvYa+TCHnbR/8i4m4GqfETQv6R6vHHPx+EysNRkuMEw4l71acQ97hKn6rGwjlh5xtD/IDjBbUWwOCpJJWjBq/uHJjAg5FDYbgkXg+vO3Z47DvzSnQEecwNkDz9JYp8o1GQgIFTRiKq94jf4q4ILjtcWDbLDPrCvwuvtsNaBkIiELkjn56XOMZO6aqfrrpryrp0XXzYkvLPu3cDu8sKNq12DL+5TULbAybOgf87MhHwaA2ESJ8nF/QipBEVCXf7V362XKrxppJ5Gf5fHDuzYL1CizheGoj6lEdvVTagLo31JCg7dhaqGrodGVOQfP06OIYCfEiTMCd6JEtFkvgxtwBvZ6Oh9ZNjB4LqZO0CmF9NE8bPsmmOGVVDmNuuy6X0iffnwJvB3NjooyyZUHrDzlN3d+JzSgbmaqM73ZWAfIoMOQHXFGAcEj2smNeQnXEFByLo3z/OFx8J2t61xjpFRL01aBJsjCou+K8FR6CWdcc/hpXRrnpaQCbvYckDUuAFfvZ69lFtwoW/KqRHUwSp6n2rlpjL8m3e2kkFAgQVr9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199021)(4744005)(2906002)(54906003)(478600001)(66899021)(41300700001)(8936002)(8676002)(5660300002)(66476007)(66556008)(66946007)(6916009)(4326008)(316002)(52116002)(38350700002)(2616005)(36756003)(86362001)(186003)(26005)(6506007)(6486002)(6512007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QEarvnAYKfgMYvK68qHw4Koikg7I/kKGcYr1C1iXoVp5KG9wmDWaBK430Qe9?=
 =?us-ascii?Q?J/gBjBMwKKcxSQn9OdZRHNC0EiJUeXmAO0+kb00WtUEkdlr7nh8rCzVr/vWJ?=
 =?us-ascii?Q?oKhyP4AVyIKJgxf5GqisAy9f61nHMsY5wTfR5FLNl/kY6I9nOau4RX7gJVzf?=
 =?us-ascii?Q?0reCzkEnfngyfs7oNdX6+QXimNMQgRqMLhsfAlVnAGUBnQ7Sk6gf5ZyDL7B7?=
 =?us-ascii?Q?FBt6mOXfhzcs7LSZGwWQ+GHkdM+drJJcFmQ5RcD+wJ3LHK3/CqAYzbAnOE6N?=
 =?us-ascii?Q?U8/NiYfwfCtfLRcmhlp5ccSgL3pbx2YGeJQsET+/7/DsRPwgnQMLS2OVBoMQ?=
 =?us-ascii?Q?UW7QC8HxDvB7YXc1CWgC/nMRdojUjMHULxV4T7PeZog/UD81/mPuUOEMUi0a?=
 =?us-ascii?Q?ANxcAwgT/YzlDcPTagLfShzf/hMRdfZ4UTJkJBSL4H9XGm7f1XvLmCiaAjay?=
 =?us-ascii?Q?TI2+YVbAyFt3+y2yhYRuuu+N3m1PlmVLnnCBYwkJ9N++zQbEIWY/mKfa8DkR?=
 =?us-ascii?Q?7SDfKn3dWm518PIww65X59pTRuhBLT4ESFYkcQ1d/2HyHnC+02NnIhANj8/h?=
 =?us-ascii?Q?cTM6poBfWDU5KsWkjKndWDl7DOwHHYr1nAyMSvimuhzgMTc9tK/VlBytNxNU?=
 =?us-ascii?Q?IzOKaSQZg/WZys3CKR+VsmE6fDOV6NqKy39Kk4Xx8IHYl80XIMVPjV4W+2WH?=
 =?us-ascii?Q?3cd2sTqBKsMQVQP//Pz5UD1c5ICVu/cFpq+x2aMVSpqRSoECOOZ1QCMWxjt4?=
 =?us-ascii?Q?xDBZuH/UFz38BLc0O9q2mcjhvF52BDjfdUBEcKPpOMJG2yPusq0gkLY+tCvR?=
 =?us-ascii?Q?luetmC9JSxY/BNk52ALDD+MbmbROXjUyQq3Z1VJE0qt2VxNVTukTFciZGXdM?=
 =?us-ascii?Q?66Pi9mlVjZIWIk2rsobMatggr1Fwtvy7i8vC/fQNjLNTXzNaoXeg9VFxCP7L?=
 =?us-ascii?Q?Q4A131BXu2CwZXBWHZHg4nuhOJLj0suiu5EBCelvZa7jGnKTtGWV/yhlAVQq?=
 =?us-ascii?Q?dfdXGPWPZNoP24cMnNqEZWQEEk58Nto1F/Dy4SjVX0RaFWB8xsvDVtnKMrqv?=
 =?us-ascii?Q?rxRA2CO0SkMpxY12Pkh+TljuTaefYVwOLENJWgcBkKzyqLLHDHkMLPGUIJGn?=
 =?us-ascii?Q?77JttIgbH1+9dmqi+vHy11yFT109iVTXLe0dGf6XmqVBZ9t9GZIrzL3iMuIn?=
 =?us-ascii?Q?rl9QSbit68j/tGPRcBQFT+9sKjNBILSabZOIICupG2wNH3v699PEI2yEgBIw?=
 =?us-ascii?Q?ygVu9iWcpzpHenfHgrnTzV1jx71j71Lf1x3oqIUIeNkL69ckg8aZLEOsrNui?=
 =?us-ascii?Q?962Hu68tLkMAc3EZ/MWmSRTce5plLy/Zklp+tsx1Ay5GvxKBoORu5NzdAZAh?=
 =?us-ascii?Q?YUc84EDJjFzGYcznUgikni4x2k6r7c3bStaYFJJRsShtvxEnxFK2Yy1TmZSX?=
 =?us-ascii?Q?V4CiYHIpYL6mH7SRGHvwiW8t6d6wiJ3l7ma8+pimYBmpn3wYt5Rv6q0U3hht?=
 =?us-ascii?Q?h3ng0uTtpIgSUoBDwx+6QW3kiVkNiVJHwMW1t8Nq5+10OdN8I1vvl9jqDW4d?=
 =?us-ascii?Q?omBq7g2wy59hyrlG8BQaoYBkvA0WKxmhPBoBklbVdd4dPM+9rm4rs0RgV6hG?=
 =?us-ascii?Q?2gB6dygfCKpA3NdmQpv1nmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c256c8c-24f2-4f46-ae0c-08db87ecc44e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 00:11:57.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rcaJSwwPaJ96+dTZOaoIodlA7XBl2WI0DrZVKsaoxxwW83R2JZ0gcVqzIK1vJGwGellfiJVnkC31uU+I0zNm1+5jQeUW0IkDlMp8SBIqc2/Wtemg8cKF9Na9ByNg0f39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6208
Message-ID-Hash: SRA4DJNDOCSWKQUND5GZP76RN7LIAYAQ
X-Message-ID-Hash: SRA4DJNDOCSWKQUND5GZP76RN7LIAYAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRA4DJNDOCSWKQUND5GZP76RN7LIAYAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Rob

> > > $defs
> >=20
> > Hmm... many drivers are using "definitions" ?
>=20
> Patches welcome to change them. I don't think it's many (not counting=20
> types.yaml). Use of "definitions" or "$defs" is an exception.

OK, let's use "$defs" in v3


> > > It would be better if users just always used "ports { port {}; };" ev=
en=20
> > > in the single port case.
> >=20
> > "ports" support is added, we can't modify past.
>=20
> I don't understand. The graph APIs all work the same with or without=20
> 'ports'. Changing the DT shouldn't affect the ABI.

But, the driver didn't have "ports" handling code, "port" only.
>From "DT point of view" changing port -> ports { port {}; }; is no problem,
but "driver code point of view", it is big problem.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
