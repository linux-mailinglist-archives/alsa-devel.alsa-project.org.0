Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD28454420
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:46:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39D3187A;
	Wed, 17 Nov 2021 10:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39D3187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142383;
	bh=+miEE1w8A+K2efniUh/mVep9liVka0VJW5pVL5AxLsM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/ycokJfrpFShYitZnOn0iieOvfw7rlP4+DK8QQ+8h+UnnWHwkvehSZ6AMvItOUNj
	 4qfB/87ScgBZw3HEUrboOPBixoV9FfgrELlsWsk2wWUGYwpfMv/cxu9TfuIBz6vsbc
	 MM3bzanwwZRmwvTUWzB22Qqo7uB8nyUAi8PofHac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A7EF805C6;
	Wed, 17 Nov 2021 10:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FCE6F80588; Wed, 17 Nov 2021 10:38:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40061.outbound.protection.outlook.com [40.107.4.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C67F8054A
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C67F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="bFfqewI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVRv+pLB+lmzHBE0hz2fIlKWhVsZbOH5p+szjGHPWgIZvkH9m94UBcNol9nxQNfGjTvOWlw/RV+v2sSD50/IB5cR0Pi1Gct5Pze49kSSCtYw1EapB/Q3YlRN3m5y3+wy7LzBYdB5xychSy1IXY+YBMQ6I5RyzYhUD46YjofwY1pdA3X93UyJrmWTrnlwLYyqxupToPVP78hKYUhBrEy6bqOAUqg509oTE/oL0ZlqjXl9WTWUX0AxVoomYwwZh9ADcQJIem2nPWFGfYZlyRMpKgUNyhu0Dhh8UphrlAcL9M/h/isAesajDKe65+nWpvDACcn79BRgM+E8de7NzHuevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UjjWQcQXj7lwzktA08w1ckpS4ND2jsRngX7+9KTay0=;
 b=lqh3b4nejQAIOK7w/aNLCZxoe04aGW+a9WoUsyCPp5B77xIlaRxTR3RO8CJMoarQd/cIEmbhGY0qr1JUVDvvKYjzMpUP8wSezRaoL+gaLi4rkshGfAyVLzjKA+mRZGurmo5roL5jYP/2WQCR2V14utTOabzjXYbMMWo1JPJvWrQZtvLupX1xYAo7BRscs2+1NBO3VFTnqthYaFPDnUlv8OKzPxV5A2McEgZyLwPLBy4oNdPRR5yXbv2WevCNli4m9HIOlbCrfuSISVNkq7IPEuY6BTI0oawvPjMhy+c5QYDZP++rbs889zNnWAOEzo3Rol14YAG0zcsW7jqc8WWaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UjjWQcQXj7lwzktA08w1ckpS4ND2jsRngX7+9KTay0=;
 b=bFfqewI+pE5sHtIuGSTsAXaPQ+8gSJexSo7Efnz815KzoidXYiNJe0RHe0p4H3mawwheE5JQw/rKDb/KrjdOK1Kk3/qOirp4FUDOsMQF1FvPbDmFyNwj2ely8qnId1eh2ktZoLibQMxTffPOEoGF6Ac3FbnCn5WivUwTNhcUl/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:38 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:38 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 18/21] ASoC: SOF: Add mt8195 device descriptor
