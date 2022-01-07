Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D9487E81
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:50:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4641A98;
	Fri,  7 Jan 2022 22:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4641A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592248;
	bh=DeXUnOG3se7RanTt7yDPQOVEbGLNMk6z6yThekqymrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpS2i1+P8lB3hrnhaSRpl+kbrqpVJD8InyCJE4dVN/Uxk9d0bBqzhg8MKAstOgrVT
	 XBbnryu3/vODmua4ppdmE2xXIHE3gxJzf5JyhlaBLGovnVER7+WsmTSOmozwfhX2wW
	 VLTku/BzA/5/vIpFZtjcnSob2YsXSoQMzXdfK3QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C521F80525;
	Fri,  7 Jan 2022 22:48:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5C3F8050F; Fri,  7 Jan 2022 22:47:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D75DF8014B
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D75DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="OaD/7FTi"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LDg39021396;
 Fri, 7 Jan 2022 16:47:41 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2053.outbound.protection.outlook.com [104.47.60.53])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivLuZy7PDbukztpHiNndmLfIfUhrjAuPKovVd/m+AHkhyYJ+NqOLMHrh0XZYHwwWq4dmukjx5NCGT5c/s6IOcahT4WeYqs7abxi3deA1qjy+XV1Fszbt3uFtpY4IX2tIEn/ptY0BImgvaFrQimZBXeumJsf626NWzEZthcLmsoTZ6Ql6NnNm8AVYjn9ylqaF3J/Epc4atUy1eEfwY2I3ejSSmvkW2jnIxH2Xs1Z08+LvC+78QxRXNIJZ1UUWYsNnuQsdRfAgut6nsLzS7nq8/jfxhYRZq+HAhOt128S6qx7EER9QJMctFB5ZorRS4KFd1WuQEBy/I4QOtd3UJ84ntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+VYeQgNfAkaq5cWPQq7rK1TRYIGbNZAzXN4PRP/q2I=;
 b=dgPeB8nk0IIJU6SSDvl63Zx8UXT6o5eIrDE0HQuQFpdKyORSQO+PHOvP2zQ5CRf4QUh7iyP16V6qh5bssn79w3FYQlRv36S8SW5NhykJgs6Xc7TpRSHiiUwVA/OxeRKASyymJ6ttt0uIWNeiJBRK4fkQ9gVdX2c4KjW/eY1+67cR6FsLZ4PtsJClSLnQO1BG5KukMjJ3Wa22KcYDk7zSWCvFWYKyoRBN26ODnb2AHRbhbe7Hu9Q7V3fhSqp9YI16rqRlOODCBPi1ARPknoH0UlUzyxId6zOyx6rO/1Ek5/vEvw1O93D5FlXCESmwqBML6hXTvFcIRg3Z1BSskqg//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+VYeQgNfAkaq5cWPQq7rK1TRYIGbNZAzXN4PRP/q2I=;
 b=OaD/7FTilnt/ZX8D1Aedl0n+ual6gFJrWZsD5K6lTHdtfGiNKCXZX8K/piKkr0zJIeZghWPTVb3OD+mrzOgGJUen79+iXlaK1jYUZbFjvfSPoFl8/7SBZBL/vED9jQC/mrme3N5Xya/Dyc5Ad+u66EdcaRdoG4jknZpfOTQZBhg=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:40 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:40 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/6] ASoC: xilinx: xlnx_i2s: Handle sysclk setting
