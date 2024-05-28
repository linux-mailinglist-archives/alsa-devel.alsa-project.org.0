Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44B8D13A9
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:07:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C64A857;
	Tue, 28 May 2024 07:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C64A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872856;
	bh=WYetgctdWBF+MonuetBJ98RHX2voXcw8m6pYRS/135o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tdFXeZPqO8SE4Ue6gkWhX1HLlVojkuXir0sDD73aNX4IvezVwOK7Uhv2JLfzx4Eks
	 I+z/SuMgKfmndbXuuCn8fsGZ8AzOSGCUktn2jTDir71DNwMqNib6NA10x3ZJ3SrDen
	 tLEhqFTxsxiPcCMkDpFszVRy051V8SstY7dAnTYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F11F8069F; Tue, 28 May 2024 07:05:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C54F80699;
	Tue, 28 May 2024 07:05:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E7EEF8063D; Tue, 28 May 2024 07:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79F1EF8060F
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F1EF8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oBrH9uBH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arDD9NFXGvZSO+1zHK4QsaA19gdgIrBR6hxR2gPsrMbCrJa9IGdiorIIGBWkiamdDEtSVDBB8KILyDC2y8Gz1kRFCuc+yrnFDpAOZfr29JQqq0xDXM2fJkbTPw4wx+RlH/DEeyryfaDij59UHswQATNA+PJ5l9sMjigwTA+IrLKig7qi6029KScXyyJY0Jk8hEp1zZ9XLmwmUejhBgMKx6XiKHR6SGKXWDGRjua2PL2savoN40X7r+4H1r1Mz3W5jEa8taiK36uDKzIsahhGHcvppXOg+JOu35nCbOdEOvC0x+J+FVJbPGetNxBv8bvXiENxwOLlpK8LgSVzmeUJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VMDQ5xlUDr8K/0ewxS9dq7J5ZcjZwEjCViONSdXYOE=;
 b=Ge2eXFaiO3ZayQwjEvAvMpTRv/HwkHWTaiYs8fkcpusap7i+/+j+Egl95Y1zwg9ifE2w/dQDoEQy7x7aVNrkc0TLmJ+4C9XKDiJgx68CWCvx9bEZ6pUBTIseGtxzBMBEcRxnzQ3L0+0dm02U/TQ5J/1Ltx+wAMSRZeMVgzjn17hWSzhHdwggIWMgzu1FJ04IaP3rbxh63dWhhxkNOhx07h8dMem0bx1k4iiUoGAcY7+fMtPqJuea8fj9AerkVMdcNyJxgejyRyuKsZyGEIOsGIapyc9NU0JYt5/jvW0hugWXT7Q0DUMB5zDL4dWd0K2y6nrseD9NGZHH7rzE/JA+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VMDQ5xlUDr8K/0ewxS9dq7J5ZcjZwEjCViONSdXYOE=;
 b=oBrH9uBHc8EWvJc0eKvlXj9Ove+qVJsWvce0cxZNtiN8KGkUc4FFEfm738C0P+cDqifiAFIz6RbyDcZYu5ocbftFPpIkzkttWGPS+kb5FHfArBzuRWOGlEKbvIySuuN369pPaFJ3ExRGcRaap3AQimjPFQqKmxOryjf1ynAm8rA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:36 +0000
Message-ID: <8734q2h6fz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: audio-graph-card: add ep_to_port() /
 port_to_ports()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:36 +0000
