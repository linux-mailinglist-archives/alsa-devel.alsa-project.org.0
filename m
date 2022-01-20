Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459AA49552A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCE52D5C;
	Thu, 20 Jan 2022 21:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCE52D5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708906;
	bh=DeXUnOG3se7RanTt7yDPQOVEbGLNMk6z6yThekqymrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeLZhUZwj/LKPMobyWW+T+jGrtFYd2uE2QIwiY9AopMbtalWI0T55Z2IPWoGrxhdc
	 tdKPflM0wL1ZuXvIv/j9RkOcXpKAh2YLj7wCGZFbAGpjuUI2NiPhUvIBfO+lsrpeLG
	 VkXy0nduMKw963WfGApLjVvF3YeD9uZzzhM+eK20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEDF1F80527;
	Thu, 20 Jan 2022 20:59:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031FCF8051A; Thu, 20 Jan 2022 20:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88337F80423
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88337F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="1divPMbi"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KCf0Ls006546;
 Thu, 20 Jan 2022 14:59:01 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2050.outbound.protection.outlook.com [104.47.60.50])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dprrpgswg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:59:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ym8iAURX5hKGrreYK0T1LRks9GtE3Lq3QjMGnpLLMomsS39TgjxOh4lZiwQk909177SozkTfNFoNYZFOdCGrmPUM4kuv0EPy0Svi0I4GtMWBasBlkWah5yoOopg37QAeHdjGC6RoWXAUM4Q2tAdFr25s1iG8nR4XrYrZhcSr+TCYSmP9uSvEAeTZ/N312Mbg+R1qa80Beg0sdDNLrAK6ePLKyxIF63ZdrD5d7A7dNiCb0hm2z6Pa7AaxntWvEABFVM4n3zz8iAn9BLcPPj7HDeU9BwZKIpsP9nSe1OxBObaRYlnygmzOjDjePdl1fBuzGRSp8TD1DNS/cIuuRKecZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+VYeQgNfAkaq5cWPQq7rK1TRYIGbNZAzXN4PRP/q2I=;
 b=apwzorxkP/EexWZ5hw9x0/Xk21p2QlE6rUpwot3A/SYFOpcdw+daI6eim/fiHwBSzDTQtLEykfHB6ocbPWJc1eH3rV1wGQeH/Cn2lUCPuX0Gru+Kn18gQenQmiJ46jb8Film7YHIiZly3gOYeg2w1a9ZjaMzNa8If8UUFDhEwaJdGdBah7EW6DjgvCVFAQnsrcTIZTYFDKek1mNhJ+DKIpMGCNk5ic+5b6zBnW+SMoJZ2NywKtWhZLF5Yw8xoctIhu0cCr9N7Hsbyn/yWvtjYdOhc9IA4af0WmZzvjSITJ+WM+9TxsxakyEyvnnxHeVgfbFf/LmBrK45C/sHx6ZqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+VYeQgNfAkaq5cWPQq7rK1TRYIGbNZAzXN4PRP/q2I=;
 b=1divPMbiGqZ3NyGpA9ZcquRxrZe+9eU5pYNWjuBh9APgi8scjg5Tu0XXd1AOaBcMK6JtzSm8lqr8IFfvCmjfAEJuWH8RFV9czlZUKNSvWvIuPXU/iUpfEA3wcGgcyGFRajf7hXGpKWOh/vuzLXmeMIafKDjYaSw6+isfAnyPg50=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by QB1PR01MB2563.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:32::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 19:58:59 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:58:57 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 3/6] ASoC: xilinx: xlnx_i2s: Handle sysclk setting
