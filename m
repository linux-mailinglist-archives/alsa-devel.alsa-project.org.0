Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D892E94030C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4547084C;
	Tue, 30 Jul 2024 03:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4547084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722301512;
	bh=gn3dltBRPseZexIUgzKpGWxlC5wtz+Do3+oDhZs9Sf8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N+xL66LqMS195pWomvnpp/iA4Wfn+PGtF4MVhchKiW7p2vQDa5U4GC0sUUAUcoNqG
	 BjEodhPLkq2FwyrREi9WH7qaZE9oaLQsdh/gS247B3wrRr17Ix/3T2WNtyVgMxlbgX
	 tWN8mlgTk1MKV4NACKdcTJCtGpDQN/B2EEaLs4WU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DB2AF80588; Tue, 30 Jul 2024 03:04:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AAF7F805AF;
	Tue, 30 Jul 2024 03:04:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9708F802DB; Tue, 30 Jul 2024 03:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2E31F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E31F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZiENuw2i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL9Rk1zJiVFUnag0oRqD5lETZbaWZ65xmDvFiS/bJl0/Qyggu/KiHJF/bH7bapJ2Bgv7EgJVnK9SxZL9WtBdHk/gev/hhKNawUhyoTXzwFISgaH2MlwoHPM05Lmu2pbSIKbFehBRJgvZUrvdinBhibIH9T8Y8e1vzBnYtHJ+euuLfhHlverRWgC6EUgn0PeMdRy3vWMgq5idedHzW65gys7xYiCLxhGt/rUmMEMkhPmxCLcqKgJyvJ8xyFumO8pQWgYMfPvMqqZ2sMz2ZTAr2FwQE2gjSYtlI4VFBzKQz8NjBN1CGqrkR2MvYigZX+6txdQr8++1S5hi4/KtP3jr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bx/5S83WbETnGCepUEykMP4xJnZKW6LJpXV5SoCVhGw=;
 b=m8F3cnHzFPuyRAI+nBrp9WhTnmqPBFubFHGR560iiFauvBo7MquHHpUrnnBHv9x+IZPf2JuviC2GYrCB0dAYVKIP1qaBYwsy1fyQaHwDMNab+crtVE/hwmiyF1WHQobmWGfuq3Uzfko5vhJWh/V1UowP6WkweZDGmPOxHi1neJiIRNq5eZYGLXJc962fGKEhg5M88pXhwVrEmP8aYSvBU7RV4hFDlI8xz9RV9yYYLNg9bElL/2hY63p8YkktBzUolIEUukwS0+3xY7AjTFYGd+arDnH8lTn9xcqDT6ue651c5BtOrE6nEslHTSxpTZ8pDN/xvmvrIYbAQ1fLiwk2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bx/5S83WbETnGCepUEykMP4xJnZKW6LJpXV5SoCVhGw=;
 b=ZiENuw2iAzui3yxASDJaagU5+ATSqT5H+6ZJYXW9WzOF96PIPmzIN8lPmrgOTvnyl5PF9RYTCzmFQoGzMZfBHir/fAkw2jg/EsmldS4YkVbyhdFME78RvEXIQa/HCmKqX/cCkFD8K3y5VpMV7bAXR+P3Y/FEXMWhNNFfSNEOQAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12484.jpnprd01.prod.outlook.com
 (2603:1096:604:2f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 01:01:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:01:50 +0000
Message-ID: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v7 0/4] ASoC: grace time for DPCM cleanup
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:01:49 +0000
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12484:EE_
X-MS-Office365-Filtering-Correlation-Id: 5172d0f8-d27f-4d7c-64a9-08dcb033319e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iNhwEWmzSXErE1ai6EZWKmAyhammPtQp0zfBShy32eKceBn6pkw01tkW74ge?=
 =?us-ascii?Q?mWKaEqL0iNN59fE5qsOQt4oxm28czxnK2hhwnBYwJpFqI7NijYxDRF1lbAxH?=
 =?us-ascii?Q?irbNdpLWR2/3R/s5KNXIts65C1e5VieNrwbi9AuTVwMC8oDRbAaxydmGYXZh?=
 =?us-ascii?Q?8uUs7czL/YzsUqgsAqhUzwqANROMdPMMufC6qY1E2F65BrQuNj4UrOcLhy5Y?=
 =?us-ascii?Q?eXT1EJqT/YJv7WV/KgfrP+iZoclKjkCx9AEcH7E9nsS6F/dxTnfJ87nKSccO?=
 =?us-ascii?Q?Xl+344CrQl4J0G1RfNaLiyyk1Qs38DrIdMKN7YK1znuCVMx908mF6YY72RO5?=
 =?us-ascii?Q?UvLWjVIRp/uewVzgZxnO5lCzyDBHg8Jv6OLw7ftLhVVvEEMV79dUurmY3a9q?=
 =?us-ascii?Q?J4FEDD8bYTRKu4MXqS+d3bNU/mjtyJ8ZWDMtl+O/FlmWbrb7eZGcaYmoLk6K?=
 =?us-ascii?Q?JotkEfxdgggdMCft/RTVybJBwRtd282HnjuckAcHx8Sb6GGLzw3JAUBd07sO?=
 =?us-ascii?Q?B/0XLOkuilk0TlalQ6N3czvPTC4s+PR6xczJqJwgXvc/btQK4pUL90j8xx70?=
 =?us-ascii?Q?VRWSRf1DqWHGfr59fj8eMXJDlfkFw+J1o3nM4HKwiuu2KULJxVFzCyq5hOV4?=
 =?us-ascii?Q?vEmbTNjWhOI175QtlsRc+VnYoU75BvPtbj+ZzqLONWFkZNoTmwEl6CiGXdUs?=
 =?us-ascii?Q?Tkoj8eaM/8xwPMD8eWTyYKOoCXGEi+fF2JPY2nMTQo2xz2C3iwezJ4ddLN/y?=
 =?us-ascii?Q?jqOC3Ru2nf7M2M2RZXqTWuMMRt6aT+WFTTY9ujsihx/NmnfiRxrj7jU9q4IJ?=
 =?us-ascii?Q?8s/5OmeeRjxg3LTwOd4/VD+QN+HBOiX31KPtqRR07zF8hll4gftGLlg6aE2a?=
 =?us-ascii?Q?AVVFD7og9o4552tr7YfkbxSRqffBD/Ao8uzXBEBGaead+FyNVz7JkvodYjhE?=
 =?us-ascii?Q?94xwt6raYfdxoa+kkTcn8LzxoTJV/UzUK7F9S0BbmFW7OM/6f68DsK9j2r/y?=
 =?us-ascii?Q?FLsom5wywp0X6nGPUhYcWn+ClxYWRyabbLqmnZuXCDNdvyVGKhSTchNbDKIe?=
 =?us-ascii?Q?RdF/1sPnyu6qujrD+s/pYFAwVJ267DqvpqLG9SugYyzwSt+VGZUsx88YpB1d?=
 =?us-ascii?Q?aFSrZxdT2QwS+y/mVOT3V41IOqnP59WF9KnQf3g3vpWNgvhnQFhV0w3kIfDy?=
 =?us-ascii?Q?omNwAEBf+32Wpi0fsahLq3PjKImGv3bRUxte1frs5E9+2E/+fnatUvc2ACud?=
 =?us-ascii?Q?0qy2aZ6d73a67iNaAOpkhq/HQ9khcmYi+IZxPZoGSRLgqcXeGes3HMwaiUaF?=
 =?us-ascii?Q?FHxxjaOWHnrqOv/ii/3+FZYwaL8Ri2TlkXWIVmghHWfQ86j0mMevaY7/sw1L?=
 =?us-ascii?Q?8sw+csqnWCybfO5hFUJrFKTt8W+N?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u76bg8l58KK8ok66FqeI3KLeM7bJWddzMBuwIM5wKF4tV4tb/f0B18drFfEx?=
 =?us-ascii?Q?eCUpDQN5oK15CGDGL+I8MlcJJYr+tWdls0UZzcpji7nCsK5rhjEP6j2g6ttn?=
 =?us-ascii?Q?NX38Ur0BjpI2Ya1JmJXz1YQxUmvuNFgx4Tq/iEjiMjPXt6Z2V2Z8abi2VYEi?=
 =?us-ascii?Q?sXTDgZpjM2jmkkZphxIqgFvWcxiFLlXJUWBaUjKG5mTgnsjFn17wboXInkdD?=
 =?us-ascii?Q?51JJHeFJW52ALYeLpPeQ7Asy3CP3hvIz2gHlDxK2aD0CpGkRs1Z+djuwgGGr?=
 =?us-ascii?Q?R+5XVPFHs24ywE0a2NG5VC30SnFDrVX8MtB5JVsdaNS0dZv9R04+qVCz6yCJ?=
 =?us-ascii?Q?BA7vz5hY1LdbfDVYPd8yK1TDmXJseP2qewBviTzM+Or0vKDjxA1+kxic4z9j?=
 =?us-ascii?Q?bL68BXO+i/fJehwcgSQ+D+Wo+py1dEyfteb1ofxw17FL19+XnKGtBAkmhXFB?=
 =?us-ascii?Q?R4YNXxU/czjW6SkkJv5ly4pEJlDLjz/PDgROIWL5V05Swh9DacxIUqbjwE6C?=
 =?us-ascii?Q?dpkoqVsHukFHaXvrTqKUpTSR/TwGvZMQjq0kS/TVAa3EYeFCPagR9/EQH8L7?=
 =?us-ascii?Q?6eiJw2feW3MCDcP31oX3Vvrae476g5KvqD1i+cQRCr2iKv2aka66Is4J1kBu?=
 =?us-ascii?Q?qjDFKGQY99jNMThnrmTcHM1jWPPpCoWmIT+lgx9aQEuGkWvdiebrrxGh73S3?=
 =?us-ascii?Q?Qt/wMcSDQSU+yE3FY1h7IDiBOBEfUgcix0xMYomSE2ouQ2jrI8dJebM9wlhW?=
 =?us-ascii?Q?pkJd7PUNzq4N+022LwLHbBbbIcL27cyPGbuhgykppMvPb6qJJ5kjKs7dTHQ3?=
 =?us-ascii?Q?fyiQ5Q4ceK9mi+7XxdPWjBFJI5+jx2SkFn42hHJJssMm69c8Dnz0l+ozixXE?=
 =?us-ascii?Q?WJwf60YP3/I2gw0O+30aX63ZMSO/N8e7xNTj8c+jeNazRW02R2CJ8Bm4X5tb?=
 =?us-ascii?Q?btXEPcr2E2BxkTC8N7mJ7StMr0EqkeSTd5a/W25lPOvosPrYbM8vpYcZvl3Q?=
 =?us-ascii?Q?NDMUrfqqfWYH4xVpwrHinJmRvaEB+8dIR4B+rO1wK6MLejtgr53flNnELJ9g?=
 =?us-ascii?Q?sASdZf06xxq/OtRaYYmq+LDdhmbsCBo8gsCUTo3CVVD1l33MUrhj/YbZKrWx?=
 =?us-ascii?Q?Ga020VsdW3n/a38gdEMMwM+hDFfqqLjEauPVbTfQyJ+eLL5QWNNKa6UjHlps?=
 =?us-ascii?Q?xRekVpIpvvf6IGrSU4Caw3oDMhMvKgdAbutY4yTgK1He+VkumjTi2nR11i4R?=
 =?us-ascii?Q?l/bJ9swdhK3gUrZ3WBoA76jeX8Lib9CN4Q49MaZY04e8DyLA4/sVzxWR4OXb?=
 =?us-ascii?Q?Vul+Tyhgw5PCUNEgQwZKfhPZeN672lx3ujZbszX7ErE9jjiO3EjJ09oz+jza?=
 =?us-ascii?Q?v8fBoDTcGLrQBhi0xv1aTs6VISvQW9uzJpO8dwIxKNg+61GaDZQgrYXk5KJk?=
 =?us-ascii?Q?h7WecMALjnGsZn7+xSalnkO2GT7TRmb70MptHEzwm9ts9fZ9+KSWnxK/Lvva?=
 =?us-ascii?Q?hl3xQmTWciTGp/91VULiqYa/Y/8ReyyvlS1ASg6VbNKj4enROKyaK41NmkAc?=
 =?us-ascii?Q?2rsIRgZ/wCaVPAIXyX1NE21O04UbZ6FwVWEuTt7H0Afcqs+CjKTtX+ImnkCf?=
 =?us-ascii?Q?xBks2W2OzsbEvkHMxuKWqQg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5172d0f8-d27f-4d7c-64a9-08dcb033319e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:01:50.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6fS5MWCcEJF4CbcnFWzVzL3VEnvOKRHVTR3Z1UruU/kL/+XNjqV/+t2GOIlpyY0FJyV6tmJ3K4xkVDZulh3mmVM3Is+04YQzA7+M9YYj55Bd7/E81J7fQJkIie5kJa10
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12484
Message-ID-Hash: ZJUU2EZDUFRCLBCZAE7CKMT5XJZ5UWF4
X-Message-ID-Hash: ZJUU2EZDUFRCLBCZAE7CKMT5XJZ5UWF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJUU2EZDUFRCLBCZAE7CKMT5XJZ5UWF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is v7 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
error, but maybe v6.12 or v6.13 ?
Please check each driver by that time.

Previous patch-set try to check both CPU and Codec in DPCM, but we noticed
that there are some special DAI which we can't handle today [2]. So I will
escape it in this patch-set.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/all/3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com/

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msole5wc.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/871q5tnuok.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/8734pctmte.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com

v6 -> v7
	- based on latest ASoC branch (for-6.12)

v5 -> v6
	- based on latest ASoC branch

v4 -> v5
	- typo fix: limition -> limitation
	- typo fix: catpure  -> capture
	- include Intel patch

v3 -> v4
	- don't check Codec on DPCM
	- include Jerome's dpcm_xxx update patch

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition


Jerome Brunet (1):
  ASoC: amlogic: do not use dpcm_playback/capture flags

Kuninori Morimoto (2):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for
    availability limition
  ASoC: remove snd_soc_dai_link_set_capabilities()

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw: use playback/capture_only flags

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 --
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/intel/boards/sof_sdw.c      |  4 +-
 sound/soc/meson/axg-card.c            | 11 +++--
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/meson/meson-card-utils.c    |  4 +-
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ----------------
 sound/soc/soc-pcm.c                   | 65 +++++++++++++++------------
 13 files changed, 47 insertions(+), 88 deletions(-)

-- 
2.43.0

