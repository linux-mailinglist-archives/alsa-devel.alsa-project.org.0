Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBA9A5797
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F091DF8;
	Mon, 21 Oct 2024 02:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F091DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468960;
	bh=gb8047m6aUcDhBvJPYS6TSjIVhl4bb/0b9SN+1QCZQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1mbtfrVn/5yZLBZYxfmnx6wtlTbEF8J4+Her400cGh56gEWnVkYUk5H0uIRRj9aL
	 LtCwt6uciBl0pLcHxY7rXUsPEko5fkQaMzk7V7MIi3lnoK2Lr+SYjVoeP8xzqfOKWL
	 4j1SSqzobKQjx9/fZkPSsYNzC3B8MndGAwAGrYy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B35F8075C; Mon, 21 Oct 2024 01:59:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB70F80751;
	Mon, 21 Oct 2024 01:59:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30F2EF80606; Mon, 21 Oct 2024 01:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 736E0F806F7
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 736E0F806F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BS59L8qO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8cVgzeyn18INUgXB8LSuerfpDvHvHVcsRjL6gedIyiAtw1AGMvLWCbnCLMONmwavOG06GJTI8O4s5P13lO/Mt37tskc13UdxYjB2uV872HWUEEhRQZZA/PSA9GUFMFqSSlSBuCr9hymkN+6uL8gLaZ9IGpBThYnWzA6q167xHjaAOSzJ/So11iwrGMw66GsYSwZ0nkOS8B1Olox5ELe6x3Q7FUL8S/RB0OuxrRILTTAnPCg0EaEzK7s2KESPuKNGQWljvOwUa5LyZXvO+5zmJgRLS92R2Qs1D7GnFKtECBoUdXhD9DRoYZ6+Gyj38jBMDLts7O9LnKx+9nFfz4PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=UmiWRJmupLAQr1VARXdZt+p1oweWs41q/BsZbC09Gzdkt7kua2R3qtviptgwuLyUmSRkfI74xyGbw6tM2UI9QBHLbhcQQ90MYZkagiXgHcPo+yMTV+meDjsMNp4yitIoTCv+GaVihV4CPHKrbyRg4+U7PxMsBya5vha1repUS+3S78VC7cMpeDoYSO53/yAS1QBX0lTqk7xaKw4DPypUZha6qRmftBabVY8GSSXM4a/3m8Nhi4YeQUksf4UFUyuZ8K0JMN7XcXVFS+f5sn0D5UG8gnzvQpJlQXXW1xYv9CiicJrDYBnE4UjtFxHZxvi8IpEo0Bjc+MCeftojZfTHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=BS59L8qO7GfA7vQEM0sEDKbtf9nfkChSD+cNrrExHojN+w6QbR/pwIIHvhTjUM/eZ6elv+ARtl1KH6kXIT4mk8fmy/+0TaCE9zmJgHRUMg401XVAvPDJpbGuo3z8yJwa0C3cvbU9LIkPyQkhy+gO3SPh1FQsjn4bp0diiApZmPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:43 +0000
Message-ID: <874j569vgw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 12/13] ASoC: doc: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:43 +0000
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f37e3c3-fa2a-4051-202c-08dcf1634492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ATudatbbk+LYivnVFGelVHq29l4W6mcxJPL7sUwz+D9UdAGgGDR3/RzrPAKY?=
 =?us-ascii?Q?wGtC5AAMQFS9OAVH3gcAtrivUBb5YVafUr+L8V/E7JZDoCZKuYVgQ7qa+DxF?=
 =?us-ascii?Q?3yWYgUoyV1pJcW/Q8+CjonUC6gl6xQ+vryw8Hvn9A94eU0RT9qvk82hu2L0e?=
 =?us-ascii?Q?7D7CqA2QoIWoAVgqIEeNaPi6TUzbNMJ4ZDO7/BXSsIgxi6SygiqdF6HyvIGC?=
 =?us-ascii?Q?W0HSRr6/MtbkdR3/uxA7yc9VPJx/XcH6LU2laS8I/sgcDHdOr7hD6oo+QMEr?=
 =?us-ascii?Q?Uh9Muq4a+O/VcUBojMOXggZoqeW4sQNwudfQmX4XfwljnXQVwT0mZu899I2t?=
 =?us-ascii?Q?F+s/Yo04ysX9a+s3H+a1kUCI8Gtvbs1X/nAZJU2Rnsw6QngnxzObj+j61HvG?=
 =?us-ascii?Q?bsQZ4xpVq6LECQginGKWseoYgoPcYxJe1fQ3FLPCZIElrRMEeL6brIkT2it7?=
 =?us-ascii?Q?F+8w8GJSVJ0AKvZdBv2SiAErl2rR+ha0ohgDXDvahRQ6LjFtINbe/y7RzYSi?=
 =?us-ascii?Q?UxWT41cEbpCCiwj685nx17xhYejnaNXfOmtP7tLBDkCdLklor0gWq+LHbQkB?=
 =?us-ascii?Q?YZOA37A8f8Hht8hbWOxVOnTVHV2Sx16v1AUqmWavqJIW8X3EwL/I91x6j3wW?=
 =?us-ascii?Q?SapsU3jwvn2v1XeDZoXIh15o0SbeIzwlM3n5NnYOqFVNp2h5KUgHy6AkTy4F?=
 =?us-ascii?Q?ktWKbtwprFebbGCZamwyQqkRBJBVI/I8UEx5xnOVsRIwXGp8VSFQZ6ECyFCD?=
 =?us-ascii?Q?1QANgj840qdg8GhDljKrwkaE/++xDCniTOCKjdkYtS2+LiDmVtnUkECadQwZ?=
 =?us-ascii?Q?5/2dvLQzrdgp77am9JV4hJBawW4hqk85XHI/vJ2CzccsnXjilPxBUdVXhhye?=
 =?us-ascii?Q?jYj1uY47OyQUJRorPDY3WX5Zy2MhNkQ5lyq1lvD5EUJAdAOjxi6n4Lfg0GNL?=
 =?us-ascii?Q?BTIAyG9XH5ONoYlctXQavFZM1pz4UYuihaIU0iqSfbDIT1CkBzO8g4zDLa3S?=
 =?us-ascii?Q?veOsXT+U6PI1H7plWvxXix9Ky1JIUXWZ7mKvIGIynHJKoFfYU53fB2CDmCvB?=
 =?us-ascii?Q?uAyzQwq8OmfZwb7XCCtQOZ9NHq+ovqRV9jan5+a/CO6pqnYVyMQ6n6AWqLoj?=
 =?us-ascii?Q?pskOv9sy+fMoqjEciSPwq0PnRtW1jU0l+rzkN1J6jmux6x732sBv6VwPui1z?=
 =?us-ascii?Q?qA/wJoDacfWTtXHLyUy+HWjWvJAG1Vhmr34O0rzyOJyoYeW0a/ioA4ZQhed/?=
 =?us-ascii?Q?U6PWSkT/qZtD4IH8qQ8V0TQsmih2/noidDSZd4EezHIG1Fj9b6jV+jMfEHpq?=
 =?us-ascii?Q?3S/DdYrBgpIyhuJlAPXzD3uZaQ8NSccb6uoBUVafcMujzZQJS1afNzWV5hkP?=
 =?us-ascii?Q?65N/hzU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knIg2K8D0Rme3+1rrS2zRboNuLVM9qQYwTo1jAQR7g8TiOlwjuJPiqf/vHlM?=
 =?us-ascii?Q?aZBhW3mjJ1OW2HFK1mcMRmT/PCjDWOfTH3T2Tpipt9FYLbyEAHM+gjlXGUu2?=
 =?us-ascii?Q?Apo+2tMIoijSlpLq0KHPrvwh5unBsauGpYM1VvbDz3vw5eEqwuxvDPuiDKrz?=
 =?us-ascii?Q?7PkWTWbIeUhepc8yotkIyuIWHmHFOfKQg1Ov1eCAJ45W86CX9crYveTDbBUm?=
 =?us-ascii?Q?TkSV8OOOG+6P6bVuQk8nVkz1aW/V8YajCWAETWRpi2IVPZJpDRbAVMJf/2oc?=
 =?us-ascii?Q?aMB3js8PGpTqvGajvKzS3Nmn1SelycBMeeE2ETXnlY1bpoI0zMhCwblK366Y?=
 =?us-ascii?Q?bSdy3Q3u/WWQI4M35kvJVfv27Q3xjBICNpx55YKzQezo8NlWADTCJE9O+7eQ?=
 =?us-ascii?Q?8obQf3fds8q9bkFFxs0GmD1x4KEbDD6ZRpwDZvsL7adc3OkFJd+6GUjM4TZT?=
 =?us-ascii?Q?Ypl+HSXL1L0RCqyKGCUcu+QlWOQicJWookUi8QU+Z4tUpZJmCGhRcqht56nQ?=
 =?us-ascii?Q?/zedIw/zd3/7DAybGS04Hr6G28BHS6QSCOfOCfJ7oM/FuCNHwTC1YS6rf6a8?=
 =?us-ascii?Q?o3XQYRH02BAd+MZTMcixDIjnC3hE+Y8pmyGH+blj+qyb5i8l8SlqdqkVjZqY?=
 =?us-ascii?Q?IySI/gqgJveFHjOz5bX+UnDVaRCy7gXfmAVb66cHobyh3EcR8ERUJ4nEaKrI?=
 =?us-ascii?Q?UyL47u2/6hnsQOs9NxVsvAZWZNa8xWx0SDOStimdNXz1IbOoG8l8Uc1rOVIR?=
 =?us-ascii?Q?xiHNjC4L5iHS+lvJfEjtzYpIzu+qmBU9XerHDAsNge8MQJ6QQJeHHq3oD1UW?=
 =?us-ascii?Q?P8Ydd1qnbfTSbb/l5cwCaf+nbjS1p+Sb2NnBhvPwAYu3+J4ZBwx4L+eMQ4e3?=
 =?us-ascii?Q?IIm4moIg7H8CgvrhWKyaAmjVJAF6Nv0uPkWsaGuGU2SUpsYpd6nmymP8C8jR?=
 =?us-ascii?Q?QfT1RaRcP5S4h9oD1ahLo0DZdH/OSGdIj6VAUjBeiKi8NndIDlEjC3VLGN3e?=
 =?us-ascii?Q?/x7cMQ480v7+HUKgXiFtf4r316EwW7Hw/GtxOtWgWOip5LZswWzeHm0DuzI3?=
 =?us-ascii?Q?7y16T7TNUcV2t3G4bhXBSdxwJkJA0GggALxxSTl6xPl601g8XMn0LcFc98vR?=
 =?us-ascii?Q?6q+y0SENY9ePFzE03koidXelBRTTe86ta8FBmdDYk3n0iaycYATZZll1P4x1?=
 =?us-ascii?Q?EFaJTaAT9qCQIQog/s8pi/KDZ11TuyHUrE2DpGhDygoWCeNdRLPtKQCUFIAl?=
 =?us-ascii?Q?WL+27R/KhQQx/WPhDNiXcTqwEOzSMUgHATnQYi3l2DeB7V12Q/pKXGV6UzKK?=
 =?us-ascii?Q?nmmWxx/GjwrWrwqouH3CiT0NbT8OQOCzUnY9MqbtS+2ijkMisEXXXtfzQ3/Q?=
 =?us-ascii?Q?u6yGCgWSVmMoHgEZXRTX5i01HevNaEQXVU71IQEMbL7LoBMENP7EchE3uHSk?=
 =?us-ascii?Q?yVmfarHmLiCrF7Qy+vMxVilR506ZIg9nPxFTl6uwenxbeN//0uF3Y2G/dkjI?=
 =?us-ascii?Q?sZF42ggEHqFBpy4jtmwrBSo3UQN5nk5EIOIUTpc5Ig9Eg4hTim426ZUMLXlg?=
 =?us-ascii?Q?Fji961LPr+TVMXPc8EhcOYOfbN5KMT2Kgwse1CSjotZpNMIsGFbRbesk7z2Z?=
 =?us-ascii?Q?0K5toIo3OnAfjMyH0gyk19o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f37e3c3-fa2a-4051-202c-08dcf1634492
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:43.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eIsFHXKu7ZJ3r6rjdTuiKXB876mctjm7rgwosIfDNWV9mI63i799s21OUy+g/ZkvRp5Zgb+qPPiUi+LogpdzSYSgvNJhpN/KqtebTFgNFRvhBtwoe0u+Alf++pBjqc6D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: 4ACCIJKPFYLMKMYFDZKXP5FHMXWPZWGZ
X-Message-ID-Hash: 4ACCIJKPFYLMKMYFDZKXP5FHMXWPZWGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ACCIJKPFYLMKMYFDZKXP5FHMXWPZWGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d915043..02419a6f82132 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,15 +157,13 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
+set the DAI link to a DPCM FE with the ``dynamic = 1``.
+There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
@@ -189,15 +187,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.43.0

