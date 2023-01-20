Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D64674DC3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03302E1E;
	Fri, 20 Jan 2023 08:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03302E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198465;
	bh=yQepghdZrcvCm7h4uwL/PRBbPFACmaaDrTIVfJGtGow=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i84jpW+d8ympvG7Tf+Pdm/PcjUKg2IJInDqPuoao3DAH7KFu64FKdNWjeWxFoJUNY
	 kqPZIFkVlJB6m0SSP8Ri8x2E4Qd/Q1da7lg2i2Hn++TuG1HmBmOfh8Pq5Ci6Nk4uoZ
	 RpeybXms6OxeI9lpFs179kBka6KfF/kbOY2DCnOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0391F8024C;
	Fri, 20 Jan 2023 08:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7394FF805D6; Fri, 20 Jan 2023 08:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 740E5F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 740E5F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OS+mCJDZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW1cwxbhJ2TYZ4JkcmCzoAxXWszQLoKZaSCBF9KboMDRjgdQy0akw8NaLJq3RhMJx1S9GmHZA2UtWGmAnd54segNUMO6uHiZsghMlXRWQY+2g9QFvHfyc3C4BCg4JCb69cpNZM47ulA3t9m+yiOjpxA1tUnb79vxTjTMMa/K+Qce21q3Aqn+GERPIuiN7HfZKlmB3KJBe5p07e8MTBoPnVj22Ke/+VuZFP/adnbjKVnbtMznGl7sYaz7DhjxxRMnbIOKwT4HjDNCOBvWA4I8AgCv14mzE2t7O7AvbsGHmguwCAjUn9InxDwCx70KrQtOPy2Y6GqxAIxfXUqTtgiyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=Bz99/sh3UaenaOVUxDpUtO/k1ZrxTssqhUkfeCZnnAq/RAfKt/o7yMsvBBBIXsCI9obwgcUgd2ewsxqNp4qvgusjYRio6KS8sByZpkDDFQsrGpUL13NJffdNOVQPKK27o+Bw/ccCYNC3b2X7r0CaxWhQbaEEddr5uoBwrDuv6M4olaOAUCvG5Rmg0Y+7DbsFVUPIk0Ee7X4B62BI4dpYjxyyBVhTtENr5AUn/oZ1h/i3tKiqbz/ZarkPphxRL4+UdUva3bXZ+GUXw1vVcSUVG4ZE0FRX16bsFpV/rQFc8Rho3d5sc/doYyVLG4wRJ9qR1hdkNsx4j4yJFo4VBQ5PHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=OS+mCJDZQcJQaQ0YO4i9AHZnHGrD1/BHxAVTqqOSiUCE1DxuS3GCdQGrz7stkzZXo8WMNVqMbSFwIY+BTXQO6pQl1kgrOQDIwG418EDpAiSjMMwpYAX225mFzf4474IYZOEz8CyKDq23Zqp/k0RDhNo78BjhZfMNEaiTH/73A8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:30 +0000
