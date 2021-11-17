Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A7454410
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C832F187A;
	Wed, 17 Nov 2021 10:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C832F187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142299;
	bh=n46SpkoqjGTyC9qvu/jXeUwAMeZ+dak52xc6LV7soec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwoEbEqgTm7jg0oZdWBvA2WAsFm60CU7pGIfjQudrGmePJE+hqySeAxZPjr1zovf0
	 B9Sb5Zu53DpV4TAOUXBXH9514o5BtwR5zEo0t41TR6GSHQf0k4Oh8x2A4ZlsRBto65
	 YVLjOmfsPsVIxHR2yiJKt4F2gydGG6/5bV9pZfjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3028F805A9;
	Wed, 17 Nov 2021 10:38:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42135F80533; Wed, 17 Nov 2021 10:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 254CCF80507
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 254CCF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="WXKjgkiy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opft1KRWgug+lbaeOgzvc1z9/rjMOseoxse6cOjaDcd98F/f1NVYS/G5HoPbLm34RdnJlUOLjryAE750RF/cR71YIUbRMUwXKHAMEsEnr5YNQte3Y/zy7X5yPAl9fZjAkGFeF/M5xe9dIAMtXojtQUJXECNNsY2NZPSyR7PBqpo25A+OXzzwlTkJrHndgttxASA+4gmvdYN7Xjt7Y/kC7n9r4ZS+23SSJbVa0+GXZuosj8cTLaT9UMo4KHbwOx2BmPpGZhvyxeydVsmUuVjC+ZcOGTczzEOarq31eZUiHS+bbh3dIBkBpt9yfFyxD0sVuYLUeCls6PMQ57uB+SW4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=HcxAZXbruEDLjRB8QvnmlA6K9LizPomKqCg5DQwARLBOJdifdvEP02eouov3S6qZcu5+pNB/jMTybtOgiLSY2ArosbZe9t9OnTlDbDKziCvyGw2GoaK2eoE04AXabVj3NxDU9/aYOaslSz8Jx1/CNkvvPJvTKDnVETwE5Z/xq/5X9P//RGcfQqmT/M+eHiuIg4qyuxYsoTpc/6VvQsSf1Vwf+VtLOmgDqdAIs2mTS8mmhTbpxrK8fEZygFkYdTAusTODgyfvRA6Go8NKuH8pwJxV2NbR9rav5uvM1hTBWzhHO5F1bXD82vzUOasjaf93jMRTyESiEUJnpZ0PlOj0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/TcaXutvCfzOqQoZbUtGznDhLVWnllTNgKTJn+BGJg=;
 b=WXKjgkiy2iKDso9O9FU7yEcIPe+PICYMeClP7uCbPLn+K94BIxnKKO82l3JjrTaeLbW/CIbvRrcDpHvWnp9k7HvfmORyytY7rBtbBxL5hRsPI1Sl2UAnw9aVZTdqgjeeKsVEmdM0IIQukBFpIhtbz8ZUMBwig7/ImpnFSARM6PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:32 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:32 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 15/21] ASoC: SOF: tokens: add token for Mediatek AFE
