Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EA487E75
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:49:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C43F18F9;
	Fri,  7 Jan 2022 22:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C43F18F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592170;
	bh=C2EsZVdUkFcCt2Uu/kPlRRiL/Rb8CRMIMSH2iosmfio=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Huyf9SUu6JE2h9QiF/YtWpwU8luvCTdkI5IMEZzR2lbFweh3QicE8y9IfHMp1iV3d
	 ByL5K1uZtO/rORwdwo7hZMh5iiHaQ0gsso/WA6ow2ATKwbXe+Oi+LdiQmZxQ7/HVN2
	 QqG0xRAmneA7aw78Wq6EuaQDe8d/uzn08aamlRX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B572CF80510;
	Fri,  7 Jan 2022 22:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED79EF8014B; Fri,  7 Jan 2022 22:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAFCFF800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAFCFF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="4ICCHkV9"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LPGa1026852;
 Fri, 7 Jan 2022 16:47:39 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCxxBIjAjecUyRDuRdzY+CKduGeZiyWKK8AudRavvx4qd+wMRc7HfS4Nap+Ik3192eK3nl4nQTIVQKlG1ObxeMjZeaCfvChnJiy4yp8v05uvmeu68eQNTuH7gajrFbAWEJWfG5TrIoFhqkvJvav0CqXm80l9zFQ/bkHRXW904egoZd8lqt8oxzGWZGe5kn3EvZqGHZ3RBe9SsCsafxTMibNnl+pjyPZOEyncSEFop4Qr3rvkhFxqOynxt1mIKKZdHba2BSKnMReX1CboYPpA+03MlQBqQJ4YrdBNkpAfp7N3mL+F3jvU3/nWSaihuPuvZyn/fxe1pBXIUnIKyiqgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pbZDy1KNUdmzwraonTIO5NGbpVvq3kZtFpIJn255pQ=;
 b=Tfm2EIBG7h5zQ78JaixziWa2scJzfOg8+cqyKqV7AGFiEkyV2+j7ZbwlFP7tk9n+JhcdYdq1aFuDHbR/qeEyooPSAwCnF2u4dP+JmaT+VEM5tzvDexVsI5UyZrzZu3w+bF1331isUbBpnq9VKl91rOhdWzSRpcw5/etOrp5+OwZ9SagqixsBYrEB0HC0A0sPatcVMvj8sTYtK6FAmVlkbGDCLOwkPpu/yofa6tjpZF7Jkww+JclPUIOIgGBoaa27Sw0aB2ILmWmJ7Q8NTUnLpmRnwTOaAT/ZcyL6JDS1n+O0ez5arX24C/7v83yHN4NE2uHEfxO+YLPxx05LFkrlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pbZDy1KNUdmzwraonTIO5NGbpVvq3kZtFpIJn255pQ=;
 b=4ICCHkV9tVEMr8ehHtqd4ymMAOQJEwj9MbepvSYC40vsf61KOii11bm97dnAKJk3Cx8X2qASzUKuEpda1EgdyhiQuExgY5YFFTcMw8DtE87O4aVepNOnSmQSTPNfZ9u6yTx4YXOrN5vg5B1Deo1JL7bGLr/C79AcKSJcK0lbhZk=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:38 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:38 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
