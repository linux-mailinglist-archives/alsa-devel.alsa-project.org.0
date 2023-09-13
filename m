Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB8979E4E4
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 12:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C05A4C;
	Wed, 13 Sep 2023 12:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C05A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694600911;
	bh=4pVPRGOItj3O2/XInN9CcKyAKoCH+KL0ZI216ErxmrA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aR1f08rykgavR+s2OsgoXcI303xWDqQz/4n741+Km4uewZSNs9OKOxSuSsEwgC2dH
	 YeyKt43ckpBxlWfVbmMEac0eBLKM2FjLH/N6LFPHCzniYMnswrVcpouFSlMXAjAd6N
	 nSEWT9gv2xp9/EPidrpACDUSHV8hSJo/04AgQz1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF9DF80246; Wed, 13 Sep 2023 12:27:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB10AF80246;
	Wed, 13 Sep 2023 12:27:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B97FF80425; Wed, 13 Sep 2023 12:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EAB8F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 12:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EAB8F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=OBr8CnAq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jd19UXReXam92t36ElGICJ3//hmYGn0vftw9/DR9VvGesFkW3lltgxRB8UaG2b/+YCkNFBZjx35bgI1HDkKm9OHke4jqwhh2HXd0i5IFyOgwcBJDeMSBuBJrUdDrZnJo2uEOFk7HvxDB0UoNQv96lYTmazGOwogirDk2QvlT20ECob9qavEPMckd+2vZ0Bs3iWSOJHUjRxMUTPlqFUanBZv9/EvBPFZoPUYCIoYk1rTaJcdzYQVMEeQ05QSVCYGaeNukmXuMdpDjWLpPkwlOHRkC0gtROF4vIsF0cEV2WSJTQ7VmXfu8Hy7IY3qJJFilO5CIc/TPo1jh+mU76NxlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tQdiu0x5kU+1CLi1MumrJfpwumomnH0TkPRLQ9Bt/s=;
 b=B8wnFWhfKSh7SmiPvcpzSku1DfizBi+0rg75FHnlaFl2HMzUxEHanSQ3i9/ca27GBfH5aeODDI3hQcM3y7eX0+VmMGP4wtBrfNoswsKvuQmdp6jD6HNy0xm1oANCS989rcvVIvE/r+7Kb1Gpj7OuVFaOn6jn5hPMGvFtkoNvRZQ17JbLPZkhBdnpjQCvFqkx9ee34KBq4v+3n8IJtej0Nkx3pql5GY0CusVGFefgfTO9cWf2/i96GGN+re7qqfOggJsMzK0NPzhWQpiUW9l95u6NRYlh2B+SVmy5m8I1e7iX1uU+FDc4Tdm9cTM9IIbNtMKpbmbSrLNS3d5ND4VYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tQdiu0x5kU+1CLi1MumrJfpwumomnH0TkPRLQ9Bt/s=;
 b=OBr8CnAqOZTAF+lhpUCDUnU9n/+TnnMgWMW9qRE48c+TdDVxxHHgEUq0U+ihjuuc7uHFC0i252MuArmh9kZftxzS0g9YENLI1sFdew/jsPbfh4ob0kKHd2oCetGwmHACj4EPh2RBNLI4MH/4Qpr0V+wN+TxEz33rp2n6ZgTVFsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 10:27:29 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6745.034; Wed, 13 Sep 2023
 10:27:29 +0000
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
Subject: [PATCH v2] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
Date: Wed, 13 Sep 2023 18:26:56 +0800
Message-Id: <20230913102656.2966757-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2b6d4c-62f8-4de2-aa72-08dbb4440802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k9NJxvfZN6xOU3xO/qRAqBWZV9qS9vJFfgT4Agkq6YeBt7oVFQFfcziIpgGrYMjcbD8qdLKg67KxgZ72ofEcMBeEheAKnFGmVm6peJcOMNN2uISKEjfSJY7NJnsE3psegHgG1hYa4kVjw4MsgCpM/r4xHUktVfxfahupjMm5Olkhqoi7/I2liR3AALCPPlx8NPw5lLzRD3JByGjNx12Uql+LNql6eGf76OksdWKHAv7q1PhUBp4fNZzSHkVVuFu5VAKW7e1UdKGK/CWQuePPGBcdT8p5mKOpdaOgmNJF9mTbkoiFMuMi0OQV41GrAs6kttgoc2nLXF6lRw18lP+2M/WJLtQ6mFWDVBHU1dzsxdmYM9aYAZpuFGsvp+uJSoSUAvo1Mdwfyfpo3BcoAOVD/1hvXixGJjcXQsFhG47ui/AkMPzHDxTwr3/kowdZyXwknDz825dAnlVAOGbkrUtitqzG8JDfKyaF7gPdcjaYglVJPWiiFA6pzk3WHzCcby0t8zBhm1N7P46gti3bf3kjTFz8yhzyJ/OLreDz8U3TIgZbj3z0kGeI5F6CrPChu2vOaXxqqX/zd2POREeYmmSVVLuSG4JiNEef6sMgTJhK/xLbU6zj8937IcAflG5d2SAykfAd5Qz7cZVo7AK1QPiZOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199024)(186009)(1800799009)(7416002)(2906002)(44832011)(5660300002)(8936002)(41300700001)(4326008)(8676002)(66556008)(66476007)(26005)(66946007)(316002)(478600001)(6506007)(6486002)(6666004)(6512007)(1076003)(2616005)(52116002)(83380400001)(36756003)(921005)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OXpnQeYVH/Nohn8KYkrOK9ZTC9DTIKIADllLAc6WBbAGa5hiPGFAb6LGa5Wx?=
 =?us-ascii?Q?CHXgy1RRv79ui2JBmTFnTmVCpS7kvZZjw+qN1+e6SsIYJmz88/8HlGZbLH0V?=
 =?us-ascii?Q?nkouzFSrpv9RjdHTZO0yX4iAxHErf9Hm/AwptkF7xmSw5dhGewmVYRy9eUcp?=
 =?us-ascii?Q?aTlEOiJd/g2dR5XFily1hfEVeEPXcGVR4/vSsCFtRj3Rgbc73m8zC2GlP104?=
 =?us-ascii?Q?HtmotHRqSesT3zbNlDHT468fXxfzPGZpe2tZHXu4IfjuamaarGXn6Ub8MTnV?=
 =?us-ascii?Q?BWsdqa3ndpcCLdhVJPFeOZOlyr+ta+UdXuk0rGIUpiifzMy7vvfgPfSn9Spi?=
 =?us-ascii?Q?PCmHIT3KdV+6LiXZwHKu6oq3aHcW7YHHjaSms398VSGax2AHommh+TuK3vTN?=
 =?us-ascii?Q?lRimY5k0ufEWRiFMYXePtEpCfslDUJhIBi1oZnzQNOvQ6Kajt2iI2Meqv24P?=
 =?us-ascii?Q?Ka21jitpA68UkSvim6ShjBCK5oOsP7Y7GJTK2mJIDSqoy7QebZvQNVTIUEvF?=
 =?us-ascii?Q?GNrXQLGpZtmX12vv5Wadme/VZaX58eEWAxbY6cTDUV+dDzcRAAqJhLijIt5D?=
 =?us-ascii?Q?/v4Z2RJSHjw89idLKkgElT3dGLTG3u/yEwq3+4mVnG1ZlWDknqnaGU0OM1cT?=
 =?us-ascii?Q?PJ8ZYqeg8Ear0CANs4nJdvxdUvW96DHgBCPvDgeAqcZ+OioV0896RNRbbCQ7?=
 =?us-ascii?Q?/9uMiFXjvbs+5Ik1ns2/mC0q/OOkR6ARmVOya5XeJJPzYsgicKyKfOZDNrDf?=
 =?us-ascii?Q?2q8fXJftS9YlWNFcC63mQMKxShx3d2MAfnW7lB9IQhcvScemN14SFaEgdO/Z?=
 =?us-ascii?Q?hhwQ4q0RY9GRkVYqcTse9RsI+7q7Hv2bTSR6XHGHSvL6g8Y06r8qdO+R6c5g?=
 =?us-ascii?Q?MUlPj+PRg4vYWQBv6TxT2k+Qh0JNSA1UIzvptmxYduC/RgwduIOpKor1Cymp?=
 =?us-ascii?Q?bABBMk29dVOnt7jhnbltaJGswEZOVNpWTXwMzcISyYAGfq1j1ipZmUixUO86?=
 =?us-ascii?Q?tuccTFNZPxhxvD2SmFYTeDOComoUWlxdX2qVZmSiFIq4KQZI7W7pwF95USYM?=
 =?us-ascii?Q?MJ8rw30KXwWtzzP0iEvl84Eu591d8Fun/K3KFzEJXL1Id0p2i23JtSAcTiNd?=
 =?us-ascii?Q?ivUJO1EnXI7EfiapSnsLvFuDFkFbZBSnhzQ9LJwKa1oQpssq+2V2/G6bMstD?=
 =?us-ascii?Q?I8TbJrcong1q27ZYaBR6vinjOx7DGJydJLYFrhTODNSnbLwbGY4T2Bnbw3/Q?=
 =?us-ascii?Q?guPf9JsxvhTR7yhOzI8NjQtsiSsHffpQrGpytnTSg/2Plkgvm4FRtjx6OBys?=
 =?us-ascii?Q?Jv+OMYP8kTjdQfVwJEbfFIEceUGyQe3WNVr5Vari7gqxJR/wztCG2nlOExZC?=
 =?us-ascii?Q?qTbDd7RbHSsWpmxgsSGmFFhN3/REIBCy+srs7gzigj7BVv0mlp5LlZWLL170?=
 =?us-ascii?Q?KHJ1qnh/46DCYlFM8V75clpFgwfc7DjqotMkaiUyOClgjLEw7+6gKPnrv3di?=
 =?us-ascii?Q?ixv/cCAybz4WQGUjzPvhSk/HiAXdQVAds7XQGw6A5rhrVAGBoUdgL0Zeqa6M?=
 =?us-ascii?Q?K/NuoxtsriD+1GgCPEgJbOxUGqGvmRtC1ALcz+He?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a2b6d4c-62f8-4de2-aa72-08dbb4440802
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 10:27:29.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oT3tiGkVCx7+zsgFPXlsekbNhedJl8Ub9J33OvPt9Hp6GJDX5En6LLmVALee6T5sXIh1CDbiNKK6yQqycm++hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554
Message-ID-Hash: KSBGY24ES3T7CL36QVV2AKOOMSSPLVUF
X-Message-ID-Hash: KSBGY24ES3T7CL36QVV2AKOOMSSPLVUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSBGY24ES3T7CL36QVV2AKOOMSSPLVUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
by CPU DAI driver in hw_free(). Some codec requires MCLK present at
power up/down sequence. So need to set ignore_pmdown_time to power down
codec immediately before MCLK is turned off.

Take WM8962 as an example, if MCLK is disabled before DAPM power down
playback stream, FIFO error will arise in WM8962 which will have bad
impact on playback next.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 3c7b95db2eac..b578f9a32d7f 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -89,6 +89,14 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 			    SND_SOC_DAIFMT_NB_NF |
 			    SND_SOC_DAIFMT_CBC_CFC;
 
+	/*
+	 * i.MX rpmsg sound cards work on codec slave mode. MCLK will be
+	 * disabled by CPU DAI driver in hw_free(). Some codec requires MCLK
+	 * present at power up/down sequence. So need to set ignore_pmdown_time
+	 * to power down codec immediately before MCLK is turned off.
+	 */
+	data->dai.ignore_pmdown_time = 1;
+
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-- 
2.25.1

