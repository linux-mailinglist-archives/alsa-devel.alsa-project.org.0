Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E16DEF2E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 10:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33C261097;
	Wed, 12 Apr 2023 10:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33C261097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681289339;
	bh=oClqaa3BSG/w6Ljthuonfpk9hDBUl5SZZmNoSbN6KMY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GeAdp3aADPhTFfRjtpbeMKYgG5iUD/7ocVxNUO/3AJ8WITLg+xMgCo8JELraafTj7
	 qzfyUL7TeGama8nfM3ph6zyj7MnLSs+71/OGYyZtQ3LRNyroQpko/zRekAexXLJ3T2
	 5TmjzYmBWiJRQHku/9VzRNnN9uNDzt/Qr7VKYrE0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A435EF8025E;
	Wed, 12 Apr 2023 10:48:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE79DF8032B; Wed, 12 Apr 2023 10:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2082e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::82e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BDD3F800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 10:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDD3F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Dt7KYaY2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Als7HubTaE2VDZgpnCVe0RTEDuUp7tGZ9+ZVtTUkUX2l6bauYDx92Ewue+nDJJK+O+CtNF86m8LkDh4qiorh4Fd5Zed5xlbCXT4xSRbwhKAgo53sVeaIqJSIMS3m+FSPUChRni6ikXUwHWXoL+6k1t6hRO/JToW3LLRbV7IGzryQ8qPwnPXfNZMfgh1UX0ZT3EF/hW3t61FdiFlghYl9HYV0WtbKd/jCfAFeBdw/6b3QRgZHNZcOQdl7BZ8ujgx6UZ8b/4WRNKHwZ5nsrW2olTtwdwtGqNObWBO/L+B9helmj45V3nBfScMqk1EhlMw/2oLYqUsBEW0c1CjLZt9THA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aas5VQSb3hNKEgZqCaXXXhoZazOrIXxUVZSiS34/cDs=;
 b=UklvreMH5wFwo+cJRuBHLw5Ljis3LkgSfPxK/dLyfgxkCvKO3dh0pniDuBVCMErKDGI6mpoXcTqalXdSQZDWQFHbTsU0j/WD0QWk5903TvnAhfj4wSp8NV1XHikJSANZN035wvfwTjI87Nb7AC0kwWeWr0QQjnOd1Fqs4ZrGLEA8dDTtyI8DzX9CNFdnDFuCi7XpAzOj6BE2JUVF7BnWQJJ0kavGQ/7b+iZ7uz+aXT0o6ccD4faU23ujINTtUfsn8ijkrtsu+j9g+WM1Ilzd7Yggw4zOO+GOVd4SItEYURcv+sipbAZPs4AUGt8TM/+Lqi6ivz7s6ujlu9w2reAMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aas5VQSb3hNKEgZqCaXXXhoZazOrIXxUVZSiS34/cDs=;
 b=Dt7KYaY2iUx9B+hWFicCejoF5ywWesHjDTktp0aD2HBZ3vzuexmmTEtB1lNkC/yta29ilKjSY0PJl3gtS5iUcd46T2e6XMA6cobSLHPiRVtJtx9h37XIANz/plJuMqIwGUVYFfd6qiG/bbRY9ySdchsgvuw+uOPOx/brLQ8k5C2DBsfQcHJLwS1BkNltNc0Xn9e8DY1G5vdCx27NFzyEjSBOaeM8lhpLotZ11G6dafL1CbLZ6yExl3Ri1SBH1Wc5ypB1KV0mbDqPMS649DzEs4zqOPjslS6uaZADNf/GtPmdMK9dsbgZ+14ZR+6nGp7Je1u/P5b5oprTQ0PxMofJ+g==
Received: from OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bd::10)
 by OS3P286MB3308.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 08:47:50 +0000
Received: from OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cdc6:f5b8:e92e:312e]) by OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cdc6:f5b8:e92e:312e%6]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 08:47:49 +0000
From: Baishan Jiang <bjiang400@outlook.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list for
 acp6x
Date: Wed, 12 Apr 2023 16:40:43 +0800
Message-ID: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [o/jq+9nshJNWFjjUgHOiwDqMswMco3ZJwVNjXDlvX1o=]
X-ClientProxiedBy: SG2PR03CA0124.apcprd03.prod.outlook.com
 (2603:1096:4:91::28) To OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1bd::10)