X-ClientProxiedBy: TYAPR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dcd7fb-1fd1-447f-5aa6-08dc7ed3cf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?exY9sVU/3sxKZm3seHQL62P5XMwYcNr/2ecPC+/9CSNHGsWmrFpXNWWFsSO2?=
 =?us-ascii?Q?O4IRPtlcNekl1yzZqfFfY3FDsSTul7tt+0+Y1tQzrYVIGIi7deyZwo8Iwm1V?=
 =?us-ascii?Q?EH2EMuiumN3QkpKkrfsFl7M5euowpjOUtFMLGJbPLuXbRmmzhs/o16tgcSQx?=
 =?us-ascii?Q?bMGqhMhxjC2AZn9odL/SfxKXS3TL7ITBs/tjyP+n9VQp+vV3daSDJYeDdAIC?=
 =?us-ascii?Q?tJeyVE/CGgFmcbH0mUN/wuloqw/120vvhvAzWqX11E/wXsczHfpe9KL9zsLX?=
 =?us-ascii?Q?V3XtD/zLN4TO19xzvekDrWSYPNLGxQK4RMV4CEkBeOQEs6fIEAV5SReftUzA?=
 =?us-ascii?Q?1psOjLU0/aArDZIS2Dqe3j0+p3HlHuGZRgqN1yi4mdJKHxOTvo39SfH3Ot93?=
 =?us-ascii?Q?XReiBqvsVueErK/IiaLZlhQGjAe+4qJmQh/MbsClH8X9ntk9MqNV0PMxeU1K?=
 =?us-ascii?Q?k3T7ZS5qirX+HBRwPmiTKbOaFMmGzIcqAOBqD7K5oK1L/oSwKxPkTTfirL3s?=
 =?us-ascii?Q?F25BAmqk93yXnGPyBTV3n5GG4lwTgkTK75QhKpnlq/EBBBuez52oF2rcyXMr?=
 =?us-ascii?Q?T99fLyWnelRs1rU+5LNS4qZLH+pNbNMKgwT+V5MYK/hmeG+bUlDdT4g924iX?=
 =?us-ascii?Q?L48gbbFTPzprnwGh4JogUzWQHwCf0OzkwUsePINFjBDg/xoS7nU0532gogAT?=
 =?us-ascii?Q?9fkI29Jfvchg7jIwNHDddtOGyJ8cJGsPsiDEDqzRjTch1idRCCTDtu9Zzp46?=
 =?us-ascii?Q?X5G1uFwLY5vDnDUPuHdInZ+3svBUEkspNv7l7qw47Add/oHo1k2B2QP1WTdr?=
 =?us-ascii?Q?LVnvq5tEDvRtJlwt/LlIgwsnm+wkwcnV8stezFZv4/USiA2gdPC2rh3Nbtlp?=
 =?us-ascii?Q?JpU4DNymxxkLdy9LRk4KozM5hWX6MhjaLSxI6qgZu9SBcxk47tJf0bujxy4G?=
 =?us-ascii?Q?Ra9noZpqQeE8f+1PxePht6mFUn6IytiqQxtWy4mLCn7+P2PCX/55e0DcCKwg?=
 =?us-ascii?Q?RHhUHiWq7AUZywFj380uIGL5w4v3IAkI1222sFNwpoTeMuBv4po3QLdKTk1X?=
 =?us-ascii?Q?P/ggR37KXdx39TekAfYprpcHWidH8cjC5FvWJ1jjkwW+rmn+XBGLnN1kMmMt?=
 =?us-ascii?Q?3ZrObRcSszqDNUGrGr9fpGrXnrT69hmEgAAZYPn1+/AusqLB8F6Lc1XSFao2?=
 =?us-ascii?Q?rjchzC8AcgvdZerA4/0RkSiPjlwYGRbmwmkUtcm9V2Q3CLkt4k850E3LhLJQ?=
 =?us-ascii?Q?lGAzCop91suWfrid8RFaFNYJlzS7fNSNr59NW8Sj1sQf4fjkQMpiLC/J2ePd?=
 =?us-ascii?Q?HxrCPhWfhivaE+Uqb4f+3K5p6YRE+qrE6zF7jPWBJKScgQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LVqgmwzd9B5F72MRrsUZwUJHtZ01fg0Volrkk7VkhBlsOk1ZzdUMZEWdXmuW?=
 =?us-ascii?Q?xCct3DefkWH3hXEUO6Q6jOt/81FA8uyO309hhBu4YXX1wJXShfq7WEWqeNG8?=
 =?us-ascii?Q?hUi1rOgGHEp6zvqmiAfLpi3b3fykIf5OCAZsCeIyEZojTrn7qgoyu7gBwNIv?=
 =?us-ascii?Q?hNcA5KPxJS8SaS6pL2fZQLq7Gmbuv+/kn4Jy1XDOcUpEWfgDPko/DX7J8gYa?=
 =?us-ascii?Q?iC9oFgUQIzwShffzbN/vNPyDvKnP/v4cIHbRjMrfd+SQbuAv5rxAi+sHH0BZ?=
 =?us-ascii?Q?PKYtMiVbz4VGxQMQl1FbQt74VFPLdVMLkXY0akJ5F7+T8XR22Pd68rvKttmx?=
 =?us-ascii?Q?nWSd0lB/taG7yIV5F/+GeVMr7ei6klnrzmdrxPZVLtFB2sm4RufGRmdFH0b/?=
 =?us-ascii?Q?pmX/hsruhpeDTfAuW0t6G7baUBfJUhK7WLlTH5o+9/6wMxzlgZ+snKKsP7kx?=
 =?us-ascii?Q?CzBkRABMxHTq5X8lYZL8zsRZcqeAbCnoGfz6S610/2944BV0Kvk0MBo11mA8?=
 =?us-ascii?Q?S52/D0X6u97328reX8xwI6EbD6OKfIE8qXWy7njyoy/8wQJMjaCODJZDDW3I?=
 =?us-ascii?Q?jx3TkkSiKg4yX3AZ4a/Fc4E4cduK+tldG4416YnRdYgcHkTnjmHbJbepNqqu?=
 =?us-ascii?Q?xcT5hs8ZLZbK/vb0Pq/8SAUzfvjhw+9k6hzRoqWSbqE7hHaPqqI9jyHh8K+3?=
 =?us-ascii?Q?67QsCdFFqEZhU7cqcJOy0QcF0Sx9wPIDYe5v7cogt1lXN7KnX4tE18qYJ9b3?=
 =?us-ascii?Q?x9nDOIONOGYa7O3OQivRhEIwjBfwrC8ABQvrkS6mvtcBJ35TiagLZ6tiB6w7?=
 =?us-ascii?Q?LIV+qOQRatuljOtorWQfbc1I0plcfdEKKA1rLKm8ULAXRgupZ8zWfPHu0g6G?=
 =?us-ascii?Q?4jZGma41+4X6ZBClFqK+k4HUlwPCI7oJlFP/rceemclEflS8VWAHqEeov2oW?=
 =?us-ascii?Q?jTM9XN8eVv0xe5/z8ZXrNF4D9zSyBiA20PSgeSMylaEKvOQFM0/lCcxkaI88?=
 =?us-ascii?Q?BIaDBsSHACW0597HzM/1VOHsFYcOP0oJzYXIgmrocyU4Xb6c6tLERwtWnFY6?=
 =?us-ascii?Q?5WXgRKk5FCGLQVg9dqMBXW6Vyba8OZ8G543uIUGwJvhV7/g+4XogZMwIdojw?=
 =?us-ascii?Q?NQuYkwaQKjo8Fxg8posV+uaeMoohaU/4qzNfdt2p4yxJWe2gTkpLiz4fknUZ?=
 =?us-ascii?Q?EVGvbNUDg743JPoozIw2/MM9zAZau40wL3zWp3sXLUoKHcxIZEnoxYrolx9m?=
 =?us-ascii?Q?FNp90Ifr1XfyWsW7H7fVLnR/Ze/7cv+oLjKgRETCtWKVKKY/gK7SaJ0+Uui3?=
 =?us-ascii?Q?aWJYOlItIM4HjcISVGKRVPyV1vxon2puGG5IE7v5GeOrr70632cCM9DWP2fb?=
 =?us-ascii?Q?HMxCi6TQC3qIXdqRvAXjPJ5Qq1UfD5aUkeKgyTdgAq3jcGh2jAgvKdCTYbec?=
 =?us-ascii?Q?3gkxCxSL/zHHiwRyR8BDWEPchZP+2fAlt/U7JixeOO/0H1Jhnav1eYD/Os9X?=
 =?us-ascii?Q?Tup1/kNXxLma6/PrVc2Yo/u8fMmgU+1+Myj9PK/O0wYszYUSQDLuLLmWFqiQ?=
 =?us-ascii?Q?n6yhma7/K82xTXK49H6vcRek3q84SAOk6/hQUgt26FuMo8gtVcdiXmaZJw5P?=
 =?us-ascii?Q?E5dQ0/ml4XrQuv2+6jSRGbo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42dcd7fb-1fd1-447f-5aa6-08dc7ed3cf6f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:36.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pa74cp8LBCQ92RS7ju0m6ZWUfCfI6SvwQudO/uz5oT3VmReYPXEiEDi4unDweCIqMVWh1tamQe4lezGnLUcIn7QQnOtearfFf6W2WBqspBlu6R6XLVHnT0XhX69tIIXJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: FZKGZEBS4KUN25ANVF3ERSPIYMEWOD6M
