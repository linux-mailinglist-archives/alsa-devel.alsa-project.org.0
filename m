Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44104975DF4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 02:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FEE850;
	Thu, 12 Sep 2024 02:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FEE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726100764;
	bh=Qzz2njiq93l6+9R6pxpU+JWV7EceqdE/yNpccxeYnMc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJz517k1TfnCFj/JdgjdsAxvjvBWFlKlaoRIpewr4Kt0FAT+ih2Oh5qPsM6CXBZX7
	 ojW/CJlZcrT2FbloItAGazC8Rcsb3x+eZBVKKSE+gOi0p/ZVfJ0GLdbGqg17qbVoli
	 IMr6p+lm9joff5U08zRGqYiBSSh701Ph7dCV1Ta8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F52FF805B6; Thu, 12 Sep 2024 02:25:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B24F8026D;
	Thu, 12 Sep 2024 02:25:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26498F801F5; Thu, 12 Sep 2024 02:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6416EF80027
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 02:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6416EF80027
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy3LV3ZksHARLrZPKpT07pAZ968t4zPxB7oOTm+p9xrxj6XTwJ3aaaGe8jfxTDAT3ZtrkK30P8NrG+B0xUT4QmTVejD6supayu4zZPxIhHid4DkFKNA1Kz1mTVmwVuSKfF5EvR0VYdEkPj5ouHM81uUS3Md+rW2i24sFUymRKnnBQ/Jco43pfjBmzdxyt3MXguy589j4iNS1AMPKKlvALlTmSGroalNnJyW1ERpsyWZ2RvxEfAgIGdhWlKPA/EmQFuhtrY+zBtsimkJ2omrTxmQdZknWaUfoejtmrAPn5dAqV++razKSBYxdJE/z65MZm7FtNGzSzcDpsjJF9hf3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qzz2njiq93l6+9R6pxpU+JWV7EceqdE/yNpccxeYnMc=;
 b=ntccryeE9TJUBXcFO6re8z6kUsu5PtsPfUGakgrMPrbkbfeD/JpWvB896oTfVvwK3nXaiJKHBEU8XAvMqvLpgQsxG7kza37bCqZIWJSCQk9C/9cfmYm4iDU2RlJCAb2gIAziBYQ1JTv2cjaEt4kiJKYy6az2EdvBBuVGle9MJsVgbDBfeeSQGlczhGrrQwFYGtUyVpPBNteQquE1GBYXQKDMxAy6rtmSAcqZY1n2f+9iu9KvqRmQgNBsRWfolehL2Z3uVr9I3EStvPaBjDlAsUdZy0o9eaVeg9cvDJwf3B2aOFpjODBLc2kTy9Y/TvEX45wY1xMT2T5hvQHlbmPa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SL2P216MB3114.KORP216.PROD.OUTLOOK.COM (2603:1096:101:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 00:25:13 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 00:25:12 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
Thread-Topic: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Thread-Index: AQHbBKo7tGWNZehMf0mEod4QsIYwTw==
Date: Thu, 12 Sep 2024 00:25:12 +0000
Message-ID: 
 <SL2P216MB2337DE5DAA060646D23DE8708C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
 <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>
 <20240911-blaming-scant-9537304c2221@spud>
In-Reply-To: <20240911-blaming-scant-9537304c2221@spud>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SL2P216MB3114:EE_
x-ms-office365-filtering-correlation-id: ad93163c-faf7-443d-f041-08dcd2c15e0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MG8xb3dUQzVSUWtnbTJ2UHdNeEhYN05CbXVXNG5taXc3UmdKVGFTNDhYclow?=
 =?utf-8?B?MjcwVjlkUndYRVJFYk5WM2xGSmJvRmI1eVF5UENIU0hjUW94bDFBQThaUURp?=
 =?utf-8?B?YWxrcTVDM2VmaXBDNUZrNDhZRkNaQkdiY2lWSkxmcVhnQ2dKSnd3UkZFWitK?=
 =?utf-8?B?YVF3a1Vqcnk4OTlNeDU0bHdSY0l4dWVHVkk4N0VLaWo5dzJmME5OU09XOWRF?=
 =?utf-8?B?RU5RRHZBVldRbGsxYWlKY3ZHRlF3N2dIb0xKcjhmbUN3Q1JjWlo1WWNELzZw?=
 =?utf-8?B?WGVRcUowQjlRZUc5eHdjQUYyTnVIYi8vM0Q1ZCtxV3UwdW5xVjNYVWpLWDJu?=
 =?utf-8?B?NTJNaitKYlNqQWVnMVpCWE5tQXc5dGh0UDJ3VVd4di9EV1ZnaEs4N0Nvb2tG?=
 =?utf-8?B?ejJqcWZRa29UejNtYjY2bFZYTGRmTlNTZEo2NWU3WjhlMTJtNml6amoxWU8w?=
 =?utf-8?B?NDFoQ05JNGdlQ3R4dkRKb1luN3FYV0RrOHRoZzRwS01LTVZRbDhQd3pGN0Q2?=
 =?utf-8?B?ZnBZTWlIblFHVmRwUWE5L1dEVDlFWFIvVUJIcUttM0pxY1lkNEptYVF2dlVW?=
 =?utf-8?B?MndLNWJEbnJoWkU0OWV5TVdUc0VNVkEvMDJvSkNzanVuRUxTZGhKTkVJdWkx?=
 =?utf-8?B?ZGZnaldpbzBRK2Fqeml6RWNmRHpueHRUN0NYNkYxV3ZsQ3VwS05wbm5jMUdV?=
 =?utf-8?B?QVMzL2d3TFduZWViamc0ZjZvQlhFOHljL05ibVp4MGdvVnRDcE9jbUN4TU91?=
 =?utf-8?B?UEVObXVsYlNyUnA0bVdrcmNka3NUM0VuLzJRMTdQODdBZjIrNnM4U3B4UTc5?=
 =?utf-8?B?Qzh2T0MwaThkZnI0ZDZlc0Q1VGtqQWNoTUNXMUJYeUVxRllqeEpibkhmam44?=
 =?utf-8?B?U0xFTVVBd0tzTTdtNmdreTRxVjkyUjFPa0FoTzNNSllZQ3c3TWhob0VyTUI2?=
 =?utf-8?B?dmFkdHVsV1diRHlwUk1VOEJzZ0hDK2oyZ2Z1OG1nUGxkZldWNG1CZEhWaG1S?=
 =?utf-8?B?ekQ5OFlxSGdvc0ZrbTJsVDFoOEk1WGdnTHRHd3h0OGx1UWZXcm1LWVFBb2pk?=
 =?utf-8?B?c3l4QVNmQlFQNndTRVdwMnlNVG5OektyNmpYbEU1UjM5eGZIeEJkVjYwRW5n?=
 =?utf-8?B?ZEVrUEJwMm9JRTJuaVB4TjhIV3V4cU9zQzZ2Y05NSS91R2FNWlVWQjhXclVC?=
 =?utf-8?B?U0NWSGVDdk5renFkR2lIR2Fia2RIS2hNaW11VXNBQy93akZhV090R3AvUVBN?=
 =?utf-8?B?bDBQRmY3dmUvdVhyZUt2UG5qMndUb0cvUldHYnREZHB5czZSemxVRjdqaVA2?=
 =?utf-8?B?YjdrR3pMWU4rNGNoc3phTjZ4aHJBcXBVYW1QZXlRR3ZTY2FRQ3p1TllQYTB0?=
 =?utf-8?B?NE9ZSjFNQjd5OTE1T2NzeFVNb3ozdFg2RVlBckttdXprQkl4ZjZvSTRHZWpJ?=
 =?utf-8?B?WVE5bTZYWk1EWTIwcHFHZmVIV0c5c1NMdUZreGdYUEovb2dOWTZhUHlRRHRx?=
 =?utf-8?B?QWdLeE9kbjZsUGh4aUFma2IrSitIOHNDVytCK3NzRWR3am1TZlFwaFVIOG1M?=
 =?utf-8?B?NVg3cUVPRTZoVmNSWTl3NjFMZS9sQnI1SGxlQ2U5YjVmTG1Qc3dIek0zNlhJ?=
 =?utf-8?B?K1ZZcGVhcHloKzJad04ycTIyc3NQcU0rcmpLRExJcTN0NmlNUTZjaW9RRnQ2?=
 =?utf-8?B?TkgwdVlXK0NUK0pvRlM5WGtUQzZ6dEE4blF2cCs5dGtkVkxpSjhqeklWdmpY?=
 =?utf-8?B?Q1d4TEZzeldackJiSjQvRExZNXprL1NvUEJKVUtkT3JQcUJlcHEvN2FYS0lZ?=
 =?utf-8?B?Y3BpaVdSWXIrYVlzTEorbDJ5MjZ4TlBsSGp2d2x3KzBZV3JDK2lXRm1sZG42?=
 =?utf-8?B?SklvUUNsckczWmc2UkRmeVVUUjhjWmhsV3RkWXlBRUpPSFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2k0NjFrUHNzOTNoZFd3WWdQQlRpd0dtempZTVZKbTA3cHhNK0MyVmZ3dmVB?=
 =?utf-8?B?N2RJTWVxQ0kvcU5yWFVjY2Q2SFhEY0orNHc2U0d3UVltS1AvL25BSTVidXho?=
 =?utf-8?B?cG1qVUdkRVRJR0IyMHh4M3g2K2dJR3hwT21TeTJMWUN2Z1JiRnUyKzlkeVdt?=
 =?utf-8?B?VXJLOXlRa1FVd09lVHpWQlM3d2VoOU9OclNvckc3K0xqNUQySG9iWkNSWTFR?=
 =?utf-8?B?Y0VDanNYbkg3V1JlQTFIenUrUTRmODE5N2ZQNEtaNFU0bzVMS2IvcDR0Wmcv?=
 =?utf-8?B?Y09NUEY1U04zWktPZzNJOXlkSTQyS3dQa1pNUnpSd0NVZ3IvNy9HRzFRaHI2?=
 =?utf-8?B?UFhMdlRTbXVjOHJ3bFZ1NTd0Y0g5endkeVlTWVBkU2ZJT2pVVVJmVElud0FS?=
 =?utf-8?B?ZzQ1NHVXUGxnU3ArQW1Xc1dWNUJpUDk0SU1NM0dDQzdDL0Z0NUhMbHlTcnJO?=
 =?utf-8?B?dDlDWTUvdGRqdDZEUE5QUGhVM1dYcFNsbjJGdVpDOWNJaWVNMmE5czlmeUZQ?=
 =?utf-8?B?eEhpd1UrVHVBOXB3QjBlT3Zjd09UUWEvWXNzZlpnVkJZT3RuQnBBZElXbjhl?=
 =?utf-8?B?QnovUTNaRXR1QjhhWGxNMDI0V3BaOUFUdzhFVHNYc00xbnVaVjRwMUUwZ1dj?=
 =?utf-8?B?RXFBT0E2cFZNUGp5c3dzbDYwUzlQOWpTTURHTEVaL2JMTjhlVFBTMXFBdTZG?=
 =?utf-8?B?NERMOUNocjhVemlKZDVOUkp0YTlSaDBLRHQrZG5zeTE0VE8zNnFjZkVBQUpP?=
 =?utf-8?B?cUlGdXFGRkFnaGQwZUtBTitOYkMrRXorTnA2YjBXbHBYNWYzRWdzVW1RcHB1?=
 =?utf-8?B?d0plTHk4c1VIRWpmcGNZYVlCVHcrdWFwT1A0QkY1dDZjajV6c2FFNHZxWldT?=
 =?utf-8?B?b3EzZGhpQXZiNUIxVnhpY1V4Y2w2cEhpdlVOMThrSUlSN3NXMUMyK0w4TlNV?=
 =?utf-8?B?eUgrL1pId1laRDlxeWZsLzhucURCTytua1IwU09qbUtUTENkNXpTWGticjlv?=
 =?utf-8?B?OUlyUzZTRW5XZEpBRjRxdmYwbDd1OTI0cTNIYVE3VFhhZ0Z3UEFRVzZra01i?=
 =?utf-8?B?Z1BSa2N5SVM3WjJwTjlLQkhYTHU2c0Ftc25UaUpZZ0llWTBqV2E5MTJ0WjVD?=
 =?utf-8?B?M2RGaTBXdlVVQjI2NEZtMVg3eUhOWFZ6QWo4VVdsWmRXTmYyNXlyYm1jRlFv?=
 =?utf-8?B?T202ZGd6YU1SeDdBOVR2clYxZjJ0SC9xS2dnL25Ba2FVU25FUkN1M2QzWlpo?=
 =?utf-8?B?QW1ESTV6QTJ0S3pETHgzaDFVM0xpOStNSFpGWVhhM1pra1VHblFiRStsVUYy?=
 =?utf-8?B?eUxHUUxzSWU1aGFseml0c0xzdEZVOG0raDB6TklFMWthbGQ0WnJpU0MwVWc0?=
 =?utf-8?B?OUk2OEp2VnpLZi9oWEszZWMwQXF0WmdxaWFDYzBBYk90aUE2UlE1U3JuQmNa?=
 =?utf-8?B?czlrdVJGRzZXUkRNdjRxYjZINGNEeDJ1NEJ0U0pPYTNDZm1nbEhlSUY2Vmtp?=
 =?utf-8?B?QUZyaE9nVHNRNVUxU2NzY3JZZi9DNmp6MXpXS29Ka3lxQjA0cStLM1JGTEp4?=
 =?utf-8?B?L2xIdU1ab0hMbElmK28rQk0vMTJnL3VycjN0Qi9EZkhrUDIyYm4rQlJlR0R1?=
 =?utf-8?B?YmtaTEJ5OUEzbEQzMys5cVFiNy9HL0pZbzZ5RnNGVVdtNlpHKyswWFFwZC9i?=
 =?utf-8?B?Z2M2dnBCSThidUJvZWR3S0hLb1lOdDh5VHlNRSt0ai9HQnRWYnluRUlsWHdG?=
 =?utf-8?B?NjNaRVo0YjhVcFBCTW1IT0g2cVNhaGlUN1dEajRja2ppSCtMMTFqU2IwNTE4?=
 =?utf-8?B?aXVhSzEycFh4eWxLeU81ZHI0c0YvempEK3A4QVlON0xPdTV1QStZTmFoQ1pS?=
 =?utf-8?B?MVVkdWhWdENhcTJrbmpjZXNJN1ptSkFHUjFkQ3NhRCtzallxU2libmJaazZr?=
 =?utf-8?B?bzRibHNtKzVmaVNxZjFEbkJEM3NyRGN5aG5NZ05IWlY4VThZc1owZ1N1STd3?=
 =?utf-8?B?aTNVbnFuNm45UXRhWVFWZVo2ZWdQRit3V2RRZk5EemJQVkdzNFJlY3hPcEJm?=
 =?utf-8?B?dzFsOG5HRkh0eG5hK3g4TG00MEhEbERyQXFiZXhZV2RBdVM0SnRvVmVNQzFY?=
 =?utf-8?Q?XEMEXmGLV2dV2+ThkhhD+Dnnc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ad93163c-faf7-443d-f041-08dcd2c15e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 00:25:12.7617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ngbfxMlYLV6eYGyGEdXugVogdpQ8btN0kiFoGEw4EGIaHeHtu1+CIWKVyyFIW/CGEQY0NP07XeP6KYxuMu0gT6ESxMNKZp+kGYzXJO+esbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3114
Message-ID-Hash: VSZJMLQTEHXQY5VQ7BY2PN6NYDA6LFNS
X-Message-ID-Hash: VSZJMLQTEHXQY5VQ7BY2PN6NYDA6LFNS
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SWR2225B52TM64YVOWU6RXSZKOU4WS2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2YgY2FyZWZ1
bGx5IGluY29ycG9yYXRpbmcgeW91ciBmZWVkYmFjayBhbmQgbWFraW5nIHRoZQ0KPiBuZWNlc3Nh
cnkgcmV2aXNpb25zLg0KPiA+DQo+ID4gTWF5IEkga2luZGx5IGFzayB5b3UgYSBxdWVzdGlvbiwg
aWYgaXQncyBub3QgdG9vIG11Y2ggdHJvdWJsZT8NCj4gPiBXaGVuIHJ1bm5pbmcgY2hlY2twYXRj
aCwgd2hhdCB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gYWRkcmVzcyB0aGUgZm9sbG93aW5nDQo+
IHdhcm5pbmc/DQo+ID4NCj4gPiBXQVJOSU5HOiBQcmVmZXIgYSBtYXhpbXVtIDc1IGNoYXJzIHBl
ciBsaW5lIChwb3NzaWJsZSB1bndyYXBwZWQgY29tbWl0DQo+ID4gZGVzY3JpcHRpb24/KQ0KPiA+
ICMyMToNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL2lyb25kZXZpY2Usc21hMTMwNy55YW1sDQo+ID4NCj4gPiBJbiB0
aGlzIGNhc2UsIHdvdWxkIGl0IGJlIGJldHRlciBmb3IgbWUgdG8gYWRkIGEgbGluZSBicmVhayBp
biB0aGUgcGF0Y2gNCj4gZmlsZSwgb3Igc2hvdWxkIEkgbGVhdmUgaXQgYXMgaXM/DQo+IA0KPiBO
b3JtYWxseSBJIHdvdWxkIHNheSB5b3UgY2FuIGlnbm9yZSB0aGlzLCBhbmQgdGhhdCBjaGVja3Bh
dGNoIGRvZXNuJ3QgdXN1YWxseQ0KPiBjb21wbGFpbiBhYm91dCB0aGUgYWN0dWFsbHkgZ2l0IG91
dHB1dCBpbiBoZXJlIC0gYnV0IEkgdGhpbmsgY2hlY2twYXRjaA0KPiAiYnJva2UiIGJlY2F1c2Ug
eW91IGRpZCBub3QgcHJvdmlkZSBhbnkgY29tbWl0IG1lc3NhZ2UgYm9keSBhdCBhbGwsIHNvIGl0
DQo+IHN0YXJ0aW5nIHBhcnNpbmcgdGhlIGdpdCBvdXRwdXQgaW5zdGVhZC4gWW91IG5lZWQgdG8g
d3JpdGUgYSBib2R5IQ0KPiANCj4gPiBXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBm
aWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/DQo+ID4gIzY1Og0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4NCj4gPiBJZiB0aGUgd2FybmluZyBpcyBhcHBlYXJpbmcg
YmVjYXVzZSBpdCdzIGEgbmV3IGZpbGUsIGlzIGl0IHNvbWV0aGluZyB0aGF0DQo+IGNhbiBiZSBz
YWZlbHkgaWdub3JlZCwgb3Igc2hvdWxkIEkgbWFrZSBjaGFuZ2VzIHRvIHRoZSBNQUlOVEFJTkVS
UyBmaWxlPw0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBJIGFtIGxlYXJu
aW5nIGEgbG90IG9mIG5ldyB0aGluZ3MhDQo+IA0KPiBVc3VhbGx5IGZvciBiaW5kaW5ncywgd2hp
Y2ggaGF2ZSBtYWludGFpbmVycyBsaXN0ZWQgaW4gdGhlbSwgeW91IGNhbiBza2lwDQo+IGFkZGlu
ZyBhIE1BSU5UQUlORVJTIGVudHJ5Lg0KPiANCj4gQ2hlZXJzLA0KPiBDb25vci4NCg0KVGhhbmsg
eW91IGZvciB5b3VyIGFuc3dlciENCkknbGwgbWFrZSBzdXJlIHRvIGFkZCBhIGNvbW1pdCBtZXNz
YWdlIG5leHQgdGltZS4NCg0KSSdsbCBnbyBvdmVyIGFuZCBmaXggdGhlIGVycm9zIGFnYWluLg0K
