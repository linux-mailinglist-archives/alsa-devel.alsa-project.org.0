Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABF8748F9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 08:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31557F4;
	Thu,  7 Mar 2024 08:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31557F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709797551;
	bh=vFTFF65bmr2zIQpfcXngGhzcFLtYikp89a/UT136nQo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YPMCZi3F9fv9e8QG3qpLTUxhPe6ycku3RteQaizBLOkTcmJ6zP83t2lF26WPfi1yN
	 DgZinJoFWwg0+fK37IsKzgbNAP4fiRM7IApaTndG+oW9OKw4kS1WeAk885nGXRtkke
	 jiSa21TjXhL4/I3FD+4dQn/oK5mrl6j/PdQsIOU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBE66F8057B; Thu,  7 Mar 2024 08:45:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D8BF805A1;
	Thu,  7 Mar 2024 08:45:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4218AF8024E; Thu,  7 Mar 2024 08:45:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6B38F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 08:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B38F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=mBsC6urQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkPEQzH6BHLaAv9UyMR0VJtfknsXQNqSak69xY6LZECvpafySjwf7W2fETFT+vc+z5YIxGEbcvepeLIM5UDGIb2gK6i4+mrlLMRyrl8YAjTBH15H4j+XWk5JVL5N66YM6TRKbZSJXMObz5v+/5Bjag6+aANnLQkROcBDzNCGaXwFsArNw/yvKAR/KGeIhrbWNRpEnLSIGqpDffdcF0Vo5utPQvseoZf4FJse0TgBcEcFMeA7VKm7U6zGQqOTRZVJTit7wXhvoQQYMK55l7MJScjntSZMvcKMlugGcPZJrH0QdSDfhwHuA0pjvXkxwl4Ws4Y8bals//UqjbpKOUpG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTkHoJbHt2/i5sZ4U4l2Yp+EKGPWKrxmeatbxA3+6cw=;
 b=laUkV+UN/Cx05aWU1aGVUTYWJBzPzqem88zqhF5PHHQsFKRDFNzim3gCMtLHHaby8cw30fiF4iHQNdWC/rV6akSyKDPW3D+/b54C6i+JuXj/KOrtgXRw76srm5i5jBe4gdSNVTFCK9Y3vKgxUgUfcTuspPhqULdRXka8f9nNTSKyQQjW1xM80fjnXI+ziTfTWg2RWjjWfQzr/5DhFXYAuos6cbH9jv4PgDvP5zupYo+gQ3jBbg21cLpOONoZMFiYRZ0zwPSk7wDGMtwog+RXZJBhTiX3KnfNX7/M1N7ZRbpkZwSIu430BIDPCFnbzBxMNiumD8GoD4FkeihZGxLKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTkHoJbHt2/i5sZ4U4l2Yp+EKGPWKrxmeatbxA3+6cw=;
 b=mBsC6urQk6tOO9II1j9qelL8CNB89mMRdFXrPphsc0TcJPAR5yj4+N8mOo8O4gBlmOYbgXKJ1qFCcz5GSzsMfftm3+hnojItOn2seohqOpismViEm+mpQJKIH74astSBJXiW2QauOgegQVErm2ZP/39FX0mMascYmE8iia5n16s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PA4PR04MB9464.eurprd04.prod.outlook.com (2603:10a6:102:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 07:45:07 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 07:45:07 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 0/4] ASoC: fsl: Support register and unregister rpmsg sound
 card through remoteproc
