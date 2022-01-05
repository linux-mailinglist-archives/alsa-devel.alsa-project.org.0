Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B9485BEC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:55:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA18B1AC2;
	Wed,  5 Jan 2022 23:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA18B1AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423299;
	bh=OBud6+DeUg7FMzsKVMY32vFPsa+34KlXd4lsqus++bQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viMtWADZPqbUq8m+z9Nkf5carYMJm5wJoxrQUz+9kq2p4dKwfh52bToBayeiMLenz
	 iaLMW9dcaCx4yHTkaRioNPAYXsi4wbEkXLIDHfLO/aMeoRXu58XHUeCICThQ8PE3Qe
	 D8RPxvrkHEqoT0bo0b3/9tkRs+bp54lOl7Dn0+Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A087F8051D;
	Wed,  5 Jan 2022 23:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4548CF8020C; Wed,  5 Jan 2022 23:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A89DF8020C
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A89DF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="nt5Qq6RK"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205CIoUi021088;
 Wed, 5 Jan 2022 17:52:23 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8hTALqODYQFpT3NnNf7kLqbvscoVTS9MlxSmk6G6UyUNH1X7GftsPx3VANIfvN6Y0SOyi/O29ISugvQsStvHZoh6y2pQyMjnEdx/WB0dqKSXIJ26t/oPc/uBW38jU7Fu4KdaNJHuBb7LP5fABjil+Dgt7V1ORJ1FEwuOY4Aj8GBRQwDy6PaLQb1qAFXsgYJBPfVrVQoartXNpz49/Bk86V267KUsUkd3Yh9ALwnhq727RYMHihBfVMBy8Xau+uegmySvaYy85O/IiiodUVn41OUTP4rWM/cfRaqwBwKtzLtFa/mPoMy3a9p7d/hQVEAL6xLQ2Pae0Ea/hxYO/2R+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPWSwqu+iiil2P0VGkKX2eXZxrhD/a+sfCnuNfMvUkM=;
 b=RGgElsCM4SsUUb/K+oI+C0TIusl8KHqF36oKJogp9nIHHQhJOkh6DqWm5ZypsgDrlKHrAhWS8KFBe2zCZpwb+vsVuIsG5C2JZ49liCBKsHBeNPy7zcCyW7XoUoW66iW6MgwRRcKF/ml+ISk3xcgm8z9gOk35DBSyGsHTq19q3IHLZg3XjfVho4toeqJ7Tpogch0wot+ZO1kL0fypJRSDi/Zkql3KSNmNMMowUlPfQgfAoxEt4SaR5SLegSvxA2qLLdXKBoG2Pjogf8S0yYqY8hNW6oBTaeta8d/IywFzK3SSAEjB9vScsdIeUc7I480MFsIVfgV50Z/xyMlqcFj8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPWSwqu+iiil2P0VGkKX2eXZxrhD/a+sfCnuNfMvUkM=;
 b=nt5Qq6RKplK23y6mnmUyz4j8OF4THaGKV+53ItIWUEc1YUPtzAB0hromGoD5jvwLBQF+Kv6zZUfk7CnCofFzTSxiHINvxSKIAcAExizTVYITDGmQFTXkj48oOwOCXzEdBHa2PboMIakqrVdqTaKsmGBgWghQdCniKLZik6ZJ8Xc=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 22:52:22 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:22 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: simple-card: fix probe failure on platform component
