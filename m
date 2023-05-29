Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4071418F
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE01A4B;
	Mon, 29 May 2023 03:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE01A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322555;
	bh=YqJpV+wa+eh/1atWvJawt5Z+jctdtUxKrhSoOn5Ob/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m/vZwS+qqHfgSpz7CwsaC6P1cwZhNx7LDfcraykc3+DFUvi3wrf9gp1yVTWJb5B38
	 L+RpdsGLlzZy+F8ZklXphUunkxXsxkm/b8pnkzWed1ZzWRMto8ldZJ7pC0IJ0no1Lp
	 j6FQRIwcjn0GnIa/tKx0LFZfUmOY+pRLub8B46Zw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42440F80604; Mon, 29 May 2023 03:06:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77696F805FD;
	Mon, 29 May 2023 03:06:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA3AF805C8; Mon, 29 May 2023 03:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD8DBF80549
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD8DBF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pN1KZ5fW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhwY0YeqH6kWJv/dyx3tqq6nCO6dSl0r0ra2aN7FOmK3UunvXIjipqkapQecgwqNX4oqDZ3eA/+xlDb1FpbP9Sin3zwhO5/R3uxetXQrih8aZhb0Kdi73g1fg7NdSiXso3PNF9vRzebZx0aBbHGEO8FDqa6WktCPm9OZiMi6k/TnWZaCi3ily9m1yBBTNZbFNfwLoIA3fIIVzhB7s6XnOOOtu7cy+SBJ8hJ5AxxPloe8BC9K+8QKjaRB7k3RU6SN0pfzUY9bO4QqXbLfp9Je+nCwtCT4J8L2i05+Y6j7XWWFzUErbaxJnyx2mP4EHVGYg6K3vA0FGfgPrcPDSQPuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVk8l+qY3eox022LwdgTxhzFUmt3NGvSxT+SY2a5z1c=;
 b=ZRNiERPAMrZJ7Qp2f2+kysbyx7j6qvp3RiIUhn9HE0NgoRJ/l6zwWfG23IUai/DUQ37LOV0koJ8ydwiSTgwAudOVE0+RPe3qqVOED5ED5PXaWUCVzDp3t6qsabWJn+PyffLA8jb1RZtGA+8Z89rJNEsjCyAxFBHlaA7p/mbEpvMfIgibZZCVhTCXQtmV15Mcnz8G9VE5D4e/kHKrgmq1y9gM4AgS3e7EXtErkCqKYmzCP6bSrzs44IvruB+LdXhAjBtV8wG/hLcPryFM/cs7mWfitMRFpT5Bu3XdB1y7PIO+G/auHyc1Tab664yCFVmN55DdF305u7W/R3VkHf2LVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVk8l+qY3eox022LwdgTxhzFUmt3NGvSxT+SY2a5z1c=;
 b=pN1KZ5fWtllN0dW4t5AMk16J8qW1C1idgBHOrkPC9O2yIXRz0UwAmyIVt9kWVYOoY4qrM0vaUyF8M+bnCc7bWmtYAUNmjrZc19PjGCdcfinU71esJ/fweQIE7X6JrCEbVpiipqxietDaQFRTqdDt9AQAbxKB9C2I4jAwhFs3l/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:44 +0000
