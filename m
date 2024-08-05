Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D79472CF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0A67306B;
	Mon,  5 Aug 2024 03:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0A67306B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819705;
	bh=1iJwTlDuoNnHR56qO2pl4s2uUPPLG7A151lRy/95UDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YpqV3sU2o+x3cV3ncepzFE/rNqLdooCrckVAeuLatOnjveGxOmgCLvnPn1j+/2L1j
	 8M2e3lf5e0wkEb8ZUkKBehjwOxSyE2UPVrZkQddPxmeutGWWQjJeHQAb409V1Wl8R5
	 hEz2YgYW38nuXAgkr1/vcGTyxpTwdT50aGG92Adg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8768AF89D61; Mon,  5 Aug 2024 02:42:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E47ABF89D64;
	Mon,  5 Aug 2024 02:42:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FFE5F89D36; Mon,  5 Aug 2024 02:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D9CDF8070E
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9CDF8070E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=A6xGEXsg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJy8oNjawMtxBJhe2GtA2luA32rLdCFPNSpSytabMVhCPEofbAHOxk+oMY99BbzSFmmi7ZQWBATjpsSh5BMzlciSH0i7h6xIbZKCC+A6klXPF7QQzapFlc/jOhOCUi3UdhLVwj9q4g/cD24k44pa73t52ovZwRTOw1wEzDl9U2B4e7cIg1Pc8L4gPWsaDrqcnFKJy6KFQyL46NQbuFi1E9jyRsJeEawuJccg80Y2Mf07e4DMZ35Dtl3OnWnWqFyg4qDIgF+fQH+Uk6KqC/W3KGGdVkps6P6vAtyRVZLXXdaBkW3VbcnkXWZkEk+cAy7BsQxUWXTedyvsEoW1NH+YdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySU1RJo/vXUmmy68/9s9Q1TsOLxdKsxJuG7unNhgLps=;
 b=xyODEZ4llP+y4lDHQ0IyMO9Q5ec2dcMqAgPhD1lDhhf3YYv/b+A+TAFfBHhj65/nz02STxRFxv9WEGM5K8Jmd496R6aE5PjqySMNuMHNpm+6RAYpmFtCzRxFb7msbrhAzftxFemNVf3UJxqExP4/xbFDzvihNHxX/Rjs23pifkFcm1BnKMm4ZDU3TNCFZIDSovv0u3jR6qOaE2WMYBBXs9CeZAh8QXsPCjQSLtYKB0pI9EYJDATTOywDJqP2IEXONdc+ZAia70KjthyTfv5KnM5pnG8CnoH88DixU29n1FvjsRntqF9U34QeGI4GX7AISv5ossEzpcbfncoS77qcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySU1RJo/vXUmmy68/9s9Q1TsOLxdKsxJuG7unNhgLps=;
 b=A6xGEXsgzLrgdrFUXWNNSE9RffROaJ+tJTrDLWA6/J2tjanpcLdUf4MxQVMb2nPdBI7pwSbPOUB9rv2/xUtIZrjdRDMNTcszf/1L0DHD1blw9YEFeZIM9Ko19ku7ZkBQwCd/BhX0YnMDqJdhZe6p2/skk/sZSaqb2OJNU4m8Evs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:28 +0000
