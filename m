Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57B83FB69
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 01:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4680F91;
	Mon, 29 Jan 2024 01:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4680F91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706489768;
	bh=+1l+NQrPhoy6N0GQOXrzb6DuHsMWeTvod/7F91rB2Fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Snf1aBMLSfnnkJT9Ur3mD8MZMvg1vLvPa4sZE8FJWES2Qo7bCGfg1zKokdlc9kdFv
	 H7KbdXDBJsmXbrY/SP86lrqNBguewFcez8QyVFn0cjc19AmWdVMEIVQ6wZBUhc31+o
	 g3y24G0oLJJdz6jSdb468GH2mCSJtyH35ZPj2RmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B9B2F805EA; Mon, 29 Jan 2024 01:55:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6211F805EC;
	Mon, 29 Jan 2024 01:55:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0881F805F4; Mon, 29 Jan 2024 01:55:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFB64F805EA
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 01:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB64F805EA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HGjJLnxG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjCptBsOMipXeEQODGhbjl72Mq7gHBVPgMXQCxLplArrLNuWMOZcOFCNMXqc5tPItdZRvhq78oPcb69m/BYYL/gZLeRSfP5W40h3iJbGYIVK5GbkGh9lONZN2vxI/SF6r3hVJyYOEp+WTHLpHzNYo+i9uV3iz4uD1+mczW6NvMDZZtXn9Zvhp1gdJljmD+Z2RlPXVfarm+Y+uHuIN6g9areEDsh7HTbI9UlGH4DWl92azYct7OBFvrYRnB59IPNQjg8k+yHu6U5OxnDW6D5L9mUymCkuD6JyJBOGuWx5/3BfQmNVvdq+YOpA2W2S2y8MphX2MU7usUXpnH6PLo7gIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53LgFL/tgEMW5iVClRMNKc/fATDPCwYVOacfnZCL7e4=;
 b=CkJu+LpDx0uTHIVSdCm0cjKQxlS+fAufpu2fl8ribzcnLBXg0IJFxzxG77ExIbkGZqPKBt18bLB6GNbXYeGUJ9x9cg39Qk2kbd5qKS0EqWNPdXljua3sCxKIuKvCoeln2Aa8R1vZRuUSuuxGdJjD3J1cT6m/iGIeeDkoPkWZefJLFbO3R+yG8WBlO6PA7/fH1HiK+FQKKBGDNMWoTJYljBZe8rSdOXnx502KHpOUGNVNTpgguc1x71V3UYIQfllp/uW2miTSDatryI59VZc19+XcrepN2iWhhvMoRijjd+x7Y8vm/qDPzNM82X4rB82jNtIW24TbkLVJESSYdoj/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53LgFL/tgEMW5iVClRMNKc/fATDPCwYVOacfnZCL7e4=;
 b=HGjJLnxGqABlsvQ0/wYSEkVr5qX+tMMni2gr4zTLLfVpFEZhbjQ0Q4JdH5z6lRJVEP1MNPE4sUa+XCMJFn6Sa3JbpRANoaZFCItljYt8xcWd+QV+tYO6WfpcYuOMBKqp9pHHT5qFjm+2YY3gV+FUcZynLDQ8ePPmE9XyVZQULBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:54:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:54:59 +0000
