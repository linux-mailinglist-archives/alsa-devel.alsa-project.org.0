Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B76E55BF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D52DADFA;
	Tue, 18 Apr 2023 02:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D52DADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777447;
	bh=u4qP/QJgLKg814UKnZPJr8h+xvPNXxFTWcpBaxdhvKk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ms086qPv22ereN7ipTAE/pfLwGOAE04hmhOPyc5UNkfFp4RfSyAn8qFUIGYI1bXbQ
	 MYMojGCwBZR83hkqSBesGtQLh/LUnL+gtWmabIIAkdR02h91LEmlk1ttgCQD8QHpB/
	 j/E5KI9fw/PSqRF6aBdpnAnA2VECpYV0JXGEJ8IA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4583BF80533;
	Tue, 18 Apr 2023 02:23:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F43FF80534; Tue, 18 Apr 2023 02:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66EDCF8052E
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EDCF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e1s4gyf9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euRLmgUfB6iv3wq25qRW7pOFSKS1wkNktCmeAvq43qCrLLk2vebzJ7edxGL1g594IFhVzrBIGBFVEC302UMEuVRKuF475GmW3nHd3yDfY5sflBXArHVXsqCvH5UvZRaYdqVeaEmTtG9C9EBm9L0tSMuw82uEI7xHe0SRSQvaD4VyC4NiZhoI8MZ58GxeevBhygZLfBdAhZDkCt6mUZ2OL7PrXvkPbyzJe5dgKzDNmhMT7dlBK/C0t2Mvvl0pGwiLUYDET+Fe4FsV9VNgb0PUWNmYPB1EbqT5dmPDtjyI1LINTG6Rx4mVYI0HzvALixnKtcTMKER1TRZQhXyt1mlUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=XfDeA33ONpxxnQm5M7JL+CNQLIKBCyi8QS12rs1laBodJIkjqZ+pDC13I7RVZ9+tF1jcZWbAoYkghg4zziBjfcYDLcdWQPFOo9ZiiFriSxQorkwre7LH9BwXPl5gOe/gBPNXrp7LhNMONRW9SUTgimqXcymRB/Eg2U5K+yHov1ZsDoi+UOucE4p7/9Fw+pcLieX1DCglM/g5EkScm/M48sG4L2Hx7xR9tTmW+mZojsmDWfORA7cCyGDuR664DoJ7pbSIEej+uM/bQgVrop7Ko1F3HWVjtQhU9n4zhL8f2pJRLwnDBO9OCuLzbQtYu1/un/v7FFcEQA4eqJSpZHlnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=e1s4gyf9TN6tQGEK7/q3F7jmdad+nchpsOXsLs/rl4AqNaUuc8RZ8yEY30xVf/7hM0ZnmuRQXvZj28XLB2JUZuXC+5Z6YQDOenlDyzzoqFxrq2/laOYW9Ov6PJ6cIT2AM8hUqiZqRPVRWDRg6TORLhNQH3JGSrN5Mm5rSl6v9no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10968.jpnprd01.prod.outlook.com (2603:1096:400:394::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:22:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:22:47 +0000
Message-ID: <87354y3up5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: soc-utils.c: add asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:22:47 +0000
X-ClientProxiedBy: TYAPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10968:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb2ed58-b2f3-49fd-a4cf-08db3fa3098b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O2jJF/W43BjPnceDeSnfsiwlFZwigYUVV9C4OREiJp8299Mp3M6c6z/Nvs6v8o1tJNtrU3cTEtue+9BuiUyghoUk/UDFiEe7awjxPM+UZpkd8FeZh/ALCOUzPNzFSHUKipz05cS+Hun76ddyaqveQVnB8wyOZqk9OokrSHzfRVQMvCf4q+rI6o8cV/G3oucWkWpFBUN9W6TAjf323VhQn/70rgFGNRk2mWDXETFCTnm43XHqOuQoIMD3ORgbUlQ/x9Ure8kveklbF7AP7Dp4Lx+ffeWEVvhi5BCs8TCtE1jsmoLbi6FKQeNswNPeFV5kMNMfnsovAWO1MbXpHaX/ACtw6pBn7QN4Ji6cplVK596Msq1mwizXYl1VkpFCJ7UxMMXpeHQ6gHNPwLC7RzfsXpsh/qVuLfqHcHxYrzFB/qsRVrG6Z6eONKCGLe0J853kuYpZTKWhy6bCwb9o4TjHXTipQjEuI4YqmhgFiywKFb5Jx0o2CYKNlTUwkZnv1t7Ge0SyojVhGNzZy4425R1vRvs+htL5TvXwV0+SWcCLVboDnwHQBNNRwDcv2ODuILjaouV1jzo7OT3kbEEzjZRCiDJFAxq1paWQvZpw3HU6/2K5M6HscJ89BY+OxzJAReVF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(6916009)(4326008)(54906003)(316002)(66946007)(66476007)(66556008)(6486002)(52116002)(478600001)(8676002)(8936002)(41300700001)(5660300002)(2906002)(36756003)(86362001)(38100700002)(38350700002)(2616005)(26005)(186003)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fx/kP9vEVA8NDfAExT0kpSShWLYzMOWR6h7JrQf3drNCktUm+pwCs9C1yIar?=
 =?us-ascii?Q?mDaC28exdc9b0mwiIhW0McQiM3q/WPU8cLQU+lDru7hRHci0wQmY6FoV3eld?=
 =?us-ascii?Q?C04bqF7TY3vl2CyjY3GQYNp/aTChVfs8W3/iXCUuumqsDgLv18tn6N3Jr8ny?=
 =?us-ascii?Q?iRqNfEH+uVfTvKKxUIW/+vYL3wB3mOIR4/DR5EfZrDzO0dvN29W40LaT26qz?=
 =?us-ascii?Q?FRTyl6FRsBxW+TF4MP6EQXW+xsB/RGt1r3bJPHjqtSDn1s1zrsM5XgGRWAat?=
 =?us-ascii?Q?qAhOpbrnb7r6qQwDv0iROGHKsn70PsdEL8VQ7sXjy8+OJ4K17Bm2/JGwwClP?=
 =?us-ascii?Q?Ptpr7zLweVJ1dhjp9pU8A+ZiR0VK2CgY14ocBZUGHNdN8EACMpd5RJI0OzBT?=
 =?us-ascii?Q?yoN2wIzj1/QXWzrzZ2vQQWzAD1LJUEH/1S2FozHt6OsD9W5Lxl3MdjdXkQ7N?=
 =?us-ascii?Q?T4bo6hgUBK5DhKm8Fg+BFtkjPwLBY7E3aKUUknJA1upXx6kkggStAM+HgQh+?=
 =?us-ascii?Q?27fAzPZ6LZLMtiWYhVm+XONYKzMu30a9uZd5Z7raXrhPbjBAoO98m8msdSZG?=
 =?us-ascii?Q?p97kPgZmWQV8tnm0FCZSZSaLEKeczQEKTf1hTaDSILwRMNhAVoUumF2ylE+l?=
 =?us-ascii?Q?kwRtFu3iG0Bw3sSLsA5xPZvA49viVhR3cbdNVK84v5wdBY0N00JgI/6Lodbc?=
 =?us-ascii?Q?eEspQ4cyqnyCNFv0uJK90XsGOug/TMIvqlgIcSgMQ8tQJUWfPiilgqcb6JYi?=
 =?us-ascii?Q?kwPU1EG2hZYXy4GQGg2t3CjLcO7uD5aAWnsHRFqVCM/Q+rbB7EwVDAwF8bEe?=
 =?us-ascii?Q?voEFGOJAU/YlcieCoigLmFb9MELYEVW4wnePnSqyKjjXVcOmMYkwIxIT+Jy2?=
 =?us-ascii?Q?kIaanTC9PonBdn9wMKT96/Yg439GgAg6r3S5Wl/r0kEmrnBOq5Cpl8bL+u5N?=
 =?us-ascii?Q?Hx7/2cTrwvPEhv2N+ve0lO2O43FhKNTKsoBMpCwsYyX7X2uyhUIbAGvq6/Sm?=
 =?us-ascii?Q?3Zr0S1IgLQg96ddrzJlDgmPPsfd1bdWFmjK5TUIYKaZG7mZvo58y/NYQ83TV?=
 =?us-ascii?Q?D3bofrrCMt88J9c/MKwLLdWlFvFgs7jU7/R1akaNWJkq1jBtwb5go5RCEd4e?=
 =?us-ascii?Q?LB6tQNk6y3MsHxgJVA97rJwMQsQNvDhWn626U9Awv8P+pXTcSFbNP7BG5MRM?=
 =?us-ascii?Q?UF2J6JMAHwKlGokrMXUyY28nhLeefZTCX/ZZDi+v6T4k5xqgVsHiGRtrs+pA?=
 =?us-ascii?Q?RU1RvAzRNL2VGUNutolHv5mRfsftTksJxYRVJr20klxpGKBQ+tp7jw32Mjpx?=
 =?us-ascii?Q?YjdGJlspb7jVeg585yliQRVMEMCiU5LPrvazAXyD1XjW+/+zuQ7czlazETcO?=
 =?us-ascii?Q?HfZpY06TeNeCJDyD8444+doqEgNjtFkW90VQldCRDXWecXtdA4PZBhM0qK3Z?=
 =?us-ascii?Q?k+8Ih2cv0tXPJ0HTyhav6KRiclJfLurRtQT/BdAjXh6gn3wnRz8CKA/351gj?=
 =?us-ascii?Q?aR3rVKOyEnkpjHxjtUjLeOk5RkINYC2+ZysQMzIyXJu8ig9C3wxN6BQeUbEn?=
 =?us-ascii?Q?wr7UQguSXyACJdHLak36z+GI+m71jyj5oToRV4tApZZjaVEP15tHk9Dy0AmW?=
 =?us-ascii?Q?LqopsDXNaWEfEjJtOvSKEPM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cb2ed58-b2f3-49fd-a4cf-08db3fa3098b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:22:47.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eLLVle2YXusWk3V4g3Ec8mC5D6XJn4/Zt0HXgovy1uAyls60LOq7tXyXB8fwh+dcF1fsIf4ujuj3wWXTjPVUhGdpkNGxGvI9UdHv/aJ2+FNKilSenGRcFZqVtys0NVnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10968
Message-ID-Hash: F3NWM43KM52JYOW56RMUMSHJIRGTV5YD
X-Message-ID-Hash: F3NWM43KM52JYOW56RMUMSHJIRGTV5YD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3NWM43KM52JYOW56RMUMSHJIRGTV5YD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC uses dummy Component, sharing snd_soc_dai_link_component
for it is better idea. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h   | 1 +
 sound/soc/soc-utils.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 05004c048dd5..533e553a343f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -878,6 +878,7 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
+extern struct snd_soc_dai_link_component asoc_dummy_dlc;
 
 
 struct snd_soc_codec_conf {
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a4dba0b751e7..11607c5f5d5a 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -224,6 +224,13 @@ int snd_soc_component_is_dummy(struct snd_soc_component *component)
 		(component->driver == &dummy_codec));
 }
 
+struct snd_soc_dai_link_component asoc_dummy_dlc = {
+	.of_node	= NULL,
+	.dai_name	= "snd-soc-dummy-dai",
+	.name		= "snd-soc-dummy",
+};
+EXPORT_SYMBOL_GPL(asoc_dummy_dlc);
+
 static int snd_soc_dummy_probe(struct platform_device *pdev)
 {
 	int ret;
-- 
2.25.1

