Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511006C3F73
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 02:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA5F20C;
	Wed, 22 Mar 2023 02:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA5F20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679447569;
	bh=vEwhukWJmDIAZu3cHlRnZ24+Tn4+hIbrcp5yuLEjyXM=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EVmLk3B/EI2+y4ifh0FsdVHpEzO74hxp/XgxL9vU4HVuco0Zd/74i1mfjGmPe+++n
	 m/K1QQC3CVF+rIk/Xq7mgz0insDaqMTZ4Minkp2ZsJhaO3TUfrjTOCikAUMDuMfh8X
	 w3RX4JgckJLJCkWeHhgpKssYCzDbCdCXwfqFQkCM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E4FF80105;
	Wed, 22 Mar 2023 02:11:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27731F8027B; Wed, 22 Mar 2023 02:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B0BF8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 02:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B0BF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YhUmSmJJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeJWy89jwOmh1RAub/qRYYxoHrwIkIJVmXTgOayo3v7DVoCn9Zh7bLKhXUVhUGskQkuYC3GWzv5bI5WKs30TZ2X9AKUGv05+wNdM/UamzGGizuBySUdJUxrrhAz8o++ZODxZ0EoP+WMNOpTbg1plXjrC0zUjglWYOLw7vo5LGClrQiK0AetZDoZwHWfOJOLxkrx7A+qtcr+yYMbFWfFB0exUVHKCfPl72LwwQlFRG8NtP7yIblcxsV7YqXzTPZTLbeu+bgsta/HiiuDE2T85BKPlEB2fi7Z7bcQETjlW6LFh/uXrVEyqy0RxRBWn67IycRC15so3L6mPHr9LPPe2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poyaBA7WeDgCW+BoIgF8UGV4JDRYPNMh5yXI7hfaRj4=;
 b=ggV2gnXNuT+kVqowrVLFx5CvBWAysbKqbes61ULjEFjO7w532ZxiY0HDOhaK4zFlZQxtLw4SQBTw4kk+5yIimc6GBsRlqFXRgj6/+yCg/oX0sd04NLY0//fZj+5HOCalm5SHzMAaK64isglfl17fKkxGnJCIWyLbOajhx4+Q8gSB0A5Ht93WsaRDpsb8/HT7P5PP0umZkcSxt4RelJQjWiyW824b6UE1auDbAPQMS7fe9O48XP4gD1AMvDnnRREGxb33ptGuAwGaKtLFgRZ1/mziSY//YpSVNMQX5jHpM9DvHPNVoWAzgo3M3NTDHlzvKlVjO8CAAjz4Rs8h+0CHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poyaBA7WeDgCW+BoIgF8UGV4JDRYPNMh5yXI7hfaRj4=;
 b=YhUmSmJJn4aBp+Iikymz1zooHnJ6Xs6NyV+/lIo2QEq+OYUuLuc2CpzEX9iOVkhpZKQ1d51NJbKsbI9uswtW/XuoLI7sIgB48LKIEqHlIfNq3E61R7CUf1+iubo00Aj9KyZ3kpvO0sC5KlYawTOS54183AgpgHunB4f/al8dhjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8882.jpnprd01.prod.outlook.com (2603:1096:400:18f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 01:11:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 01:11:40 +0000
Message-ID: <877cv9tws4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: simple-card: add comment to indicate don't remove
 platforms
In-Reply-To: <878rfptxvv.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfptxvv.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Mar 2023 01:11:39 +0000
X-ClientProxiedBy: TYBP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: abfd49b7-d47d-4c5b-9115-08db2a726440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r6dV00K5iFmHsyuquDKkmeaNsQwOK6nAAvMyuKfOMGRqo4ttlvoJMqf57fgTC1su64QkDN3uQzvuij+et2k5Nmh6f6MC+ul0k8hPoflW4sgZbvVpcV13Y28JKMzyn7503JKbYGCS2cRKnP+UvmWwEaqmhS0U67USCB29IR3OQtGpfTvh96yu/zBAvDzrNKPbJeEOsfLVGyuNVSA1YSIupk2BycOMDK4WAS7HIQ/NkjS3nVfooDFc7yxS1qzss0kbUWm2S1A3jK+idgYhG8lFD8u6ktbUdzQUUBA3auEDPx5uT29cfCXIFd0PuCh1w/O8F/lbmt/fxle61TlgAor7Lz+czwOTRXjepX4QJe5QSqE47bGAzwR2f78Yz+qTZiw0LaJ96+Er3AhkM8FbXK0rzEx57OCiWOwcLkdj+1GiVY68kg2m/T6fNwqNTHeWHPjJiweQNnYGsN82uiUkhvkEusSr6Gst3Rea9PHauQTRpafi6gEhCOe2zJLtXD3G7lCOeHuGM5Xzojc/q6ol3NUHoWlSMmEDr5jsl7oRd3Xy3MzmeCuA4rIuweVRn4NR4v+HriOuLCe4cRKy9C4XMLg+W5bE5LuvlALEdWcIOoBBUZzmjYz3f0F58FJg4sjqI5dA0QvrBGTqpYZ7czClfuaIMDxyn1XMm5tTM6jBotYqaAp7uUs0p+706LCfUn1HV6JChohQxD7nC1SunCxwaBkmM9Hjs8KDrLJaeqUWWd7847M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199018)(2616005)(6512007)(6506007)(6486002)(478600001)(316002)(26005)(52116002)(5660300002)(186003)(83380400001)(38350700002)(38100700002)(86362001)(4744005)(66946007)(6916009)(41300700001)(8936002)(2906002)(66476007)(8676002)(4326008)(66556008)(36756003)(71600200004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W4qqMK3OQaoZdIjlENi70lNyFJPeaV9Y7Qgwww8N5fIRrcgH2+VN6Hgq5dE/?=
 =?us-ascii?Q?KCQuD2NRsIXs2qa8CNic0Dq8HrgeU1iw/rh3qukpDTqLn/rHfDjGRoWzF/Hy?=
 =?us-ascii?Q?lBOokh7gfUnyqFzNbZI4TtVlKmZtjtMso8Qo2kLGYpXxGknFHeOgXbB2mQE4?=
 =?us-ascii?Q?u/HUFujLfvBEb1NPs/wI+nTKpIsfocjUdXFYaROqSQtsBuKCjIsNMDlIQv15?=
 =?us-ascii?Q?U5CroDyFSo5+feKufkdvAItAshc7j1V5BQg81E5Omb/QRafzZf/Ig+RqAb3+?=
 =?us-ascii?Q?OY33wjP5awnNkelzpfl9jwr3Y0P1yqdPeK0a/nmZZX3wHTOwSMzGTHFDn/ls?=
 =?us-ascii?Q?0s4tgllnpwARjIMzGxefNZz8PVVqk3/s9ZNDGH3d6Md0tGUYCurkXICEzQDq?=
 =?us-ascii?Q?aVZdHZetNQIUtUll5AylKw+XRYwRH97YdTN4HSI4+d/nRyh5s9b2gYIqmlsI?=
 =?us-ascii?Q?ysEdvgKbKV7JO0sab/YFl2BZ+uyAtltdSqOGPjAdt3ixUOWm9okLkmtTqifa?=
 =?us-ascii?Q?s7wLMYtojBr8M4C2gcOrU1S9jYJZPRBwkPEqjw3py4bXl1vZ9QXa9nyWgMny?=
 =?us-ascii?Q?uCadR6z7mGBaYiipC/oh98Y3tT/zt9y2teitnRLMaZREa1CUmON+BwP0H18+?=
 =?us-ascii?Q?DRHGNNdyHhxQp34LhzSFfSR8TiCbKqVBmXja45yT16/NgbqSJPbd8uK833NC?=
 =?us-ascii?Q?1jEfPOk1wTABr2x+PMevawweAMnfhHesSLcPkKvA6J9XRGtGvAxOXgN8avul?=
 =?us-ascii?Q?mo6J3RxXShKG61TgE1D+LPox86G09fiV0zQo4GJbc2u2QsVrVDL1OAI6b5vA?=
 =?us-ascii?Q?wS7ZXGjEBh5TB2phEPmPoR/6miG/YFVzO5aulB8uGzNEYmcKIvFVAa+zZrEC?=
 =?us-ascii?Q?e3djva6ubTMtY7pAMatbJFFTm7B0dUUgBeQPNXGlu/jSaQrHHJ6vo9n/WxJH?=
 =?us-ascii?Q?aflxvB3uDcujIPpIndBiDPc8zAysgU7LUmZeWLUTCf2ei+DkKWBo+gnCh5Is?=
 =?us-ascii?Q?ZijW/WyA/fa5X/REdFzcKqU07rW+Nl1cCHKcPsHdMgA2ygN+HFg5G2qESJfT?=
 =?us-ascii?Q?7YMxJBKEsy+ePa/ICF19lZSD327cTGNg1h0kj5GODspGzFPIv1q8dNHmKoKb?=
 =?us-ascii?Q?AugF6iZcxwyzKZppf/f/sXfiQf9gjptQSYdKbfHBNYCtHmaQY6nykuSFxHjE?=
 =?us-ascii?Q?JnPt5LIwwzaOXLLAnvmFXuAZWzsw2b6QbD/Xo1gH1M+/HDQ7tIHngilOrf2U?=
 =?us-ascii?Q?Sq5NoP+qIrq7IhAdO4XlxM+ITX7552uSr2a0jw0N12TDZmskazx8/1/UuFF7?=
 =?us-ascii?Q?bLVUK859Q067KDvrkK2Kvv1QHNOyWF5CDgCJothEm6ME7hWOczNGTC9+ZikX?=
 =?us-ascii?Q?PH72VGpNVLkY0ecO/fqwKvrSC4vfTM1AY36oxmzUgULWf5B0tYUEjEHN1Gox?=
 =?us-ascii?Q?R7zodizlKtSwlOv9Iwnkv9vDPbAO3fq5VyVOEclKIuTgpG4VIqPU5WkSMKJD?=
 =?us-ascii?Q?oLUQv7ggBkJ5gbmY4BqxyuCD3tst55zouQ0zU9O5GuOeYJz0gudbBnaP5xUb?=
 =?us-ascii?Q?RQzxZ2T9KbkjI7r0Wc28/Go2rec0/vdutr4r6Xgrt/ePIr03BMPD4/nL0lHT?=
 =?us-ascii?Q?RFjYfQI1h3MX2IRb0lLARo0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abfd49b7-d47d-4c5b-9115-08db2a726440
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 01:11:40.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w888DjDvuhXeFqQTEjb484RQDrAWSewnSMpZdgG8/NgUjCwlrojwlQqVq3N4pRJIMD8okkS+J6MLg/Tagly2SbYMguoYRxz7Gssr7lDZ6c4u6qHgChZP4IfySEvLgbyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8882
Message-ID-Hash: MOOE5PXY6RNMCJSCLQIIDKNVCDCTLTG4
X-Message-ID-Hash: MOOE5PXY6RNMCJSCLQIIDKNVCDCTLTG4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOOE5PXY6RNMCJSCLQIIDKNVCDCTLTG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> Basically CPU and Platform are different Component, but if CPU is using
> soc-generic-dmaengine-pcm, same dev will be shared between CPU and
> Platform, and Simple Card had been supporting it.
> 
> When we focus to clean up Simple Card driver, we tend to remove platforms
> if no Platform was selected, but it is wrong because of above reasons.
> 
> This patch adds comment why we shouldn't remove platforms.
> 
> In case of CPU is not using soc-generic-dmaengine-pcm, CPU and Platform
> will be duplicated, but it will be ignored by snd_soc_rtd_add_component().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry to bother you, I noticed that it needs +1 comment for more detail.
Please drop this. I will post v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