Message-ID: <87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/13] of: property: add of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jan 2024 00:54:59 +0000
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: d2462796-9874-4e9b-a8e3-08dc2064eb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ET4Fe56R4WpB3j55apOMp2zcpaUyZKou2otdPfIpadTY5+Jy/kNcWhavxVfTc+HQcmskCg1jbnlkPrreQ5o6FgoqXrv2YYc5OJDYMlllLrr4q9m3ye3lTtZx06VlJVQJNaUfa7SSXEW6yiQQzfho44ZiMBJmWOdj7jb2DPEh3WRgfeegiSmPa4xVsuJbLEyY0PiGrAHXF0wguWxJNVO/JEAMnUWgQOyZt4eInoQ390MN2Lt3QyDauUeyqUw1QvBZuVsb30WcICQXJXcsEsJ21IGNkqbEnnMFe/lCHpRtH/EYT5Hl85MKGxU6YooulLLRcEwssPPws1PM5HINQqEm5oohJI/oiBx9xyfbDibfNHPIQR/OMVPeQ4L4nlXNkHKJTTrmrXXugtLTG/p6lirTPgZWyXx1Yo60WaJtFOshb3T1KpAm91r1W4/8a3+LvRCTovsZ8GL3QGXiQx5e1ObA0SuDS0mZN5JOtWuAMWElq3lHXwYzBoRfMOHsNh9h1LVGTzPC7qJ8SSTWp2J7b9Nc6c8COUFEfjVohMy7sqyTMU2B3S0MjJ3KMRJrIH4kLgcdw0W2b3+DZcemTeubxopUshxbC7XRCx9A75rMAAw7GnM4U23SKLDeZSNC3QMn9bV1MowAiObYkXLanpXh8Q+D0tkmYkK1mD60utZcNngwbE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k0zrijg3C8GA1OUrNQlE6EuPKCK8jL2QTQB2Prcm0UwEb2+JHSynD466HVkA?=
 =?us-ascii?Q?ifn7rZjgewOW2ld7ZGxC8u/2K6GX+abs5qP16vJN1BbsbK7Ctp9eWUBgl9DE?=
 =?us-ascii?Q?ChWJIUTZgUFrE2hXqsJl9Pd70/uKmq5L5G3LdJczW8QU2uyDo/HN7DU/mcV8?=
 =?us-ascii?Q?xcUk+3lkZ1r5V4BCK7GQyW0NXzMc7DqiLPweI6QSEJrvrlNM0gmoweiPrnPF?=
 =?us-ascii?Q?90lye3Mh5NFoBJk5UpugOqNZ8ZTUTabz1DdPuHuvnexBTk4/8dzaYcyqADPY?=
 =?us-ascii?Q?MRM5erGVLx+20251Hc55YLUGX3jE9lr8ZREg2bdc31/a1fwQOptxqLWJtDET?=
 =?us-ascii?Q?CVJ5EvnbaI2dJ3+sf8qeDCn4xO5o3WZlQLeQbbi71E9rNl8GzVELAWgcbmb+?=
 =?us-ascii?Q?5nWcLT+n2GmWdkaNl+FmelSnCl5Ftr3/wDMu5n+5N0xPjIu8jjRqzGnIacNl?=
 =?us-ascii?Q?Z5m1lTbwrKsSxhagpRilL8JKBEUgpKk95owAXB4UzT1EjEFAX5QQWVjeLpLt?=
 =?us-ascii?Q?g6o5zap40iqHaVoRHMBmRD9qlJjogUCjDH0M6AMeO04pib8bPCCAv9tDjnLS?=
 =?us-ascii?Q?CIk8eIrp6VG6pVx7rtDdP83ozIrYSHOLU0hAitrhicYcSl15HaR2lJW/a9Ma?=
 =?us-ascii?Q?0hYQtJ6n6JVMYZPy5iuh6rrMNxq4whGeSxQj9WFDzvp5VtR6gvYuvhuc6Qf2?=
 =?us-ascii?Q?stfulHi/IXZDQV7syqBXOO6LIbM8UKeyniTqhST9tOMjSspqbyojvpjN6ecN?=
 =?us-ascii?Q?R28koUcFAli2pNrFnU1465BsPXcPbFvkeQUGTQj2b7SCDejai5E5F2sEZNB3?=
 =?us-ascii?Q?XsoXWQP4IoWJhI44cvjdabFKV1IFca9wEww6ya2ZQQZvNQwpAFBE2wqf9Lni?=
 =?us-ascii?Q?AVo86uQmZGzE4Vp4vn2Mp6Flum6Qq6dp53iMDqGBsMzsDY7E26JlyrrLIwl3?=
 =?us-ascii?Q?X+bgVS5nkhcvHM0OQFezuwVWs2M872ER/wuBtgWZPzBKqtMpzoVpKshDBpRZ?=
 =?us-ascii?Q?38nE07n/85G7okXuzBLY6W4yCPoj+FDymCUTrdHaZ4gZMwAB9cp/09lssxMB?=
 =?us-ascii?Q?qRSbAvVxR+dCJ+ydOA4AIXAozxLruihEq+WTq6bZ2BySg52bOT9FPl6pEu/3?=
 =?us-ascii?Q?N662WrmoobZYAxlJdx1ErOQeBoOhkt3hiJbhMPNqnbBWTlr2fYDgwcZofi/X?=
 =?us-ascii?Q?DshJu04kus0FChWiHJqdqGs3TkB1trx/3ITxRJRwJaCZmlGnFoHSS92rFKYE?=
 =?us-ascii?Q?jX9faK+PFi5ve/m9pVetxB4By1smBS+g0hRJWBx6YeWNKTjl+ohxacf/YIQY?=
 =?us-ascii?Q?kof6ppkeJUD/uEX+o59D09s+13GlQvfjesR+z01THko7wHIobZ9UsZL2wFw7?=
 =?us-ascii?Q?gqaJAWBktxtwN49puthXmkz8UJsWT6QIJ8XeyjkBtfK/dD9SG7kL3uzwDcyY?=
 =?us-ascii?Q?gJkVIC/p4URtMl5j9FuLZ4M8uC4iXXmgrn+rwXxV3OPRL3GR2RWvS9hoNPky?=
 =?us-ascii?Q?gWChAiaeBUPYw6E9xsC3MVYcvGS30ZZLoEkiRgJDV25XgCFMd9TCGEPh+EXQ?=
 =?us-ascii?Q?7zbz1uNA/36GDwF7UTgwRSWCXjBqbD6X3u+oLTgnOqpyP4nmDD7/7w6bgJ6j?=
 =?us-ascii?Q?sqdGynaLbB5qMcKKJRHX9Kc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2462796-9874-4e9b-a8e3-08dc2064eb43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:54:59.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aKzr4mCHETD2SwEsu1d2aEmm/BzaizXtPSq2h3+y6AAB/cqrtVa5qjl5FJ3PnrOU84LUz22GZ7M4XOuTem4cwoJc5hiHkYr7Hq8Zwq6KovEMtR+RdlIAZ8ngjVkfDZr3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996
