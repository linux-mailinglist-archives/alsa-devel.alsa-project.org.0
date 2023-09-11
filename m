Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2479B4A2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D08DF95;
	Tue, 12 Sep 2023 02:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D08DF95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476939;
	bh=1EJq66xgZMcSrouEANI8w/j7r2tSL5emiSheuIlqIUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aUF8vZj69w1RKkViZ2DVGNvQG8rhGgiG5S1134+tVpyAQE02pVyaHwExyBXPZVjIX
	 VSVB4aZY9ZBvlqgcqisaQ569EZ5YC60eXFzg9S5P+bixmRDE2FwN7OiLaieIwyaXng
	 L3qaCnmYJm/Xrp72xmJauQ2TYmV/ggu6AmM6Rx5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BBCDF8055A; Tue, 12 Sep 2023 01:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C92F805D7;
	Tue, 12 Sep 2023 01:53:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6514EF80736; Tue, 12 Sep 2023 01:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBBACF805BD
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBBACF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cCgEv5Ds
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I43TxR+A7p2JaER58z2pSUrrlpIsv0kT9pO+5aST4oy6miQQwlh2fLVRLMQx/yYtGCvy2Ro93S82gEKYPoGtSNforz5ana9dyPsURBiLuAGksxsiIsd/lzRBZn5ePHqyteAtgMs6LUhqRkFU9n6/Ey5M0wbjkwrtGrXb+x2Dt2FLfK1a1e/WojUJkE3v5T/tLQPfA5mMOezV5ob2mpts+Omy3vvliFqxVPp9TBknBbJFrLfacCRqfn8yTZioUA4JVDGnnf66JBRWwNnRnPyHuCfnN8SfcNorCJK7Fb3+e4C0dE59cLTtUuYoxYYDXvl/q8ftskBu+fYiwGq8YpDsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49uSjDDwC8FHQctqr7Q4iql3+wuVOnJ9x7Lh3O0MhfM=;
 b=nATpZWwYmE2WiNR83iMSgzMFAlKOhtzLhCelVDmpKJQVlEzl+thMQkgeS+6CeJFfiZC0MW5duMAXhucz22wbRjZmtPwA8RjpHSrCfBu/OnMXf4cbe+298wU7zRInvwjFT5cplXGvSQIHnm8s8XX8+GXRfTZ+NlZ4eAodso+YB4o6boFf6zgVVYzEs8U52rZAxnAHaGScN7CqOa2Ds2O0aWxVVDP+FjQl1UQaxCsL99cgvTN59SCN9rx8VjkhPXurPmCuD10gHq5bea6CpvdWZc7iTM/s78TttRAh319wCdLklmp6PyCqSMyltk1uKmxQgFK8GyrCXsJJXECyF8ZYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49uSjDDwC8FHQctqr7Q4iql3+wuVOnJ9x7Lh3O0MhfM=;
 b=cCgEv5DsHsPO6gMoRr0QufnsFfN9bYme69Ay8QxiIRdPQS5My7E3/carXgRa0Xohcc4HvSg6aL7U4DwY6FDk9WM7CZBNiYCKaHAoyo7XvJXbU292tjh5E/LOheZt/CXxAnyYOJrCPT5FYib0RmJAHsKp6TtRhN81w+KIRU4bxzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:08 +0000
