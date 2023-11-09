Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DAE7E6BE2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 15:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51B81CF;
	Thu,  9 Nov 2023 15:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51B81CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699538476;
	bh=2NQJF/WUH3jeeX3vae0PVb6vbPpw7hefXblTQZs2fmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAu10qjrbS1qm8zY5wPJQNsfbYAbN0B4Qc5NnY88Cuf7lG3XpGe3qqEmXXPpn+9FI
	 qi/6IKy8sxBbu4Pu+Bq5fEWix0tqPb6GiZX8IETj+oJTUmi7QC8mUrWOpg4hcrcjsL
	 SzWgpDUYGu/aAx7CyRCRuX4MFVRzjqR0x7OYhyXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1395BF8016D; Thu,  9 Nov 2023 14:59:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AAC8F8016D;
	Thu,  9 Nov 2023 14:59:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DF7EF8016D; Thu,  9 Nov 2023 14:59:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BC78F800ED
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 14:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC78F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=WhTBRFYx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=allpD/VHhn9SqSoceT3poC6Xxa78Sr2a/Sqfjeppe9Mf70w1T7EA569n2Vs9D6Yl01xFzaKM722rpTiBmMhkldWqrq4zpdVkvaaD6oZc3zA5jctS1yRscrkWqmpv5I/Gn47VNrqW2FBQGcdowwsJZO21Nl9gJh3gjB0jrri5GzwZiCMR/53LsN2OEbYkl2AGDhMOjdLazKiQ04CY6MCKQf9OxO/D5QAHTf5Udg++disYuKPM3VO50JdBqVCV3NBobjX+VZwIA6Kfs29F0w7Jz60RxF8bPTIxiJeU0Psz8sGz48sSFhlyYTWuME68A4wXNTOUyA469VQlYYyf7kwXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uQOVusdIHspf6373K70Vo0iMm4nkhN23IoZcxhj69o=;
 b=W90f22AYNVBZzJST+w0p1wXUcf+oPKzvcqOLbHOqEuLJyyMqzF1BC9IDgiIVCqJjH4yptf9zEV+kMpk8gwijf4bQuHxRZXpUkia4yofxGDU2evViynF8fx9yEGek6YlB834Svy5QeSmWxgvR9dTEtqRAwkcc98hGOFMdfGR1Vzrry+JwzUKMvq7P5/8DDWUTMRnjeQT/jR0y+SyRL+uz66pqDU00eFR7CdLt/A8t+kG/P17tJXulCnPnTRBgggBi9Liuc6q+96/oT8OQsxJDWrHAX+uOB2dynxZiGJ8bI4X43zrlSvVHvvHVX9j/811kXQay+10x5wagr7wlnd+GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uQOVusdIHspf6373K70Vo0iMm4nkhN23IoZcxhj69o=;
 b=WhTBRFYx/ZnOdnhUm8UfP8N/ulKbDry12pn5BqT6XiL8/5aq3HR7eg+dF9hYLe9LD7ChwYCLEyQPJhF/a333eGfDOBDIEW47xjsNyfBFVhKp3PhIQ+W4FztIobOA6V7/Ia0k1DC5aWhKknIjOoMDWX5V6L7Znyoz10GiRX23UlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AM0PR04MB6867.eurprd04.prod.outlook.com (2603:10a6:208:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 13:59:19 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a%4]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 13:59:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@gmail.com,
	kai.vehmanen@linux.intel.com,
	linux-imx@nxp.com,
	iuliana.prodan@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: SOF: imx8m: Add DAI driver entry for MICFIL PDM
