Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0BA596AE5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 10:08:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6192815F2;
	Wed, 17 Aug 2022 10:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6192815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660723700;
	bh=PXlAn1pz8WpNt7JBnMhtzs3n6reXFCRvHszSuVCD4O0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vbUqEt6dt4C4tnFu91QdTLTsfZMHNX0ITjCVY2y3dpnWHSKcsuyX6IzWMGNMhiBly
	 Tq9pCuD2pH7HjU1Sx3BVOUlXvJrXKInxkY3sNmKCc2WJ25ZKm1UrvHcmsoltdLIoeT
	 ajpS74ttCOwUcypffvP6jZIQILsDG8wCJjDzHNtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E69C9F80559;
	Wed, 17 Aug 2022 10:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A6FF80563; Wed, 17 Aug 2022 10:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A35F80518
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 10:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A35F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iCP8DNku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOenMpZBDRWmX6+vvp0/ZK/jIVPvLwwwnL9PTJdt4Ble5dynw4Ho6n2rlrh9H1nfyaQj9MSuyu2ilCWIeSAwcfI4IL/ypk6YvfVuaSGKDMkQi0SUXUlupr7gvY2wBtewxZeZSRhiigjOoWQXQ6jOqKJ+70B8YlKWHJ68lhcaRqJ6U4DS8VhzzkO98LVw3cUYUQtpxHOoB2DsgDUXJ5CbNKkIGYd1uLzu4AhywKxll/JplDM8qOMAdq4cY/l+KzC5REfMqL7f8xDOfnO2gYn0+bN3IF86H4mlBsQGx9eiU3KIZIbQS8TNuKW0n2UhyYvzk7mAEqZdBxQFjTDm0NkUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwB8qZ+geAXbrM9yHUvBFqFHB9Vl+3ihNvrLr82/AQs=;
 b=gYUn7FEvwO1BfTJR4IGAczVnR+UxaFOhuA91ev/FEIfv9Wt1hp4Zkm1sIVz5xJsLjN2IYa7pi+EWFYMCS+fosGc6MjkFPTO77U+GTdJ6VBiaEnwNli+CRjEVUSsCPoAxTGCA0teo1ALnDKTxA/YTjtmzGRstSMFfZaFNOul42ocaiXNoZc0dH+NS17eZodGrRWLZ/iJb/reLpOatzoNKNxVXUcbnLAM34Cvxld7gA0V1kNBP+jJmmdrnTkvx/++Zga8K0Ati2Yjx6MtaFzkPx+jZAa6lv7elq+Rm/b07CRL6kEaRsdqPn+Zzp5xFI4DtvuE2adiaFi7yAgn7WDjpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwB8qZ+geAXbrM9yHUvBFqFHB9Vl+3ihNvrLr82/AQs=;
 b=iCP8DNkuvvy9R+Zlv9QA9kH41b5yNdkyLFdFbKCqq9YjdSRE2UuC4U3A6jzyZrrLSi4YdJJzpF75MoEp0bpSxvdZxyHJcaTlmsS1jvuDXBF3BsFzES3bG+agCcLzg5uFSEqragE7XM5E/DfwAb76u/G+ICaxK5bR+UgB6BgxhNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 08:05:58 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5%5]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 08:05:58 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: SOF: compress: Add support for computing timestamps