Message-ID: <87h6o0p8t4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 50/54] ASoC: soc-topology: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:08 +0000
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: af0b076e-ef65-4e70-5a30-08dbb3221bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uuz2Y4FCb4gZzg64gJzjZdGdmDtFJAX2jejwyEXlXfdaBa4aXTdwYD+TYlWxxKADJEnnfwZhrahHEDdfc79uGx2yDn6/TDb3uB29Vkt1PCy8KqOD5xEs4hcLukD6vaxlCmzbaOd2NXe/Z0E4iQU8LtaF012Ty9Ssq4DrX2T6jOpX/0L7N7dAktTKNzzLu0ViQZslM/CRN+u/3k6mtcmHOIeq1/tQhPNyYK3/jEU89q/cNMA47tjiwiuiOkYsLN9AZMHhNihVM7bKkYbAEON8ne2TTE9sT/jQddO67d2R/jHqPjj8vDm/JTag8rQ6yimqLnMkcbNkmiJOJLhZYVBhQyVG9ueNsZFggEwuSh7hg2viIWHUopk6rejrbksvGOvgqSGpLFaetc0Rt1irmw7iPu4de3QSH68aowKAEB6HUYFRA3kRRRFYqulVmF6hjqOeU9eGZ2PAmqbJJyEzRfd+7rc1S4awcVJGFVvJfrGJG0FW/ZEG3YwKdwKpVxUuXFYp2DUYSYpREdXIiD5tb6gKP2gn1AaqdqV+l/xOHwL09Zx/5RG+0WiA4F8y0auCzwDwu+sxdrLGFn7aoihgLWgCoVdi22YSjVxoOJwyXRWdsRIBykta9rwwnvz/BRkhNTAAByUWfqB8Y4uZa0Nzaj2GHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZzUbi0ROwiNPwVW3jQDbVjzcMKglB9/IpacCtmSAgKiDI7S0Fi1e/MjWtIQ1?=
 =?us-ascii?Q?H1YPBU8c4W8j1jczKG95+ZvhK/28MCDpXnjRYwBAPYwAujpiWMTvADTZS6t0?=
 =?us-ascii?Q?8yHhF/Giq9156OJsodhxhsot0SRDJvrIT/CJLMFrvs5DciNN358avIkjPITM?=
 =?us-ascii?Q?p11UfYKvWnXHI/qzaOWDAnQv36iDKp9STxRKxQ5rmVZw4cFkaXgu8atu00vC?=
 =?us-ascii?Q?KqbfecxxoqQsOd9qnyvW3Loh8osVVzrO3Z5an9NSNJ4ueVMQb5N6C+4HrC1l?=
 =?us-ascii?Q?Lc0V+6gtAqK2VRk7Q41Un0H/Dij1xAXswC4+4Cv3mvHxwfjBeY5EDg45CUYV?=
 =?us-ascii?Q?jjMS4Uk8XaHcJLeYXGDXyiICnkBZw5HSVByYqNvpb12zQOsiz2k1YklAcIky?=
 =?us-ascii?Q?mPIJwAmXF+NiER6TQbKwt+uowycoAva50VvCJILYeJHoUvA1Bu4Na7oHBJR4?=
 =?us-ascii?Q?MctVpirs21XHr8Na6ciEm8lJRwTwEIMMdlmlfcth0RLAUf4BMks82DnUh9NF?=
 =?us-ascii?Q?QqtNyrhQEziePUhXjTFEWxq6qopOyFdoWUqr2dPwCAmeMxvKJ1X7MxMO/LlH?=
 =?us-ascii?Q?cDS+fPcZVeFWVGe11ZSAZ8U5KzNLeLBGhxLIxcjlTIUUCTCfVXhTyYZATTUw?=
 =?us-ascii?Q?Sr2vfO702oSuAlAiVGYXwF8FFshSmq8nN04EbaD+Po0MJU5fnI3rwNeUfUyQ?=
 =?us-ascii?Q?I+M82hLeKpF8u2Csyktx0zVbxcs5G+51axQpiH+oYetNJMjve1semAizd0ei?=
 =?us-ascii?Q?5rlm0oOLwzmfJhFo0Ji2+OqtkLAQpt7pp20DErjgBkma9Y62jTDJjj0NHGqW?=
 =?us-ascii?Q?Qg3lj1Y8TO1X5IGYS0T3YCVYBq1LSUF/eeCkz6Yer1NHwub2YrQ5B0DzfQFG?=
 =?us-ascii?Q?QHtnDTDoBwH9Sg02ZslDTl+TuqdW3b1Pj+4D8DOA1TB5RGPdd67XuAb3buGE?=
 =?us-ascii?Q?9cE4MEA7zG7ft0AsUy0beosa6gPssSxPmoEHqUZrv/96w64IPfzR41dXrnI9?=
 =?us-ascii?Q?cvrBvrmlxFBDBjLAWxFMGcuEqKCzRczyMtalng85bPKI9RIb+MjfgqSAf51o?=
 =?us-ascii?Q?BxPBdCXT4OxikAJ8MsGuwrH+E/RpudFazS1XLBgVS4DRnui+qqmLFgP5fYww?=
 =?us-ascii?Q?9+fjyDnsCvjZT80OL6/dBGQwRgaPs2Crgw/v2BvtVvGmX4iFbLydkDTMwpej?=
 =?us-ascii?Q?09Kek00ugvsbp7YjZ58sYBcvuQaakQ53uncfxJUQhYP3a4tSw/q0nB+FXomG?=
 =?us-ascii?Q?9J4UEhOZa9hcc8Wh9aHyf/UeP/hHAdzk8toNO9n+I6oHD6LhaU01gVP7frgX?=
 =?us-ascii?Q?9Gt8vCuQS5pBQN12nuxTZ3Exo+QXU0t1t8g5Ncjq6v8kYVCdn/A3jdSoByD4?=
 =?us-ascii?Q?ePhx069MDBQjULF3xUWlWlVwbJMY/inp6yN6CkqkkgYXiS1CNtPK9yR3R+Rr?=
 =?us-ascii?Q?eggHI2pPDZ5nBqLiGHE0gcGr5NdvAwwMpfVHjqpS+gteEPH/lWybANl8E5Lu?=
 =?us-ascii?Q?HjvoqOE4Me/kZzb00WQYrcPrpBNup56AVhNwCkC/cpfjLDakkBO1f/OWE3x4?=
 =?us-ascii?Q?4P8usOWKB78QctY3ZLcDhyFoHnq2yGajJ0SjS7WE+KBjLvpDQLR/y1AhuAmt?=
 =?us-ascii?Q?3mltGmjAlBY7XX3z3RlHQTg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af0b076e-ef65-4e70-5a30-08dbb3221bf3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:08.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XV0hKOQhtvaeVBXj3IZGLOfaJRyQnoeAnoPqDTZFIq2/4GVcWtzD0HJBDQCYQUGdbCQb+8SxTUgUoIacmfQ3rnbEM+jkduVyYmAaBLFbfEAS/J7uHtVlX5Ifhmr4sXaY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: NWXFTHIJH6YRACE5U3ZIMI7HKPOLV6KB
X-Message-ID-Hash: NWXFTHIJH6YRACE5U3ZIMI7HKPOLV6KB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWXFTHIJH6YRACE5U3ZIMI7HKPOLV6KB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 2362c282ec8b3..ba4890991f0d7 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1706,14 +1706,14 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/*
 	 * Many topology are assuming link has Codec / Platform, and
 	 * these might be overwritten at soc_tplg_dai_link_load().
-	 * Don't use &asoc_dummy_dlc here.
+	 * Don't use &snd_soc_dummy_dlc here.
 	 */
-	link->codecs		= &dlc[1];	/* Don't use &asoc_dummy_dlc here */
+	link->codecs		= &dlc[1];	/* Don't use &snd_soc_dummy_dlc here */
 	link->codecs->name	= "snd-soc-dummy";
 	link->codecs->dai_name	= "snd-soc-dummy-dai";
 	link->num_codecs	= 1;
 
-	link->platforms		= &dlc[2];	/* Don't use &asoc_dummy_dlc here */
+	link->platforms		= &dlc[2];	/* Don't use &snd_soc_dummy_dlc here */
 	link->platforms->name	= "snd-soc-dummy";
 	link->num_platforms	= 1;
 
-- 
2.25.1

