Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301019472C1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631654EB4;
	Mon,  5 Aug 2024 02:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631654EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819513;
	bh=VyVN8e/J+InDL1BN1udcFkxW6voAFhtw1Zf4smIpFMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJt2UIQoqvvm1FtvDdyO/ojNXz9Nra8gw8XmEB3twaex6zxLP4ZlyguJIFFPHw+SE
	 ORa0xfaGsklfjLyQ/gktHmAyAGbznSDZRE3mJquBxTGi+3Rdv1h/3P2ZZZRtVDrdzB
	 AconiGuuDNYfcJ4nAan7ZfvRHi91cGGlDnGtXP3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BAD5F89C81; Mon,  5 Aug 2024 02:41:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A39E9F89C85;
	Mon,  5 Aug 2024 02:41:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D49DBF89C34; Mon,  5 Aug 2024 02:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34460F89C34
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34460F89C34
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aMOHBtNx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCHDDlxo7glN6qctOoVMz5p+mGsINJo141mAAjMpf+TAkZJe6nNR2QFAzsPF+9wW1LswNClU07NU18cyYF2cTPT4D8VkJzmbl0XBgjAXTyYFSQKbmjWwdjtNsn6hbd2Ry1UxEsJm8HhgnF1I8S33fuSFuKtNa7VYXRjkzrzulnpsYzJRO67+ULh/UQVvgnF1lSmj5KuE5l9Eze3OhgchtDxa7RNo7M+MAMSr0Wz/RiRmOs1PZ2fyibLi0kGpKAUqYf3f+UZpzNwHuYJY8V50qyPIYRqmNVjV+tx/I+3g/BrW9l5D2FYldXsqxidE81XFcBJwFJNt5oJ7EPIhbcopVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9f4FktZ9yDJZ90Cds6CcXcbZTGo/EnUoXn+Lyjsq8g=;
 b=QdDpizOSYttwGRPfmOrN+93Pqj1+NxYj93mVcSBfKSHYBuYjIwcAlSZXRK6DTPTZ0UpRoLS+L6cJ5po49abhF2nNb23luFdkYvPGWppF6vVWXckEwrnGHP4xhxEXvVaNrN+i94pq0AHsYdhuGy+uWPTc3HoSQkn0ziUkWLHNpsaAsjgmuVbvWRUK2b8ZFFIYs1ses08SfVWXb6FPFnTXW1gOrX3e5xjWvrY6hD4Zu2fs7tPIpz6t02uJ/yafJScmQErjsTHrLr/WdLwgf8S4x5XgUVv5s5xfyjTdcQ2KI58I7Ty+He+Gp93UmXyNNvovbrdq9lZaJ//UjvqVyrcXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9f4FktZ9yDJZ90Cds6CcXcbZTGo/EnUoXn+Lyjsq8g=;
 b=aMOHBtNx/u8o9LV6CkLq77ywnYjSnLNOroLkixvWZOzuSdOWVtHovKO7RnCi7p+/Shr9CIQsxJy0Ii4sMQHMCppDfwCw34jGFY7JYNHhfMBl4/kYgyTXE2Vf58tijbPKVFdaXDMOz6MzB5hM0Y/Y8U6sIwewmIhDukyttyPV1RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:06 +0000