Message-ID: <87r0b3x0jv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 084/113] ASoC: codecs: wl1273: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:28 +0000
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: cee9efcb-8ad3-4fac-8be0-08dcb4e77bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B1mBWL1eXhrodxWmY0JivuVw3LrWlWHtxSToIkCXMcVcaDHcKdj4ZA9rQ7QP?=
 =?us-ascii?Q?b3DAztXS3pDsloAHLqM+bd5XfrjT6zxTnq8PNJDozawB+N7OgXD26V03rRHO?=
 =?us-ascii?Q?IS9MT361KX/IW14ZQZx2704OfvO9YpuT9VwrzpjbTjDahHXOFODZgVcUSolb?=
 =?us-ascii?Q?BdwZOPSvc9nDHQi7z4jOV4SmBOFFixzj4Wx4qf5LbUx2IQ787gLLqqUPMGuo?=
 =?us-ascii?Q?dAyTrVKmTWO3qdwYzw6NEDnji1u/yV8YDNxheMch9L6W7qj1s6Vwj/tTD94I?=
 =?us-ascii?Q?kHiQEF6c+vE5hH8YMU7HAB6EPUQrix1k2/Ns+cy3gRGDbNad+jNX3UAZS93c?=
 =?us-ascii?Q?349O8A1x1HnFZSC7LuDLPS6Bc3qJhZny85Zt3T4G0VMut6mvuHFl/tBcO1bd?=
 =?us-ascii?Q?zhCfdY6DOgP5vSPgaxibKeNoyp0CIi357yU/T9JFWubyqOtZlDFH3jxZ301r?=
 =?us-ascii?Q?I8ljwv83/pqyCLaIHld4LirEzclGCafAy724BegcKXqprfaoZt/zMxuxolYX?=
 =?us-ascii?Q?Zl01H9ldMvDiTCGgmIgNUwEz5k3qnBn7/UuPnOIEyKVwlMwT9A8o6S0iHp5B?=
 =?us-ascii?Q?eiy4svFdZYQpF6lLc4z8j4n8tvzssoL3il0Qc/V3rek0MVwFiuxxkoo16yzl?=
 =?us-ascii?Q?1Iyp+pCkS2qKYBXHAwrRWOtVlcgy9s1I5OZCqofYLzjvWb8YUJk96gW07+51?=
 =?us-ascii?Q?8wRRA7HSesMw5ncV+JPzMGL0f4FcjKyqYC3AaJ9kQBnZtfOdtN1ydTzUib7P?=
 =?us-ascii?Q?FTyyDREOap5F8fdZBbjds5yuMQq0cKs9dWIutnjbiKFVelWqSlwDKoQW+Pfn?=
 =?us-ascii?Q?1nBar00d0WhdjPtyK952cFituMmzkMRRZSZzrQpAbLN197iZwezHOHJjyjoU?=
 =?us-ascii?Q?nnH0Tx+N/WbbwYvdnjWmzFHFtubLi6vP5eWKw4dJHzKu669P3hGpoq96cof0?=
 =?us-ascii?Q?EDtJ2hwU0zoeq080Tk6FQESz68Ut0gIdAPfsetUXcGYacZd4Osu+3GCUaqIx?=
 =?us-ascii?Q?+1xKzPcXTAodwfF5W2FYSSJJUUgteAVufUqmHnlvcrgWqxHq4BOnVceg0RyD?=
 =?us-ascii?Q?Glc30NMOKkCPS3HfabijUelEeQbDaLA4uWUFE2Bw4EVjUnorW01+qjEr4njt?=
 =?us-ascii?Q?Q8LWFpLNOpAatgeUFoCxF9ac3ePgsCB6XoDZsYBY+Cvgskw9/LZWRaC0Ws3v?=
 =?us-ascii?Q?8iXYU6ixy78c0hT/Qtl4OPwf6l7Z8AR7NeZXv2DufVtwAWqxRuvGsCqKgETg?=
 =?us-ascii?Q?IsQy3gseQnu7kai5z238/b4RRwqTghyBF7/lffhZDv1sdJdsmHvvl6NHWoVd?=
 =?us-ascii?Q?8G/osmoOwfV+0bbPY09YfWoKCSsxSyTAQCfP4xPT0Cm5m+r3xHIlrs5GZ4ku?=
 =?us-ascii?Q?DURpxDeE5C8ABpaLLXs1qOFP1fioTeq0mMfiIdDBvrJK3olQ3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oE2le49RxxOEnVgMqu+7zzBtn2SvkTpNg8kx8irOo8QenRTh1nZp2izm73Na?=
 =?us-ascii?Q?kHvYx/u4RKkcUQplp00K0FXjyrj0dAuZQiW8BnM8apUaRg9ZBcEPrrNIvIYb?=
 =?us-ascii?Q?pAfG5NZSwG6XTddTiU85ZKvoggjnm14NUB4/5QhXcl9l9TpGRbsA5sg8o7Sl?=
 =?us-ascii?Q?VYjqHlZQm1oAgEOhTmbKIPAEZyqH8KzuPXz4AE3/SVdLTWQSnIRxZ+GVD/7R?=
 =?us-ascii?Q?2jM0K85ZO7NeRWvpPgB7xGg6lIeeqrSO4vWY/TIgeOnjhPCL8WPGh56v1rof?=
 =?us-ascii?Q?bnhCgWlNYIje3Dux/pnJQw4wTksH/WWXMDmxZJysMcM4n1thTIPqkEIWJlQa?=
 =?us-ascii?Q?0O5h8oYTek12PCmJXlcYbg88dg9aIk4wE3tCKEQaYn3wdBE8+aigUdrXdfld?=
 =?us-ascii?Q?nku93vIkIdT31/fsKt1EBcxCLoGCtKqS1nt4xz8iIfIrjL6XUr9zg57I/j7n?=
 =?us-ascii?Q?MN/cfVaIk12bMcEHR/BTt9RhMEUFzOnZ1gDsarM0bzYim/mCI0lvs4e2pLII?=
 =?us-ascii?Q?x2tEd4SRClXktM/z8Gl8GtL6pCiACBSL1hqfNvZaQ7Etw/S6diIWMXgHOU+S?=
 =?us-ascii?Q?gUnrT9Dd+xSCNWoeAGTDkALkmLvsBeFjP4mrTFCqUQ6a0VBRQ88zgTiak3XT?=
 =?us-ascii?Q?rIRJBMjiFXPrfrO6dUt5lt69rNmutZayNQuKaw55NqhKieXO+4aKRgTd/qoJ?=
 =?us-ascii?Q?aTslrk68MLqzb02V+Z5wmD4EptCA9Wx0nDy024eV8doJyombUAtbsi/LD+6K?=
 =?us-ascii?Q?l+q/KEaNuZtwg+suE1qjc3gB2vsicW2ney9gYk5GBIeGpE5HWhV7Ub7IZQLs?=
 =?us-ascii?Q?ZgAiAcIdfPsbQL8D5KVJ9YGlhfoWIcuW7eT9cc9UOUiw80x0fC6POFNeCTe9?=
 =?us-ascii?Q?Aq5/AvErhyfDh/n6gkEhhP5xva97x8GGbWx5BqIqlbEvUJ7u/GiwLKFr8AI3?=
 =?us-ascii?Q?R3lH4WFY1Nuq+62Ym08OFqBCpsMomxZTt3plfGQQa/EDBQQC0ZyHbgYuUAaW?=
 =?us-ascii?Q?P30gNLp28LlYOxYM6LBncQr10UK3Nwi/MW/coUc64fLmsYddys4la3p6I42/?=
 =?us-ascii?Q?h0Zbwn0978ZLNV0QizmGjBsJ56KASp9YGTK9wYvQvRxDW/6UgbVj2tyrq+tp?=
 =?us-ascii?Q?6bsop8sYVn9rp3EzIqwjEYWr6d4YPv51PEwso7OU6dLCB9sxsidN6Ect6CP6?=
 =?us-ascii?Q?EFCZIiM2H5/ZdoorYENYyJJluoxG1QlF7VXRnmJb0q98t5pDz2tXUSFdG5ko?=
 =?us-ascii?Q?KCSBmi1AO/LXTUCxPrQq87+5k6ylBExTIzFF++RVOm+FB58v7GOaihuSXKaF?=
 =?us-ascii?Q?hoeKKO6jY7eR99lD9w+UZot/Sm+GKV8GTdZiwFbjKwdNnxPUU+r+8mqdrneo?=
 =?us-ascii?Q?brI9tvq9Gr9AtUlPMT7aUTinBGYF+H1xnpP/x1pxqMmvVX7h6erAMloXoajS?=
 =?us-ascii?Q?4Z5xBOlcPf3dsb+GJhhHKL1YchsEqthiVUpOGcOHXUoAQOwsejVyWgpCxBPu?=
 =?us-ascii?Q?F6AyW8xJh6tkOGZpShNZ5RkNpaASNVL4PcWoxWtQRFUrPJwf8EgfTGGpXGgU?=
 =?us-ascii?Q?Y0BFoCxyvp/1iWGLn4DBPEzKNEPtu6Ls6kQ2m8I+cv/EFKJHnsTGePEQYcRT?=
 =?us-ascii?Q?nU+9OIS4J0fEDArNwi7J/YU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cee9efcb-8ad3-4fac-8be0-08dcb4e77bbe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:28.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yIC2uXeRPM8qXThYCPciLJ09ZjdHZKmoQrhV7/Ma/ncWz6ZTQFUYHxykgSxz1JXUT6/hXHFYp4cCVsbccjHKfSA0LWk5CG+569hWZX7DTZaI/LadhPMYZ9n/l6QPpKd5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: ZFBG5AMJI637RJIEGQ64SLBDQ2VEZVA2
