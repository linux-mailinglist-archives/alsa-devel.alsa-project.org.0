Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9D83FB70
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 01:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAD3210;
	Mon, 29 Jan 2024 01:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAD3210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706489803;
	bh=ffS14aV1Ln+TfLGSo/g586z4rf34Vf14zbKTRPb7wEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M5GFnpsK4mGbl7DieOedt1/vmIj9Ff1WhPGmLxlVX0MXe9RNo8MpG2b6Ii7b1Cg8W
	 hT9qk4CR2MzCF2C1k2UYkQ8ceYT3Yj+TGW523t4bIIj6FE3xAsOAYRjGm8bHzrPR3r
	 G0Z/Sbx5UjC/gwIQ4MXN2kz2LAwLWfvSKbFlwnTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E23F80638; Mon, 29 Jan 2024 01:55:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F76F80633;
	Mon, 29 Jan 2024 01:55:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3AC7F8062E; Mon, 29 Jan 2024 01:55:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91E33F805FF
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 01:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E33F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QyBJAkdE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7Oyn4gWZK+eIhpByhHaIu8U6e2FWj1me7N/G1n0aIcE7cUEn9GMlY1+Io50kYBRiVYbMn1TT1NwMWfq2b66NRGJ7UPRBCeRnYx1KXgDJA4hG2vRuwTleOtxASC7VlzHoy4bKwtlgoYV6tBjG3AyXZGpcPFqTlCtAsZGdswpRHHS1gRIMzlAGeMcRouErPe29Fo78MLmM1yAEkEYTLSjkO0JtLmbzY6ikbn1Sl/o2HN3bUkfhvSeHbaz1wMZkmy0MpNCcYXXZ2itPUFg6y2h39BZoL/1PH5HJz/xf+gIpkTay6h7MCGk5Ng6/BGTUieB7jbFgHTy7MQnLPmaxEOsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doHBcvAYo0yrIjFUYG+DMNg2fMRtjrbfAePeAn8BweE=;
 b=Zt1RzM/155xC2ZWkq7NTvKQKLy+GmmhHRpRkZp1mm8aFnRyktCqKk2HLOJQ7EL5B8h1qvuKNMemkzFkJwgk4QdcVRi2DXKYJYMzF34uO/rmlOC8kEY+K6Ifhcw3PbkmOifQJq0I6sLpbIxcEzpNEcRBpZ6eQlCtsU4z0R79ouKjJ9E5rpx//PkDAyhHkfaekYwjQwbKGrUEBbsHOI14AO+adNo3DOnSASWVopz7DkrVI22Ulrc33YMH6xIuFEuUybPlqMzDSOKhOxHymFRy3S5SfpHSfXuoh3qlHTePWpb7EH1daAdC2dy9HJO9eIdVLnDk4D3dM3qVIut8XBNJQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doHBcvAYo0yrIjFUYG+DMNg2fMRtjrbfAePeAn8BweE=;
 b=QyBJAkdE2c/wp7iHgpfdwRll/MajIFGmXwrwJnSVHbOIWBLwfgrXmGnwhJzreK6B4YPrMPSPoR3RysCHTQ14ruVW69QzZjrfxMeV1P3Eds7rqnxMLwPQ6W2FK9M3gEa7o4jDzP2w9Cmg40Znaz2ySpYHpN8g3pZumRvDSNrdOnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:11 +0000
