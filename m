Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D22487E80
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78D491A2D;
	Fri,  7 Jan 2022 22:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78D491A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592231;
	bh=VuysXKQNQwOg2Qd96xuEZ8FMQH8DuBNmmgaldm7Lp7k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwIFE8GYY9LT8eVQEaqMCAGhN8r+4go0/JKz7Vax56kBUZp1fw1m1utMKzrejts6M
	 xNlhutTXmK+TqpSJeO+U/DEku0BmLmqsa41Vm+zBD2VqPi8j9pPTJINeYJs/xljCGr
	 jXgG3UXUsRBbo6D6m3n4ih2kloKHz5t4r9bM8t24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B34F80524;
	Fri,  7 Jan 2022 22:47:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E24E0F80511; Fri,  7 Jan 2022 22:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46C47F80082
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C47F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="4IFUN31k"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LEDca023805;
 Fri, 7 Jan 2022 16:47:42 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2056.outbound.protection.outlook.com [104.47.60.56])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSRUY6rJaMrbrmeOs59rALU+nzHl0z+62fe1BI1qQKWjNAugUxXTdvz0u8lFDlLongHmCb107kVe2rJNfdA62OCIzus9q7xYlOtmLtpZXkdH9Df1l7X84E6f/uShbr1O3fLFNENeYDLb+877NnfOPjrU5Hh/ROU2zOxfEzSwpbO8MMcxdedXfc8ZV0agL16eJ/03NNx08uSzCMmZnigNggBQlRMKK0sNGEw4Pq/pL1B3KAXpFCBffEnMwKutK19PApgBRm8TVuA8sJ7opU0hnpexYKGVQjJM0x5KeiUj4OIOSWLSEVs58Nq1nSvCSViPearN3kvTACeT9lAHRktoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssLWqb+N4hYZWFUJSYIdc2q982jDapCqANYNkNsF37g=;
 b=HF6Stdf0/ZDJJ/YISURHxPQoAQh0lydT7yrl8yL/zWERSAii9OxQmUDtRBSuxk+5OcN7PeqqJfaVl6TMTz/SM3yTWnTn+X/WumigGyjC/n71wwMZ337HV82pEipWTPjgR596tdKsPNWWCZ+iVD5nno5wS++/ypkYCvQF+XAsv6lCL8aCmqYDlyAeqgBeLLGoChuTmIIaKBZ3jfZF3dEbgQnnPDIY+amxpcNsawQ86fxhHM/L1M1VydxZduwru1MnFKS2zvpfOAPp5ZR2ksikaOgFU7TAsuNmzoUexW71xC2AGIx/+z7NYVkKfyIcT9BOYxyhjMSXEwTFa757EqZpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssLWqb+N4hYZWFUJSYIdc2q982jDapCqANYNkNsF37g=;
 b=4IFUN31kfWej0tmwCqRnhgAWaDWz3MNHaWUfQuagDXayljHIRUXiFE7hKotkIDGydoKAcUAwfX4hhM/gabrrVGbSTOTr6a9ft+RdewUt6xtQnBjy6rCL13RSIjioiaMWeIRcOR3+0/CTAEyB8I5nAhZ3zQ/8lbrQTJQzkr4pEm4=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:41 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:41 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ASoC: simple-card: fix probe failure on platform
 component
