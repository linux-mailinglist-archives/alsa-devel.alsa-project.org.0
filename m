Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D69495527
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B62F2DFF;
	Thu, 20 Jan 2022 20:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B62F2DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708843;
	bh=C2EsZVdUkFcCt2Uu/kPlRRiL/Rb8CRMIMSH2iosmfio=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hchjgg2Re5AzkbGRbMnaCPLBWQrS8Hi1TDEAKlpcV1iVuzGXH25LHL1e7ytBF5280
	 hZpVFng16Zvbz3L1JgISAWwvW7mrp2Vsh3wzPJs0cEoRb03WI1zLMtSGC7LF5AnnOr
	 CdZsw89/n5x1jrQy3QV2Fl73ErWgrAUjqXF+yz2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5990AF80516;
	Thu, 20 Jan 2022 20:59:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8266CF8050F; Thu, 20 Jan 2022 20:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C31F80248
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C31F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="tYDRV6q2"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KCcmFJ002694;
 Thu, 20 Jan 2022 14:58:55 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2058.outbound.protection.outlook.com [104.47.61.58])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dprrpgswa-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:58:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwmqPLhr0J1m4HUNGPvCR5LB6C61+yV5fq5d7IsNRpr3URtC7i4PJRHp0Kgi8RZg0R9nig4Fa+MSoLG8EJheWDj6gmxpVwcQY6lNUkJyxmXST8Lqy1Bp0Q1tOkKw1hqYhZNCWjF5qS7zSB823eyBl6VJBpjnaabLG+66Yshz3wHSW4ztUTvdpgezl7NgnBvqcTrFATMIqNjZUFDW54qcFCHvW8VMGYVm5S0YgFK8OfZw9hm5Penq/aXWrE96//1prF8oWdceIILnWfuiQlj4m3fa7sVGCBehGH0IsAv0gGVDZTkuP1PsvyODes4Rf9hs62KuQPNaP+2d3Ufsy6q7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pbZDy1KNUdmzwraonTIO5NGbpVvq3kZtFpIJn255pQ=;
 b=Q+0ux7x0uXyR9zMo/IzREhWu6s85fL7FE4D/q1u3ea3si5xn/jJ90eWkNdXpiMfg+UdSzCkoA2At9cvzduzMkCCpSmr8yq2lWEew5X+8vEYlaospbO1698JrNvqbJnpHow2lYiXmnQz8V3NVzxAEL5bPIE17O3YmmKxMD01JMkLjwEOBQw+h3y+5eueR0qzaagJgMNKhglL/8ldx1JCBF8E+Znc844/2WB4asTBuN60MkqSNeE3TeCnL9IHOXCpgB3D+JZ2zZOuxsJKKIv+eAa2F3y0DdyYTSrrCERqNYqSO13qmos8Oixmd0hmPS++9Zy2kUHDph4TkJoxOTBpfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pbZDy1KNUdmzwraonTIO5NGbpVvq3kZtFpIJn255pQ=;
 b=tYDRV6q2zff7ai5JWZk8KaVst3fnuwNaSUG6YiJrUU+e8biS1CkkqVplW8R0OQkQCv2K6icF0MEqf8xIvINi6pWvwbvGQN9phjwlM/IyKzX5qt2YzKPKtr/KPQgYAVyi+rayrX7AuO6KnF3DgPkG/23cqIlmpqyTvP8hCGl9WOo=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB4497.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 19:58:53 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:58:53 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
