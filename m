Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21466821D5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FFCEC6;
	Tue, 31 Jan 2023 03:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FFCEC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130669;
	bh=TQMlP2nPq/QDUPLRENOjCyTngOAgYkDlRcgvB7YXxlE=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ncz9xF0DaTzp72DPzY7ytFyCDvcSi50OVBF0N66FG4PbYmUshfdarfbhuXxPjKeB/
	 cSuA/x+tua/JR7OR3v13FcoupIhIfinGzE2836RxPzhndumagqJDudPtPnk+nihHVw
	 fyUn1LXLJa5pYe5HW/R/pwChX/7dW8nq6PMBYl74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8890AF805BE;
	Tue, 31 Jan 2023 03:01:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38122F805B4; Tue, 31 Jan 2023 03:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::728])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D1CF8055C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D1CF8055C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YEtiY/yf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVboyIKgV65IEA4PmKROG7A7HRUL5jGNb0qB5KtgR2+d6oVUBTSOrOKo00ESkWKPXcJKZn2AtoJDuGU4csgmxwjWwt1o2VzOREeVVCG79trJWa7bCqOUvbF172xNZL9ctFL2f7Qy8m12Dc2WUM7QROvgxWl5BCobh3aeomWXWqJFUxCKGYMeO6iFVO3SZsul+2qEh6Ali1gV/QdgjmaggRT2fkmYWzgUQHivL6xmndykG/97JVgpKRrFwTd007p/zQo3feGA6MdTn5JesTACVGW68Oq2usOtCctG5BfwDPUxR5ZUqIMFPQTovnsNdcf57BrW4mFMOFvokY5ZiKKZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=PPZvf89YGtO8ScFAnkW/8RlvwzlM9K+UPsm1ctRfe9rdt3KJS1WHCxH9zGIuPlXAe/rjzGBX4dbcymBM2ePzTlzYIuWthNcphDKy9R1yDWqUdVLZttnc7tdQzyeFogbTwBfj7bGljV6FEa7xWEeCRrSaILfo91/n7veWXiY/A+BHxHF1muGOeV/dBcaZK1PizjwHrexzppevIyfJYvrctl7zwox+Tn4WLXz6l6oGiG2v42PsfI9/uRNrVplSmxoHv25GWOX1vZyX4Lk/LErWWbv9i81XmuOd/b8ak1LG8OfpTExg2CXjPiYTIOF9ckRUUEA0pX9vpFtm9Mw225r43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=YEtiY/yfZLwZh+ZC6zySw01Gab/W/81+O4faSjVpLDYGTYPIi2geCYDOJisr+cIFrunZsrexdk3K/6Opp3mWG00HDDrEhkW2+VJ2OEE3SINcpzAA06UBIXoLV8F2+rxEjJfvTSCg8cnAW431dpUtK3WHom5xOfQQZfp8Pb2GmUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8592.jpnprd01.prod.outlook.com (2603:1096:400:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:01:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:02 +0000
Message-ID: <87pmavea3l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 16/25] ASoC: rockchip: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:02 +0000
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2470ed0e-7ed5-4903-dfd5-08db032f017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SD6bwL1Ir6SfYwOw1uxjPSd6iPTO/Ftjqq7/FbYzBy6M08OKLLV94WrciYaXRx+WGLMM2oKpOPsTvLQrFCeP/yX+Lqfsgo027KVTs/yuk1xd7uFQ+G45gHeBjHO4bZFbLvCnOGPX5LI0YYZjAo+349sAQGrftV5zQb8ghiDSat7ponsi3v/+nd6dhzZQiPbl0gO/Ipnt209ZYwkaP36wZTGZLakfS0EATDOI12lu7cgYa7cmBU8ZOVr6gnb/YdN25tAxAtyYK2ObR/U/q8C8PtesLNF1ba51uCCynh/Iowhnx650qJHG4QeMgouhLG27xJR1moWbY7dmZVxNrur7c246t7xaE2vcGbknHISG1Elw71hV+7/ecil0hajxemkbqDvy2JFx8+MRxunzuR4ITyN7Jl2cHSYiPvbYVjpwSGijyDtP/Cs64al8In5ff8orch4e+XuU48gGz+vJdQmd5QuaTpZ/maMc634kLrfWYAgIF40LvhHA3P9uB57F6dDq+cEuoYF4eoTQFz0uRFJVHT0r7p/JfW1eHOf0ACffiPmXREMAsh78hh+aPz7wTp43P+OOoq0/IekMiSe/xp6Qt9HnI4wuMPPzIqhG6BhTfbKKMg7TBdHjG3aF+OKg3+zOk2qR158eILOiiwP/mDMFwIYZM74yG2DHANMcof1Js+jPeAPAr1tzy8Vlnp8z4W8kBdHXwyxQiFSdO5aS/7Tdgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(52116002)(6916009)(66556008)(8676002)(66476007)(4326008)(41300700001)(66946007)(8936002)(83380400001)(86362001)(478600001)(316002)(2906002)(38100700002)(6486002)(38350700002)(26005)(6506007)(5660300002)(186003)(6512007)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HIRTxsQigPyCKTUcER6CwBwBy2BX6jOWvDdnPlAxLPfnxWvJXMo29sNT6U3O?=
 =?us-ascii?Q?DeE2t81hc5+rD+N03QxaBM2o9fNwD14sXv23y1HqduDEK+2DKiA1fmo8Hbb6?=
 =?us-ascii?Q?x70XWaMPJHKn80w+9U3UAaz1Yb1Ry3jlTerdS+bw8dYO2hSqKbpGkgCIZ3wN?=
 =?us-ascii?Q?0KepBpgLdvb4FB7rMK6d0cGXFT5iixRHaFuYVcBH2N9w5rV1v/Gkcb1FC9wY?=
 =?us-ascii?Q?CD8LcgTI3Ub39CbpakDg61Yo6s9MweSy/rDwmyTLQVOwaYStxsKaJG9iAEIO?=
 =?us-ascii?Q?/uWVACS66sIldun5nmuvTLdAHT8JzOF0thsmP9kpmZIJJRxbNhTk0ZamXBcI?=
 =?us-ascii?Q?UH5KTEOhu5SgYltm9JikkNt6KFTjFsB0KL5ImzEh+M+3VBeM/kKG3rNs1IrA?=
 =?us-ascii?Q?RLtHgClUqJb4ct81nfJFU9JMgXjkoYkzVrV5QHAn2djyBNvlhLuSPt7eau9W?=
 =?us-ascii?Q?DJ6WPDKwAR1dWl2k1tXNZioX91sUgqFvJDmB9vVpqeJRRMwqhZi/eGFk1CO0?=
 =?us-ascii?Q?wdfi8g8NFc+AgHp9iAZZ/DHg1TuvtOa8fMIOSKA+2LRc80Eih+ljk7IPUsYm?=
 =?us-ascii?Q?SZJBSkLGQfBYa+tFcNMVbfXbsFvRh4XzAkKh2yr6R/rWf3g3BmjYMZ5jl8zC?=
 =?us-ascii?Q?GCDdMfc/+T6I46F6q85MCAVcnwKCXbNKj3ZFb+l38q01VmWinn7KOcW/FTMN?=
 =?us-ascii?Q?I9boh6BXjTXeAFsJeYNt1K6TLAyEfZDIwi1qb3yGu5+vVSwO84U1uxyiBcc2?=
 =?us-ascii?Q?GP5xRNS5Xk4IhZVAmAsUu9YTk/uKa3rFiq3DQHs23gD7uAcsMWqkH/CGj1Cc?=
 =?us-ascii?Q?epnjO+gRsVNpKhTK99I0M7DBweZSd/hD2LIF9u23hgBWgMni7+J1McRX2dcK?=
 =?us-ascii?Q?5HHZkUn7Fw9WFAqRsktNFPrFq0tMtnKUuO17di/wlCT9rsepCnI4r6+3sHoL?=
 =?us-ascii?Q?BJ9frXguXwxkHx1OQqWvk7bwm9Xmj01j4Ee35zDck0wp4ln7sAulXSOxkpEw?=
 =?us-ascii?Q?0BsXFbuMgaGrogUR0ggqdtH4fWAAw/kPaQXC1HBKlXQhjvoDlJr+wAgZll/0?=
 =?us-ascii?Q?UTV3RozePg5EPfpilwa25U8r3svv/ToOuvLaH/HoaLlSGSiWhEKp3xn8ppUF?=
 =?us-ascii?Q?0CWn8i//Yhcclb648mYEzXdCFk/J9GSGlcRolxVWoLsi6Y/G/NvHgH0kLUoI?=
 =?us-ascii?Q?x0BaXVU24fxcLC5+V6ymF2wwV/PcrkUKUTIOpozz3UCiEGQQoeJ44Tq0KiCP?=
 =?us-ascii?Q?iyoKb7Y0dd47O7Gk+IiZSfRIbVwd75TZLwvuXXKc19KQVduVapu0u4DXCTCZ?=
 =?us-ascii?Q?wPFhHFrJD9rPMS5Z34aK0r1noMOwcHOdvI7F9r5+toQPOCqo3ckBhhdTs7Fc?=
 =?us-ascii?Q?qCHfMHplHFHFLQCe0t1y8/gYAyyrqV6v0sk06nCGE0+8rKclW5DFJKTmWZSO?=
 =?us-ascii?Q?oWpdyGSXJsfHRKxSh45kFgpPo410SjULSc+LE17zLVcNvuedhfnVYIyXe7AP?=
 =?us-ascii?Q?5/f7o6ptVTuUI06+9nwz4KQ6TECkh9FYe0Wo9ByKhtes+M21rl4hIpzPmJ84?=
 =?us-ascii?Q?+TiDVs3h57ikzdYUYUO7cuAp1nGWj6tuLdHpE7RDUf5JiZGJm0q+nV0vaSsZ?=
 =?us-ascii?Q?OXLpUdqllDr2ArDoi4mN5KM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2470ed0e-7ed5-4903-dfd5-08db032f017d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:02.7211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9xOMDU4kM4HzZ8Q0zo7qj1dtJ+unLkxmyeJJ3+nYDUH4cDD5PCJlqw3StqRR37kTOU9NjR+x9fINpV4mdbawUKRh0KLC26WFoa0hdsXovG8VJ/d8ZRim4E+apjsguxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8592
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

