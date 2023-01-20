Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE89674D9D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 474D82DD9;
	Fri, 20 Jan 2023 08:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 474D82DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198206;
	bh=b2JQ/knpf7CkyEBrdoDWy3/6Rbbb4V3sfJB+YFPnkdI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c74yDZDo97kbABOIpCwrSvyUd0Ax9UvO1ECEo/dx5Wg9Ff1LhEVHWO4MvDzYH/KoL
	 e5IZo3RWmXVBKlhwHKTG03mHQli89v7xpX+LmzH5h8mANWqC0ve44vLu0lOMZhGn2D
	 xO/8uC1ZxtI8iv+GTOX08zLil2PalaRNoT86bUzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 024A1F8024C;
	Fri, 20 Jan 2023 08:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9094F804FE; Fri, 20 Jan 2023 08:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD1B5F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1B5F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d0eUaFM3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8qXj3eRosWx48muQDI8ii78spA+Q6t52U62TwlvnpuUBQVv/G+CJiz9gmh5Sb0cdIoi42BSHk25/5BUpMLfZkITXsP0sgHnqy5AdAgR9tycHM0QOTz4VclZ5lGN36tuK8jiaDEyXUyCcOye8QBneanxcxQMZ8HvKUiRrocIPVb4Zm6p+iu+z+j4jSpY2U64Wl3ZwfzZgr82ziR4GU08iET1Fv/BSyD4nVNj1OU5UK0O8crYZtLKyqfw31B+PTR1ugKO2hQAb/blHxZhpHudlWGQ27k2wy0k/N9Rc1lNHKUAx66rQagAmlnWIqwnhXWbHFMqI5oD+vRq0M9jTr8/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ok0rbOYBcQHGBDYHoohiqhhhPdvkD3njh6QlAmIPQM=;
 b=ao/wH/ncC0BGOac84zcW68aSykYSAowvBQzvS8JpnJUNH2RtVf3s0ihUjl3pBATOilQ5bfHan/Kpij8sdP0xfTrP6CuueTIEL2IivYko4SDL8b+MR0ohcP2VWVJL2xcRMlK0F9t88iZyw9nLsjJYIETM83H6/eHFhqmUfSIuR5KMqhuQ1nW3shwJw5rW5SQAYN7er4FPkGet6zYI9rKGucIBMhliKh2uFzThBx/hKRQU8hEFztAQvU0CricWzwBGa2x4Dcg7z028gJhvYk6hNBce4WQ13M7BcAaKLPMRghkner7/NxVHBzjCMsIQTPW9uSc1+U2iV/HtMyMeegPY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ok0rbOYBcQHGBDYHoohiqhhhPdvkD3njh6QlAmIPQM=;
 b=d0eUaFM3rhQFL9DKJQLJSh0ztz+x/3X/hUB/xLWopMKe9sPL1NkQWAOmYrVXocDd8NofJRgdcw04gFrzNjdacsMb2KD8UJJJBTeBSbZgTgeD/jw8rYtPC9URL8HJzyQ+V6wMwLZf3ZEM8ynqGwhDdApL8aCr7MJTWx235Z6wb8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:01:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:01:53 +0000
