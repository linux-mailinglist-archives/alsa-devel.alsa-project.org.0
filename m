Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C46C7368
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 23:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559EEEC9;
	Thu, 23 Mar 2023 23:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559EEEC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679612066;
	bh=+xAMGNF1qQYXeuvOgOhDxXOtRdBfML83VnEvGfOZ2PM=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bMhwwlZYE4UXRV1QcK9YnYfFCp8ijmEwzexI6fQOm69cxR01GKzFizqE+US3ncUrM
	 PSIoUBxA4B/8ugx6QBsKLcoLRnlljHGFK1gWNNrK9J8SnyzYq8dfBWfyIbF5HHHOrs
	 PToc6Fr+zyQDYgJ6G0W9uHKkatdRhQrgqh58Bj3k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE21F8027B;
	Thu, 23 Mar 2023 23:53:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64A84F802E8; Thu, 23 Mar 2023 23:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0810DF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 23:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0810DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R/lK02TW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAnoFGz/H1xAVT7QJcyut4R9ZSG83Y9esizBAA88NSRpov9qILdhsgRFAOgiGD9zTUGHthowA/aui9Y34ZLQAN0IquJ3yYKNOpaW0tUJ8WAIEk3QBxt8FfZRSIWT5qV7mKtOJI102eriUeqF2NsEKFFyn0u0JOHmeSwc3pboMZ3LdLbHaNlZRZi4Tl9LFH5LpTsfAXM56RgFGH+hDVdjj5gSwBlsv23xceNgVMJnGZy/e4YELeZXnr3QQ0t0wfrDFRUYZ7e4RsK6y2lFdLGxK1ev7oA+v+YEhpB831+nqN99WwWS/RVaU2QeJFjH28k60R03BKTm0g/cXNIlCON2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7LG//pAWKGT6YWxrSYIkUWirHTamhvtl9uyb3oXO7A=;
 b=Ao7Y+4mYS8q/BZ52ebbYICP5K5EjkEZFLNon4cadXKius2ZVDHP0oOySA2P8uq6YxnTWyTRc7m0NULji4iENkB3eUVKDRf/YXyh5KUrnHqaRXQl3Rv61ipCnaj+IamCWNyc+GJmF1rdnzAld+P0ua2CKECtI2+S2beOXLcn05eiLHNQwt2lhLjXuOpNoE02G0SwFKdEWV0jaaT4glwuj5FYFs8bzskiak6eeLwXc7B6Sm+D1AOxnvkkLOZ8SCpPax0ZpbDF7RcMPxiKSpErqxZu5fbmeOLwpnLMtDBysZ9RN3x+WiJqMess/q5FYkcsRt7paDLwu1fy49VUpXy40Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7LG//pAWKGT6YWxrSYIkUWirHTamhvtl9uyb3oXO7A=;
 b=R/lK02TWsTMa6Qcn54k+aEeL6LDxwXTuORCj9QR8Oi9hQbQifTcGwEbMqkto2jLfl4HSvbfa1wmesg5HxNzZ/QaczVRXGmMuN58sIjUko94ZcCiJFWI9Myzx6m/HDm7O2tbb/g6IO4sFMfp4AvJed0uYYMLnNeGV6AfLfXYlmwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12022.jpnprd01.prod.outlook.com (2603:1096:400:37b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:53:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 22:53:13 +0000
Message-ID: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] ASoC: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Mar 2023 22:53:12 +0000
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12022:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef23bb1-5319-45c7-a0c6-08db2bf161ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bhJojJUa+hCg10HbpMnQzHGbG7M0B8Bd4CiyRXXFPl+AK3f+15fq+cO0u/h3ZdAX2rV6VJHbiAIpYdyDIqsbkonpSXGxHsXVH76uZTg6Vy1zrqN6dd2Pwr6PzSQzOaVM1Aovp8yI2W0uI2NKOtFQV7YexeYCw8PE8kCEfcJXkR//TygxJAUYKxup0PU/jf3/ZoVv3yG/yTUaf3pLMQwzy6smRvBwTaODJo4jOURaFtc7eBwNMotgIpLKjVPV5a05HkYzWP6g3D46tm4jr0BQD08jlcHxfDyHP/oVpaUQG6qInfVY588g1AgkYwVuGOXb92uNkbRrcqaix/KnSINUXWGRuWDnM0gHwTgZYUO/mhWVuWRjWlugyklpRU3oZUeI0ZJc5OJj2VsVcxk1WnI+lm7lCTPymJ4sL8i+7tRUybHyiJXYWTq7R/KlwYdiWjjQMD7wgUW/VEVqOfrRZzMUnjFRnZ4D4fzoSQFR4+mCGHz0tD5QIGVq66JljVsMJ/cGeu28DDVEPCOCsvgLtEdRj3n8ydW66s2tlfsla66xOozs5JkeVlzYBVMD3T5Dxaj5c0stuFBbFux/IBP0FBOMb2FepyIma20vqMsCpx56XaDYwOXQRevStJrGyFxpFzUokOr/SRLlWbdLCIWjBDnskgOuzYPoADka61816k59FCbDMm4YZsV4cU1IZi2iQe/G
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(478600001)(41300700001)(2906002)(8936002)(5660300002)(36756003)(38350700002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(6512007)(6506007)(26005)(966005)(86362001)(2616005)(6486002)(186003)(52116002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uau39Zb/np5m3SDP8lxZw9/zIFSKj7aR8cx9iMndhhNGbX0qlZxhSeeS/Hu5?=
 =?us-ascii?Q?cvgm2pfdtGeYDixBE5DwNBFQ018eNhRIa+XejXNiQ+Y4YWaiDFzWWBVG7bC9?=
 =?us-ascii?Q?Q2mjJgzaFG4llSoWyd3AEQlTkSSKkp4kI9XEMCsiZRrCRr1qKQioZrZWymyu?=
 =?us-ascii?Q?XVdmwWl91hLtlxiA5xUY/IxtWWuYggyarAuugZMihC6Z7RkqfEHciCXGoVfC?=
 =?us-ascii?Q?uBPtCPg9FEvs26qjwk5WnoAfhGoiN0XpzpILOd7srD1JOhsN0U7u+b1tM8ir?=
 =?us-ascii?Q?Dv7RKyCrFxkZdRz6L4o61D6LkVd0Qp/KbBICseGE5ngFAOmt3H7FSlphE1v3?=
 =?us-ascii?Q?i8RReWyyrJhULefyMCCWdYB5YtC0XKLhb2tJnHuNVINBIJ1BeaUG3T8UAQJd?=
 =?us-ascii?Q?/rA9SLTIRGm9ldpZklfWlYAjY7C9c/ttNnc1lQUa0t9VWdvN1vB+dr+L8xU2?=
 =?us-ascii?Q?kuVCkGNgS8Dbg+Q+5wOQnueH3yqvErw0VFc1S0FMpb6b4gMzndudeAkPO7Qw?=
 =?us-ascii?Q?YHQa3PZIaSieLKowy+bOyC+4TPdJ2BtR9PWQuVKf1oSoTnbg16dA3fXqOLf1?=
 =?us-ascii?Q?0QVHzrr/IfUZxFI4NMVmM/Ht24PzAXAgg6pand7sUgzeTOHQFgXbv3nFV+K8?=
 =?us-ascii?Q?DfA7lNkAg587kbcnrHlei6Tso4Mj4fUOtB3CNJoNY8T8hAgxFz9olTh7W8Wu?=
 =?us-ascii?Q?s8k/1ollNB2P92Rmuq9qCDHdOAzgwd2PlJy6Vu7HwbtGm/d6xdIRSK5ClsAM?=
 =?us-ascii?Q?C42zIvkx6TmEnTd6nhzFdUCAUe/6jyVMHLEErPW6odeF3DOPWBgmAMr8WJd/?=
 =?us-ascii?Q?0UMsXFQk8T9uyfM/7OcrUEmAm/p4pq1tDxx9t9ygghu/qC3sX1nBOL9lUHca?=
 =?us-ascii?Q?Bo5rwSscSL2KpXY49OwzaZ7VxwmYbBeuMv+B++sgfz1fvHJj4Lfrr6bT5QKz?=
 =?us-ascii?Q?/iGHtLLmQ3vHB2a1QzlgBg3I8mPHb6ofzD2XzALzygXvJhs6Lq7mJxMfJKEW?=
 =?us-ascii?Q?+ttCalIQVA3YHATLuIh9yrEFjIqCSl+nN48rTk55DuNfT+F2wZSuFlhRYrIg?=
 =?us-ascii?Q?iHFEVGeAQODLZJ98SSKjJm98nrojVSPFVivDGnVvCXcU1MMO4RkovFVRommf?=
 =?us-ascii?Q?w1VNh1O2PivMm2B9qtjt5tJvZPDgA6l1OeCMmXnL+ZKi3rgy7qYhm3upXoeM?=
 =?us-ascii?Q?GnSFVhN5CQm+txB57U7D1RdMXheJrC3NyL4E2iJ8hHUPeMB89GNTdrcs4PzE?=
 =?us-ascii?Q?MB/W5BnoeFlO7raO8Upc0ArKhF1jppSRqha2LwAveUeaubgCsMlyeYUUV3J5?=
 =?us-ascii?Q?BxDNF/8GlSOKB+5L/Jp4/lXscFo7msReFhSzkOPPt38i5jKJtPIzD94bJYTt?=
 =?us-ascii?Q?HaTZYy2ydAIvHnN3URrr1SFQQ0fvu6bEaPLO/CKVH106S35dJ90c66iFosqH?=
 =?us-ascii?Q?v6hPpZTsipd7U8CFR5u6pjvy5lpnDRLWDYg4kgCO2hFZazlJIE9mq8xMAyG8?=
 =?us-ascii?Q?GJhiB+P3G3ad0+jHjojtdNjC5VkRtbfaB165qz8uYxNR/cdx2QCYnARG/y8r?=
 =?us-ascii?Q?VHoMOMSq/hJrmsYkrnPmDyC3dYCePR3neJ69finQ10aE8QdpDK7rz3e7dwVz?=
 =?us-ascii?Q?UcziiPzi4nZK110RPCBCXlk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ef23bb1-5319-45c7-a0c6-08db2bf161ae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:53:12.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IVgO+rk+C/y5R9FFmwNCLoFyq9jrKj8coid14ZiKRYphlAi4y2HkB/Qq+mjilK6zd1XvceI58wbI/VAXneZK1f6XNkBztrPICZmGGXAKrYncCXihjQMlVwuqGClcpVwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12022
Message-ID-Hash: PMVFPL4NRM6NTK46OELWULDJBFVRCBYE
X-Message-ID-Hash: PMVFPL4NRM6NTK46OELWULDJBFVRCBYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMVFPL4NRM6NTK46OELWULDJBFVRCBYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Current ASoC will ignore already connected component when binding Card.
This will happen mainly "CPU Component" is handled as "Platform Component",
which was needed before.

	static int snd_soc_rtd_add_component(...)
	{
		...
		for_each_rtd_components(rtd, i, comp) {
			/* already connected */
			if (comp == component)
				return 0;
		}
		...
	}

Some drivers are still using CPU or Dummy Component as Platform Component,
but these are no meaning or ignored.
This patch-set remove these.

v1 -> v2

	- remove the patch for simple-card
	- remove extra simple-card patch
	- add Acked-by for atmel patch

Link: https://lore.kernel.org/r/878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (4):
  ASoC: fsl: remove unnecessary dai_link->platform
  ASoC: atmel: remove unnecessary dai_link->platform
  ASoC: ti: remove unnecessary dai_link->platform
  ASoC: soc-topology.c: remove unnecessary dai_link->platform

 sound/soc/atmel/atmel-classd.c |  5 +----
 sound/soc/atmel/atmel-pdmic.c  |  5 +----
 sound/soc/fsl/imx-audmix.c     | 14 ++++----------
 sound/soc/fsl/imx-spdif.c      |  5 +----
 sound/soc/soc-topology.c       |  8 ++------
 sound/soc/ti/omap-hdmi.c       |  5 +----
 6 files changed, 10 insertions(+), 32 deletions(-)

-- 
2.25.1

