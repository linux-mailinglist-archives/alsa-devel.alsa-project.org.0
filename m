Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B5685B095
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 02:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4A61ED;
	Tue, 20 Feb 2024 02:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4A61ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708393153;
	bh=fFXRy7+SIkeWSo0/mSsnGrywuYYlxHAfRTikqCgxbCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XY1TdkIbpXsGJ8j+sTLZ3ikjMfbxfm6oxWhUZmKqpo8VY7xLxjWZFSS69IqnQxn8b
	 hknGaxJaLFOnR172GhOPFIn1WwEZqpHD7iygjC1eVRXjYrUgZPeRn3NaTP810Rcpem
	 EzsduutRGay+GJdw0CnF0dNUa7AhtKw/mQ2YuWy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1954F805AF; Tue, 20 Feb 2024 02:38:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B929FF80587;
	Tue, 20 Feb 2024 02:38:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C3EF80496; Tue, 20 Feb 2024 02:38:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu
 [18.185.115.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28FB0F800ED
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 02:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28FB0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=opensynergy.com header.i=@opensynergy.com
 header.a=rsa-sha256 header.s=TM-DKIM-20210503141657 header.b=H0lCAQ6A
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.181.221])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id CB04710001325;
	Tue, 20 Feb 2024 01:37:56 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1708393076.382000
