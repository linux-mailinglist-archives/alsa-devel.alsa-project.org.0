Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B4D8180D8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:11:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1A61E85;
	Tue, 19 Dec 2023 06:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1A61E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962701;
	bh=jUhJytz/lXZSkGfyO4JpW6JwgiFLTCxcy5A4SDv6oSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q+7z+w1TCGdeQWnJkUe8kKE9Bvo0izG7THlzMPNh4D67gB0DeBuSU4YuUAePfPFuW
	 hMJi6P7NTwO6xNnN3K1t35NFivoe3nuBye4c7aI7JgQtD8XlikYLuldn3euTxkofeD
	 VPnNNDESsnzONN7HHDtatAgdG77Vgzz9il8DQmrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6F26F805FF; Tue, 19 Dec 2023 06:10:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BCDF805F7;
	Tue, 19 Dec 2023 06:10:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A54F80431; Tue, 19 Dec 2023 06:10:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5D38F80557
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D38F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EfCUa0db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtJcuKnmPMcUt6rASKsjasH+uBOrjHhYnkvTzbtRqTakt37kPwJbSUUD6F8k9zR64F5tNpevjX4yD7lJ4hgkCJMZBK/HZA9/80OhvE5xQl8U0rmw4hC7tQG+2coeuE3xIMSOBisTg9wGjgQuT9KwWfVXN1PuU5HFQi4UwgFa9cn86mbYOvrIxtyr8Zc7I/iuam6wrEf8yP6c951jm/ZA2oT963q6XqZpUYNWmtdSRdALPMxIYbAPTNGbq7QhyY+L23rjsLyInvYwFz/0pwlHaJdRKX4VXzAzfNEhaQVW4nkMxlaURbuaRTuOEPs/CwEVpAp4JAoIo0Gd39N2Ey1HCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj+DW0XzXp4Dy/xTOo3ZJhV5T2Fdf9Fv/aL+EkXVixc=;
 b=Lui8yIS/rw9vJPTHq57h1TxYPtsgqTn1T0C3cB9s2NAEkFBzcsdsYIb1nhTsfjgp0cqeA5lPYf9V7D5UYpIwznCOLInKy5SRYJoo9ska6tRtV5sBtKixuMVqlIGLHBqhApkHu7AMg7yJDJ4DPRgz9rAaeQ+LfgGawXw2Vn42i3ZJsIQ0exOryF8hwpe3OCyjQk1PZA7rETOPCirocuit4bx9vLOOqJUGxyxNJ84OJRQ3vd5ngx7jKTxfniufnboJq4v1FYGEL+PpnRRYNAD0RPDLauUYd8CJ7M1XokWj0fxyXfIf3MZFY/vKpsQEbwedikVfaYlKqnvFvoZ7mskqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj+DW0XzXp4Dy/xTOo3ZJhV5T2Fdf9Fv/aL+EkXVixc=;
 b=EfCUa0dbT33PhjFzdeBGFmaWWszm/GTKqaP5Izi+POUA8i53UGtJOBShdl479iGyGTkCUzERLtzH0R1s/3r6gm/UP4AjYeuAvQMRksUJWVksFDsv6zwJt8qirQSj3v52uUMPH93sjHw5h56AL2P08OqMwJYBbS88qgvA6XpY4SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11260.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.15; Tue, 19 Dec
 2023 05:10:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:10:20 +0000
