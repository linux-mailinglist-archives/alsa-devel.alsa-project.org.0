Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 640776C7370
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 23:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E831EEC8;
	Thu, 23 Mar 2023 23:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E831EEC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679612231;
	bh=UxEWaFGnIrzbQRb/RYhaV/TjC81CmSuT4gxBBOHeBGo=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZPUzT/M30susmtbgJxXHTjLm7FUBgmvgSocUbViw5YmMNJMv25xkb9wR+vv6hGdj3
	 XyL+JIJyMCDZJ6u4Mqajk1ImhTWJG0Pu6cqbodiVh3EP2+JI3Q7mBtiUhbF/ciwsvp
	 PPghGgZs7LNIAdlMTAE+gu+GTQCcJ8KwNPfsp/E8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E28F8027B;
	Thu, 23 Mar 2023 23:56:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80588F802E8; Thu, 23 Mar 2023 23:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3469AF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 23:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3469AF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d0HlMOHL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1iDmMBmhj8EY/hzieNa0Q0IHfVeEh7ERgdNPE+sVqvr1VLKMSiRA6feRoY2nCjBdo7JkNvw4yW975F34AiM6/tMA4Mz/PjykI+M/kvbMr3w0QQYAoTBnEHS4VWrt65n51SArEMxfMvWg+g/SXHundtcgO4D+UxLqrty7McoT484PV0plRrDH+DNdB5YpIT5QcAvVow0l37EffqdzhiJ8UwAXBDZm70CzPT2tmrNROrxn8T12STWa5GUajsd7VUC87unPkAJz/BpW2NXzOTa75MEbQPuPnxvkzcuhVsLR80tZcaoqPVDTqNXH9YoFPXT4OrKm7k6TIL7vns6FFZghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1u/NKjbAUQDVFKHYZFItTGAw5Mpvf/eqM2t+xeHdZs=;
 b=ENjQ8aV+a/58Npu+9GNZzEIYhzZdCkoSp/MsCVnN0JtyJYtilDxqHk3G9LSFWHeJzbbojd8AdWfKY/kGsoOqu6MYnRAJUILY5LvN1gC7e4MzYoykaCTvUYIbdMa7RzfGyp33NeaMRYNqRfBTwkW386uOUpMijj3DBUeFbwDvY1D/GH1RiBMChIUVnhi1FnmJ6uUYQcu+Py67WZ+Bi1rat4qq0sIK1xK9LmrAirevqm6nFTsYlSm8Ncw3CUWmDebDLpIZQGitO1NlLATf0XPwG59Ug+jn+DXc/ZKr6NLsCFmJj+m2mKvf8yKjfp0ID4Mu00gdaD+kvkj+Iyd22luzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1u/NKjbAUQDVFKHYZFItTGAw5Mpvf/eqM2t+xeHdZs=;
 b=d0HlMOHLNTbfLbmoigMo3QbeuTEImYlOVfTpznBqpnLwEIwcc1DCzgubUaAeiHhkFyaZsWrBETYE/GFgx90USTaypF8w2UuMSf4A/GWap3SNjadQemqGBTRGefC3TxHHaxhXEaaLqrrNod1EPSD/KUizlfaEI+q4fxPlQ3781MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12022.jpnprd01.prod.outlook.com (2603:1096:400:37b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:56:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 22:56:09 +0000
Message-ID: <87ilerjcvr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: simple-card.c: add missing of_node_put()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Mar 2023 22:56:08 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12022:EE_
X-MS-Office365-Filtering-Correlation-Id: 497e76d5-1573-4a78-0966-08db2bf1cab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YqzY/rrrtIswqzaVDmJk4/9EkYN98h+Bq1bEd1sCQH48n0fLnvv72npRu4oDQHFsqEX9Zm4Yo/D1++Ak9CuS102KbdSl5RwNgWYXBGVCjPSyEn+76nTxch9e6PtpcYInDa++5nnr46EL70GQg2mT/VVqZP2MOSueWrgiiUpoCOXUdtNKqsXHe8vJCrYpoMg9AqaRPUx8rPhwEtDgCK0QFoZp5EU+NE3ubbS4ZfLavwmVeti9U0c4ZUBL9gutKnIYw6RCbzfXuqN+zPVrdUXWKt0qC2bWu3cBkW/KZ2311Iri1XW5Vxhgp2qK2U9AfQD2Ngo1a1V7wfZPdUFEbB7N/Am0wbdbqW5K2DWVqdhx3G6jon9TOP2Lb586+1QbH21fgeI0Q+gaYz6x5jRVG+t9iDpJnQL+MNwxGGk19d+riYmphWJ09g/uAh9GNTA6FU2Hlr+uuXvscODh7OFmd8Xd2oBpckB3tz2OoSh1HPTk+2Sjyruutc7IvQ9Dpm6RH3NzKq7eh9y7ZDK4Hjzj3n/bnbMhNqicgK0Xk7GWA+vuW6ktvuybL6PYq0jPhI+XwOe3tbCi+3/zYGFH+KT1UejY3EiVJ3bIPZmSRoIy3VefTHnameN3COs1GtB2tlf1zbUBZjDnjGPTcF7PuD+wXGExae1KVLbF5PxLavyt0zMfVFi0qndAZc7FsPQdHRrIPLGzNozbeWQr8u4KLHJU3WYicA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(478600001)(41300700001)(2906002)(8936002)(5660300002)(36756003)(4744005)(38350700002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(6512007)(6506007)(26005)(86362001)(2616005)(6486002)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2PE52UppMXTAM/mZ0RrxAN2lHlczcGhR7PWFfI+fDF1GJ132kan3phhTPhdf?=
 =?us-ascii?Q?wkC7hp0pcg9CuwdcNi/idDrpTYgs3vLK9R+pEPnhymT1gLlUDdo3PuafnpIm?=
 =?us-ascii?Q?rJRRVlU55u2i9N/+NGaz7fm94RGM9GQdzAGB2p3mcjwRe7grEkqnphl8Xw/R?=
 =?us-ascii?Q?Mmj1rWTQ6uGZ/g7Ob+t/LXQv0vJe+1TiduvSQxZKNq6DBUGWuz37jaSVI6Vo?=
 =?us-ascii?Q?mN59W+OAglcfOYtRmchY2ZBzy7DXGkGADbljRtEXO5zao8EUnvwWE89ipud3?=
 =?us-ascii?Q?hfwmmfYgTQkytBN8tXoxGGWxf9CfSmaoNx/3o+zmvVZ/ggwAae58nDvBV3hg?=
 =?us-ascii?Q?LyCfVErwlw5CA0LvpkMhMC1wMFxwjTKf0KvKQrDGb4450NvocMr8yyjabWu4?=
 =?us-ascii?Q?ACiVlkWpzKqjfyWzsHLcf6hyZvvtD4RfjcoFbsQymjt19x4a052NfjesOyYg?=
 =?us-ascii?Q?Evt630BZ2owpY7CtvCUsXoCv5bq4nhBTaJR9oGWtgzsl1brMe3dfUmq+9hc1?=
 =?us-ascii?Q?IzO9avVXMB+H5tr2LqkGu3qwa58YSpsHSvNemI9K2padaVbGQw4WRdmYUq6s?=
 =?us-ascii?Q?0eGw5XBXn9vbiMXEWucuR/PgNjsk8sLFTgOIyTXdDPHSmiTqXv52yO+3XJoM?=
 =?us-ascii?Q?W/ArI0l/FvNfIpU7EwG+S6SnXCrrNQ3AmvNZMyC/iZ80eLv4YJkFGRI2efmo?=
 =?us-ascii?Q?ic7lYEn7fiXVdidT3eONrHtL2xaKh1u+eqyN8QCmWpI7G9Qk4rVXTnSFaPxs?=
 =?us-ascii?Q?LjUcsID3PYX5j1fvkLg2Ic5xcX2foDe1zLcMU7Zh6n7KfNmBj8mqi+IioZg4?=
 =?us-ascii?Q?FPUBO0fhmYexXaIqnoK0CHFhX9WW9xE0sKVupvkThPyO16pEhVQ6ICniNINA?=
 =?us-ascii?Q?VnuP0nTztA/ZT+L5jTr/0fQxt3cWiYzBAyjJXGRBsYcCx4XB3oJtWYeabZCr?=
 =?us-ascii?Q?uBrXzAHQVDPNaFur1wjtGwa+F8D9bsk0b4/wONGzB3qgF08Ho2/NMqyvq193?=
 =?us-ascii?Q?oAdyQaFghI7U2P2t5Y83x8qrtqPtUQHfqqjNFq5xLfoJFbXU/2c7eLfpPPRE?=
 =?us-ascii?Q?TXwOl0MqxikIq+TbjbXfLtEo5/d9i3g2moT/MtK2jbxLX/7g0aNtIxZU9DeV?=
 =?us-ascii?Q?oql27616UPIIIAoArlwV2RoUciPaN5gFW6L2CszhbwOt7tfBR28QKHyGo45W?=
 =?us-ascii?Q?U2lxhK30dh7MZihVLuZxR9YGVWFs6FaL4MDURwsh9kwg2Py5CpAmFSO+17K+?=
 =?us-ascii?Q?rFlrJTLH1EPRhzS03KO8cGJYxbyQxEPiX8ofJmyC9RZjQ+eXf4/QDtQa/Tbv?=
 =?us-ascii?Q?184F8eNVEhYHhzbvh9SH88XIQBRrd/xdtlA4QF8oMkFPGjbxyBnr707nZvbf?=
 =?us-ascii?Q?B3epqjro7juY2KssIfvl8QwEAqsCaIT6QRGvNKAFyUFk6g14+z4OrseiIJjo?=
 =?us-ascii?Q?208faHhxGzsGqjppNNfYClLNBltHmHT52yiYbeAOd26UUhz/GIDgTxDrI7aO?=
 =?us-ascii?Q?eo/4XGMzqDgh9p5tCUWU/eti3HADqBaz2vb5wudGcyKycral4gZ9b5JZ17I3?=
 =?us-ascii?Q?4mxp80IAi1OHNiwfmSJtAdJeLDnDxWxfWRHWsGrY5z0eiuy58w1GyfL3yrvG?=
 =?us-ascii?Q?e4Dyabla0X4Wueqltq+9XDg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 497e76d5-1573-4a78-0966-08db2bf1cab0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:56:09.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +wLteFl1QrjBdLM6WqOJ9LPUPpisExukSz5Oc3jJZc/ao/1D0pnKzHV77faP9lXn5wfiSBvsSzrXS3VHPTPud/cQ2kIxYCDWZiFuUWkCnIQQfG3kUcberCoTZtW2RGye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12022
Message-ID-Hash: OQOIGIZUFUCEWSWX6SE74UMSXJSVC2UF
X-Message-ID-Hash: OQOIGIZUFUCEWSWX6SE74UMSXJSVC2UF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQOIGIZUFUCEWSWX6SE74UMSXJSVC2UF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is missing of_node_put() for platform.
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index fcd6c44f89f6..6f044cc8357e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -422,6 +422,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 		}
 
 		of_node_put(codec);
+		of_node_put(plat);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
-- 
2.25.1

