Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7A678E16
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7022DEA5;
	Tue, 24 Jan 2023 03:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7022DEA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526478;
	bh=TQMlP2nPq/QDUPLRENOjCyTngOAgYkDlRcgvB7YXxlE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U+o9R+h67BsUWZB6AT7qAlanqDAQ0ZOFUtmfP7LQ/OmXtYPGJJdVQBBl1PLvzRpUP
	 DzjyhAJReOK2/RIUI3Ga5CdF7hjmdNBM0zifzuemz6O1nRauWQSIogXlmtcMd55HEA
	 bQpFYJVgnpj6FCBadpEHLtKQhgLyHbd0k2Yd/Q3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D14F8053D;
	Tue, 24 Jan 2023 03:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6045EF80533; Tue, 24 Jan 2023 03:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF22F804D2
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF22F804D2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K7t3N2BF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrIUFrVO6mD+hdINRSwr9pTSOg5mqGM2fNKo6WWAdlVjy7+U3bID8/QGzBywoD2J8vc+SYX6YK6dagOnqg7hpcrqlmmakWzI6/RkbmlCOLXDwExd1xNeYF2yHwqa1dMeI4fpUroyIWoVoxQ9LkmulwkTOvHfqxSVPjvaRBLmVOhwFjzdicokMBRTlT7hb49+9bjb38EO42U7msI3zqveUaz8d6lPJU7EQ48vk3p/TRUYNieDNve7aUjb6iQHxhXfiAnTLvOKzxrBFOa1C42vMHqQi1x2EeXlVuxBORXO2VcIbILb+wETlVRQxyZwxXPXEZE2IUx56d16xEAba5KlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=LQyH6Qj/j64tfQmQUvRBKK8B9Ld4IZNtibo8ZSWNcAj+d9MnACOONaFZFV4sYWvQ7QwoouQ9zw4QrwljRqa/bW5SUO6PlHDnuI0N0xjkjs8dRqfH7yysyuXO42K0cMqT7bebdpyKbDN5pC1vEbCkl/71iQFCwAG9L2WnWyqgvS2YyXDIsvyQ/jO51jilcV9w+1JYAiNU57lP/waZuk5oqyfa0Me//hMYRFF+r67AZ2dPEtubB1fjCmyesiTFDgx5UTaxTFhw03pgMQwu9S1LqX2WKa+I1yWAG0JzByH7UF/TfVjoIgrEJEoTqfIo/l83TZ5b+oO1lU7zgjQRZGsODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=K7t3N2BFL2JeXhuGr8N75bMPwEdEAOB3ylgVLmI7ojM9noRCcg5X0OrjlNZHpmWWbcELTVnQGNLWlxNIyUA8X2MgiU8buYWrK8Z1McAhg3uMobchiOSqQT+EvoDYsglvOqH2vKlfXjDamCRuMgKzLkHLOz4B670fbltMIdZraP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11127.jpnprd01.prod.outlook.com (2603:1096:400:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:13:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:13:37 +0000
Message-ID: <87bkmou1bi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 16/25] ASoC: rockchip: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:13:37 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11127:EE_
X-MS-Office365-Filtering-Correlation-Id: 727b9ad6-284b-4bb9-8038-08dafdb09a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zmod0TEBz4AOauoVHkocOzCq3pJaEewAUkQAWtg7IjbJAvQ9FJWCIbgdwHC/pdmJbUxjfVAL1PAmoutEul8yoEANeQxeVT3pPhzNxIIp8OArE8Eildd4VWQsGFvhvKhtkLzv/J1PYzhFHs+9SBdTr+jzf3SONf9F5JQcg4SfMvcgAsEvbwV0k89dgYrQO5P0LNvxfa0gs5lnFEnbLsVL6NyW06W4CuVX05htiqeZjfy50Xj9AZLUbn6OUVdoQr/8v6I+mKkVFzt+i2yLA4JR/DaloUQ0Xrz0ETRReqrYgF0IpWSdY9PGmUQ6LT9Uyp8e6rRPErFDEKSlJzWOhnRrDb+ULLDoseFHFl9/Vy5DmyTJf3G53Zo1gigfuetZ/PNrlW2e47/WFqhCdZ21Jxiukri8aZHtxSUD01iRbnC/XhxNI1EMv2e1G4zJOqlpULy04ypmTIJHMKKJtJxoGcO1cFUJa2NlIE25IUX5WKAgwSqkYFr3sAna9HF6kPbvx+2orjbut+497gjoHpTjGOX7LiNL862u0PLnKAn5BaqiZDfWr2wjqDrqDLWju+wOfSkUwkHiqkwt/YeVXggfA3cDFPDQL4z4jOUODzh64WwiX0EUMGIvbVv5EVTPiSCUC+r/s/JTKE2Ycm5n6Edn3NuglC/pAqEVDmvzeAuGIGjhx4owVkIlBi2T1f1UVzXSPC4pyHvZgvvUFhB5+p9JvoLklw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(8676002)(54906003)(316002)(86362001)(2906002)(36756003)(4326008)(5660300002)(66476007)(66946007)(66556008)(6916009)(41300700001)(478600001)(6506007)(83380400001)(6486002)(8936002)(38350700002)(52116002)(6512007)(38100700002)(2616005)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09sZIv/nH9klEkQAyIFctc8Ed3UuQ2ZWaFU8YEFsvJpUjCJ5f4EwAJM5eHm/?=
 =?us-ascii?Q?ONscF1G5G3W06EhFW3pe3TiWjCzyJvEsBuHvfJP1qjY2dtctZq0xgsQB9JRe?=
 =?us-ascii?Q?9M/DdHDy5Bb8EVrj9k1FJ652Irnh35P6XxCNfH8S4Kr9KpYP70MUnpY76DU4?=
 =?us-ascii?Q?lwFun7NJ0FxHtMgFV+w7NZC4i82mtPfgHAUFJXLmArLpaTkedoAzBaHK1I+q?=
 =?us-ascii?Q?UfXdGUB9hdAf0SAz6ywJeiGmatZlZ+giP8fS40otgeBuTovHj0jz51pw3bgG?=
 =?us-ascii?Q?qXEKZU1WB22DpaPgi0FfM7QwF4yObOx1/wO7Y9pBLMYzd7PbWrtjzgqTzv6r?=
 =?us-ascii?Q?lCCdNCZK7+8fxzksWTBgxHOTu1mEj/ENBV9W1sNlJsuaNoY5i76II5wQ7YLF?=
 =?us-ascii?Q?zMEp1EWNx3cTEqv7cghmEEgAY58OLr+AEbfzon0Rpnc7hswaPkJRT/iDykpC?=
 =?us-ascii?Q?Ckss1JQ/Tfc4c4968y9iPG9z5/toLyniea3rkdwZ68Sphwo0HImRvsPi0KJE?=
 =?us-ascii?Q?fJnIeRK3qBaShQDhJ9nVCcRG7abGNISwGhaOjU4jKzQvSiJzwC0AwQv0rL/v?=
 =?us-ascii?Q?9+u7JerJ85n3LjRSO4AJBF3VpCxu/ph91jEnDo8mht46DXR9HTcV4eqsxeOe?=
 =?us-ascii?Q?EspNBgKXtBYDAC2BFbzQPNhNGhvZQKOKTIvA5M3XUkhHp4w3UU4624ga3e1D?=
 =?us-ascii?Q?4wyjqaoWC1sMwZSQ1Xfd+m8WJD+vj0GZJrltUKaTMLJSQ6c7PdvbM6nsFxj7?=
 =?us-ascii?Q?wK0UVI9ZacBs+O6RnwTo+tdSK1OrBBKEMdTkFXcHzl7tawa/u6LR9YaZdOtL?=
 =?us-ascii?Q?Gt4+7kTF/VzitRelu+FsHiA9bjLP7vmowU9ss/a+9YglFWzccFyS4rTEJP1I?=
 =?us-ascii?Q?MjDZsNs/WPB859RwI5/OQGzlCdbpMHdPCMOa4X7SM7WvJqD8/lIAsmYyMR8f?=
 =?us-ascii?Q?0/a97oKzL9r9ixqQ0JBDz19YLES0n6JTqWFmxGX3owgB868q8i2vGJEsAVBn?=
 =?us-ascii?Q?Miq6G2kVEeg3+w54Dx5X8F+TYuyEzA/VZuatUUch9cjda/LCB4Fhtl6EeauZ?=
 =?us-ascii?Q?VCKUn34XEMs8KdLn4m5QOevp2vu7IxlV2xrhr5f+O+1WoBa8Bky+TKCxBfSi?=
 =?us-ascii?Q?bSw43xXpH14v6K9YdjddW0mXQo7MITb45dwGQiY+36pRjKHSXZE28fO4+Q5c?=
 =?us-ascii?Q?XqUU+iR7VAJa/IUrOF8KSb4/UiqfqG2fRDu33ZtH7sS65LXqj4FlpjoPC7XU?=
 =?us-ascii?Q?vAILD4cc72WU4+bOlzqVsfglGteTgj4dKPiUU9/miXqLM1SwhLxjS0gQV0mB?=
 =?us-ascii?Q?e68AimWgquJfDncrcPbFN8v7IzLalp5ihJxf8ty/74NuTJy801v3+7MiHy8V?=
 =?us-ascii?Q?FNnntRIeF/JwFUqFvynHA8t5fVfWS84JWp/TIIGn0/XLE6BK8IP2fFseyzQL?=
 =?us-ascii?Q?ufeZkhE19RU/8Frvp4uW499SepIdI8KpGv1gSNmTU5eodxlKc38ebSHx7Rh6?=
 =?us-ascii?Q?Kl0dqbZiV7Q4dFN93S1h8Vb0BGsasbA+hhkg1/J2QkswGOXHqqaGvvh6MMMk?=
 =?us-ascii?Q?gdZxUutkWRSC/rlSG1UkaAwsF8V5RZDpme+Y2ZwxxEFVoZ2h1kO4oBKw6h6Q?=
 =?us-ascii?Q?yLjnEJJSz8q2gl+F2iFznt4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727b9ad6-284b-4bb9-8038-08dafdb09a8c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:13:37.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwH3tRnUY7T1D8yYp6PVNGrL0tgd0PojzLb3A4BrgCkcJr1IZnsOp0lhYvvIueU1pkiQHWLytDgVYFf+c1a3ik4AA9iYdf7Wpo6qbvp5R20lXUY9K4M2THqLp/1h56X1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11127
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 4 ++--
 sound/soc/rockchip/rockchip_pdm.c     | 2 +-
 sound/soc/rockchip/rockchip_spdif.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 08b90ec5cc80..166257c6ae14 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1070,9 +1070,9 @@ static int rockchip_i2s_tdm_dai_probe(struct snd_soc_dai *dai)
 	struct rk_i2s_tdm_dev *i2s_tdm = snd_soc_dai_get_drvdata(dai);
 
 	if (i2s_tdm->has_capture)
-		dai->capture_dma_data = &i2s_tdm->capture_dma_data;
+		snd_soc_dai_dma_data_set_capture(dai,  &i2s_tdm->capture_dma_data);
 	if (i2s_tdm->has_playback)
-		dai->playback_dma_data = &i2s_tdm->playback_dma_data;
+		snd_soc_dai_dma_data_set_playback(dai, &i2s_tdm->playback_dma_data);
 
 	if (i2s_tdm->mclk_calibrate)
 		snd_soc_add_dai_controls(dai, &rockchip_i2s_tdm_compensation_control, 1);
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 5b1e47bdc376..6ce92b1db790 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -373,7 +373,7 @@ static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_pdm_dev *pdm = to_info(dai);
 
-	dai->capture_dma_data = &pdm->capture_dma_data;
+	snd_soc_dai_dma_data_set_capture(dai, &pdm->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 5b4f00457587..2d937fcf357d 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -196,7 +196,7 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
 
-	dai->playback_dma_data = &spdif->playback_dma_data;
+	snd_soc_dai_dma_data_set_playback(dai, &spdif->playback_dma_data);
 
 	return 0;
 }
-- 
2.25.1

