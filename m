Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645E5B86CE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E87176C;
	Wed, 14 Sep 2022 12:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E87176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663152939;
	bh=EyquvYI6+4XIzlSz3JobW5dNx+X6qanS8Fsu2ta31KE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XuZv7TYKmTsG9THzM9fBb7URTFdjWLbFOIhNIvWsCC8hx5tTbfZU/FQ+beUfxR0fL
	 VmJdRlhaKwHfqiGxiZfKXHOwKIX0ZQtX1utAldTfx0dZmFpA78zS9dPCsgVyA/LH+B
	 11gQnnsONNNblO31+dWsucReEe1LGseAnYA6mzBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F7D2F8056F;
	Wed, 14 Sep 2022 12:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B167EF8055B; Wed, 14 Sep 2022 12:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63A89F8055B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A89F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="IeEqrQou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXVlLjiQXOeuRLT05m9bAl8LNrI4NPaSecsQQPYC4rjGnYJj0fboBVxJ+b+F/WCqmwvZ+TzpxmWQTRftxnZe06hFpOFwU8HbO4S8CvOJZahQd3hGwAiJohbmIiEGJCVZCcT+k3C4GGpSbvpqLw0XqKKoxBNLDASQr0vpoinZw85cAGpJWffo5EisIvgtRUeoyGdDeN+9wz3CbG9LgYlxuKuQLClcZYkLs9ZB2tx+vY3qwfU7b3V82lVUE+dqgcTrGS39RhgUtOhpDgVgqzw+ZBEsBD85UkUldXuOhP+mYtR/6VnUOLRXa7ku2FpnQiAQe3kxbf3IaBRLHO0v1ux4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHKoZ/w4g5hkrRVBGiXAnTDf8+HzWV9NMppMRUHKI9g=;
 b=e1Uy9Dpgyz9A3AlxXoA3Jd0pFnRxmZBWIVkdGDeimWNsgqMvV5eX7FuTFnHuA5y13b/rqyYg1DPVbEhsU14TtwRFgm53QMHNf0BTf2KPhN7CE7zrV9QiRia+mkFeDAJTSRpV/03HBK6EEi4/Y6VmNuzp5trEsgaA8d7SST5sbYB+AnAf0Sy2j2OHyc7W7Yp6PxrzPPthqBZ/5wrzxEGIw145+2AUkP0sy3hb69yXn8Eq5yW952dkvRU1948+XcxJJakyIIwPhep9I13V53beB2x7VLwZhrmE6m86OS4Nai2nFOm5ZwRki5n+aPeTCUrs7/KMSEbvC/xjlVw6wdU5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHKoZ/w4g5hkrRVBGiXAnTDf8+HzWV9NMppMRUHKI9g=;
 b=IeEqrQou2760IzAJ7hwoL3xuqRQrzJsVpQBApYqS+dfsMlSblR+mMscYADmD5U9Sf/MyNWOblCv4a4blcNrMg81nQ/CzTRrKRXTmpY5P8ajjyBlpIgQeKXcquJdxRe3Fbztuvhnn+IHrrTnlm5hNhPof/GIHAn84c2h8s9KMzTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:53:06 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:53:06 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/7] ASoC: fsl_rpmsg: Multi-channel support in CPU DAI
 driver
