Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368459403CD
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86EF4E72;
	Tue, 30 Jul 2024 03:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86EF4E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303194;
	bh=G43lyT1uL08M64gfPK82xAyjwtAYxfSBP0QM94qvvYU=;
	h=From:To:Subject:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vgChCxgBR8UQuI697CnUeUGNxEEpFMl8CyeO0pdAyx9ZFh1d+++KdAoABJD6uTfcp
	 cG6WUHr5K0ppJhKW00WtOc54JbsegtwVdglc4glz/CV8NWhmtWhkcIVxJRSPqfRkL0
	 DAGWP+ogsNgiGhzPIzmHD0lk8NFaDq1HGYWlfvUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCE94F805BD; Tue, 30 Jul 2024 03:32:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F12ADF805B1;
	Tue, 30 Jul 2024 03:32:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C8D9F802DB; Tue, 30 Jul 2024 03:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC3FCF800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC3FCF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XV+ADZP9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxigcCWSzV1c/NMZWA3dE+iJ/vxQ7BMUSFsUQC78rZXMYUuqSzENTiumYI/PEAzBxiW8mZvFRCiGE2CMfOoFdgcD9++4C1VboOFT1hVjEHz+yzF6PHkbLuL+wDQkckyb9YiWVm/9+dMflKVYhyBkoHlAIjfej3I7QJGEz8cd/A+1nCWXcaVBF+8KnsCq6wNW1hBc+7leblIh+SMCOdWKOCVIrRfXEUZipSCgPBApvmksPakvMkdJtEo5PF3XFEK1nVM+Njjlc5h87j2g/T0VNZrdd20bLxYUCwi+bBbBr8ka8c9o+pFlA2+fZJq45ic1L0+IEt0mFg0vdlZbSHoWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G43lyT1uL08M64gfPK82xAyjwtAYxfSBP0QM94qvvYU=;
 b=ah2Ye53bSotcSVcnp2D+PefTkbAkvhxDmd65lqKXh7BOMxP2S5DN9lwiGxHeuYvY4ar7CWtkglcFx9oeQi8MKbBLFm38fQjgh1SCfPN6URem/tk2EjHN2oRW4R+bN51I3kDC+t4U4PYXPRdCKZrL3pKvEaUvL5ekn4vHOKJzGRg5FB1eArF/HbFHcF6WDjmF0irriA/4LYvp/ixbl5GZoTQbkZEgRq8CRBL+bD3QqC9QHI2iaHi/9sjCb3XNhrjiMZaUCcY0Lpad95V0D18zpePLHiorgTbxotjGa40P4oWVFZj8dFUd0GGT03YzpzFk0L7d/MOcb7yEZGpuO/dDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G43lyT1uL08M64gfPK82xAyjwtAYxfSBP0QM94qvvYU=;
 b=XV+ADZP9NJZ9Ydots5ketVabvmKGk+lII+9lxBY+NjhZykJ+B72vc/RKISrO7HFw41FixAgl63u1PwXHlNAmEPUEgGY/CcWZANv83264/mdR0g0zjn7N14Zd0wwCgT85jZU0g1N4VlZyTarKMsVq5qB7r4fQBItifroD4zYHLjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7901.jpnprd01.prod.outlook.com
 (2603:1096:400:114::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:32:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:32:32 +0000
Message-ID: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:32:32 +0000
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fdac6a-0ef1-4724-e953-08dcb0377b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k2vh9PcWPW3htd+qWSUZnnZT/xbFADgY+lXJ4FSWbWFEys1vieN1sPJbRCYD?=
 =?us-ascii?Q?wKmza0co0yUtcEgXrNeSGl9/39I/g8nxzB0mzhqQejcIUm20Ut2j8xxa3FmV?=
 =?us-ascii?Q?QS4PCt7xSLI+GY0zY6mNMKSLqiq+hU0W/FGYqxo3bLZkVgqrSVwk5MM4OUve?=
 =?us-ascii?Q?QUuhANsnfNTOzh5EOQ2i+IVOnFbmXEPTupApQVS4xwMFRhxjspoTfcI1AltE?=
 =?us-ascii?Q?KaPSzlfH8ozEqhF4W1/d2DxnLGo/J2WgcNCS4+s6kSWbpo8j0PBZbmPqf6pS?=
 =?us-ascii?Q?+X7Fp+D+AWpHqMIdMbDYD6UG3wrOvwc5pJLaqMyXATsStJDOUqV3qGqH9uoW?=
 =?us-ascii?Q?CdYrwR1rXCV5gnMI4sAGDVWXOPu53RyzRC6EnTY+ihrjU3yf4xyKnuE7iYOI?=
 =?us-ascii?Q?d1m1JPOhbdqNLjs5WYo0D8iNhk6KuxbbupQl5t9s9VZHAEDOKkAXM0Pj9Hny?=
 =?us-ascii?Q?BzdHi2UjJcGM6xLzMShW4cRmPfCvnSzEVvSnZTIM3KQhaII8mhOe7t1g2YXJ?=
 =?us-ascii?Q?85MhEXFUOH7sLX9cUmrslbr104+5D8JeTjuLId1zNn8OgF8l9pyZHbtkOD9R?=
 =?us-ascii?Q?H9g868midMrQ7W77DRyh4EB6VVUEbwBW4uF/KLkzGHnbuoz98iDlzUZsmL/E?=
 =?us-ascii?Q?sVGOQU8Mtj6hfjvzDbGtdRqHPYeLpDe9xcsZdSdC5tKieEoOP1avSdJwpcU9?=
 =?us-ascii?Q?mD8R9utNcK2iTjoFb7Vk0IW4tVj2MmiyQ64Gx0nb9jcLK6wHzIs/3/bzP9X9?=
 =?us-ascii?Q?jwDlifDwnK7KNb8lZpUuP2WYCg5lLgoJOQAl4yJ6wPPKEJ/l/Xs7SchNkuAB?=
 =?us-ascii?Q?mVIGeIu+bpfMho7y/kqava7vNEM9GnwVvgu5nEXDoGR+UQ/kAw6Ivd4oXKRr?=
 =?us-ascii?Q?ZyegpThPYA1GdsJthtzMx5YqoCTFloqmwyV5NXeBIRPkPL1DOB/UGoGNMK2X?=
 =?us-ascii?Q?fdAOZp9N/8WWFazA9OeWrhNYcJxNlZ5J6OCksvCwLN/QRifHJsbXRWJzn2lV?=
 =?us-ascii?Q?i2dUa3p84T9tTan0LqHQUDbeSpRs5joskPJlFaEDrdZYQjK0gx2G1o4xmu7U?=
 =?us-ascii?Q?2BKYg9cl4U1wVpQtwRj2vq5Ri1zYzGJ35u3yQ/eljQ3uPa3FTnNUpi2vgUts?=
 =?us-ascii?Q?KDweTax1hnN6ccoGmyLx9SwT5YmzrNIOI/x9F6UC2Wi0LAfHmeup2cvBTL0H?=
 =?us-ascii?Q?1yvEBjsmaRS+iDY0MXVOYWPqhXLzeoz8fuLsapjL8YVYLIKQYQAZUDix8Ed+?=
 =?us-ascii?Q?6WyII7XMt9+D3Y/VnbD9lwOFbfR+8kcXegHDRAcmBf+a8+A0yPfYDf4bPVCb?=
 =?us-ascii?Q?XIFgxP3wLSHWuJNe5CGV5gPc0iwIlsG7rIf0x+ZhSBaKzaWeU3r+oQZHK4W8?=
 =?us-ascii?Q?SOOfoHkma67a4PRTM9CQ+COZuMVv33n24DIQGkzjL/53gjHEpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sXBIwg4KLhnkiRttNO42kTUfY4IaAxrgW+lGgCRjuZXYnNFzL5h807jftWMv?=
 =?us-ascii?Q?hyTmp2fQKRju9Zbm6ijprdFI5YN9bfuwgIjqJre3MKOzn0GOysyuZOMHadHO?=
 =?us-ascii?Q?z114Q8ysS7TN1qwGXnk0KtyHWzxJ58UqfCACmYy2w1ZWB16g5tJNiKiEG5ha?=
 =?us-ascii?Q?9EGqd7PXBKzNzusnYj6d5lJ3QKkGL8J88DRSxmroOCxNwZlVzzBYOWFM6ivt?=
 =?us-ascii?Q?Is5iJ9J5hNSuuxadP9jSkwNHsBBFcIeWCp78OBe+WMOiHSco2CoCPvkiQPRB?=
 =?us-ascii?Q?QGxbBYZYFYpgBQN8cf6l5nGzER+WJ3723VCGmUuiSDqbOrkYKuoJFKrIQSiW?=
 =?us-ascii?Q?QuDgUJc0kz4x7kqATYfc5rBvr7I+/DUzdjqiSV9EGKF5vng/y5uP+/KerugZ?=
 =?us-ascii?Q?honUUFgo/BOeU9qUdxQh+RZGnDN6LKbztV/gbIjdblMbWw2rF7hUyro+YF6K?=
 =?us-ascii?Q?uaMwQvcljNutC1SMrMF9OOEz3ei4eWMphg++lAGf+9++jSGeerz7h6n7Ic6W?=
 =?us-ascii?Q?xceRdbSZAuVefTWZp3qPJHSAth3VxcdkLo85Tcvqc3NcHozth2BaFb15w5/d?=
 =?us-ascii?Q?HRnE7NCbq8JYTjyNa8hC5nBtLmt+TiQ6O+SLu+FCwQin3JjGjrsLYxYarVPc?=
 =?us-ascii?Q?rYq2Dky52feBx89QIxdt8gp6DGw2otWcD1ASu0mDnFXVn5d0U/F2z1ZphT7m?=
 =?us-ascii?Q?ivT4XrsbIwbPjkyCBaxfBW3hk0uMO+i0Dj/afcoOfaUoabrjwc1ACvsR6FZU?=
 =?us-ascii?Q?grt1eQs044rJUehQLofLc3Pgk4C8pxTl+04UCD+LGpYlPOHNpanfTTjF+HNY?=
 =?us-ascii?Q?xoV1hFL6g0nsU7WhUZ6c0PTK7cPMZYhZFQgrmJkzrTtEFtiTmugwyjbOIT7E?=
 =?us-ascii?Q?aHVaYdyP5q4uvxq9/SVBkMvGTWabxw11vQ2NCiho/q49weRZJ19TKSS+k9LC?=
 =?us-ascii?Q?ZhyPTk7SKENvsg3Re6BJw+5vV36mwKdnnq4aOdpR5b0lbczfIMGqED/L0REO?=
 =?us-ascii?Q?2ytOBJLslNRgUlUf66HXQtT/53tv+JJTyU5W9x0yuo8hGnU/mgnHwUBmJLk3?=
 =?us-ascii?Q?B7pyCeq+Yc2zJpK6gmlbeQRv6vPRA2FNKtHfJNoQUhx4bfFJLjjqOtGfoGUE?=
 =?us-ascii?Q?cGAcOLj3SuvJh7+CXyakXw5nOzCR26xdjBrxLZ87L+CSoprHas1o9wfJ+KSh?=
 =?us-ascii?Q?yXIL9r8DwpzxgpiacA2N3B4/Wvhqv07lPQM6BdvVfJJRunM8rIQyK5Dmie5G?=
 =?us-ascii?Q?BWdCflnTvJ7VxFN7fKj+Bb8YvD9Ik+sRFkxI3lbRXr6R6NLSp572ecMNMrGd?=
 =?us-ascii?Q?RhihlTsQXYofbiIdXt6K8oquL+O28VdBxFIUz28X8MWs7kkhlFyYeUiAfaz4?=
 =?us-ascii?Q?fGZfTqMJzHHAa7py+bipKwCpNQ25pGecl+o+cZLytDHimXxKwE0taDAAnUoE?=
 =?us-ascii?Q?T07dKqlnOtoitUy6d4z143mHjJ+b2PtPXgMt9Y758xiBQrMcIXHUlZfvF0Vf?=
 =?us-ascii?Q?GSTt97+fAR4l86QMmafPR7ACERkVe7+O5M2k9GZro0cqLaYEKtlomcdeHZgJ?=
 =?us-ascii?Q?oDH9EODTtnbGLgMAbt+XrKFVX1oPK7Sj6JqD4GNldjP3xV8RQTP+h8FWLcRy?=
 =?us-ascii?Q?VGXPcSWKkJuFBN3q3SJSJoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8fdac6a-0ef1-4724-e953-08dcb0377b8d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:32:32.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p9hG364ZQ+HK61uXjU6eu5MW9RfH2nWTIgfOUZqgXQp+cL1+JDtg63i2PJYRw5OKZMfj4WjxuhVfTD8zTVWKSuUWbdMTbN+NR67rs0a2WQynfAKlO2O6+8KbHdu3DNRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7901
Message-ID-Hash: E5SPKC36BUSRFDHDCQ2PVS66AZIYMOPV
X-Message-ID-Hash: E5SPKC36BUSRFDHDCQ2PVS66AZIYMOPV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5SPKC36BUSRFDHDCQ2PVS66AZIYMOPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. This patch-set makes it static function.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
