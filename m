Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DC8D13A4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98312A4D;
	Tue, 28 May 2024 07:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98312A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872818;
	bh=gVxCSNNWanWDEHbZ1oQA3Tz502dkOPb9WIpb3ZbBI/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AG4DjnJhYuq3yZDvMEGuy64LBGYgKkCWdsGML7oHUBbVTAzAPzzBOJi5NgKpKD7CB
	 8dp3XpSpz3PA5M2Wgxsfja+/TauulhL3ao1lFB9AOpfhMClDMKTs25GhLcMxpshKUG
	 0Mc3uregBWxoQAkPhuWNnABJm60JYGIWQB353OH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F6BF80631; Tue, 28 May 2024 07:05:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F0FF80621;
	Tue, 28 May 2024 07:05:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C34F80615; Tue, 28 May 2024 07:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B12F805F2
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B12F805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RYJ6cdUF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVFrrnpoaKFvKK3wz4OVOxCwxD7Cy9HAXVa2ygTIo0+0CVrHA99ho4YuX8CxiWXN2fQ/syLMYi3HukR3WaJb/lJ+NCfFpvwqQm25oud0o5VAV1tOQ4q+ggxpYxCYc9MURrT4sD+JN20wNEfY/+BYQrNCOpVv4+btKYmOL2CnBz/a1v/nL/34WciO89MEm8K9SJTec8tzoaFB6EBX7xpAksMkwyudUHCAjKu5LtyvHcxpRxhPukaT3lSGzykwVeT6a0J1yi3QotM4MCZtIvnbGZCAWurhtA0m2FjKT4UY2PyJRKLTkyg3+n/V+IWwIlwxaSooCb5cpfMC6lzFL7QdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGmTkOHjssSgQt1f+aWvM6PYhtluDT9PBlSTSx+gjag=;
 b=JvvBVX/bbGdij1ZGh8TaMoZ7DCgD+toYIEYs2ukqLCHN3SMYL3nlvLDPR0pkfWULyzNXLIwjt6IOuJW/t9G0pMon9K3LWbzDsK5tA/AJpnqTbX+vWQRgX6ykxLoKQpOgwdC0fNKCAOHVA4WwPzpbQMZHD3EivsoMuEYZWPnWkOl/UteIGTWJpTTywUUi3sMYvIh547rOazvPxSTic0B1YioYu+IpgxN5sGf+9Ty0QPMHRcvn36D5IsVLAbo8/HOdHADkZ7RKH41BUct+sjObsyWrHmzjfL9Cp169Og/xdj2pqch99GlfKzesQGV0OYL7nGZRz9XosIcUL+mHxS7zjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGmTkOHjssSgQt1f+aWvM6PYhtluDT9PBlSTSx+gjag=;
 b=RYJ6cdUFlp8aNqINL2hzOu2B6evRnBrfmkFX++dRHX8Ftyxeb1YvlGYSCAQ32xsCU0ji6zz4QkCVbkOx/GWRLhvHNB1qBRoDsBM/Ug6KESIguxI3XWblnw4nLVZovT4z/h8zapWLDm5jh2TZTAN9UoK4ndk0AtjGB4pj9GWgUBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:28 +0000