X-TM-MAIL-UUID: 4f07d80d-1248-413d-83a2-ca2a7537b5af
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown
 [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id
 5D5EC10000315;
	Tue, 20 Feb 2024 01:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekqnyTDBhpiyROM5ibPgGfSMUOQK7tZdaPSE/NycvDAd9xFTO4ODwWr5/9dhycJgltZosPI//lAoPnTz4PwVmZFlwzSF8Hv5gxKjMlmQUrVZW+G7BmjtsmhgXpUIHe5iXGW2Tq/1Hm3yA1UE9SeL3z7kJ8ZJH9RjMzNIweDSY/LeK7x4cRr9qMgqceNCM2cL8jDUbSWE7aB3AP91c+MmvX2AYB4JniUIvF8kKZI0Mzxv6Ai7fDQQ2sGwHg+VDy0KAl9dXrNRE9s+xKSWH6PchR8dMkCmoplRdbSOa5NDg8A97x81wWIv7a6cAdd6uX5EjDWLNQ5rEC9AjMfaO/Gv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsZg67DlrisXTVWPZYPDWOLYrZjVxQK2sdJHmEkyO6Q=;
 b=EZkoHBsMRXBYZ/R2EutJnHbSE0mKfuF2X9nivNft5CuD6Y7MaRY//dOy7z8vBlTTu5LarJTnwm/BImbLwfT+fssBcISDTndju6ahpW3OeQ5ltC0Q2o/TIVmhRsu1LH1LuzG5No7JCuuOB1TGH/Tc1RNT0I2qlizt+fQtJmO6/DJvINxeE/IVyZfEkFluZa0M8pJjNe6yKokthztqeEq0BfGBbd6XW9x8s0WERQ8/InBo7zTFifNTEGDGoqmJd9/qDFays9sgVmBfgsFbnUCt8S4H3ucs2K+JvyDGrAT2LCpI0XodQcWcsjc2C2owS+MBuKD+oOamQpO6ao8fXm90gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <d9a99397-4111-4677-b535-ee20c86018ad@opensynergy.com>
Date: Tue, 20 Feb 2024 10:37:41 +0900
Subject: Re: [v2 PATCH 0/1] ALSA: virtio: add support for audio controls
To: Marcin Radomski <dextero@google.com>, aiswarya.cyriac@opensynergy.com
Cc: vill@google.com, alsa-devel@alsa-project.org, jasowang@redhat.com,
 linux-kernel@vger.kernel.org, mst@redhat.com, perex@perex.cz,
 tiwai@suse.com, virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org
References: <20240115133654.576068-2-aiswarya.cyriac@opensynergy.com>
 <20240219172417.1383044-1-dextero@google.com>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <20240219172417.1383044-1-dextero@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYXPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:403:a::30) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BE1P281MB3153:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d5f35e-3c33-4d37-4366-08dc31b48edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CAtjyAvPzVXC08vsIIKXdpgD9jmoEINqDIfnFx4UDaa4vETB1lxtshPH/Vx6RHvM1tsFYP/mYQhgGLl2Brz/+8ZRagKyUcUsTh1723+qSSsez/s+3evoRwzqWNrhgR66zncrmOP4/bd5tCsRTZwX8rw8nEj3FZ7+D8IXiObQIUyKK68x/dk3+Q1nJaFEmfVJw00lsCQ/stt9lHdHf5Yrsv3b0oGHmi2lxIGlV7tIUur+hq4H4XzoDVGOd2mROuvOZRXhdfraAfWbg622eZKAQdSVljvr4+PzkPNzT/NGSReOjAkNYVArPwtcnboQD8LmNGubqApXVVGR6zQvd8rb8Nosy8jzP4Sn+aYoriVcHritsWHgsizAZHen1IXfWkpTm8TpeHKfddGAjj0/loil+CLkt273huZLXkdoE4NMzPf9Hx5R61jVBxrOdg9eCTeQ2xF23AS38z4Pscu79/K2Ke5AWw7Cw9ZKUlaKS73cgETu9YvnV29sHsRrk0pplwTxsMC5ShLf6X+j4JPjPwVy4cBYar8JLLiD/aI3jLL9bX0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVlwTUdUNGxjNXNlUm5EZjNTSUcyUUNQblFLTktaVzVBOVBoR1BVUlRBQ1pi?=
 =?utf-8?B?dXZFWit3UlcwNFZkblQ2RW1KMzBMOXZoMklkWVhDWlE5R0l4SGZZbDZrcG5S?=
 =?utf-8?B?SE02UUloeFJhdWZ1Ny9NQVQyY1ZqbVE2aEpsZ0Yzc2pRWnhoeWpOUW9QcWtW?=
 =?utf-8?B?S2I4ZXltVkxGeERNYndKNHUzUEI4a3E2dHFpQSsyRkF1aVhMU09oem5uT2l0?=
 =?utf-8?B?ZWhiS1BjZzFKV043dm5zZEs0T0k5Rm44UFI4bU5JaGh3aEYrWGxqeWRWaXdI?=
 =?utf-8?B?R05WZTRITDJjdEk3c0ZkdXRMbXFHN0hUTnIrOWhHRmpYN2l5Y2J4eTFxaWlz?=
 =?utf-8?B?UUNTR0l1OXRsNVJzcUQzb2VuS293bHFKbVZUejJHSlhCeTZLMHNVVUdTNkNl?=
 =?utf-8?B?ZmdwV3c2amxwNU80UW92YzZGSWZicXdYN1VkNkpYcXoxVmpMUTgxOTYvQ3BG?=
 =?utf-8?B?djhqdnBSQXcxNEd1b01JMU5yN2Q0VDVnbHZROURkbkJIMHRZSklCMmlTaEZp?=
 =?utf-8?B?OUNhMzVzSk80QmozdFdQb0xwYmF4U0VVRHkveVl2bVR2Ny9ReGNiOWp3ZDB6?=
 =?utf-8?B?aEJLVXo1dUJQTmNHRHJkTWRoY2dkN3d2RUFTamRJRnhKWHFVR1NuT2NRTndo?=
 =?utf-8?B?Z2MxTU9pVjYvMlA5WTZGU2ZWeFhia1VuV1RFRktXTXpWOVVFaE9ibDJqVXlI?=
 =?utf-8?B?d1lNL0UxbURuSjhFTyt0eHJtR1VJdDVLa0RzU2NBTTF3MVRDS1VqY3J4TlVP?=
 =?utf-8?B?bnNGZFVId1ltTElnK1lQVlRDL3hadkdQRUZiUndCcHhNekh1QkhzN0ZMaW4v?=
 =?utf-8?B?RERxQ1F2cU5jQVUvYkp0WkFpTUwrV2tBVWxJVDVyTWdiSzNzYUVNaTh5V1NC?=
 =?utf-8?B?K2U2blpDdlNXZUp2dm1GRWN2VEZGN2REQmNRMVlhc2ZpbGk5cHVpYVRySE5t?=
 =?utf-8?B?Qm94c2dVdzR6Q3NIbDFPQ3BtVW93d2Z5ZW9MdkpiQ1ZVTnBzc1VINzNvb0h4?=
 =?utf-8?B?Tmx4aE9uNTFxaGpsR29za1psWmoySmwxVGQvR293dU9wZkxZRnk2aFZ2VGVh?=
 =?utf-8?B?V3RIalQveGtyL0RIU1hpdDBWeTEwWEJ0b25wTmIwT2JJR1pEOU1ZUVJuRUY3?=
 =?utf-8?B?Y2xJNy8yS3U4U1JOWThNRi9sUE9lSFV4OFYvbWw0OUxXUFNLanBWSEZsbS92?=
 =?utf-8?B?TjhYakhvaHc3NWpzQTA3NFZLZHFDcjBCUmJVcXR6ODBaM2ZYdUxIRzZJN28v?=
 =?utf-8?B?eVdUL0I0SWt4RFVEQUxOOEFPdFFIMmdHUzd0SW9INDUrc20xZGpHZ2RxLzBq?=
 =?utf-8?B?WVRvSDJFcmhJbHZXdjhueEVWVFVVaTdGTmxhcUZEV0RQUDN4L1RSb2llYVRr?=
 =?utf-8?B?Q25rbmx1RVBMM0ZyK25ScXp3WU1zbnZEanliZDZja2N5cjdMRlJISGZZdHVI?=
 =?utf-8?B?bDJtUVZXaE5ySEtkZkthdHJGTGVaVE5ORnlXQ0haUHlOdkJJd1hnZzVyZTNt?=
 =?utf-8?B?TEIrejhKQmdUMFk2ZHdOWW5FQysyVUFHOWRCQ0VxZjhpOXhFTXh4bzkya0tv?=
 =?utf-8?B?VS8vNDR5WGtCYzdUdTJzYU5UNmMyNVVMTlRnakE5MlQvMkF4Q2hXa0F0SXpB?=
 =?utf-8?B?ZU5JRllyc3VQYWhqaWo3YzNXOXQvb2JFMjcrMS9QS0hLd3NNa2pJKzVNT01z?=
 =?utf-8?B?V0drWFlNU0hEMko1eWFnZ1dhUmJNaHlNOGhxcXEveXh6VlFpYzFoaGhXd2lG?=
 =?utf-8?B?bUxBOStvK1VtNEMvWVpGWkk1bndNR2Q5R1dMQjhhV1FYbklRREJiV05VdGZx?=
 =?utf-8?B?VTFlakE4cHgxeEdrcFNiTERMMVlDeFQyOEdiNHRHMDNDYlIvYUFmRERkSG1p?=
 =?utf-8?B?R0hjMVB6M1JsV1dpYldpMmcrVEZvdE1ZL20yYTJYbW5SK25MajJDRkg5MHFK?=
 =?utf-8?B?OThPYzkrdUNHbzFvL3RPVXVDa3JmRWk1TStuVGRGWmVBNG5mVnVDNWQzcUdR?=
 =?utf-8?B?bWE0RVpZYlNYQWt4OXlDbGpoVlYwQW1HZXlUY0NtdnRpVFlCcFk3cFlpT1Zu?=
 =?utf-8?B?d1g0citDZG4zbWpuSVdGekhBODhMOWZSOW5oNlZ1MHB6Y1RKMXFOWDJZNEdD?=
 =?utf-8?B?K2pOYmtlWll2ZUVMRU10YW96dEVMeTgzSitYajRhcEJOYXl6Z1RxbkR0TGFm?=
 =?utf-8?Q?48IUIzljOBbfL0q+YnPQOXKy6JDdpmJKLqzMz/O71fA9?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2d5f35e-3c33-4d37-4366-08dc31b48edb
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:37:54.5266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7Vp9htuiXW246cK3J9xbYXIaWr7LQc8f6OCAnzQsOvAWiBzMFDi+AV2mmpG2wW83N6CyU5qVEeh8l/WRaGa9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3153
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28202.004
X-TMASE-Result: 10--11.951600-4.000000
X-TMASE-MatchedRID: O/y65JfDwwv5ETspAEX/npGPSO6O5JCalR7tN56aWVW0sdSrJZyyxp0Q
	FAkvwQa1x+4DBaCRcWVROHkKgWFqUmOOjE/261b4M6mKelUSkRFW1n4bHTHoQZXVwPqFeiBVT0B
	RZNI+Ywa6miiB19Ur4l3jHUhSUqcUaIn7kYcazIMk+VN5SeE/CnM1+1Vqzfv2+SDH3HyigbT8XL
	wN2+AeMDsAVzN+Ov/sOECyFyDVMckc9LpRfRZMDc2QAgAkkoe3EvSxyyaSskdOMWgY1PD+9A==
