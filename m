Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F773CEC9
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 08:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D7E839;
	Sun, 25 Jun 2023 08:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D7E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687676262;
	bh=hMahQmT7t3mIjM6+yo9sBd/f27pbdwPKYnZFiLDS1cI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EZMuCogRuxafeokQcrTOfDyEKfnnFBNIW4iIfXsI1yuK5f+6u9cAoJ0OyGFeMwPA1
	 XAuZydQ7JhKh0yOe32bjiEy2KhUjQt8it82KL92tsjUbwuy1WHvpirjDl6sVzjeCuX
	 kCDAWuJkoAWJEBm3mTtBu/Z7opGVGzGeh/eaILL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ABB6F8051E; Sun, 25 Jun 2023 08:56:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F060F80212;
	Sun, 25 Jun 2023 08:56:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A88FDF80246; Sun, 25 Jun 2023 08:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1230DF80093
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 08:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1230DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=nhMDxYGR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AL8z2XiS4Y41oj5yU4463NHH4dOuFNEY8l3pcv9dTnAX3qaV90To/IR5Y9/gMUcv7ps2+eMp/rKwk9QOii+f6r8m9Wfwg4BBp84M6B2sAYTB8klb/Kk1QDHovg7c/ZC7wWbSKV2Mi5PWw5nu/R6vYcWdhMwZoYDe7acEKoisGkkHizZARlOJlPJc3uIYRGSh4gR08ipXXs2i0DamEzsl1r34u22/mCUD1/tVgWprEOoD8411mjk2gEIv/DBazH/lDrNLsYOBcH/n/etkNn2cTjoc3OOShsV7KiavFFzJ8c4dVkbPHnM3yCwT1q4YruCg/5zcLIoOU5ct+wjivvbYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfF5dXzltExNR893CrnqE0MoDFRyXPnWtG/seWW6G/0=;
 b=gGRPrJdzpuqse0op1JDJjxbx0A6dDgNJq6GyCmcGiHCCd9a1+FoE6g18HDRwLghzkWizzibBm/MPospJvYxNeHKUhd6Us8+M4eSMLIgzmmS5DnSSW2gMnI98jgmauzAFZB3JFKWcYmlwiqX2c1Iez6Nr3kaZFR8D0b94jeYswNWKRQO3tojjTGPRnVuLyOZr9Ch80edDHuE7JhNtR6Tjfhw3uzRSXlX8UBOmpReAABMXaEUh5hLsLtz+mlXgYfSNFu/JyoOOJLOPYswwPbbg1XxVx64Izjxlp2o9Rd8Yu0xrUV/gxTmxvJHGMPqTS/TvtISlD/CF7C0GidO7UgKswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfF5dXzltExNR893CrnqE0MoDFRyXPnWtG/seWW6G/0=;
 b=nhMDxYGRv7nXue3mdf5bnsdQ/HNwuZzjPzEeHnCvDyScHHMLqxphf+m+bwfM4+74trKh3MZN0sYnpUKJw3tBx9gl65qcJAZ/lea3QBHZzb8ZVPt65vWL/6KSboez1tuABbc1AZf5PPflXsbOp8UI0tsdwwFc4S2BJNdL2Bcu57g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9098.eurprd04.prod.outlook.com (2603:10a6:10:2f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Sun, 25 Jun
 2023 06:54:49 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7%6]) with mapi id 15.20.6521.026; Sun, 25 Jun 2023
 06:54:49 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH] ASoC: imx-pcm-rpmsg: Set PCM hardware parameters separately