Message-ID: <87k01hk7r2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/25] ASoC: tegra: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:30 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 8851868b-b3e7-4ef9-4fcb-08dafab46ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ZV0evSKLz7/2d2NsZu3RYzaOZjgFNYGK+WZcYw/37reCx9K0XTT9V+zpYCoGXe1eSGn1uQPtOlVKfZ2RNiuRRaJrDq4r713aaLU7ngr9MstFeLGxBZ4TROlzRT+PUHaw+Ph86MiKfSC4+Sxk5RgVSn23EF9RTQBuAaEVJtOy2oB6rdwBXm6hz6SQa7yTFEFmkDRzwp9ZOJ4KGt+CLIHzDsTItfltwHBNo9MjUruF2XH+5ms3C7+s+9KrHzXsO/uGJLyKWzF99luR0ZgVtbhWWMxSepi2R1/qaKRxiqAu012eECrtN6WqoIaBifaJJx6+oittfBjojdn57aHzYsFG0DeBAS9LU1hFRQQ1bf8CahQAwwsRzly1TucxZs688QKyycFSFdl9Q72pWnxbOTRBWeI/2Z2E9W08I4kB5pDYI2i3ArT89pmr7cPGWfVaIUdas7COhWfz9iElKCKRxSRusn2pyTvcoIWpr3tAmu3HGVJyjh9O3mdv0m0cnR0HdHI/v7TBVDJSUo1aW+FtuMHQDERgXT6fjYnlBFv7gqFmFNUHfD3CKwLbcuMYbASKLglY5nzojBsqCQMMzuVSByDsBSBrrNd/1HxRdOlCMW7WJXj91HWY1S18mMTTxtIM9WBlvft5XgjCZ/ApKE7ZPmS9pdOpXd3+MDMrcsYDiLhlzKLUm/GA7l3IgxoQAIhPFZl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(8676002)(36756003)(83380400001)(6916009)(66476007)(66556008)(66946007)(4326008)(2616005)(7416002)(54906003)(316002)(86362001)(8936002)(2906002)(38350700002)(38100700002)(5660300002)(41300700001)(6506007)(52116002)(26005)(6512007)(186003)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?25K3Kj0xGOaPIJ0YDAraZE+iuejH5Shn6fesIfu6pNdybXKP4AjxuQzIk62C?=
 =?us-ascii?Q?MYF7qXCgSac4T5QWKYn4ZrhdXOw/W9GeTkDqjxw4rfOGTlG47AYmvjtDrvmy?=
 =?us-ascii?Q?BOngcRccNkMjO1/cCpnoe3dMN45e1MZ8oHC+tYSlFoCEBpBhiY7fR0usHNuo?=
 =?us-ascii?Q?prtTFWQ2RwQra2JefPDy5jImu0QLBrqXFEd/yWTvKKoBnkhzeF303iLz1yMf?=
 =?us-ascii?Q?q5FeXmxuGgOiMxZ3gI8+6iRDaN1uJIRPjko3F5CqSLnpH1mbaoc1VRHjcQP2?=
 =?us-ascii?Q?we4jU96zUApjGMyXjHxqwDrXNS4lZ41SJrfe502cd0Z/QNz/1x4/vldWvlM5?=
 =?us-ascii?Q?4vT4Cx6aoRaYQ0rG3qdFOmSn2+91/LBl7NFzjE8eUi04JMwHdFEEKIEHimmp?=
 =?us-ascii?Q?E1i4+n78mfmuLUqb7bIY6cy08hQ3we6TOJrGC5OkUSFWOxPAEYaV5uwS0F8N?=
 =?us-ascii?Q?79HyF2yIxnFNjW1ehcqJLH1T38Sk9Cck272LUIfjuVB/YGsY2JDgIgpOYr2f?=
 =?us-ascii?Q?5D3Br/D6/uKK/UXnOYvlWIcrpt4XUPutRE5VWU+x0eMvu/tiWHXAM1zh+XkI?=
 =?us-ascii?Q?XLkeUjcni2g3FeIW0xT4ot0JLA0xZcb9yvpDTx10ZdI23Bwv3xx+UBVtTFqF?=
 =?us-ascii?Q?sN3i0gyN9gC0WaGvqSUaCKvOx6LB9Oiq8d/AMT0aTJ7OIATGqEadjaDqPn//?=
 =?us-ascii?Q?+1YWuD6IYefyj55lWNhJRVNRTiDfRIfqnmzOu7ms7F7PaVe/gH20/T/0eKwJ?=
 =?us-ascii?Q?z7GjgZRnYk0bPt1SKQ7+nEe4S1b4f9KldOerJ0PcKTX5EoQyE27yHaTkIzSd?=
 =?us-ascii?Q?Q8DGF+EuVhczrGDAD5LsJAvXAVXNnAj5M3nwdNtv1pwEcnORmpVWM7h9Cjcs?=
 =?us-ascii?Q?IM1mHzxhFED5L9ccSybD+LUovhraP7UMNH6tZfIm4X1VLPVwSz+tC+BJci10?=
 =?us-ascii?Q?FpltaXShULgB1Bmmi83fKBvTrnEbjfvQ9pesjwon7ydC2KctY9Btp+RX8+jD?=
 =?us-ascii?Q?nEKSbGRKmKyvi8Z+Tj+xbkLKEyR2svKclCBpIUT5wtWTcJJEpwiMLttRJXdY?=
 =?us-ascii?Q?1sq6MBkt0dVWGadH0uJYPUfaSvn1rHz6QuUXVr0/uldSE8c/ss0v74ylmcHI?=
 =?us-ascii?Q?TSn0S0QOVXVddzRQGbv9gmTG5b0sB45iqxRzuyKKVA2UgMC2rH8y+vMPIiv5?=
 =?us-ascii?Q?lWb3PRWB0DgoKRNmgttejZFJwqtfuUfYVxDqun0DHjqvLLNK/f2UpHr7idMt?=
 =?us-ascii?Q?F3iRy/iidTXjr0i7JFdeFw5kxpP9UVNRluT0To3tzQCfE3AWvNQDdxQ46tRS?=
 =?us-ascii?Q?xGrijKcU4TvjC3Eo4Ae2FnY74JDUTa09bDc7ML+nqeIilhIkNQ9Ip1eAvRra?=
 =?us-ascii?Q?1wXaF0eNLAnoG9KqgpeZbGcSzGuGzJ5dDUeaHAV7zpXECnFslIBx7z2kImBu?=
 =?us-ascii?Q?SX3NF+afOY2QDC2Jo1BmdBEVFShNr4tzmuTsNeJ/LMWZCOL8EB5oIYw/h1aT?=
 =?us-ascii?Q?y3bqweTrSBzLnBHgdglQF8B+mJK/10fV1p5p1n1K+wRhlYDZ3ZDXhgUhhczz?=
 =?us-ascii?Q?sKIiF2pjJEztivPJzSgMrpFq6v69aKWRfvuhfnrwOSqE5iZVfhOfEx2o5kvM?=
 =?us-ascii?Q?mtxgsFG/W85M4B/gR/HJYNo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8851868b-b3e7-4ef9-4fcb-08dafab46ff3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:30.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL0fVeOqfMr4Om8Zlviz/hOtnqEQDaRs1LG9qi/+XSAEmFOU3q16HD6Fe2M+WFasT0PTDCTYTKUEOkbFc6bkX9ZsmMeARRppxz6lcRuGk8cc6j7xfuhqM5w80RpCauhS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9821
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_ac97.c    | 4 ++--
 sound/soc/tegra/tegra20_i2s.c     | 4 ++--
 sound/soc/tegra/tegra20_spdif.c   | 3 +--
 sound/soc/tegra/tegra210_admaif.c | 4 ++--
 sound/soc/tegra/tegra30_i2s.c     | 4 ++--
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 87facfbcdd11..d23d88a10899 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -212,8 +212,8 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_ac97 *ac97 = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &ac97->capture_dma_data;
-	dai->playback_dma_data = &ac97->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&ac97->playback_dma_data,
+					&ac97->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index fff0cd6588f5..d37a9f2603e8 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -256,8 +256,8 @@ static int tegra20_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &i2s->capture_dma_data;
-	dai->playback_dma_data = &i2s->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&i2s->playback_dma_data,
+					&i2s->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index ca7b222e07d0..86bef54dfdf2 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -236,8 +236,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
-	dai->capture_dma_data = NULL;
-	dai->playback_dma_data = &spdif->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai, &spdif->playback_dma_data, NULL);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 1a2e868a6220..100a2b6e6063 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -544,8 +544,8 @@ static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &admaif->capture_dma_data[dai->id];
-	dai->playback_dma_data = &admaif->playback_dma_data[dai->id];
+	snd_soc_dai_init_dma_data(dai,	&admaif->playback_dma_data[dai->id],
+					&admaif->capture_dma_data[dai->id]);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 10cd37096fb3..c26f960c6afd 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -297,8 +297,8 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &i2s->capture_dma_data;
-	dai->playback_dma_data = &i2s->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&i2s->playback_dma_data,
+					&i2s->capture_dma_data);
 
 	return 0;
 }
-- 
2.25.1

