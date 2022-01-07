Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EB487E73
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F31C18F8;
	Fri,  7 Jan 2022 22:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F31C18F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592130;
	bh=dLtDnhBfFhL3QlY4T08/niDmoQC//ouRyJNItr+l958=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=owk0NYPbea4un1ygF5MMH8QOHx8IxS3MMx5TfVbMK1jrdKjh0rX4Q/ifN21gXr5Bi
	 Gm00BKZbvxaFxcxIUvMVyy4WPdpiJFBVUXpt1Kz/X6utb0B6Mhoc/uQJbhnN9hFNaz
	 mkNnbRWV/G/ud29XBMZ6BAx741lwIX8DKPJAgD6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7213BF802E3;
	Fri,  7 Jan 2022 22:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A61F6F80249; Fri,  7 Jan 2022 22:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F1BF800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F1BF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="30GgK2QA"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LPGa0026852;
 Fri, 7 Jan 2022 16:47:34 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJMZdECx+4Qo7PzvJPaF0nzmonTfM70tIY3Se6wIVfPwjgCzYvnlNv96Y2APd0GboOxWuRwnqOnYMbZ1XZjaHXKtcMxkdHT3f4AaJA2HhkBkJYn5ar6DeLbHce35oJVB4T/a3qQhAW1UeFJEPj/i4g6QYOlvwgqt37XWy4zivsyLCVDsksTqWVbm+1TtAmraizMAxVzIg1g4yw9huosHEEPU8b2Qgz9DVY5e+HPAeDIl9VoCLxDOUjEmsKpLgYOUPzTTm1/vpMbAhrbJQhhLA8KnkEMcmFoFq3GuyKt4isux4T36oBqv6epIz7NA358dteuAQ5t5dAFk0eI1WRC5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dTi/hvo9IVGo1Vi4SFKjWoSGH6+3EIiEj7RxjXgl3w=;
 b=louYTWZqpI2DSVhyIGQKAkMjP8AdayMVuDtyBgXWDftX63biRqW9Bu8nmbXIQ9rST5TqKupfTtned3hEdC6fO2VWREs55whPMJA++8v4cl+m3pJWnv1T8n6QMy1b1NsOeZMO29bODEcI9q8D8mkSv6mG9xw9sz+GCZ4r27Ho9WNWG2jHQ+w/vGLZ+GFppfvNLbpFZSzeGrxiGwejfHbKydrpGTW4zMmoo063ZKZL6+XFVn5EHuuCEEX1A8t6y3djtulbnLOfoM1jeI4yeaqHBgIbT+8I1yky0E6t7sWySWV97Edjr+EqXWqWupWs+eRbdq6js4SVWunm6yqNBP0xNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dTi/hvo9IVGo1Vi4SFKjWoSGH6+3EIiEj7RxjXgl3w=;
 b=30GgK2QAF2M78mcAcSvywaTT+nyaFiOhOqPprwutpjJ0PXeEzxKUuoKnb1c9pCnZGWeY6KWo8ptTDdZ208CchTiCbz8qec7FpYUL91wChJlsF3ZsR8P6fAfmncWEEvA4q6IweuzEwWMxRjLjtemrGdDmncU74pWCXe/o/HePC0s=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:32 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:32 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/6] ASoC: Xilinx fixes