Date: Fri,  7 Jan 2022 15:47:07 -0600
Message-Id: <20220107214711.1100162-3-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: a85c037f-f934-438e-9389-08d9d227527e
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB6275C5E4A40BCE1D05343638EC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtkCulxT9KvlCuF6ARgfuOSxsk/jN5HU129zxjthhr9vmuOiyl/3Np/DzoBeBtWlY07KV6+ROwGk7GlzQyCcvc+sv2dGEhQyM1V+48uvInTfLKQ/WbaBznTVLGwwoBnesSlNOHye1BOMKSV97T1whLBSjX+O8CM49PrKgPqQ8XtleHqXA9wL8X6nbSlEcIkGvg9f3/3sjeRsvaLPc4+nu1Mpt2nn8YH0DPratPILqkZhrhDCk3tMWlmPj+DW1v+ilR4BrhcshFGiByQuvJKt49VeHwdE2zAvqmuQzkvsEgSk0em4lPQaHeig1qB1ThoXWv5bEtdNapwN2GJ86pCH6dGRS4v9DaU1psmwD6VqCmyt9tisl6yyamf0M0Uhz2AWMtCyDNKk85nLowTuwMhn6HeIJ/yV0jJ//jQEkADfTzsPxysYMrbjCJiIBGyZmFYN7fFCpaF73/lyGOwzvRIah1BHIA119mk7w9g/K3XDVIfJmoqDRXerryu2mZX6XsOfz/YQmwer0PCgdkqjzFrGHebbBcV7ZJWyg6l9aGhRtGiYwCfEuhYewj1SfZ6U2/vFCGeHX0/L310u0KoA7DLxEbkWsQm/uS1c8FQXslChrSZMdSeGX/Quxg5DdHANeZ1yyfJs4aq1jdLY8kqL0/rIIh3eogy2669WSkVeiUOsh66V08UF8VEtVYRnBR+sjrRtImQiuS6P6A0i9+eIq0zXFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vzFJh38N2Ff3NbfgmbNN79WjOxJmLXrYMGozLVa1MfyNLDsEJr81iDFsxrCA?=
 =?us-ascii?Q?2hpQY16YrmmnQ9S+A/snQnZVRmHfrkLe59tcqemhC5JiQCMjt+pb4pEtef0h?=
 =?us-ascii?Q?9W84Ufyg1NTmKy2d1SgY9wbgO02QOhDjwG9bT+6grxjXr0yk7QdYHXIAcP5U?=
 =?us-ascii?Q?wADBq8cKvqSrRg2RbWJCecBJ43+7uNYVXaErcjZ1Si2Oz1bstxARUBBIZnXu?=
 =?us-ascii?Q?b8p52rfUn75QMS1i4Kqj7LCnSVW3vOroSuoYfDIpUdMk3FN+Ttu8I58VV5G2?=
 =?us-ascii?Q?GZio2iLTE/gfDZWKA5mOF09GcEq5UI1JNtOCrGQS/vw6a031ZgJ5muJOWxwu?=
 =?us-ascii?Q?XgmvbNJvQb61oYsR9+aqsZTPYBD8/Z5WeG2kGCtqQsisQrEBm3xhgp0ZqB67?=
 =?us-ascii?Q?aTfC9/NDp/ZcMmr6Q5BDyzg/lRhk1lcI70DvGALUB+8S99KAwRGBc1fC3z7P?=
 =?us-ascii?Q?YfiDf9ptFgTLE9NRj/CKNukeXxY3iNNp8cDUavWS4CaS+gMhsvs9MqWPQKeY?=
 =?us-ascii?Q?lcmnAFIRpalbzqIkgCa9jqhOLdT1hXBUNycyki4J/sR3mtCV0B6ZXmYfUuhN?=
 =?us-ascii?Q?R9y8y0JCKgXfylTWYb5j5Sd2L8oMOTfCatvBg+YzZoRFbnPSOj6+kKQKNK5l?=
 =?us-ascii?Q?CCCgcaLBRoarMGmVJMru2zPrL/nFFfHyK7/lXIHmnyKEHhtbg8rg1Qyh4dZ4?=
 =?us-ascii?Q?oNQzrsHAPvcZw4HSJRw0vPCTf6xHYSNOv0+2csg6COH+qulpAmJ/JB0JSJJQ?=
 =?us-ascii?Q?Qsr3JkIiUSTu47MCe5iNxon01hHwH+LCzkMs2HqvXRiDO1xFrdEHQLeBZQTp?=
 =?us-ascii?Q?KASpD65QKpauCrd1ZBqWPKXu6m3UhZ/jpgTVCMOi0slFYaa3q9NFleMJrDZv?=
 =?us-ascii?Q?sOyIVjUidRtyG/Ed6RoauihkXdZXcwBZb6nsxdsFsI2aEJnXfylhxxptLuDO?=
 =?us-ascii?Q?lEd77zZFMA405BfQbbB29GIuFXL0q65QekyRkESAN5gu6QjjuTDH9QCpfxyT?=
 =?us-ascii?Q?93/8PXA2tK3toQMw5f98EHNEEpbcIfG6uCCDhjXYZ3LhLjaD604/8fR48/6w?=
 =?us-ascii?Q?ULt39iFX4aY9I0zY3Dh0S4mFQ5hUGpAHdeJ74tLtYSEKKBgyb6ArLA9RhRhu?=
 =?us-ascii?Q?sftEN1u3PiHq+9jJUhd0GZAtwAZFNOP3/0pkyCzsyD+XjqKZq3MBSBAI/GXf?=
 =?us-ascii?Q?QeXVflbwrqaanvyLZ8uoD+rt4LuPL7wHelP3+PvZZB73xGUx64MxF4bzRf1T?=
 =?us-ascii?Q?blcgb9GZaHcvp9SGjIKVUH/f2BjYuiIu+Gbq6dcvfrltyh8nK8y02AtGohsG?=
 =?us-ascii?Q?BJLvQzGXuLlJsD2GPzPXarlKc+YQBixHXar2eeIEbnM4fxxFTV+leVbbtiba?=
 =?us-ascii?Q?kjrZTTeRjN0++n0NLDM+TrZjuLunAfMg/InSwNffIG2fSuzkOXqziRCsG8xY?=
 =?us-ascii?Q?qoxG9o/InG/oCpOFCKbd6Q+WZmmA1kniqdFPIbCyJ29oobIaJDmpzncnRpya?=
 =?us-ascii?Q?3fslSBsJOoCo7neZC4t9LCAiDz8WRuew2hk7eCF/H0YDLu2lmz2jG/gZm+fH?=
 =?us-ascii?Q?yHfsj8CQAG2H8Nu2Afx4GwzGvB9fTE+6wQjOyis793z1Gwo+btCxMmLUixhS?=
 =?us-ascii?Q?FV+mKPhVT5a4AKTJ6IBThbtqB8qhQP9K18crxNNnWSQJV2znYnNKui1mIBS8?=
 =?us-ascii?Q?VtKemyOUP+oZF9eVt7npfnh54wQ=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85c037f-f934-438e-9389-08d9d227527e
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:38.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fRm8icz7Wxsw2KLF0Pjl1cI0u5ga6+JzxatPAWpLuXXaFz8rQcYPoHjLzropIqtotUTJYEgFjefodRohdeShuLiXkEQEKxrh25hoLauwSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: falYwarlNsu9kJfWMILrU8SnJ2FigDON
X-Proofpoint-ORIG-GUID: falYwarlNsu9kJfWMILrU8SnJ2FigDON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=469 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index ce19a6058b27..5c4158069a5a 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -84,6 +84,7 @@ struct xlnx_pcm_drv_data {
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
 	struct clk *axi_clk;
+	unsigned int sysclk;
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
+	adata->sysclk = freq;
+	return 0;
+}
+
 static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
@@ -450,11 +460,25 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	u64 size;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xlnx_pcm_stream_param *stream_data = runtime->private_data;
+	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
 
 	active_ch = params_channels(params);
 	if (active_ch > stream_data->ch_limit)
 		return -EINVAL;
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    adata->sysclk) {
+		unsigned int mclk_fs = adata->sysclk / params_rate(params);
+
+		if (adata->sysclk % params_rate(params) != 0) {
+			dev_warn(component->dev, "sysclk %u not divisible by rate %u\n",
+				 adata->sysclk, params_rate(params));
+			return -EINVAL;
+		}
+
+		writel(mclk_fs, stream_data->mmio + XLNX_AUD_FS_MULTIPLIER);
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
 	    stream_data->xfer_mode == AES_TO_PCM) {
 		val = readl(stream_data->mmio + XLNX_AUD_STS);
@@ -552,6 +576,7 @@ static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver xlnx_asoc_component = {
 	.name		= DRV_NAME,
+	.set_sysclk	= xlnx_formatter_set_sysclk,
 	.open		= xlnx_formatter_pcm_open,
 	.close		= xlnx_formatter_pcm_close,
 	.hw_params	= xlnx_formatter_pcm_hw_params,
-- 
2.31.1