X-TMASE-XGENCLOUD: 7f0722c9-a23d-488e-9bea-2fdc98ba01f1-0-0-200-0
X-TM-Deliver-Signature: 2FB02D8C42C688081AC4470B2AC02FA2
X-TM-Addin-Auth: bPQussCM3H8d2AQJ4f+AT7k0LR9t4SR6SLykmIdarNfTI6vg0ynJ7SZUfAX
	RjhNDT8Ff/ejSqn0stzVmSqqZOGe5Zkg30XUQlrWr15xwJs3+85+G4BdieSvjdQYIe/cW950hg4
	yGXincMcjW2BQm7GSef4awXLyAMyTD6dFMXmzQnzjDW8N4f7xn/IYtS2muOXsj3XbBRmLtX269d
	qcH4Gg7VpyOuAeHm2mcKfOKT2evF/0l0tDw7q+M5NXk1ELCveAZYcGXDoxmcESnopm2dSFBwuF2
	k0EjWXu6zabzz3g=.OO9U42TrfaEutwaF3eE9KK+NgSOh4T0hDPlFYy8nz3K04PCfrRRGOpg4Pt
	BmAcqXE599Yai34hdoTQF49lXohZbN02dyQCKS8UOPkrXJnhg350rwsFEzPWBUdcKr5pfs/8kMr
	92fQh9GLMfhaootf/ckDPP8kOMOf6phd2b367AzwPdsM9dSt3xhACtsYC7V6MK4D7wT7ZwT3ZMe
	zzzNc/D1v/IqgT6fP9BfnAKEJyND888UVaSODdvFnEBHVuemFuLdop2oiCPEz++5VtB9L0DP1E6
	qUqnqtG7XZPa+aTvQvrh6MGc0NXdp5GEY7PGaBqficqi29CG6NafbjvZsiQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1708393076;
	bh=fFXRy7+SIkeWSo0/mSsnGrywuYYlxHAfRTikqCgxbCc=; l=549;
	h=Date:To:From;
	b=H0lCAQ6AU8DT8Bo/3JKdtTk8NunvDaZVY+tcOUCf26ETcBwQnbEYYOBf4zQLgAey7
	 djZ/spgHFhutY7O83Rok++/tBfIHFerUKxKLX34cgXA+BWwZ+olS2W/84v8Ibfs8Oi
	 W0BtcYX58FDpgHYzq0K/YoxZsMZM4eTSgtF2vnaaOmCLNwYnzrUvCJeuu/0XHViTYr
	 XF3fFAVoSZaIcpSbTVecnSyBdecp14i48Gw+1gAv2YfUFyjud+kKl7sk+By3/kLm6/
	 xQJb1KOuELoZRh1w2/IYoyO7Mtfnu9y8J8RomBT/XaxqRhEmck//LbeSOr3Er8fWtX
	 GrloGYYZxSvyg==
Message-ID-Hash: 2YS63STKFIAE6I7ER3CJZKLGXZZB4THO
X-Message-ID-Hash: 2YS63STKFIAE6I7ER3CJZKLGXZZB4THO
X-MailFrom: Anton.Yakovlev@opensynergy.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YS63STKFIAE6I7ER3CJZKLGXZZB4THO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Marcin,


Thanks for the help!



On 20.02.2024 02:24, Marcin Radomski wrote:
> Thanks Anton for the reupload.
> 
> I tested this series with a 6.1 kernel guest on a proprietary hypervisor. The
> controls exposed by the host (BOOLEAN/INTEGER ones, as that was all I could
> get) worked as expected when adjusted via ALSA APIs.
> 
> Reviewed-by: Marcin Radomski <dextero@google.com>
> Tested-By: Marcin Radomski <dextero@google.com>

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
