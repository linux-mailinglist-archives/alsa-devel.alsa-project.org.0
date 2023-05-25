Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD271051E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38CE82B;
	Thu, 25 May 2023 07:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38CE82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990955;
	bh=/gGvoWNPIXjOCug9Dlvk31kLtLZT+m9PcFiEzCiHFes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m2eVOYBhXu1teJ65cdz7U9DJIBRFlsCCMUJv+GxKNFGpPofZvMDZbQjMQaD5TiFqn
	 zWzWw5+PjdrSGKo1IzYr0KskMp8n5mrF+MiaMdKUxuJTX4S7oLrho4yY3GG/9RLi9l
	 7dWAvV74J15Abrgi/aVoa9n3dngC04UBzPu1Z6gk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E47D5F80649; Thu, 25 May 2023 03:20:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8A0F80642;
	Thu, 25 May 2023 03:20:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 621BEF80649; Thu, 25 May 2023 03:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96936F8063E
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96936F8063E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lza9RfUV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEmUdB3OZsH984h8akAgrRADVTDtw5UxQlyyugc299l+k1gbnBRmOSYFuNDEqA8RdtxDIW8GvPS0/o3WRHPRdNGaFRQX+L3SIMxltnH7Jd2hr4xvCUkhVEb/oDTm9LkEJlmVSeCdG+wmBJeQUIF6M59BMCIqgRsg6je6C5yYpwIT+o+kZhy4El5I1vDBG5C3kxakzThklhC9lA2uINPpTYx/pGvxOrZ3aXItVyPEaciVD7DL51lLoitrKHb9dpTGXviE6n0s8chGskXlmSs/Rv3os3pCs/5V3AzweNbtfbFGxDd+kxsRhneSbokuml62su6EcqK3gcCdMl/3uAyK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=TKwM0QsU7TNpsMfk7mf42QGixrW/takrv221krVd+kcFZ23U+QTZpEOGPBjgOLB2Qbvu2gwWNLrrktIB+tGDYzgM27rqEAyYMt9Th9heC68xrI6qVDmhf1O3CPZZWYIQEgJ8niDZgFYxYZS859cdQJAbwkkUaxq7CtmGsExQ251/YKpAVll1+lQZ/oUwK2CL1eNVGlam5A8AzJXf58/CVEAHLVAf90OEG8R24Z8tQIJoanEyKCmXv57rmIPQDpmqfGjBD/5UkXiBuwTKjrUrzhxC/Jr3xvTonkDEPvLvMmkR2Ac+WYNaChd9yenw/znLsOA5Un9S0eEq5VEgeZjkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=lza9RfUVulwUSdaPtg9ADvwm3WGsoFW2NkRtiCFzawouayoPTWvDAWANb7ywLik9ljl8rb39meHBE4CiKsA69BJQZt3O5JyM4+XeBumz30cLiPNxcrRg+qnluyS+84aKm6uWllMBCksB7N9KdzK4ArKujJHqPOLt69+I437XlsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:20:08 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:20:08 +0000
Message-ID: <87edn5gqbb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 11/21] ASoC: sof: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:20:08 +0000
X-ClientProxiedBy: TYAPR01CA0228.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::24) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 6571b9ac-2853-4b8b-0ad2-08db5cbe2de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	75/WvqlIVsOyPIWMCbqOMzu0bfutCxgQxvSv32ihs2RpRnv/S2M7wV2XaQvoqDyoLtVFQMFZi3jaU3pdWv/k4hph7R+EksbgoAfYoiLK8lfAXfY7CVnLdRObTbfMuz/YIl5G5lz0zmVTaFsnh+JJVVvMHQUPiI7yFA0r1uFM3xw+vaEvHwkWj1Uy37tczb2Xx/nKNxXdtHi9lDkoUu9QVdhYCWlIeZdWGZCPQ9edTr3M/fVAAv3fASGYd4rhReEKJzrLxafs9uN9IhCh4/dyEgFQ64ic4+vttcbzQHzYoC8H39c4n7Owepwx5538XcgOVfLJ8xCXvEtHgexSMkkgnfmhC2O53DZYVIDdkufb2UsnWwCgJKstySUp0QUM6gHwhLpS1TKYBwO5GPLN1LEFBCDLBM7S6rEQHvbZqdEeaDZMp1MSfB+v3vLsQxT3qiGtrKLGC9/JCmpqi6BbcoKEGVBnsvmMh/PHYH/GIW7IPcn1AhqXwin3vq/pBp94qBzGh7sR5fGtjnmMywX/5/5jOX6vgHgCIcNSxcrHUN2NhCM3Zv8TbCJ1skfyAVi4L8HEL75M5DX3T80HDlukSbAzu55y7tED8dvHC5gAt0kOixUmLi6g9c00WtGy+vMQpQsz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(38350700002)(38100700002)(4326008)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(4744005)(316002)(5660300002)(2906002)(66946007)(7416002)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Grgv74oigv/vbyl46dEXaAE8yzLkV6p6mXerCIL8TQZ5/J4jyfNimEoerKwv?=
 =?us-ascii?Q?HlSuO3iSqy5AvecSo6WlnXS7rpJt367foUqQz3+RIlK5fR4xKADQxhp0BV8G?=
 =?us-ascii?Q?TX/+E9fFDZki9Iv3V67JLZjj9ayixc5jGN80TZb6ei8Mto3Wdi+Iws4J4njw?=
 =?us-ascii?Q?TRhD7qjiPDOpd616OUNqOq4EhwWn5yeMZvscRPi9ZyQuH0umbe1jkNAzkFWO?=
 =?us-ascii?Q?RizAWT8fZKfDtgwhVGN0yz1HQKoWQfRlgbwkzQ2jQs8oyA4oVIAhj9LWNnLk?=
 =?us-ascii?Q?8JUfwBK1+CqDUPrP8i0gURvIfPqmKMFyq9sTWMRdQJTobopGdi23jUKlKPdK?=
 =?us-ascii?Q?6AsuyqUe+v5LD+gV8cpNkXF8Q5URegIkytKtZ3gtK0/Bd3On3f0Yr2m057/i?=
 =?us-ascii?Q?HcfsP6sZ+NQyoK6fiIyBI+lRgLtQk2p+L/K0wPJYVoYkJuxQI2dKQUHmEDsB?=
 =?us-ascii?Q?3/jBCWVjZhxxTKhrvmpKuy5SZa912kLCR670mlaT9TCM7iKyy0xC2NJnFD5+?=
 =?us-ascii?Q?Kx6s97XoYGatBQkIY4nDx8eFSRCQfPjbEGJERAf0oHvquSFEfVT59SYQ47hq?=
 =?us-ascii?Q?d9lZqbD8dpCn1UKhVW8YTtJJ8+2a7AwrcMlldC6VEFX9lKdqDDP6y87Bnnvh?=
 =?us-ascii?Q?Yv7G8qBKJkxgHRXbRvUZcQQUq2HaeHye6K3DngoxEHVRQKmZKe4c7qE4aFFq?=
 =?us-ascii?Q?/ZETAnRZVQPtJ7U7+4ZsYxFz5DEUYmHjsVHGM1MTFWb6JFndQPtOr2L/AKXz?=
 =?us-ascii?Q?pyZtaLLNj8IBqDxhW7O78BcauUm/B6WExQ6hqlr3nie2d0JhcWbON9opyQP3?=
 =?us-ascii?Q?dNRSTAlWsmQU8NZOTOyCdUw7HFRzfo8vwmBB5TRNTIJeOXYRm2XZMntvCzYJ?=
 =?us-ascii?Q?Xhehv7lZquv27kUg2B71+j537K1MhMxjFoWNyB7dACH3Q7JMAWtXRl9KR7zX?=
 =?us-ascii?Q?GmxcLPvYuBDOCDKgiwG/z2auMK+W1zDA+weXCCRtuujMsA+B4Lh23SUVfWsH?=
 =?us-ascii?Q?HTZm96vUJ/vHt8lc8DyXivR1265LH73cP78p4NDS2Nf1vuWvMmeCGzV5aVeg?=
 =?us-ascii?Q?wyVqh90HNBbGx6qInDH2vA9hVHP2HrCDQ10lsI3ch7lKSh7tkn7kVaLq5r0F?=
 =?us-ascii?Q?TYgABTVptUFYFyAHO522a7NwRAR+kL07kNVNzYgF6+Mej8kC6ry8GoxFe8ra?=
 =?us-ascii?Q?T5jaV0WffEY1QD8KsEyp+37QQP9uonIZCjNuoBvJiSho2PfpGpq+6BB9Lq0/?=
 =?us-ascii?Q?dyRR0nP7dWdKAjXhTHWC9cWGsqaEuwULsFuBZoGfoR4oT5wyHW9lTMB68IBZ?=
 =?us-ascii?Q?kErJkcyS7zuClXt6pXltGOH3ZfIh8Kpe0j28vjjjLSZpoCCb3uZHu6udptF8?=
 =?us-ascii?Q?UxobxNUMVT5xrJ+D9rSqQjW4Tym3GW07ikrOT2qTDsFS+4ambHNXJB4DHR3G?=
 =?us-ascii?Q?7jZ6cwsRGQPx0SeUiEDTDTGwJSctfnEy15s0P6cL8Jev7kVDnEYMSl+w5vz/?=
 =?us-ascii?Q?f8gQ6WUjvKR20jQOpE1u1WCFnQknJAr9/QLFxXWn04Nv61NFlg68Z2pw4etN?=
 =?us-ascii?Q?aaIM0wJN6o83jNMrv6QGSvcRhNKI4ok/XFSk9td++U7en2S3TSQJUfA7sI04?=
 =?us-ascii?Q?G97Dtm4SNmOfdoLv9K3aFa4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6571b9ac-2853-4b8b-0ad2-08db5cbe2de7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:20:08.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xzpekD1Z7wEshWsUnnu8HeUDkDSkASLzGJqNMOaCf9V0wz11gq0Uv/zH0TKXXPlHjc2FnuEbB/+JksWXS3lzMi7/p3/FzxppCk6cWnRBiCTd6TozhQOG/EOgP9M1gD58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: 35DTLX2NGNZ4OP4FE44AKKXTMOPYISXA
X-Message-ID-Hash: 35DTLX2NGNZ4OP4FE44AKKXTMOPYISXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35DTLX2NGNZ4OP4FE44AKKXTMOPYISXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 7c5bb9badb6c..51a51a26a74f 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.25.1