Message-ID: <875yd1lme7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/25] ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:01:52 +0000
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 92af1702-37ae-4661-6c9b-08dafab435cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NoZdGjfCt0wTSamNM/yVEF1yXrKQPwQujhva3agSm06L6+7YdsgB+k2uUoaF8vmndqqxt0cxda3C2kZdvn6BX5AfcIynTRb37xtYRV8tzBrBu1j9LcyjGIoR6xsygm4nfEs69UG9E22hppMlD1DyCFbilzjik7i4UUfw1EF3HWyQD1E2V74i4Cbra33ALOvd9/hBFcTrLvO0kLb6shWbtYUDuGEyESkC9pXNMwjPPa4u6iHaRYECKhBTTOoSbVtIZrnTV1MjN0XZyTuqs8GG1nwjMYT48TyJcD27X3Oy254vFlrXr0HAP/gbAh3dzp93LUd2BlCMhk95/zLJ+u5VSUenQJAlywOPjMLLO97fPkvnUBSQbpsRMpFlBnRPw65I9/BM5meJiNyMHDSVCmNCWu2CBNyeJNVy6vJY0quWS0BGjl7WQMnCTdmZWkFCdIZF+GbBFEUqMgnO058EcOCSjtGQE0kNkvlPXscjI5xgp63E1dR69leIXz22FQH/qgDeumxQ2f0o3Ra8QXK9nIIumqgS4f7LL7/9hlzRD1UwStoxyX2EkB5GXesnebuz8X+OD0lLiTTSmqaXyNne7z0svNpnGPpwFbL/STvg8PB8CKvO23n805sheUx72FmehxOOKOnnORj+Z1yOwAS1Bz72DFTaRkBlviZ89AHGEO74Cw58rtDmFuz/61gBHy3ZUBMQaT0uy8vCsmF14NGG3+ee8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6486002)(478600001)(41300700001)(6506007)(6512007)(26005)(186003)(52116002)(7416002)(2616005)(66556008)(66946007)(4326008)(83380400001)(6916009)(36756003)(8676002)(66476007)(8936002)(2906002)(38100700002)(5660300002)(38350700002)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XlK/3rrITvvy9mTVOrPqWntcZkx/Ag/iwX32QKSDsQqAduA9FhfnCk2X4ceM?=
 =?us-ascii?Q?CRvHE3RU0X4aB3O0VcfFa9+Jp9ZNoHJ35qjUFQlI8KNHAUSpWwkkIbCGfwYU?=
 =?us-ascii?Q?87z3fRds0kScFgazLvFz3DINK1sYVGL7N4aUrjlVDRFJ4ybaEJwVhXBZINst?=
 =?us-ascii?Q?L4Nj4lGMnRKhQVPY3NQT3atd7azwcALfYrr74HzxV2xeAFlHIJJCqDMQUiQ5?=
 =?us-ascii?Q?sYFnRArLqFPiKV7fcAWW6g6SGVBqBnntVu/dnjVS0Fg88EgClUBlk22V+o4K?=
 =?us-ascii?Q?ttufcmb2vv9WMhalQ3bY8Qnl6GbowT7izkQd2Jxyo1ODckKTZf9X7/bt7Li3?=
 =?us-ascii?Q?mrRNQoBtPreKsycgufWXcvtT+fk0rNidXsSD0HQLfdH/smA8kBDMT5J6Mfmi?=
 =?us-ascii?Q?/BEUflvcMdKWCfbOfwmIVF3uX2prm+IIQ4s7AGbQCUZwX17d/hLGUifx9vhW?=
 =?us-ascii?Q?rXKCLOAOCF+htgWuoXuCvkdtn4npyqgcgFSX/BKsrNlzvOZrsusr4CC2WfxJ?=
 =?us-ascii?Q?XtDBSSxr2tNvNSB2/XH1yPte+YgHKGciYevlVw1Ij09cj8LthnMM+slcl+33?=
 =?us-ascii?Q?nQyAItFPGskPKILVeHVvMO1/Nip60vtQlo/vTMLx/xNSpYKy1oqmnD9FkGMq?=
 =?us-ascii?Q?aaXTBH0lK064SgH4meoYjVFy4O/M6uGwk0EWO/Juni3YuCNXdu1aUPc90o7v?=
 =?us-ascii?Q?N/RyGg/Fs0vTpSEqgmh2tEOUcR4N5+mn6ccEcTS+J09OkAMHg49j58mfOW1Y?=
 =?us-ascii?Q?WQ9jdzHQ4cOS3NWa5pEuFp4dqGcE1v6YoJYu1CQXHBRipQNK1wSoH0z0Pba8?=
 =?us-ascii?Q?baseT2bul/sNot/prEHa63iEzK/he2vIep5ZTbBVn71HEOfBh0APLTR7UgEv?=
 =?us-ascii?Q?IzCCZKjJ+/ZUkIcYwGwfZ+LsXmBalkWFUs2ex7HcHs2QF2Y28Bu3lqPMNBLG?=
 =?us-ascii?Q?dqOGAgEaIbkX0rOBHWopvbPYYgyUUFxopNNoM7fpuiDVTSeMPpIjYHRwLspR?=
 =?us-ascii?Q?BMl6M5W88/6lU8BuO48bgHPQI/rPvnTeTPIDDWFw7JevTmUcHOsJWjX1FNE9?=
 =?us-ascii?Q?EG/KORJ7RhUb1xj0Nifbur4Vnuuku24ooB39TpsldFma4TmJENW4FY+Fn4FD?=
 =?us-ascii?Q?40L/e+HWYJfnrflwqIJA608ZKIk8CQg7iALLLKoZTyCQZATba826j08VJIDa?=
 =?us-ascii?Q?cNWIXv+Yl9TfNjUPvgdxz5QgCgtRLokubWbIrlLa8vYX2G1Uz92KvlP2ccYj?=
 =?us-ascii?Q?TPRnqC2N97crAqarcsaBJx4aEWLHmmngBgqxMGiiHzuW0VfsDcH3zCZI/Dfh?=
 =?us-ascii?Q?e7Ld9GrBUS6n7izgx18wMiqEJmjKWDh+l0t74q3oOcG+5zXtw5H6CN+eVZsE?=
 =?us-ascii?Q?9fZIuUgweUxgTgNwfKLrYhaOyXy4it7pJZx5TvCSO7t59vB3BvTJ+xWRSohU?=
 =?us-ascii?Q?ppcvpj0I1CmA5F4b+aFNgt1nTwt8Y72KBB92IYjRlgHmcmR1c8PmiOdv2W8q?=
 =?us-ascii?Q?Xb+gXVtr7qOPLM5F5S9Ve5yeqDTboXJGspg241HD4+F/hxw+v8pOcZwt4A/y?=
 =?us-ascii?Q?T0Cfcm7jgp2hbfDwirjmBTv4wWspjlgf4GxkZDwpqCtEdZBkcysymn0YaqxF?=
 =?us-ascii?Q?2tI8AAVSskb02AI6EzJm2LI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92af1702-37ae-4661-6c9b-08dafab435cc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:01:53.1868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUaxsYIatl1sCK1PgvxFSazvhSS++VfF8jRJGxv8Os/7rp2CvQd5CprvP+uB58H2dFKAwnAWoe5VqLOpyHcdq07SLBE4qSMm3x5R+cNr663VG5YbY2of80i7s+uuyeEP
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

Current ASoC has tx/rx_mask, and is directly accessing to them,
but accessing to it via function is nice idea.
This patch adds snd_soc_dai_tdm_mask_set/get() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index f27b33dd97bd..9b18e230e5b3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -520,6 +520,23 @@ static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
 	dai->capture_dma_data = capture;
 }
 
+static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return dai->tx_mask;
+	else
+		return dai->rx_mask;
+}
+
+static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
+					    unsigned int tdm_mask)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->tx_mask = tdm_mask;
+	else
+		dai->rx_mask = tdm_mask;
+}
+
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-- 
2.25.1