Date: Sun, 25 Jun 2023 14:54:12 +0800
Message-Id: <20230625065412.651870-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a73961-b805-4c30-2417-08db754911a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ztBmrqbJ3wxFoLNjh25yGR62vtOKfpm5A/wkcaJciAi7yr2PkCh3NeewIp49UjOCQ+Y/tDEQMPiiojAWp+GzExFLH1mpwTb9XJvluEXUtyi9b8Du2ZuoGITh5xNAyqOlgQdplQhaEJWeDFGXcYVaNaRBwKSvENp5915DDolKwXeR+Mtz4w5wVC6qO6kzDT6xxuvvUrRpnUhptDjelQdNkSCAWbpXFy2E5lFuIpXZZ7IBeJ+K6qg7lP6mJzyOhdLA6OYtKGEOEDNF46kDfCzOubBxp09l3b8HwWMfj9+1HANejadDXdy21i/oZoqwmnIIRRz/3ycS3ENliBXlEluFYO+WIzTbojGv6RbD6R5B5PosDPut6fj+MdxVVXbj3eAwMfSqKAj7xT8FEdE0YKSkTyYetpgVHLO0FtGpY14WmSybHDCI6QWRfaTjYgMNsGl+LR1SGUsQd8qBB4RqnYiJetHIK4nyXWJY8K3L/bPtEfj4RUUU4STFS6eMWsEg65dnbqkIZRmF/0RmyKdIStgwhUmXuzSduFmdCM3Ux3gvlFVrteLeAid8Pur72WvOQXCjTQ9gP3NymtycXKEaKNbNbM/GMeOq0A39k70Mh/fiFLTs86oy8CpxhQoTGkw9wcWF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6486002)(478600001)(52116002)(6666004)(2616005)(83380400001)(26005)(6512007)(1076003)(6506007)(186003)(2906002)(5660300002)(44832011)(7416002)(36756003)(921005)(38350700002)(38100700002)(4326008)(66946007)(316002)(86362001)(8936002)(8676002)(41300700001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knnntIx1XMkGv1C9C0wohaF4HbD03G/lpxChH/UrioW6Fmg4NkDA6jDIona8?=
 =?us-ascii?Q?1c5gjWPS0A/MrNe54kclbbxIus1+2ZjfwEgM5JmefzyYXUnmEiBx8s2SiKKe?=
 =?us-ascii?Q?cfhjzSvqJ3gURB5FT+S1gDTVlWSy+qMt4Lo8mMSniD49fRpdeSQq0Em847vy?=
 =?us-ascii?Q?fZtPfnQziqelvSOcgdh4dvH6tWvT72T26sWUwNp0VqNNJPftPasBzAbFTmRZ?=
 =?us-ascii?Q?kVzgMCOJzLZI5Dcn+LTNdbp0NWRCjxziWQJ6MUkZWG1uU5ASnJHlO/XHIk47?=
 =?us-ascii?Q?kACKJ5FccCO00MP9tVXR4lACeBeFNWdb+kgitznaHK5eQT83sTto/YxR+UUi?=
 =?us-ascii?Q?oIUokQ2SwC0NGmfRxcoeFfTN2s7H6QGLUdAnFn3K2cTh49k2JCuKU3o/MS05?=
 =?us-ascii?Q?+RBC2hBnripM+2jMXl9jhUym6YuicjGYv3LBfVlVXmiM+wg5eyQnDIK6XeFB?=
 =?us-ascii?Q?Sbh1gpn/9jaGHRyXwSi2ISoAtjcfffgOrSDYmXB+f6lLjLc+PVRlW/QWeLLF?=
 =?us-ascii?Q?R9MzchPkWO29DvUwxyMMsODhem6VbKl0FOhZMePiP60uyFhBFoimR0jtKsHp?=
 =?us-ascii?Q?8hWv+allyUzpZMA7b9ydwiv2pCCGxPDMXQyIPNwP5aTudlSgRS/03j6CEC2b?=
 =?us-ascii?Q?QnzS/0L+UtxwLF4ax2gN7KLzI7Hd+D/gtYoVTb1Ilj7vqYsLztoKxpUGmuQw?=
 =?us-ascii?Q?cjsiYtM8x+AoLqagGeWB5EK39a5Ss52nPm2JbDr1x7iuqmu0VkehDFWQlg7P?=
 =?us-ascii?Q?n/pOM0FLNginGuX6ZvgasBQvXqseJBEoyOSEgxnhYPBWthQEAS/dbPk5KaOY?=
 =?us-ascii?Q?xSRov7UhZXTlYNgPt/75ztaNRU6dLtylpuDhZhyf8C3dFQegq1nMpxYcLU/o?=
 =?us-ascii?Q?+byReKrNKMW85wGwEcc8YHqwyZfU0UpRF0EJel4YKEw5DFfx+LTs9oFj3ltt?=
 =?us-ascii?Q?rHZ5M61DT2iUpgZoe3yNk+TFUaPS5Wn4r5uR+n3/UxcaMPnJ6r4h1XRL+my/?=
 =?us-ascii?Q?mYLbdz3I4tf1EU6Mbzyhps4q/YnftukVEeaAkjoN2XDa/cdRBLTKNKPUkwov?=
 =?us-ascii?Q?bq3u8FS/OFOQ7lhpDhEE8sEZIRK2O/ILL5tjM17bqGT813RwT4BMJWBBk9Zl?=
 =?us-ascii?Q?yK3plreNPwaTIGt44oD1lbBd1NRninmvwKo1iBVTPzCFzu1yKfjapfxmpt3Z?=
 =?us-ascii?Q?3NxXmtWOnOjMDtf822Ro0p56W1zjIVYZ7LpKh9Z1UzH/SjmbatacEijuNC0d?=
 =?us-ascii?Q?RfcqjT7/nQfmSPM4ahNPrW8Q6Yzqu28KVUooaTagYUBRuVpgcbBysPCvCiaj?=
 =?us-ascii?Q?ZihO6/8Yhrvr5eHkYh5xFmw4iMinXctsrluHlx7GRiOyd1v1JLRjd8Uov4e7?=
 =?us-ascii?Q?ETsq0Uv/5LfU4jET0+ZrJQ+HLAcRAIixtLa0hKyEfedY+zLVbmkYtAZpM/k6?=
 =?us-ascii?Q?nrvpsCv0k4DMSKQzYvXtWT+Og15yd4q1pa390q1j0UdIu8RLfWNq+e2qIhbi?=
 =?us-ascii?Q?yJzPpy9fGP7RZNzVpyYrmFBVjTge9ZcYfsyJ/2DRSiY/q3pW2Xrv+1OQ9Zbq?=
 =?us-ascii?Q?jkSOb0G2addhKF+bcg9Sh8VWtzZkWpyF6ZpCYM5Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4a73961-b805-4c30-2417-08db754911a2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 06:54:49.3568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B9qZr2cqdubM7WJ1ptk5TBhRLarMg0E/ywh+jotgUPhyfpb8ibj7mvLSiKfbBEEIGJhH9PawJs1bN1RRnD3+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9098
Message-ID-Hash: AUE5GQVPZCSU555KV5UQZEZIXDWZKZ4F
X-Message-ID-Hash: AUE5GQVPZCSU555KV5UQZEZIXDWZKZ4F
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUE5GQVPZCSU555KV5UQZEZIXDWZKZ4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Different PCM devices may have different PCM hardware parameters. It
requires PCM hardware parameters set separately if there is more than
one rpmsg sound card.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 765dad607bf6..d63782b8bdef 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -228,6 +228,10 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
+	struct snd_pcm_hardware pcm_hardware;
 	struct rpmsg_msg *msg;
 	int ret = 0;
 	int cmd;
@@ -255,10 +259,11 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 
 	info->send_message(msg, info);
 
-	imx_rpmsg_pcm_hardware.period_bytes_max =
-			imx_rpmsg_pcm_hardware.buffer_bytes_max / 2;
+	pcm_hardware = imx_rpmsg_pcm_hardware;
+	pcm_hardware.buffer_bytes_max = rpmsg->buffer_size;
+	pcm_hardware.period_bytes_max = pcm_hardware.buffer_bytes_max / 2;
 
-	snd_soc_set_runtime_hwparams(substream, &imx_rpmsg_pcm_hardware);
+	snd_soc_set_runtime_hwparams(substream, &pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
@@ -597,7 +602,6 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	imx_rpmsg_pcm_hardware.buffer_bytes_max = rpmsg->buffer_size;
 	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
 					    pcm->card->dev, rpmsg->buffer_size);
 }
-- 
2.25.1