X-Microsoft-Original-Message-ID: 
 <20230412084041.36159-1-bjiang400@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB1711:EE_|OS3P286MB3308:EE_
X-MS-Office365-Filtering-Correlation-Id: d914b33c-d6ba-495e-1007-08db3b329853
X-MS-Exchange-SLBlob-MailProps: 
	mWtqiNqNgRsQTi6fZvg0W+ElnNz0swY+Ri44JDUVJPvzUDoY2XIAnQxa7yG25fLZeyclynvDIOdxZREQcd/6FyCXL3YmmeXBBRWiYKkNfyVZ8VrZ+UDxAo+dzzN1EPAGsX87YQGGsnszSRU+LQCYw4An0XgfdVoMYkD6Sy8I6rbO+I05run2tDT7k54kI8+p3PMxOVBYfkHZtUXA8lZbPDTnYCuCvUHttMAOPdOH0GPPe54Mm3I5X3s22I85g3Dfi9Oi3z4tQulyyVFoCwdozrsaoQchUtCQ9kWJuJAoHJqygziofxNUD7T5Z87HctJiXdoI0YIJ8wLmzbY0ply2gflyUkmOA++NxuO5mf597Xq3mQKU1oqoTACujNjBQvyc4e8IsDrwhIV/Pe0MMaY39YkAKQ8JpMipOhxG4NehY1mN2yS9gPZX2c4ao57TPzUCWXbe4TBjUqGpkI8xEG7m0e8+yeOoj+aF9SaDSlNmmwTTeu4PO3NP1P88eGJ1O1i+DcEdYCFYK8FW4/Mwwg4g5H3vnfWLa0AxwHStoMvfWaFRiPU6xvufd+mZyTdhBVjrOoARPMKbIFLmRuATcJb6LEb5S7RgQXMiG740p2R6hJ4oO1Cbd+ThLuGXI+5JpUeIRVUlly5uLm71hS4YF3pCY8CmBEp87RvVmlJDCw/oQpD++WqfYgF7huuEt4ZRKjndxRzWqilv67Zpw7YchO7heIllDsfbnhYsbAmqnhTDJxfWhSLuNYSzLk4JJrbYp1PyJdgZXwQBo7mToct5qfss2MjvbVPnFD7cWFn223GIh9M=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WQ+MWA+FFcu8qH9fyGXBzNcBcwS3Cr80QluGirFdABxtBJr0nhcXmaJM0wX+0IiDliYF2mdf79iAlMVAjSC2NbRNaYHRg3rNqNnC1sC2SracPc1xHEvxn/sQ3ZUS9Vqb40czvSS6BnwvOw1SmgzlmCUk70arGPujt7aYM4WlH0JLFXW/mfJZvN6cUybUQtgiQJNjMixXhpu3FGad7bSyIz4Ygv2jXiW4CZg90MLrxGETCvHeeysk+GXXCPCOYt+f3guOmVtinB5dm/8yZhYSIl3QUBwugzYFx1V2+d5gUcN4G83CLWXc38RJpQ/Tj8zlSXZekuFVf35pAQU3h5BGaegbP6UjstGnPHpMoffkdt6qsYhogTrlUdsd/pCjwibVdU7ETvttOE5rxCsCS0IBnyBs1WRXcjoyjnMHAIO1lUvrGz3g7TkHSxYrNiFY+yhWknpqGxu1ap/v0uwXpFwXzEIwmPCsnQnQ0cc0HffYJw9iVKMcvotYv1wotnoasuqonUbtpn9/BxdAD+oe8c7O2FZcYX17uEmJl5ZOlai8EL4WEMDwakexEPzjlm7AkR7PAKKQiBVXFSCTxrZOlq7vJnRNQ4jILHqDOo1oak3tVuk50hq5xV6awmUUa4SVj//9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Qe5gWwYSEW9bXxFZ5njAeI04qK0azy3KAJqExlztlTygW2N9T/NCHXecvvl?=
 =?us-ascii?Q?SH8Rx6okkzsfJWbDU4gRnB6EBtq7OztwZ6alQTvQpKtEAWAzFJAhmEUjQ/81?=
 =?us-ascii?Q?mCvTb9evKNAQkd4uW1fO3RfdbjOnfW+gL8OzrtCpjYT68NzIJQVI4cYa0gLx?=
 =?us-ascii?Q?ea04se7tZSQxQR0OEvkgUyOOxnpaQE3uv5cxOuMO9ey9QA0IE0mz/w3L9sKU?=
 =?us-ascii?Q?shCEq7n0PVt57xMQLkSCBwDLN0lQ6foLzEJzPt67436i9kxcdQg2z3a8ZZkQ?=
 =?us-ascii?Q?2WOFZv0fge+P6bDurORjZvqYSjs7B6U5p7ClUJ/YIN32rQjhmFNJBHncxFxx?=
 =?us-ascii?Q?Ke/UiYNxsIZm/TsASZuyFSMdcqj0R7n3Wwamar8dHST6bbM6OTfVeMpwQcEf?=
 =?us-ascii?Q?iPyaDyCCcCjQxgYzvsRp8Vl4KcEv/vH3sLR48cnpAkZjITBbl6H4ZgOtjewN?=
 =?us-ascii?Q?CMEzLwmNLvp9aiLrYUxozbGhTBmTOJ/0tjiAswj64HtQvLIGMLgbCswuqQXs?=
 =?us-ascii?Q?cMor3rt0u8zjtr9m4k2EjC6DFBkpbJTDDGyrGJyYdzsL1SULykvesJ8uzQzW?=
 =?us-ascii?Q?mLOYiHHN/2mQfRvNwJmJMxyKPMgHb+WddIRt0aiD+P/q6tlN09vDmUjjB27t?=
 =?us-ascii?Q?TUEq/Tse8us3sUH0tItSYg18VBhUaGeYQfKXVMofWi5Ay0SzmD+b73wMi0zZ?=
 =?us-ascii?Q?X/Mk6KcL+BLSGJ3Dr17DNNtY/xf+c70zaC72PklOr7hfJtRoCQLLqFnBlk3R?=
 =?us-ascii?Q?GjdAgG6BpkJFwOtTEkNE2fpJf/9tUU9YTc0atQK1YmOWpPweR19w52bSMlv7?=
 =?us-ascii?Q?m19y5Qcr097IJDGfbj98zTAVRmxo9gg+csyhd5Q+AkpDEr2+FQACD/BSWFk9?=
 =?us-ascii?Q?ZOr3DaHEMl2OAJt2ooSqpG7310rOR2p6Y8+GztmWkzPenMZ7hi45ObdgW9os?=
 =?us-ascii?Q?JyNLwmUOzZnVFCxjhn5N6hHMZHbxr8Ld74ysvTsFTGNMUvpvcK5EZZTBAYDF?=
 =?us-ascii?Q?cdEj9pJe71C0QP2eaPB9EcE7Yqf91HVl+w2DNQDrZG5WgCykL+fzRqyP6Tuv?=
 =?us-ascii?Q?TrU64PabaPv2PdZRlisNNpgpI5aSkPFYvvWHOEzB9DUCSg7uNvcqQ/tAAVWz?=
 =?us-ascii?Q?v1moZjv1oehSyzZ2HefElou7H7L4z17ilFsaQ5TKno7VvnXLvhiuaf0ecf3k?=
 =?us-ascii?Q?1jO8Vqg8zSbPJu5kwFb2iPrVFNn+GoKC3jleOQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d914b33c-d6ba-495e-1007-08db3b329853
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 08:47:49.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3308
Message-ID-Hash: Z3QBRKEK46M4ZER6PB3OTM6W2Q3M3LXA
X-Message-ID-Hash: Z3QBRKEK46M4ZER6PB3OTM6W2Q3M3LXA
X-MailFrom: bjiang400@outlook.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Baishan Jiang <bjiang400@outlook.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23UJZK5V3PSWJNEQETUWRKOYXEPDR7PD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same 
microphone problem as ThinkBook 14 G4+ ARA.

Adding 21HY to acp6x quirks table enables microphone for ThinkBook 
14 G5+ ARP.

Signed-off-by: Baishan Jiang <bjiang400@outlook.com>
---
V1 -> V2: Fixed signed-off-by format
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0acdf0156f07..62d8a8e060d2 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -178,6 +178,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.40.0

