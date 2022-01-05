Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 479BF485BEA
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:54:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF571AAB;
	Wed,  5 Jan 2022 23:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF571AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423254;
	bh=nNAUAVctljaHr7mr4t+nNOyCjmuxus3RkPmmGM4nVH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P9BKbkwtxjyvd15+WeYCnoxnRU1Av4kkyKg54xSarholpLnGNv4ZMDmbw/g0Pdzq6
	 xQffUm9r4z3xWo81pDlT4eKd/1ipLBs/244WW4QLC7uoRxc9u7g9AX4f+wik6kGLG6
	 d0z9eWlJcdvMsnkhUmiDSiW1XgKTxn+WY0022CP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C915F8050F;
	Wed,  5 Jan 2022 23:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2891F8028B; Wed,  5 Jan 2022 23:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E4A2F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4A2F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="daA0fdSx"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205D3T0M019799;
 Wed, 5 Jan 2022 17:52:21 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gck-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2DoDphhT4Lxem9f7jG5QRgOtFuRHBnfiYFNo4QC5tRSBOlFdiimJC6wWxsl3BT24heGqAcYwIfzPQVTfuDW9h8MGYJce2KCnnOW9p8wXO0ltCGqTCwrLFKMyo7lFn0QfOm1oNR3gqwfPQZxXC95lRCPzrzycuK5QhTRBpNqjXQWZH7hcn01CjfMMCg5RHIpFDrgiWxJDBEZififpCOAL84RDa9NtBS/jLd2bE+8qQdvUm4JoCcNl1X0/sWfOzFm9vk64iNFiLQveM1flBE/PdjcDb0MUrNshsk6Qe8QSqDZKAMPSMSPhUXGLnxiVvYTYr+J8hnOIMxF3nPxhKeWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSizCVFqIt23/SBCwXNEDvuJVo857JwGQXzywYmfK60=;
 b=oAH6lPOFyP+VrVFqbznCGvRmCwkjEsadSNrcOvVSVquagDcz9KbZVkYeYBo8gfCeHtqHcQVxZqP0aikX1aKu3NLkOe4gmXQzYOySOS4pDdGmbvEOKmWSmGMr2HpyebI/sA3loKnKJirmd+j7A1l7hpooFtpQ8S4AWj8a+ogIh6ml03OZnMWY5dutxutHbAM5q0OfSNzW/K2PnV1S7gKhV+FQ8iU6qwVuUCKi1JJLyTekAyXO6/jFScUXoqkPrPgb6gHB8C3IVcVK+WZjXbmwvVZyUZJq3suot5ZYuCQpgiUDkJgiuDjmAbrMZT4GxtAFURxPg9f1gzNUC0FkddMmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSizCVFqIt23/SBCwXNEDvuJVo857JwGQXzywYmfK60=;
 b=daA0fdSxTbjCus68ewljnjtUXYeIAAk3fKJuog9gnALaI56YGqseESgftduQOMT1YrGZ7TGEctc/ihOMqBO4FpNhD4TNknNqgqPz+CST3LIE0OW6bDutvM67TeZ5La9TOpGIf4ahQUJkla5wtggwcbXsee39fbDF2vSEmKHKFIM=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 22:52:19 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:19 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
