Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459B487E74
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F071943;
	Fri,  7 Jan 2022 22:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F071943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592164;
	bh=O8ImQVY3Xk1HCGaCObsTZCa18wOZ30bgjhrYG1jBYAg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAB5vQnJuoUh7XeIrqv8E1+/DCyizo2MRLPV7wMFCli8X91OK87do0z0TthUK6uRz
	 AzRMIfFfSxiHsCgIo7piwTKjP/AiuNkOXKmc1n7H7z7xe5quz9bvFIxgqmNq/XAfk6
	 2VQhtpLZ4FfT0jIwe0sEV6YLfAyqnjOMSqFnOorc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D20BF8047B;
	Fri,  7 Jan 2022 22:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBAEAF804FB; Fri,  7 Jan 2022 22:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6B7F8014B
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6B7F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="OlBHeHZY"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LEDcX023805;
 Fri, 7 Jan 2022 16:47:38 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+3kAOl0M0c5MH9CfxDq2UZCKbhdp5wZoPjTaUlPRA8LCV3S7oDo/vf+hI9OP2sFqbPCzjvERtGI8kA7ENNI3MPHkQwpH7h1T3EqH/glgJ+EceAnB1inOLUhk7OJrYz+Tj1TEUAmexfav8LuWOh0PNDCP/0QQ/5F0usKXUl8u+NMYo0pcuPmZAPXQY226vML4gQg2I8x4uC+wAjSZ3QnzeVeIPXdWOLyQ6A9ily82rZ0YhYEivCZuxbZ5sdY3UAiEauA2gIW8GbIzMyYTJafT/sZJK0v4ro6fSbZTQ7Watz6WiHXFXLTzoykxm5bcqudtlbZs89GvGuAcTM4HqZY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBxvggnCIz/ACiO/4SrI4xA7d41IurXHWK6Mhd97KFU=;
 b=kTq0va1Z9ioyYHmptDjjs59jxNyvkwyCdYrtZwtHB7GjxoE3FeVFdz/n9kQNFsBrK/lFdmHR82laTAu6qfjMUqTG8WeIBQHF5uivsesVzArXEjK90M8wjMX/XcEi0q+9ixqowjQALesW85Z15qD9P+DPVoTVskHHtNyfWJwGvYLxOMVSJt2bBoKbsmhmVGFmLateCA/tot1JaPufYdxk14M+1YyphtOB8Mshd9UI+jDKGhrJy0Q3iPxTSTK5dcoGLJ3eq9LkS0fzyLuEKUOGgbkU8Vu8d+pwLkYjuij0HJXR9MEdTtq9vsaHBAn9IJ+VvXUvcopBIeZq2HxFo4u1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBxvggnCIz/ACiO/4SrI4xA7d41IurXHWK6Mhd97KFU=;
 b=OlBHeHZYZ2v6u9q11bY3p9eiHK1YYzRw06QsvL/y8fV56LKVoP8XOfL3IVVQO7fauXZ0fFhIPYYpEGfU3XF/Mac1NO+Slth0BzjO4iNf7OyIXAfcjs95v9ldXGNUM9VhlMbrBlCbSaIAmsQqn8ysatqOGozqQdJNzXRPJ2M/q2A=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:36 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:36 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/6] ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes
 multiple of period bytes
