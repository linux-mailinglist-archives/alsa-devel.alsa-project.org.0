Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB86CCEB5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 02:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503391F9;
	Wed, 29 Mar 2023 02:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503391F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680049346;
	bh=UI1HRTT6z3kovFGleu7MD9AMsbdq5kLzBb9/8V43nDE=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QuZ5J0JhnZ7drUoXFN5VvZmia+0nQS8wXSWctS9NNWpxRssW78mAk5Y6lio28z6fu
	 yPFlAWsj0647JKXwdZCH9ki3BTn8+rcQZO0lcsDzD2Ke/EkAMK1EmQyg1VMqkRLQCp
	 QUv4H1Ej4LOOYkswy29sp3GEblGfFujoj4N6QI3Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB71BF8052D;
	Wed, 29 Mar 2023 02:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC55F8052E; Wed, 29 Mar 2023 02:21:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AB12F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 02:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB12F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=efnIOshF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Od9IBAailMs2q/cxAQBGvPuDGreBMXItDMX0gWucfvtxCL7JTpsnOAqeW6DGPBEVhjaA67YIcU5TtzT6aMd/vH67Jw8AIGcGaD5YFbdOcyhmmhZE/fon7bxK9/tUnZO0T7/Br/C4g2Lm7qY4rzyDEgTdc08En+rCOUWHMzvW3Qr34gaxhiLOrGb3qD8G6wkYWV1DYVYr0hwugpQ3RE+UTLPVzBsKr5ni4RO6HkyUxgFRiV4omH85od5Y6rT6mdPRxsby/6QVFlg9J+pBm+7tVTXa/u+uW0BC1hqSC6kZ8lBgUXe4hANtHhbklpsNhZILQVQ47/IOs1MatraKdgVejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtb6M/+odZQeour3mUEToYsIHVU9ZB1lisJQAM97NGU=;
 b=b3uZcGdFsqBsb2Ka3To3VCKKGqijMhIGGnOS6M+cIllbNNMsdHDt4RgOfIJtVYsn5QNSsN9qIXgvagC3FFCgSEKm1tinxelRKXLcXMov3/Q7Bu94gc1i6RObvp+6QUWgTSoSqvOjPR0bYp/GR+vhELj4/0DUCo2mh9xT8gYko5FnK15jAEatlSIR/PsCxCJuOLal+Q+lS8kj8talEIgoGI4u7awIfCuvhnJFA+w1PuEY1PP8RRBFFyEQWpfuvtMwiLVoHN4+ttUx58J+ffE32qhHxP+EXs9Z+R7C5XgTp0DJR2mijuuSu2q3v0g7PfX+Jc/lSs5SHaktiIX/PgtNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtb6M/+odZQeour3mUEToYsIHVU9ZB1lisJQAM97NGU=;
 b=efnIOshFJkPkP3LWtlEawQ9bw9Hfvvv/49D6r0Bn3riWKBUennp+kfqlomExHYb8DmFkGIzJVOgTMMChpsrYkE/Ui8afNwthFAtoM1RHlKNnuCG8hqVcH4A0uWF1X9ZZ4+RCAPuqPwz19MUUITGYZTj1whKg736pgjdf98aFSVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10073.jpnprd01.prod.outlook.com (2603:1096:604:1e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 00:21:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 00:21:03 +0000
Message-ID: <87v8ikcsr5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-topology.c: dai_link->platform again
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Mar 2023 00:21:03 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: a0647bf4-e0a2-45f8-78ca-08db2feb7b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fAOEkai46oLJ71yFcem6OxJn8torz3NgZB2L5hgzhALVm9OKjt7SsjmjiOBv/8Wh+fWV/5dRV2u6qGdQBzqKI10xvCNSq344LIkQ6vk7Q5F09wp9pZaeB2uGhNXBfEcS+dYd/Mk6bAJKyc79JeYnERQhGG3b3jT/2d4NxjUCYpHWcT3cedQtqycihjAN2nbdY3JI3v2SC97jpGf7DKp9kI+OpCSF2Yxt98++ihBGJl4x7W8W/MTK9MaxXwUCuK81x/qonz8A/eTs1xWFdb4kMz+l7POde2CnjExwPWLp+09c7jI0TEDorM9KeHYf3WzBMieuIjj/4MC13Dh4KoVvGk7qIllaBstrzdS9fLQYTg1iX45YXeoZUKiReMfpXb8nQnGbUJxe6HhD55R6otXNpnXs5TCjOLLYeHmt5SL6AX2i6Szk3VM8BSSnM7lvNeVwoCKdX3bZ1oQLmlWxHqOvkwX8e1w5Lc1HGZX9Z/vZw+815RN9X4Aq0lxeiAPxNzdMk1MBGWdfrPInx/an9N8tCRYnFzLOfZ9EQHkZc9awybxXp9+kWbhc1E0zkDPnnRW3kQyzLi37e27bph9ts4vBB/lEKiALOMkW2CAtXFiQsJg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(2616005)(52116002)(6486002)(966005)(26005)(6512007)(36756003)(186003)(6506007)(86362001)(41300700001)(6916009)(66946007)(66476007)(4326008)(8676002)(66556008)(8936002)(316002)(5660300002)(54906003)(38100700002)(478600001)(2906002)(83380400001)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HbIfk5g/3uYrBOl7oYpU/ub1MtJc6dv5BHme3XEpeYSjtSuLB7vHNvM3ftri?=
 =?us-ascii?Q?RvOYcuTw1Gos2Z2RZ4jB/2aRGr0+B4QBWvWRjqXe/IfSQKaCJz8WxUG+oMUv?=
 =?us-ascii?Q?il//dcH06kRWpC+VY8RG4Da+ON9AEGxkyvRcx5KvE2mfRFRLWF6xpuOqnY0z?=
 =?us-ascii?Q?kdJaHnF+bWykl2x2RyusFI/uWbWIdlG0zPDtImjOfN43/lIsl2Mdd9u4aCLa?=
 =?us-ascii?Q?tl80fQ+l1C6s/JHYrAh6DvFkzbXLv0X7eE+HRkQYsPNFsMAZpG8SNEqTLpO4?=
 =?us-ascii?Q?zd95+61dngCjY7Qo50voYY4kX8vuHCctKLbo0BjgJYkVZVmeKMPaTrnsESc6?=
 =?us-ascii?Q?0IGuD9Ep6n+PxpCdm+59/wFgRW7StNY0VaCPbScnx9USsnaMprXDUIFckC19?=
 =?us-ascii?Q?dnqwjpBjZjorMPhD2/hpFPSvnmxY3UieT/GQYUdGq3DfsdrP1UnlYRcvlx9h?=
 =?us-ascii?Q?bjEv0wdygXa0lMVb25bPW56qUp5Jk7qavhi/tDmSCBqQJq0HyZ6z/0l1xuMW?=
 =?us-ascii?Q?Ce4pfwVuDxvAw1uk2Q4hwdKRKi0EZM5L8i0YlTFhapnR7Y+3Qkdj5nWotnVB?=
 =?us-ascii?Q?g3nxFhIjwz05ZqrWz9WlzfyqhEILFFS+DIGR19RSlMR0DagFOKw89wMMmO3d?=
 =?us-ascii?Q?h8BpF22jMlCTHdb1/qNSI+lsHClr1w2D0KScjgOcG5xfGQq+EkVIBlpwJBEf?=
 =?us-ascii?Q?3GYiWdc5lPUEzOHG1pmgXXpmabz7wRh/j4ONYexRzfqv54O3YfzVCI3bbFkp?=
 =?us-ascii?Q?C6rQVVpg4ONr0eBaflR+nwAVFFnEy2RGgRPKhzjbBU8CflCDJ7P8N2dMn2vg?=
 =?us-ascii?Q?hbbZkaqvy0RJXa/VRfAZWK4hokoce9E/7IyAi8AEEsfkEVnkTTrWoIyMbIFN?=
 =?us-ascii?Q?+Djk0InNpyhvPM6iGkabxPabDZkh8GHjZ+Fb7fkEmHRYUTPp+1YWQkhWSPm1?=
 =?us-ascii?Q?f8Lb6hdZWZpao1bzqKo3Z3SGIySjagkjTB9Ilyk9+8wjDc7YeT96rC3UKN4K?=
 =?us-ascii?Q?XdjQdt+tIjlKOIrrJipOO40fd7rnDBTChwGtUDTfOXPTpvf9Q3Kt6PUnLIDP?=
 =?us-ascii?Q?+jdXbb1L8FZi+z6cR0rX4hHAjqpqjDQutX6jfmbJ+rtc5wI+KHwE9LHIq8Np?=
 =?us-ascii?Q?d3BnUnNHSSH2wst42ZC/3HjaqhqM4yeDYK5vO0j7O4MfNTyrcHxbOo6DLfh5?=
 =?us-ascii?Q?ak4Qk+P04keEg1YiEmZbrOsc26zJNU95/TyCLwSrlsJwdqF99nrRAkYIyIbM?=
 =?us-ascii?Q?liJO4hJKWBHKg3ckG1uW9IjPN4Y3N+cem9bmd1q1m175W1eyq1IMta7DIYTA?=
 =?us-ascii?Q?wzmtVnw+jR/xIvMH93COHtVeJaCSscoCHL7osRAPeTibYkx9CcgFeVNeVANN?=
 =?us-ascii?Q?9kzJmtF5jcpMJneGzoCHd0bA5wa1D6RGoNO31JiZbs7FTI5/lTmppD+I4NU8?=
 =?us-ascii?Q?pgjDdlcVFUpmNtwS9/lfGR4EjkmS4pS+geLnLxxkNLiPEVPNbNCYXxstwjA+?=
 =?us-ascii?Q?xOCTe1U2e3EwkkZh4vzb7E0q/ruT9jFQUNx6PpUrOCJYPrsecfrahvQDieOi?=
 =?us-ascii?Q?ERavmTVwvUVMNgPYMtIEyoT6OjzDkw1ob7B1IXhCx2wjfwcno8Wa6Ior5gxU?=
 =?us-ascii?Q?xOIFa1j518wLq0/n/WuYczQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0647bf4-e0a2-45f8-78ca-08db2feb7b2f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 00:21:03.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xiqeCqU7d3DgGnSlGA+WplQwzaLi5UH5wObt64Kor+c2EsBQ6aIDqhtG9nR42+XhZA9jIe0B/gA6RqQhX1/0xSy94qik0/8jEHn5KoMfUUs0uEVvAhkFCRXNw9eHU7+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10073
Message-ID-Hash: E64A3FCYOELVOQJYBQWO3AJM5PBRTM53
X-Message-ID-Hash: E64A3FCYOELVOQJYBQWO3AJM5PBRTM53
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E64A3FCYOELVOQJYBQWO3AJM5PBRTM53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On SOF, many topology is assuming dai_link->platform exists, and is
allowed to be overwritten on each link_load().
This patch restore the removed dai_link->platform for SOF, and add
the comment.

Fixes: e7098ba9b378 ("ASoC: soc-topology.c: remove unnecessary dai_link->platform")
Reported-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index be9849749713..d0aca6b9058b 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1685,8 +1685,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec */
-	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
+	/* link + cpu + codec + platform */
+	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
@@ -1724,6 +1724,14 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->codecs->name = "snd-soc-dummy";
 	link->codecs->dai_name = "snd-soc-dummy-dai";
 
+	/*
+	 * Many topology is assuming link has Platform.
+	 * This might be overwritten at soc_tplg_dai_link_load().
+	 */
+	link->platforms	= &dlc[2];
+	link->platforms->name = "snd-soc-dummy";
+	link->num_platforms = 1;
+
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-- 
2.25.1

