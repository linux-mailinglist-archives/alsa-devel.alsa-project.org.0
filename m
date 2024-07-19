Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AB9371BD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 03:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35BBCE94;
	Fri, 19 Jul 2024 03:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35BBCE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721351015;
	bh=douUUkhf6Yh78qAA0DPCBHIbkZvVzWUs1HAFUJsxiSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gn8+4SYlW7G7tabfah3gigaof9d2uBXNPXGuDvYAk+/Ji/GhG7W+lK0d6qkBIcwqb
	 4eXnI5glFclsT6IsqWPA0Z4eZaJllrKWTdxBYMwYV7m0mQSjkQZ79luXaDti5rTBiO
	 9wh1jqqeCsV98SOfZcEsuKt5fztoGVKNXmWhTQp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15D4FF805B3; Fri, 19 Jul 2024 03:03:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89DB3F805B0;
	Fri, 19 Jul 2024 03:03:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1609F804FC; Fri, 19 Jul 2024 03:02:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29B02F8007E
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 03:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B02F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NZTQIxGk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRZEeSxlP2xGZPjDDi/wwTFrIFYYpBREvwJBUw5tKS0ceoZSmDJTvik7KuxgML0J5PZ7u9xpYM9L2BF8Xcn7vS+2Ce/358Md3JJY9OrHzv7YivMxAtBbEKY1sCvl/uM7V8YXLaUjZfgzIiSq24xF3JIk917u59EydOwRNkGq5cdbZ1n9Z3n0BOii1EAoPOGlvbfABJrATa7a2sYnFXpmbmFKZz7GNQqMyPgPywc4WqaUXFfWKk/R5FxHSQsY8wZoWEpCfhy1vN9UQsZbsXh2vs/E0x4AthLBbUpisUpOXy+0wnfAi4LU8j4gf5+caIZKXPOMuYeYsL+RntbRQqAzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nri6rBM0/8aZTaDuqyTN4B0Dzvvg3SNPCc4adFeVnig=;
 b=BnVm8qiCggNUi0KHuAo9UWNtlr5syi6XenUZFquKgvOaxWjmya8wpl5tCoR6eiI8zpluYjQC6XTaNgSP/RmEheQ57Qr+/uaW2mDn9+x5lqjLa9PhTw/HBJzGDZLGdYv03dsgAX5lE0uT87g9lhBFuP++plokHQjhj0Sx4QW/AMC32EtNespJ4wlvL7q5FVJPktXYfLZd5Qh96Y6m9ul6+gUbRHi0/cdyRGZgek8ypPY9V7p8Q7p4tRIT2litRc2nsvuSNQcLCdGzwP9aU0oLb6HkrLHu0Tmg8CVeks8oBGYq99INuXQB7V+1iHddL4dR215hxwXe+ZoM1X2dt5rEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nri6rBM0/8aZTaDuqyTN4B0Dzvvg3SNPCc4adFeVnig=;
 b=NZTQIxGk9WXMznN12igQzdJjCsMeLk1leFaekEsfD1zknHizI1Ezmi/ZVK17m7QakgqlTzNA3dMjyV+CujpfADITFMr+jBy0pVSo/zxftxOluaGSctep+XpQ4w69MuSaoAQc/fiT7o4MZpD+t76h7+bQSh4+xNEEBsJ3+OdpcJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10681.jpnprd01.prod.outlook.com
 (2603:1096:400:295::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 01:02:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 01:02:44 +0000
Message-ID: <87o76ukxcc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 00/xx] ALSA: ALSA: add snd_stream_is_playback/capture()
In-Reply-To: <20240719003340.GA381736@workstation.local>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<20240719003340.GA381736@workstation.local>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 19 Jul 2024 01:02:43 +0000
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10681:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fdb7cd-739e-4267-158e-08dca78e7f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8QMLDP31UlGPSeSi6QfPcpNh3oW9xQ+8YCx28zZgdDJnGSaFHlHdLeLDahwq?=
 =?us-ascii?Q?8sqswjt5wX3UJfzo+erhcbH6/FhVJzG1C7FXLJAzSFc0LA/KBL37noLUK9lc?=
 =?us-ascii?Q?2k+JHB7hhPGkJOZsBIoDkSBOnppasKw+zCjBAdk8YxQ8tPk0ihfLuE6iTa8N?=
 =?us-ascii?Q?wccFDoAkWQjgljbv6PLx2wlTcnF3fprGFeLUYnd4XX/+pbUbaj2EheqptVrF?=
 =?us-ascii?Q?1sx2ikzijtc0QRu07K+PwLmNC8zp2IV1eouAZMVuaHI2AJrecJa/jHcd6hVT?=
 =?us-ascii?Q?hAFdB/nn3nZoHslrMBSBd1LEQ72+X6uT+tVeenNp5XIR5yEtN7LqIglP7v6Z?=
 =?us-ascii?Q?q+BItgVxStTLYfkM8lKBGf+l0kdaiRi8nJZsC+gIDzG5otMS+8DFAbHKLd/b?=
 =?us-ascii?Q?Gne4c3GmmJmZwfG4DrckqCKDDCkV5z4BuzRSKRJwH5+Yb1F9JJtQfr7/acjo?=
 =?us-ascii?Q?Pm8r9d6lkd1+wizRB9s+ugndbKNUBIaV6M96PTzaCO/Tl+O3Kez28/4MKUr2?=
 =?us-ascii?Q?GpuyiyTiSuTVRYnFopefad2b6aqk680JWneeAbMvRoYBlfl5Yzhw66mKm4sL?=
 =?us-ascii?Q?BbWrzxUUekC/jNyAroIDdrt2h+L8V2otbVjN4VFR4wPE7bqXNbw/dL3DwPsv?=
 =?us-ascii?Q?5ueFXt1E8ZRhDexxSowFSzMXY1rcmcAEPlPFHfP8Me/hjgrlgQ0zURDQiZ+3?=
 =?us-ascii?Q?+azr92Q+rWwRapXGU6ZtCBmXZmZIYSFqpVcOSFrQBuSrZxCxax0uIMKqZC8+?=
 =?us-ascii?Q?c+9RFNjIUXzhJRnUvYiEBb2OldKV8K1OWOexr4CM/4YvNgu9SRprp3bDBYe7?=
 =?us-ascii?Q?kPoQp279t/rVf7R0Mu8DP+KVH5og2UsWr2hG7UVeZsvy+LjHnzwmw4y2SHKg?=
 =?us-ascii?Q?Ncu9m1Ujy0iG8+VC7GOcDB13VuHI547vyOPcjpvlDQHJSyAIOCFk5Gjn0k0E?=
 =?us-ascii?Q?rB4p7UaDRKottTIXl2Q8gTq4a3Ml4uc4WhiqaIBFmzLmfb7o3cBsNkLJsfML?=
 =?us-ascii?Q?m8YCDIFiT2gyuzbpvb0nrcuxbHrJ9UqqufyZe7T22LAfGZiuOBm9cfMFYlAm?=
 =?us-ascii?Q?BH6VENgRgzmhCwd9hjRBZfXD8ViFi8+PyDeEb+4jAtbOOxEM5vOURYC/yN+h?=
 =?us-ascii?Q?9Hco4eIiSHv5yCV6IOLLy8ME2wEGZqba/m5/lO446SokZcCJ659bzvfI77Mh?=
 =?us-ascii?Q?mqV8vDVJpnb4Kxvlm9fMMXQ5SkZqr2AQZQ7RoSws5tWA+Z3tNwx8mh0C8DKM?=
 =?us-ascii?Q?GNATUDhm0qDtVfYTVsKihqDPgWUFaHPpLhjSlZOcBsYo0AQ05UZHgH6T/X/9?=
 =?us-ascii?Q?cznCY9LPDuNHMXbm00rRoHReMNhuy2nlHT7/ivDfLnT7E57N7APgiWVDIC7C?=
 =?us-ascii?Q?dA342ODEm8LImY7RWv7q1ICDiB2cVuOXwcSv5JBJ3TUrU/ERKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vdblasD8BgNna0aUDJBKl6IIk0sGVkt7NzJYnKlfdAT+WcF26U67a/FAdA2C?=
 =?us-ascii?Q?W1nAJCL1UBl6t4IW/mvg3vqL1oT3JOtMAoxGnzcDZQ4Dhm/3RECSTOuIo3U+?=
 =?us-ascii?Q?rsimBKbzCfQ7UcCOEgLHzYzm5IREED8l6tfp/R/qxn/CHVKwEd2Uwz4BO5qt?=
 =?us-ascii?Q?Vj9qAfUivo7XVv1mSyKJ02u31xsW7ZQFcDlIP+ZrIwH0lXZxA0dOKmV3bUJv?=
 =?us-ascii?Q?5lvOuzL7bThJ7YtUNgwTMzPRuTZm16moELeONOun2l7Gl8anhLKrKlbi5dcc?=
 =?us-ascii?Q?nqlNIK15cs2/v6S94/fn6jm2qs47bmD3Mm7DiqmqFubtBy/oxGTPcrQpNDUS?=
 =?us-ascii?Q?NW+l7yftnG4gNjmTwfOfqga0N4cN+er1Brwr5VA3GiQTf0hfpJaLFZsXzrPr?=
 =?us-ascii?Q?Dmj3aw8/NYLDjRLecRmpcRo5netFez1vlyl2rRL5SFRhMjrMGUUvpFEMWL5U?=
 =?us-ascii?Q?Rn5+2G8752dknWvwv5P5cGs/F5AllGRUxC0nFjtlPuKVkT+jfM1YZd4rhoV6?=
 =?us-ascii?Q?AaayeORgXwxxDIEJHM0N+yC6PTLCgnke/Gq+Mif8YH5ysW4NcnhicRRHXo1V?=
 =?us-ascii?Q?1Ci5TqJe1TiyOdVbFuL57sOaOS/cJVJ1W8WB5CbugtHLySDnQh7ruSIG+V9d?=
 =?us-ascii?Q?DOu4F/rlp2TB9Esqx0nQp+5FGbZyEkVBLctSkgQh2sVIpiHtus7rfCqGrJlK?=
 =?us-ascii?Q?MrQ0LjwR1T5kZs52Ge3/a1PDF5Z4Sj/Y6B16PBcW/ruUdu9qyJCdQhahFZGW?=
 =?us-ascii?Q?LHCA/tIjJ9AHgEcINmFQKaYNCEHH7JbMbI8k1U8lZxOcgFD5JNPk1MyogLdo?=
 =?us-ascii?Q?CKAdFRz0bpFT7gk/HSvDrah7wnigYhKhY/eWjWhiMQVkiAI/TV9UPcJHzpjs?=
 =?us-ascii?Q?UxQd4YW7+lHP4DZMHETCmvbce9ejfxa6Nad0XzJB1ha1x9uIGVrq0PVR7378?=
 =?us-ascii?Q?aoK+LZjgQpgKFZrMmcjZsDFAKDJ31fu9Iw/LSuXKqQuQGPGhasyJgJnGdiDW?=
 =?us-ascii?Q?X+gr2oRfgOEGSjZAlZHzkRSWn9znrKrJDs8iRoSJUtIV1ZWv53WJHYPQEx6I?=
 =?us-ascii?Q?Ka6yBXtWXngrMlwQChhQutHxu1chSVwkvPWLQvftHQw6iFo4qOJ1nc3KJq9Y?=
 =?us-ascii?Q?tV77wydoVjzVJOAg1pKlLCGhOmH7up6oRCBfH1plEICyQmHg+u3BWiYbZNah?=
 =?us-ascii?Q?ex79vAEKvQIRfcV8M/6XcRIzkkdV54I9TI64T3S7Z62xcVcM+oEndI2FKJ6E?=
 =?us-ascii?Q?srqCQEzXA7g8YAHjkkCw4DYxUy/hlVPkgOrmWAfGoygFy4nLh/PjSIW4etCN?=
 =?us-ascii?Q?sbpHkMjIIIpsuI/ABmLcEeGHoayiAJ2CIMfVUvDoKGmkY4ofUbY+dzEJ8WDt?=
 =?us-ascii?Q?su3nZNgMZ/AGBcX+HFYuc/FKyrRYgkCndWPzPViZ18zNAe+tZLY+K+yH8g/A?=
 =?us-ascii?Q?zYDrJ65obntE8Jg1BhvhbxpR7Olq51lAXiQJnIZjIXo3ixtDlpXxNl7rrzSa?=
 =?us-ascii?Q?TCYWdRRiNPKXWQDzrD/NyERj7Y6PVhbdhKblCmBrbvWyrUS4HMorNKgbdjPc?=
 =?us-ascii?Q?S/nBQ+fXD5iGSVprcHqmmKeBeCuRCySkvpDR1Tggw5ufbfl6K/4O2nlcU3RS?=
 =?us-ascii?Q?WbXvsBFoFrIRb2XTFFa5g2w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31fdb7cd-739e-4267-158e-08dca78e7f15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 01:02:44.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CpS/JTClPhuUKOzQB/NeEJh33HmdmvAZmGcorNjHNg8tKxa7tTDfVdM7/8tY32pxrc53F6T/8r5byT2XihOQa0Qc8m8+7BTVx9I/82u2jsr1XnhMKNAVp2+gYNEerq/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10681
Message-ID-Hash: 6OCVBNKSMNQEGLBHGR3H25C5ZBPSH5JR
X-Message-ID-Hash: 6OCVBNKSMNQEGLBHGR3H25C5ZBPSH5JR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OCVBNKSMNQEGLBHGR3H25C5ZBPSH5JR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sakamoto-san

> It is better to rename these inline functions introduced in this
> patchset so that they belong to PCM category, since in Linux sound
> subsystem there is another type of substream in rawmidi category.
> 
> The concept of 'substream' corresponds to 'subdevice' in some operations
> to PCM/RawMidi cdev, thus should be handled with enough care as much as
> possible, in my opinion.

Ah, indeed. Thank you for pointing it.
So something like

	snd_stream_is_playback()    -> snd_pcm_stream_is_playback()
	snd_substream_is_playback() -> snd_pcm_substream_is_playback()

Thank you for your help !!

Best regards
---
Kuninori Morimoto
