Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259999DAFD
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4BEAE8;
	Tue, 15 Oct 2024 02:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4BEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953874;
	bh=D30Eim8Ln02RXwksD6qpDFu9qxLf5s07lw3x4XwjsC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=utM/g5a9EsRwlf3eYXY2VReUOFn6978mdKkO3loY0hIU7xkiOGDbH5vc8jdZnX7oT
	 A45FTPTAQT4j+wN5IlnT2r3+ra7wMDBQ91jlJDrmriGz1YfCzdZUBjcPv4rsBMPbmq
	 eYAt9WcU75rgEamgM9azSihMQqDpdjWNlAzAQKfQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5AD9F80604; Tue, 15 Oct 2024 02:56:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BF0F80602;
	Tue, 15 Oct 2024 02:56:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03F3F805EA; Tue, 15 Oct 2024 02:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35CB9F8032D
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35CB9F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GAVCEGdj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBlcNOCJMKfORc6kj6eAxTwHecZjfI9v/TnVjz1UG/mC6mgmlwQAJVSsGnwK7X0HKYUm8ZfG6LmUdDcy3dQgSwffBwsU/OYBdBuMWi29CJ77EGuUbn2rZi2RlCIq3c1XRxT/dGXySGg/SBrLL7mH7+V2zH7wIJMKZ2VrrBRTQ39Tt2uo+SgE6WrA4lN46cla/YXdWx7PjaQj8/qYUzetqvH/sMJAVZkzuex7DoDD33g57Tgc0mEqmgLYm/5dtSxmGHZqgo4iJNPN+6ymQVW1mTb+G2kNwdOWlBkImOu1l1KRg7CIMZcsmEpHbpVVock5tVih94ApVvZeTlDIvHjTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3PQdVvaZ1VYKzr8aoP2xlzfTMD50pWZg5Olj/6FycE=;
 b=tgJkFElt3melcWcmHGY7KmFSPtYTY2/efLtHxwnEGdJDq+LPhFblz/9pGTk+XvSz9hTLRj+zGWnPVUSjW0axMgPecHDj/jRR5tWb9zL+l+NWLapy+2cR+mWZkTp/PMn2ywVcVnvnbmHzLz23K87eyRA3uSrHg6UVBGFyG5h6K5y7fGdAd4fZz6tr0DIa+PyKUVXLLe/IOqcW28pnSP5fIvDzSuqA6ZU3B594fKhf6chuX2MVoG1QnQL9zisx6bg8cVes0B6HF/6PB1U3d9JcrZIyg95G63GWKcAQ6RkHEYzyE0kxRxaHSo/u+JnqTH9s/KAgVGXaW3xrW+AmH9b7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3PQdVvaZ1VYKzr8aoP2xlzfTMD50pWZg5Olj/6FycE=;
 b=GAVCEGdjCZVQcTV2tL5pelsVi8knUAtMlARkGTFlbKZfs23uH42kGGJlo9m47iAykTkUhCjovoPYD+bA/t/tBfKX8e7qCEItrRb0SSExi7pgVYmQgek6vc+k9YwVoToa3jWinavfE91XAbXtEpM2DVnNru/2dq68SD70MD+xp1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:05 +0000