Message-ID: <8734vy93r8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/5] ASoC: sof: use snd_soc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:10:19 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11260:EE_
X-MS-Office365-Filtering-Correlation-Id: b0eb7b99-4c57-4c0e-c0f0-08dc0050cc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Kjg5k0IUlgECCdpr5xKpZsIzofs+MqrZ5FpWxOAzyA4DDmUAfwPJM7mR2KK6E2R/Hgvil03fWQIsyLll3tkQQKmNdMwSvgdItu4bA4XMut3YILNmaeYITOVOyOv7A8S4tOmQ+wOBjHGH7CErLWNdn90dhKQ8uHIDXe5FfGmkikgZ6ZxSwtXUzuruy8U6Ha0m++EoMna781GOHo77pl3gXfxl1w7N+z49c1ZfIKW4RK+uUtD6IriHuH2ia4Y2p70BLzJskimMsv5M3QAx+TyH9HUVZC81QXinfM3LtKty63snCyT4P36S06BKL1AmDEdxPvPU1IXMu32qiC3QhL2OyRu4YOKR9MeQWmTvfM0s8YJc28G5I5KEmRVdrRkCTp5i/dyn/KAGBtiwpTxYi4VEniVIgdEVJDJks9jr14IzggvIIHiDPY1DnvlKXf4rubFKE+wh7UNOirSXnAcsZct0uvmBgKck5S2IMTOdvVDpulGiubBCDouYl/MSBp4ruUnYWsrB/1jks8K/NSTYp6Yz4s6AVgvRvbh4+pYt4y/hLq6xa86HCtzSEYZ6yBRiLHAJIxl+JS96/lvzwlWZgVEh+WrQRzynzsNTehPxpvqggKB0m/QlyaE167Yq/Tj225Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(8936002)(4326008)(8676002)(2906002)(6512007)(52116002)(316002)(83380400001)(66476007)(110136005)(66556008)(54906003)(7416002)(66946007)(41300700001)(6506007)(478600001)(2616005)(6486002)(26005)(38100700002)(86362001)(38350700005)(921008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HoiKM/XkTrmHXy6AxtXvCr68kkhL3y7Bcym2QoSI+qOolm8XGjHA2fTpznzK?=
 =?us-ascii?Q?llbNM3vOgxW/EBggpuowCJOi5X0hgbGnZx0u4UE7SyJE7TyY0SOhAjCt7SsC?=
 =?us-ascii?Q?JiuhDtzD3XVwzulgpW5gVcOco5rTXyuEYXC+RMWZASULsaMIbxFQ3T+gpWbg?=
 =?us-ascii?Q?czFeXvm7UiEJ0GhcLn+TTMwWVHh7FOY/p+fASgvLgCPVoaXQ6FzLT22hG0so?=
 =?us-ascii?Q?xNnBzWaPTfgVPH0aQ+gTWjpQLqNKagOa9ryviqY8GWJNh/wGqEwOntbOHgsC?=
 =?us-ascii?Q?mOjNFOfKmeon34+lgKkV2haQc68qbEe0rsy/FyLZ2MG3tXiEvg4xgPNkYkKe?=
 =?us-ascii?Q?bXgFbGhIaXMAg0aVifN+Qn/uqFspWD5sIZ9p5a0K8P303rB4TnTivcp+mjwK?=
 =?us-ascii?Q?uku2AnHFsYjHAiwnJSPpQn8o9IwNDsVrZEpNHTACSN2XAVOL4ynJUJKbfVVU?=
 =?us-ascii?Q?ohfNNa5NMWaPBBrHc7Xp2AhPmdl72P8A9jgfiA55WIPWUMRuLj6zBLPAWrn0?=
 =?us-ascii?Q?nm/oSn1jY2/mgVBNP14YYta+CFKE0uKMu766Y9kKaEqjHpADdDZYpweHdJCy?=
 =?us-ascii?Q?B7SXivS+aN1rc9/rsd7kjXf6zYajPkPJYthMQ8W1HfsD0kEcGI8nCj8OctyN?=
 =?us-ascii?Q?xfLyyGEWfc/38lgSKV2ZKmoSvqXclxit7679v/K17PpGdjXQaXLinbAZ4tXg?=
 =?us-ascii?Q?4OK2JqcLX70yZHMbpntCRGdv5V4eRyU1rKUvxAzjkslaSQ2jshD6OqxAhKJN?=
 =?us-ascii?Q?irVtkxJ6x8JU9Qxy3ALvEXRspxhBi2+INj3NvjdDdpkgLszcPLBlY9dXlCqj?=
 =?us-ascii?Q?IaLVkcykctOi9zmXJLIMMaqY2juG/Bg20Kk7ry61NN79sqGnBNLcT8QZhO2p?=
 =?us-ascii?Q?QkS8ZtNzU7Wv+PMyX6DZvIRhmmSj/H4BGCB71m2W5veT+aR18g8WUySK7s+Y?=
 =?us-ascii?Q?lgz6DIvzhSHDBEh4aOX1JTR72TxQh1MRXPleB7JZHZaUVOc2rykaLtTP0t1i?=
 =?us-ascii?Q?Tn3itEKNtAaQhYV6xiP9EWKygONB6zrIqpWin3XNKz4vPAfMIJe1HJp3XPvd?=
 =?us-ascii?Q?ZiCBhL0w1XyQkgq1et8hpn2eHFQ0un+Gz3NtlX7JarHZoHZlFgNhCf2UW/6W?=
 =?us-ascii?Q?GMkmuy7Z2SMqqV+AgFh2jW0MNnZQ6qVIuWcv8Rrs45e9eMGxrVn6S+juGWsB?=
 =?us-ascii?Q?sVtItYm2jpMnHjUy9Kyu86qM4f/RWqh7C+qTKsbPHDpLYaNGjE24ocgQMKm2?=
 =?us-ascii?Q?QA7ZN2OfWcsw4X8tQaUg0Q+sqy+MUl4ml8FtiQCiXI/369j20rurnX2upQyG?=
 =?us-ascii?Q?X6eRB5FKKW9C+0q0ot6dgsOEZWa/PLmsdNluXAoYefyCyCXUaxciunB3BKga?=
 =?us-ascii?Q?e4Cn1ZEo1qhF+VbngVgLjI8yh2LOb/1yE5JMjbyRC8o5eAETa1JWtGoceKHy?=
 =?us-ascii?Q?kJ8FYG6YiseHPLeyUP5LSWmlG9CNu06pPm1aLy7qj/8OMgWJJoEt1O3USUM3?=
 =?us-ascii?Q?IIC66JO22Vu6PM9vMwN++mWRNg6zU4XmopFmR7s0a+X9q9HfqEIGbwxvI4jd?=
 =?us-ascii?Q?cNGHzzA4Kl4GQv+4jfFk/STt/7EL0WhsGzRTEWjm6I2SuK+i55cFHRYIZb5L?=
 =?us-ascii?Q?LrvE1AS3fvt1tJxUrIrPbw4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0eb7b99-4c57-4c0e-c0f0-08dc0050cc18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:10:20.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K0EAfN95kVklVlqNhJszHLbh6W7sSuxjZwRRg1Hfab+xPZJXM71rohKjtA7iz+Yy7XtyUoqb0d+ivyvRoWkZwDcH9i4V+IXLRthGXximcWAFr+YZdLZ9ZatQoqwzxWFk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11260
Message-ID-Hash: KJ5VOOHPKZWPMZZRMH6ITWS4GN5MIQFV
X-Message-ID-Hash: KJ5VOOHPKZWPMZZRMH6ITWS4GN5MIQFV
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_soc_dummy_dlc.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/sof-client-probes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 7cc9e8f18de7..30f771ac7bbf 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -381,8 +381,6 @@ static const struct snd_soc_component_driver sof_probes_component = {
 	.legacy_dai_naming = 1,
 };
 
-SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
 static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 				   const struct auxiliary_device_id *id)
 {
@@ -475,7 +473,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	links[0].cpus = &cpus[0];
 	links[0].num_cpus = 1;
 	links[0].cpus->dai_name = "Probe Extraction CPU DAI";
-	links[0].codecs = dummy;
+	links[0].codecs = &snd_soc_dummy_dlc;
 	links[0].num_codecs = 1;
 	links[0].platforms = platform_component;
 	links[0].num_platforms = ARRAY_SIZE(platform_component);
-- 
2.25.1

