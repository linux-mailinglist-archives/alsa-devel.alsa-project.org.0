Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFF596AE1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 10:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AED715F9;
	Wed, 17 Aug 2022 10:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AED715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660723681;
	bh=fEJBkkqze7pbI/oszJFhlwpwwT871tx3a3vM3vYVygE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsNcsoRaOme+Yqz4eiTrkQ75zkzH4g9Jc7CplnJkkmZosxnvXnlTRkQCr4+zV9B7W
	 m6UK4lI709p+QM7qEEUC0s6AspRKC4cUGD9c57PdVOQBQn522JrE9XDfi1A6Y6bjJk
	 4/LpHAp2Vrfep7NOPcJwk0TsUtCJ+5n1sf+pzmHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C29CF8055B;
	Wed, 17 Aug 2022 10:06:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27309F80557; Wed, 17 Aug 2022 10:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3AECF800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 10:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3AECF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="B+kuO2lG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPPFVxdPB4MYUqab+YpQ5Lsg+9g85Kac43q4O2/WoocAeOipSy8e+oVN0UZDb6cKCYOHPSsR7Ao/GU+DQSf1bAillM+an+nYZVUdZXNsNM4vhKaXk/LRH4WaLoR4c2AURwTwW6Nk9F17L9HE6Etai3+PEhcfdtXyoCa6JQQvQ47ugylWZ+rHA1S4J2vH17URBqf4FOaMN9YSICaRhJHZohhGT+zlX2UkkAUGrkYYNQ6iNhjFplcd7A0q7fd6Gf2JnIrh3M+UoDcv2C0BUNqCKgLStIjld7CCEhQF5lLKb1tkyEyrtiWYILJcIzqtklo7osaVwHZ60/2XoDg9M1iyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPCbYavTz6yP22PnXyNly+qjuf36NzYb8mbE573ucGc=;
 b=bC5Q+x63X9mgCEbNk9NDbL87N/Bd3XbMggVmR4g9CiUwz7281GvjRdkuEsYm0jCt5v8ji1YA8EvM3kL1DU/tzttxOOOF1yQ/UvmmqgR6YXiSLA1CxdmZqcNBoPXK1XQf6qaz7e7/71kgGHpo10Qmg6gdoVR+UFgYIhRoSuGL2ikgvxck51RqIN6jHV1L9XVXMkfxEDwWJQkwtjDVv+VEgZR6WnKZGO14/Gg4GaI6bKi8YAs+3slL4a1I6xRKn+8BwOeqpjuDVDKh3NqDMmgd4W8npox50TL/iMEIVIo+dLA/6LcXN6ThCbNgXnWSdaX+3ozpGwKIHJ+h/78uB1nXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPCbYavTz6yP22PnXyNly+qjuf36NzYb8mbE573ucGc=;
 b=B+kuO2lGd4+2KwHMI0B+OIpR2cZ36HobpeKYc7PSR7+GYrNchOIZhciCgv64bRgnMLQQoTZKC64b3/UIuMwVMgP2kZxcLneAcifXXAO5/49Em/JLc2M6HWihFm1TOjAcVcdCF60Yv+doSLpp5CCIey/BQ0vMs7oWt2dVQkE/8EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 08:05:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5%5]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 08:05:56 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: SOF: compress: Save channel count and sample bytes