Date: Fri,  7 Jan 2022 15:47:05 -0600
Message-Id: <20220107214711.1100162-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR04CA0136.namprd04.prod.outlook.com (2603:10b6:104::14)
 To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 567c114c-ab0d-4dcf-c8cb-08d9d2274f2a
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB62759D9C1A117A5296448F1DEC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3TA4PiNPaprj4kVHKYh1ueuE2Aw+xdqMpZV4mTq2SsHiVk82YnsiDdp0EPY87ERDYgFyUbePaJnS0K1oxCe80QhyDgkpAXJYfjUnZY2ySEraMKJPXY7wR3IUzdtschSowqyfHo/XrNcquiBEL4c9W56hg8ou6IZQ8flxYG7wDY3R6qMWe5/eNnk2OpTBWVdW5QUThpSTNAbhop52gC04pMqeLYpZXu+MWjC/ga77BVmNCY5JSRGeSd/IOb3wXxbB19O9yIUIhmimxtohltQ08kkqcHFRyM6cICGbD0v3U2ciPFayPfCplTBsxrert5mS7eq9oNC4Lcg9qfTWFN95Brrc1m3EkZ/lUvzz6cMd/Jbl6Es0x4tQX758r4LYmunqDvmt2XVffsbV1apJ4rdwJ1WpAb1uZjL3hdhypLIKhrZsklD+vg2hhlJ/VbSqgox84nfc2aTlsRgJ2dtLD080O15rTNDCCb06gUF+w6mmmJxOhA8rSRXGSbulhiIO+hM9n3I1uvxiDm+cTuRMIds2JqaB1GwoNE5Izl03NGMdXacdjx555cAOgCO0WZAguyIN0yMa6Se869z6Oq1uAxshA6wBwMtG3AfZvU/cMO4BV5zFlNzysITCA0pU1drJ7sJBeIiIJkmS3OFEDC2ie9v824efPlTK6Mpxal58cO2liyCScv6SaW7+uXjba4trEvUu8HdVSmU9XVu4OgHn/U5cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zFlB2hplySH7m+C5GEOkf5pgwBBNMh28WZ/PUQY+nJClkg82F6nY4Rb8BWfd?=
 =?us-ascii?Q?hQFA6Y2jjXQJuY9Kb/K9OXzk4cFf41mWBByBuIr/da7H9C+hCd0GxIUj2VFQ?=
 =?us-ascii?Q?UP4Tihizeg+uxQpAaqjNYfzaHahSBOQ2Ny+V5Jipj3+yhZ03kJ4hMhO6iM5T?=
 =?us-ascii?Q?gkd5ADM0GCKmQ4HTBo/uX+/QROW9RWCFP0gsgrWKdky2QbCnrJGFUy1au6hU?=
 =?us-ascii?Q?oidrjehtCgCqDr3I+6hC7YN4ZEFYvY/KdCK+peLhvwCqlHZ+qSmHx47SbMaq?=
 =?us-ascii?Q?pRC31NYE22rXI+M42yJHyLP0jqzbdnypnFhTkiY4UsDYSdtnWeGGnDyJ7KF3?=
 =?us-ascii?Q?My665J6l6a/KbYH+V6pFXb0Wnsj/mpKB6yYP+COSFwvDzbRgKqkJCwuTDgE2?=
 =?us-ascii?Q?GNM7ZqS2U4NYZt+pccMjLjXmuF0RyNiquSzu1LpqSgEQ4v2unJ3BlurSdpqH?=
 =?us-ascii?Q?ZF2A1D5hcHoPepWXWlFov4sA32HitG5/P7S57R2zhzsmv3cx3Fy+nEMJGwRA?=
 =?us-ascii?Q?AoBS06cJMoVb+armCRUMZzJQl+Dc6UQ92NSy3crUliidh/gj80V6mwvJoRWd?=
 =?us-ascii?Q?HQb4AniITajDS13xqHkIDanQXDO4aDUwgb0BjN9ic7vR/A/aInzcg2GprCfF?=
 =?us-ascii?Q?LNYIVeHkoJNX6SzYa8KZInt87qG+lxzCCd6TMMvCFpDPPSIc5Dg5yFOOg7wC?=
 =?us-ascii?Q?frkkuwmjyJ7Ch4W5LDxg+N2bY/yN8rBW+uwZM0IWL6fYXHLx/rPxUhYV02Wp?=
 =?us-ascii?Q?3rsR9B0RTGffzDT2yA+tt1oZIiibJ2Dj28e7f1nZexY4WQb3/AL9+dtk3PRd?=
 =?us-ascii?Q?ElwMwVQ+4ENywsAvDiZ/Int647LIMmatIHn6WK3wUqmEuZUARvgiHJPeS81Z?=
 =?us-ascii?Q?0EKwC06HrewvZGnlwTP9IJjXQL8T+T3d03KO7A7QTuPYJzQF8+QHYvBQh9bu?=
 =?us-ascii?Q?HRxFzUQpLbEwtnmldz+45HGeSMAqIw8LQOPt2yzyvaZY3Hg/Fe4vRV0r9b3T?=
 =?us-ascii?Q?rP9NKXe2hXRDp2OD+xGxLDbJg2x+prX7jWDJIO1Etjfrl5O9Yr4NhUWPdgry?=
 =?us-ascii?Q?d10pm/RU08nGsSPk7SCTNDef0Q6CLzfdFuia804GJUGTRF545iQq3eZN43ew?=
 =?us-ascii?Q?4e72WXYPKnQeAaSfD8oBRMEbHgjv4Mb4RmEnoElE2+J2jun4h5ijRKCfEzTv?=
 =?us-ascii?Q?01iAnV5IpRsuEfrgTWoMnUivhLq02iAf3F0urWAWPbQQdNCWFt71VVYhjy4J?=
 =?us-ascii?Q?JJ0LwKFNr3vLF7tahJMbzLbF14QGqetrCyQwWgvWhsYj4BvBIpBjAUpIQzme?=
 =?us-ascii?Q?nQ+I+kGphoZNVT1ba0Gh4abBHqKj7IH3ny90+Tqn/FnVFW1dne1JseZ9LTyl?=
 =?us-ascii?Q?cgbtIUiSVvJpuAXlSE/ZwVSLPmzz4W9P0qpJKNK20gtouQds7VhVSHWaYwgO?=
 =?us-ascii?Q?jslIeXbW3MdSlToqKXJ7U8D8CnvFKan/L68lhUJSNsCJAE4fOp2Fial9ycN7?=
 =?us-ascii?Q?HPDhCBJoS2pWRDNiIO9hkHPnZauM/J54z+VqrhA21toHhBTEzTfogFHpKC3D?=
 =?us-ascii?Q?zZgnAUz0/VR8dTpBln+cmydPhHZDYyBSzRFTkfymqRauTASlujAdGdiN6uTG?=
 =?us-ascii?Q?aBQfSyWBQJaxLJRrCbjkQj8RV28/pHEMQVOS6HhHWMhkAhshU5oBiADQ7OlG?=
 =?us-ascii?Q?uiykpaK+5wy92LdXhZlX89iAMmU=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567c114c-ab0d-4dcf-c8cb-08d9d2274f2a
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:32.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbooSOjdM+nsbvg68TDIe5CZE0+4sc9/P3OGui+XQW6YIoOBhIKGR5aYBH2NbNizZ+OWZ/5CKp9HK2/EMe/121YO4ZOvR3zv5/buZLyXcJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: cWWEDqsY3aljEAeRGigpM2uHtxq6YvCR
X-Proofpoint-ORIG-GUID: cWWEDqsY3aljEAeRGigpM2uHtxq6YvCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=620 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
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