Message-ID: <87ldyqqj4q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 02/13] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:05 +0000
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bef205-eeb6-41dd-24cb-08dcecb4261a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x7n6gpSnIIehCPTsaWCXcGts2f4zG3WRNT6mf9DvDfu9wZaXl+EV+PU07EXm?=
 =?us-ascii?Q?lv7CnykDYAAPUXr8IMpJ46e8LKx9twIw6J3hlog9kdwylQmnzLkskmsDhSYC?=
 =?us-ascii?Q?c0AME19daZiqcRw7N3AOFx1kdSvfsrnSnzknEDLvbU3ybGd3lkaXZ5iv/Q7f?=
 =?us-ascii?Q?xDWM38JUj+T1YKvUl7o8MYgUQKMgO52b7dI3yuc/NTnYPfN/r8ZDMCFenVDW?=
 =?us-ascii?Q?EdzW/6Kao/uaLWFES1hZHU18Wv9O4bC0lJpuUkG6CoQYk/S5hR0dBe88l7NS?=
 =?us-ascii?Q?rK4Bei7Aki8BuoYRoxRxp2PUuo4MxanPw5y7gVTNFB+z1KYNIe6kFwW7EDfe?=
 =?us-ascii?Q?FIIhwtoCNdYWdcHEK1koPAuKd8zbzSefwYFnobvpu3Kb+nuEOKrSy+nWBn7m?=
 =?us-ascii?Q?qYPieqnPNb0qpGZ1QZy6VOO+32aPUz4DvBqLMjtVezaqmA3QjOXl/2EABNYa?=
 =?us-ascii?Q?NfYMFZbRK1iQ/WtMFqzkmg/SWVmS+iNDU9/ua+I1Jmmq19JPs3k75w+aKjSy?=
 =?us-ascii?Q?4MuOOJbdbInHkFzTSSGIcFsoPAGtx7lZK8QQp6WfOphpY/lKLV5ywBNnbCpL?=
 =?us-ascii?Q?yclNLue2px9IjOtRtC935DQHIPb/yVBqkid/fd2f4hplgFHkOmX7RFn2Fcx5?=
 =?us-ascii?Q?UcsZ1WNQ1K44cMbBIaJBPtrPSi8msHqek6SV2WM4cOKLVjPJ51wdI1ETWfl6?=
 =?us-ascii?Q?jh3zuoH5laNBoUigk1NXuwUUu69MHZ0sPe4lEJZIn4oPEUaVAVFllGV7a4NC?=
 =?us-ascii?Q?DcmhM/2r+bpJoZ+/a1xk30EotLjRlsXIZumzKiwgJ9Ov/ABTN5E9N3L3WUrm?=
 =?us-ascii?Q?t4/fzPVihSVb7Lszph+Idu2IGOtaL0KyfCrVXG0h3sqCZ+0GREdunN7BLCta?=
 =?us-ascii?Q?iJ6S8567Ta1Qo8iKaQU9vTpApVI8DwTwtx9UcOCmQKdX64khoF0/Lx40uPLm?=
 =?us-ascii?Q?JTa7rRFgB6zUye48dQpWaLlNJb8xROUzB+p0U+XV//roAP3/YqgknSXUAE3P?=
 =?us-ascii?Q?3ykOrvA2jrYlH1p6dGiNFgwQx+/cKqAbAWnCQk3j/FvTBxJN4+pzs6ExVsi4?=
 =?us-ascii?Q?608l0R7AxwDp/g8jqvDfjbXioYQ/dxiikt6jIpz1NbuVql1BAlCzatwYfTFk?=
 =?us-ascii?Q?0/fQNf6fux8qt7Zf0cK3H1C5bON2ntPS7IVBGJeB32fiV+tbUpSMQfbcdWgG?=
 =?us-ascii?Q?VZyOIF0wBi8TTK8k1eUs+m7Lxbvo97cMebUfSeW0R/x1K3ngdNQiUxrTlAZ0?=
 =?us-ascii?Q?TYxHjwqBqmCQWm9V6vVSyX1+KFrHcLqalJjdOAcAWGSBMeSPCV6dbnY2tHXP?=
 =?us-ascii?Q?y4zMFMtygAli1vtPskRNuazTrnFYP/CCT/6TubrMioxE6w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KaLvpGn4unV7p948OoSJeNbtHSOjFFlrsToL4k//Pw/ybS6LKtHKi5Xa5GqO?=
 =?us-ascii?Q?Bo+Ta0XrFKJAi+QH2Xy+c8v/gYQyPVy6Y80pr1B2z9oET9V5IoYH/1J/4bBm?=
 =?us-ascii?Q?VYeo9znTR6gQQt7CbwJ4MuXvDbasluWTYfivljDv+eM15j6cq4ms3yFfhoj3?=
 =?us-ascii?Q?NzGsNrScFKYE4guCCmm62FIHtNYSen3cxZCWiouzvNoFrglKOevvmvYEqUCa?=
 =?us-ascii?Q?k8ywbM3PVo1TCftyfFs8b2ptaeFVcUnDUjZCaxNeXglAImmz++talkkrHLG3?=
 =?us-ascii?Q?tWIQnyaTbM9PaRHrGTxb9vmziyx4VFNmZYEMPHTcbqfUVXPHdTLlWhigS5vE?=
 =?us-ascii?Q?dx/v53OO/msnhF+zKpg/KL/pL9oRB0YaYSdMfDN9oGQxgzBz6yIveLas1Bp1?=
 =?us-ascii?Q?0P9vkNK6lPzOESygrALtCOyjMKNGcjnxm5Cl6jTQ4pF7GHVZxF0y0Wb0M0Hf?=
 =?us-ascii?Q?vLnw7onyHm+LFOJ2jHZY+Ii189a1SAUuMnuHG8hfv114DclQZb0+m1JDTaL7?=
 =?us-ascii?Q?EdPzwzv+p1tBdTVsJNuExiWsTJ5GIaekcvo8fW8xmnAqz+lQk98QigQtOzaI?=
 =?us-ascii?Q?RsB28EUF/kreqxIioJRc+XUWy1Zjg//uiG9L1G1W8ipoRH7Cu7a8IawRCKVX?=
 =?us-ascii?Q?Zqh5fs1W0xNjXserOcuie9EPw+KFuLfKRnEoGWJr2YaAZG2j8r9OH4Bx1fcb?=
 =?us-ascii?Q?hrEekg9sfIB8KmhOn6TaBEb8NMRbVyN9hObS3tfCsVURQLgI74pDosiik6hV?=
 =?us-ascii?Q?2b+4ttj/hV1TXEPbJf0cXW9CPLXLjQcAaPd+5IZHInCIbbA0hqMlFu5OrgOJ?=
 =?us-ascii?Q?Vd/3zmeMPM9M3SLytZjpFpbLBu66CGxEtNrMX0q0qCEPWzHCvrJuaxg7snoP?=
 =?us-ascii?Q?0nRldkzMyCdPrNjHWwForAsYl3CM9VgBkGmeuXRy6fH78v9SBioahtLezBsE?=
 =?us-ascii?Q?TaPPq4YWy9KsT8y3FQsSImhqymF8ybueHciAeAVtDO5zNOZ/YN1MmxkRa93U?=
 =?us-ascii?Q?IQ3gWpbC27yCnq7xWeX1Zy7JKb79kEUrcnX2LYOJTh8YXHQsV2UhgK+g1DFp?=
 =?us-ascii?Q?Um+BhgJb9xOqurSGYDGnwpYkl1GBmB4dNsluVX1bAnykOO+y76atm5HAn/NK?=
 =?us-ascii?Q?6yD3c0jngf5EFo435tJV84TvxGFbyYzmJTfaoGCa/U4ktaT0SWzDxtVHZUAX?=
 =?us-ascii?Q?n1rOCFCePvqsI6LFY5hw6PTlxOHyCiH1GVcKB0xQi/ODfEHYFqChz/23rWTo?=
 =?us-ascii?Q?RIgjlwYdNN3NfFW7AC+oM6o6OEI+N5ChBVkq7R1viEn0gn42ygluB6Icw6ol?=
 =?us-ascii?Q?tIXNddR31RLopzqcWYviTVWuDEsmRHDRupXEl6+RgMA/yMhCbKfew2xHolX1?=
 =?us-ascii?Q?Iqfbux56FLhogWyigT3LGPSnkhyxYVL3+5XiPuCdy903DOuUPnY/IzIIWc9t?=
 =?us-ascii?Q?wmmmai54ZTa7m5hSrO/LtEkj/EAYK7h/QOKyXQVW3o2oL8VHlt8xFcCpBg1i?=
 =?us-ascii?Q?eMDhxzYPurgO6hjkRKym07c2fj0teHkZRzl+yn3XqtH3YNU9mOsgJfXb7hY0?=
 =?us-ascii?Q?3gAd8ATooGwcUY7U1drsyODuO5H6Pe3/tqTE0TXvbyWz+2Ahpc0qtzpt9VOW?=
 =?us-ascii?Q?9i5bG/3czuAhbn/Yn5Jfvgg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89bef205-eeb6-41dd-24cb-08dcecb4261a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:05.8099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rfLh07Yzw09lqaYiF9ze688KEw/apkoDN9KCW2rJw6ho6LbzceYgq63C9Zhzb+ZjYoEGlST/CMP+ZnCDYcPENfsvk3XG0ulWiCoIDwW3ohp/JVcESEDU6zp2Wj2JwyUD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130