Date: Fri,  7 Jan 2022 15:47:09 -0600
Message-Id: <20220107214711.1100162-5-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107214711.1100162-1-robert.hancock@calian.com>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR04CA0136.namprd04.prod.outlook.com (2603:10b6:104::14)
 To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2c20826-a940-4a31-9ece-08d9d22753df
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB627584B6BFD7BDDDDE1F4AA3EC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82b24kA4xzw/T8jas8EMjPQx7h+ZIgcy3ax9GciCGveOG4hufxezfX38EHtvPUF8H+U6GeqpwkEjjCRTEbcqEnv+jkTXzhl5luxXZTlH7h5sYXb/zId32oU22DwgrvXWOsNmRycztw1oMQK6Z1tY4x0Nc5I3HAcB+1DpHHfvO8sj/lKHFQ7IZ6nnISA3W2R+M+zFaqfNVr7+4fH4zZe66u7YKoBlqhFOVtWI3EVrl+CbwfN7kTgf/8lI429lRUW+nmlP5jK3E0Ntspz3qdn0mOl22tDSQGGqkeT5J4IHXCjAvNQH/7cQw3M3W1BokWWx9ZvfYivb6HJkFKS04K3x8esXmNaaH9ApLmBtyctCOTcGMGKrYDGdq9tbFfsd4FzeZC2Wok7yTKsLbqSTy4N5k21P4KwoXtEV3hgbvcOGSuHAcnSj0mwR+drWpBEqoVqEJFFSh2ix4wwrQzZiD3jRO/X1xHeZefN5ukNRtndFKVuKo+zmb7QlB0hF16jWLd64R3dNVj0tTJnovZhm0eyO25QJa9cRQXvMasqp7HTJO1eDzv2udAcVjLeDYp5KhMTQkRkNTJVaphQqssBkGi7vchcmCGQVI9l/mIHEFre96o9puElbyMjQnEq9A3q9OVG1/BumZ5tvY6g8jmdREVriJj/C2Zz4HXZrKPXQJINsoi610i9jOsoFPowbKu+K0HxIfHMazsqUHjxaFhVGJBm3ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulVNyArp7JoJiyiQwdqg/RxnOTkGrnEwjwc7jRcM4yPgBuSXsHv2YEqxtoYC?=
 =?us-ascii?Q?Shd0JtwfHVpDOoqYcRbpOBUGkrqY/SAMjvZkjzA/eZ15jVxZ/2SyPHpEKUK6?=
 =?us-ascii?Q?mDA2ww5WgFovHU8Di87kVy0cQ4Oqw5ERSshLMZNLtFc7iPvqkbS00b9ViZVv?=
 =?us-ascii?Q?7vVHhRUmyWFuHusdtJYe6eLIrr6JS7VSSpdPqt2HQu/iwD9FNEXuMmpxT1M/?=
 =?us-ascii?Q?T/M6D/9Iw/bNk3HdDdiDYu7T6XcvMNm3WXw+b+ADD+rzKzj29AhJSS5IaYXZ?=
 =?us-ascii?Q?/imiuu7omDNcvFpmQ+dgBMA4Gu59aqAr0XNBm9dLeDfyndezpZuqIlChR6Tb?=
 =?us-ascii?Q?lbhd5qVB+mTsOOUVBWZhNmv3TmkIgf9qRAKUcOOaLXKP3RSeaieZrcD2aFTt?=
 =?us-ascii?Q?v6siZF0PxqNQRV1kIJTSXz1O9QZAGnO906bxTndWmUrN8jWR81CZIRtLhrLT?=
 =?us-ascii?Q?wSOYmdGK/KA7ik6EC/NgLZmu//Hn3g375qv71OHVJd6sCsYMkQ9cMcpg7LE1?=
 =?us-ascii?Q?sLHtlZuHyMsp0Y0kw68tQ64agtigF7vq0FK+WzvUxEtlG5GijeBaKyPSg3EU?=
 =?us-ascii?Q?tRoelBnmDdTMAJWfnsjeRkBbNqUCBeCJ8bAr0g3nOqEgr2Ir9YO6CU1l5Gp0?=
 =?us-ascii?Q?//pehC0s15zNxdunnkwNP/t5LgFQzo/alYPa5jU0csXs6LlZN8Z3zyEl9ItX?=
 =?us-ascii?Q?RgmjySlIN4uP9uXEBlUufJ2h1S2I/6V78mhJWSVhvvs+Sr+L/IeZU5DNI+9p?=
 =?us-ascii?Q?844Pi1Vwws8eimfbjXugGSw4a6Sn25B96P4J+iTQSTJMxkbyyxCD9iRd82w0?=
 =?us-ascii?Q?Xfg/QFNUmQ4bmPVt0Y4xkCyRKuzXTbBYLphy42UMNTQrUIE2OywrmBEZ4nIf?=
 =?us-ascii?Q?/QfRwgzaIbM3UtfyafJe2E4048nFI7RNZd29HcVh+/gznN92vn5cZ8Ui3yXH?=
 =?us-ascii?Q?RVOhi60G5wDqCZwgWowMpsnP8UDqbqibjdjMzrl6dDJys+nvJAr/41m5O69y?=
 =?us-ascii?Q?3PCqUJmCG8dkiMWFPEsIH6JU59RLvuPGiidnF0d49aRc+NdA7PXC9boJEn/7?=
 =?us-ascii?Q?UcbGJryUW5GsE54d4R6MJ8Kyloj6213o9Kle93ijadHr/6zKhz+m9Qt9Wtuu?=
 =?us-ascii?Q?GeoDHZ+RpQn3Ffst4V/ykm5/3TERkuDgT8octeTEp7yUJn8DQ7xNaLuKr30A?=
 =?us-ascii?Q?Xva+Iwc5cG6VgCUHFYNNUvaGgZij7ZdWyuoFFjA4mk0H7hl3hozExiMRDUsd?=
 =?us-ascii?Q?1k3ycOc83iYCs8NNgJ5MOBZrnL3l+dnaoCMwB4HR4aOvYzgigwvgcur9u6Zi?=
 =?us-ascii?Q?IwUq2e/agMdCn5vLqpzuC0BXEuRnFZbBO1th9aT1Q0mFKIVt9qBy4UVytvz5?=
 =?us-ascii?Q?Vay766jR15BQoEaqixdLrd2jJuXwq2ZrL3qCqMZkWKdF2x1Iu2c+XUTw4rZF?=
 =?us-ascii?Q?SnMAwutFxfpG7U6DA/Av6UHrjLsAEvG4eIXyXtqjF4wJU+p/tAs4pu7ajiYN?=
 =?us-ascii?Q?85EakRQcVQ9cXx5GjIjnoTj+z9mpYdeKrG+SmtiOO1wI6Nh8vF8Q+7dz8gFS?=
 =?us-ascii?Q?1BHhyg8rxCKVSQ59emQg0jS13tNfTI29zmaIKGqtmuXM2c80VYOokHEgfWJy?=
 =?us-ascii?Q?0IC/5Wkwv3t6KhwXuLBj0Xj2t1RDk2zCLtSV03yRHmj7U4fsJ4a+b//GNbVX?=
 =?us-ascii?Q?f8R5fNEUvAQK4SUHgptNGsgaLAA=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c20826-a940-4a31-9ece-08d9d22753df
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:40.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sXklxRHt53y79WHwP5JgbNToDGi43EABcmtRfxSseU/qw4Nl4ibfviw7OTplGWSvwnz0dvkzQ6njQtoo6dAqejw9/aPm1o3xB3IswG+Dt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: CyQoy6dfd2j1NUUQYtTgYSGgx-B6Mswn
X-Proofpoint-ORIG-GUID: CyQoy6dfd2j1NUUQYtTgYSGgx-B6Mswn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=740 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070129
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