Message-ID: <878qxbyf6m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 072/113] ASoC: codecs: cs*: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:06 +0000
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2b87e1-e9ff-40f3-bd34-08dcb4e74ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?18Zf+09K/z356Ur6soTSdcQleIuMEkbt/sz6WC7jG/8bBYDA8ZBmbQ343nJK?=
 =?us-ascii?Q?d9agrU8NjMyKiCQkBq14McYrMABdSRVdyvqnediZdSIxKf0bqr+rq+FeYas3?=
 =?us-ascii?Q?bjcE1i7f6NBidZxkAyeQQjqqJPVtMn1PLlyLgoRnD9u6CT/9MXKHkCAQcwAX?=
 =?us-ascii?Q?EZJT+XZRB2MT+S2r37M6tlr/RB5wdoNej0TKbLEscjAXvoWrOXaCyPW3wAgw?=
 =?us-ascii?Q?FgHAj3z2Lhz+rS9J+ALCNYs9sS0+DUDsRToEPIrSGQKIokOL/qiuZRA+i971?=
 =?us-ascii?Q?oeeo3WrCKZlD46VlV7HgYZh/8bRtZhVFDmr94E+ArRpkI0cd1nBmfwPmrxS7?=
 =?us-ascii?Q?WFtgIwdgUIdhqttiMr0aQ2i9+THQYVJQ53wtsPSVOTiERB0HmF87yo4reYLJ?=
 =?us-ascii?Q?18ggtoC9svnUK0+lzUZFFKVpakICBveOXqegYsa+1xEGAuwB6WR1LN/iiptz?=
 =?us-ascii?Q?HG2awjFj3WU0669684QTsJKPClJYEq5ymxQ9eYfOv+dLLvPn9JlDScCGZAXJ?=
 =?us-ascii?Q?9/s5Jk1lR9TJlRmObS+TyW8MMe3KLYCilezdms/gTlkeUtXmOHVMs0fJjfsT?=
 =?us-ascii?Q?wYzNb1PsJ85hki+SLO52pAfgi6fnrnz2EIU6BiHQxV3Ih76yAuzEeLU4CI0/?=
 =?us-ascii?Q?F/HNnwzlVem16usyI7llrF521/6UDbK6kVnCk2/eWYVxs8SiSCRhyFB49sho?=
 =?us-ascii?Q?3ZXghZjPYvBjp0VJhWdTO5LMMdiN+XczmRRbMA3hBMcgMTwWfzkDhK99AXX0?=
 =?us-ascii?Q?DDkL3eq3+J86FAVYJ9swfPPTdKf3VzRuB0VXtEn/+YUYNPFK3630qO3saLvV?=
 =?us-ascii?Q?ba2IHPkD/ETnN431KfBmWxHTAp2AM0RAmFinPSMtstbf4BY/gge0IVJpv23P?=
 =?us-ascii?Q?S/V8cZWq2JBaaCQlbELyNBini+Y+5XsJKW7yrFOkrNL6/6HVVn2pGETpvghJ?=
 =?us-ascii?Q?SBfVebVKW17OndJgVa4Utp7KVZ4/SFTpmYESas+umxKFGjkxU5nI31iTQU7I?=
 =?us-ascii?Q?qq5wpZUjROC8RVqw6hGtyzsPWhDQ9bNhJ6x9e9bUN2lh4mOdKN/AbR69z31h?=
 =?us-ascii?Q?GkLvfx7f6C5RgjPHLX5BWtecHJL+qHPmVzsUk6gQ+CBjmKMQ548Xt4UvnHXz?=
 =?us-ascii?Q?VNCNfrQKXuGSBMj4lvLZ++RlnJ6A/sEMWVwIsdYHK8oQYUD5cTLS6tN0pyZ0?=
 =?us-ascii?Q?LdeOH5pvwBSLHHNNk18lv9iR8u06P4uIt10uIH3M6x3K05gKxwq+dHx7DlIL?=
 =?us-ascii?Q?ZY+yIv7s9eKHnd9zxiqnKNOE5vMeL7rl2soCi5Ak9niISUEnTccqJ0jeg2tc?=
 =?us-ascii?Q?M7FdIROXJp6Fq5EAWNEwqrsic2oH4TC1Ja9CIlYGjiachKspw2o76VkpuJrS?=
 =?us-ascii?Q?H48v+YOLkwBUxNZF1WfWRBXH9VQnC2HUisdXgaq+jan5sswA1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z8cwWiTtTFHUnw54/R5gg2ZNUW0Q/XkZTUVi8yqHts0szPtWfge4ZPTdACnn?=
 =?us-ascii?Q?XbePei0J3Mopzk5Ht9SDWYOaksy8pU5oOlNENr918PiIvGQtGeAMR1zQkqJ+?=
 =?us-ascii?Q?POTULqjRJ8WPNiDum+qjsFsGD7H021jgz6b0yanG7EulPMkwec1hjIcAhiAC?=
 =?us-ascii?Q?gTfHI7tRMslySA3DOS8hoqaUpT5+f713igwz2DMVBN8y456Js8lY4AVYSIes?=
 =?us-ascii?Q?3IKMKdSODfULQS5+UGUf/XCaIx2mmz+BeXKanqsmPmpgu1Kw096iydhvpzIb?=
 =?us-ascii?Q?g+d7zbucMVASNxHrMzs2pKq/XSYdvhU4swmsXleKwIHE9pal2qByoXFNGaSp?=
 =?us-ascii?Q?TxF0IjhFFJgA12pX+Fzz4HRAnLtHzfgQ6vXBNQC7ZnkedK4pEYRFcMoCydlO?=
 =?us-ascii?Q?bmYZOZjy0FdXTua6oyj4WQ1bXsVd+HRkGnJJ/p26aKDYXxpyitisdKxt+ikV?=
 =?us-ascii?Q?WyvNoF+OxRFcDyonPBWSYoX1LVOIuhTaeajX4rSP5LiabZdpQRLo6WGfVjtV?=
 =?us-ascii?Q?oLkyLL/ZIHowA0RvgfgLhYdXDFy+Q+039y8nmgC7iNJTT4U4AgUxGHjEXjJO?=
 =?us-ascii?Q?u/i1MDShO7U4tAM/Ls0d+elGOjR2djZ0rpS75AYy1DMTotYBEzVu8n73lw7J?=
 =?us-ascii?Q?My/WynfRDQZFZ3V8Q7JNQwrcX5Zv06nVCg928vBSfXAdaWEEsgB5jtx4H/i+?=
 =?us-ascii?Q?uyYBgI9reI9Buy35qAOvaLhMVyAVM7gABvV31FHXG+kRZzarQEWUwm/RvKsO?=
 =?us-ascii?Q?IbGmxoK5a7lRM+LzTRNFkj36knFFwiwNFfsMOOgRipBOZJRFBFcet1Rd05OQ?=
 =?us-ascii?Q?KqnBvUXqqXz94cplHKlhT+sO0juApS+nFun5Y9ZR62sSqWksPkohLJ8aUZ8W?=
 =?us-ascii?Q?4sSY7cQRS/9tZWfhbhJnLwyjSefywudAl9RxZVe/lvjiduTOWRnOoz9wPST9?=
 =?us-ascii?Q?ZxuTyLasgYEg+OV1C5YKKMOHxN4IA7E8fd8WQdmBdO0dWSxwWh/kGJh8EHVC?=
 =?us-ascii?Q?38Tcsg076unjEZNdEMDBGjRmG8/dvosDqk+Be3xVRaDt3WxUupxZtw4OUN2L?=
 =?us-ascii?Q?b1fEM8hvyxUZ7a5XaPn8vuuXeMwreEMbbNCf6WGbJgyPgOeXJO+3uwgYEGKe?=
 =?us-ascii?Q?N1RgLEXbFWaFgBHs+vOwlKOnXj3Jj3PmVlPF6ywwcelcMuTgEyXdDlOpXWMd?=
 =?us-ascii?Q?awFs+RtV6rXABMsQ92yYHvooPn1Gkz4yVWEfrNX9WFClwEiv+8iZToh035Dh?=
 =?us-ascii?Q?93nhcdedMKl2nxEPATZRxk0A3u/HPEMMnDKtI2hjU6FZcNcHZ+ZXkf3E+48o?=
 =?us-ascii?Q?H46HGrXhb69mv4lKTuI54JRT/UTC1vc1SO2rLL9TpzvR98xMioY4pv7WhAf5?=
 =?us-ascii?Q?moz3FSeUytG0XbJVK3G7M70oakyS/9fq7uqMz+HdNoiUvTQmHae5utmnay8z?=
 =?us-ascii?Q?Ji60DxswmrtaTRCyQCDpSQWdnc/Gvj+zcOCG9KcxNwB+skoMreR7xyEmz+2p?=
 =?us-ascii?Q?/PjnSojRSDHtkpBsYCayJIrLmWeJksi53mlR4aJxQMSic2SyTOFylPROb6zZ?=
 =?us-ascii?Q?jifQru5ngw4SJOP4FPJxa3gVrM3EGNbTgWH7EvDzRgXbb8W1K0120+4HN6Nq?=
 =?us-ascii?Q?djAZ9h/P28dREDc+lPIjlIE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f2b87e1-e9ff-40f3-bd34-08dcb4e74ab3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:06.4494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QPn8vzNl9xojkBK/4/5ZDWmKA+4y160R763xy41ZsdRlHCZ34qbZT78JKyEhAHiH9QrTJZ60If/RffNtNGti1/lAUjJkGJ53SaoZ+9v7IVcQrU+b3NUBJZg4xo/jmbtE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: O47QSKJBV4POJYXRVMPCLXYHJPJ63MAL
