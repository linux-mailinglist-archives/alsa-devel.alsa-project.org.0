Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DB8D139A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56B0B60;
	Tue, 28 May 2024 07:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56B0B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872752;
	bh=Alv4ClIdquZNIcJLEbiP7WurFhIJqBRhq3KbG4G2+W0=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L7WPytlJZfBCJCcA1gelZ+TPvhdWNk67nBnHInSXPW91md5mmMEacYMl9dJwnU2Aq
	 QfWcLr5OuQNCtiYyScTnaT7bAP5lPLB0boy5OaP4F2pZ3N79cfvyL2K3LthkEpzNy1
	 mtpfkSHlh+/AFJxoulxuNL1+yMy0jOC9ZD5YgXlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68E5F805A8; Tue, 28 May 2024 07:05:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 121E5F80589;
	Tue, 28 May 2024 07:05:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA2EDF80149; Tue, 28 May 2024 07:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68F86F800AC
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F86F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PRoQZvYn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCLzQeBFjaf9mLLEZRdQM8hnAKs/7s8cS6WzoEHqdajP003os9QvDaJCiJjfs/zeCwcfE7dkQW7Md8lWBtJEuQVq1QBmRmy2ebADhDvogrthzRxnD3hD/aEJDVc5wKxkOm8JjGztLdnjgPNR0LIHF6a1x1V59ntDnCwCp540P/LkiBv6Hm6UqRENmwmVOQ988/W+3eQquODvI0JYdlufYZ22/ZdrRFe0WhrQE8dsJnqWkkcvkGlv77shBF9kNSXGsvx0Wnkpp/zqif64Ft35sNRA/Kb45mUgu561vKD046bythtlQYZtt6uQHxOV+9v14P/BjKzTR7X1IUIYmnvz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg710OZ+Z5yVHWgoUv963ldmiaun6NN7q+Wjp8bJ9Do=;
 b=gpzPxFl1Ge73mM2p/AEPAVuy0Y74cecEDC7rUtfQo8T3BEe1I/bgAkuc9cv8M8x/J//WQOaoXHd1kdshXj6VAVaRMffP4ZpnKeonqFxveZ3hxS5SqwruZ3u2Jk/+599JkQg/P/CdHor4JIrqTw+TcSr2i3SZodHFxhE3oyi3aOsLQv8l9JSi5LWK7H89Z7TlYz8bfdnMcEBRzbbcB0oUtid10xMbBX32OWTm10AiRaY/h/nyCrylwUVoxM5K4nxI7+yapnnEQaGaocL5ATP2EzcZ223oFEwnb/n+mydBk9zlsUTdaW6nZxdOzPyAUy2hYwaeLPRomcMsTDUUex02NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg710OZ+Z5yVHWgoUv963ldmiaun6NN7q+Wjp8bJ9Do=;
 b=PRoQZvYn8WMq26TuFxwiCV1OPc1aXMMpKTLiK55g2lbtcrRPLgg4JcZkEtJYnIoNa6eceuGhBitfIs5SxnlmjpY0L4rCc6A08bXEWIkL5rerkxUDA9W76y368W0KG/8YpJp5vVzyMlNjzskTSSH4upSvcHE6PKyWDyMIrsBm5tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8360.jpnprd01.prod.outlook.com
 (2603:1096:400:150::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:04:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:04:58 +0000
Message-ID: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: simple-card: sync support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:04:58 +0000
X-ClientProxiedBy: TYBP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 564787fe-1409-4170-3215-08dc7ed3b8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U3gNwggVwJ9pxdhrCMPQ+gHNmvFzuL6qFSbKcNYKSPCobanp3lGX1gR9rN00?=
 =?us-ascii?Q?8kkRSLK2ooy4K3w/rNuFK6tzrDANQ+ZP1qxEHQY0EKne4+uJa7jL1tLh6HiE?=
 =?us-ascii?Q?uucGNnvIvx9dqrrfXF/WcAw6IVg0Zx2KPPYM0wbd3CoU8tPDvDQq/j8GU0U4?=
 =?us-ascii?Q?T8MFoQbkJhxzDvJox2Nwcb9VSpLxg3k/DMCjf7i43LaCDWv51BZ5cpVyHhDr?=
 =?us-ascii?Q?hSCnILTtuInTCA9hbMgoTqwyxDsvcYOQtf8TIQ8pnQu81eh55iL7lV8pQFi8?=
 =?us-ascii?Q?hH3kYMMXYTeMQNgR1p1M/gxAGVOI81UfI45b2pzOSBI+ChwjRE1aYz5NEq0B?=
 =?us-ascii?Q?ERLBSNOIWom17zQu9CIkoOXfyBwGe2XneWCHm3FCjb6X7lpDalwri/niEdT4?=
 =?us-ascii?Q?Uu6tH03jbVBs6uhxkfsQSH34DFiGKeoIMLz2nGuxxmRhLWd0yYOrIJKWQZHn?=
 =?us-ascii?Q?DluE0lCLlrhfnc3H58KBD2YSjN+kKtCIWuvJyBKAyadI5I0esAeHHNw1ePcx?=
 =?us-ascii?Q?LI0dv0ctG0th3WmmbGK3V93XpYmUl+3HtJztJ/aKTtoMa44GSyJK6rglxclC?=
 =?us-ascii?Q?NGh1W5mJ/FIUrkDZSXmX9K+jqFISsu8uAa2fTNcALvAl1HGkHQk9hKXq5+Ql?=
 =?us-ascii?Q?0Cucdrh+FVlndYaDB3LD+y/rX7FQW0lVwfBTx+EPHTvXZ/GJOOAQT1HbartL?=
 =?us-ascii?Q?YBbMWG2T1egi8rHGU0l3PA/YKrPczvdKi5ue0j2UlarBrFiiMiZP+dz5xQhU?=
 =?us-ascii?Q?jUDxFWE7oQqnQvyCg4rFkrVulsbXd5Y3wVsj7dSK9DkNu+w2EwpVEDdSp1XQ?=
 =?us-ascii?Q?m4vVng5EXk42SRBsj5lSmrrlvDHKQqKigIlmlSkI36s9f7/7eTKAvmi0kj1f?=
 =?us-ascii?Q?2IpKhTUhlGMH1PIk9yW5S2DhHMcggQvDSOJzljRY62Yv6XjFtDzLbeY8Smo/?=
 =?us-ascii?Q?FDUo0BkiZgwp7Ub5HbPc4TxYE7TPS1/Myeojnk2N6PqNphRclEZnsj58kxwO?=
 =?us-ascii?Q?+b3ocotE0FQOWHgjw7jmb4sgx0STKiAfM5qOtvhTi1FextSzW4XOmhNmPGLq?=
 =?us-ascii?Q?N3UwK/NXGUJVpn6m15qyVGJUGBiD+cOFofam2cJ7mSjP9F4lpef7TLrx2Z6V?=
 =?us-ascii?Q?gYosisnZJQ9I3zt2AVgLcL//59Kcq/CY+AUB0nfDIIivwMpizHimCzZilqWO?=
 =?us-ascii?Q?CSkZhhH9sE1X1e/PYYcWJXk8dRHgCxZdbZdkGLx8lZL4Nc332hNlXpXB92OL?=
 =?us-ascii?Q?4r4Abw/3eVEu6t07ySNTj79zOWuwCb2UlUhPPshg00+zQEfK24ts2OW6VOW0?=
 =?us-ascii?Q?DBKrhsyZPLxNu4ecQrt9z78NpwBJawIIJSlz2fgNrksXEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nGmbr+45kASd9HesTkJufdFY3le1g4EWv7BibOBeT2jyADAY3pHvyziH7KEE?=
 =?us-ascii?Q?hNB5TtsSW2y9cAiyq03vOJ5ENlDrl3KQgnbEq3ddNDOUorOR6xQE/8RsVbxj?=
 =?us-ascii?Q?ePbqZ0igs+nR4HHBVCk2e7kDbpbgWvqZLkPtWHMwqtWBCt+nJ5UGklbknReY?=
 =?us-ascii?Q?XvBrpmeDcBtS1sccw5mZ8qI9kY61IO6WoFFbpJ9td8IUN8zC8s2eU1Y4XZlh?=
 =?us-ascii?Q?yL+9EuxlEDQ/d6iize9MVkFpo8daNVO46vN09aOxN0kWlC3VB/AQCIkoWiFt?=
 =?us-ascii?Q?GKEXv1/6KvcTGnkJ7j8jJl3wLvgSDpA5G9OO6vryqLq7uFSLfRvnYtOkqaCA?=
 =?us-ascii?Q?agQ9yeONQhq2pSN4h+B2O6Zy8Fo/A77iFFakeiyk+1sapPcyJFYN6MHX7wmX?=
 =?us-ascii?Q?Bbi7kglWpJpuhx7KklmRgrGOvtTbzeWcZiftD5t5NaDksXGN6DC4ZnUSh2SX?=
 =?us-ascii?Q?3dX2QPO3B4lZaf24TJb/8Lxih/RqQBCZDwuutmXX9ToqtxiKBRAcl/5an9gE?=
 =?us-ascii?Q?IYbzL8w8KPfZ2e/n27sxJThsSxcslN86s1rVbR39J64JyCTEslBngVdZ84tC?=
 =?us-ascii?Q?XXOEf0fbu39mDdsAvgRr82qVx6FnC/Mp4LcHWlppXDAYTyLY+P6etuv35xaH?=
 =?us-ascii?Q?qWPAKPl+a9cY98vd1L7s5D9GpgHy1/IU9390xLhaI+/CxuGdfWvFtwp63b3E?=
 =?us-ascii?Q?RRDkQF55pu/sZTltKAfDL7kOGI2/ay80O6hm3rH51BrbZRHNFASWg4LF7jtq?=
 =?us-ascii?Q?EL8zn1buAIkq0VrZ/j3xnwKCxWHJlSAX7LTLWq6OZF3wV22oKDztbT9bzX3Y?=
 =?us-ascii?Q?ahu7abR5Jc0DAZOoJOG3HFib336tPG5JvB/t/jNOnJLKuAEHfEmv5IegycF4?=
 =?us-ascii?Q?I1ozwWObFf3HZnjSofruPDkjKsN5sZIzI6+y2/hqN/69iuCM1/KgEP7Afl2E?=
 =?us-ascii?Q?ym6+v5lJ2Z12ILLk7qWZljdo7LRYxEnH67jw1Or8oHzH0zrL1+N741pHHaEO?=
 =?us-ascii?Q?jEB+lRSiR0nabdfBC7ytnMUoT/LSSfIsEWJWhmkYZ67Rv8w/bak0kaul9JBx?=
 =?us-ascii?Q?ZjTZJ3VzH97F9RbQL4C7NuII+lz37zIyu4FDrjKSPzNeC47xf+BSdnX542zi?=
 =?us-ascii?Q?HXSmRJ3o3mYAr8cuW9eDhnSW/bJziHTGWSXN+76PowdeDcvL0anTFpM2uS2Q?=
 =?us-ascii?Q?nPpnGuu32mz40mskbml7Y0+aweT1ByYfnhIkCGQRfn+1BpJkZYUZFUMY3XZ/?=
 =?us-ascii?Q?SFsPeb5aFa7b3vhs+l4ogW4G+10mXkJ32kXZP2JcCmC23rB6J07asJP/zlYD?=
 =?us-ascii?Q?AOyW3Pg0FuGn5d2bsTs2Ib8Qqf6Exkj6YYTJORp1vtldzTO9Zz7dhGReae8o?=
 =?us-ascii?Q?h1fd6JCbncYzz+WJh+sgZMWnVx8DjLaV2sOVfzyzwg4IUhyKNqh4ec/TAukd?=
 =?us-ascii?Q?zTWWOdSDvO5vPoP7MSetWoa9N2mY+kb6rK8axyPhjKN6IK1APSWFOuIPnKnA?=
 =?us-ascii?Q?CukF2rSphYrxXQMq6iYY+JVpysEjnuvpuCTu6d7Rg6N+3PNL0qjH+28vyl+h?=
 =?us-ascii?Q?UXOziRY/e6rzxEcg4I1eP57+uzvBA5J0jG9KaDM8kEToeMiVhMKCC1M4zs7l?=
 =?us-ascii?Q?rkH05awIAzE/FkgbXWnjbBg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 564787fe-1409-4170-3215-08dc7ed3b8e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:04:58.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RKKUHSnjYVukazlNkFbIL8DVZRYfA0GdxOEAa3Y+rcC/5oUt/25pIcv9y/+vBXdqDWZqMm5Sdz45NNXSoWm/9pYqo+iIw9T3eukFO3jOH1kCZ7GXL7nZIzdPktluFe+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8360
Message-ID-Hash: WRWFB7TYUNFLBOZUO2YGJG4QQRUQT4LE
X-Message-ID-Hash: WRWFB7TYUNFLBOZUO2YGJG4QQRUQT4LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRWFB7TYUNFLBOZUO2YGJG4QQRUQT4LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

We have simle-card / audio-graph / audio-graph2, basically these supports
same feature but is using different DT style.

Because we are using 3 drivers, some feature was added to one driver,
but other drivers doesn't have it. This patch set try to sync it on these
3 drivers.

Kuninori Morimoto (11):
  ASoC: simple-card-utils: remove both playback/capture_only check
  ASoC: audio-graph-card2: add ep_to_port() / port_to_ports()
  ASoC: audio-graph-card2: remove ports node name check
  ASoC: audio-graph-card2: expand dai_link property part
  ASoC: audio-graph-card2: merge graph_parse_mclk_fs() into graph_link_init()
  ASoC: audio-graph-card: add ep_to_port() / port_to_ports()
  ASoC: audio-graph-card: remove ports node name check
  ASoC: audio-graph-card: enable playback/capture_only property
  ASoC: audio-graph-card: merge graph_parse_mclk_fs() into graph_link_init()
  ASoC: simple-audio-card: enable playback/capture_only property
  ASoC: simple-audio-card: merge simple_parse_mclk_fs() into simple_link_init()

 include/sound/simple_card_utils.h     |   2 +-
 sound/soc/generic/audio-graph-card.c  |  95 ++++++++------
 sound/soc/generic/audio-graph-card2.c | 171 +++++++++++++++-----------
 sound/soc/generic/simple-card-utils.c |  23 ++--
 sound/soc/generic/simple-card.c       |  56 +++++----
 5 files changed, 198 insertions(+), 149 deletions(-)

-- 
2.43.0