Date: Fri,  7 Jan 2022 15:47:10 -0600
Message-Id: <20220107214711.1100162-6-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70dd0e8e-6d71-4633-1591-08d9d2275489
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB62757CB0CB52E491506FE10BEC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjfXBvu9x7MDTTDOR4EvPgXZwQQ2Fqs4KfT8LOQBfezC6LoOId663b7mKWT6W6776+H/29UhitsXyEPVkK4oZEYLtVCHY68lw4fYRjmtERYA+uEcud+1lBVFol5a5twRpzZYPgS/DcvLMK+taf4L3uX/srklwma69/62LmL+hqoFbPhd3ovrjmwhsLIhR7H/QokGB1P4VMf8HRIy+un1TDpmXiXbittbCzZjqxAXg7mDGs4uqMMsbqJltikXTEh3+UCgTW/3Pw6DNOJBxVJop+vu3wT7RnfOAIOmIWfa+r4C7Gu2e5mE6owLbGYCyJMxQWzQdN0MfgJKfIMGj+mchE51BFGsdnX0ccqorXrMvIh/jaFYSyQAUglowhoFOCsFkdGhXs0hWyw9oTuCxpg0uWdcm9ias4yi2E+Vq3SYMVGmbeu++pN7MtXFUF32AAm1w3/WKSZYzvtUUlzG9jfeyDJiAJsSIsh0R6fh4wrDmUUK71te0QKG17Hb3/99gCf+ZKGMnPpDhATyc6G8BIjllX2In+9B/Mw8YUa57KzeUoqZ2x+lkptz0w8Tluo2cNjTVjp7xw/eqNZppvSB4xSkXDxskHmlFd56Qq1/pIngPMMZ+4YLXZiAFP5L3B52+9Ha3qJ3flSbM3tJejU3+u3MgFuGy0i4ZgKCrtZ90YU0JjnteOYSmJRKi2KjGqd8x8pU3taOuh4UzyAhy/Y9bBeYI6UWPDGoh1ZHbdYZ9IPs2FM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5085O1l/zizuRO77DMv46hQz72BUbeQ8lsoXNNxRctZXfc0mx45trSZhaOk?=
 =?us-ascii?Q?Qii2NYnoe68NakT94I42EKUrbSaMKgSdeSVF0KOzkLQ3YS6oorvyEjO1Hi4o?=
 =?us-ascii?Q?Tcei8KufxkEhePKEeTQnFXoEPLMpRqrBWHItyrWrxvw2Eyr04+sC6DKbJqBl?=
 =?us-ascii?Q?izWNzfjT9IVoONakRkneRp5vN6338B3PrCA+uJ9vAnptzkY3EeIVbC25inCu?=
 =?us-ascii?Q?ODQX7qv765LK7FumQB16BWcFhTAf24Nc+tcRKMbGgxD/VnjxgefAGCLnMKpR?=
 =?us-ascii?Q?LKzLrH3YR8KgCWZgzo8gSI/ITNjW9MTpMPlQW+4szI8fXKqncm1nDf551GdE?=
 =?us-ascii?Q?8RvQQcnfyX2TVa+/iaWPreXOAkmWrmKxi3XePCtbFAVq9DCbfiH7REpnLzTQ?=
 =?us-ascii?Q?maPuFN8Q/us761MIjC6jNmgO75WQSFdwiOogk2+Y4OjKJd1hKJlSa8chK2/X?=
 =?us-ascii?Q?bD0/HeIdE4faeM1NH3bS8Iaiq72WdS1gfrTMd6YlT4Nnz9z29teKSeIRMSFY?=
 =?us-ascii?Q?c8BtMHFEFO2UxyE2H3MVn3uszi3Xb81p+rr8hkzuqFLcIUoZAbCM7hBPi4OW?=
 =?us-ascii?Q?anSqJZFOGy0kNeorxKNzjq0mvOgsz/WiBYVJOwuDY//tYVm2v6RXUJsymWD6?=
 =?us-ascii?Q?5CbQnpRKAE0h7MrZ8lpFg2ra77b4Gz2gvbyMmxIWNl7kplhBmpLJSOiCtMYm?=
 =?us-ascii?Q?ycAXRpKjUuS3H5Dnj7/9maQ/46BTr97NqGo61N5qwO/fI9JhVdQMhKjhg4Ly?=
 =?us-ascii?Q?oVaSHcXkViCezjYzBJiWCNze97RMiW8hB//gQCjaSOLvspB6M9pGXx/8ngYZ?=
 =?us-ascii?Q?UIpVDXp40hC9o4EISPeKzjG4+pvpHAUc7HhiHE6ZYgxE5kIZ38vqIBPsIFcD?=
 =?us-ascii?Q?5Vv43oJNOHwyAxtHCw2CNrWhFlB85cxt9PFcNbWnnrBiDz4FfIeOpD6+NP69?=
 =?us-ascii?Q?WZiLHAnejd4dSd/7rSfYzvGiVZTNoHzo+JooWbrerkVK2pNzEqylbdzluAbO?=
 =?us-ascii?Q?gILMvLULgHIpUWW8oJ2orQtp/4DpRbEvIp4Iy63wpS//bPtNwkn4VNoCUkN9?=
 =?us-ascii?Q?qhQvbGI1F7zRRHKqi5jfQUjJOvBOYhPx+RBIVMcKoxC8jEhZmls/KtK7I0K8?=
 =?us-ascii?Q?pMmy3CDCuWXoBt/OPk/BdY89Z0So0wFDFjgO6j/z1aj7OXtGbF1q1T8NESPE?=
 =?us-ascii?Q?UaFbG6WNNKeT3yPLbsqgrHYKCfb9KdKqURdWJoQx/427slY9Mlxkf2zmjJCW?=
 =?us-ascii?Q?K6lp3vIOEFuO/zKVcLXDsy3xnIGiF5GZM0MkEu4t7JZHMRApcciTWFQcKmkf?=
 =?us-ascii?Q?009cY3rzo+QvhVNWDe2Rthrw6Y8uppvNLPCppaHk7C7aJjiB1pDH64YOnovi?=
 =?us-ascii?Q?8RNzLExkniqil+Wgw3KL5bkFF3QfojAVohuZYPOQ1VdvvP2d4q4ZKDvI+oD2?=
 =?us-ascii?Q?zMu6Qx9PfUR5wtuWSd9PEG0Cp1tOndzSZ0dxaWT//sS/6oQDwpDmaAyUnYxd?=
 =?us-ascii?Q?sKiZMmpVlWUULOzeGUn+da74obup7XiKrCJVKF4aRCwbc6rNAyu0VpYyx1Ea?=
 =?us-ascii?Q?ipxiGUdlVvom+HvDNENpB+sIjHLCVEAAC+/4CwGRVFcWigKXOtz16rCPLuwr?=
 =?us-ascii?Q?29DMV4rsd3hihP1rbgkZ8kxlQkI6mQoR7dXwEvGqwpN7XeMi/mYsLnFLzDan?=
 =?us-ascii?Q?mMBMGuism6+7lZluTzbAmMYGaqM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd0e8e-6d71-4633-1591-08d9d2275489
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:41.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meKIKZRhn7kcwstqEqd3Zk1cEmgy3SZuvCXP+tIg1SoSfBwu983ZPlzYD1iRNMjsFAVeC85sfYhbt6NEXAsnw7tdugclooLqg1rAO6uDrdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: 9GAXaHe1hwcrcTP-j19oScS-EevB3iSm
X-Proofpoint-ORIG-GUID: 9GAXaHe1hwcrcTP-j19oScS-EevB3iSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
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