Date: Thu,  9 Nov 2023 15:58:59 +0200
Message-Id: <20231109135900.88310-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109135900.88310-1-daniel.baluta@oss.nxp.com>
References: <20231109135900.88310-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|AM0PR04MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 55bf6a77-7df5-4eae-1a2f-08dbe12c118a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wj7ceo/kKpjxaZd5HER0F7vjuH3PVRxY/TNuzg1isSHExD8SsVaUbWqNWcZDl9iTRHOn03GI24NbtUdQ1OPJgsLL9F3EE4pwpkID8jxql5sc/yylT3Rl0xGeyjOWQl/2nFz8AHE3SfYp+826ZCoWWcdmOwN1b4DIwADbRQz1XM7IAik0zrzXpS1gjXR/uOmPqDMBQ5idhW1P0QtEn4eR1eIWVvSy4p0ta19N2itqjlortuesZXb5lw6qIMlEFqDlLbz4tnhBEyPdzwqAh02aqgNlptg8gesomahTUjo5BgaIRL7TfVqHW+fU/gYeZAILYYseihiAoFesRx/seCOQBA/ELKx1ALniwn6wiNpmeDrAOyoZrTcMp7xbBZW+Z0jeh0Zen1O/syBMVjVsPAtkbUnDxNwqCOPBHehC8xa1TSxmMnQhkt9gjblJef9/WP5cea8gT74JvX05dvqs6Bvx4G8COm0/zW/EJlPQZNkxA2dreyUhQkru5OapUuqpuqzjqAhise5pdcXy7srsI48E5rs7LbRGBO0wxTffbXHS3NMKXe/RdgFpS4sbAUoUNEg5hwkl+/thBrJk44fmy99vnjV7Wov42mrvjQhGmjNXy7a+2EUrypIDKqH7lbjImi0Q8QoeIbgh5VRfY/wYN/eo+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(316002)(66556008)(66476007)(52116002)(6512007)(6486002)(26005)(66946007)(44832011)(8676002)(4326008)(6666004)(8936002)(6506007)(2616005)(1076003)(5660300002)(7416002)(4744005)(38100700002)(41300700001)(86362001)(2906002)(38350700005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0NWRDlYam9vMVFGYnUwY1NKejVERHlmN1NjejhVUEtkUXpXb3VBRTBIdnpH?=
 =?utf-8?B?ZWduUkE3TzNDTGxNbXI0d24wbE1jb2lQOTR4S0lxLzZ5VFYzUUxCSngwVGZS?=
 =?utf-8?B?RGd3Y3laTGxaRWRYYWpnRklGajRNUTVzVE50WVVDSmpuUnZMZ29yWjNBSlU2?=
 =?utf-8?B?K1dtQWN6QmtBcnZJcEx3UHJPb29VTGU1Ry9pK0IzTFQvK0o5Mk9lY1RWaHor?=
 =?utf-8?B?bnhVektudEZxemg2M3BQczEzcnhENTlJd2VnYmVYMW9JQlF0NWNWdUpxQlpM?=
 =?utf-8?B?UzRsL2k3dWRGMmhrbUhJUWtUY2tVVGpJOFl6NnNZelltQ3F2eFZDRlp1V1Fw?=
 =?utf-8?B?Z3JYajB6b0NtZUpLZUZ0NUhwMDA0S2FueG54L0t4MTZsQ3l2MkxWVEhsdjJu?=
 =?utf-8?B?ajNTbDRLdWVtZEhxTm9HRnhETm5yVUJ2dGlWZTg1c2s0d2RTWDAwOGlCTnJM?=
 =?utf-8?B?MUpmQTJSVnRJRTltNTBrSUVQMUUvbElpL214NzgyVlo5UnZTRUxtYmlFZGZz?=
 =?utf-8?B?c3FTUTh5aWNnL0R6Sk8xWFhnYno5ZElOcjJ2bmFjR1hJUE9KMlpEcTQzNDdk?=
 =?utf-8?B?dVhWRnBiQ2pkZ05jSlVlUXQxWU9TM3BydmZnZUozV1F6bDVRNFVteURQbWIw?=
 =?utf-8?B?aXBTQ1hEOTVBWEJlRkFnTXllVkFZLzNYZ2JSdjNRUUFMa2Vzd2NGSFRhTEsz?=
 =?utf-8?B?SysvdWdaMTB5em5OS01sMkRBbXpqcVdZaG5hQ1lVNFcxd29CdlJvaFJJL055?=
 =?utf-8?B?NnZpSDRsaHdzOXBaOS9yVDBhSmwxelo5RjlwMXhzRmRvYTYwRmtySXhLNEgx?=
 =?utf-8?B?U1VLSUw2QUFIUFc1eDdTOTQ0ejIweWR1ck1mU1o1WGlMbTdZSmVTekpVVHB2?=
 =?utf-8?B?QmVYZTRNZDIrR3FhMEdzT21WZVdmT0tXSVQ1bjNPdklRd0NRU2NZSEFLalVa?=
 =?utf-8?B?WkV6S2VnT3huNzd3YUFEMjBuS2lESVg5OUE0cXhpbEhncElMRVBLcDFvSFZQ?=
 =?utf-8?B?dytmMXBvdXNkT1p1ZW1yNnlCRlA4Qy9KVnRueGMxR0NEQXB0RHRnUERob09D?=
 =?utf-8?B?MUFGdkNtUldJU0dwSW41dUpVc3ZQUEpyZi9iWlNkbXI1OTJQRm5CSjU0VHFh?=
 =?utf-8?B?YzRycDFqZ1pnSWgzeXlrM2FWaW85V2poZ1BYQlZ1cWZSbGhrbnlDQm8rZHBP?=
 =?utf-8?B?MmxvK0tDMFVXVmY5L3d3RGI5a1c5ckMrRmtQYmFla1psZm55eTYwL0wrWi82?=
 =?utf-8?B?emFkNEw3OTZ3bndralFVZzNCRFB5Y0lLdEVwS0pna3lmT3dqWi9nWk1WTWEr?=
 =?utf-8?B?K0RYdHQ3NnJYZjJiUUlDcldMdVdtRkthRnllbzE2d0x6VWpxMUFXWGw4VVd3?=
 =?utf-8?B?VHZzSFlheURIbVhJK3NxL3p2b1dGcDY3Y3pOS01oMUF1RXFRKzBVZjkwc3FB?=
 =?utf-8?B?ZUFoTkFvT2lOYS9VdlBrL3Ura3Y0UnI5bXN2R1VkNFZ3eGI3aWFEWVVIcGdS?=
 =?utf-8?B?d3VBaTFBVXp5eFBsS1l3aWtZOGpLcmJlNzltL0VhQnFiMCtpTHB5a0plQ0Z2?=
 =?utf-8?B?dXJCTWxxMDJtK0FGQnltVkQ3RXhRL3JtdVB3bU1YNE1uWEh6MFBOcURhTmJp?=
 =?utf-8?B?ZmdCL2tma2U5Q04wTjZqeFBBN0VKQkc1aUF1T3MrL1dyL3NPcWwyYVVqQzFq?=
 =?utf-8?B?d1VGV0hIblZxMm0wem9WRGlQNnhqU3ZudXZsQXBmR3k0TlVsMTBsenpKTkFR?=
 =?utf-8?B?bVBaNEF2Ni95R3Nibm1BOEpqQWJ3NzFyS0pCajhsS1B0eDQxRzlIS0pPRGdy?=
 =?utf-8?B?UXB5WVVCNVlic214MDE0Z1B5UmRLRDM5dGMxTHlHdWVqeC9IeXo5UTVpcGhD?=
 =?utf-8?B?MnErRkJSNk5pTnpJKytySVVrRHYxcFVLS1c1TTEraDgzYWNWZzROcmFLVXQv?=
 =?utf-8?B?eFFCTGo0WXdhSmZ5czdpUjdYSkprRjN2cmZ6eURzVVo0SmZFa3hxNWIyVk1G?=
 =?utf-8?B?VEJlckVYRXlVZkwzcm51VWJlYzVGbzZsUWs0TlRiQWhMcXlqRmJMRkhkem5K?=
 =?utf-8?B?MTJGSEtOczFhbW43TWxHdEZROXFKeVRvYnBxQXdCallJR1BKd1N4NVlKRFg1?=
 =?utf-8?Q?lYYOojtuZGThMqZPbU7BJFeZm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55bf6a77-7df5-4eae-1a2f-08dbe12c118a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 13:59:19.4378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7xNAcEiMKbvBzbuFfh7ryIK2+7X6lHNUO3iR/GbTkYl+NrLRyjUxM0cI6S66CFn+ztjFTyO2TVX2IVvmGeHyNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6867
Message-ID-Hash: ZKMK3SZCZGGYZT42UBBK3EGRTZLNEF3P
X-Message-ID-Hash: ZKMK3SZCZGGYZT42UBBK3EGRTZLNEF3P
X-MailFrom: daniel.baluta@oss.nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKMK3SZCZGGYZT42UBBK3EGRTZLNEF3P/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This will allow creating of PDM DAI links.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index cc748838e0e2..190730d5ca07 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -357,6 +357,13 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 		.channels_max = 32,
 	},
 },
+{
+	.name = "micfil",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+},
 };
 
 static int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
-- 
2.25.1