Message-ID: <878r49klg1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/13] media: xilinx-tpg: use
 of_graph_get_next_endpoint_raw()
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
Date: Mon, 29 Jan 2024 00:55:11 +0000
X-ClientProxiedBy: TYCP301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: e4120e63-ad3a-4ccd-6b09-08dc2064f242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6a7qpKU+JzITN/5CfOCoBeF7UO89LyOf98BRvsEbuxHSIVJ/02lyBi5lwADl/YoAkAcb7pvZK+3zo7jqcAH09w/w7BASaqxqqJog5mOUzO4ax2b/bAKgomvwUaKW0lzK7uNOtbdFIc6wScuo3pT31cNjJ7+eQfOB+qbaaFZU4CtnLsiPezdgArTZRPI85EzcdVLfWZ2uPKM6wrf+3jj4a8DN3UJnb9D37m1UnhIXc3tXPkfukr0+oacYb9fy5iK9lZwouHjDcCj66LBQRwex40s5EC25Vj5koUXOuFxjGzzhl6FeFUR24kDNLvL7qLPnvzCQUYb/a1ouVRDPHZaUqXECoSdS+lnEsEDmKVfxMfAkDjU3A8DjG2HDSirLsCBSpJSeTynB1/7gwFyqYHfLfwy0gT3D1z6UwDz8yHAfE9ZoYcl4ILXA3KYprHeS0GCWsCRpWa/RFFc7z0C3gp4XAU+YAlSiT5JwzQUgFDHRKhoczoalAp1NWfv1BCcNFtDu85s220+CtvU67oGNPk7YV3HsFQC/IuTP6QhffscF0ok0STvklob2ERudD1rMntS57Ewrv4C4MkKjTnXAnZn+OAOdGfddpkkAMp7ImEHNhTH2tb8YHorFyc6qkvAmhIsr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(4744005)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KggLLHbv1+OsUqtflHxvz1vvDryAGWkeaH2hWXrOoZ0wZYcvc3zXasaBZZvO?=
 =?us-ascii?Q?CCo96IlyUw6vgPjElSpeczdbeS1LtVwSFDU0+3UiRW2iTaRUEVvhkmr7dMkD?=
 =?us-ascii?Q?zka1V2hvX1grJlezEpqT8UuK2GHUuuG9KugvdeOvTpFIz7ymCSTDbtHC3iMy?=
 =?us-ascii?Q?E9GnMPyGLDLw9hf1QLd9v9H6JTYGPvJPd/V2ik9E5zqtQRR0gKr/U8J9lBG/?=
 =?us-ascii?Q?QwbME2sXGbbw9GEz4UFJuO+RDiHCB0TcjJgQ0sKvafniSwpDAMOXwwdW3WCX?=
 =?us-ascii?Q?q5cZenDJebsCY0YYe0fA7oE2hwNLhUdXLVCuHgPQLja4py4ZJQ0IGkCjVX3n?=
 =?us-ascii?Q?zv7ncTtsdIhBuiVuocSHkuWRvHD14oKc5t/TmuB4cPgq7gHc6uMJOhR/uX9x?=
 =?us-ascii?Q?J4LO+RPwjByA1gxQjz0nSkG7UjeJL2qz1NvmRzUpVSxSGanIf0xZXl8OnG7B?=
 =?us-ascii?Q?AZrSxLaYg+qD/HV8dYylGrY1EiJweZomQfYDNsFcjGgQf1K/Q3esKZ4ibdye?=
 =?us-ascii?Q?uf8FLFS04fxEOpHPFLddIJgPbNBOflDcd6FnVIvztLAX+wz1ZwqyMRGIVYr8?=
 =?us-ascii?Q?TdNF4z74ptmvsZ0dem0s8X56swJnMQej93gk/hYvk+gJmhBpc1vr+YQA3nPl?=
 =?us-ascii?Q?5ErCVfSeFQDuRUDSJqKucUc38xaJUKZj4/QPc/lNltaWahcsfsZKu8QDQ5vy?=
 =?us-ascii?Q?JMoTEkTpXm8e+jZTDjamRnntcGlHznfQ1Na0jDe19C/8RH7dfdDJATXvz2qZ?=
 =?us-ascii?Q?2lcyHxBIH/WuwK0GnYhsvnulM7lo0MoCiBc9Q5JDsUTR8vywri1GN5ZfjB2P?=
 =?us-ascii?Q?bhgxiBz56YPvpsqEdCUPMBUHJVSLX6eSbGjIjKjGJY+pDMICZF2HnECSthBU?=
 =?us-ascii?Q?q2wRUxtBa1Fw8SNwFBs6zynrFrVYNV5G5ktDOVVq8yYJ//Qcm4wytgOj5isu?=
 =?us-ascii?Q?in4wgNh7JloOiqSyvEFENvzERJ2kyH5nBT27LJt3RnxbDibx1KeYupvty/Yf?=
 =?us-ascii?Q?DGmUes+Zr/OeFdeUCinTWhpkM2TH1LrFFVPTAla/3ym5r2UNDo8pDlZdptrD?=
 =?us-ascii?Q?UCu0gVfn8Ojon6mp4oNGUwFJ4p4GgKjmkqaltR3HGr76lwBXmxdRcWe+wqg8?=
 =?us-ascii?Q?DIpiBWFLWjJzWzu1SVPdjkvptO7uVIu8HBdh43txtofsH9JfGiKnPqtEWMq8?=
 =?us-ascii?Q?9g53e8E8B6PmdAUUnJlvSgLmE9faB2UMRN03NR/O6kewex1f7vs2fKtl5Hst?=
 =?us-ascii?Q?aKYgHDD2t9ChWprzdyQAnJy1299uiDdQJ7wEGuPB+YLmBGifqRtjcZfbLlaI?=
 =?us-ascii?Q?QGtTW909WoOwNB2/Tw2zkoAPnq0CosPcedbHf1clN3r+i6UzF/cvd+Nweyka?=
 =?us-ascii?Q?QkwgkoAHdgqxiBNmVlES374jcJQFo6WItSvwd5/cSPUVOa+TLJPyCmJ8HlBK?=
 =?us-ascii?Q?8xlfAiFmi5uBnVeRNH2S014t4JkCrInRZPbPS7b2MbItZvAOGcO3h+gRhG5H?=
 =?us-ascii?Q?uZVUjfmB/sg7KnuJGr7fxEtKxXG6VGgEPXeDAvN3664YoIglkPCk0z1mz19C?=
 =?us-ascii?Q?2mkoRaHZmSCh+BHVYVYGwIDYdKPlgNMAI8jtyio3MnUsEMTJEj6/Ak/mG5sX?=
 =?us-ascii?Q?TmRDYdh68gObosAU3scN4gU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4120e63-ad3a-4ccd-6b09-08dc2064f242
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:11.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M8ahWDWQbJ/iPu8ANJOnt4oQEvCUEF7qTj6HnMrD3GTxttKwCvpL9UcztXiMXr6s3LsPFFwrxk9WaTiRwi4pkRI1H4p1K6mnBYWBtKoH4+OKqYk9qdAPjzRQmujYJemf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996
Message-ID-Hash: E33IVFFEMLJYXPLLDIKYIQ25RZRIWKNF
X-Message-ID-Hash: E33IVFFEMLJYXPLLDIKYIQ25RZRIWKNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E33IVFFEMLJYXPLLDIKYIQ25RZRIWKNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 80353ca44402..97908533466c 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -745,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_endpoint_raw(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.25.1

