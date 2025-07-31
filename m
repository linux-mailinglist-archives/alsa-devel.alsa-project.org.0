Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A7B17873
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Jul 2025 23:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A8A601ED;
	Thu, 31 Jul 2025 23:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A8A601ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753998628;
	bh=AoTMjlupR1MTqBsK9LZWjPMlmnH7vhIfIqD4drmKO34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XIKam8sOsgTmDsWp+Rv4mJ5AWDDxbCwzrAOsXu6OydDbD5RZKMUNabx6hO5hQ1sl3
	 zb82MBWbkLxSFz715kRr1Ngji1w/o4YL9NMcVJug1nCzLPgRS0nf6D0X5hrc8jJslT
	 zG431LgHv+lGXzEfATLBWKVlEQbO0hX9gzAJsB9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E6F0F805BE; Thu, 31 Jul 2025 23:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B000F805C5;
	Thu, 31 Jul 2025 23:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A68E3F8016A; Thu, 31 Jul 2025 23:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023099.outbound.protection.outlook.com [40.107.159.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F7B4F8016A
	for <alsa-devel@alsa-project.org>; Thu, 31 Jul 2025 23:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7B4F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256
 header.s=selector1 header.b=mviBDCiK;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com
 header.a=rsa-sha256 header.s=selector1 header.b=mviBDCiK
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Na7WGa3SJvRuNt20IS/nvPksfGOjSyE0Mo/F4nM91NZV3Kj18XfqeVqSi7LjkvM3tt3BQFip2Oj6H+a4ouglVNTsoMTcLKg9It9+YYG6WCCnVM9sqtlR2MpXzOahKjDbP70agl/4CkfJoTT8ncP1kw+9JNbhKApfzZMuYYF6vo0RrJAd2y3Z/7NBhn6f0cka8rTjOK14f2aceQZf99AjKLlGTxVSV4rBbT3YuruOjhij+fbhIkdk5d6RnIwDSderNcs5fWZ6TJ22hhLoxPbzKBrIWyslvmzwCK7hD7JTMIQc2fVnu6hx/sg9rezSQRo23fORHk/mclEHDJH1Uo6Bow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYYBDtBXcKem84frWW8Snl9tfGrgSUIA+frsSrgBTjk=;
 b=o6XKmot0qAjiPT1YdF3beboqSYpT5ca8Dwkxozplq2S4k0n8YX/w3wowv/RIlInG6AybrYXePNzymjM/MNEilg667iEr2VGSGyTvfY/9dwc7bHel5j9MSrd5pKv26qcQ4jqQr9Ju9Et3BDvGBvKq1KbyEhjV2+8LYs/RAAj2tNxKw7LEXSc0N5Y1IG/QBHFLW1cJX3o3mlSmu+VAa3Q9AdAxHXO8xKXJhevodIVv/7SkmMQtOoYznsgTkRLlWwrQJrIAEapimy0nXP3t3XEMxJp8iAmfzZtKSTUZrxumwNczspH+WM2siG1XS/BAHrSF1GtXY9CnH0U9Txar6yES4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.86) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYYBDtBXcKem84frWW8Snl9tfGrgSUIA+frsSrgBTjk=;
 b=mviBDCiKtG5f2CpeFDI9TSLM69ir+DF4imX5ZOuhpTswO06arMY6szAtlIhhfXxxmXiYNOYk+FTAO2y/k188+zO3jTgnwYeMJ8OcHkjKA/Qou4BDehSrVtm5uFguMh/RF0haLrdr/O92yutZHE0cP4xYf4vxEiAKSPriE/PLNbK5dH+PdicGQD8YU5Yi1nXAu58PMqQszQl81NDuBwyza8SuIrBUBUdL0MCYGFP8Hj/ddeHjTJ3LJzawh/TpzreMOrXwceXeUPotoG+ULblipE1UdQEcpr7jIQL4H4Of21n0PdWaucs8QYBX3B0W1emr4k5x6udP1Jg1fignyXvmbQ==