Message-ID-Hash: IADVIIO5MRKZLZ3BQL77VQVCDOUJ3EF2
X-Message-ID-Hash: IADVIIO5MRKZLZ3BQL77VQVCDOUJ3EF2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IADVIIO5MRKZLZ3BQL77VQVCDOUJ3EF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 24 ++++++++++--------------
 sound/soc/fsl/imx-audmix.c    | 18 ++++++++----------
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index a0c2ce84c32b1..02e1594e8223c 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -317,8 +317,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 	},
 	{
@@ -326,8 +324,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
@@ -504,13 +500,13 @@ static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
 	}
 
 	if (priv->dai_link[0].playback_only) {
-		priv->dai_link[1].dpcm_capture = false;
-		priv->dai_link[2].dpcm_capture = false;
+		priv->dai_link[1].playback_only = true;
+		priv->dai_link[2].playback_only = true;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (priv->dai_link[0].capture_only) {
-		priv->dai_link[1].dpcm_playback = false;
-		priv->dai_link[2].dpcm_playback = false;
+		priv->dai_link[1].capture_only = true;
+		priv->dai_link[2].capture_only = true;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	}
@@ -764,8 +760,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -791,15 +787,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name[0] = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0dea..dcf770b55c4bd 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -264,11 +264,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->dai_name = name[1][i];
 
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[i].dpcm_capture = 1;
-			priv->dai[i].dpcm_playback = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[i].capture_only  = 1;
+		else
+			priv->dai[i].playback_only = 1;
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -285,11 +284,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[num_dai + i].dpcm_capture  = 1;
-			priv->dai[num_dai + i].dpcm_playback  = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[num_dai + i].capture_only  = 1;
+		else
+			priv->dai[num_dai + i].playback_only = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 306168b164d39..0f11f20dc51a4 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -860,8 +860,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0

