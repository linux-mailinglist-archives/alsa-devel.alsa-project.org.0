Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674787079D8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E77020C;
	Thu, 18 May 2023 07:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E77020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389049;
	bh=/gGvoWNPIXjOCug9Dlvk31kLtLZT+m9PcFiEzCiHFes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUDkUaldI83zDp4qJYvv1QNn+/2KTI2AIZJBYRjC6jvgKYTzFllisuApmomCPb0Gh
	 E16DgVWb21KY8d5/y9OCjQBMCE6Mu7fao1HfA0sXI8P3TKopTvpt6QA6k8EZvLYfP4
	 mt90YvTJeNs8FzGiEu/Ld0JrFAywylEGBwrxcvFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D846F8057E; Thu, 18 May 2023 07:48:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E02FF80570;
	Thu, 18 May 2023 07:48:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9166FF80580; Thu, 18 May 2023 07:48:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D7BCF80567
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7BCF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hEYvPqpO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT9NadRXUXvK2iDHX9HRN8M7AoSe3QnToChmm5BI4Hj/ivtnzKb5NUcHDDd1bVgPL4aX171WoMrGnExbPDpmzgS6APwsIDe98jcrZtAs69YZO7m87Adztt8K+r+auwtDTdllsRx+y3ezOFharkY/Az1CRu7l+Xbr+8hTE8zd25b2ps5SwiQ3R4cPHcU3cEPxav2LTfFwEpAHCkMwsMRID+4DZoQP283fpHqRC58LCfQK6Z0vZoPWqWF3w385VELxuljCYl2sjJOv8obWBgg2Ps5nGHZnAWTKcHRyb2js6/jBcO95TJ6m74Djz9RqmrPuV57aDij8h7lGlHJxGrDc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=GFk9tVAKcKpivWO4uMh/fp8fbni3DPPIUPPAVdQoA73FVjhpBKNoVdlcPV4JR2VsoIUJw6rVk0lFWE7NQwJviJG326uAztRtVw3ifM9d5epwkSs/L1TUXD4118R5FsETPKVCel02Y6NiWSnLwwo7Tkh6MiEB70N6tE+8lbeZgIHePG5WTn0dsSYk2QIoQtJdPH6qlqA5PGU+QFhLrYlL1m24Nh2o5U0PGC6RoqUnBXUB4ZfXEzpBnEHbycsv8+dsS+JboVIhB7k0Hv6oQErr6Si5TiAEk0ezog0S1ko+c5e2Z/Hg7sweJ20IDdJzDb9Q8zusjwr78F8ahDkC0NHJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=hEYvPqpO3+EYabkbBvEN+DmWOu6rviCxWnXXmU/MKVif8yPJVKDHdBIQYCXcndW5MfMUL4oNTdsgswpDc1cNsB1pUWAO0HGNAGhahDPHYJnKybdTilltNC6+nwCiXfFTZyi69RPQzNLA58xp7bR0x8TQyAXVUZF4IIH5dP+qqZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:48:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:48:17 +0000
Message-ID: <87mt22p4v3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/20] ASoC: sof: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:48:16 +0000
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dd694c-a01c-4989-367a-08db57637a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gJn+JdHxBR7px9+qB6wTU7ef/YXWaf0OR2yFnJrfSWlLQ8aRpc/ogxqF3OAZq7Vf3U68AKAis+f/QKPMoVtVXnN9cWgrXYMIdHs+ZWuw8cVa9emYvvi2hXGAQ42TnsgBMm2ziCLod2McaB0D4cawXznk2Mhd2MC49tyIHqiC99hqWZSbclGM7vqWMnyE9/KwTH/A6PGt4nlBC34TirtvnA7BeIjvFPcbbv4HyRe2h5peyuPyl4MjPoYyUbgxN75aRjvmDlbgj5QT/BJWM2+XD5ThX1oGGBMWTLrLz3Xsi/QDEHMgIH/ry7Fb7RrhLq+OXW8E8V+gfTXgmz+ctem20s5By+G+pK6+42XUBOdNZa7TGXGBm7cKt4z3vzc5f7TaI7W2FkmEx95lyG8+vUXleotDXA+NE3/dLI6QIg74mFMp8ZOU46XOjPms5Dcqt8jwTOI5W9C6eOi6C4h3W3SPS9yrXPZycF/CSWgv59QyMaR1ZYiipjqpA/RKw5WOexp8VxrHDuiJ9B3OOOwLT5to9QqwNYij29es59Ysfbe/khEvRtmUy8/Gz8MMmLBIIfTRPHjSP+e5F2CuA5ONJFIbwOu92EVJMgW20/+09g0+q2rtzoUk6xU7+azCiNVPHztj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(7416002)(8676002)(8936002)(4744005)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h0zc4h+QfTILaW9LTOtK8rBreI8zS5c5gSkuz1yq+2N3OPlp7FdYnbScyapN?=
 =?us-ascii?Q?iE67EU2jZSZx9HS3hTUfhM2PJnlnNbuI9bgjIoGbleKX7xr9m+7GeVrpid9s?=
 =?us-ascii?Q?CXZTPOSjSDAgMqTthhBfCdDJLloRJfQeyFpoV5eWufDWGqKo1YA2I+kFh97e?=
 =?us-ascii?Q?24RTwDtI0zQRLUdVyt+P9aYZrxAluCGnDBTbxnxnFEs2pMudTftBS8e3ikmD?=
 =?us-ascii?Q?Sa7/CN+vEpIAFpgA2G0riZ0xDEBwngUY9ppG3AjC638Fkf1UuDjP4cz+iFhB?=
 =?us-ascii?Q?JXSVQNmOKc742PgwiMXk8a4UbGJwhU+dXD+U9ErKfHUAdG4Dp7Apnsv+RKlG?=
 =?us-ascii?Q?iB233OVGMx/zOMoQtik1nRR/pjQkKR51kb0GPkXsh8PsLvahmXsr49rrU+Mn?=
 =?us-ascii?Q?/geJ0850vVnrC0ORzkJ0vWu/zh/G8fnoBTa4pH+LxhJEQUEN638s18Wkk3rW?=
 =?us-ascii?Q?khfJwP0202OzASNxgdb1UtO0gkWFFxBef9/khF5441TKL2E7RYRyDhhZfcjo?=
 =?us-ascii?Q?A3Q/rbzuRSzjG9FLtPaZjR4m1nCfvBRFoXRlDoWvBQRcz97sbYOCSdXIRSnF?=
 =?us-ascii?Q?Le25NR069c2ECfyune8oFljvIc7I6u1lVpsJWGAv6B6jRbKFjpOdjwbgOWBR?=
 =?us-ascii?Q?VD8fgWXD4bIECHO4+1sebScGJ/QscMqMdqZ/I9gBUO1gjzGw89lWmYtpDUJf?=
 =?us-ascii?Q?rsB8Mu0soT61WvzD4JOYw7bOjZTI6mNAGUmQSWJ4Hje8nUUllisuQkvpgYb8?=
 =?us-ascii?Q?souMYo/LeM7HNzEmkW3Rps1f5Dm/eRg+0Dw9l+WTAit6nUcmlHE31EbKSm6w?=
 =?us-ascii?Q?vIPrvFrL1CnY+GG6Lq+7NjvLFOyjBKhWdIYUm1xn6YaLSOSsmzr0MufA5Blo?=
 =?us-ascii?Q?JGqz0vrZcY+1SNvfSyiZ5mYU8EUx1TYFOq4uQ94I2tJvtyRnvDKZrPwp5qmq?=
 =?us-ascii?Q?hNZvM3e0Gr7J3FCVI6DzaOaFGjrmFcrBITkBYmjCisKMPLp8PSo/i/4vwgIf?=
 =?us-ascii?Q?0ZGNqiXh18doBZURUQk4HDbTHIAH+m13rHVwsNMN6XEKcIBnZ0DZr0UVi1Ay?=
 =?us-ascii?Q?p+r6x6KS/TOaW8CSU9+T5jrdZmu9S+1aOHLz9V5dkgFomF0hU4xCPWFmsJoC?=
 =?us-ascii?Q?4JRTDKwMBKA7FyXVvIguemzqqr6LijZYmsOAjqnwhK96ph9GycETsOV8pDop?=
 =?us-ascii?Q?NBiDkPimwt5Q1+byhQ1+h4Y0AjY9VDE21txuD8S5QtDNuVkJvLe97D6nVe/6?=
 =?us-ascii?Q?+krZsWlmtiHef01cAtbRvQkkgETd/C4JPuyvvtwsLjTVgBDD53x4zdd1fHjT?=
 =?us-ascii?Q?PKb0mydYXmkAxf50hgmp5rI/vFgBMzYQ9Tzm/58F3u2cddQc8FnXLi3bjBDI?=
 =?us-ascii?Q?M2ZmU8ttX1kpmsEiGF58u9CcqQOXnsTSPLMepY0hU0cs3Vm4W5RvG+11VOwk?=
 =?us-ascii?Q?STYD5+ThLe7mFp894TH89Xhuqp6oBaCI5RI/qcC/55VZ/2B3sq7PEMTp0pOj?=
 =?us-ascii?Q?WOVOzYxuvq2gnzCfMLwqHx5uHdTAhHmBBtUTySSWvN0aVGK+b031UQx9uLLL?=
 =?us-ascii?Q?ZSwg1UlwsmTUcYWX0vsqxvzzBUp9TjeutqfvsxboXLaN0o9sug4/7F7WXSsZ?=
 =?us-ascii?Q?SMVTDOZPcledjXXqgSTOmpw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32dd694c-a01c-4989-367a-08db57637a6e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:48:17.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jO77RuoMBtuh6d/k5B6NRfSp6jQdaLG2UIvpT2/pzuJODYKuGwDMainN78/aPJZF3oZ1Q24c/eB75pajuHI2k4IQ1+aeEcfioYNhojxp6y5GSQGd4ccsTJqX1/9vkDqz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: 5PWXZMPVHATRPWWACJA6B3MT4NTXBRQ3
X-Message-ID-Hash: 5PWXZMPVHATRPWWACJA6B3MT4NTXBRQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PWXZMPVHATRPWWACJA6B3MT4NTXBRQ3/>
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