There are drivers in mainline for the Xilinx Audio Formatter and Xilinx
I2S IP cores. However, because of a few issues, these were only really
usable with Xilinx's xlnx_pl_snd_card top-level driver, which is not in
mainline (and not suitable for mainline).

The fixes in this patchset, for the simple-card layer as well as the 
Xilinx drivers, now allow these drivers to be properly used with
simple-card without any out-of-tree support code.

Changes since v1:
-formatting fixes
-renamed last_sysclk variables to sysclk
-require exact match for clock divisor rather than rounding to nearest
-broke out driver data structure change in xlnx_i2s to separate patch
-added constraints for sample rate based on sysclk to xlnx_i2s
-switched to separate function for DAI parsing for platforms in simple_card

Robert Hancock (6):
  ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period
    bytes
  ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
  ASoC: xilinx: xlnx_i2s: create drvdata structure
  ASoC: xilinx: xlnx_i2s: Handle sysclk setting
  ASoC: simple-card: fix probe failure on platform component
  ASoC: simple-card-utils: Set sysclk on all components

 sound/soc/generic/simple-card-utils.c |  15 +++
 sound/soc/generic/simple-card.c       |  26 ++++-
 sound/soc/xilinx/xlnx_formatter_pcm.c |  52 ++++++++-
 sound/soc/xilinx/xlnx_i2s.c           | 147 +++++++++++++++++++-------
 4 files changed, 200 insertions(+), 40 deletions(-)

-- 
2.31.1

