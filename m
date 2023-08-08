Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986A774ECD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4D70BC0;
	Wed,  9 Aug 2023 00:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4D70BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535547;
	bh=FoGHS2KcaN1P/dtfxDGThgR45h2O4PVkgLqtIfMcD+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XMFkUvWxwFzEwUOcttsOYbM16AvXNOlmy5G8hmh91WxD0AOHzipbsFaeEtkEfGN6x
	 HDSdwl5UyWH6IarjBix568+Bzbo70eHwVHb8exm/d2b+ZOwz6FhEGG8q2HMEilyeos
	 EJJ5Hmh7ccwL1TWjKVE88jKR6RcDaJDuYmwFMMhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92C19F805F4; Wed,  9 Aug 2023 00:56:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9BAF805EE;
	Wed,  9 Aug 2023 00:56:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C647F805E5; Wed,  9 Aug 2023 00:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 186F7F805D5
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186F7F805D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TQvo44jE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhOaS8DEFeA+bXSRPYMY1Aw1h6mGIOBnlxd5oHVGdEs4fVYhR+LuY6bCaPboXRwXyR+6lJTLeB55PGXDH48mIRTSFhq4Tqxxrioax/EU1CuE5C4oFXnxQBEXp4VgUZWGTy3ZshbzfiUtfluSzZ0HbjvOKdBZ9WZ05PDgYR/zbqAH/Zq233ocjKGp7GkWwDkpOiw3vVY9GGCj+BmzP8OjNSJAtFnIx6d7PgPuuk9ahU1T6pMR0P4vUUJGbhWl5BfN3OHvuC5dU9Ezhbmceey5oN43rNLQfuKHECwgb+DLBjOkleR5gshVuRaIAKspoYrfnBUnN97OHxev9tDbWsr3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTKuXr/A2BPp0JtsD2ycwLEZWaFng+Kfx7n76DzsDts=;
 b=RplgXJ/sh7K9w8SjGIuFyPwZquux/RPGdRkkTe0BJIKqR0rRjAul1dlp+kdobda73A7vMiKtOjRA2iQtNOET3wYWkKOu41VKHmEAVSwG4tXxKRMzGPkpj5io47jblEjoPCMGWyfO3SY9lwnlZceapZyCgu2H8uGpzZ9Oedk9azlcfF92KwUl005dSRxib75cDOQayy+jnueQ9svsJjCwEEL80t3pcq3Ljoa/3TOUzxh66b4JhL7lZRcfmPHQHwGOr+10Cl0anLj8Jy7N1Q7d+lAq2J3J5RUigeDkoXVq704+VDggByV8oWI89dO16lqgNZIvUhv23QgI9vW5hWXAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTKuXr/A2BPp0JtsD2ycwLEZWaFng+Kfx7n76DzsDts=;
 b=TQvo44jEXebwyOG7ZpXq6GNoT5vetoayJ/jiHPC6JsNS/RKlE0dpS1EClKqMR510VikhfDuSgXPbwYpJjoxN07QhH546pXPD+WDSd3KbdS0HsubfxayOn1fMlPF0KoWtre1R9vjxdssYSaIHtV5w+p3o14QApi5K9RPCtcvOLeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:06 +0000