Date: Wed, 17 Aug 2022 11:05:28 +0300
Message-Id: <20220817080529.10864-4-daniel.baluta@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 843a1442-6c51-47b5-fe17-08da8027504f
X-MS-TrafficTypeDiagnostic: AM9PR04MB7617:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzV+JVI7UiGXjpZ4Du2+MSzuSjhZMgOws2Mya4YzqOLUvsT2o9LggRXm+OonuVBuiJqA11/2vYFjHtknetJ98D8KsaWPmYIFXUF0dztB6ORDEAIrOYUItcgPjiSVKJhM7r1lPghqow0upTtQiWV6o7GMpJRqQ+eFo5e7VWoLDWut/RbC4p47rySsdboYlNzAfixGst4EUsls+kUvdCc+HObJ6iUpFERFBiMN6Y6AqRB6kANz6V1kM4nG1o3Mln0fKeD3gjhWxRcr1cz26p3NZ+ljTHgyYWc5G4Z30Vh6hFYJatRS45z/lfFYH9/ePG4CJHj46Heepe7jfdrrTrLYkuQXOlzSj3EHZuJpquQ7+5RQwDf2Hc3b3Xf6htKk+T2zgLTMWEdbi0csJ7mWoTfmzDUe9FeY/UohokTtTEgPYmvXddEC629d/GB6VBdbhqUcv5tfKr2qstl0yTQo59iIBHgbDLg41aSC78BdZ0qtuoOYROcTYgYGvBssvlxBibJBJAye7dk7Shdi62K9CumDPRQzdb8DWE0bsu9MIuSshONGinrOSLOnSpxAwI3W4/+c932jf6EluNbejdOc/+CGhdQlzQG9bqAMZvwfQdobjgpwowC5gPMFceEgXDGbYSzQgI9n2xb6lyMoLr1Z9WYhlV3eEwg2Vot7DCVxCIZBLbfyTt6fC4RcGLCOywuNCt8CIX4/49CQAY9BueiokbjhOuVASzOowGCQxeNEmhvgxu2pvMGBnoh5wVQ3z/pfg8nnPNRK1dgbR5Gr14wdJtlBhtWwqmNeUtgjkjFbMWUjQCP4gSHaQP7EU+iJx0vxeHkd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(8676002)(316002)(4326008)(66476007)(54906003)(66556008)(66946007)(2906002)(44832011)(7416002)(8936002)(38100700002)(5660300002)(38350700002)(86362001)(186003)(41300700001)(6486002)(6506007)(52116002)(6666004)(26005)(6512007)(1076003)(83380400001)(478600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2QMNK5gby2/ReQZ3MIE3RGlO0I+zvm44nAf/MQlczR69hw3skFv9r9+WvIS?=
 =?us-ascii?Q?w/AItYXZUAX9X6vTq0517ikminiklYUN95CCg6eZECmu8MoPg7UtdWFvJRu7?=
 =?us-ascii?Q?l3Ht8M2MZDPhsKAFVKz2t66XBoYzlMloEzKE3G7uZKoiNubLdokjA+uMgELL?=
 =?us-ascii?Q?TRm6/fkchxT/iQ33bCUqzcFXMmDMiPBUNJ8B6wESQsXCZxQj2kQRA9Spoyna?=
 =?us-ascii?Q?7DyVDGjJXCOd8uAMeI7w1tWem3Bpjid6ii7Hcq7pEueN0JYjLfr7n6ZlylpX?=
 =?us-ascii?Q?+hzCsgAvnGQWJNX3xMJyOTsqNK+9YwbgI4pqNS6t7KOcFpBik6zBKn99GaNt?=
 =?us-ascii?Q?qh7JakwHx1Lq0ifqYEkmhRPvLPY+g3PZCubH82h1DWRLNKcsx5wDMbCCxuyD?=
 =?us-ascii?Q?tKXf63Mp+5BJIMYgcOAxyiyZ9oOXgeNT5dWegTWIeTf3LS/IWIuXPZG8Z+yO?=
 =?us-ascii?Q?B0E1n2LE93q11BUlyFpEwFOGya0W2vHIEivs/J/mNweVSK9AH6BIg/GQYUpU?=
 =?us-ascii?Q?dm0ER25VNz/MAi3Z8STF6U0EHLvhbJZZTTkJAsNf+iHdpH3KLrJ8U2nhKx9U?=
 =?us-ascii?Q?Qz3SmOf6elpAbrMKxCTq19Dz+YvWNXqfAzsO1jK3QIlf8uQbIzehD/Ta3Uq5?=
 =?us-ascii?Q?UPAyAoI5UpjyZ3FT7V8/Rga5tGl1IJB2mMxU8yCzsi4T1SSbw9rSbnoqI+LS?=
 =?us-ascii?Q?en/ONiVXumewer0NmzC3niZUuouycGxAnEfbzhuNmyXs3l5sAMPsd2MOeLV3?=
 =?us-ascii?Q?lH1rRbCZs2fetK8PPGing4g+iAwJWNNzDIzgsJj8hfLkGXInp/+2IUDdwUtA?=
 =?us-ascii?Q?mktepN+vhh9y1wHpQQUT1FyAZ2VCOwWJ2q7dfsTs3uOyqh+RTTXz9ZVW7AIf?=
 =?us-ascii?Q?a24yEQUynh1IhSOWgyu06oa8qkjxS0HdoscleA96VUkC8vS++N7qtzlVyZ0m?=
 =?us-ascii?Q?nNEa+olUyHLdzk7XlOlYyu1nMaJDtxVFhdfSJ+PPGHCethayD1JljyHGgRPT?=
 =?us-ascii?Q?Bs24GYYah88Vy0xp7d5FxJ6gEEK3+UIf1PYw6ZO9O1Suj/LGztvsvLlxeMg9?=
 =?us-ascii?Q?mL3BMDurTs7MhfJT67HGB40omnfEaSKrPtZkdet0bfxA4u5xNYjzxq/uIt5Q?=
 =?us-ascii?Q?T9/092KO+ZU9PRC5U7s7GH9eDXz1+LySfoF17u3MNANuDpY7CzZhX1xbrZ4Q?=
 =?us-ascii?Q?W8ymdjT3uK4/xOEaKVsLg3oMP8fUf/eJs53FePmZY3dv9l5NO1IBvx2THZh2?=
 =?us-ascii?Q?ZjXFzTwQKO+a8pA6AMYSAVMMb1t31io7dK+CMSCNHhvQuDlp/iM6MlCAdyhm?=
 =?us-ascii?Q?FBYfU2NYnKwYGnjpKrLoRzoWhJKhBWJPVi3Er8boZARea/wRu2fk9oRtSh1L?=
 =?us-ascii?Q?DJv6GdmMlHe1ZnFPlFs5+QhHxwyeifQ667pVNcIIedBbYneDWt81j9HJPctD?=
 =?us-ascii?Q?LLvF8weTD8FTpQQSLircqodxEG1U9rOiLCUeIHOfew3FMxEk3bbicmcRFe2S?=
 =?us-ascii?Q?lNo9+nxZvp+G/l4A4N9wro15FXR4bxZHOzx3ykhXwsTRw5nNiFFZbsgQ9yxC?=
 =?us-ascii?Q?gGazj5L0vI67LbB05oZ2EsbkdhOy0m6Df6aYX8/4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843a1442-6c51-47b5-fe17-08da8027504f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:05:56.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11ZbvgCsQ97SNGi//OQDPrJGV7gYQr4ltiSsIqq6gAF5snKXaAYNEynL5KW3CRxTHtFxUyTujZNEoZVla3DLQg==
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

The purpose of this change is to enable the saving of the
channel count and sample container bytes format parameters for later use
to compute the timestamps.

This is done when setting the compress stream parameters
(in sof_compr_set_params).

Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/compress.c | 2 ++
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index e990fa093bb5..ac79b46ce3b9 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -238,6 +238,8 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	}
 
 	sstream->sampling_rate = params->codec.sample_rate;
+	sstream->channels = params->codec.ch_out;
+	sstream->sample_container_bytes = pcm->params.sample_container_bytes;
 
 	spcm->prepared[cstream->direction] = true;
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 42f112030fb8..33165299a20f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -108,6 +108,8 @@ enum sof_debugfs_access_type {
 struct sof_compr_stream {
 	u64 copied_total;
 	u32 sampling_rate;
+	u16 channels;
+	u16 sample_container_bytes;
 };
 
 struct snd_sof_dev;
-- 
2.27.0