Date: Thu,  7 Mar 2024 16:44:33 +0900
Message-ID: <20240307074437.1472593-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|PA4PR04MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf825c0-a702-4601-a67c-08dc3e7a8221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9uuW3L8LJtYyOLr7Zdoz0P5Uut3ghQPA1JJrLcQgQ+SInWkTz/t+9Of92BUZVU2lEV8qVjB3jkzAddqDReAoIBem81D4GgjJuFcDg93UI1mCCnUuyrHQLYXbofCo65pZ1UhPGMZpO0hK8rqBAX6a08051LTnNLCMOFxoHZ+CvXN767/SbmI2jyHIa2SNb6VS0A/rZ7ZmM9n80q3xOR9oNifpkANiGOj9a9KWB4uTMgpS6FvNq91/zzFjDDnJhLsyLNUjpauDzXH5/BB9DxnEyXFkD9noQdHzGaHOKOqZOSmGsAi8t1q5Obau7pvkhkwcmdWfx16O37n7Z5Iskp5hbxCY83j/ZBI2rR/2tb5wNcjLOB5+/8/4b2UgVTWn6FpH3AxKjUHKwerj9UfhbKekcVvWOINnNo1puiu+stx76alH7CZscYmRzCtsoa26RqMx9KqHvLrAPHRjYCVIz/3uL7oBF5ACBX5DdfRNsJQvyWJ8dOd8P8awb/tZL+s/Zq28zxEBhWmV89Dx6pHxXUVDwqpDMWp96yCxHO86se/r+4qK4VVdUROHEl/KTTxt64qH9gp2l6GCakD6g6QYop1H0Ec37WA/MGv9rcayxXHJwB8g1D/ZG/WM0co89EgIlIvMkqb6Cf7TkMfrcEBAewAASJ9Bg7SnUZTJCgMoFNDaXbbIdcVYeTRCbPaX2vElRQsse4tREE8D+iRPl1OvgZXv8ZfsRyOE70xFVheisS8IJfw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aP3TVDaWlJHSy2gEQPOhXcokmQZV56deLxPLNkEabk9ju3+r7BjsO2ENN8ZK?=
 =?us-ascii?Q?K+rIGjCvimF8K28lTjHdArAwzzgVPQFJk4CoKF3181778HDVLvpihj/MzKty?=
 =?us-ascii?Q?naYWKpCuHc2QbftrbktNqt2T8nrhe0xxQKJFq5KP/wYgYg1xG7foIr20v4A3?=
 =?us-ascii?Q?zguqkREsdRBH08sCq+/2pODFNFbMBhoicQRkosmPSvWHpJZvm+V5bqPyjwpy?=
 =?us-ascii?Q?++pdMDxD3feM8+RFMtREfEeGbkmP0b0QPztmcZJbd3DZHdD015z36XuIgAjW?=
 =?us-ascii?Q?1IQ0gUkf0AhEwZrgjjSNovIObDT+NoTy5laNDtcmpkjU6qx7lZEaQK62pVnX?=
 =?us-ascii?Q?sNKKDNqProTL4okAWeljZtiRHgVTO87ZpyoHy7m/monyYUB8/Bj9q4skgYQz?=
 =?us-ascii?Q?bv8m06TGG8S/Usau3HRK0t2xMY/OmVhLQrJw83iZdTvEzukeXcBm6Ty7tpi9?=
 =?us-ascii?Q?wloFeX1Jjiy9jD6MJGgSUh0WBjhCKu739D1PocDLpumYMy8Ob6F2qPJe8J1z?=
 =?us-ascii?Q?5RMjKu0mkqBEAuUby2hvZ000R2aSNTpJdxnt7WGr5OycvMcS841Eed5lyK2l?=
 =?us-ascii?Q?aDIZHEm2yYZsH1AmxtcI/dqRS4GsxSiOzRf36tWEcU2/5xJ/siSEgV/KwxSj?=
 =?us-ascii?Q?fhxuhYO6qXAU/BxGDaZ0Py02Fv1vZWw2ADU2XZvLPFR7WB1NYNtGCRYScJSR?=
 =?us-ascii?Q?bbhPGKgsl71O0k47AoGSerIGQEgsnluD4CpxkVZizaXJ+Aahsdowq6nRdOpq?=
 =?us-ascii?Q?VprIyr9rhKTyl9FMdwTMB7+pv8XOMQ1y2dxXe4kw8CerJG/C0HfpWNOqtQiK?=
 =?us-ascii?Q?CbKsX7nX9DBALYswhhHGrFbr9IeKgCR42w4d/lhJh0w1+GeYWyWZX76CCCrv?=
 =?us-ascii?Q?r+hbQBuWHAv70AgEAHCBIYLpMa0uN2/qhF5oZlf6cFsPlB6NeG4lLLb8pAMG?=
 =?us-ascii?Q?NX8hmZUSVT1BvcRSM1HjGmaufHD0yuGERa/++7Bu4Q8ggWrTnXj6EIFNrEvF?=
 =?us-ascii?Q?w2xccrXxDeUaanmTE+3FcL/quUWDI9kM2Z5Ve0fZGxBMJEsCE4/gWqnimuih?=
 =?us-ascii?Q?tlsg0QmdufCLFIvrbfP0FNNHTxnRKaL6lNYLzNlV7RWKB81w0tkDYMFX6hRw?=
 =?us-ascii?Q?LJrfK5XPcZvQr3DcS5CfzITJszkOtPNn/nNbp1B03Q5asNt7NT9b6v1bVqi+?=
 =?us-ascii?Q?ndND4JcR+dhkPXW6KGZ2eYDDV5jJpYydovjMYHDnVf4LJIAHhydCgO7pna5m?=
 =?us-ascii?Q?pK9btGHCiaE841vEFi50E+HjV5/jRsEbMPmOc+S5ni20RHri0R6S4H4lj4A7?=
 =?us-ascii?Q?ccEYFAWO+jJuEUpSkWivN4FB+kXiTtU0P92Am6Zsayl6Z5h7RjyTPyKAFusn?=
 =?us-ascii?Q?x7Yi/sF3ZbTEmy1QPjQUO1S1Dad4HJTn92C+qMVhHmBoJ4VyGFoSQa4bRBPk?=
 =?us-ascii?Q?zC0rWdc7kh9BEw772BJlwE0iKmPESzpSDxBzOyh+q6DCsXksTff5Uy+Opdvb?=
 =?us-ascii?Q?jLaWuSDQFHltka1T3a52zcHmJCykFEdmlRkvH28moa8zrKszaBNyvgltdusr?=
 =?us-ascii?Q?NdVdjiGXMCyAd04EJBLpNYzDBJ3V22U3oW/q9Y7e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdf825c0-a702-4601-a67c-08dc3e7a8221
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:45:07.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XELUZzG3qVJll6uHe8eYmKHDcM/QXj5QhfwsUaEU4axJoPa6HWnHyJSq3yEsVnIrCgsZCl1XQMejOxJvB4+ALQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9464
Message-ID-Hash: HDV6D25SUXBSK3RP4M4NRJA2ORLCD4AL
X-Message-ID-Hash: HDV6D25SUXBSK3RP4M4NRJA2ORLCD4AL
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDV6D25SUXBSK3RP4M4NRJA2ORLCD4AL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

	echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/firmware
(A)	echo start > /sys/class/remoteproc/remoteproc0/state
(B)	echo stop > /sys/class/remoteproc/remoteproc0/state

The rpmsg sound card is registered in (A) and unregistered in (B).
After "start", imx-audio-rpmsg registers devices for ASoC platform driver
and machine driver. Then sound card is registered. After "stop",
imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
driver. Then sound card is unregistered.

changes in v2
- Fix build errors reported by kernel test robot

Chancel Liu (4):
  ASoC: fsl: imx_pcm_rpmsg: Register component with rpmsg channel name
  ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
  ASoC: fsl: Let imx-audio-rpmsg register platform device for card
  ASoC: fsl: imx-rpmsg: Update to correct DT node

 sound/soc/fsl/fsl_rpmsg.c       | 11 -----------
 sound/soc/fsl/imx-audio-rpmsg.c | 21 ++++++++++++++++++---
 sound/soc/fsl/imx-pcm-rpmsg.c   | 11 ++++++++---
 sound/soc/fsl/imx-rpmsg.c       | 21 ++++++++++++++++++---
 4 files changed, 44 insertions(+), 20 deletions(-)

--
2.43.0