Date: Thu, 20 Jan 2022 13:58:27 -0600
Message-Id: <20220120195832.1742271-2-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: aab5b41e-ab8a-4823-3a05-08d9dc4f490e
X-MS-TrafficTypeDiagnostic: YQXPR01MB4497:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB449784530B0BF4109C46BE25EC5A9@YQXPR01MB4497.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJ7PREIDcMxZJY+jVbb1y4uBl0Edazj2nJhvZIOYygNHa7eI+huBabGr9IRVXO2s6VqiyitpDH5RCSSCfCeQuCME1B7YvuW/iGQn6wHG/tn9vta2puc14TAJB4J7AzhMdGVhbXu7pwE+jJ11DSpl0CZw+XB1fu8ngDzYbI8GeR3ffRIr4pJtulMGMEmkv/h+L+0YKsJUKoVcSVN+GA7Ut/uZJM5HDN98e4zZx9ydbTLqDXPXbiyMeSv1REDDmkKn+XomVTU8H8elLIcbdTE2OD7N2gOUh0d25X0CkIjNy+2lxG8tcQmHzA8F9tFlD8v/mWeKnSIx/0CpL+fINPV7LgPnG8XQL+lRBORHWnxMzaDaW3JxLRfDgGQucbBoOojbzb0RY5A7GQA+W5zWPFF0pXQoluRk2ww6jJyxYW84k88XSEIXuNDMAgnE/9CR4TKj263JQrhO/SoF4KVsX0XDRV1Vwe8U5hDz9PBosO/L9kBfu6/qoW9m11qoiSxhw9zNBcVZ2Tq+NGmjgRJD2gL1GtLCPp3hjS16er8Tr254Sy+arMSPEh0jylzbrV7KFrQHqMSdjh7fRIPneNLgFI9hvVYlRv7RWqim6Q4PIPrarkHj2hicLl7N8bNEunnsHc8pDQMYfyiMQb2w7A3nRwjGPCpGmzD5E/TNMTgl12THJyFpLH1yW+c+8oP0DlTRbTQCPEX958D0YTqbp87Rdqf21A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(52116002)(316002)(6512007)(5660300002)(83380400001)(6506007)(38350700002)(38100700002)(6916009)(4326008)(36756003)(26005)(66556008)(107886003)(2616005)(6486002)(86362001)(7416002)(1076003)(508600001)(66946007)(6666004)(8676002)(8936002)(66476007)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cq299623iEGuFmlfMLOK49kaIJT9A8rljAqSi7+6XCXnv8TD4byNn1k95xa1?=
 =?us-ascii?Q?FPfkFGPMKnyRCVkyMw3DCrlwgYriWo3+3RPhtEll7KfC2mTeZzQHV80HN053?=
 =?us-ascii?Q?DB+oYS1kGr/rNsK+2sl2PuCIkPSDWyFDn+ZF/LeXeavJkKnMq5EUGPNS1L70?=
 =?us-ascii?Q?OIT7Y5MKg58vHSGmtJ4nbaH2eQkN+7JHcD6l3V4l6lxjGH2Hm/Xml+PAObXy?=
 =?us-ascii?Q?zXCaRT7acQIKxP1KG2kCWF4hII7IP3MwZeIFvaWvaq2X3GpqyeZBIlWwq1pB?=
 =?us-ascii?Q?r01ygPihL6YIiOOAkMeHGDK2adpg/LT6eRF799hpZyCtZmNlsNLCgjY/M98L?=
 =?us-ascii?Q?aXI+zh4Kfm0bGq++oeL5O9cd2ZV2ktPDdvDzuH9DdNkL6D2ZtHvARiHowUsL?=
 =?us-ascii?Q?KQYqrEXz1JTpKhDJacRgVNMLgMpqu7/RuWsDGiz21D0BsfcZV7lp6B41L2ss?=
 =?us-ascii?Q?5juEfYjIik9tAuz3qxLagNsfi9J4s//kti+901oeQQaLx5VR/hiRh3twYd+R?=
 =?us-ascii?Q?sgTTSj+E1FSEcar0vjA7N1Kiln/A1NCC+cEIvARsiTkA2PbQXRTP/bi5eMg3?=
 =?us-ascii?Q?oI8cSbs16weIu3HGnFqoT/Vvg+9BC8ED48LzxWAhB3Pyjm0FOectJiATX5g/?=
 =?us-ascii?Q?RHEAq7y/aiarjExw6+DHOJT5/z1J9N01XFW1YAzuruedTTJZai7s/Mg10lzz?=
 =?us-ascii?Q?J4kdZ/fvd6ukIepRHuO1heq5zlst2eAUMrKAgsyzCsGRKzYZLx1VGJ8SM9Nz?=
 =?us-ascii?Q?tfaPBZ7QSKFCoB6jLJJkv4YJ6lj6rSh6uBqV34GJteLu9fsi5nHYoQ9VhtVZ?=
 =?us-ascii?Q?YAQqXkyV0+NZUA+QFhQY+F0oTZakDpUkhCyralFAwCge5/gxA3PZ0/mH0nCO?=
 =?us-ascii?Q?DNa8jj4g+XSnmt2t09R56B6Kqdiwt7JsrxehGaIHF1qX/vaXgIslA2wA8PMc?=
 =?us-ascii?Q?7fsJeE02BrCLtWyrMcdvrD2y7dDL1hIkxeuPUqqopIcax8GtO4Jubei93DEE?=
 =?us-ascii?Q?kkhdKCt/fN/IHDOVnlDzOQs/H+wmSRNJeFnQxML+zPkbrSd9HcqLxVYML9xG?=
 =?us-ascii?Q?Kqt1RPrvkcPBe0f4axrHuDU3iZjppW+sD+w5BqbygZBySzbfFp98kKQAITE6?=
 =?us-ascii?Q?hxrCaRCvoIPmF/2LDYeIXhHCfl+2Pk4Q7sEpkucrdvezLDn6curxViIA9+IC?=
 =?us-ascii?Q?EULC+vTJ9w26WgV2OrAgC3w8fwBWZ31+gZDsL1rb5oUmDYFYMGbxYxlWUeG/?=
 =?us-ascii?Q?hbbpaNWnZ6LzJwNEPpWOLNRgFPccdjVnyKT3nH+dYJRd3QP53VQMdSQdv/HZ?=
 =?us-ascii?Q?Px/nTr/g4YgHCczoZXp4QMm5ytuJbxfIQorR99WY36UqrbhIZwHW3VSTMv2h?=
 =?us-ascii?Q?qrmDQBjHzdjLypKzV9T5RjmBu0Bop92hFWmgF2+CPmLw5EJP4JjKuAlBFils?=
 =?us-ascii?Q?V7b65IVnw5bu5/Y5kFqgUsJkPFxB2zj7XeSDe9OxmwikWQszOtfAtbungAF/?=
 =?us-ascii?Q?t0KtQ8M9ub/miGPI93xRxqkc/Pn1OgsoEXlCX7jVfjkhbKlDtNYs3y8ABeM/?=
 =?us-ascii?Q?vJAbp+TbbR5dHvA1+WGwN13PWroRh1/BKVP0sH8a1VaUR7Yt0zkh718dxcjS?=
 =?us-ascii?Q?QhcfPK9RIFMULVfxgpfKDZNh2GZY7F719PvxbDp1Zvhkcqu1NzAE7eXcnchL?=
 =?us-ascii?Q?+7ZsDWvzsyzKavkegHLfsoeD6mo=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab5b41e-ab8a-4823-3a05-08d9dc4f490e
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:53.7081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHH4DnLCRGBdwyedD7t2Nv9m5NdTkZlpfhWrWumFb2Qqu71mTG3Z6PJFr+cfEAlnbtGzVmx7t+p4nc+8qEZU/HCHeBig2VWUvB5zXbLhPlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB4497
X-Proofpoint-ORIG-GUID: 67ng6FbolIiYId8ugGvDkUEAoQ1WF_DD
X-Proofpoint-GUID: 67ng6FbolIiYId8ugGvDkUEAoQ1WF_DD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=472 phishscore=0 mlxscore=0
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