Date: Thu, 20 Jan 2022 13:58:29 -0600
Message-Id: <20220120195832.1742271-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120195832.1742271-1-robert.hancock@calian.com>
References: <20220120195832.1742271-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:610:76::29) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4027f644-cf0a-4fe5-bd7a-08d9dc4f4a9c
X-MS-TrafficTypeDiagnostic: QB1PR01MB2563:EE_
X-Microsoft-Antispam-PRVS: <QB1PR01MB25632A13997B0D994C71346CEC5A9@QB1PR01MB2563.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJ2L+bJ5ZNrqjm3mH06ur9rYjL6GsQ9Szg1I3UaMyf9htjMmCKl/USuMlFFH2l/dMl9ZwhObrDxDfWCHxLrxcxd8Qyi7x8Qd8SwqHQ4TJfuhkNvkLtoReN01Ga3j/ASy/zu6w1U8g90hb9281Gykeax/mOeUOqXIzM2WnvEoz4Rf1h8w+BfHpDcrT8L1BLbWGfdcMRfaX0gSozKJ1R95DCdcVvB0wxfY+VSmWo7X7T8fJf5fCxLIDIp+up/iXh9fVoQ4ApBh5YJI5IUYKvvCDSJdxozPmbwTZJ4Ww5JxE0V05d6tnK0WDcb8ejNKuIfXMLx46CE9a9EqObzS3+7cMLvdhl8en6Dfz6300EkKR0sKu5uXKK08XnFpuDz0CNd703jO9yRQVPMHR39cwWaNB/PuaK6vsWoqfhQLv3UGwoG12qyrCeA1vX4wTAnSPcppPxyYsdvhn6LfXze9jmc2TKnMkooZ6W96WXZ7B+64pId28X/tOo0ElROwkxyU6tc+4hAHDMEWZTPxjEzGrQIJF639kYJJBueXNCbGfoYgNiz8LtlH8hPhZNPY/50kEE0TShG33c5pKjTkMyxtCxN/a7WZVFhL0T5PQIxPrJIXgRYQTXPkajVfnJYSsKvVVXJFIxrM/RZNXfVH/nFih+vgrWtWObVGP5kGEkjDIF4otSqkephNcwGLsSoQjyI8g2AYKX9aGqPdFpCV0dNGJTKAxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(86362001)(8936002)(6486002)(1076003)(83380400001)(8676002)(6512007)(2616005)(107886003)(5660300002)(6916009)(66556008)(66946007)(66476007)(2906002)(508600001)(38350700002)(38100700002)(44832011)(26005)(7416002)(52116002)(186003)(6506007)(316002)(36756003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9LP6tL+l0D9hB/u60aiKqaiSQQBlL/4LcMU+TwuwGa4GR0BIuNdF1Kusho0b?=
 =?us-ascii?Q?HIvJBm44HNVww9kYrnmZIq505s1XDTNNE5BB+TOGtz+ohG0rFLGOjDGJ/99e?=
 =?us-ascii?Q?eDAL5cV0m7YUANmAUQcCJ6tMD2NDov9jCEIUyiV99S9FDW6eGIWJDjD5sH3m?=
 =?us-ascii?Q?31si8FTcPSG34vwEtzX5dWUKd3njMo5TqBpIrjD9ZGuRSzIViV8m5DLLN/fm?=
 =?us-ascii?Q?EJftdd5eBvReUgL970iKldfHjB+SaP24M/z+gMfPwdWVxA1QsU+Wir2uMnNA?=
 =?us-ascii?Q?H2BytiqOWTYXVvZ+jI2EEoEPCid8T3j23k2t1/cs9o6kyFoDMSwSXwssBzNS?=
 =?us-ascii?Q?MYEgArmdDlRxJK08GZehU3N/lgMNonbjwBC5bThiTs6QMAwc9es/MNkVFDiD?=
 =?us-ascii?Q?PT3RmQ3ysqKM1kuZwlCIjr6Y+7opiqIXXjmt429HqLc/k6ZcFSo7YydqNCCO?=
 =?us-ascii?Q?ZKvJsPrw5i2HQl10cRgR8+LJiXzupkw67wteC4ZdMG9OIKPyGvkceQAsIRud?=
 =?us-ascii?Q?Hj93OgHAFQVb3AcDHXsy0zX2Hy4wChiHFBLtYWYQzF1DRJGrtBkTXDuHfo5y?=
 =?us-ascii?Q?OiQIs7aSccga0/yJLcHl+vEoMSNo3XqrEuXaQkNjSEfA3lTieDcKXYY/sdkS?=
 =?us-ascii?Q?a9cd7NUZfnRnatjjxe1aNuDyhtQ97g2VlCRRcUah+ORgTPLs75lihaAR5rsb?=
 =?us-ascii?Q?gEgmv38dljh96tBbORkHkNlH8pfiAJTQgfR0XH1kLuKrfD5K0fOkFM0SyKx6?=
 =?us-ascii?Q?RUE63N8GJSgPmUhMCu+wQX6EWiGwPTqQdv350cW/PAyp0YNMnNN2uAsDxW5/?=
 =?us-ascii?Q?BAgIj3lWw0x2AWvygoALwX9L/xUm1k0YPQiMYSnj3eAjfL6bmHCYZxYfukyZ?=
 =?us-ascii?Q?W682mhjrJbAwb7YJWs8Pc2rDKaypak5KLdgR7MzMGj90fjZby78GE4fqx6zJ?=
 =?us-ascii?Q?A64EkDBCPn4X8/lIC8g+zG1bssx55TcZd2KqlHLOielOJoJOBDx83F61CHf9?=
 =?us-ascii?Q?ShmMgaNV+O8IdAbRZV3Ju1GcspnaU7wN70DmID7TscqF+G8+v02aLO1sVuVv?=
 =?us-ascii?Q?vMXX6nju8D0x3NOnbfdafiq8ALkR3JY56W4U7/Z3x7s+uFdvgu0w7hwH91Py?=
 =?us-ascii?Q?uMBf2hQbLAXhuIED9anUJHraUxqgWtxmkCX073Dkr5407B8CLHtN99/uUohF?=
 =?us-ascii?Q?JE+V22CmobeXoikSXY56gCqgZkREOWdilft2SBcqJJHusbw2y5cwfNohR+Wz?=
 =?us-ascii?Q?C3loPueYlx/5YmV25Hg2lRNZ0d5yBltXELRlKmUY3qfz5Edh6x7txAFofM5e?=
 =?us-ascii?Q?9i85NFNGhCVCRYy3MIlxTc9c1RoJj3DLXHorGISmHJC/006puA8cyozMgwVB?=
 =?us-ascii?Q?12y8JLBRl7pWoDSEMBKJwYStSKpq4ecLg0f9ZlIPTy5VxoewarTOK3ZWNOdi?=
 =?us-ascii?Q?uv8Q9xbY+mKcJus/b19g3QGxdMS5DOdOMygaGlCjYFN25aRechXMVw7kiGJV?=
 =?us-ascii?Q?TitQCabwdaLZRfvjFRgEmtDDb1HlhZtAjpqGYkronYqFWCZvJhFcPIw0HfgT?=
 =?us-ascii?Q?wUvFowv6MPTxJEZrH6N8HE+1K3asDlBs1t7b6Po+ICnRpx7yMwDE+HPJUXHx?=
 =?us-ascii?Q?Q18hvSF76/OOnmxVpTdg5jUWZA3YEaWVqEZehU4mjOnaKpOwzAk4RyJ9m6wI?=
 =?us-ascii?Q?P+tavQMMj6MJr4uDLy31EFjwcLk=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4027f644-cf0a-4fe5-bd7a-08d9dc4f4a9c
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:56.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XViaf50huznmEPcCtRAsi4ru75fPJ+AZMddE0M88JeJTVC4+Wcl7CEoQ9qC7H4NBJZYdlu/gqqMK8+bvYi8yEd2jWXXW6Hnk8fc0eKHuj0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB2563
X-Proofpoint-ORIG-GUID: q1voieaYanJoeKkmZ9gQ1yuKlHIGcFP4
X-Proofpoint-GUID: q1voieaYanJoeKkmZ9gQ1yuKlHIGcFP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=704 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200100
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 michal.simek@xilinx.com, Robert Hancock <robert.hancock@calian.com>,
 broonie@kernel.org, maruthi.srinivas.bayyavarapu@xilinx.com
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