Date: Wed,  5 Jan 2022 16:51:45 -0600
Message-Id: <20220105225146.3517039-5-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd93dc0a-9fbc-4507-38d8-08d9d09e08ef
X-MS-TrafficTypeDiagnostic: YT2PR01MB5120:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5120A5412825548BB07CFF45EC4B9@YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xALCS45s4x+r4rwJ9x2eJiSTkli5586Pcppw5PnUwo5rE4NVZS7Bqs6RgqJYLpZPphFLroAIhB7fy2r640oCYnSEpoEYWpXzQrPr8jRz5/8KhYqlbiV2dTvqn+QT4nvtaaoPGpF3EF5LVZ5rRzxLhpRNgMtafsceyPRCDsG13fh/o+fipH/saCJJrfGNfCV4/mmqvgfaOmMA2LoQ9kTpfdDoRc9nzCsGexRJyiUkJFsF2U9qMZE4u4uDdxbr/l8l8mgcIBFUsvZGnTe43iVuhE+YjxpARYtCItyKiaKxASgBTxtrLydLUOG0qnj14Con6zkVZ9o36e/gbaPmo3Kq2DtCLV28oRbwQ62rbuJrdGogSSfKk91h8ZIGEFVdbKbGlvfloRawtCAnTizYZ/F/bgxYuqDjYw0NIOf5nEDmLuDeTa8MSABO6DwvRFMsFQ2bL079xwazx7Kfu+GWLBt6lZbgK/s3vB9IzdsTM7U69fODptZbDjUKPmoF/FIvWNqgUDpY8I3G612dI3XM9lhCH8Os6Wti/mCRhuZI0n9szNakWJzbxNk9CqKPnTwHgjwvU8cUwjJRTQvEYrhr0EQ/WQNAai/RB0jjoPj2gXyXetc73hthXQVdzQx+LpRHyYIPNUvK3GQBSACorMwD50yDADk8ULVuIokYKK9mWe5RESD/Nh9HR5NaqiSunvfl2u6P1vTDS/10ooe3dBbWp2ekbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(4326008)(508600001)(6916009)(2616005)(5660300002)(52116002)(1076003)(36756003)(83380400001)(86362001)(66946007)(66556008)(66476007)(6486002)(6512007)(44832011)(38100700002)(38350700002)(6506007)(6666004)(186003)(26005)(316002)(8936002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R/JMuymsPn2z5xz133rkxpxBY0j8Kh65ym8KmwT41h0VxHCpnbSZ5YzI20Yo?=
 =?us-ascii?Q?2agYO8V204RdKsz92IzMCaSjy7UDNgWDSdM4Jrn5+OiYNVv24wTl71DU/im4?=
 =?us-ascii?Q?NTRpAoEl7PkyQO1HizerLWbdE+OoUlg/RvYNYgsFGP9RdVLW9zgkDA+X95wl?=
 =?us-ascii?Q?VJGse/2szD2QwFB/HdmOLqYtF5GIZb0r7UJn63OX0s17tAuOZAvGnCtxb6jV?=
 =?us-ascii?Q?hJ1f9rkToEhQrOFDVkcc5xesXrEPq5w+AhBvnAAH5m+ptb7QsNm2XF6vUMZF?=
 =?us-ascii?Q?0OmckjiOliuyE5yB1kRMlI0fh90NXmSjEuHvN1NI1qvNM0LSu6cViSLxUf3p?=
 =?us-ascii?Q?7bNzXnLAH9SogeDBE8b0+YdG0K6ABLpt4X0vRNs+/qB10vu5TKT0pOmeD+rk?=
 =?us-ascii?Q?jVtbZFVwlHH64gTANsRggk2WLfL8bLfrbPl8dz9noMTFGVIIwx7OVEFNlhAP?=
 =?us-ascii?Q?l+gWCBWB3MoFV05XOw9DiElm5T/eqf0BR4C1Ic+5OQL3xppuFtrMz1IK51My?=
 =?us-ascii?Q?y7DQAnGKL2eoEJyV0pENK3b4NhSb1pfCu22vHuLho8VIS0Ksw0bcecW4kjy+?=
 =?us-ascii?Q?RXHX+wT9kRio/EBHctWAuSEgPcfM7MAN21y/RLV4uyGgK7644FmxPcFfKJYG?=
 =?us-ascii?Q?pcDAVtYLVcL7/vA00VLvhmYoXF74HLZ426R348b85SNw/v/5IC4rR4lUUTRz?=
 =?us-ascii?Q?uyWdfD/N+hiGS5CjQkRptXisyJ5E7CidHWWO82wejuh9nk/dxeHoJ8pzWsVG?=
 =?us-ascii?Q?G3rX0sXO/GAay+b4KmCieeQpgeuzwXI7Icy1+VOS8sZWabBqo28iXajmvpZJ?=
 =?us-ascii?Q?91JqolqMnt/ziTFPTjTJJgGTOKtQ7TiOkEC0pvAO1iWQ9n3yLcqXbd59jG7J?=
 =?us-ascii?Q?5mKBT5Ijt2soNb08KMq+IJ57E5vzk2STWC+ruY7U7qP9dzE9FnYN7du6bupr?=
 =?us-ascii?Q?bza841Kz4GAfwwJ0zvgsyUejJx7IJXVR411AjaFTX/jYeUIbcsGG3x6Atg6F?=
 =?us-ascii?Q?H+ehdTjHYEJx11cDSQSGBefqtHMzKeyPFSHeHP6rY9dlYwxsz9TPoFEEg73c?=
 =?us-ascii?Q?B19XcKnr1CaXtaGSAEmfgRvfb/wFe8U3Eb/CJISNt633+0WBpYnyqUDxdbrF?=
 =?us-ascii?Q?2MPRKotlQcLBmV5C3PfmUqC30M+MGhk0jLwPbhEFDBTvgomskpm4IvAYmu6Z?=
 =?us-ascii?Q?BDgxeUt4fz5WxUsc9d91OjdqT2wLuTLhBKOiTLYQ52cmnajWDMdx19NLckmX?=
 =?us-ascii?Q?ts6/ok1Tm7d1ASrAAXSUjHEwd29IOkBXxTb9BJUb7GM3jIRi4ziN0bC2N9gc?=
 =?us-ascii?Q?tcd9q4f7x6fd9Sy3Husm8PstXVQvGE22fPvFp3lzbl1fhwYJ62XqRzpH4+kA?=
 =?us-ascii?Q?lajXRGVMFBP3hZQteq9J87Z3Xdd+HpFndLxqVTBma2sPX0L88U6iLgtNxrMT?=
 =?us-ascii?Q?UTyB/CJGmkqMZAhKBzOyu/kWIIJU0Mx2DHiMKAH3steI6qmYH4xQ/DCQx30h?=
 =?us-ascii?Q?2ZUK8YUtETK/z626GTVZYf2Kmdxss7TtgEfcUWqbKEKcbz83YSWmToLPsRml?=
 =?us-ascii?Q?tqLsnhXpNQLSOPh7XtH+C0cFJstxUvoHV5Ja9zo1nCxqfrTkxfBbB11nGUEg?=
 =?us-ascii?Q?55HSgrp72WwzMBeEDNibwyzF+n9ZRrZqtKs9iwKocnsqx/u+xmxjJgKSKGGF?=
 =?us-ascii?Q?FG9gs7Kr8mQdsxn81weFGqctIiM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd93dc0a-9fbc-4507-38d8-08d9d09e08ef
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:22.4659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 258s4tglfCSltIaqHh/4rtd63gSi4Et/vonTJSsOg88UpkeUjCUtraudTo4sGe+5IR3JVSW6kAdcNjfs3haFQYZzChJEV9/CDK7N2X9P2Sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5120
X-Proofpoint-GUID: Mnw8yIliKRUv1mHVu5rJLaYZfkZrn1cs
X-Proofpoint-ORIG-GUID: Mnw8yIliKRUv1mHVu5rJLaYZfkZrn1cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
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
 sound/soc/generic/simple-card.c | 52 ++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a89d1cfdda32..1295836e04f4 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -30,6 +30,7 @@ static const struct snd_soc_ops simple_ops = {
 
 static int asoc_simple_parse_dai(struct device_node *node,
 				 struct snd_soc_dai_link_component *dlc,
+				 bool is_plat,
 				 int *is_single_link)
 {
 	struct of_phandle_args args;
@@ -46,28 +47,31 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	if (ret)
 		return ret;
 
-	/*
-	 * FIXME
-	 *
-	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
-	 * If user unbinded CPU or Codec driver, but not for Sound Card,
-	 * dlc->dai_name is keeping unbinded CPU or Codec
-	 * driver's pointer.
-	 *
-	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
-	 * to rebind Card via snd_soc_try_rebind_card(), but because of
-	 * above reason, it might can't bind Sound Card.
-	 * Because Sound Card is pointing to released dai_name pointer.
-	 *
-	 * To avoid this rebind Card issue,
-	 * 1) It needs to alloc memory to keep dai_name eventhough
-	 *    CPU or Codec driver was unbinded, or
-	 * 2) user need to rebind Sound Card everytime
-	 *    if he unbinded CPU or Codec.
-	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name);
-	if (ret < 0)
-		return ret;
+	/* dai_name is not required and may not exist for plat component */
+	if (!is_plat) {
+		/*
+		 * FIXME
+		 *
+		 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
+		 * If user unbinded CPU or Codec driver, but not for Sound Card,
+		 * dlc->dai_name is keeping unbinded CPU or Codec
+		 * driver's pointer.
+		 *
+		 * If user re-bind CPU or Codec driver again, ALSA SoC will try
+		 * to rebind Card via snd_soc_try_rebind_card(), but because of
+		 * above reason, it might can't bind Sound Card.
+		 * Because Sound Card is pointing to released dai_name pointer.
+		 *
+		 * To avoid this rebind Card issue,
+		 * 1) It needs to alloc memory to keep dai_name eventhough
+		 *    CPU or Codec driver was unbinded, or
+		 * 2) user need to rebind Sound Card everytime
+		 *    if he unbinded CPU or Codec.
+		 */
+		ret = snd_soc_of_get_dai_name(node, &dlc->dai_name);
+		if (ret < 0)
+			return ret;
+	}
 
 	dlc->of_node = args.np;
 
@@ -134,7 +138,7 @@ static int simple_parse_node(struct asoc_simple_priv *priv,
 
 	simple_parse_mclk_fs(top, np, dai_props, prefix);
 
-	ret = asoc_simple_parse_dai(np, dlc, cpu);
+	ret = asoc_simple_parse_dai(np, dlc, false, cpu);
 	if (ret)
 		return ret;
 
@@ -289,7 +293,7 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_dai(plat, platforms, NULL);
+	ret = asoc_simple_parse_dai(plat, platforms, true, NULL);
 	if (ret < 0)
 		goto dai_link_of_err;
 
-- 
2.31.1