Message-ID-Hash: JRRRZJBMGUH63PR5B6EMQPUNRWJMALB3
X-Message-ID-Hash: JRRRZJBMGUH63PR5B6EMQPUNRWJMALB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRRRZJBMGUH63PR5B6EMQPUNRWJMALB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have of_graph_get_next_endpoint(), but it is not intuitive
to use.

(X)	node {
(Y)		ports {
			port@0 { endpoint { remote-endpoint = ...; };};
(A1)			port@1 { endpoint { remote-endpoint = ...; };
(A2)				 endpoint { remote-endpoint = ...; };};
(B)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= A1, A2),
I want to use like below

	A1 = of_graph_get_next_endpoint(port1, NULL);
	A2 = of_graph_get_next_endpoint(port1, A1);

But 1st one will be error, because of_graph_get_next_endpoint() requested
"parent" means "node" (X) or "ports" (Y), not "port".
Below are OK

	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint

In other words, we can't handle A1/A2 directly via
of_graph_get_next_endpoint() so far.

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get A1 pointer for some way, and if I want to
handle port@1 things, I would like use it like below

	/*
	 * "endpoint" is now A1, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
	 *
	 * Because "endpoint" is non NULL, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))

But it also not worked as I expected.
I expect it will be A1 -> A2 -> NULL,
but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
will fetch endpoint beyond the port.

It is not useful on generic driver like Generic Sound Card.
It uses of_get_next_child() instead for now, but it is not intuitive,
and not check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()

	of_graph_get_next_endpoint_raw(port1, NULL); // A1
	of_graph_get_next_endpoint_raw(port1, A1);   // A2
	of_graph_get_next_endpoint_raw(port1, A2);   // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 26 +++++++++++++++++++++++++-
 include/linux/of_graph.h |  2 ++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 14ffd199c9b1..37dbb1b0e742 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_endpoint_raw() - get next endpoint node
+ * @port: pointer to the target port node
+ * @endpoint: current endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
+						   struct device_node *endpoint)
+{
+	if (!port)
+		return NULL;
+
+	do {
+		endpoint = of_get_next_child(port, endpoint);
+		if (!endpoint)
+			break;
+	} while (!of_node_name_eq(endpoint, "endpoint"));
+
+	return endpoint;
+}
+EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
@@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		 * getting the next child. If the previous endpoint is NULL this
 		 * will return the first child.
 		 */
-		endpoint = of_get_next_child(port, prev);
+		endpoint = of_graph_get_next_endpoint_raw(port, prev);
 		if (endpoint) {
 			of_node_put(port);
 			return endpoint;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index fff598640e93..427905a6e8c3 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
+						   struct device_node *prev);
 struct device_node *of_graph_get_next_port(const struct device_node *parent,
 					   struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
-- 
2.25.1

