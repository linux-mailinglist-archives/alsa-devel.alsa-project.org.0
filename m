Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50332487E7C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28D71A45;
	Fri,  7 Jan 2022 22:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28D71A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592199;
	bh=KjDCSVtlTNBcdEi69GwiB+0EnHgkFFjlj/KszgRw31Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svBd/zrNwJ7YpEe5jzy1afvhNyqIpA7Rn+6k7UxjuPv8mq1XB1myVBKjiC4edQlq/
	 5wBSffp3P8wj+aT76gFCNutuePklzWqsdCVNvShFjJRivImTghZoqe7G6dT2NFVuzI
	 0yqWnylpEW9cgtjFP04oR8tL0x6OZ1WEgZZPZjXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8363F80519;
	Fri,  7 Jan 2022 22:47:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89DB8F80507; Fri,  7 Jan 2022 22:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A0FF800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A0FF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="mNczhrpo"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LPGa3026852;
 Fri, 7 Jan 2022 16:47:44 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2053.outbound.protection.outlook.com [104.47.60.53])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVN8N/ilbSzuh4dLwwi5uVaVheZ9dBFyYcECAljPffr/Q+Su59E+I4sQ783j1EU5ecTzjWoxEr5yJNGPYXrNdKZ8OdnHJZVq00rJn9o8n/98Fp5Te/7URF+Pc80GKbM3lzYksfh0pawpcm76YeRZoCWmVOYOCrcip0UnGFtRJrJ1ZbQnR5uvsuqmAD4hqxYV2FIN0Mtez0ILu92bU2LpevxaeW9nxq6IkTghrYEiSlZUUq/dSwGbEMaZM7p6QO2nTlMJKRxvmgtnXckaLmNmJjSTIypaZKZEZE+v+Uj1Qp2WVa4Nt5jx2QOUD1NTxvAZ2QhImZ2IgORQxpuZ5dXDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i97jDy7mOdm7uwmcVa3etIad5sFBYKEF8w0XoNnqOmg=;
 b=mmixUfOowHVX1in895ZZLnXjL3Mlu+XXtSU5t5nwEEpepTdxQjXxot3hR+Vv3zsfGKHzc1BYH5svJG4tejFwdyIEekzJZIkCYveHFkQBw+Bs9lgl4otjYd3s7DM3rYX5dVSD8pkDwGpU226peNF7edPzGwT6MzXpkessRNqnRsoyhrv98PN2IUVw6TfxNTTPGfWXFL5gdAaET9zBlD2S1LM+aglQXI5fuwOeBfb4dtlocM50U3J+7qxQ2+fZobtanQI90U0ZWaOG1ipqcfiLHDnnaFMQqn8Qdlcn/TjZ6STZsfDhkxcgvli4L6eIhy/zLItN4PX1cm8wTQ3zmr+kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i97jDy7mOdm7uwmcVa3etIad5sFBYKEF8w0XoNnqOmg=;
 b=mNczhrpovitS++CWqGXIHgMTMku3ZkktpBlY6M3dtt5nuN/NxbxRrjLcdxSE4K1dcU9XqjDAJqwDbPmZc0yqrKNPlXKSnnQVt+RlPBZiZ68ffyH74ohS1dXlBJORbEJDopNpbMqo+hK1qQ/EpCm6gYfUL3et8GzHXpZLm9YbEYs=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:42 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:42 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ASoC: simple-card-utils: Set sysclk on all components