Message-ID: <875xuyh6g7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/11] ASoC: audio-graph-card2: expand dai_link property part
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 May 2024 05:05:28 +0000
X-ClientProxiedBy: TYAPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f34102e-257e-4d77-b1ff-08dc7ed3cab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wULRKkdvjMNkhhE35o+5KIjdewyn+GFw5BuPwWcZWqXZFDrhkN6Dnsieoiw/?=
 =?us-ascii?Q?vD5kIgMRMTWf+MkvWi1JcEZo6VfrXh00UcebOIsn/ONJZjQi13RTW9ZrjrHS?=
 =?us-ascii?Q?ncDyR4lDxxQp6cXwOl/VvZvTSPSPeYn4z/1kf6tlC4RHB3esZn9Z2A9LsM5N?=
 =?us-ascii?Q?5IOpdhh5M6uyQzuVJgOoityGPNsCdXrAiuXmw2WIPh2zWE/Z9g3rRaZ0Z/5U?=
 =?us-ascii?Q?CR5YYaV9PUpsGWz/etQEUlaeu4x8GjoSiUCLDIM+jkFl7NFkYXDYJWX9oZF5?=
 =?us-ascii?Q?1jZ4CLRsoUoZTG6PnSBHgziMqdjAX/j1VOPaJvJn8KtcWQQxatBN4k3Uzzwc?=
 =?us-ascii?Q?GT+PLcY1FsuzLDlXAHZkL+fV+wamN/5KpQVqOIBxY+9eHH0hs3Xw3R91v8O2?=
 =?us-ascii?Q?ZIGPFqHPcofhM8uDf05KB5QkDooDOvFl1F8yLe6VYuxspLJ2RXVirY4wOZF7?=
 =?us-ascii?Q?Dz3fPD2snNN1wncJhWY5mlRgsYhrRYjkfuOAI5a+BtQGQU8hh8wWCOC8alBa?=
 =?us-ascii?Q?lR28UoKxk2ABzWxPlL1oAL6YKXlmukqfyE7ig9TTerqoTinAmC9lVS1wcT9d?=
 =?us-ascii?Q?tbNUOQhogazq/NwjDQch7UsL3DrZ9zBHZ0WNvdIUW9u7rAFfP+RADYu/F5Vx?=
 =?us-ascii?Q?GM5/cjoVIQD/z3GMhtDegVpVZM/4tZMDHTCPjYVxKX3DdjJKoluAII2fKFB4?=
 =?us-ascii?Q?CHYF8g86ZciwK0KyxsO6C9bmBKGLwJSslG8azSLvFny31J5tUl+FAACZCMah?=
 =?us-ascii?Q?IXOicpCmxE3IjLKAYt+T80LO5rpvKvYcPtdcnFsbHTcZ6hTf4wLQp0inRR+w?=
 =?us-ascii?Q?sC6mnZnb0+LboHXEYo5/Lwmf2l0QdvHktNjHAEaEQWH3iRxcYm2Wvxxm5hmy?=
 =?us-ascii?Q?DTtzBx4nY3PagQROvOjb8xwr9FPVlU3QreVobyPkKpvTd6DUQeiLV3CWcDcF?=
 =?us-ascii?Q?wXXFv24mzTInQ1IM5qRrlrb6/+edkl5+O4ORVRH/s7Ho6wXFc8N094yCQbKM?=
 =?us-ascii?Q?leCccc7skf7ZjpIXPewopsRpm1lfkACRC4c/G+ZlAMfM9x3eFmsM0srLFEH7?=
 =?us-ascii?Q?GJCnU6D3xjny+OTTZ6BozUzPYoMYkaDeCgL9Xy8VZkc5aWYjN/k0c1nwT4PY?=
 =?us-ascii?Q?3HqvJ3PD1asb8p57l1eBoAf42a/JSvLcBNgWwR66kEl4CLYzXAam+a6fBUeD?=
 =?us-ascii?Q?bZ6yYrebvJBkr07aOwFAknrmSu9EObE8sdYxbIdbdNGnDqg/joqiGayScB/Y?=
 =?us-ascii?Q?ZtsaE660gUdn4D3VBlV2p1oD7zLkiuXZqfE/enIBCC1HFvVzLI94SLRLCfBQ?=
 =?us-ascii?Q?GGQTp3uhZN+uZfKJXySdNVsUX7ILk2+45ifmmvHnQNjyRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2JFZzRT+D/nL6oP27BAlbFB2a4t9pVm4d6D80n+KuAdie6tESNuZG17ATVbO?=
 =?us-ascii?Q?tKIFME5Jb4h/07sPshrXZU3rsA2WqZo3h3VHxAYyFkU/FRynpmjOV+5ft8wk?=
 =?us-ascii?Q?Ur4TcisuGP+NjUElKDl8IiUY7ktbgXS4t2xgxuIj5KlDDqb7rfenOscvCiCv?=
 =?us-ascii?Q?IiCJZCp3tA8vOyatj9bCuL2uSXbZFges1wZtIwwqS0QzIDhNUVrC151qBGzF?=
 =?us-ascii?Q?+S8xHzM9jztqB5azvQzeOuYg/qqfSGaznyVu/rhrkS0ABeA4wa4QMt+yAelT?=
 =?us-ascii?Q?6QGm+7H3U0VH5fOCEbObzVtchnCx8qlyKCYAXoJKdwfzmzvSLIeHrZmZCZGH?=
 =?us-ascii?Q?lsMFVaVZz4RSgFVDZqpplE00lUcvN0eJ8Q4pmWhdTaENzRzZEaAtUz1vcBzq?=
 =?us-ascii?Q?YIOVODDf7n+ntntCoJwWLKU6qJzYLDKMVjk1eAJQYKMfoWdh7DxGeeLtN+Ka?=
 =?us-ascii?Q?n40Ib9O152v2G7AnqP5cZDhSAtgUieK0y+eorOudwLPtRe8dZUFtN4dWL1j+?=
 =?us-ascii?Q?7JF1OyPxgDoCPxX2pfa42GIyRO6ReBUbVXYG65ZQntJ4WCxIavIt9vuG1col?=
 =?us-ascii?Q?hLUiVkGBSFkddv/rIqZaKydmdfXOt7Faqp87USmsux2Be1kCsdVIhkQzkq+G?=
 =?us-ascii?Q?sYhDvxPOuay52s/+Rd0V8rBA9XVTYUV+mgiV7Gz9FuM07NoA624wUwEJ9+nf?=
 =?us-ascii?Q?6tu6nQNprfnGeFbOn1UCDmG0y31GodLvDH610pncSZY4xzbXtU053L9Nz1O6?=
 =?us-ascii?Q?IDyg0lpNK2lA7AgX4dejm0Aj3Ue/EB9LG6MpYLFsXoOPVI78Ci5Nnar4zVfF?=
 =?us-ascii?Q?ENEJMlWgRMzUTkWnbwpOSVJtfKStgWqfG1ISeu5Y5MDa+vmSQF1iei/yHQE6?=
 =?us-ascii?Q?UnVKprzxaJWBNqoeycJENCil9R4B+nnY7d/OHgxFh5lRFqvW7pO77Z65FAHG?=
 =?us-ascii?Q?42rY8bCDrkpSUmu+CSe2TBNrntjtzqKNFm7ecrt83R1B42++/XYIUzxZLaOI?=
 =?us-ascii?Q?vV9y8DVRM+zcdo/FZI82Tv3u/7/wEOJ2MgtSxwMNh8+bnIrnk4cjk+rHZ7/c?=
 =?us-ascii?Q?J6reK+2JpVq/fFlvIOgijGgd+pO7HvzECMb+nFs2gceSV/xPVw3dhG+udd/j?=
 =?us-ascii?Q?4Jz4xAnVOfrL5pW6Dytf4RH0k8c2s584WRc68xzKjPh2PgNLMy65RAl8qLeU?=
 =?us-ascii?Q?ekLxWVRtVYQHdnW+2gM666wHwBxvc8lUc6TTU5ZBghrMivMlqu+Ml9Qw59AG?=
 =?us-ascii?Q?w8HEaJGk7QOFv7jZtnwT5qcpskGoKvujEsSPkVCePA+t66HgJAsz03DmEsVe?=
 =?us-ascii?Q?polmtRldK3VowZiZtZDM9qDlONV8EddOL6/q2uW4fmjc6ZA6wnZsCP4lqc8l?=
 =?us-ascii?Q?8+HQMpCAEuKN7THWVkn+nEwQeRlkYdznbzyYJqZTqAVSimcEl044QsrzXqkB?=
 =?us-ascii?Q?JGpeqI6BhplAYkeem2KN6wwwXZEBskQ3VNV1OpjfvYMaHW0fMD/ZYVcfZ3ml?=
 =?us-ascii?Q?mq1JARVZtR9qECflpx2S7yvY65KleKCRgmja2tilhghKZBgkP7sr6XXfrgYB?=
 =?us-ascii?Q?0K62NPtFf8mnsJqovpScBo298zgEQchzolsyY7rO/dV92b8CwPUomANeeUp6?=
 =?us-ascii?Q?5/byqeclr3u//zOLZre9+P4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f34102e-257e-4d77-b1ff-08dc7ed3cab3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:28.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RuzYgAHbO5Xq3PLU+LqswfhhseUiU79anFwfZ4Yb4xM9GJTJ+mgMrWbS5zYJT7oZ7e9oVj8pGPzRag8H+kfbw3rI+tYmEAGzt4vQwUGeZH23nQr/atA/ALQhuO0Dakpd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: FHJ6K6VSQU5YLN6J7ZLX4RNPS7LBWKZI