This driver previously only handled the set_clkdiv divider callback when
setting the SCLK Out Divider field in the I2S Timing Control register.
However, when using the simple-audio-card driver, the set_sysclk function
is called but not set_clkdiv. This caused the divider not to be set,
leaving it at an invalid value of 0 and resulting in a very low SCLK
output rate.

Handle set_clkdiv and store the sysclk (MCLK) value for later use in
hw_params to set the SCLK Out Divider such that:
MCLK/SCLK = divider * 2

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_i2s.c | 91 +++++++++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 10 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 3bafa34b789a..4cc6ee7c81a3 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -18,6 +18,8 @@
 #define DRV_NAME "xlnx_i2s"
 
 #define I2S_CORE_CTRL_OFFSET		0x08
+#define I2S_CORE_CTRL_32BIT_LRCLK	BIT(3)
+#define I2S_CORE_CTRL_ENABLE		BIT(0)
 #define I2S_I2STIM_OFFSET		0x20
 #define I2S_CH0_OFFSET			0x30
 #define I2S_I2STIM_VALID_MASK		GENMASK(7, 0)
@@ -25,6 +27,12 @@
 struct xlnx_i2s_drv_data {
 	struct snd_soc_dai_driver dai_drv;
 	void __iomem *base;
+	unsigned int sysclk;
+	u32 data_width;
+	u32 channels;
+	bool is_32bit_lrclk;
+	struct snd_ratnum ratnum;
+	struct snd_pcm_hw_constraint_ratnums rate_constraints;
 };
 
 static int xlnx_i2s_set_sclkout_div(struct snd_soc_dai *cpu_dai,
@@ -35,11 +43,50 @@ static int xlnx_i2s_set_sclkout_div(struct snd_soc_dai *cpu_dai,
 	if (!div || (div & ~I2S_I2STIM_VALID_MASK))
 		return -EINVAL;
 
+	drv_data->sysclk = 0;
+
 	writel(div, drv_data->base + I2S_I2STIM_OFFSET);
 
 	return 0;
 }
 
+static int xlnx_i2s_set_sysclk(struct snd_soc_dai *dai,
+			       int clk_id, unsigned int freq, int dir)
+{
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(dai);
+
+	drv_data->sysclk = freq;
+	if (freq) {
+		unsigned int bits_per_sample;
+
+		if (drv_data->is_32bit_lrclk)
+			bits_per_sample = 32;
+		else
+			bits_per_sample = drv_data->data_width;
+
+		drv_data->ratnum.num = freq / (bits_per_sample * drv_data->channels) / 2;
+		drv_data->ratnum.den_step = 1;
+		drv_data->ratnum.den_min = 1;
+		drv_data->ratnum.den_max = 255;
+		drv_data->rate_constraints.rats = &drv_data->ratnum;
+		drv_data->rate_constraints.nrats = 1;
+	}
+	return 0;
+}
+
+static int xlnx_i2s_startup(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(dai);
+
+	if (drv_data->sysclk)
+		return snd_pcm_hw_constraint_ratnums(substream->runtime, 0,
+						     SNDRV_PCM_HW_PARAM_RATE,
+						     &drv_data->rate_constraints);
+
+	return 0;
+}
+
 static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      struct snd_soc_dai *i2s_dai)
