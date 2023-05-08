Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A146FBB9A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710F111A1;
	Tue,  9 May 2023 01:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710F111A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589935;
	bh=780G7ESiekjHKthaV0RaCN9fDq9yD5vJz3XKwElQCro=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BD/Hjx6YTzT2vLXke+vETWTVMQ9Il0yqJR+mR0IVW6vPx0hCFegdZIes8sl7r+M/Z
	 r/+CyfWCeHB6ggaAOSRLszsh18+CsxTCK+0D34bhZo5ZMrFmKazuaG03eRylKis7da
	 s12Wi4ABKvQE4bjV+sn3cR21roknUvsXVFwBw/t8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD245F80544;
	Tue,  9 May 2023 01:51:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42629F8053D; Tue,  9 May 2023 01:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B49BF8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B49BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kJ1blsb+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKkpmJOuHXt2wE+KmCID9QeRc1uXR8xwflUFzR50qSa8LhYNJYAsOYU82oMge/SKlZhdRxdgxWQ2XC3ZgqGpAol/PaBG+I3fPU84Reai0PbKO9KgmsUYs0tU1H2ddMAemLd+jG7q/QO4sXGyL89R+DVDPKNyat37I083Rm1M06hDJaBNYqUo/ZzVDvtVcgueJApQ0w193oOaEAoMEAtqhJvQTm6s8dIrMECAG3Ri8JWvWnRLksLw7tjZk3WWhUHjhmGht+ZkjrDygTjSVRKUovRZUxdTETv031Qx0Zk8A+56VUHjr6/RSV3DFtZUaQARBRR/HqFmH4HvqrTLmslAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfLddfm0wggOfLdbsJx0edpY3rHEFPr8cwA4bdl8rvs=;
 b=KWktSp+bXXyTBWsYw05RA1TB5Tmnl2uNvXJeu4qFKpBHYpWD6uV8f4/Z304ZrtCriVlk0TQjCIdrVzWDelwkdwJXyDWPW4bbxPTrFCtdtE5rhb+GwNpE+w3NXZ4izwdZnd3RdznKp34U5zmXgiykqnLnb1s2QZjWHZJDxgyqgZT3AqCNMZcyoqwiQUHl4WF2pt5XJYOetjZTdaoiViqoFUhTNjCph2Ln+U8VLMbt0OvPmfaNPMAIqZwbAjhiY70MZaTWszzMD2NT20vgTpEnYiZi6V2o4ITckm+znkwpTwTxyjlmsU50VDQrxqyc3qO8d/6HPxHOrx3hmRtI4U2Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfLddfm0wggOfLdbsJx0edpY3rHEFPr8cwA4bdl8rvs=;
 b=kJ1blsb+YgnBsfR5fGV69fwBCyBm5K0q2qCz0aDY425UGjVJv6EE4DDsrUO7dNrz033GZNptvZc3dSQEAzeAUdEN1o84ay5RzWcp/Wf8y8hbGGvcqXMyJ318cCYN+fvd86mF0hqYWYXk6hvJSnQAU5Gguc3/kTsG03ExXY5E3iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10226.jpnprd01.prod.outlook.com (2603:1096:400:1e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:50:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:50:57 +0000
Message-ID: <87bkiul6vz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 03/13] ASoC: sof: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:50:57 +0000
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2416e06d-d05b-4846-f990-08db501f119a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PbGlVljOyp79FjUSunsNoxlcqQvNedmw/xrMMxk7xEF119qmuPChO9pCHj46sANza30MKWHRsstxb24/rEzOZWgtXPfEwDQo1h3f2FfpZG6cE+mHP6w+uB04Rna4Ot2YwIeUzbjoAhtuH/jg/2dgZPx1732yMsUWbww1K0tP28BvBkoGSjr25x7TEVwbXKUo3kaZJD1GRiNPlwrFJJoTFc7YUPhPBUOqFwF49OYRqTpicN6DRI7HWC+nd6TLqZhfU5WE0Ukrk9QL71e5VSYfKql1SbQrId6A5Re/UvHIYAafGclRfXTOt+P34rTNTWOnVhRLWr3L1o5kAvtI4PJxUaJx1XJ9YRCHo6/KxA4nhJVzPE5jmC/x/JL/hfacJSR7SxY61DKssxMEuyN5Yz9ymVCKl42lFesDGvqk2h7yIvrOIeyoD45rSScPr5SkeDe5KVdgXSEry6rL2czWh0riHT4zgvOV4M+T9QQkWgk6SEo+JEKgfoWkaOSgJmfTUCYs+2OoJwQl54CgLRE+RB8cfOPHPT/x6p0/AsOAATRnyTMXj6W1BQDb7oyv6bkJXbayIJ+ozUzzsx+2ZVhIzon+wRyQOcMoj11RTlOtiNACh+7v2sUHmNeZ1Xc0NfQ1eh1u
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(36756003)(41300700001)(86362001)(2906002)(38350700002)(38100700002)(7416002)(8676002)(8936002)(6486002)(5660300002)(4326008)(66476007)(66556008)(66946007)(478600001)(83380400001)(316002)(186003)(110136005)(6512007)(6506007)(26005)(2616005)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fhxaSWvHnSdPuuR3mAxuYcWAjI4r7xIIdzNm2YOzT5t3vtyfl9zeLIeGt7rU?=
 =?us-ascii?Q?9sQlOsQOKAEtTw+wVRb0+DlEyJ8vSUMK2jOAXQoQkKQhq1JjzxwBphYkznHN?=
 =?us-ascii?Q?A0Yw1mRemoNm2RAAPx0N3F67A0ZoySs4Bd1MW29bv9KMRcDkrs2idnT1IVNF?=
 =?us-ascii?Q?jdMQU47Tje968LD5jXPGZLqKba+Roto9n+Di/4XJhbBUzDIn8B1jRQ2euqll?=
 =?us-ascii?Q?V3Krm8x/1NlK6xPmwPbD9Rk0hJGsSTQGro0qj0AOI/LXEUDCOhNFiMpsM4Zx?=
 =?us-ascii?Q?Q+v31XuzNo87eQTcJRhYY2atquEDa2wfb0stP6iN6Kc4EFIg+XtUyIrUDNbt?=
 =?us-ascii?Q?RSxKtMm1VZK1bZxwCf2Swdx64tiI2W0shtNbUIo3ecIKthJcawFpyUaOK8DP?=
 =?us-ascii?Q?ggrHXhrlyb1raaC273obs8MAxjxp/uqaCViM1Sjjua3X+vyIMPufobb7vcaQ?=
 =?us-ascii?Q?+2Xf3EKWc+QZKASH+w9jq75qlyNXeCWAM7ST2obWMylIEMqfXyQmGLCf0dt4?=
 =?us-ascii?Q?2O+mOPFlGlwVBPysdGxZV2oBJVc2IXDj6bHMw+amMpVpv8RfxS92gwUMMevA?=
 =?us-ascii?Q?YkmxpFoHhTiBiys7TEOzd1w1kDKTCL/pg9v0jhfQUWQ7M9+U8L+sVGICJCd9?=
 =?us-ascii?Q?JAQEmn9qQIJ7Gzuw+w9m44pALpE/Qk+pz7Ms0wviJU0py5pwkfLn7L2Q52SH?=
 =?us-ascii?Q?SoZvU9eD12aOh19vZ4XIppVQLPImWVbDZR7L0Bm2xSIHORfefw8ilmqF3Q4w?=
 =?us-ascii?Q?/Oh/jofJSp37MvE4SPjWP83MacCnoddw0NrGZ7OrtyEAy7fdq9dgdkeCeleB?=
 =?us-ascii?Q?JL6mgvtUr9kEqPXq59Po5+2oSVP9FPZb6b2GGF1IheZ9HZmj4e0DhAMWvkTz?=
 =?us-ascii?Q?/VxaesnBo0vLfL/zpZwyfwjvlHX7+rikFK6umf4lqhf53rWLqqoiRHcQ0YMV?=
 =?us-ascii?Q?yhOw5oLm7voQBYGN2AOGbbp+zYbZ6NydIbZNF5Vco5xopqupzZeZ7FqjnBV6?=
 =?us-ascii?Q?fU4zYcp0z15eJy2P5wrSwbmR84w5QizH3kOAiZbRLeIxB4SrdhTNDRXuCXrn?=
 =?us-ascii?Q?iMYn20MhWuJZCTWFMPUgVAff5adLb3tBiA61ZU9447kNJKvCQcE6mG10Pg/+?=
 =?us-ascii?Q?USaVk6Hx/zF0O8B8IECwIl1xFvR1T8RXOvE7x14ZW/S0qSTQsOgkm6eQtJ05?=
 =?us-ascii?Q?JewgICRyB3ThcOWgfM3qlVRcZvmhF4V52qT+zGP+nE+f7C6urYpFInTNhOrS?=
 =?us-ascii?Q?eJZkIqOWZB1wTwplRlMug/Iw30QYIuCWkSgVrFRO5iotSFGZFw1J13kwMhgG?=
 =?us-ascii?Q?S4KTbFdnWJ6mjMAwQ7Bw/eNs0D73j57RJEd5I1aDRraPCowZ3hZNk4jjiyrs?=
 =?us-ascii?Q?QQFcLEAdz/8vtsZ38E1/OH2Dt/8iABO++UGRhJabPLpOvcmI5z275d57xlbg?=
 =?us-ascii?Q?GdKq+H/wi3wXHQmTZNeRIGGjDhJVD+bvMcJMlp8MG8kfqvKZvYejfSYWLj7w?=
 =?us-ascii?Q?mbgmLFdStD9NgsXbc4zDGOGgv5fdXyvcSvNlJiInUY4iHeUbuTVuy/ejU6zS?=
 =?us-ascii?Q?37G8PSYdClqFQsCZMA9U1hq3uyPuioq7R0u1Dvm/FjiqlohOMYhqsNCIZac5?=
 =?us-ascii?Q?bA7zZjaQp9MoS3RVJV6U2N4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2416e06d-d05b-4846-f990-08db501f119a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:50:57.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LObj/zTAVHWPiJaBDOweUbZ5RuddgKYntnOOI6okFjbncGG/+L1FCdsXzo7nXLMDrSmfn2Sh7IBfvfp9/aLwlvQsPVOaLQLRdcwMTRIDVREWwANuFZ/JaiQCU5HrXFGO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10226