Received: from AS4P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::6)
 by DB8PR03MB6284.eurprd03.prod.outlook.com (2603:10a6:10:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 21:49:18 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:659:cafe::1e) by AS4P189CA0057.outlook.office365.com
 (2603:10a6:20b:659::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 21:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 31 Jul 2025 21:49:17 +0000
Received: from outmta (unknown [192.168.82.149])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id
 9F0B220084634;
	Thu, 31 Jul 2025 21:49:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (unknown
 [52.101.70.118])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3813E200800B3;
	Thu, 31 Jul 2025 21:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOLRGDSMko/i/nlJTYrqKUJVKIEq2BkZSeNKe1quhMFjqrUxOpbJSKZsoxNqGdsCzdnTRd5KA5Gz1mKZWUxjsy/8Oqcn0Yy50+eq0zKX2LoAwD6jKJT5flXvdu1dSjYYSsS/ZOTdxh+TvpC+DWh75FVgr7UV/zYAW2w5XJrRyjFv5N2xV6tHKmI0S5kqTZp/+aSxG6gOqihJpUTWZoe4SWbga1Gutayl02e7ZlMrTlBOnEX/TyzKIWDWptR0lWi0NRbRaTdiG6L1SLqn3B69mZYoFTUIfwgFFbAXlnOWmw7VehgW/qp9OzMp/Q4w1iN0F+lilZs2mmLAntzpJfRSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYYBDtBXcKem84frWW8Snl9tfGrgSUIA+frsSrgBTjk=;
 b=Jb4iZEdhisC+4psMW4enXrjQqNBSMR6/jwglnehxvAaP1aGfh6YKmZYFCzZhpyJ+bRZNov4i92SAcYkMa3SQx9ZtIWbz47WKhKzfnkDEmhd6YrIP5QKoCc4CeueaMdtPe8gggAhypEDQmghb7gCFZmMUrHsk32z/TKFHC/ZmJPIzjdJYcMC5fCSoX6vqG5v+V9hv6GZzuoG658YpAq/1yTkLaPo+04gih7aidjh9QN6FVhRGyQh6EDtrtkVJaWPFXHY6DROAIy1XuQoJkEZ6qWUb+JjbgLlWYUNfGhsUULku2wbMzTJI60QBx0clICleInX9pXsaYVKWo3Y6GJEx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYYBDtBXcKem84frWW8Snl9tfGrgSUIA+frsSrgBTjk=;
 b=mviBDCiKtG5f2CpeFDI9TSLM69ir+DF4imX5ZOuhpTswO06arMY6szAtlIhhfXxxmXiYNOYk+FTAO2y/k188+zO3jTgnwYeMJ8OcHkjKA/Qou4BDehSrVtm5uFguMh/RF0haLrdr/O92yutZHE0cP4xYf4vxEiAKSPriE/PLNbK5dH+PdicGQD8YU5Yi1nXAu58PMqQszQl81NDuBwyza8SuIrBUBUdL0MCYGFP8Hj/ddeHjTJ3LJzawh/TpzreMOrXwceXeUPotoG+ULblipE1UdQEcpr7jIQL4H4Of21n0PdWaucs8QYBX3B0W1emr4k5x6udP1Jg1fignyXvmbQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by AM9PR03MB6945.eurprd03.prod.outlook.com (2603:10a6:20b:2db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 21:49:14 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 21:49:14 +0000
Message-ID: <195fcbb0-37f6-4379-87c9-1ef75b07bf6f@seco.com>
Date: Thu, 31 Jul 2025 17:49:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: retire_capture_urb: Corrected urb data len
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <68a97d61-21bf-b45e-f6ed-c0906dd4b197@seco.com>
 <87ilmfj72j.wl-tiwai@suse.de> <9d41eda1-1172-ea60-dd87-b3e38a529170@seco.com>
 <87r110iz8w.wl-tiwai@suse.de> <53306c0f-e5ef-44ee-b90c-a3ea61ca454c@seco.com>
 <87v8q6wcf6.wl-tiwai@suse.de>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <87v8q6wcf6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0015.prod.exchangelabs.com (2603:10b6:208:71::28)
 To PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	PAVPR03MB9020:EE_|AM9PR03MB6945:EE_|AM1PEPF000252DF:EE_|DB8PR03MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ed5a14-3ec8-4392-18eb-08ddd07c197f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WE5WUGdhQXN5VUlkLzQ4Q2UweFhzbVJId0V1YXR6RWhadkJFaW1kbGsydHdl?=
 =?utf-8?B?cTVFSU96MVF5QWUvYkpGam1uK1NzY1JKbTFEZ2xicGg5VVFQZ1dKWlAvNVhF?=
 =?utf-8?B?WWhvUXFLV3pLWlhzaGxsTWxPMXhwL2luaGVyWDl3L3IrbVRQUE1VU0pVZVFK?=
 =?utf-8?B?T0Jiai9PcUJUcGlTVUtsVVFxYWpUNUY3U2lvMzR2cmJRR1loS0RtOFNKUVN0?=
 =?utf-8?B?NHZsNHc1c1RyTEhiekZ6U3lldndaUjdsTTRUWUF3Y1VRaUE2MVVMcnV0WjVK?=
 =?utf-8?B?OFE5MHpWVHYrdGNCdUNDQVpNYUhhTm9vNFVIQXJYWUU1aHYxdHlvSzBTSURN?=
 =?utf-8?B?WnZ0cm9oL1JmaHNwSG95M1pHd2VEZFZ4QmwyVXVGWHMvMDV0WExsTy96eEZk?=
 =?utf-8?B?NHk4Vk90cVg2VndndEhWMU5NUG9vYi9ueTdXYS95UlR1ODUvZGN6Y0JqVWpw?=
 =?utf-8?B?N2RVYzhwRXloTXl5T1BtNFNQTkZtWjJjT2NaT014MU1USDUzdmZKaVlkWENU?=
 =?utf-8?B?dkhnQlQ2b0w0OTlvaXAxcmZHWkozeFFMdlhTS0pHaGdqcVhqVm1xbFJuVU9a?=
 =?utf-8?B?M0dTeU1Zd0hsbGE0Tlh6N0wvb3JqYnU0NW95b3YzSW96cXM5UEVnZmZ1cUVQ?=
 =?utf-8?B?RjNWcE1XcUxONGE0QXIzd3RzdmJMVDhsRVJMT3NsdkYzajd2TnpCY2g0Q29S?=
 =?utf-8?B?SUdRRFlLOERQSVNvVGtyemh2cDQyN3VLcmpHbGlIZEdjUXRxanZKS2JBcTg2?=
 =?utf-8?B?NjdwV0ErQUNybVkvVjE1NXd4V2hDbGJEQTZwS21CTVQ3U250dWNuTjg0Mi9N?=
 =?utf-8?B?T2JkRHJ0dnIrR0RkUzg4dXVQR3ZveHc0MTA5Tm03UDNkZ3E1Tk1ranNRbXYv?=
 =?utf-8?B?RXVoejZTTmlsOEt6aWl2WEdzRE95VFFXZVpCSkdWcHMzcmtHR2JPaWNSMHhG?=
 =?utf-8?B?UjVnQmEzMGM4NXQ0aGZDVVNJUjZTYXFqODZXSnlUSkMwZ1pLcUdiZDVBbnZn?=
 =?utf-8?B?SUd1YVprWE9jR1hiMUJJYWpqQlVJKzRKQ2xoRWpBS250dm9oa3IrWUllV3ZN?=
 =?utf-8?B?WTZmSGFQdU1mTmRmKzJmWTJtTzAxeHVrZXRmbDl1RGN0ajJLb1QwVWY4ZlUy?=
 =?utf-8?B?NTdPbC9SUHJ4KzRpTjhFdU1RRUV6WVAyS25MZHk0a2oxSjhWZ3d6RHhhSmVl?=
 =?utf-8?B?bW9EMXVJMlNzR0dIeVhmdlMxLzd4eHhwZk5FNmFkV0x1VG9mOXNpVXYweHk1?=
 =?utf-8?B?WnhVaTR6bHZDRFY1amJzMGRwZ29vNThTQmMrZURMS1M0bjZSM3dkM2pYN1lC?=
 =?utf-8?B?TE8rRzMvYUE1cVJTSUs3SjVrUjA3aWRWc2xNeGpHUXo5QzBOTVRWOXBaTUdQ?=
 =?utf-8?B?QlJWcEtnM01xN3g3OGF4TXQvK0tzazBhZXNybkNtSEQvVUM1T3J1YjJZQk9x?=
 =?utf-8?B?YkdFMUlkSWJXMU92ZWwwWGRPZ3pyWm93cVB6NGZER1lLREFBakJqS0R4citp?=
 =?utf-8?B?K0NLaWZUdVRJMzJYRjhlTmd6a2s3TGtBVWlubVdKd0JNMEs2VWJ5ZzR2UzJW?=
 =?utf-8?B?VzF3Z0t2VjJWV3RtWXFiU0xWb3dsY29JTjlxaDFTWjk1UStUTGoybnpOVWZ1?=
 =?utf-8?B?QkxSbWQ1VXlvNHJrRTlGcEczQ1dPdk9XQU44WU82cGJ6M0grRm5uY3lWSXdv?=
 =?utf-8?B?am1VMHRzUjYzTlNWV3F2eVRLUkduNWVVamVZTGd6UnFYazkzczZnN3VVVWlx?=
 =?utf-8?B?ZmNQazVNRlpWbjNRWTIrWGxmUmJJaTZDRkd3dHBMUzdueWJGTC9GaEFSL1pi?=
 =?utf-8?B?dmhIaVhYUGNaNlFsdkQ1d2Y3SEtneTVKL2gzaWtGczVsQzB5c0dxcEpEejYr?=
 =?utf-8?B?bW53SGxnc0lTMWpsOWZ2dFlrRHFvVVRVVDRLZ0hEelUzSXc3MUlzN3hNU05Z?=
 =?utf-8?Q?JjPCpw8JGY0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6945
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	55015ab7-86f4-414a-b3f2-08ddd07c1741
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|14060799003|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eElnNnhidTB2a2p2dGRaOVRlTms5UnE1eTZjSVpTQXhGVzN6R2E0T0FEaGpt?=
 =?utf-8?B?ekY2RHlXa2Ztb003dkM4b2FKbHFtTkkyVmVXY0lYRWxnMlFsK2N0LzlHWldW?=
 =?utf-8?B?RFd2RzBRb0FrdVRGbFFYRXZ5Rkw0SUIxQThVVFRFc3JUSHQrelgvSS8yNnVn?=
 =?utf-8?B?bG5QRkxqU1ZtdnBkRWVjdjc4elEvZkZSc3A0WjlaUUVSUDROdDB1NTlzc1hp?=
 =?utf-8?B?cVdkT3ZIb1hobWhCZldxeTl4WVhRSCtLcnRqOEptRlVCamIzc0RjY1hJN3RU?=
 =?utf-8?B?Ums3enI5UExPcnhPbmtCYTdqZ0JCRUU1MW5pYjZoc0tuUXhSY25QN0lEc3VJ?=
 =?utf-8?B?TWRicjRZMHJHSCtNdTh0MlZhRE15K1lycHl3c29EL0dTREwzSFJZNlR0cXBN?=
 =?utf-8?B?VDZRZnVBYWxVVFhQemV0ZnI1TXhHVXBGQldLU1VHeGZqcnhFTTF2QUZwVk4z?=
 =?utf-8?B?TnpkKzdsYmtCd3J0MnZBdlpBajFmbmpmVW52OXBnc1Vxais3d1F5QVVBeFd4?=
 =?utf-8?B?SmFhbjZnak9STWhiYVFETG1XeGV0TUJZbmMzM0o5bU81eXR2QnFqUkZQN1Ra?=
 =?utf-8?B?d2psRlNVTVYrZjUrazFtQ1QzZWdaTzRjY1RJdzJMeGRlNDN4bkllSTdScmF5?=
 =?utf-8?B?blhlMHl4ejdDdG1SMHF4STdxUVNxT25pYUU1SWF1U0NVY2V2S1Z5WXJBUnVV?=
 =?utf-8?B?TVhNR1pMQmNPUTJsQlFPRHFzc3dubGVlQkkzNDZQWUZ0YjYrTnlqMm1EenBw?=
 =?utf-8?B?ZkkvdG1VVi9aczhaOWc5MGtmVVhXZWNmTlh3aXNTbW8yOGhsK01KcHh5Q2xi?=
 =?utf-8?B?c0ppZ2psb1B1WEZnY0t3MWx0bklKZFdGbDdBS0ROWDVWNGpQbjZ0dnp0cUZL?=
 =?utf-8?B?V2o4bEhDQ09VeUFJaDdwMy81NDEzSk41WHZUbU93R29kcnl4eFpyS1NWTElh?=
 =?utf-8?B?RVliUnJIWHZXWldMTkVzWFM2enZjUTFMeXFQUWx4M0JlUXZCRnU5bW5scXpu?=
 =?utf-8?B?ZmErc1BaenFrQTVQWGlaSXdHc1NGamFyK2JZMWNPb3ZYZ21RQlNCSEpEY2pa?=
 =?utf-8?B?QW1UWW9ISnZHbmk1NnB1a21EUTU3SUgvZjhWV2E2QTgxMjAzcm9HZWJvcUpW?=
 =?utf-8?B?dzZxQldadnROdU0yWldFQ2pUSlRvZUduMmZNSThrN2ViM2huOCt1YXRwa3NK?=
 =?utf-8?B?S21XWFp4a3lIM3pzeW5kMDBTQmxJQno0STJrbWtpMFoxWEVjdVMrR1pQalBx?=
 =?utf-8?B?bjZLbkNJQVlVb3JBWU8wQkZBTzFocEFkbG1EbkJzWlJkUVZranQ3dGQ3SjJO?=
 =?utf-8?B?bXU1VVI0RTRQbUpWY2kzYWhOQWphWnhGWHpabHZIejE5VnNtWVBtS0U2OUpC?=
 =?utf-8?B?ZzlGN0tKa1MrdlFrdk1kbWpIZUVWZlpLZ05DMExVTzE4Ni96bDBjczFwUWF0?=
 =?utf-8?B?UlJWVUF0SWZpU0hEQkVhSG9OVDlaK2lKbHIyUkNRYjZnUVBkNHVadzhySW9M?=
 =?utf-8?B?TDdYSXZyWGNNd0hRRGZFRGRrSCt5YWErVWxhWU5ZQTR5SXE3VjUrZGJNS3Zi?=
 =?utf-8?B?QlFxRWtFbUNYa1I5dXRzWHpXZVJ1YUhzMC9rK1QzaXQ0UVpQNDRleDFlOUJM?=
 =?utf-8?B?UGZyZnluYnRyK0IyYUhVNy9mQzVQMDZPZzkxR2tzRTJsTXNnR2dBRkZRVWhi?=
 =?utf-8?B?UlEzb09kOGtGTlNYcm0veEgrWnI3bmdXK0pDSWliWk5uM0FMZ1N2Uk9FSG9T?=
 =?utf-8?B?d21JYVQxMU5saFlzcG1ySzQwMGQ2MDE3ZnBrZ1VnbXBEaG1EVGRnQ21USVdi?=
 =?utf-8?B?Vkk1UkNnd00rQ01uZDdzOWF2dU1QUFdwRkR3Z0FqMC8wUGtVV1o4aHRxcmhO?=
 =?utf-8?B?YzlSSlNWZHJlNXZWRHZSbGZwdU1sTnI1Zjh2L3JxNUQrOEk0ZnFzZW9QMDQ0?=
 =?utf-8?B?OTJteVAyMzczMVhROW5uYjhrZmN4b0FmR3JuTnZhYnU0Q3MwNXowQzVQdDdh?=
 =?utf-8?B?RzVybEdTMlhhVFdkMCtUZnpkTnFNQVdtQUpVOE9CbkR3ZjNZNHY1QnNLQjU5?=
 =?utf-8?Q?KD2gHC?=
X-Forefront-Antispam-Report: 
	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 21:49:17.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8ed5a14-3ec8-4392-18eb-08ddd07c197f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6284
Message-ID-Hash: 7GMEPVDKRXJ6F27TBG64MVHGMHHM4FSV
X-Message-ID-Hash: 7GMEPVDKRXJ6F27TBG64MVHGMHHM4FSV
X-MailFrom: sean.anderson@seco.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GMEPVDKRXJ6F27TBG64MVHGMHHM4FSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 9/2/22 01:52, Takashi Iwai wrote:
> On Thu, 01 Sep 2022 17:25:41 +0200,
> Sean Anderson wrote:
>> 
>> 
>> 
>> On 8/28/22 3:49 AM, Takashi Iwai wrote:
>> > On Fri, 26 Aug 2022 20:57:53 +0200,
>> > Sean Anderson wrote:
>> >> 
>> >> On 8/26/22 12:36 PM, Takashi Iwai wrote:
>> >> > On Fri, 26 Aug 2022 18:22:24 +0200,
>> >> > Sean Anderson wrote:
>> >> >> 
>> >> >> Hi all,
>> >> >> 
>> >> >> I have a "FiiO DigiHug USB Audio" sound card (1852:7022) [3]. I have had
>> >> >> no problems with the audio, but I did notice a large number of message
>> >> >> like 
>> >> >> 
>> >> >> retire_capture_urb: 4992 callbacks suppressed
>> >> >> 
>> >> >> in my dmesg [1]. This is caused by the "Corrected urb data len."
>> >> >> warning.
>> >> > 
>> >> > What exact values are shown there?
>> >> 
>> >> Unfortunately, as detailed below, I was unable to turn off ratelimiting.
>> >> 
>> >> > The problem is that your hardware
>> >> > (likely a buggy firmware) returns the unaligned size of bytes as the
>> >> > data.  Maybe it's worth to replace dev_warn_ratelimited() there with
>> >> > dev_warn() and take all warnings once.  Then we can see what kind of
>> >> > values are delivered from the hardware.
>> >> 
>> >> I'll have an attempt at that next week
>> >> 
>> >> >> The patch adding this warning [2] makes it seem like
>> >> >> this warning should be an uncommon occurance. However, based on the
>> >> >> number of suppressed callbacks, this seems to be happening at a rate of
>> >> >> around 500 Hz.
>> >> >> 
>> >> >> Is this buggy hardware? Or is this a bug in the driver? Does there need
>> >> >> to be a quirk? Or perhaps the warning above should be a debug instead?
>> >> > 
>> >> > There is no quirk for that.  As long as the device works with that
>> >> > workaround (except for messages), we can simply add a quirk to not
>> >> > warn but always apply the workaround silently for such devices.
>> >> 
>> >> OK. I wasn't sure what the correct resolution would be.
>> > 
>> > Actually I was wrong: the existing quirk QUIRK_FLAG_ALIGN_TRANSFER
>> > should cover that.
>> > 
>> > Could you try to pass quirk_flags=0x04 for the corresponding card slot
>> > (the option takes an array) to snd-usb-audio module?  Alternatively,
>> > try to pass quirk_alias=18557022:0e510408 to snd-usb-audio?
>> 
>> I tried both options, but neither worked.
> 
> I have no further idea.  You should try the latest kernel without
> modification before checking further.
> 
> And, looking at the code again, it's really strange that you get those
> messages.  Actually the transfer size *is* aligned to the audio frames
> as default *unless* QUIRK_FLAG_ALIGN_TRANSFER is passed.  And the
> check is done rather the audio sample size alignment -- which must fit
> within the audio frame alignment.
> 
> So, QUIRK_FLAG_ALIGN_TRANSFER is already set for your device by some
> reason incorrectly, or the code is doing wrong on your kernel.
> We need to check what values are shown there actually, then check
> whether the problem happens with the latest vanilla kernel.

Sorry for the very long hiatus. I have reproduced this issue on kernel
6.15.8.

>From closer inspection this message seems to be from the first print and
not the second one:

if (urb->iso_frame_desc[i].status && printk_ratelimit()) {
	dev_dbg(&subs->dev->dev, "frame %d active: %d\n",
		i, urb->iso_frame_desc[i].status);
	// continue;
}

This probably be a dev_dbg_ratelimited. Indeed, that suppresses these
messages.

The actual message that's being ratelimited is

usb 3-11.2: frame 0 active: -71

which is EPROTO. Looks like that comes from xhci_hcd. With debug enabled
I get a lot of

xhci_hcd 0000:80:14.0: Transfer error for slot 36 ep 4 on endpoint

The spec says this is 

| Asserted in the case where the host did not receive a valid response
| from the device (Timeout, CRC, Bad PID, unexpected NYET, etc.).

and I don't really know what to make of that. Should I send a patch to
convert that dev_dbg to dev_dbg_ratelimited? Or do you want to debug
this further?

--Sean