Message-ID: <87h6p9b0u2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Jyri Sarha <jyri.sarha@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 11/39] ASoC: sof: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:05 +0000
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 150ad926-08df-4688-180e-08db9862a5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xGbg1fthESSMr0zaPBiVY4E4GzmdE2iN1NYnrQ2pmdsHtzcYDhxvrU4RiTJjzL0+UsPNm8Un/FNzM7BR6Nx623P2KP/GHdQwj6vhHrrGqfOvqJxm6Jx7vAr8aIsps+ZQyJ+sPxKxdWEfjAuHhJvfCEv3qcUe7njAcFScvWBNdLGYyAft2192PM+1woy27g30zXQVEsPAd1ncPIkfxAHk6ikrAyjtW0ucIa74BXyawOVCn/Qwi9E9XMqIKcfTTA1JAn7GbqBscnV3BaYLu/rGbYG9b3kmGWRSBReLyOknGFbYVN9TZdLTaKMvLfjNNV2R3KTTOUN4fb6lCPDuMhjsgvmNPOlpjwvDyVXdw53XD/2yvwb6GElkK+eu9I5q12dnQGqkOIL1ealkrcOiGOlHO9hNcr0fCZJBj7ErjDD92kmFqlfUAzsruOtUsDYiV9RR19nQPljsUKtlHYh6rm3y3x7jsQaIGPe62aYpgUN2rjTTKM2G3hb+Tmzm58/q9NY36ikvXnbeHMc2QhYJHnJa+z2OBMC4Yg1NTk+XDDScL0+Q3fm27Y8WTLlmLRS7SMFJucaTSlsbKChyVhLLbNb61bWLwIoJSuWLbnqssEIbuIcWe2wnl0alFsWQmNqLkIpxg9ewS9YHUBm2G+Lroh2qNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(7416002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(921005)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/02YMcIVKsm2K7iuWBKN+lE+3DZHiCQrjy1VuZIZD6+MB1VpreLouuReqjms?=
 =?us-ascii?Q?Bdqp5PzGyuTZaLZ9eTaYgtkVAK962bHDl9U4BKeS296aG+w6iRWlokJrlQSx?=
 =?us-ascii?Q?f9o+nRbHkSxdYDureIhxqpf+EDpyirnyDlGQGpCWD2vu+jJCguK4zlkFOGpS?=
 =?us-ascii?Q?bEUHLub6B716/4Kgifwav0CuyeXN5p3CPF/ZJtAKhCL4qmoH4x6IEKL6Lg0o?=
 =?us-ascii?Q?Eaa1p5RrT+mXg21qceuq3Wfvd+c0s04VZffmaRLBjJkXsniS92+rfuhAYDa/?=
 =?us-ascii?Q?5i36oTIArH5KAt7YGk1F8VbH9M0AA5l/RRkrx1sjx/DPtC9CPP1f+boaPB54?=
 =?us-ascii?Q?9jCEftjKBzaR2EAW7gnDIGxr8uxzPrnhRF8iRmpQIvD5UomQF/iJp6doyPIl?=
 =?us-ascii?Q?dvcvlOQpzyAkKwhMJpMgueVBYrXuk9FGWCzehOUFMKXZiahknxJeiT9fITMy?=
 =?us-ascii?Q?UJRORT3zh9bmcTs2PYmyK+QdTPgDjQ+6st9feD03818V1F+ol1A4pJpnd9pm?=
 =?us-ascii?Q?AWwd8ZoyTQu55ewQJ5qfAQZKqDfi7Qg27B4PDci+CzYZUW8/r9zbSBksE/bt?=
 =?us-ascii?Q?MLn1mEkZcqWgLPTNMO4l5Q3Q+2k7QsNqSDGJ5Y4ShdtXIFwZAWYi8V2GJELd?=
 =?us-ascii?Q?b0aI08vJLy/y/bBvnz2HYna3PX0LXkG0x7rGIrVQAdpJ9v+MYxh2j7/bnhTa?=
 =?us-ascii?Q?5abF40mNa9pqa23kRDopPHZzQwkgraIBFhkUkRjXtSMZpaAajNx65oBDeTA7?=
 =?us-ascii?Q?ByMZvPHktPEH9cq3cMucx3Mv/IgTNrbwqJZlCY4GcoIYr7OoV6x7iSVKnIDF?=
 =?us-ascii?Q?FxKeU93xSEj6LRj3BEE/LbRlnt5Dw8X+sHvialjBBx663P6v/Hsh1JIfd7HS?=
 =?us-ascii?Q?z/TK+gLYzOFOZa6gsyn0crQilsY25YmWSzkfHz3ZPrqVdVwkZ7/C9oKpTtHS?=
 =?us-ascii?Q?Vw8Dw2GOXMOSUHKxXeHjxKBV2+hVpbBCNTPDYgMOM9MPtm7x+2C2Gcqrqp6B?=
 =?us-ascii?Q?gqlCXIRCbvtVswKm1SngiBQybk6YGKh0vBg1WxlWXC2HJzCgnT3J9vQu8uTh?=
 =?us-ascii?Q?nL8R08WjWZeQel0pgIBkx8CZh4FM/vWc+3QnU1WVeZbTVqmUNtbqwWfC2Df4?=
 =?us-ascii?Q?mr9WheJgQa2f61X095etnhMU4BDSEK+VObJ7dY8j3ZlBe54PkMTxIY3vqGah?=
 =?us-ascii?Q?ODYnmqZPJPSqlcddGWkgz5j0kUvvo3gw9DwZ5t6kCSC8mba/F01Ox1CPpbo3?=
 =?us-ascii?Q?HIgZF0+YSIIjiHOsBGqEO5zWjmJAKvxYowjYMi3sAarHA7j6Q9PeVLi0Vy6I?=
 =?us-ascii?Q?WWnjKl9KzHnRGvMQRXqvfQT4qDGS679BSEOnRzsaMT1t6tGSS1JR1LdMDRoU?=
 =?us-ascii?Q?ulkIDGsYi07IQByxqJ2Cp/llLAgR8wdUtOm+F9dYcamV78tP3s8YtalAP6+c?=
 =?us-ascii?Q?TAvyR3BofrhIm0xkCgUFk2sig5MwXjrXzQWTUVkrE7e3NxSybt1Ty0GeUeDx?=
 =?us-ascii?Q?La9DMxLc0/GmQ30DgjeHLeik8tYwTRRstDPJHHojMha/JYmbM0hCFN8HN6OZ?=
 =?us-ascii?Q?5dZNaEQLEtOyu3cO38KrOgNfqjoGXx0+3wBDe8MxVzGEZuKPFsJUOOKGjZk9?=
 =?us-ascii?Q?0qH6Ox2OYbjCTC2SsRsx7OA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 150ad926-08df-4688-180e-08db9862a5df
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:06.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eHbpIwgreqpl8MRe5qRSMKzllMN/Q3PsITgJwEho/MCLo1sky20AgmYrBv5DXQ+5rCa+J4VjjOj+js57+2wkyoVS+JMJEHgy9UWwtk6e/0QvmatLO6hbuQTWlE5PK2tK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: KUTNV2IVZAFX4M6ABHCBYS34CAM626VF
X-Message-ID-Hash: KUTNV2IVZAFX4M6ABHCBYS34CAM626VF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUTNV2IVZAFX4M6ABHCBYS34CAM626VF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/sof-client-probes.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 5530b5d793d0..740b637822db 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -354,10 +354,14 @@ static const struct file_operations sof_probes_points_remove_fops = {
 	.owner = THIS_MODULE,
 };
 
+static const struct snd_soc_dai_ops sof_probes_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver sof_probes_dai_drv[] = {
 {
 	.name = "Probe Extraction CPU DAI",
-	.compress_new = snd_soc_new_compress,
+	.ops  = &sof_probes_dai_ops,
 	.cops = &sof_probes_compr_ops,
 	.capture = {
 		.stream_name = "Probe Extraction",
-- 
2.25.1