Message-ID: <87wn0skkuw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3?=
 =?ISO-8859-1?Q?=B6nig=22?= <u.kleine-koenig@pengutronix.de>, Jaroslav
 Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 19/21] ASoC: soc-topology.c: replace dpcm_playback/capture
 to playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:05:44 +0000
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbd76e5-e5ca-47d3-c6af-08db5fe0d47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ci+dkmaPXsSsiVtbHDHp89xhPLBGBr1pq1ciKf7/ijlkOEf7aY81q4XQ1cTmtsxY/XypVR9+7URy6GaN0x+WT/gLCdrUusdp9ZeaJty8QcCGpBUTC7B59sGqXmD/epXWMZwy2HCnv79VJRRQxHA4HgT36Nbh0MsHnzILriVQwm4MVx+RmNCIGuis2jXZ3LCCJi1+HTj5pnkby2B3aX7v6CZiroy/5uhjokxxCmjTbxjHn3/ZmSEH084jj7vo90EFy2kBIG948iqc/CyHd7M6SoKMNdaXoTgx0gFqBMFSeAAC1caRSMp1cCgecifx7Ash/bcXhurmD9kIEMLT9twNLnthyza+myeT03rQ5ezRuwIMu+vM9jkzdc1Bs5Fi0KPXLOmdxKtJmf5U2qpitqmENmbn/cmtvQpLdc2MwA3vcFGqQI793yl9uhP/Ar9uNwRppiftOamgKYrMnaQcWcmNtWfqzN7OP+CjgwGHW+aXvBEoXLka4BaG7/uyU97PWi+TqLW64JMicMqwkq+yRW3kjvQSYVyyryl7yxlO9Owp9R6DifnnilWLNOuC19NG8exBv1wyBfB+BK1u715j+PB0TlOd0J+2HvVA4n1P+v5NNLtl+tnP4EG/wmzXbuanS2c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0X2ZWQhlp1dFXrm0QFxqAJ/RpqB1d19lf/+l7FlTaWVoWT86KDLNjyeprhXk?=
 =?us-ascii?Q?ECnp53HmAhxGek4txEADFxaM9baJyPmjR+6vKR3GLeRcCqjxc9+BH4TLk3n4?=
 =?us-ascii?Q?rYZjMNt//HaM6Z3bs4A7Ect0xVQ3IuZ2y9nOC8aHBz12BQLhDiCNCWIruqu+?=
 =?us-ascii?Q?3rnjIcffFhpNRGjofim4DZirqzK5/T3ESyjScXpWFMheV0ipZtCufXbE08ZR?=
 =?us-ascii?Q?or3F4yfnDVWAzG8VzqvSCvLV//Ba54W5y9ShPVZqhKVIzHXnDAkJ5iPKOU9N?=
 =?us-ascii?Q?yI4G2KyFPLOZDh6IhEPRtNjn6nohk9zcYnj6/74vrCy3pZHWJ2STUra46y80?=
 =?us-ascii?Q?ebyeWZjr7CUlb7X8L4aluslqe7qg/meK/LPvPlcYpIJFGj3K148KFnvzjM6Y?=
 =?us-ascii?Q?uspiN2ueXLHWA3Ux96RJ3wI+cG/q4DDaqH5l9WVrAUzhAGEYUerX4IWUxww7?=
 =?us-ascii?Q?nCNMIUZGWNAPB1xUEbTykYfX7kkX7Dq67UP9N34hmGjZrXSN/AYKGhvQ5okL?=
 =?us-ascii?Q?9xqPj9M9GYiHd2X5mq+KmDlEZlik7IN2XMf59tJY10K0yJa0h3itzjDJpqPo?=
 =?us-ascii?Q?6z0vm6aNTDUFg68z4bESW4Pohq7Sju5W+6gOYEwVjCtTSi5U1MyidLF1xTM1?=
 =?us-ascii?Q?pztVraxyZ6wqXE9P0znKcZEvkqCwxKTvC/0dZDlKXbIrhViITnV8ET14JAwE?=
 =?us-ascii?Q?hi1/7JErnjtQ2pQB1pl4tX6cdgWgZOZqKMC2iiJ5jKlPWzk70WwTYRmS12OX?=
 =?us-ascii?Q?sYPXiE7Qt1SDYw8TmIZBZA3Pu9FtNgl5UHXsx6Jo16xiBLDS0z8/8SVId9rv?=
 =?us-ascii?Q?A6zvqWlfWTT9S/S/8NNd/fWqbOymMgbTeo7A+FMmHpbNpUuAxbPDa7fRwJTr?=
 =?us-ascii?Q?M+LSzsPiG62+S8TcKCLC/nW7QRa+5/DrtCp6M1W1Nb8EBeF+ifwqfVtwc+nY?=
 =?us-ascii?Q?qkcz0XIjf5MNoWmLvLMp3HxcoAG+czMbelD4YeS3XVJ2ieG//79BIRkdOko6?=
 =?us-ascii?Q?/eP6S4L90qlCtHHHv501EAL5zGokxItI/w9Zp19YE4OOCFMdNZB8afzGP9do?=
 =?us-ascii?Q?S9Nhh1S5eR1XLeA0TmQMdZB6Pn+8j57UIU94+fJnUW4Lb5HdjGvqCw+rq/z8?=
 =?us-ascii?Q?hSelmZaTNqUQ2LxOc6uin9AVXsRrkyAFRe320m2R+PcV6+0GWFMour38qzY1?=
 =?us-ascii?Q?t6qKKS127BGVLhn5Ovc/63cYoB9aMVMgxE22GcuTe2D5ttH+oSr9DaOIZ/Zb?=
 =?us-ascii?Q?u9fw2E4fmAlpinnmud47MLLeM+HBXocRdMDJVt13zWD7EojwWJztY1OhWp2A?=
 =?us-ascii?Q?jG+mS6y/WXE6SyUtLbypY2ez2iMaRZQdJLqSqD40DEXjKNPm/C0Bpi56WSvI?=
 =?us-ascii?Q?W78cJJTaj/28dKu3xtJkquAwDtBkYeosW3PbRmdbgJhq5inVt9+0MFHSgZbd?=
 =?us-ascii?Q?vYK7R+lh0BMXDK6C75VO9qDSI9/Ovwnu+PLKYcXfP9LUtiN/bqyRRPk3JQeg?=
 =?us-ascii?Q?oPXhorHX9u6XZleLTy7M+ZKfVtn/Rt4dkvsgSoIJi+ttoNR0DGAyJ6uNweWX?=
 =?us-ascii?Q?WV7FgYAknk+AjbUBSh3ZkTYTSkOOqzy1c1OxMnu4C9Be0YJ5Nhflf+3/4zEh?=
 =?us-ascii?Q?NerUjAu492rk21sD0oAwCTk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fbd76e5-e5ca-47d3-c6af-08db5fe0d47e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:44.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wv0PnoyQ97/Nbda2gqfXi4C713FtFhj4TzPwdw+sWMAM00goODzUmacM5No0cIyANVeJgln8TZkhjic/J8GASpAqxMJEwXpIwsAZ8+lMNatpUgd/v1pn7muYjkscZg2+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: O7ZLVBEOMX5AMBA2HNANL2XEIRVIR27F
X-Message-ID-Hash: O7ZLVBEOMX5AMBA2HNANL2XEIRVIR27F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7ZLVBEOMX5AMBA2HNANL2XEIRVIR27F/>
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
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..703a366e0abe 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -94,8 +94,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 47ab5cf99497..cc1f08f2f17b 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1735,8 +1735,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only = le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = le32_to_cpu(pcm->capture)  && !le32_to_cpu(pcm->playback);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