Date: Wed, 17 Nov 2021 11:37:28 +0200
Message-Id: <20211117093734.17407-16-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae85fa8f-1f72-49b1-bf05-08d9a9ae04e5
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662383CF23CD88C38E5D8A03B89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUNybBq2UX+pUGwBtip6d6eTmDoBTilcrAHl2d7aAIzJIF25g018Jn0pLqMXyfU9O1gRL+rIFAdksxjBU15mkFW4N0N/s3X5QrhsQOnZeUuSb8LJrRoWRH9whCtUAoeHTr6fp4iXnU4xiTRL0KFV1UTGnCyi98BJufISmF/VDRhUwzEOeliNlFtgsgdvNcorNimEhJhncz8+ghPTjmcWdEzQqFXqV5bdcCOsuiAG4kKzmjJNLcD4W85dQZbOFj+e2wcAiEGeE26PAGW6Oa3FmoSeu3099Tb1jB9w1OwS+8miE9p1Fb2+ZVjpqTtRl3hi5LlSo/3mbQbwZfxjVdm0x9bJawrvMawqL1b+1Lrq//g8LH7WsdWXznXNkHoSvFJfhnjSsSm/Tok7uoP/txosfRuYIojkrRUdlYiD2ihwnWn57pXOWHyCD/vmtXHAy1hBogE29B54OtXQn4VXw0hujERWYXNHU1RbXgYsUlmpMuEQmF7vcaECtieeNFNqIhJnXyBgPzX/GdkE4fRa64Vcv9zsVdUSnZueyBBf8amGm60jet8dceVOCSGk5pX5tS8dBPGbu/GoaGtHADjh9Wwmqr4dlhsBqT7qdflVD38CLlny6aUDU/rbYiR/PrPPj3verAgJVbnEvxKfx2GbC5yvcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(2616005)(6512007)(7416002)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9hdHRsUWhTVzdDandXYUUra2NVanNWNkwvTDdDMHEvT0xWYXgvV0YrWTR0?=
 =?utf-8?B?RzN6TWZ0S2x0ZWRrYmI4aWVRZVQvSWVFdDVocXdLN01hMHRyYkRVbk5EOUZv?=
 =?utf-8?B?NFFNNG5ZUFhhK0R4RzVTVTBGbXV4bUt3R2NyVU0xQXlpbU8rcDhjZUUwYUha?=
 =?utf-8?B?MkxjYmhXOWhXTlZCcjRrWGNYN2VDdjU2RW10RVovMWtwNjJPZHJKeW5sbnMv?=
 =?utf-8?B?Ry9NT0I3NTR1elJOSWRpWnVNOE9NNVNxWCtkQnFLVHpDaWhGSlRTa2J2N1M3?=
 =?utf-8?B?ZlRBSjZXT0Q2VW9XdzBScHFQSU5KYWlnU1A1ZGdmeDUvY3FNUzJjbU44eTl3?=
 =?utf-8?B?THVaRXpqY2FyUm5zdzA2U0lvaG1oSTJ2UnIwcEtjYzBQeHF6KzdabU1uRnZG?=
 =?utf-8?B?b1ppa1dGUy9XRzdrNVM1d3IyRWV6ZXBna21vLzVNMkJLckNEc3N6bGxTR2My?=
 =?utf-8?B?QnZxbkQ0bVZyOHd0MGorK2dNdFBvSHovZDNZVE9WNzZ0UHE3OWs1SGdlUUlr?=
 =?utf-8?B?RG9wcVVHNDFSaGNsNE1uWitRbWhRSHdFWGdmQnAveUZsSTljbytJL0Q0NHNz?=
 =?utf-8?B?ZzhCUEtZNWFDMnViWkFab0x5MEdnU0VBZUdDWDlnMU5vWGR3N2N5aGhKOHVv?=
 =?utf-8?B?SUtpWFo5eTJ0cVROY21YdmhZU1VqMGtmaTRGL1pYTXZwOENISW1TTVBGbFIw?=
 =?utf-8?B?ZlR6YWhOdXMza0twUlN6a2Z6aDZFV1Y0b0VRN0xLb0NJL0NqQkEwRmhSN3Z4?=
 =?utf-8?B?dXpyeS80RmJzZUkrWEQ3R1pkNVVGbjk5VnVuSGxsc2xHRnp0alh1Ny9GU2JP?=
 =?utf-8?B?RVdQZFpaZzBZZnRXNTVWa2FrRG40MnNzWkxiOUl5S0NMbHRvYWJKWUtnVFI4?=
 =?utf-8?B?UWF5bmllUUkrVFVERWduVWhMMXlXeUFzRklJK3NRb1lhL3lIK1RLT3NKUlJQ?=
 =?utf-8?B?QW1PYzE0QytNakJHbC9pbitRQS9WdGRuTTdSV1IrVGlkaFBweXlvV3lzRnpP?=
 =?utf-8?B?cU1YR00zRFlFay9kREtlREt5YzRDWms0WlZ2SmhHMDY5ZXVFUU04bkVrMExR?=
 =?utf-8?B?NmQyWG1Oeks2T2VXTng3cGl6Tk5qcGFwTnRJck9TTFA0VERTR3luOGNHVStv?=
 =?utf-8?B?MlRpNGlMZFJSVEJMV0ZGait1TDBCZStnM3hkVmRxZGpVYlBab2EvTUFGVUxI?=
 =?utf-8?B?QXRTcDh2Y1RzZnJWbmV2NVZBWlovUDBzMVJPVkNIbjBCdnExaUtTT0FwWXR2?=
 =?utf-8?B?d0N3K3ppSC9WbGZzSk1abG10MkFVMXIvR2trTGtLSkVRc3Jibm9Sc1BWNUNh?=
 =?utf-8?B?ckxTVkxLUHYzR3lUTFdLejhSY20vZGxhTW5ibXplUklTdDRKQU5XZG5yV1NI?=
 =?utf-8?B?bmgxanVLbjVXbHBuWmxTMklhRitQQkRBaDFKUlBSZzB4UTdFQ3JFUlovejJJ?=
 =?utf-8?B?Y1BiVUJ4NytBU1lHWUNrc2F2NWNJSEVzOUx2QXlUTWNCWkpMaXlDY2o2QWdZ?=
 =?utf-8?B?R0hBbnRqZXVveUJmZEpLVnp6b1I0L0dvT1FWMWhQRGRGWGN2aXJRRGZ0U0Ft?=
 =?utf-8?B?bGwvL2tUYkRnK2lqQlE3cjYyWDFpSUhDUDZFVm1XcTg3VWkvVThQTm8xYUxr?=
 =?utf-8?B?bU9lOHdMdFlMNGtrZGp4T09ldU1zd1RGWXpYQ1RSVTlqQk05MlVSS2FjVmh2?=
 =?utf-8?B?U3VpeUhTMXRXNXdnTmFwb0ZkVVgyRDVTenRQd2NuSVRUT0pTdkhrSXd0d21n?=
 =?utf-8?B?eEh1LzJOQmg0cUROUWtTZHltVmplYjNpeWd0eUlGaS95UHN0M1R0MVByNkVp?=
 =?utf-8?B?eHUrMmtCanltcjNBNGZveXZGRUR2QmJDMVlrbmhGYkl4MDJrMTlBMk9HMWNa?=
 =?utf-8?B?VDBvSGNUVFFEaXZTQzJtSnQrUWgxZndJUE9JKzhUVHA3TDVMQ01pcm15R1ZB?=
 =?utf-8?B?bEFBczZxTTBYMGtNVHo2eG4yR25XcE5HRVRreTUxNVVZVVVUS2E3Y0FZMVhL?=
 =?utf-8?B?QktUNzNuSEpEdEZuU2dPenZWOWMrQ01kQjlhWWFSN2NlVWpScmpnV245dXo1?=
 =?utf-8?B?NUI0elNtWWZGRjR2RkNuNzRncjBGak5KOHNaTW5pVzV0cXo0bGVEUDhZSGlx?=
 =?utf-8?B?SlZwMkZlNkZRSFhBbGxXc1NtcGlZbW1JN2daU3JTMkk0ZUFRZzl0T3F5M0lN?=
 =?utf-8?B?eHgzbDhpNFo0bW1jZ0Q5a2d1dEdpMHdWZkttb1UxOXFybHNRT21ncXd5aVly?=
 =?utf-8?Q?pBYUWJof9h3WC7Ofe6PFkoN1m5vSjpzfrFe9Gt7ES8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae85fa8f-1f72-49b1-bf05-08d9a9ae04e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:32.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4mvp+Xn4t9ZMGrg3rnBKQlUq7lAybR3GERAyC4JS1yVFH4kuSzM3SRvJS9dywkJuJ4YmlFRRDZEqmaqLHRx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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