A previous change to simple-card resulted in asoc_simple_parse_dai
attempting to retrieve the dai_name for platform components, which are
unlikely to have a valid DAI name. This caused simple-card to fail to
probe when using the xlnx_formatter_pcm as the platform component, since
it does not register any DAI components.

Since the dai_name is not used for platform components, just skip trying
to retrieve it for those.

Fixes: f107294c6422 ("ASoC: simple-card: support snd_soc_dai_link_component style for cpu")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/generic/simple-card.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a89d1cfdda32..78419e18717d 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -28,6 +28,30 @@ static const struct snd_soc_ops simple_ops = {
 	.hw_params	= asoc_simple_hw_params,
 };
 
+static int asoc_simple_parse_platform(struct device_node *node,
+				      struct snd_soc_dai_link_component *dlc)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	if (!node)
+		return 0;
+
+	/*
+	 * Get node via "sound-dai = <&phandle port>"
+	 * it will be used as xxx_of_node on soc_bind_dai_link()
+	 */
+	ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
+	if (ret)
+		return ret;
+
+	/* dai_name is not required and may not exist for plat component */
+
+	dlc->of_node = args.np;
+
+	return 0;
+}
+
 static int asoc_simple_parse_dai(struct device_node *node,
 				 struct snd_soc_dai_link_component *dlc,
 				 int *is_single_link)
@@ -289,7 +313,7 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_dai(plat, platforms, NULL);
+	ret = asoc_simple_parse_platform(plat, platforms);
 	if (ret < 0)
 		goto dai_link_of_err;
 
-- 
2.31.1