Date: Fri,  7 Jan 2022 15:47:11 -0600
Message-Id: <20220107214711.1100162-7-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d9c60ab-fe8a-45db-2467-08d9d227553b
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB627547220D08F1FB86D1A658EC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7TO68r2e/7D0DeG58BmuhA9dPBq8adq94VcXkyGJP9XXoS0qACsdPTilwwRK7m0LCRN1QbsMJpskNdmE7ONxlHpCkSNA2qhWsA35/ofUXUY5fZrkkxoDZVfRxRd0NhObfT1M26WlIlZUjQMS2D3q/hjrQuDbac91BNC7wd7aqHa+BwAEHSuL1WIkL02nKn2RptA0v8UmiqmliyAVFQ/EaDHQv4ppGLcupaHWFAshW6HxXZyceTdvbY4hiCKOn8BqkQcUU6AQ7jCcrg1GAnB0w1dr+AD+xKEpBLBtJiwCBZlAg81w//zjr/EOKj6OLUKrzzv6QUC8Y1uWc0j1zO9vt/P9N/QorjfKq6Fp+ahVLH0K6gJAPeujlPQ6rBWqzFJ+b9Il4aE1w7YQjvLPK0RnOAciRzq8dhvzR9wYfOF1dScMQS0iuN6J0zCtkJWQI2WaMohQ46a27kIl1oUkbM/rM1NZTUmvwvaiuqaKo1owjqy7ms2iI+7vD9iS/NPApHCTJWPBKZ9CEKTSx2MXb3EEoMM1UhBlNAiKUfW8SMjtC/P3klwCEz93GslDu9ZTJD7Ixcps4TI/+rCqW4eA/yZAcyNGlKCCa6Om14HR3lv964zykr4IXh7mjv5pTBgTMt5A4mBV0ZdFSD5YD7lsfWRMcZQLGGZVqnjo3P4tXYAXA0AEkmIPY4hAenvJf871KP3v2fb6wZZxHS+0p1vQEizaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0zb+mgko2mYPK0zL05XwR4AM3mx7BBuu4Qvn5nCZDjJuxhRl+eCceNe5uwg?=
 =?us-ascii?Q?h/OqUivwensiHziJmL72dw7nZB1oES7DMcLLAapNlCMXWoK4VcjEUwxIB5YB?=
 =?us-ascii?Q?XccLSWt42qbhn/bt8OgezjApLAo5uplPsen/QfHPD2fw6n/7exXxpzB00Pop?=
 =?us-ascii?Q?omUoffEOk6VgqRQPOFCCkI1r7FWgJcPSpQrAmc++iTtG2sZdtDIRnEMRGOHe?=
 =?us-ascii?Q?1BmNhGHbvWEAuUzM8wjA1X7UzR8UWbH6tbmvqojjZmb27W3PDCEd4dzyw5BC?=
 =?us-ascii?Q?al+Gy0mzpgqIrKSrOYnjFmYe2/AygVBN/Eyr2gzCaCrw834Ow+sywQbL9hiO?=
 =?us-ascii?Q?hqXUpbANmok2Mhs6Iwk1ySJK2I/zBLaxOEek3yncWnFvrIPx41cseqZFokR1?=
 =?us-ascii?Q?OFhn4QVv1x85ohu3kqUFt8/qUTbTunDyeRNV/wkrkgE7aNjaZWEr3TETbGVY?=
 =?us-ascii?Q?zeM+1ZF7hz/l1G4pciwsvy94Z/RR8LRqy55nV863rpZoIg3XqkDzsgaTkedM?=
 =?us-ascii?Q?HbYhi8t1ZmNFdvWCwu3RH3jJtM6d88rnRJWoMgZjs83X5efW/6WYQAfobKeh?=
 =?us-ascii?Q?1ECEEF3FEs54Qn8dMUaIWmS3xO5n6Zz9l5d6a1BMTLRw2BSREmVOoAWN6+3Y?=
 =?us-ascii?Q?YGTDszZnPYq1jsTEDKoedQGESsbvnhAb7df+Fw1jUYsQMBZ1TadH3j0S7shZ?=
 =?us-ascii?Q?rGViT0e5S6pihCfxXYR05yWec557klr1OztYEuVFZ5qbjMm7bFOZbKJePhNq?=
 =?us-ascii?Q?D5Fe272TOJh5tzN2TRNx/J4cjLouiB5yo7a01raegUH9vMrm62Tl6wdGPr6/?=
 =?us-ascii?Q?nTLA/XwMfhohTCPY7Me7rf6+NnopQSLAuBl+w4Svxv+vh8YFUfMu0HeU4viF?=
 =?us-ascii?Q?/P0WIJMKNGJq4oNAfMF1IsXl/S2CNfVXQzRlvB0KIUV8dF85UkwbYXDPp+dV?=
 =?us-ascii?Q?k0MraOYakIawhgEpnt3Meh8PE5Nhfy62OXvG6+ntlzmYiyDO70+4cMohIXpM?=
 =?us-ascii?Q?1QJNPz28ZU3/gCL7+ruNA/4LOy6IeRGatlONh4tgx0akVmoWKg+ChnIu6h9Z?=
 =?us-ascii?Q?82/gp4kPJoV2qGkH+mW/YFLAh/9BN7qAcKhyNCbGzY37UYDKXQzbMGabNEnj?=
 =?us-ascii?Q?Zd6yqoIOPVnr1SaFBXGtau/yvEaBexls+PhSrjuIoIlY/y2euaBPjpAgDmYF?=
 =?us-ascii?Q?gFCFhyK9E1MRFJY/YtCbAv2o3x5Xz/kQzGcTxZldMZUmdszqKHpvfFmFVfHw?=
 =?us-ascii?Q?twLvnbdhGcYrV+voZKY2kZdpKkTNWKl4K3OXXqv+ef9vh3vnxkMkU7MiJiEG?=
 =?us-ascii?Q?/cmb6X73dip+Jd/YS0SybqIl2zXkEA6iMOuig5bBGxlmyKOhCnMUkVgC8I7R?=
 =?us-ascii?Q?zoQdM5mU9bJFOzVhPAPj996RJNxokJUYfm8evQvo+gkcEB7CSWFS+sugE5Iv?=
 =?us-ascii?Q?PZKzGbQ8KZ2qbY19M5P8bfuKKSP7fLd8TkptEVHOHCFDuqcfIKtqh5N+jLlj?=
 =?us-ascii?Q?n6ggVINMPGmvtEnLFZGxbNIwOSo3SHEr4K8gK8H1aQDrMFw7JaPSlWWv8iJj?=
 =?us-ascii?Q?UbKSVCjmtRmNvYf38A8Jsm+39gvc8Os3LUp4CS2OF/5Ok5KlDGy5oj/FP5hC?=
 =?us-ascii?Q?gplD8vFV7H3dJJGTGUpYyPuUy1KZDP/1ocmj6PViKPRF707TgdIPzdwAERSl?=
 =?us-ascii?Q?NIPh/UM6YbvBzRHUUsYLt1p/hwI=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9c60ab-fe8a-45db-2467-08d9d227553b
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:42.6069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vya7eZgG/Xm2JeU0VS9JG8/qu3jLSXfKQ4ruL82/zxp9oQ+jPJxBEdro/pBypMgCEUROh2yIgzNfsVRdYrrpjQHS5tfGxovAJFRXDkyyQyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: -5v6lCNlvQ9dQFbuOCBcs2e_lL7DOPlc
X-Proofpoint-ORIG-GUID: -5v6lCNlvQ9dQFbuOCBcs2e_lL7DOPlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=901 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
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

