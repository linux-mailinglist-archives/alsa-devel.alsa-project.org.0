Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FC96B07F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 07:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDE8A4B;
	Wed,  4 Sep 2024 07:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDE8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725427701;
	bh=X1iV7oGlPPxfednRCuP32Md10tlXQNiepyf9eZQGP7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mZq1N+vbWGJqfE+bPVq5oSY0iokQ5MyRoD6ySHfIYgFkJJgFsk4/hBRVy9fz17zWx
	 m6YqWqs6fBpWopmt2Nz0EO6sxMPdnksZuovUYpkkqvobinaI7pYT9/VvJtPUhLKMAm
	 b1k4hy17GG63834cgxlHKxulgkLgeUadTJN5ZIwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 873C9F805B1; Wed,  4 Sep 2024 07:27:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C99DBF805AC;
	Wed,  4 Sep 2024 07:27:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5194CF80199; Wed,  4 Sep 2024 07:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EEB4F80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 07:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EEB4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YqVn1UGG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0OYhWc9wWJKEbG6VAKNIO0HbI0t+Iyr/8aEYKI4I44jKZ5JiUFz16P6hECe/4lvwuvKsYX+MKm8CXGRDQ5NjS6i68APYw+lHAKw1vjwlmBJKGoTJVc3kM62DHzkNcyHUv7VvkV0E/VIXgfbxCD3s/3aoAjXNu9yzqeufWHoXP+8JX1ai3SttSADeCdSONeir5Thf4kjS4oWLjErBizQEWOJxwOevmLQrOcxwgtYgtTlWa1NZVda55CSr5ZZVdN+lBiAucp7deX00Y+dP+O5lcLDbJ3HXdYQtJtIyUfw4cMo1anV9VbOznL8SFmt1eKsDPE7Bk9/ipH3GnbY6MMgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHvCpdVsGn6I08eFRBLfDDLe/DQBCSIkYF46gTg6JX0=;
 b=v0e7Xq2Yt+2Ymfrv+9EILlhVUmSUE11YwC9p4WhusqEc5FF/QZTd+q8u+vlXpdnCJu0EB72pl6JuyTwXkFKGVmqh0YkxS/QvQEQXvB6x6ILiv8+q0YkjHLqQIJFMkJtHFU+2NbSQPxyz31zIO4AKtoV8BCvKn5tzFjMszhcpZrJqY9saI7/xRHvE1qS5wQ3wor5gucB3BWeEvgWzpL3NYtbLYeSsRepAvFqXfnRWC7s2SfG0dxJ3rbPcqmYDaHNGs1J4H8oSzqUGcs7FzJ5yEjzhtlsm/ooW94kKtDoU0nTDeqbwhuq0RBE9j4R7jwEwGNma8vtlBNc9lCY15ZqFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHvCpdVsGn6I08eFRBLfDDLe/DQBCSIkYF46gTg6JX0=;
 b=YqVn1UGG9Eku2aT67Nda/Y4NLuquYQmzbIhx3QCKGkhUcKVx/30QcTWXp+f6C6764scgQsbshjs76ebcAgkHRZqdOU+BNf7hWOxS+eVbz3w0VdEITs9WJGSVbXpKIZZi1V19eYyrAVzTrClTHR7LTdypKcXdPfy4Ce2DmaNmX7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8588.jpnprd01.prod.outlook.com
 (2603:1096:604:19b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 05:27:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 05:27:34 +0000
Message-ID: <87ttew6la2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Saravana Kannan" <saravanak@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linux-DT <devicetree@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Laurent <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Qestion: of property has dead-lock to call .probe()
In-Reply-To: 
 <CAGETcx8nhCQRJdP3s+ZLuBFoneb4kA4yf93_JB8mNrfc9KE+iA@mail.gmail.com>
References: 
 <CAGETcx8nhCQRJdP3s+ZLuBFoneb4kA4yf93_JB8mNrfc9KE+iA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 05:27:33 +0000
X-ClientProxiedBy: TYAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:404:14::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9531d4-7747-4564-8d6e-08dccca247ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HlXm5tlPWbfVuaBiPRn6qwz7851Wm8X0UY1f5SXiG5iWmR7GugFXJTFM5RvV?=
 =?us-ascii?Q?gWP6ULZKdf4SqdUHdYWt5vfI5QyOvg/dz2raVj3nJ+AgGG7gy2qqC71NOvpZ?=
 =?us-ascii?Q?nB47QyOTjfHU/mIbS/rkAOFZsB3id+CT057DR+v2MjNr6O3HKiHe/Rjo/M6K?=
 =?us-ascii?Q?y7KHx5lFFDlByJIRMg+848CsABbCsHVJgvtCpeZrSgMdarp+W45BmeymhlUu?=
 =?us-ascii?Q?8btMS/PiO+NyWZdWGn4iFBJhqVIMevP/vfqrfm8fEWnLfTzl/f0vz8R7cRYQ?=
 =?us-ascii?Q?42E1BCyii5g1vhJzn9u9RyxkIigNGQ9NDiBr7tNUPEBg1bcuhUF+9VQJ4GHr?=
 =?us-ascii?Q?rUZQWvwUHsnWjfT34eMCuhHf/sc6e1nCP0/F7j+r9sf5NbGdIsccaFQZdxS4?=
 =?us-ascii?Q?q5cjoyeRPx0VAuuG0uFXWAVVdmfZXIcEKHkD9/N0VCDLlzCfORkbJ0LATD5m?=
 =?us-ascii?Q?pL88iRRDnpTJ6EzFYWln2nBC/Lpj3+vxWlyNfpRJQFvhwVYBO1v2UP05YyPK?=
 =?us-ascii?Q?bYbYSNUvXVt5jmO/JcUJqZPs+MpCRzoEShTyX7QehzbwspsrRRyVbr9K4QDP?=
 =?us-ascii?Q?rq1FSGRG8xExSpqA/zWiXbY76Rbya/btrPJkBuUTT2lMH6N0+49tOIzGuVoU?=
 =?us-ascii?Q?fsf2dw2LooVaJ6Djb/pPz5s+7BU7QgGKGUHTo5N7m2xlCqDd0oIuE+110Dv3?=
 =?us-ascii?Q?fYnDV0qZSE455faD0kHFUhKUrgUr6GvfiT7yjBg0lFYsbeE8W02r/MayliRT?=
 =?us-ascii?Q?Nit8QsQ/ftSg3P/TgOMfxaz9P+WvKHI1YtHZfnap0jd2QtYRUgmwZN38StiF?=
 =?us-ascii?Q?sSkc9ercHsDVWbw0FPtksCNYxF1tsG1baANMp7OD/haS15dbQiylE308cix1?=
 =?us-ascii?Q?lnmFp+cie2WbcFNRqBVtARwNEKoUnyV3FT4uPlFsE1HkebVfNCroNVeC44u2?=
 =?us-ascii?Q?wwX0byb1G/asJ1oaRtE9oNJSaJG+fWb0I1cvEnEGOlQlRpLTBvfEnEndHhlI?=
 =?us-ascii?Q?+vYWEQCPjOs7RHysvmIbS+cf5+4KcqGB3Sy/mb2PaSZiEaDp3sB7aaFFA/lG?=
 =?us-ascii?Q?kS1wTWxhIzYAOMcH3NZnbivSMJhMfuRC8aq8JDorFiKe48NCA1EdgPVVNfFS?=
 =?us-ascii?Q?UH9Hgk62jNnj0VfPh1PWIbtjlfM2UVYrifVNGn4BQdxOknCpbGPL9AFpBr5p?=
 =?us-ascii?Q?tBPLntKDTCeAL7wzEKpzO7W20sD2At7qLhAJg12OSz+pHXDRhOp9vfOKZcGL?=
 =?us-ascii?Q?uvJ5I8JrRQ4RkKwmfh5OOPA2jdFK1ki6UFFwq75dhF54Rq0gXFGR9DemW7E4?=
 =?us-ascii?Q?OpW+pWdJ5L20AP5XSPqGXEqVuGc+FZ3D1utr/rnhkKmcPOuC3hj0ENKDhmSC?=
 =?us-ascii?Q?UroFkcqUZ3TMvkBbigS4OrBulmmzldT36igzE5KYV9CwX62odA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gLXWE8iVgWGVttN5CEYZS/86+sq+hPrq0OoBY1gYAqe4o7wFXZIiehScxNv7?=
 =?us-ascii?Q?2DhwGXN7xAGJ63rWehJAMtPTkfpcGez3pVyIMBAy4FCNrqovCbTi1B4ObIAS?=
 =?us-ascii?Q?5KiCaGq7WvhrDtaoK+kI3PzQVGpGfd/mtusFXREyXYF0YwE5EiMroLq0Kvq+?=
 =?us-ascii?Q?mCFhDTa3BzkLqGIt2Jhf0f2WZMEAEIqTUJY8PJYzTleO/aS2s69vgLZZVff5?=
 =?us-ascii?Q?HTW7EQgGotw+wP8fnpZatT9lS/B/QufjFpRq/5r7s+/atgGw6gxg3Cg3KK7H?=
 =?us-ascii?Q?ePVEtZkcOO4glbkQQeKZUlfRdPXE4QXOVYZQYFH2KoWw7uJyBpCM2N6F5qKL?=
 =?us-ascii?Q?X85jDuRSG1YJnZbzI7rTWVvU+12WikC5Pc6rkTqAMEVaZifCcO52LGfkOYDM?=
 =?us-ascii?Q?NWxajTfOU8JwrROTCE7rMSxwpIb27v+D4RoXaU3NDMoa4os9zK8xiw+3qRPJ?=
 =?us-ascii?Q?5e6ecpNJCvz8u/B4SS9ZBKh+KdnsQdTeKdYUogZDNRaTVZ3GIb6ERR/Bd0V8?=
 =?us-ascii?Q?WRyz72zzqYP+Yxb+BRH2DVWJX0GjTLbU9JbCqoY8L7XZ9SO5RnHYbE0lCKqb?=
 =?us-ascii?Q?NCMUB1+NK5yD80xtUBc4thWHFfRbsJDmO0kI7iwu4PQLtievS+IWoeGg7HDy?=
 =?us-ascii?Q?NkrW3kmRJsOpUKobIprdKWIe8wmy1nwItgBO6DYDUQ4Loz+Jc5fgNhKoChhB?=
 =?us-ascii?Q?CsgIu90MUIHya07I71hNvZM4AeAmKYcqq3jblwtz033NcBaBjZFExVGXm6+U?=
 =?us-ascii?Q?wvbtiTd7x8B6a9n+/Nzfk45oIzp0ci96UWMTN7f56jzFBlXRGV9zKesM+rXZ?=
 =?us-ascii?Q?gWucvVR0OBcVJ8ZfnjKFVLtK6bnCXvG1Gp2GeGey6oJTOumR2UHdFcIYxY/k?=
 =?us-ascii?Q?uo4UJmIEMsfrQ1KnRVF60Qo5Y9Ee0smGXC5An/nLA29u2oFFfCYrEOga0jxw?=
 =?us-ascii?Q?cdm+I4XFXbr0xskd99WsM8/ie8x7ZpDhObF9qqHuTEu9PT+4EuOT1hqk9Hou?=
 =?us-ascii?Q?tOIie7Kpv1XPmUO/kthm4exW1vnzdZQHI4epDn/ohI6tefNH4fuIumn9pPCt?=
 =?us-ascii?Q?UFNV7ktKa6rhfw3mkJjD9gSsEbBkp9sWYvPxcBYZE00It/rUiW9sYUng/dsX?=
 =?us-ascii?Q?QdFVyzH4tkHmeeDrHGckjeWmo1ko23ernuMLwMtS/yDXe3u/KyWuUOrvTJSA?=
 =?us-ascii?Q?mX70v41AU0wK4noQJpBcuUftuelZNuKxmIq7lZsaziUGzNdgG3DTiIjuw+BW?=
 =?us-ascii?Q?yvQluENfdsCjWNqQEdrWfKJ6871a0+C5E/A8TzAsaUpecI+7NwmdLv6XMtJx?=
 =?us-ascii?Q?tNpYVWxk9wMwKstZ3FtDOHv+vjpl2HrPaESQaqKud5jlBN7EMqYKL20ZnChE?=
 =?us-ascii?Q?x94mIBh+jtFi/0bmE3ncKf17B8VnVqdKOwITGrp2MlrkLKSYU7HjFsrdA92/?=
 =?us-ascii?Q?92CUPprkOx1akL/cORuJwMAPHtpPHN98irnQL7Y5XEacHvnqFk68C1Lm7bJM?=
 =?us-ascii?Q?CROpwdZa5gp28zGf1pp44Qi84BoPkAdEmqHL7i6xdgC24xLWXxnod9QG1vMJ?=
 =?us-ascii?Q?+3S0G/bmTc39srC6I7D+/GnJk0swHnjEOGI9BOID12i56ceO4hJD7UXDdRk+?=
 =?us-ascii?Q?ftzkbuoG/bWpCGpBKvXRlMg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc9531d4-7747-4564-8d6e-08dccca247ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 05:27:33.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c7eIBqrqTMEkRne52aPxCJU7JTrDK9A+WxhD7hZYd1sCPqfPC9OgCTbA9qSv4h/mO7WhLigIZom8cAxrn0RIuIbX3blqDdycbr1b1P7OlHBYZRiGPv5T7zHu2lKWD90m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8588
Message-ID-Hash: CRHYOFZJ3F35JXHH5MVNRFJWUOZHQRTJ
X-Message-ID-Hash: CRHYOFZJ3F35JXHH5MVNRFJWUOZHQRTJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRHYOFZJ3F35JXHH5MVNRFJWUOZHQRTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Saravana

> > [Style-A]
> >         +---+  +---+
> >         |(A)+--+   |
> >         +-+-+  |   |
> >           |    |(B)|
> >         +-+-+  |   |
> >         |(C)+--+   |
> >         +---+  +---+
(snip)
> > [Style-B]
> >         +---+  +---+
> >         |(A)+--+   |
> >         +---+  |   |
> >                |(B)|
> >         +---+  |   |
> >         |(C)+--+   |
> >         +---+  +---+
(snip)
> > In my debug, it seems...
> >         - (B) is handled as supplier for (A).
> >         - (B) probe() is called, but it needs (A) info which is not yet
> >           probed. So it returns -EPROBE_DEFER.
> >         - Because (B) is not probed, (A) probe() never called
(snip)
> Anyway, I solved this recently in a general way. Use
> "post-init-providers" property in the node of "A" and point it to "B".
> This tells fw_devlink that B is not needed for A to probe.

Thank you for your help !!
"post-init-providers" property helped my issue.

Best regards
---
Kuninori Morimoto