X-Message-ID-Hash: ZFBG5AMJI637RJIEGQ64SLBDQ2VEZVA2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFBG5AMJI637RJIEGQ64SLBDQ2VEZVA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wl1273.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wl1273.c b/sound/soc/codecs/wl1273.c
index 737ca82cf9764..2ea7264a18d43 100644
--- a/sound/soc/codecs/wl1273.c
+++ b/sound/soc/codecs/wl1273.c
@@ -298,13 +298,13 @@ static int wl1273_startup(struct snd_pcm_substream *substream,
 					     SNDRV_PCM_HW_PARAM_CHANNELS, 1);
 		break;
 	case WL1273_MODE_FM_RX:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			pr_err("Cannot play in RX mode.\n");
 			return -EINVAL;
 		}
 		break;
 	case WL1273_MODE_FM_TX:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (snd_pcm_is_capture(substream)) {
 			pr_err("Cannot capture in TX mode.\n");
 			return -EINVAL;
 		}
@@ -348,13 +348,13 @@ static int wl1273_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (wl1273->mode == WL1273_MODE_FM_TX &&
-	    substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	    snd_pcm_is_capture(substream)) {
 		pr_err("Only playback supported with TX.\n");
 		return -EINVAL;
 	}
 
 	if (wl1273->mode == WL1273_MODE_FM_RX  &&
-	    substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	    snd_pcm_is_playback(substream)) {
 		pr_err("Only capture supported with RX.\n");
 		return -EINVAL;
 	}
-- 
2.43.0

