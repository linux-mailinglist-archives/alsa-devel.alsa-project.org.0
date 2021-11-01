Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F6144149A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:03:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B1E516A8;
	Mon,  1 Nov 2021 09:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B1E516A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753781;
	bh=0AdWe+wESoIZLkxShjcJpWZfEBeCUzz5t4tdBvx0xeU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HccCgqM3PuccSp2BqYqwEWESMgRKFcvBn5CScYs8kVgEEpLtc/v9uBx0XaIZ9iFL2
	 SPc+UdqGGDJHDC3op2tnucCU2cJUG81aMtXLWtBot+VuifWDNCcSQeMmT+w6CnAyew
	 VmUanZogZsmKjuK9/LmAS0HdwYgVz+8rOTmSwxgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BB2F804ED;
	Mon,  1 Nov 2021 09:01:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8FAF804ED; Mon,  1 Nov 2021 09:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7095DF800F8
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7095DF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="B5UESwyL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzAfdJeoEPj/Z/W/jgXqdW+Tw06u6xkErJHMkUouc9iLnCrdfBmdvJLsXH6xVuybdy9ZyHMAW8VDSCU/NXbYFaCytFnxGQtQn0c5CRfKdtPhe9UEGAaUiTJ7lFabcXGAB6wQ4PHl5b0+g6suez2A5qiqDuvOemZy5ImPkqc3KEI6jGdnoubQPCVFUVlYKxYc1W8I2obwb5xtzStrP44JZN9CM6eUqhmzTWvYAxprfy367DP9qi07GKHqdMJr6Zj077/jTq7Lcn9M6fOARPfgso06boW+anrHEvuYugAA5YWv8EGAz7Y4eZ5gXlWSZ+/XbiVaWFqyrfi2oZOeaKQL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqt20fJUIGTFP4E/vWRRVNFTpG1mnUMB2/YdINTbsV4=;
 b=fIV2CzHBr/UsfNGnn03UXqBZJqQOD9rin2L8SWPjyaEI+Y80TExsBnsRcjWna4mXiE8DjCpCTQpqNU9PSwv8c4cZHaWshmiRleywdDuQSnxSMAVVjNLqHdYW3JKIRSom6udsCdpl/jOEbHluLwURWy9TRPKEclwkv386KNHoCl6xiJL8Ym8kZqtH/xOb5sjy2xv3fh8IqA0Utm8rc9+yjotYBOtV1od66r88hKFFcZwtztaRVWIVfQU2xQkUD7zafAgHkyKWwxhmd5WAq1SakTiaqZWck1rzxGF2+ZAUOLeKwZzh6R9JVSmgGYa3aKnjFVR+RmJ3Z2/nCK1pWHK54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqt20fJUIGTFP4E/vWRRVNFTpG1mnUMB2/YdINTbsV4=;
 b=B5UESwyLVTEjNWZB3za2DG72jGdw5Wogp2Hk4F8yZYKyw6pDCr5wyKTyIJvocJV/s9krzKwh4J+l9n5yjN3NG8L8sLKAFm5AX7jbuvXuNZNXVCvqEY8CcLM/+SOyoDUCw9JD5lR0ClkoUY6iciiPkjr+lAK8Ncv7YA8uX2T06wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:50 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:50 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Mon,  1 Nov 2021 10:00:22 +0200