@@ -47,6 +94,26 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 reg_off, chan_id;
 	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
 
+	if (drv_data->sysclk) {
+		unsigned int bits_per_sample, sclk, sclk_div;
+
+		if (drv_data->is_32bit_lrclk)
+			bits_per_sample = 32;
+		else
+			bits_per_sample = drv_data->data_width;
+
+		sclk = params_rate(params) * bits_per_sample * params_channels(params);
+		sclk_div = drv_data->sysclk / sclk / 2;
+
+		if ((drv_data->sysclk % sclk != 0) ||
+		    !sclk_div || (sclk_div & ~I2S_I2STIM_VALID_MASK)) {
+			dev_warn(i2s_dai->dev, "invalid SCLK divisor for sysclk %u and sclk %u\n",
+				 drv_data->sysclk, sclk);
+			return -EINVAL;
+		}
+		writel(sclk_div, drv_data->base + I2S_I2STIM_OFFSET);
+	}
+
 	chan_id = params_channels(params) / 2;
 
 	while (chan_id > 0) {
@@ -67,7 +134,7 @@ static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		writel(1, drv_data->base + I2S_CORE_CTRL_OFFSET);
+		writel(I2S_CORE_CTRL_ENABLE, drv_data->base + I2S_CORE_CTRL_OFFSET);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -83,7 +150,9 @@ static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static const struct snd_soc_dai_ops xlnx_i2s_dai_ops = {
 	.trigger = xlnx_i2s_trigger,
+	.set_sysclk = xlnx_i2s_set_sysclk,
 	.set_clkdiv = xlnx_i2s_set_sclkout_div,
+	.startup = xlnx_i2s_startup,
 	.hw_params = xlnx_i2s_hw_params
 };
 
@@ -102,7 +171,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 {
 	struct xlnx_i2s_drv_data *drv_data;
 	int ret;
-	u32 ch, format, data_width;
+	u32 format;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 
@@ -114,19 +183,19 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(drv_data->base))
 		return PTR_ERR(drv_data->base);
 
-	ret = of_property_read_u32(node, "xlnx,num-channels", &ch);
+	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
 	if (ret < 0) {
 		dev_err(dev, "cannot get supported channels\n");
 		return ret;
 	}
-	ch = ch * 2;
+	drv_data->channels *= 2;
 
-	ret = of_property_read_u32(node, "xlnx,dwidth", &data_width);
+	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
 	if (ret < 0) {
 		dev_err(dev, "cannot get data width\n");
 		return ret;
 	}
-	switch (data_width) {
+	switch (drv_data->data_width) {
 	case 16:
 		format = SNDRV_PCM_FMTBIT_S16_LE;
 		break;
@@ -141,21 +210,23 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		drv_data->dai_drv.name = "xlnx_i2s_playback";
 		drv_data->dai_drv.playback.stream_name = "Playback";
 		drv_data->dai_drv.playback.formats = format;
-		drv_data->dai_drv.playback.channels_min = ch;
-		drv_data->dai_drv.playback.channels_max = ch;
+		drv_data->dai_drv.playback.channels_min = drv_data->channels;
+		drv_data->dai_drv.playback.channels_max = drv_data->channels;
 		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
 		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
 		drv_data->dai_drv.name = "xlnx_i2s_capture";
 		drv_data->dai_drv.capture.stream_name = "Capture";
 		drv_data->dai_drv.capture.formats = format;
-		drv_data->dai_drv.capture.channels_min = ch;
-		drv_data->dai_drv.capture.channels_max = ch;
+		drv_data->dai_drv.capture.channels_min = drv_data->channels;
+		drv_data->dai_drv.capture.channels_max = drv_data->channels;
 		drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
 		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else {
 		return -ENODEV;
 	}
+	drv_data->is_32bit_lrclk = readl(drv_data->base + I2S_CORE_CTRL_OFFSET) &
+				   I2S_CORE_CTRL_32BIT_LRCLK;
 
 	dev_set_drvdata(&pdev->dev, drv_data);
 
-- 
2.31.1