X-Message-ID-Hash: FZKGZEBS4KUN25ANVF3ERSPIYMEWOD6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZKGZEBS4KUN25ANVF3ERSPIYMEWOD6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card is using of_get_parent() to get "port" from
"ep", or get "ports" from "port". But it is difficlut to understand,
and "ports" might not exist.
This patch adds ep_to_port() to get "port" from "ep", and port_to_ports()
to get "ports" from "port". "ports" will be NULL if not exist.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd6..552b94908cf7c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -19,6 +19,18 @@
 
 #define DPCM_SELECTABLE 1
 
+#define ep_to_port(ep)	of_get_parent(ep)
+static struct device_node *port_to_ports(struct device_node *port)
+{
+	struct device_node *ports = of_get_parent(port);
+
+	if (!of_node_name_eq(ports, "ports")) {
+		of_node_put(ports);
+		return NULL;
+	}
+	return ports;
+}
+
 static int graph_outdrv_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol,
 			      int event)
@@ -68,8 +80,8 @@ static void graph_parse_convert(struct device *dev,
 				struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
-	struct device_node *port = of_get_parent(ep);
-	struct device_node *ports = of_get_parent(port);
+	struct device_node *port = ep_to_port(ep);
+	struct device_node *ports = port_to_ports(port);
 	struct device_node *node = of_graph_get_port_parent(ep);
 
 	simple_util_parse_convert(top,   NULL,   adata);
@@ -87,8 +99,8 @@ static void graph_parse_mclk_fs(struct device_node *top,
 				struct device_node *ep,
 				struct simple_dai_props *props)
 {
-	struct device_node *port	= of_get_parent(ep);
-	struct device_node *ports	= of_get_parent(port);
+	struct device_node *port	= ep_to_port(ep);
+	struct device_node *ports	= port_to_ports(port);
 
 	of_property_read_u32(top,	"mclk-fs", &props->mclk_fs);
 	if (of_node_name_eq(ports, "ports"))
@@ -231,8 +243,8 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 			 "be.%pOFP.%s", codecs->of_node, codecs->dai_name);
 
 		/* check "prefix" from top node */
-		port = of_get_parent(ep);
-		ports = of_get_parent(port);
+		port  = ep_to_port(ep);
+		ports = port_to_ports(port);
 		snd_soc_of_parse_node_prefix(top, cconf, codecs->of_node,
 					      "prefix");
 		if (of_node_name_eq(ports, "ports"))
@@ -350,7 +362,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-			codec_port = of_get_parent(codec_ep);
+			codec_port = ep_to_port(codec_ep);
 
 			/* get convert-xxx property */
 			memset(&adata, 0, sizeof(adata));
-- 
2.43.0