X-Message-ID-Hash: O47QSKJBV4POJYXRVMPCLXYHJPJ63MAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O47QSKJBV4POJYXRVMPCLXYHJPJ63MAL/>
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
 sound/soc/codecs/cs35l35.c     | 2 +-
 sound/soc/codecs/cs35l36.c     | 2 +-
 sound/soc/codecs/cs35l41.c     | 2 +-
 sound/soc/codecs/cs35l45.c     | 2 +-
 sound/soc/codecs/cs35l56.c     | 4 ++--
 sound/soc/codecs/cs4234.c      | 4 ++--
 sound/soc/codecs/cs4265.c      | 2 +-
 sound/soc/codecs/cs4271.c      | 6 +++---
 sound/soc/codecs/cs42l42-sdw.c | 2 +-
 sound/soc/codecs/cs42l42.c     | 4 ++--
 sound/soc/codecs/cs42l43.c     | 2 +-
 sound/soc/codecs/cs42xx8.c     | 4 ++--
 12 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9fc9d7..133b38108ebfe 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -512,7 +512,7 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 	 * You can pull more Monitor data from the SDOUT pin than going to SDIN
 	 * Just make sure your SCLK is fast enough to fill the frame
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (params_width(params)) {
 		case 8:
 			audin_format = CS35L35_SDIN_DEPTH_8;
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index cbea79bd89808..a3c49b5760c2e 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -891,7 +891,7 @@ static int cs35l36_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_FRAME_CTRL,
 				   CS35L36_ASP_RX_WIDTH_MASK,
 				   asp_width << CS35L36_ASP_RX_WIDTH_SHIFT);
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 1688c2c688f06..1ef19481c12d9 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -777,7 +777,7 @@ static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
 			   CS35L41_GLOBAL_FS_MASK,
 			   cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
 				   CS35L41_ASP_WIDTH_RX_MASK,
 				   asp_wl << CS35L41_ASP_WIDTH_RX_SHIFT);
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 2392c6effed85..114b4ffbfeede 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -741,7 +741,7 @@ static int cs35l45_asp_hw_params(struct snd_pcm_substream *substream,
 	else
 		asp_width = params_width(params);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(cs35l45->regmap, CS35L45_ASP_CONTROL2,
 				   CS35L45_ASP_WIDTH_RX_MASK,
 				   asp_width << CS35L45_ASP_WIDTH_RX_SHIFT);
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 84c34f5b1a516..5ead5d568d05b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -468,7 +468,7 @@ static int cs35l56_asp_dai_hw_params(struct snd_pcm_substream *substream,
 				   freq_id << CS35L56_ASP_BCLK_FREQ_SHIFT);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(cs35l56->base.regmap, CS35L56_ASP1_CONTROL2,
 				   CS35L56_ASP_RX_WIDTH_MASK, asp_width <<
 				   CS35L56_ASP_RX_WIDTH_SHIFT);
@@ -557,7 +557,7 @@ static int cs35l56_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	sconfig.frame_rate = params_rate(params);
 	sconfig.bps = snd_pcm_format_width(params_format(params));
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		sconfig.direction = SDW_DATA_DIR_RX;
 		pconfig.num = CS35L56_SDW1_PLAYBACK_PORT;
 		pconfig.ch_mask = cs35l56->rx_mask;
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index 69287ba7e9558..1095cce0ecff3 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -410,7 +410,7 @@ static int cs4234_dai_hw_params(struct snd_pcm_substream *sub,
 		dev_err(component->dev, "Unsupported sample width\n");
 		return -EINVAL;
 	}
-	if (sub->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(sub))
 		regmap_update_bits(cs4234->regmap, CS4234_SAMPLE_WIDTH,
 				   CS4234_SDOUTX_SW_MASK,
 				   sample_width << CS4234_SDOUTX_SW_SHIFT);
@@ -477,7 +477,7 @@ static int cs4234_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 		 * Note: SNDRV_PCM_HW_PARAM_SAMPLE_BITS constrains the physical
 		 * width, which we don't care about, so constrain the format.
 		 */
-		if (sub->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(sub)) {
 			ret = snd_pcm_hw_constraint_mask64(
 						sub->runtime,
 						SNDRV_PCM_HW_PARAM_FORMAT,
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 78ffb7fa7fc5f..2a0121287b753 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -407,7 +407,7 @@ static int cs4265_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct cs4265_private *cs4265 = snd_soc_component_get_drvdata(component);
 	int index;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	if (snd_pcm_is_capture(substream) &&
 		((cs4265->format & SND_SOC_DAIFMT_FORMAT_MASK)
 		== SND_SOC_DAIFMT_RIGHT_J))
 		return -EINVAL;
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index e864188ae5eb9..b31d06ddb463b 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -351,9 +351,9 @@ static int cs4271_hw_params(struct snd_pcm_substream *substream,
 		 * registers every time.
 		 */
 
-		if ((substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		if ((snd_pcm_is_playback(substream) &&
 		     !snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE)) ||
-		    (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+		    (snd_pcm_is_capture(substream) &&
 		     !snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK))) {
 			ret = regmap_update_bits(cs4271->regmap, CS4271_MODE2,
 						 CS4271_MODE2_PDN,
@@ -408,7 +408,7 @@ static int cs4271_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	int val_a = 0;
 	int val_b = 0;
 
-	if (stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(stream))
 		return 0;
 
 	if (mute) {
diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 29891c1f6bece..92a110a841e13 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -78,7 +78,7 @@ static int cs42l42_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = CS42L42_SDW_PLAYBACK_PORT;
 	else
 		port_config.num = CS42L42_SDW_CAPTURE_PORT;
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 60d366e53526f..a06a0ed8ded49 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1033,7 +1033,7 @@ int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 	if (mute) {
 		/* Mute the headphone */
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			snd_soc_component_update_bits(component, CS42L42_HP_CTL,
 						      CS42L42_HP_ANA_AMUTE_MASK |
 						      CS42L42_HP_ANA_BMUTE_MASK,
@@ -1106,7 +1106,7 @@ int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 		}
 		cs42l42->stream_use |= 1 << stream;
 
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			/* Un-mute the headphone */
 			snd_soc_component_update_bits(component, CS42L42_HP_CTL,
 						      CS42L42_HP_ANA_AMUTE_MASK |
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 92674314227c4..e2345e0cfdebc 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -426,7 +426,7 @@ static int cs42l43_asp_hw_params(struct snd_pcm_substream *substream,
 			   CS42L43_ASP_NUM_BCLKS_PER_FSYNC_MASK,
 			   frame << CS42L43_ASP_NUM_BCLKS_PER_FSYNC_SHIFT);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		reg = CS42L43_ASP_TX_CH1_CTRL;
 		slots = priv->tx_slots;
 	} else {
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 9c44b6283b8f9..7f619ee811836 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -262,7 +262,7 @@ static int cs42xx8_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	u32 ratio[2];
 	u32 rate[2];
 	u32 fm[2];
@@ -350,7 +350,7 @@ static int cs42xx8_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 
 	/* Clear stored rate */
 	cs42xx8->rate[tx] = 0;
-- 
2.43.0