Date: Fri,  7 Jan 2022 15:47:06 -0600
Message-Id: <20220107214711.1100162-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 074b0300-47ac-4312-8214-08d9d22751d0
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB6275FE21A03411A576D7561BEC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6G4ipNY6s15gSEQPfVFqmgQlgp+dfYHk8WwprfLNFrbuBAeol5KeGUoOfhuXRzT1Lv2Ij1CjNXsyLDFW4IqzqKbBi1uU2rEdyCSxv+q32PkIy/C5GV70xj/ua67yRWq3FTiyh1vAk9MntZp+94t3vZdMTBVOPWyq+Rx89mOgJMldzwEiTOry1kOBX/W2Ji7vyEbgx9nen3HuUY8yI3ILBczc1xKUEgWTPuZXEUeUbN+mTSSLenpbQimKcK1gzxma5/XFBURwyXfBnOexsPpDeJ/JVr0CkJGH5tNojjE8lkJo5CtM+N2BHogNNFOew76RhiKaGBvd3k7ENMtBg/ae0eyNIWLigXf0t6jMjKwRsqAk8+Zc4FQpOp1fTO8YONGcZNhBDAT++OUBBYP6luFQP+jv9AUIdYDmNOswfdm2NbzGwE5iBKr7RtARVdTjwmJlfZlbQlDQigPyb5CGijJKXAlwjgF3h69Yo1oB58L0tHH62HGAPvo7GVL8i8kGazpLtUdDmxjQ8issloMBXcpP5c82ucv8lNfIePQLa3SxxxW3vDiwDz3i6hWWIRrGHnaTS5HxGUYjy1KQlkRmagCKyZWumpjECtj9GvGHYn7JmNzKgFebUI7Y5saOlHYz5rV+Z1oeVjKjpkYGt87VQlqS9UKnTbQMFbkNEt3hyPy9/vvwE+MrjtJq7wJ+qHEbH+1Gypwztl2QZ9Dj/bzWZWuVhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(54906003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BneuYrT/34aUYgET04Uk8oIaVcjFOQnPOqpfbWnK5cWmTRapaZF/XaHvmQu9?=
 =?us-ascii?Q?uJXyBh/XiSe4Qjx7WnXhv/DOKlJsFpR3QeAO6TEth/Ltc3BKwaIS9NE37CmD?=
 =?us-ascii?Q?AX0iZ0hOnwwh6ZKGj/w/BmAtLJFmZRCr6UUf3WHVdppjN09+Cft1gjbr4PCa?=
 =?us-ascii?Q?drgyr1sOpOrVTMmhB1bZAKagxFeQHqRvPRN2OWks7+TG+qCzaAzsJvRqjEYr?=
 =?us-ascii?Q?STImzjdA5Pxm8w1yzQszUJi3Zc1gUrTX43W3PQU2tlhYrONcy8Zjv93S8y/X?=
 =?us-ascii?Q?TXIGsYm2SA9U9wJfS4WM7lt9jLo+ZnSl7yvLKvdSwBgdmXPl33bnodszloxH?=
 =?us-ascii?Q?DMQZnflHJhRjr1yBjtmaqXVMRGcRg0Z+zBqlcMHy660y/SZF0pFAUfpSlW+M?=
 =?us-ascii?Q?ohE88l2F9uVET/rxJEKZgUTFCzF4K2rieSiDIj9I5o7wzDN+E/Ki5CvIII64?=
 =?us-ascii?Q?IxAfF6kouJWsOh1mIO0qejhUCG2abL33ilsRGFtc1lZmrl0H5s/2l4X/fMDT?=
 =?us-ascii?Q?kpDnoNRsAHPEcJG7Oq3gyyCMTCM8w00DNm/oiCLu0OQw2huYvOkJ26WfWF7Y?=
 =?us-ascii?Q?Hn3VKPKZp2NdIbkkMtoAlQ/0ShUB/Qqw8kg3un50ojJusVivBU8xVnxXFkwc?=
 =?us-ascii?Q?Zo6uxQfCCDj/VuZw4C2FWXveJuSs4NnqjmDcDByYYV7Pc462KEk7FYcpNTNp?=
 =?us-ascii?Q?b1nUUYKpliHHD0GlBeUxg6D7CaFRopKd8jViLU07WZzKdpbFE8QciFmHk1nq?=
 =?us-ascii?Q?1iHDQwYu/CRozOkAEpHtL+lu8m0hHvPUxCkfM8kO56HdmwpBrw9u8oHzWQ0o?=
 =?us-ascii?Q?axYzqJ6kFAtqWswSe49a8miaiqrzdA3DodgGyYEDRXYqI3FTfY6Onuqz4QDK?=
 =?us-ascii?Q?DfVA0cu3gYf+Mxk8KpruULc63Sw6hFfRE8gqc+I+GzBCe+z8YPPNyENORqg5?=
 =?us-ascii?Q?WGhfE6CYatuKzOEBSkosFNRGRNk0KvuEFwdr+Rdu7TI9oCMtmnZ7Vgnrxv7m?=
 =?us-ascii?Q?QJFJFgT3ueBDTQnx+PS23HXhygyNkQh3gJ6UAruZ5zr2sUSUkWwBUTiwq4uL?=
 =?us-ascii?Q?vlQYQCHCp1pJiQBbCOXnS/kMPWZW0HAGm0AXrJqJw+SpCBPsD4fc5HhMnOfZ?=
 =?us-ascii?Q?iUMxsfaZhyzoLSnptTdOIwojZktjXEbXzf+tnKuOXxupoE67BncXXmqk0EU4?=
 =?us-ascii?Q?3NTz0D/R00msR9qm3M2BGHYjXkl+kZYpgBoRGRr4L1YZrgeKwUVsMC86hGUb?=
 =?us-ascii?Q?PBhRttY7oTfsojGxkypmvTE+TmVKwe7w/UUN0CrGTTAhzgpzZcPFfhbDx9Tp?=
 =?us-ascii?Q?PVJ2446YCxIS+a4/G72sW1Rmi73HWeZzfAhn9il5/yqdrD87UZDhO84wzubw?=
 =?us-ascii?Q?BU1YtKncorOamBle39tbOoRh4B6rb1Ow5h0XDhs5VI8lN0+jUhqfzvAOpLjE?=
 =?us-ascii?Q?jDESUMdFVjxMZcL7HVIVSWHX8YAkprP2glEhP+qhpsAq5zpcV+vooTeZBkEO?=
 =?us-ascii?Q?HCE+0vpz1SLEtTvFAYHGGc/M1ZqE5WOdsXIcZ60w4WlQJEmAsxkVmNQYVMwF?=
 =?us-ascii?Q?taF6xL1kNYKIakj1fkYP7eBvCC3LQjkejRrGspeE1e4bAgFVM/OXIkMmHgOi?=
 =?us-ascii?Q?5opMlq6L/S2iMDkWOyF99Y7kzffi93nvu0N2t//qUi3UtDkJEqE/M7IfhXwI?=
 =?us-ascii?Q?IsM0UQ=3D=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074b0300-47ac-4312-8214-08d9d22751d0
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:36.8896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTcB+i13wpaEyscIi0tlkamDa+WL4LaMcZhW6IK80Y6zUFQOrHYGzi9DwVTVXEsSaEhdw5+JvyUCYtHSXtLAOUO9i+fFlzixDTQhQ6+dUUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: sh_v1fvbCuH-ZrSIyM3q42VU_j7akuuq
X-Proofpoint-ORIG-GUID: sh_v1fvbCuH-ZrSIyM3q42VU_j7akuuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070129
Cc: kuninori.morimoto.gx@renesas.com,
 Devarsh Thakkar <devarsh.thakkar@xilinx.com>, michal.simek@xilinx.com,
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

This patch is based on one in the Xilinx kernel tree, "ASoc: xlnx: Make
buffer bytes multiple of period bytes" by Devarsh Thakkar. The same
issue exists in the mainline version of the driver. The original
patch description is as follows:

"The Xilinx Audio Formatter IP has a constraint on period
bytes to be multiple of 64. This leads to driver changing
the period size to suitable frames such that period bytes
are multiple of 64.

Now since period bytes and period size are updated but not
the buffer bytes, this may make the buffer bytes unaligned
and not multiple of period bytes.

When this happens we hear popping noise as while DMA is being
done the buffer bytes are not enough to complete DMA access
for last period of frame within the application buffer boundary.

To avoid this, align buffer bytes too as multiple of 64, and
set another constraint to always enforce number of periods as
integer. Now since, there is already a rule in alsa core
to enforce Buffer size = Number of Periods * Period Size
this automatically aligns buffer bytes as multiple of period
bytes."

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Cc: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 91afea9d5de6..ce19a6058b27 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -37,6 +37,7 @@
 #define XLNX_AUD_XFER_COUNT	0x28
 #define XLNX_AUD_CH_STS_START	0x2C
 #define XLNX_BYTES_PER_CH	0x44
+#define XLNX_AUD_ALIGN_BYTES	64
 
 #define AUD_STS_IOC_IRQ_MASK	BIT(31)
 #define AUD_STS_CH_STS_MASK	BIT(29)
@@ -368,12 +369,32 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	snd_soc_set_runtime_hwparams(substream, &xlnx_pcm_hardware);
 	runtime->private_data = stream_data;
 
-	/* Resize the period size divisible by 64 */
+	/* Resize the period bytes as divisible by 64 */
 	err = snd_pcm_hw_constraint_step(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 XLNX_AUD_ALIGN_BYTES);
 	if (err) {
 		dev_err(component->dev,
-			"unable to set constraint on period bytes\n");
+			"Unable to set constraint on period bytes\n");
+		return err;
+	}
+
+	/* Resize the buffer bytes as divisible by 64 */
+	err = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 XLNX_AUD_ALIGN_BYTES);
+	if (err) {
+		dev_err(component->dev,
+			"Unable to set constraint on buffer bytes\n");
+		return err;
+	}
+
+	/* Set periods as integer multiple */
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0) {
+		dev_err(component->dev,
+			"Unable to set constraint on periods to be integer\n");
 		return err;
 	}
 
-- 
2.31.1