Message-Id: <20211101080026.297360-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5719:1500:cdb2:376b:257c:429a)
 by AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 08:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9dd50a-e17b-4483-0c26-08d99d0db816
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430D52AA84F480DA1D2C22DB88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqxBmEOIB79aqUgcsADftyXcxLEnzYkKud9uGRBuEls6BFN/jLs+TETgRXFe6ozov8CmvhQAAAYCD60JHGKiKjtcY5oW57MURWOOvf//1yq0CQTzRsd0j/V4FJrEA3gqKwhZnIgOwysBlr9g7dEkT+/vmy2R8JYCMXkk8hFh0rcN01fyJXlLdUkZfRV7ucOXB/AwJbvMChI8WHwuoLcJc3+qAHzRqM7uLk1KFvfqWaBJATbR8dXd2JsLTqKHbPSKuM6GKUEV0ctujlomEpeKFdU8JBWbiHnVMV2RwAMet3CeNhw614AQ01Mf/WZNzzXjqUAXa+XLSHMCscquNhCR6IGkqFHurm3He67c2VKBcOoDPuZdXxxxsye2oxM3fDfExesmaheyh5as8yvtjFeZxXMg/EhCyGkVjKNV+qzlsUT89GWk79ZqJ7DDO8C2lwzwSPQiUTU7ENS9OR14fo3KDUHBAYcY9wniipeTOmOD7LIUNHjeK2qMLINYle1X7RxNpi9Jbd+HCkLwFvpsbWm7g3gbw9XF1gxZ36sX6al6VWOwYFFN6DDvOy4Ww60teyvdHdr7GqFS6CXar7pQ0T4a7L6nyUeUX2UTxTM6JD+bckCsFvfk8Mhj/fDJvm0LyttAmxtL/1Et8LMuq1lSp8JOPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0tRdEcxRDJ0ZG53M2xaSTRJTWp4Nk81QVZrMnpqWTNYSEpXWnlnZTZObk40?=
 =?utf-8?B?dk5nL1o3UzlVc3hnVElTeTArRUI5QTJsYy9UdUdoVDVlYmg1L2YyUEQ2aER4?=
 =?utf-8?B?MEg4YlVHenJKWG5YSVMxMHFORXNNelRldUgrWmdKS0tnWTFhYmpmakhJeHVX?=
 =?utf-8?B?NU1YaU50QXQwa1lteFVFcUFqUlo5M2NpUStCdzFBWEVkRE8wNFhjQnR0UTBP?=
 =?utf-8?B?UzFiKzAxaDJoNkdLcHV3NE1ON3pEQzBnbjFDZEsvb3M0a0pTczZtZ2N0L2ln?=
 =?utf-8?B?Yncyc2czcnF2UW52bGpqSXphK0hrdzN2SUFoQmZBRERDVlg4Z2gvdVpiYmdG?=
 =?utf-8?B?R2UzbCsvdGkxMm1RMHRETlJPT05OMzZjbytNeUF2UjVQc1c3ZjhUU2xSU1JP?=
 =?utf-8?B?YXJ4LzAybExQWk0rMkdaZ1B6clFRVkxxaGFHbFQ4TlYrSVNISzFEOHdLTlN5?=
 =?utf-8?B?NVJCOVN1eTdVM0RKcHozRzZzbG0weTNYTlFqdmp4WDRQclBrZWRWV2dZU3Fr?=
 =?utf-8?B?TGk3MFNGamxROHN4UlllVytUbjVRWmYwOW9rODJOZkY5ekxaZG1YUFZ0aXRT?=
 =?utf-8?B?VUxYK21iTElUdi9ieHRoSjZtcFNuMHJFWHBwelQyTW9HNzBMd1NsUWhHWVhD?=
 =?utf-8?B?bUpaNWlhOE0wQjBLUVJybGlXbzNuSHlMbzVJM1pNaGxhQnFmUXhsb09yeVpW?=
 =?utf-8?B?QU9adHk4dU0yZldXZkZjdHlVR0puWUZHRWNsSE1lSXhuTnNRcUl1QTJLeEVp?=
 =?utf-8?B?OEJSK3cxdDEvMjZEWGpFNlBnZHJkNXozaCtBKzVhb2RkVm1rT3g4OHhUUEFa?=
 =?utf-8?B?ODlJeE9FRWdjNGZrNGJaN3MzaVowUDc5aXplbGUyV0ZkQldjcVdzWmxnakF5?=
 =?utf-8?B?TTVTeVV0aEVGK2ppaE5HVkIwZkFoRHdPSnNhMytkd0Z4VWYvR05oRXVqZEtl?=
 =?utf-8?B?RHNTbWgrSklwMTZQeCtQTXd0cmVScTRNMUEvT3NHNS9nODR1Qkt4QXNVYmhy?=
 =?utf-8?B?SlVIV0loMUJOeU5kR2sySklMM1dqTnhIMUtKUzRoWHdHS1Uvam5jbTlxcEpS?=
 =?utf-8?B?anczcExlRUFldlZtaERJZm1teTB1dHhGZWdBRHFOVXNqVG9vK2dVOUs5WUVH?=
 =?utf-8?B?Zjl4Q1JBcXdwWFhvYVhLNm1ZTDZYN3FiOFdldUg3cDRYYXhabDMvaG9GU3I1?=
 =?utf-8?B?d2xHS2Q3MmdjUkduVktJNzVxZHB0V3JvTTFkdnY5R2krTDl5TUdneEhCanVD?=
 =?utf-8?B?YjZqZEk4Z1R4NkViWWkza1lDR3pwQzdodjFieGVxUlp4SVRYV29JcnJrdC9X?=
 =?utf-8?B?eVZQNVBJeVZJa0RmOEtTY25kbUlsRDB3ZFhaZWk0Y08wTDJ5aGdFNUlGN3BZ?=
 =?utf-8?B?WlZMV3V6NktHYndIbUZpMGl5amZpN2c4NmRhcEFUeWhiMDVaSkoyTlJWUHpB?=
 =?utf-8?B?VElWNTEwR3FPcE03bmtnNmhUSjhWSVZBNThuQW02YnEvbGp5V2JkZlRwNThp?=
 =?utf-8?B?bkVHcUwwUUVmS3RCRnhZNng4VERENEhSMzA5RmRIOWJIWGlRbkpUcXpxaHVm?=
 =?utf-8?B?bVI0b2YrV1NBbmI0RUdRbDhpK1pQRFhaQkduMHkwYzFsZ21pYjAwT3pNc2NG?=
 =?utf-8?B?UjlTTFFDbXRvVnU5YWdLekI2a3hVN3lKYXMvaGt5ZG5tL2RFNnZraVVxNEVE?=
 =?utf-8?B?MFJ1NkxIYXZlelhDY1Z6NjVMK3hlZG9WZ2tNL1R1N0UrMVA2Y0dydk5EYkJK?=
 =?utf-8?B?Nk5mWm5pYUlQMGpMRTNod2hST2VIZVhsLzgxaU5SWEtxNmFScjdOejJHUVZy?=
 =?utf-8?B?MjVuaEtpdC92K0p6RE1hM3g2eHJTR2U1OXc1WUtRVDVrZ1RJVTdTRGJTSHhE?=
 =?utf-8?B?SzQ4MzFYZitRd01CWmFzZVF1RWZwQ28zZEZXTUlQVVRFRXROYk1LUWVBcWl4?=
 =?utf-8?B?RzRIeTdxNTJhSExRelovNFVBZ1BYY09JRklyT292MHBOeTR2MG1HVkU1V1hk?=
 =?utf-8?B?RjdLMWZVaTliQ3Y4a1pqRDA5ZkxKMW01L0tTZGcyeXEwYy9GQjk5OXFidXRM?=
 =?utf-8?B?M1V2ZlBOTnlMSThVcHVITnMyM2N3WXVyM24rekhSUHBiUE1tVFFVYVVhbW10?=
 =?utf-8?B?bTlrS1NoWG5JUGtzS1pEUTNLMDFxV1pyYms0VEdBU2lSb2NJT1VLS3JDYk9v?=
 =?utf-8?B?NXo1VjFWRml1ckk1Wm51dVllaTBERG1ZQW9ZRDBlSVRIbG1QQmRqTUlNYzBG?=
 =?utf-8?Q?N6KXwLiSFm8sHwWBSb+oDEBfVsEl42tIB0Y+e5h3C0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9dd50a-e17b-4483-0c26-08d99d0db816
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:49.9923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx6JJlzCq98sDjkq/HnSqM4ICmM9NROzjSnFVnRmv/qO8rJIR3fJ6q2i4xSx7I9aqJNo4naAb00OR3IduB+FVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, YC Hung <yc.hung@mediatek.com>,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com
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

From: YC Hung <yc.hung@mediatek.com>

Add the definition for Mediatek audio front end(AFE) tokens,include
AFE sampling rate, channels, and format.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/uapi/sound/sof/tokens.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 02b71a8deea4..b72fa385bebf 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -140,4 +140,9 @@
 #define SOF_TKN_INTEL_HDA_RATE			1500
 #define SOF_TKN_INTEL_HDA_CH			1501
 
+/* AFE */
+#define SOF_TKN_MEDIATEK_AFE_RATE		1600
+#define SOF_TKN_MEDIATEK_AFE_CH			1601
+#define SOF_TKN_MEDIATEK_AFE_FORMAT		1602
+
 #endif
-- 
2.27.0