Date: Wed,  5 Jan 2022 16:51:43 -0600
Message-Id: <20220105225146.3517039-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105225146.3517039-1-robert.hancock@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:610:77::34) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2c5d6d1-228b-4458-abaf-08d9d09e0765
X-MS-TrafficTypeDiagnostic: YT2PR01MB5120:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5120CACB90971419D3E009CBEC4B9@YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0rUVIgrJB9dohL7Zbu5N99hZMqn4/l7m5lQRb9Vg9F1Mxl5C3ApLCGfs97hwuwZacOWqEnyJweOAdx70zOX5uSLawM31Dz4trJnpBuV88HbZaJH+GUKpTjFNa/lVX6MzqCUiIrvbQDNwIP5Gv+WwvvtubW38JvKq7GwJGGdvKMswGV2o2izG0pKL60pLGSJuWtp4mcMWX+bDrD+cNNpuxuVgpxu2AbBSAg8C5NmHYmGSp3GDcMGGJOuAs61+77WtyB6Xy2Zcupzy/Xs9WV4u1z9ZGkLdxyS3/9qmfi0913G1P/XuqAghkiBwSqJyM3l3r1TrcXkRueAWwaS8yuBpUt7yQ0FoshtySKCwH/tQMc/jg7PUgAm45mlJPEMvPCmV5AmYG3XN4CjPXLOiUQBpKBAq4KnZSagNBUBCHOb3JYr/5bqxKN7j/yQ9HNkAHQmgm397xGLtN3O794FKlysvSpgNGpZfIYSjwPmje4zuknSKeypRDikupo2uYkdqfDc0eu1xGIlyX88rk/8PTPjqv9HN/DGnqA3/CshLydv/jEwerwgMjLaAfXP1OaY6a0tiqbnTYM2x/6UY2PKbN4SYKDUFey5a9M2+dBkGeneOp3dJAQEwcXf4UOnYfwcZQ9w3eRcf/o5UcXnnJFh6y6AIYDs1AvOHk91A+5s8Ugd3pdS1fv4I29ZyHh0ZHbMf7qxQXx/VdZiXfiW+X9EyH2QMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(4326008)(508600001)(6916009)(2616005)(5660300002)(52116002)(1076003)(36756003)(83380400001)(86362001)(66946007)(66556008)(66476007)(6486002)(6512007)(44832011)(38100700002)(38350700002)(6506007)(6666004)(186003)(26005)(316002)(8936002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FrUPx+lbOjsNLveRKFFES8S55u5MfflNpET0iaFKEUfeOp4HHcjKV+yStAdD?=
 =?us-ascii?Q?ErjcQWJnVY+y1fuplKCx5YtrEiAcSXBbT3i0wtiH9dtiNpfcQkKo68vTjl+b?=
 =?us-ascii?Q?SjmW/aczfKOJ3AxrnV9y29IU8iVlXg3WiXlyZqOgsCsEVQjoUbPenGIzwiLZ?=
 =?us-ascii?Q?iXkpFddLns5LS6Ru6Hl49ZxzOruHad4av5Fq55huUwvckt7oShS0n3PfJY4v?=
 =?us-ascii?Q?d4CVr7KGQxoxDdTJ81P49MWp2V69Ol0OkVRQY+PyuB6vuZMY2qp+u3yvUxfC?=
 =?us-ascii?Q?ezD4/TPoEgpCYFr1ZSAVC2dF3h98OioVw3eOQPg+CvKRWwk7OtmSvbdkX9i6?=
 =?us-ascii?Q?0lyubhpcPZ7toc3moJwoA2e3cDdBuavR5A+haHVzXIafSvYb+6ZWQpq1ZvMD?=
 =?us-ascii?Q?90a54VDcokwLsqzR9A2td1FQURuIuLb5UJ2OHYatWpdVjmYw+ZhatIsNTs4V?=
 =?us-ascii?Q?ziAHeJidXuu6UDk4X6uEgJrj8hTsGpTWs9LEIKHuDtTdY1mWPbBDBZ2jdzTC?=
 =?us-ascii?Q?+Rd9EBuBb652KMfmIWHnGmUpON5U05UjHKF9gDM6aZsj62oA+VR19qNMem7l?=
 =?us-ascii?Q?8afBI+QH6n1i60tdnRcy/6JwxqkzuSR7Q4Y9Z7YQyZyASgZIVsQ/4FWO1Kr4?=
 =?us-ascii?Q?B+pmcbkc0HEGN2mIfPmBp6ZHw9lJpNWGe2XevakkzEsSafFrMp/jLeyT/eWK?=
 =?us-ascii?Q?81j1HS0gtjulYVb6kRovb0owOPPd6YqpJvfUq3tdATPT5yUqO3GOmCcBnKUk?=
 =?us-ascii?Q?qJNxFwr6OdWQf3fBXDXb6k0QDWLctF/LiAmtuSTtP2M5lYI2CdOezV/zTVfj?=
 =?us-ascii?Q?dxBBu8mNFYn2ViucYt7cJsZ44qtBJfwOx0my1M1enHkIx6Y6Q3Bi7c6GwRs4?=
 =?us-ascii?Q?aZleq+VgAkGjyx9zpfffNT+SdMsa9Lqwu+vjYBSQ4ZYEuj/ubHdo0GTgyMJ6?=
 =?us-ascii?Q?DZz/75pWgJswkM5epEV0OGY0X5MosH3u2Jvb8W4wUqtMJou5skTPjJ4VSkBK?=
 =?us-ascii?Q?sJEE+Gs00FlATYBou0OUr1xo55GSrbMHv1KrwhnUk5qxZsBsU2jiIr8ePyTm?=
 =?us-ascii?Q?WnRRhrF1H3067OxeCKYhCR+W9DxUQXqcE24OWtIv3Zh8gVlw0Ih2uVf+ATMR?=
 =?us-ascii?Q?RNbZv8Q3qEUMuClmxTUWSvf3OpJIVhfnqHcyFqvAF9OPolW9AOc32P1ED8Y3?=
 =?us-ascii?Q?Ynu6oHAEFdXpdr3Y6CMwrLsjltT0KCf7hONpInOK2+Qb798xHCGs+OiYfS7u?=
 =?us-ascii?Q?QsT1Pg27hglF96bcxIcr03dozTp+MTdlgYsQPQnWVlsu58gcGVPDvkcr910x?=
 =?us-ascii?Q?Vy20BvA74OIGkLdG7TFlHaAcPJlwSeFPxCPX97Qh1VgG6am1bM91xz0N1b1U?=
 =?us-ascii?Q?cKCXd+Qex6kH2pYvQiJtaUOvdPZVyfpx+Q8RP9x/cu1yFbB2Do+TjSfUZDDr?=
 =?us-ascii?Q?HhPjryze0FTT5z5QbHjPAeIZYZrQDPkbKFO/AH5paG1foU4DfIo9QZZp3Pe4?=
 =?us-ascii?Q?Q1j7PMna+GBJzMsVxY0YOZ5ySx5mONy507ToGXTmExlBp9g1jeOxQXYRwWzB?=
 =?us-ascii?Q?/nGFtAAmyOPyK+IGWo3tate+Tz1/sxoOr9FvOVSK6ITqLUM5WXAey+7JeIe9?=
 =?us-ascii?Q?/jFWxBOVioaaEeeu33nDgroXw0R6At5IoN0OGzomJsrbSDR0/9lCUbuuC9q0?=
 =?us-ascii?Q?62n5i4YIn2tX4uEDOhksXB2t90I=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c5d6d1-228b-4458-abaf-08d9d09e0765
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:19.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCAw+D/ReEt3m0IbzTtlQML5lp86gmSVRt55OCfQZZ2Q+8V6uMxwZkPUkg7EoYsqPk44xDcU1SlPXAH/onG2WlsqRIFQcu6vzwdpsSnlSjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5120
X-Proofpoint-GUID: CWuujyVMXmTf0DJGFPbPk3_b6OsgT2nd
X-Proofpoint-ORIG-GUID: CWuujyVMXmTf0DJGFPbPk3_b6OsgT2nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=572 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050144
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

This driver did not set the MM2S Fs Multiplier Register to the proper
value for playback streams. This needs to be set to the sample rate to
MCLK multiplier, or random stream underflows can occur on the downstream
I2S transmitter.

Store the sysclk value provided via the set_sysclk callback and use that
in conjunction with the sample rate in the hw_params callback to calculate
the proper value to set for this register.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index db22e25cf3f8..d35838cf5302 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -84,6 +84,7 @@ struct xlnx_pcm_drv_data {
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
 	struct clk *axi_clk;
+	unsigned int last_sysclk;
 };
 
 /*
@@ -314,6 +315,15 @@ static irqreturn_t xlnx_s2mm_irq_handler(int irq, void *arg)
 	return IRQ_NONE;
 }
 
+static int xlnx_formatter_set_sysclk(struct snd_soc_component *component,
+				     int clk_id, int source, unsigned int freq, int dir)
+{
+	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
+
+	adata->last_sysclk = freq;
+	return 0;
+}
+
 static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
@@ -448,11 +458,19 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	u64 size;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xlnx_pcm_stream_param *stream_data = runtime->private_data;
+	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
 
 	active_ch = params_channels(params);
 	if (active_ch > stream_data->ch_limit)
 		return -EINVAL;
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    adata->last_sysclk) {
+		unsigned int mclk_fs = DIV_ROUND_CLOSEST(adata->last_sysclk, params_rate(params));
+
+		writel(mclk_fs, stream_data->mmio + XLNX_AUD_FS_MULTIPLIER);
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
 	    stream_data->xfer_mode == AES_TO_PCM) {
 		val = readl(stream_data->mmio + XLNX_AUD_STS);
@@ -550,6 +568,7 @@ static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver xlnx_asoc_component = {
 	.name		= DRV_NAME,
+	.set_sysclk	= xlnx_formatter_set_sysclk,
 	.open		= xlnx_formatter_pcm_open,
 	.close		= xlnx_formatter_pcm_close,
 	.hw_params	= xlnx_formatter_pcm_hw_params,
-- 
2.31.1