Date: Wed, 17 Nov 2021 11:37:31 +0200
Message-Id: <20211117093734.17407-19-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b9eb4c-1b1f-4333-472d-08d9a9ae08ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3039D9932F329D3991E3CB8EB89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkHLOStE/Uqhklaw5LU2QdD2THQtEIgNEWoYLKL4EmanrSpLOpeSfnOWxLnPVNN/pRAlwMpjAArQXbPyZi2lQSY4HTvR7C5FhrdYye7cZ/I8n9wVoewEwnCcLFAM5okwIoLoNoObKb0NxwbF74aEV5t6f8qTjWQphh497tyK2TuKFlOoH11o5DCJpZW3Zw+JDYB7tSNVaseVRvz1dqubbpsvpn1cFpCqB3CB37QaugBQ1J4ZdbxI0f+4ZnKErV6PG6LiSSUlIthoyoju8UEIibeGQLcb1Y+hinQV9HrYT9TxNSqEXb32PY4ADxY2twnjIlQcRfARb86vrgyjEsY2ab5C2LGApQerv4ndxPtHC+xOA+lvIRx4mXuoXs2m8v1FxfCOGs6/TVCj9pUlLshOA0lq+Nf48zf0cwozS1VfDaKxiySUHgixhm/6r57y9ctzc5hI2UN54a3EqZmuZWddBS+UG8R/51zbD18JNl6RkjPzJlqTzHyY/Z8oilu7R0ICDAxY/6r12I0Cf38Xy7NNSEmo5orVvwM/eNYgKX/NYftCH+VLCoDWVptYjfC4c3pWXi8Vi55la4khnLqgaNG/I6WhOjaHIZrsn7D7j6dK+52/FmE0z8WzDpXSl8E/gdtu3R66ymfqkexlX90DCbc3AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(6666004)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(66574015)(38100700002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRnbTVic3FkSHZ5Y096dDRsa3BUeWcyODA0Y2VpZVE2SEJFL0FOUUZwVHlm?=
 =?utf-8?B?UGJyNTE5UVJ4NDlwNTNwajNvN2FpVGtabWVhaENlUXVzejNTSUpzalFVS3ZP?=
 =?utf-8?B?Q1lyVmtsVElNSW5zUlhJYlUrbExLL3Vmd2JEY1A4Mkl4dGlGZUN5emhVRE9P?=
 =?utf-8?B?bFJHNCtpeHhESmFvem8ycnlSS2cwc2dKNFNEdk1WNnh3cTFMSGNkeWdUOVZw?=
 =?utf-8?B?RGd4ci9odTVSejFXODhUdGRLSTdQZHN0TmNCR2J1Z1JMWEE3NXpRNjdCemFJ?=
 =?utf-8?B?U3FMbVFFMjZBZ213Y2RJZTRWUi9kTDZmM0FKNWFlaDU5QjNjd0dub1daYXNU?=
 =?utf-8?B?SVhBU0dwVWdNeFl3eDJJM2d1TFc5MzB4bzNZRzNVbEdmTlZSakJEeFRsSmVT?=
 =?utf-8?B?dTdDaTRrN0VjTm1Pa3NXdUppMnhmdDcybmhESG9ScWdrd2EwNFhjYTZ0ak1i?=
 =?utf-8?B?TTBSckUvaHNuT2JuYWRMTlp4QkZsaCtWWTNkQko1WWlUamd0K2xKYm1QU3BT?=
 =?utf-8?B?ZUE3cDdHRitYSElXVU9LR3ZsbzZPb05uUWhHMnZqemVJWHI1WGVTczgraU9h?=
 =?utf-8?B?c2pVam1UbEVQVE1uMVl6azhab1RZQjEySWM5bTg3SmtTVG82OHZSWFVObmp3?=
 =?utf-8?B?aEh5T2doY1RKb2tHaVhsT3QrY3lZZ0J0VGhNMkFGM2FkRDNTeXRzU09sUW5C?=
 =?utf-8?B?M2FJbWpEVG5sV0pUN0RTSHlOVDBEcmw0RlV0Q0hpN3RMaHA1MWNHYTcwSFZE?=
 =?utf-8?B?K3MxdHF0UThENW81T3dBcXoyQUtQWnRveWZnYVNyUWxzc2RibE80eUFYMzJr?=
 =?utf-8?B?eGFSR1pZVTJkUExDbnBlVlBMcnNiUjZFTXhXdFNzZDR0QWJvTGV3SFZwdjlO?=
 =?utf-8?B?am1vL1N1aUtGNDF6RmNOOXpYNFFRQTFJQzVmdUpTL3NLd25MaUlmQnNxbkFj?=
 =?utf-8?B?Q3BCZzlXTStrOEdDcXpuQ3NCUXdsOUEwWkJ0V3Jzb0I5SEYwQk1EcHB1eE9H?=
 =?utf-8?B?d3RpV0hrL04rQUdtbkZzQm9sdlpRZm9odmdDQ1pVQ1lpMDBpSnB0cTRFdjVN?=
 =?utf-8?B?Ui80VWs1RVRiVi9FZ0V0S0pUdnNGM3J2WW1GRFZHRzJZTHMvbkcwOHAvTkZ1?=
 =?utf-8?B?YXlSUFViVVgvRXBoWnBWdVhYNmVrYlJrY1kzdmhCaiszcE8wWC82cXkvdDYr?=
 =?utf-8?B?OTR0d1AxZWVOckpGbUt2M0E0ZGx5Z0l3TnozbThKYzQzZVNMNEc5Q1Z2QVlY?=
 =?utf-8?B?a2l0cnczYVUwUU1OTE9mWW1QaXI3Ri8xYW5yUnVQZTFPeEFzMlhSaWlxMjky?=
 =?utf-8?B?dUM2dEh3cXkraFFkMzNCZ3J4aEU5RVpXdVFpRzRwTmhiY3d0c1hVWlRsYlY4?=
 =?utf-8?B?WjFHbEV0R245OC8vcGV2MWFNb0VmSUp3NWNtaXRNL2krUjdONVlmYXZ4aTl1?=
 =?utf-8?B?V3ZCR3EzS2VORURwU29OYktVS2V3ZVgwc085MDZXZWFKWUJrYVgzNktZd2tn?=
 =?utf-8?B?UkRLNEZ4dmR1cjZLMnJqeUxUK3hKeXFuSmtKZmtQY0h6S0REVFRGRE80Y0Ju?=
 =?utf-8?B?VXJiSDl3TWJVT1c0cFhOd3ZqcUJLMWVZQnJ6S3Y1ZmxQMTJncHlWS0RJTm13?=
 =?utf-8?B?ZFJrc2JwWTFORmVTMDZWaE5OYUVYblNKZ1hNT1l2VmRzdGNBaEFvcG9ZZE1t?=
 =?utf-8?B?aXZUTXdldm80N1BkcUIraElSZ010a1kzUmprcHRPOXdZUnlRcERmV2VRdmFy?=
 =?utf-8?B?U3JtMkc5UkcrOCszUUxVZThEaVZuNm1LMHYxeTRoTmRZWGdveHZqNmFac1lI?=
 =?utf-8?B?Mk11d3FxNWVPaHcrY0tWc1lhNkFZQm1PSXRtaVR3TGJxc3Nkakd4aEFHTnpv?=
 =?utf-8?B?MTBGd0gxNmVYSldBcUFJMDlrWW9TL3Y1TzI0V1FpNnRJc2QxN1hESDF5WFpw?=
 =?utf-8?B?dFJFek85SmpyT0NsTUN4M0ptTXZGYlZaOStmc2VDTXZONWVxazNLTlJuZkQ0?=
 =?utf-8?B?UTJZWWJYbjBqSFE0MTU0VDJMc3ovVGN6RGo2NmpMTEU5V0tpRFpjL21YbU1n?=
 =?utf-8?B?UWJ0ZzQvRjlMaGJMQ1dXeXFwOUtValJWeVNvVXQ0dS83L1VJWHJuYnowWGtV?=
 =?utf-8?B?UStFMTRPQTVhUWZ0dGUvQU8vaW1remVUanFXV0hHZ21oMUk4dm1oQTQ3aHYw?=
 =?utf-8?B?NVVyWkhBNjJqVmRhbG5wWUJOSktoMy9kaWQwRDdyV2dhNkRZTFQxZmwyVVl2?=
 =?utf-8?Q?FYs4+ZwNgWH7BQLibb9imfsWGxbB9dH6DQqbs+uSQw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b9eb4c-1b1f-4333-472d-08d9a9ae08ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:38.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzK7xyQJKh9h9b1U+sKJMGWSuqA/OKkO9CExvWJNvU10hT8xk0AmBt4/aoE1TjqG2Eu8tNXpRRn7LWH0aCXYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
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

Add SOF device and DT descriptor for Mediatek mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig      |  2 +-
 sound/soc/sof/sof-of-dev.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 41f97c6cb4c1..977835f9b987 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -43,7 +43,7 @@ config SND_SOC_SOF_OF
 	select SND_SOC_SOF
 	help
 	  This adds support for Device Tree enumeration. This option is
-	  required to enable i.MX8 devices.
+	  required to enable i.MX8 or Mediatek devices.
 	  Say Y if you need this option. If unsure select "N".
 
 config SND_SOC_SOF_COMPRESS
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 885430a42226..412cbb824b84 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -13,6 +13,7 @@
 
 #include "ops.h"
 #include "imx/imx-ops.h"
+#include "mediatek/mediatek-ops.h"
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
@@ -50,6 +51,15 @@ static struct sof_dev_desc sof_of_imx8mp_desc = {
 	.ops = &sof_imx8m_ops,
 };
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
+static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.default_fw_path = "mediatek/sof",
+	.default_tplg_path = "mediatek/sof-tplg",
+	.default_fw_filename = "sof-mt8195.ri",
+	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
+	.ops = &sof_mt8195_ops,
+};
+#endif
 
 static const struct dev_pm_ops sof_of_pm = {
 	.prepare = snd_sof_prepare,
@@ -130,6 +140,9 @@ static const struct of_device_id sof_of_ids[] = {
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
 	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
+	{ .compatible = "mediatek,mt8195-dsp", .data = &sof_of_mt8195_desc},
 #endif
 	{ }
 };
-- 
2.27.0