Message-ID-Hash: PZJYYUOAKU2FDXB5AWKAQ2AV77YZ2ZMA
X-Message-ID-Hash: PZJYYUOAKU2FDXB5AWKAQ2AV77YZ2ZMA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZJYYUOAKU2FDXB5AWKAQ2AV77YZ2ZMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b13bfdeb2b70..7c5bb9badb6c 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -32,7 +32,7 @@ static int sof_nocodec_bes_setup(struct device *dev,
 
 	/* set up BE dai_links */
 	for (i = 0; i < link_num; i++) {
-		dlc = devm_kcalloc(dev, 3, sizeof(*dlc), GFP_KERNEL);
+		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -44,8 +44,8 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].stream_name = links[i].name;
 
 		links[i].cpus = &dlc[0];
-		links[i].codecs = &dlc[1];
-		links[i].platforms = &dlc[2];
+		links[i].codecs = &asoc_dummy_dlc;
+		links[i].platforms = &dlc[1];
 
 		links[i].num_cpus = 1;
 		links[i].num_codecs = 1;
@@ -55,8 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		links[i].codecs->dai_name = "snd-soc-dummy-dai";
-		links[i].codecs->name = "snd-soc-dummy";
 		if (drv[i].playback.channels_min)
 			links[i].dpcm_playback = 1;
 		if (drv[i].capture.channels_min)
-- 
2.25.1