X-Message-ID-Hash: FHJ6K6VSQU5YLN6J7ZLX4RNPS7LBWKZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHJ6K6VSQU5YLN6J7ZLX4RNPS7LBWKZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current dai_link related property are parsed and enabled only on CPU
port node (A)(b)(c). OTOH, Audio Graph Card2 supports many connections
like Multi-CPU, DPCM, Codec2Codec today. For example in Multi-CPU case,
it will be checked via (X) -> (B) -> (b) process, but (X) / (B) part
property is not parsed.

>From dai_link related settings point of view, (B) (C) part and Codec
port also enabled is more viscerally understandable, and useful.

	card2 {
(X)		links =3D <&snd-cpu	(A)
			 &snd-multi	(B)
			 &snd-dpcm	(C)
			 ...>

		multi {
			ports {
(B)				snd-multi: port { ... };
				...
			};
		};
		dpcm {
			ports {
(C)				snd-dpcm: port { ... };
				...
			};
		};
		codec2codec {
			...
		};
	};

	cpu_device {
		ports {
(A)			snd-cpu: port { ... };
(b)			mcpu:    port { ... };
(c)			dcpu:    port { ... };
		}
	};

One note here is that if it was Multi-CPU/Codec case, 1st port only
enabled to have property it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 95 +++++++++++++++++----------
 sound/soc/generic/simple-card-utils.c | 13 ++--
 2 files changed, 66 insertions(+), 42 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audi=