Date: Wed, 17 Aug 2022 11:05:29 +0300
Message-Id: <20220817080529.10864-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220817080529.10864-1-daniel.baluta@oss.nxp.com>
References: <20220817080529.10864-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 622d919c-930a-423b-3fe2-08da80275118
X-MS-TrafficTypeDiagnostic: AM9PR04MB7617:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9In50/yzPQWWhv/LVRwTFlFfdKWS0uTOkByoHBi2kW10H8fsUPpfeAYaEq5GHnotO1uN7O3E7556pQiYocx9RlNUMxrK1YUC+j4ogg7FhVc7oQr2kDnxLJIMtNihkEK/HDsjaiDc272xW2wWoPTv/XEuakuNnv8ed7shan7m9Cr1RFD0I3z5POfiuCRARcx6czAudRWF7Ml/4Aqe1ppeiQm+EurEpMS6E8umHOJp5liyW/BAhCYznI2/bieskMHC0pX3qmtsHaarsW4BkKrhHbRfz7/s99Y8C4gYGXZ8Wlxy5B8A/tNVO2/bofiTHmg6eXWDL6E3Z1nfiRjj+DURkTZ3BPUbymw+gHIR/JTqPgJz1I0FUGM6cHCQ91SLRzdfqnu1EoBaXo2tSeuFn24Ini/FIjQgVRMMBk8xrA8/qHKfc9roSSWKb/2XaWY2wTvUk2irRwzfk1Hq5gKw51R93zKIqHkHZVWMCsVd16PQCL9Kjcp6/zGT9qzK1bwZ7LqnQMcqbK+NfOWM7ZpA85CACyTNXkHeOhkA9HKNdSozHy4R+yQ55T8zApR5lpnsvEeDkPyJ90W3rao+U/9yXWI0/BwSLfYNG2VL4XxT0uKG0Zn1ReenZsr61WItJPiNRF5w1WXSd8JDV9lV6Q+y4s2Pb9b5fMcaHauofex8a81/6x4OoyiTswSI0ZfGlaXLBNPHK6lQfITa2VNJ4uVPyndlvQjF2ocfZuHM8zXScoVgUdzgQ9CJBBME1a09ETxANk1i8/1LXtmxx+TsXSfcku+Bvt3CtfJgrDehsg28CA3LLXRCSI3R1Ji7bXxFJc/bMA9g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(8676002)(316002)(4326008)(66476007)(54906003)(66556008)(66946007)(2906002)(44832011)(7416002)(8936002)(38100700002)(5660300002)(38350700002)(86362001)(186003)(41300700001)(6486002)(6506007)(52116002)(6666004)(26005)(6512007)(1076003)(478600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+pwU2DPsqwB2xBT5UzGi7w5scpB8z+sSgw3gE6ysyeYW6NhIf/CvQkCWCg6N?=
 =?us-ascii?Q?rcHbZR7Ye4tVBH9Rol8syZFq5kyPf38hqRBhbayFhHAPLlCarp9cS0InOwEu?=
 =?us-ascii?Q?q/OXkEGyxbCTdxDBLXTlnTLctsr7f2sNGWcrk9vDfvc18szcwJZMiLPuHJlX?=
 =?us-ascii?Q?LvobtTM2IlQuSx0UD5Ye4n+3rpw5jhpRExEldjhTq8FjLR/fhJ6DIwQRitzU?=
 =?us-ascii?Q?+QMch1BA8lu9yTv6XTfO8K68BWLp1cUTRDHD53Ef6SsoJq+eMPUv71R/h7Ad?=
 =?us-ascii?Q?De0KmmNavCTwwWF+Nn3+3Exzc6vYUfnmOPPpinPoVV0k/CIFDlPC3H60rg48?=
 =?us-ascii?Q?KcxPSBK6VbE3YpDtKZZHdnaTm9gld607xcZW47nG1MenBHSZv5navxXUJ/O6?=
 =?us-ascii?Q?epTtalsjX2jYhn0RmpfPPb6vS+YOkyZukjJs3SpuuIfpLvAI0WP5oNWiXRCQ?=
 =?us-ascii?Q?U0Srvx7rZAAanzOFKJN++CNZuh1k888NvvdP3NvLP0RMRbPouP8jH2PQLf7K?=
 =?us-ascii?Q?Nh5a/yVzXmBtWFZhZe31EkjZhT2aUfAP2koBXQl5NlwCwOFfs21Og8lZXy5J?=
 =?us-ascii?Q?q40abqTPbHLxsH2e+aFdlXwDsmPipXrhJdLDApAHkOhGnMGdLQuNJUwjvpFh?=
 =?us-ascii?Q?URZNND7LaIvpQzY0UtvUyZs6P4aciBC2XHILpreA3/8c4yxcC69Esoc2H8li?=
 =?us-ascii?Q?t9EhIKCeCBPhpN38KMOfINfRy8b/J9XsILL1nwvGV4xzjTdOW+xBgm+3Bwhq?=
 =?us-ascii?Q?9IxUjvU18pkiPFPD0qxYDgQhv5Q+YuqBAhsinuU4R7QmLNRE6qE+DSplOHC0?=
 =?us-ascii?Q?GWQwsRwHjBNaf38BLPwr4DIf611h5VbS0wVB2P66I67g1fs2pH5Ko0Yr0I6d?=
 =?us-ascii?Q?xCoht7hdAohsZPkN5Wub7R1p39xQB3RFa1/GsOVCc2K05Z9csgPrsmNdYHgJ?=
 =?us-ascii?Q?P6EzBiIW55s1HOWQwEBw48O3YW62yviR1Vu45hkZDRhtdLCNZuzrH5bYI03z?=
 =?us-ascii?Q?PfG4JpINW4rIN8b7HcimQSVD3nGCrHKHW0Qssg6a/eoEp3j/xYfC88q2vDrE?=
 =?us-ascii?Q?j7EpvgGywPsQg9Z8DIrwX89idi1nf60P4jAUHRHj2zMoa99PAkUIX1iedywU?=
 =?us-ascii?Q?EBEvOHpDmIv30Jt8cvCaFDdiMn9+/CAL6ICXKZ9ddKxW/dgKjeX6FZEw+ZfT?=
 =?us-ascii?Q?p96kO2d5R+lmf8UUFkoi45mzNDas/Qf7054l08v2T6Hoxc+HAc3+a9jUbRu9?=
 =?us-ascii?Q?wQAY1nR/5KkIge1XeKrlnKVskajzVW1QrFS5ALhBdu7eocroPQEtMMaP7XQr?=
 =?us-ascii?Q?sn6u2LCG2gE6t5QJEpsxY1J2d0BoPo6LY/CIKN2KXHrP0lmcDjiIqqYKar76?=
 =?us-ascii?Q?yuQ0DBTsBy2uqAvcBDldcCZ7MS+1GBA/6xy8yj+mK3Z2yldN3Vtt33Zq1wnz?=
 =?us-ascii?Q?XWW61GRS8jDPVs6R7GcdpT8U/JrxRoIzdXmDzNPGVjYlRLqXPixdZwAMypuN?=
 =?us-ascii?Q?OnNKuNJla6jX8BHGnLt5pNhZpi54agTYTOFKL3nUwS5jsxAqaLVZfb/gT798?=
 =?us-ascii?Q?5DXpGZz6OMt+on3bbqQQOPPWRY2dkj8AGF1HNGLY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622d919c-930a-423b-3fe2-08da80275118
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:05:58.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Jd2XVwKZSz49gn8Xgz2iAFwUVZ0hFFHP16/ae1PqealbZ6MJWxAj+wXT6I13+eIHFcdvY9wD9f7nfGmJtNJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7617
Cc: Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 laurentiu.mihalcea@nxp.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, Paul Olaru <paul.olaru@oss.nxp.com>,
 yung-chuan.liao@linux.intel.com
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

We compute the number of pcm_io_frames by dividing the
dai position to size of a frame (channels * sample size).

Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/compress.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index ac79b46ce3b9..174b3d8e67dd 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -327,10 +327,21 @@ static int sof_compr_pointer(struct snd_soc_component *component,
 			     struct snd_compr_stream *cstream,
 			     struct snd_compr_tstamp *tstamp)
 {
+	u64 dai_posn;
+	struct snd_sof_pcm *spcm;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
 
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	dai_posn = spcm->stream[cstream->direction].posn.dai_posn;
+
 	tstamp->sampling_rate = sstream->sampling_rate;
 	tstamp->copied_total = sstream->copied_total;
+	tstamp->pcm_io_frames = div_u64(spcm->stream[cstream->direction].posn.dai_posn,
+					sstream->channels * sstream->sample_container_bytes);
 
 	return 0;
 }
-- 
2.27.0