If an mclk-fs value was provided in the device tree configuration, the
calculated MCLK was fed into the downstream codec DAI and CPU DAI,
however set_sysclk was not being called on the platform device. Some
platform devices such as the Xilinx Audio Formatter need to know the MCLK
as well.

Call snd_soc_component_set_sysclk on each component in the stream to set
the proper sysclk value in addition to the existing call of
snd_soc_dai_set_sysclk on the codec DAI and CPU DAI. This may end up
resulting in redundant calls if one of the snd_soc_dai_set_sysclk calls
ends up calling snd_soc_component_set_sysclk itself, but that isn't
expected to cause any significant harm.

Fixes: f48dcbb6d47d ("ASoC: simple-card-utils: share asoc_simple_hw_param()")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/generic/simple-card-utils.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a81323d1691d..9736102e6808 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -275,6 +275,7 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		mclk_fs = props->mclk_fs;
 
 	if (mclk_fs) {
+		struct snd_soc_component *component;
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
@@ -282,16 +283,30 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 			if (ret < 0)
 				return ret;
 		}
+
 		for_each_prop_dai_cpu(props, i, pdai) {
 			ret = asoc_simple_set_clk_rate(pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
+
+		/* Ensure sysclk is set on all components in case any
+		 * (such as platform components) are missed by calls to
+		 * snd_soc_dai_set_sysclk.
+		 */
+		for_each_rtd_components(rtd, i, component) {
+			ret = snd_soc_component_set_sysclk(component, 0, 0,
+							   mclk, SND_SOC_CLOCK_IN);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
+
 		for_each_rtd_codec_dais(rtd, i, sdai) {
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
+
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_OUT);
 			if (ret && ret != -ENOTSUPP)
-- 
2.31.1

