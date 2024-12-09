Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64409E8C5B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:40:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11430852;
	Mon,  9 Dec 2024 08:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11430852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730052;
	bh=oNcGjzpvOPtxpfg2Gfx1xEYaWegg/LRNn6RVbRXYN90=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sOqDB1/OBrMVDgaD5ZbhsllNzen+WpTSywxQ7bULhIGkge7Vy1oTQH9+EFhaAhUHJ
	 H4Qdx2oRX5SAYs76rHfSIx6uGRHtPI8Sg+4btXg1FAPoOZFg98/dsGvR1XtvasOn6r
	 BQsz2xgSuMePJGMdD5Iu/h5sHGRSZi64N7VptZsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 464D6F805CA; Mon,  9 Dec 2024 08:40:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE004F805F4;
	Mon,  9 Dec 2024 08:40:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E4DF805C2; Mon,  9 Dec 2024 08:40:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FDC8F80448
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FDC8F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ejAP31GC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRdVwjH7qp288RBCEoohXDlcD1dnRu60Zq0V3zhwS01pjk9mTpmHzS0TQULkNMrPm63kkSNuwA3GeR504NpM5yzi7kMHovU74EG6NLhA8Fb5qpvQLPkRjBse/bj5rtJJbtlnRdNjT6ixdCnf0za4sH/F6PZqhYOE5C0oUcma9JJdzTnhMKq6ITBeQ7nxxHMiORKqLsLhZPJcjZJgHdNCWncXIEg//C7B3Ta6nGOuZ8GXhXrPIPYwEjshwXkoLIJuzvqP24qpumEclRcm6fBIA42HdTeLVYzQwgZk7h8OSSX4ZQJTh5YN73F+tfQOpZ4HGwInm2+u3jFM6v3RfBk2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5ejxYyGOUrP3+fXaRXhLQAhm0z26QmMcLMJAPceWWk=;
 b=f09eqrSW1OjNAiIXIoaBBtJcsGV/Z2fB4zTX6J6VWNVgmJMAphX6ROP322MF/WOqnnh+sEx/DxaDTL3riwpiFsAev38jMjd68bvtMbGwLKU9GlDDdg47n+ZukubUXu5ttumE0rh4E9SnhuSdZyXEgp07EnWJAhRfctAr1P/9bimBa1R0N4DsW8BaewZrR8Ircs0xu76Et6K841dA4X7flWw3hn3aUElQRY9cr3igSjGs/xXUVG3gS+OFXcFPsVee1fsSDnJ1ZQhBZq4l0Qqc8yu+kAqv1lnAIiOVVcvBUeb0qcwsekDCXgRicpAlkZHlusICcUclC+4S7K7oUrv6ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5ejxYyGOUrP3+fXaRXhLQAhm0z26QmMcLMJAPceWWk=;
 b=ejAP31GCehd7sC/85zAuSYfnhi7qd8XYU2OF3DtMQAW2hRpNOy01/47wOhdoG60MZ2fP+qYx8sVPUsy9ezVgrtpUxYllnIiwvytflyt/Juhoz4+pUipfBJn7suW75GFbHoaOSCWeEIbw2IP+69wahxihLlhIqNR45EsR2UZJ1yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:39:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:39:42 +0000