o-graph-card2.c
index 3029e8ebfa222..bd714a6f74e61 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -763,42 +763,55 @@ static void graph_parse_daifmt(struct device_node *no=
de,
 }
=20
 static void graph_link_init(struct simple_util_priv *priv,
-			    struct device_node *port,
+			    struct device_node *lnk,
+			    struct device_node *port_cpu,
+			    struct device_node *port_codec,
 			    struct link_info *li,
 			    int is_cpu_node)
 {
 	struct snd_soc_dai_link *dai_link =3D simple_priv_to_link(priv, li->link)=
;
-	struct device_node *ep;
-	struct device_node *ports;
+	struct device_node *ep_cpu, *ep_codec;
+	struct device_node *ports_cpu, *ports_codec;
 	unsigned int daifmt =3D 0, daiclk =3D 0;
 	bool playback_only =3D 0, capture_only =3D 0;
 	unsigned int bit_frame =3D 0;
=20
-	if (graph_lnk_is_multi(port)) {
-		of_node_get(port);
-		ep =3D graph_get_next_multi_ep(&port);
-		port =3D ep_to_port(ep);
+	of_node_get(port_cpu);
+	if (graph_lnk_is_multi(port_cpu)) {
+		ep_cpu =3D graph_get_next_multi_ep(&port_cpu);
+		of_node_put(port_cpu);
+		port_cpu =3D ep_to_port(ep_cpu);
 	} else {
-		ep =3D port_to_endpoint(port);
+		ep_cpu =3D port_to_endpoint(port_cpu);
 	}
+	ports_cpu =3D port_to_ports(port_cpu);
=20
-	ports =3D port_to_ports(port);
+	of_node_get(port_codec);
+	if (graph_lnk_is_multi(port_codec)) {
+		ep_codec =3D graph_get_next_multi_ep(&port_codec);
+		of_node_put(port_cpu);
+		port_codec =3D ep_to_port(ep_codec);
+	} else {
+		ep_codec =3D port_to_endpoint(port_codec);
+	}
+	ports_codec =3D port_to_ports(port_codec);
=20
-	/*
-	 *	ports {
-	 * (A)
-	 *		port {
-	 * (B)
-	 *			endpoint {
-	 * (C)
-	 *			};
-	 *		};
-	 *	};
-	 * };
-	 */
-	graph_parse_daifmt(ep,    &daifmt, &bit_frame);		/* (C) */
-	graph_parse_daifmt(port,  &daifmt, &bit_frame);		/* (B) */
-	graph_parse_daifmt(ports, &daifmt, &bit_frame);		/* (A) */
+
+	graph_parse_daifmt(ep_cpu,	&daifmt, &bit_frame);
+	graph_parse_daifmt(ep_codec,	&daifmt, &bit_frame);
+	graph_parse_daifmt(port_cpu,	&daifmt, &bit_frame);
+	graph_parse_daifmt(port_codec,	&daifmt, &bit_frame);
+	graph_parse_daifmt(ports_cpu,	&daifmt, &bit_frame);
+	graph_parse_daifmt(ports_codec,	&daifmt, &bit_frame);
+	graph_parse_daifmt(lnk,		&daifmt, &bit_frame);
+
+	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
+	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only)=
;
+	graph_util_parse_link_direction(ports_codec,	&playback_only, &capture_onl=
y);
+	graph_util_parse_link_direction(port_cpu,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(port_codec,	&playback_only, &capture_only=
);
+	graph_util_parse_link_direction(ep_cpu,		&playback_only, &capture_only);
+	graph_util_parse_link_direction(ep_codec,	&playback_only, &capture_only);
=20
 	/*
 	 * convert bit_frame
@@ -809,16 +822,21 @@ static void graph_link_init(struct simple_util_priv *=
priv,
 	if (is_cpu_node)
 		daiclk =3D snd_soc_daifmt_clock_provider_flipped(daiclk);
=20
-	graph_util_parse_link_direction(port, &playback_only, &capture_only);
-
-	dai_link->playback_only =3D playback_only;
-	dai_link->capture_only =3D capture_only;
+	dai_link->playback_only	=3D playback_only;
+	dai_link->capture_only	=3D capture_only;
=20
 	dai_link->dai_fmt	=3D daifmt | daiclk;
 	dai_link->init		=3D simple_util_dai_init;
 	dai_link->ops		=3D &graph_ops;
 	if (priv->ops)
 		dai_link->ops	=3D priv->ops;
+
+	of_node_put(ports_cpu);
+	of_node_put(ports_codec);
+	of_node_put(port_cpu);
+	of_node_put(port_codec);
+	of_node_put(ep_cpu);
+	of_node_put(ep_codec);
 }
=20
 int audio_graph2_link_normal(struct simple_util_priv *priv,
@@ -846,7 +864,7 @@ int audio_graph2_link_normal(struct simple_util_priv *p=
riv,
 	if (ret < 0)
 		goto err;
=20
-	graph_link_init(priv, cpu_port, li, 1);
+	graph_link_init(priv, lnk, cpu_port, codec_port, li, 1);
 err:
 	of_node_put(codec_port);
 	of_node_put(cpu_ep);
@@ -861,13 +879,16 @@ int audio_graph2_link_dpcm(struct simple_util_priv *p=
riv,
 {
 	struct device_node *ep =3D port_to_endpoint(lnk);
 	struct device_node *rep =3D of_graph_get_remote_endpoint(ep);
-	struct device_node *rport =3D of_graph_get_remote_port(ep);
+	struct device_node *cpu_port =3D NULL;
+	struct device_node *codec_port =3D NULL;
 	struct snd_soc_dai_link *dai_link =3D simple_priv_to_link(priv, li->link)=
;
 	struct simple_dai_props *dai_props =3D simple_priv_to_props(priv, li->lin=
k);
 	int is_cpu =3D graph_util_is_ports0(lnk);
 	int ret;
=20
 	if (is_cpu) {
+		cpu_port =3D of_graph_get_remote_port(ep); /* rport */
+
 		/*
 		 * dpcm {
 		 *	// Front-End
@@ -895,10 +916,13 @@ int audio_graph2_link_dpcm(struct simple_util_priv *p=
riv,
 		dai_link->dynamic		=3D 1;
 		dai_link->dpcm_merged_format	=3D 1;
=20
-		ret =3D graph_parse_node(priv, GRAPH_DPCM, rport, li, 1);
+		ret =3D graph_parse_node(priv, GRAPH_DPCM, cpu_port, li, 1);
 		if (ret)
 			goto err;
+
 	} else {
+		codec_port =3D of_graph_get_remote_port(ep); /* rport */
+
 		/*
 		 * dpcm {
 		 *	// Front-End
@@ -928,7 +952,7 @@ int audio_graph2_link_dpcm(struct simple_util_priv *pri=
v,
 		dai_link->no_pcm		=3D 1;
 		dai_link->be_hw_params_fixup	=3D simple_util_be_hw_params_fixup;
=20
-		ret =3D graph_parse_node(priv, GRAPH_DPCM, rport, li, 0);
+		ret =3D graph_parse_node(priv, GRAPH_DPCM, codec_port, li, 0);
 		if (ret < 0)
 			goto err;
 	}
@@ -938,11 +962,12 @@ int audio_graph2_link_dpcm(struct simple_util_priv *p=
riv,
=20
 	snd_soc_dai_link_set_capabilities(dai_link);
=20
-	graph_link_init(priv, rport, li, is_cpu);
+	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
 err:
 	of_node_put(ep);
 	of_node_put(rep);
-	of_node_put(rport);
+	of_node_put(cpu_port);
+	of_node_put(codec_port);
=20
 	return ret;
 }
@@ -1030,7 +1055,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *pr=
iv,
 	if (ret < 0)
 		goto err2;
=20
-	graph_link_init(priv, codec0_port, li, 1);
+	graph_link_init(priv, lnk, codec0_port, codec1_port, li, 1);
 err2:
 	of_node_put(ep0);
 	of_node_put(ep1);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simp=
le-card-utils.c
index 7ebf59a03e698..d0f8258a4790a 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1132,14 +1132,13 @@ EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 void graph_util_parse_link_direction(struct device_node *np,
 				    bool *playback_only, bool *capture_only)
 {
-	bool is_playback_only =3D false;
-	bool is_capture_only =3D false;
+	bool is_playback_only =3D of_property_read_bool(np, "playback-only");
+	bool is_capture_only  =3D of_property_read_bool(np, "capture-only");
=20
-	is_playback_only =3D of_property_read_bool(np, "playback-only");
-	is_capture_only =3D of_property_read_bool(np, "capture-only");
-
-	*playback_only =3D is_playback_only;
-	*capture_only =3D is_capture_only;
+	if (is_playback_only)
+		*playback_only =3D is_playback_only;
+	if (is_capture_only)
+		*capture_only =3D is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
=20
--=20
2.43.0

