Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA08678E18
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:15:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30D6EA9;
	Tue, 24 Jan 2023 03:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30D6EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526523;
	bh=yQepghdZrcvCm7h4uwL/PRBbPFACmaaDrTIVfJGtGow=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q1nJzdRC85G9uLdZu6i2wiHiUOSW67aDQedT4nwIb76zbvkHXFPFTI8wGfO4HxNDf
	 +/yWRhs5n2oTd8I1a/Bh6vDez23yvJNemkynvERtCVKmSR0CjGjUPWzNTzP1Lt8ze/
	 RCFqknGcIEcs9oBeyd/5SQ1hrCzUIrOlyqpqT0c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A16F8027D;
	Tue, 24 Jan 2023 03:14:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B104EF8030F; Tue, 24 Jan 2023 03:14:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49AB8F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49AB8F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PSovhrmj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGMFveCi8FIhtCHjbkqr76N4GBnecLxD1eLH2NvefO+DBfAHbjUjI6FIW3RzLkg/LmE7WdjwdMuwjg+Zwd71cqx3JOGBxseBCovR14xDjufXVF7Xh99EjXm9yXGWYRteXKbYHwuftVWmAkec5qsfMsP/A9wWE4rt2qN4Fk3Hsy7by6Q7Xt8OWm0kAa5mkGq5Q8iit2G9lNtiI0j/vWOyvAwgRp+Tm3pY+KdlaPgM+uC4CxKxBskYHCeoKfsEBOX9LXd4nT3D68dvSSAZ5PENhXJqQsj7WVrWdWnhI1adlqysJS+v80mrRyW6oN0SlGvR80rg/Z37lK/YIx7lrQATnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=Syx73CVxQMekMyj3wGljzuJAnMzZDKKPL/hc0ZexnBXmmZgXdXv7wEhO3MzBZyBiNo1R/QEPxYgAtgrd0eJtTna2vUam/bTuYopihzM1nqpMsOoVySnwMyDiQYGkPYK9KErI91OQL2FmpVAx/IWkZ2172k1ExhAYh1U3r4MxkA5GgXAypIit4S3NdbJSL+4N3llxxvVVLiiXPqy9sQr0lqVVZuZ7TF/jintOzFe6gFWPE1rlzbwN6kVwvhVeH3qwP+WrGg2oid3McmEEXNWNETUCseXK0zg5BjyfLViDmc9TI7LU3F04YZ8rgTY+k5XY/uy/fcWhf4nBfZiztNGYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=PSovhrmjYUdWxj8+/99kcZYH4Ltly0SrlKErSrO3T63Xu8fUzjD6RofkOj79PDxiCFLw66SZrZXbn8jkuopUmYsoRO8cBHEQ7anURbOkUeE57m0ooopn+UgrPilFEJzXP3YWspmJawV4d6NiSmSjsOO90Z9EV8H6nR/et9WTRtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11127.jpnprd01.prod.outlook.com (2603:1096:400:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:14:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:14:23 +0000
Message-ID: <878rhsu1a8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 18/25] ASoC: tegra: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:14:23 +0000
X-ClientProxiedBy: TYAPR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11127:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cefb59-acf1-437a-c141-08dafdb0b5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZJeWKvgTnS/Kul/gSTxiwC6YEz4FrJhIHQaTuA+52hs1VyRDCaTsP+dYbPJV0fAEXv9Ra/JAsFdtly8twhFnmsfwvD97U11w0UMvEG74TNZcaLjpf+KFb9wMRS9nLEDrsUt0/1FOUKWzSuHmXFK0beyxLiidQkVkr0VxnyNA8o2UfT1QgJySAYLXfrVesmxmydzSKTZ+zLAb0eo34QmehmU3uz6np1ujRlBxYpf6oP4apwPGeChdrSamanVLJNmmI6c7Be0kCTyovpdIKp2dQAXzo+qtsiO3pMKTXXOyJlTKn6wegGFrzLtWANtVleRMw8B+JeeTrw9LT3Zte1PH6z2Cau5MypkErY2eUtMzKn1+JAmz+w/Iv3KvoM3iVfAfF7Zrb/G2TYZxEiQSPVraCEIrwqzTwK/8lbUbPZcFA55hQqR3da3tOGlVW6nYLBXcVBl5Honw4ug8hdcKMO6mNgazPIG2eUr8wzK4ttzZq7DAAnH9kr5XIbpmEX2hMqF4/R6HrNNizGx8JcVStXXZ01b37Mp1uNeb/CcOnQfirtSgdFAvFtbNi+ji7zqQyIIzOQVUpTPF7xCW8Ctzkg3vFzLpZeIVGQBZvrrZD341rAvGVaaeJ4jEUDSHuNHgqxvZN6IKPhcAn5VICeD2Qo4Ya0jWkAhLLGLJdW5vsNBzt/uYHv41/yNFe/IYt7Reil7EqQzUShkoNVsJZ91/pbTkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(8676002)(54906003)(316002)(86362001)(2906002)(36756003)(4326008)(5660300002)(66476007)(66946007)(66556008)(6916009)(41300700001)(478600001)(6506007)(83380400001)(6486002)(8936002)(38350700002)(52116002)(6512007)(38100700002)(2616005)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mlPpD53nWfSbKUqmPh1TLa7PHhlJ6CJ8pkhaFt1ihzHi7FcgwI/PS0Tz94g?=
 =?us-ascii?Q?A1xnlrY+7dPSUYY4unnzBGnVReJDKGNFDaFWwfk/zugXam88WXeRZ+RpKiwe?=
 =?us-ascii?Q?KkL/b0Eck/HW0X28FxYU3e0zqAd2tDwuPamavz81DZ3esy/PpuDmROZgqoxP?=
 =?us-ascii?Q?fXp+QyjsYQb8EDWjVIfSxAhCbmGwJr3JGQ1AgVPT9I+Cx+NdWQ4ScFRpz599?=
 =?us-ascii?Q?eV3xGCBC7bSzrK+pG4adgTPWErDM8ajY+3vXBfXcMGMnica7leFhEnU2clvF?=
 =?us-ascii?Q?+9jRLjJwTKASiiKpYAVcETZXgPjGdwA86gCgwVYvOtNTEY7YyjUS5zgytcFF?=
 =?us-ascii?Q?i726E0NxwJ3v5CFz04X1zRbxFBSzWdmoBCIn0FdEUAnGLiHohxHv6Xcdaf5J?=
 =?us-ascii?Q?8EaP+jIfHYgE2gVDxLrzT9sYRkIgHLw1U90378klI8/Tek6EwcqXF+dqh+qs?=
 =?us-ascii?Q?u249RLamnrJjWfYDYaNPWZ3+Z2kkTR52XDpjYboxsgclhNSTQt5pgXHYRJ1u?=
 =?us-ascii?Q?geGGLuxIua1sKuCPdrMMd7N8ICna2odKPZELbML5WIK0JWZSc+mMFs33KVZ1?=
 =?us-ascii?Q?DAgm8EIJ09xmNFl6pUDqtfDTIueW5xfW0FrlbKlfYoFUppRizC9cvSAbvK/t?=
 =?us-ascii?Q?DoYehO34QHMP/xjAV1nkQtKKEZSyeM0IrGtCj5p2SkYxF0Jv1vJLQAIwZ+pN?=
 =?us-ascii?Q?ccBRL0gbj4nn1TV2kp2xKp2LbMELetl9DpAR2jPBTuPQKgO3yTXtH98tDT6m?=
 =?us-ascii?Q?NKBc9ENqFZu7pzxJCLj0LcbkYckxUqZSp6ZuTPRWvIaqetjKOtCEHDuyo798?=
 =?us-ascii?Q?tSMGoMKIZZz3mGgIYhUhplJTHLv7Hwl3SkvMU1PNf2BOXHJOfvZA+mKnDcKz?=
 =?us-ascii?Q?JW1pB/air7AapvKE1Xvy9zae3zEwjIfgYpZxnfqr2ZBpmWJKofJ+WdNsfZyT?=
 =?us-ascii?Q?iJr0MYeO8wmtC83XAAMuWFX9yxEgVt5SDUJ93VeK1SxT5QwX9oF7Z8SlxCDk?=
 =?us-ascii?Q?IAc42+2ifQvoyDXdihF3wTo81YPHocAxUeJEPr+vcUCvnY8dNbJSObpCTNrw?=
 =?us-ascii?Q?LjYGnaJPtZDT6RHjUVBL4I6OcOcuM7xvH0wCeaxZZPxhaBz2WY4nVZHz76au?=
 =?us-ascii?Q?H1k0n1ntDRcj15k7ajQX2Cl16VW79V9if8pzP/LVUQZhyIAuHQbSvUZ+4LHh?=
 =?us-ascii?Q?ZnLFqt7hFhYjXGt+V4VTNhujFj5zF2ViBmRD0egNgEoj2Wtf5bfez51UGdE/?=
 =?us-ascii?Q?g3/GiYqrNPhlrMu5niJgVx9Rupk8wBio4BL6LFJEgLgMO4NqSUYziiqKbSMB?=
 =?us-ascii?Q?4VyXN6IOYYIMMqmOg7uwA1+4CGlCHeTn0popuJgEsH1eHg0vExT6sPUtgCi+?=
 =?us-ascii?Q?Heokcmy0wjPDSonQeF7rVCR67PODesRnJaRDOwnrKGHD4Qp9MoOWbisz2C+K?=
 =?us-ascii?Q?Pbkt0T6rdVDIgNtEh92YHTSRMnEL8/peg1HqDiuBptTAeHJTyi4Sd8F0Efig?=
 =?us-ascii?Q?AG7c1g3jADoEpyd/wv1Z86r2uo0718YrlAt5mW33d6iJL2mLLcA08W/VgMYH?=
 =?us-ascii?Q?zCI/nmuIyDSasnD/aYXlMQH7fiFebVCHYLqbippWkBXm7hIjjvWbZB7G3Xj7?=
 =?us-ascii?Q?oChk4PyXJ7fTJR8Ai5xEYjg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cefb59-acf1-437a-c141-08dafdb0b5fb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:14:23.7155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iLFFa3OuN/LILIgw9L4PdAa8ZIk5d9QBxE+efW0deStSSbo4dZgP552HAxX1uRDJth+jsNW+J1WzPuW5tWS1lLxGvMbc10u3N6TrTbqco+UStkjENtFbZfeL6evr1FG
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
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