Message-ID: <87seqxmhj6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Daniel Mack
 <daniel@zonque.org>,	David Rhodes <david.rhodes@cirrus.com>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Lars-Peter
 Clausen <lars@metafoo.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Luca
 Ceresoli <luca.ceresoli@bootlin.com>,	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,
	Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
	linux-rpi-kernel@lists.infradead.org,	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/17] ASoC: codecs: cs35l33: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:39:41 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c845e1-6eb6-4d66-2352-08dd1824a4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F+fQ2LHW2SrfH5F9I0Xgc4s226A9u9+YlVWVl6szHWniLqYo8yJLpFNrkWMC?=
 =?us-ascii?Q?oh3+cjUws3/qF0esOIRkQJY9ZPMd5t/MF9t3dzhQersGgk5IHNTAR0eIDHui?=
 =?us-ascii?Q?bixr4Ta4FzeWs0LESgop3XoQDvwYRg68rM6WifilEpCzwltAdJg7UZcHXomC?=
 =?us-ascii?Q?782LgYuPhom2hFd29V54QftfyQAJ5h+q8docS/pTPHemjvY6G5BdKOLoqcnH?=
 =?us-ascii?Q?BvIGqjG/lpKNCFQ5ZRqIDm+fCkXDQM38uCIYD29IUUb4UoCZ5NEKDBH0olRx?=
 =?us-ascii?Q?/r/17vNmi5YB+bx6C0pTcn1lZuKAlQ3q3D8MyOl/1l6IQtYJ2fxDRevyOp2d?=
 =?us-ascii?Q?lnnvnKVBE7BkjvXDyh5Qji1p4kATWWUSyE0uxcRq8iVAfsYcplFTtETE76d1?=
 =?us-ascii?Q?Y04/r8SdiQdWScLjp0m2axOCJfQ1JGd8kduGvfwCrWEZ0Z3gkgUpDdxspRhd?=
 =?us-ascii?Q?VqrlMxDJBCFJAkCiY5WSqovM8IpUjG0WQZqiXwA5tSuX49mWhbgx6oG+TpDI?=
 =?us-ascii?Q?8l3sEVMcdVX+aQBHubHNG7sS5qefUDmqFJKjnfHN5mGxxK4/uS6/NV3pfPIX?=
 =?us-ascii?Q?qRjxsFuxGPCOMtPU9kBgWU8Nlam2fyT44RFUH6yS9A/r+1T27neiENhCrDxj?=
 =?us-ascii?Q?NXSzwkLIvYK3jC/5ruMcNUzwwBJ9Ie/6Sq3MN1hCdBvKRJyz4mS9yUFOg4Tq?=
 =?us-ascii?Q?baHccXlGC6G2+EV4Ish5EfoYrx8dm9uSnJPEZgqKioGgblWsfzvsWj4Pi/9i?=
 =?us-ascii?Q?FK/nARjgN/7q0VOtal1dndLVrE5mpE86khA3+HkMTfv5JnblY6ajioNwA3Kq?=
 =?us-ascii?Q?WbQfLYcREurejDPIYy1iEPMWi8qFttZ9KyVvZDWVEpbee7Rd+qo1md++jMxg?=
 =?us-ascii?Q?Ni0Qytx0aDArTddSKah5gT/PXCIGcep1/izS+0UMT37LDMgY6TDK4gbLSKzf?=
 =?us-ascii?Q?AObIe132e0HnephbZZPPVm1rUFOrZtDOZFFTnuzXsyF78AQI54EFCat8Z+pk?=
 =?us-ascii?Q?mQNpgelkTGPbF1VR0+9wR/ftqDGuF6w+uAhfiYdnbtzR1htRZVAQv9D/mHNE?=
 =?us-ascii?Q?OizkdahuA42NwpU2EkSsOuPktRSJ7eZ9RFhTi15btwzr/DsrWbrLqaSBXWRJ?=
 =?us-ascii?Q?EldWWnIoP1Xw70hzf7uZ+sMkYEPZ2dvO0FHK2OueOpU3XjadIbzxYla900xj?=
 =?us-ascii?Q?3moyuHMhu5FxeEweyIgXug1mfBIK9gtVV3EZbmcn/BHLkN0TZlTCeM27s8vB?=
 =?us-ascii?Q?18hxWn/n+OflEW6nGdEb8zXcZyRJj8+Rb25jbWv10lj7yjSk/zeQTsXEv+av?=
 =?us-ascii?Q?IwJmTrvcxAfCBB4naj5zyoVgWKW6NGIw/85z4xmlB0NzRw2eybdwFCUi/SUc?=
 =?us-ascii?Q?lzVXF2nS4OrMW9Xs/H4dIJXb36/JvQMk4Ozd7bCnRjQLKx2biXnRbDC1YcbM?=
 =?us-ascii?Q?UrGoRHI3DYBZGGH1xZX4XfyZanoWKMv6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fzhtLb7lLkBkbe5VuvZUlBx/wiZxzPhW2tqUjwMa+QmH9Z27MOEVduxrMo9q?=
 =?us-ascii?Q?yyiG4+jIj8qqV+ugCKvR5/QsjDlB1ESIVerlsF1ZT3WZy1qtIZ97D9jGMe8Z?=
 =?us-ascii?Q?buXhpveJkzBelPPpZdGvEoKtsdV9fGzbBTH0ga7sLxcdggDFRh1fmYXeHUZK?=
 =?us-ascii?Q?fTDUIPMvTeOMGnLKD17OEB/Mbyx00nOdTvaRk0WaOmgZUjQRxh4msCMpzsfF?=
 =?us-ascii?Q?JrlIQljuu9V8HcmZ6BVwkqv8aVA2QCwmpYhjxLEt1YUBPIEz5yj3Tlde+0MI?=
 =?us-ascii?Q?8BAegFjLb3yQrUYlMkoEvj6O2/ALS2g9Y7aQoSvzR4gLvbthw68o6dGsYaUp?=
 =?us-ascii?Q?CylXtIRxf6LW/qvJrSWstjVtEoFIFMJlUWJG9GFdzw+8jQj9Sbn8EeBQnGc0?=
 =?us-ascii?Q?f0Ng+V8C4absCIiUh5rVDLQwtcrqgaGr6O0zvwStij9au5Jv8JMnQ3/5GVsm?=
 =?us-ascii?Q?/2MckEPgEy9jonD5vFcxUP0qsGklgGDlWkplaiHTHemX4WVQUcLvDxUcAdlK?=
 =?us-ascii?Q?+xXBoelrfhAkcH0XwwQZ0nUN3u+1Dj6HI7uWg4Q1pmwIolDaTeWIQtSIwTvB?=
 =?us-ascii?Q?Gt9obx/mHlfFzJDt6/rzwc8jmwzfcEGIEtucROPuAWbB/E60iid4LPHnzrXy?=
 =?us-ascii?Q?X8403wvQ1SWxPpMMy9MJCrc08qHgr/2GVysoKuMIKy1m5yv3W0l/0IABcJJi?=
 =?us-ascii?Q?AJwxFp3Q77e+nLFG6wd31Bj+8Cpe5jIja3vJQQ1w+xfarvTzSSa9BqJxsM5Y?=
 =?us-ascii?Q?gBK6XhjKWsojyc/6zbIwErWlmMkRjf0QqYaAFF54Qjqq3Er3C01G7v9sudJS?=
 =?us-ascii?Q?13ftSrLHREs3sU3IWcyjtkJzxUPuwO6Fjude6+ONej5ojHPml3gnhZ7xxWmI?=
 =?us-ascii?Q?/dnxiqF1mzDEgRuPnVVqgOcn1x/5rZyrSybnbRU46Sxj36ZKtKQJ/0cmBCQG?=
 =?us-ascii?Q?wycX/UCNvekKs/ahm6is9enCfuxB+HTpfnhfDqtBELfQ7FxcWp6tuE+7bQ/Q?=
 =?us-ascii?Q?Fkk+kdgE6MdabBTEu7ST8i8uYNmT8f6zBs1AcbOgy4WQfe0SvQVKh47qwco5?=
 =?us-ascii?Q?4rjdEOO3DvjVnxHoRlAznNbN2CMj0BmDtmxQltEr1aYaYCusp0rfmLUKcPaL?=
 =?us-ascii?Q?Enr9wV3fAJJgRbTNu1rv4RbLfkm3XnRd+EEuMFlPbv5G+AeCjjeDDvdocFqy?=
 =?us-ascii?Q?QD2sFVbsX/6pawvFISOpNy2ONc5E73k0Z6CF4aHrCx8cQE4MG72EHFCqH6xn?=
 =?us-ascii?Q?7gznW9nHkxZH1f+Rs73XOlxVfev6fRaRWt8f8PX38uV1i8wI0ZroifUOVoW4?=
 =?us-ascii?Q?4AdDkaRusc2wioZXqlecyzh/FEhcu5L/g3ujTFxg1cirML987Z5QZibrHxOp?=
 =?us-ascii?Q?ZnoHDF3ZaH4ST1H/hP6ALkPaJgLZDkNnsrxA8DLMh1VOqobCDcGyiJZbG0yQ?=
 =?us-ascii?Q?0GnNpisB3LscVYhSJ53mIqKMYFCREdOK3dVY1BKkza9Mfb1krk40mj3/+YmE?=
 =?us-ascii?Q?YAU+Vok33AktnGEqstzLmAHPHAiY41/nOph0Si9ImmCST+WA0ioFpQl7+6hD?=
 =?us-ascii?Q?9J/484Ck4ETaqIgfSIl8l9v4yCyid0uJquyBagxOTCgAcjtiTxm9akZZnY2S?=
 =?us-ascii?Q?ZO71IdDQPH2S9i5SQWotmqg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38c845e1-6eb6-4d66-2352-08dd1824a4e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:39:42.2240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SJo9vc4DJYIXosMoEnj1qIIJFy3ZrX7eO7rp8VFjpcBEC9ozdfebHAmrlzyoT76nggyoAgl92IVxdTpyiwkHut1RMrOJUiKgBnugKTRxzzlfcr1uELC0zdN9NlxpcxPV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: EZNLEP6NBPV6AFSWGTC6RKXBC7PS7DSC