Date: Wed, 14 Sep 2022 18:51:44 +0800
Message-Id: <20220914105145.2543646-7-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105145.2543646-1-chancel.liu@nxp.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc8e88e-2bc5-4d51-18bf-08da963f4dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFmCg37VotNuGRuvFxOtRGGfgcbVWoR3RUspZhS0vj2snPY0zz6wysge/HZ3rS+ptSOtE12zX6he96mGwdhcLdras18g3BcDazWAE3S/Dd4budvyfqLEnyiIA+4CzvDSfvTGeNXiw947eTh/7am588xEa844v8eTu0NbvmAke0g/MguHEz8KdVsqWFQ0yaUO/MeZJZCkwNarhcZJ781O9Hc489vjRwUELmgUT4wM64gad5cP43qp9mmGzJtUNoQozlW9jCFPAONuShs5bc2iJ9ZItj8SlfhVKH013OMOrGmrq2nE/9tmBv3m0zMJM8fS4VV3xKSB1k3pV/+4Q6w8fxvPf2DEubIJx98Ryd0SndsMPhhhzxprzhOR20J7vJpyWiDSAxh74sO5KLt2DRlZk/8rH/o2v9VUgPDGjmqnqPUM9Lw82+zT24yoIXB46uecGtm3qqvG3Kn+tcbxX+xUhdMJIMmOpc56U8BXBQpE91wl4C9lEHsMe+OEKMLGe1fWlM6VZEkntJE84di3EJ8PfcTvsJYVOHFy1U2fC/pCG1acGCWumGCJ2aHq9xxB4YLUR/Zg3ZD2pqQEh9+MkaJO9ZOUS55aXYefqLVFp4woJO4LmmSbvkudZXHM5mGmrC4s1J7ZL9VRicJsYFmYLSX1OheHc9YpkaNphpaQNrpFqVc0nsnNXcSahff/EvovrbPi2sCyCPJzd2cpRbPLh8613xeVLl0RAJqk+NN1lfxcJFMaqMYqSRBeEgK97pajk8l2AqHPjwnnNqc1O628DJEC1AYwWWEuOgOCwSd5t3AFRtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(4744005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bR/uR+cmSElnMUXI2cC3c2StYrzocphiigpl29nGGiPNylwuRPd7EPjemsIc?=
 =?us-ascii?Q?O+fDQp4ZyCIQISBguhM81iAk1J/Wm2A+nHVmxrvyrN9DJ2ODqIOD656cHBca?=
 =?us-ascii?Q?Q+WLaoRYeAsv9xnd7O6f+MAK2bjV+gCfEnXZMU5wFZ5jx3lRMUVOYOpgar58?=
 =?us-ascii?Q?asFXrGr9E5dPmrG7XTpMStdHdYP3uhOdS3OHkuGFj8Hu5VsaD4Y70ciCbfgw?=
 =?us-ascii?Q?XBnu3nNdmDXoaL1IGcVwxoT+DwaN3IgleOO/HGKbGe7LFg1S/rna8CqgMt4f?=
 =?us-ascii?Q?UDK8x94+LYRNNBnZ3ozT2pec6D3tPzbdfxKTuOhCirSYwIYssVn/oTq2I56a?=
 =?us-ascii?Q?Bww5SrPqbZar059N23t7CnaSlBpc3d9hpELW7Yq2zzkta8cfEn4HEI33mMyj?=
 =?us-ascii?Q?ClHYkm8lhrM6qMo4CskiU1JVm41bd0xzs1EpzhrzuuUvydHaCxOLXQn3vXlO?=
 =?us-ascii?Q?JYDz5nzJNH+S6iAbRnxHByrUniNLuhlS2f/qLGYxAFDbnYwqmcISRAubdRDe?=
 =?us-ascii?Q?xLLvQng4hFmoVboExPVNOR40xBPsUmSUE8T5Gq9oqgQWl0Du0IU8i56F13uI?=
 =?us-ascii?Q?obtYR/TpRYa30yzDDZXf+9bZZVj6NuSBLhwvCFALoUZwz9ggFkDKQDWc1Ypc?=
 =?us-ascii?Q?cQ/GQRQBnuCBDzj4vwNbmYpYFii0x7h3LFEmKqGiO2QP8yjw4WtLCC5OpkIn?=
 =?us-ascii?Q?n0sZt96HNRMT0AsWWlkXjRKdlm82xrNumh5YIuzyr5g8ZPh4jOWp5o0Uyro0?=
 =?us-ascii?Q?HbOnQKMoLs0TqMYxCVPuSH0zZkCYWWStZEBXwsyPxqXz2izUxWLm451vmTUH?=
 =?us-ascii?Q?OvKW7rLMbtqDs6J78VNkTR12siOwu7D3uYTNtcYAcelanQA0J/ictz4Lli4w?=
 =?us-ascii?Q?nEllfh4KWLcyceYUj0etQMdaawT1dUJ4htnsEP4G7RpUkRvFnUQYeZMOdZzN?=
 =?us-ascii?Q?L3mDxzc8lwOmI9rlZqw1iKfqd6w+AlqjMK8NByyVrlr+QFJCrc7IlrmgzFuX?=
 =?us-ascii?Q?i1eVLjq9SSCFjx2V1Xd8qmskucxrbnl8XVn9FXPwDjA3vzOwDbzeFyDYwZwu?=
 =?us-ascii?Q?cf1jLxHnSGWEJYEskgqBt49q5UE/hB0lJB9pyIYMaZB4wYIV8UPqGO03cIfp?=
 =?us-ascii?Q?U4QNeOutqMAHKCGwznK0+XpFphNmy7ird6K+bNQHbDtfChK8Ee6kYHw2vOz4?=
 =?us-ascii?Q?wEnMyOClko09mZECT6v7RcnD87EOrkgItqCax+beKxm3TcXEJYnavhZ/rXZV?=
 =?us-ascii?Q?WlDDMfLHucMaT1fzU+ZZoMZICCWLoFVZltaSX/0AHYgHy3HO83morZwWBx/R?=
 =?us-ascii?Q?m+Ct8lOtKUGwZP0FSl6DzLu91fa8gI6qVIY4RH2BompPIE24R+9EGoK1calT?=
 =?us-ascii?Q?rt+WJH9ye2PVIMmJug5Sz8HbkQ/pEmjkVu8lFGhzIPB+Gc8aKrZKm4gjvDv8?=
 =?us-ascii?Q?0IFwxQcItr3yLuFsBOG64vqRotIJdI6Bx2oW1SenZEVlTUYdmqxwmKA6yHGa?=
 =?us-ascii?Q?YugOt1ibl6ftVQaH1CnZmpdNTK/pUut4A1BuKqMLtQ6w+d6V8oYB1jh2c86T?=
 =?us-ascii?Q?VlhibEONzWINB7rQ/NLhQkGelnZfTedgfWsBiUMm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc8e88e-2bc5-4d51-18bf-08da963f4dc5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:53:06.4464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFw4QoUzBS6BQLLykRj7jOeiTRPjSf6TccqPXAjsmRy+QupLUyAkb3mOsEfmojUlIjKI24h5R/JGc9XzEIZYuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
Cc: Chancel Liu <chancel.liu@nxp.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some sound card based on rpmsg may support multi-channel. This patch
expands the maximum channels to 32.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index fde3d5006ce0..46c7868a2653 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -117,14 +117,14 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 32,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_RPMSG_FORMATS,
 	},
 	.capture = {
 		.stream_name = "CPU-Capture",
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 32,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_RPMSG_FORMATS,
 	},
-- 
2.25.1