X-Message-ID-Hash: EZNLEP6NBPV6AFSWGTC6RKXBC7PS7DSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZNLEP6NBPV6AFSWGTC6RKXBC7PS7DSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index b03aab147530c..ec1de0225eed8 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -523,26 +523,6 @@ static int cs35l33_pcm_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int cs35l33_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	struct cs35l33_private *priv = snd_soc_component_get_drvdata(component);
-
-	if (tristate) {
-		regmap_update_bits(priv->regmap, CS35L33_PWRCTL2,
-			CS35L33_SDOUT_3ST_I2S, CS35L33_SDOUT_3ST_I2S);
-		regmap_update_bits(priv->regmap, CS35L33_CLK_CTL,
-			CS35L33_SDOUT_3ST_TDM, CS35L33_SDOUT_3ST_TDM);
-	} else {
-		regmap_update_bits(priv->regmap, CS35L33_PWRCTL2,
-			CS35L33_SDOUT_3ST_I2S, 0);
-		regmap_update_bits(priv->regmap, CS35L33_CLK_CTL,
-			CS35L33_SDOUT_3ST_TDM, 0);
-	}
-
-	return 0;
-}
-
 static int cs35l33_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				unsigned int rx_mask, int slots, int slot_width)
 {
@@ -664,7 +644,6 @@ static int cs35l33_component_set_sysclk(struct snd_soc_component *component,
 
 static const struct snd_soc_dai_ops cs35l33_ops = {
 	.startup = cs35l33_pcm_startup,
-	.set_tristate = cs35l33_set_tristate,
 	.set_fmt = cs35l33_set_dai_fmt,
 	.hw_params = cs35l33_pcm_hw_params,
 	.set_tdm_slot = cs35l33_set_tdm_slot,
-- 
2.43.0

