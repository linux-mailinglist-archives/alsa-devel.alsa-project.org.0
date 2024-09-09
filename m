Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A94977E42
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1B4BC0;
	Fri, 13 Sep 2024 13:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1B4BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225970;
	bh=/JCxBVWZ06yX39j9E9OqPVrk8cI55+0SXtLgbATCwYc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fFUusduGTuAYKQqx0KeW6ewyN5PORblLieYvSy6rrrL8rfc8Q/0LNrGMgNSuTlC/1
	 1CWWsKFLjRY5eBTxXQWbFw2uytHzht5KDGjsRoHRbIchlFL1LrHvKG11WhYNq+mdow
	 eVC67q9EbktreWHjPEJuf1dckayS6ASTA4jTfEZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90C4FF805E3; Fri, 13 Sep 2024 13:11:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E2DAF80633;
	Fri, 13 Sep 2024 13:11:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A0CF801F5; Mon,  9 Sep 2024 14:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B01A9F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 14:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B01A9F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=FLYw8PIZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSyxTqDXgWYs37vpVp3oRKHFbSWVUjkVuSyYp/fc2TPoj1FdwddDTiJGM12yS+wD4KxyR3hr8R0TMUzCJKt6OiBNfZyTnbe8hURXZTlF01ovgJF3AtVWjmlfcoG9X+n9l9RGjHV8zRCJW5eHK/Yxyl8YgGhAonHEGn2kIQbSZFzIh/eftScDmGiIGaQbFyyAebBnF7hywZ+qekILKK6Q8/Fhwp1B0OFo0/mcK6Bh1VGjHnN73kgm0tQ345NGmoP1miWEisysTBLxZi96JmXaQ73/qc/l7wxh8eilgFm2NQ21iqvT7aTnsStkXUh9v4J4YCXiXViozev1yGxp69o/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JCxBVWZ06yX39j9E9OqPVrk8cI55+0SXtLgbATCwYc=;
 b=AmdR2hB2FFMZf5iuVssImg4fxxBqpKEnqh0nN+UMrBHGb6hP0nXO8jXa62yKcAtBMtiq+fydr8g2eZA4nYtO1f0pqo8JlAiNhmeIPamFlu+aZ8FB7BFYsc9Ong1TVCruXUzYEuWplRw9rDAq0vpNuCGMQ0u9iwH7h8QZf8GA781ouJIBfQZq6H3cAtJr14Eb6VBngizYtIB6soVJXMgIPSmd2X1fWLuisISH4/9az4WDV5KXSd/WA3B4N7GBMTUDzA9lFQjTkUgr/OWCh2diJdGRkFdCIf/t7frTS8XHUuTgvU1LDwYjhvQeq0RpDV3xeYtCswkTUEoHKYbzTEQ+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JCxBVWZ06yX39j9E9OqPVrk8cI55+0SXtLgbATCwYc=;
 b=FLYw8PIZjNwtvn1T89eBKxVS+z43SIUi9w+wokNbVPhuGCuhIik2Lgs/W/oq9IJwGvTylgWLgPM0xdlqtYz+UZ3v8LJN/gw3hqhixlX6zTRFfTMyclbDBFX3+zk35HwurkRNZH9fkHeQwE19BwhBenF3ThPUurVX8typ0G0vlHQzUfm1OnHRnrcAe3nt9Q6ddfttXYMPbyDVMo60UkVXTGku32zYIUhoxyj8VA1g7W0QsdaCoShU5Rp5RQg0pt2nxJ613oeY7KP6hEO34QISZJLnnuC0TUWhmDycyJf21+hGudZiCjoZoqAzx+EabC6RYvFMxZWWm9F0115ojH/WMw==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 9 Sep
 2024 12:28:32 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%3]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 12:28:32 +0000
From: <Andrei.Simion@microchip.com>
To: <krzk@kernel.org>, <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
Thread-Topic: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
Thread-Index: AQHbApN9h/JoYwUM0EqNV90IXfE58bJPIgaAgABAZQA=
Date: Mon, 9 Sep 2024 12:28:32 +0000
Message-ID: <d4b445ec-dc9c-4313-8ef2-e5c086f21449@microchip.com>
References: <20240909083530.14695-1-andrei.simion@microchip.com>
 <20240909083530.14695-3-andrei.simion@microchip.com>
 <2bb15a72-82ef-4bc4-b01e-e4768687bab6@kernel.org>
In-Reply-To: <2bb15a72-82ef-4bc4-b01e-e4768687bab6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|PH7PR11MB8572:EE_
x-ms-office365-filtering-correlation-id: 95232514-70d0-4440-7409-08dcd0caeaf4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZUFDV09HT3ppQ3ZFenZrM0M0VjBzWFFVUk56eDVkQWhGODQ1MFBkUEE5dEFo?=
 =?utf-8?B?Z2VQQzE2VjZnRklMTDEzd1BiSDhxSDd1YXZnbklBdkVvTEx0VEt0RmFNTWo4?=
 =?utf-8?B?ZSs5RkM4ejYwTXkvSWRZOFh3YWh2YWFxTmgxQzFmdjBPMDlONVhPdDcxWTVn?=
 =?utf-8?B?OGQ0elRSd3dLa0ZjVUQ5aXZqc1ZxeVFVWUpoVTNiNGRTZGtsb0o4aU9VVkFw?=
 =?utf-8?B?SG5FTm5sTXZ6WlBRbjEyVkhRQW0rd3lRdDdtNWRxL2MvQmo3R29UeGxCWURj?=
 =?utf-8?B?Z3Qxd2RYM3RSQ0VzaGxzeEZ4S2Nlb09jNmMwS2Nhdnp6VXVHcEFncUJ0SzZq?=
 =?utf-8?B?ODBBeDZObXJqbnhBZXhWenVlRGE4cityZFczVXZyZU5wb2twbXdHYmN4YWhC?=
 =?utf-8?B?VTBreHB3eGNETnZtWW5PdzNManI5bXFQNk9GV0p4bFRZZ1NqcHExMG5xVi9q?=
 =?utf-8?B?bGR4cGs5Z2RoK3JsM3VsTUh3aS85blY4eUpwaU1QT1RISEVsL3VGazVKWkNs?=
 =?utf-8?B?cXdoNmNxT1JhRDBpSTY2S3hNMjFhNlpvZ0RSUzdqcnNyVkxnQWJjb2Rvcmtu?=
 =?utf-8?B?R29HdHViOFA3ZlI5WG5qMW00SmRuVGFVelJDVGJIYzFIRXpsVlB0dHlRM1d1?=
 =?utf-8?B?Lzdrc05aS2NjelJYR0JWRWZaS0tVYzhpTHZNVGxlYXVld1NnelE5L0EyV0tj?=
 =?utf-8?B?cyt0blRlWVRjdElsMURzamdNbDNkRlFwUlcvcFgzcUFBRDVXSWdvOTJKR0lU?=
 =?utf-8?B?NkY2SGVsU2N1WlhyTGJwZ2tBdGEzT203RG41OXZvQjErVUkrNStqd2ExUGxL?=
 =?utf-8?B?T2gvY0x5cVV1cjRyOUJ6QnhLTi9ydHZVanZZb0N1dW1aRlEzNFVaQ3htdXdH?=
 =?utf-8?B?cHhhbkY4bUJMc0pGVi9vVmJLb0RtQkV5cDJPVzVxdno4b3FGR0x3bTdiekk3?=
 =?utf-8?B?ajBIa1d0L3NwY3hqa3NrREhrTUU1MEtSRlV2dHpqeWZJemJwMml0UGFieHZy?=
 =?utf-8?B?T3FRMFdJekF0S0grb3B5TXA2bE84bUxKNzhFbnQvREdtRGIvOHZrdE1jK29C?=
 =?utf-8?B?STdJamM2bnp0OXZZNkgrZjlJUmFGYStUTmlUM3JYR25hQkRpNFhqU0Fua0Ra?=
 =?utf-8?B?TGZRNEVGcC9HYXNPQjdvN3o0Y1lRZFl3RWZ0SVZiUGFxTlhTNEVRL0dMT3dG?=
 =?utf-8?B?bURTZEtjRnN1V2x5am44UU96UXVCdkkxLy8zM3Njdll6TTFGc0xja3NRTkdR?=
 =?utf-8?B?NXIxZ2tmWDZ1S0tvdFdGVktFVEtmdEp6TzBmOC9MUEdKYWVCZW5Pc3N1QTcz?=
 =?utf-8?B?QitodUdiOVlkaW1zVlVPRm1MV0lySjA2ZzVaZktTWi82M3owNkhsSiswTUNi?=
 =?utf-8?B?QnU0ZkRnWnVIR3k3M0NWcmVVK0dkZkp4WTh6cTdCVGVCQlhjYjdDVy9UWFpw?=
 =?utf-8?B?eHlmMEZxYWV3cTBaRDZnRlJtU0JOWDJ6V2hEU2dMZWhyenFxUlg4TTU1SFpJ?=
 =?utf-8?B?T2dSZ29QRXM5UFdaRWoveEhJTG53MlJiTTd5WkY0OWFvVWpMQTNrb09PT2x5?=
 =?utf-8?B?aDBkT1J6aHc3aGQ3NlU4ejVKTWJmOFlxV3N5WklRQVNiSVlFWmpBUy82bGJD?=
 =?utf-8?B?QnM3U3BaODFqbEh2V29GT3M3SWJxWEFIYzIwZDZpMm9RSHRJWkNhMW9Zci9M?=
 =?utf-8?B?Ly9kZmRJM3ZVTTRjMjlhS1BKeGFBUCtRZXd1R201ekVndFhWOXJOYitzSU5m?=
 =?utf-8?B?WEZhZlFRQmJjWjRuMzJMTkxrdUN0cHZzQm1mYTJ2UXJ6MUhueFRib0Q0dnRa?=
 =?utf-8?B?czJwK1B1SFZCWURML2VkYU40RFVTRllPekFkNHFaNU5kVmcwOEZwdmxXR0V2?=
 =?utf-8?Q?cJv2c1PZa+Mc3?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWlzdXIydkhqOTk0ODc3YmdZZ0pURVFBQ3RaNThaZ1c0VUdIaS9OVmtIYUd0?=
 =?utf-8?B?cjE4T1FFeVFaL2JXRmVneENEalVibUxWOHREQW1ZOEpOclh2MXFLV0lhWmZV?=
 =?utf-8?B?YTBZUUJLRnI4elgyZ3BiZGU1Q2lNbEJkYkFnZnBQZ3RwN1lCbnV1Wktlc1NS?=
 =?utf-8?B?K0E4aG9nb2FGNUNWeVJYMDZKN2EvdnpIL0VqUEFKVDRCZTNWU29UcjUxaVNq?=
 =?utf-8?B?dm1IM0RHakE2Q0dTVVB3WVZYUW1la3V6Q3hCb0dPMG5WOURZZGRsUmZ6aU9I?=
 =?utf-8?B?cUVXR0o2dXhNcDJRUXNiL3BBMm96bnAvVHoxUytwT0Z0eFpJSDZnNU90bVNq?=
 =?utf-8?B?bHFlcURFOUhHMWpIVjhCUFVjbkpXRUhMb3dnL0I2OGFibjV2M2dMM3ZPQzcr?=
 =?utf-8?B?RVdHdzBkaFJ4ZzZibnJqMTFFa1FKb1luYWdKYXJOOGpYZk1RTmdCaWo5aU1Q?=
 =?utf-8?B?bE1ndzVQaUNhWU1oU21DVWZIUHZrN0JVclUzaG5lNldjeTA4YkZSWEFaT3hZ?=
 =?utf-8?B?YUQrTTJJMWdPTytUSHRUYTFXT1JVWHZTYThqODB3NmlJRnFySmpETXdYWTRS?=
 =?utf-8?B?Y1QwM2k0c3dPR1JISzNYTktZKzQ2N2dOQ3V5NytFc0F3Wk5sVVJ4eW9xelNR?=
 =?utf-8?B?eWNmOWxqSTliUHE2d2ZrNjluemtHaUxGcDZhQkhRaHgzM2R0WXhxTjZYR1B2?=
 =?utf-8?B?VzRsV3dvMHlyUG1KelR6a2FWOGVEL0o0b0FLczY2NDhweUNHVEJnSzRmMkky?=
 =?utf-8?B?cG5yaElkc2xMU0FYbXg5NWoyRkNCSWdRRVQ3TlB3TWZvQTN5Ti9sSE5aYVh2?=
 =?utf-8?B?eDZ2MVVrZEJEWm5JWEN2SldEZC9rUjdTakVmeEEwOHMxdGhlYUdRdWNxb0Js?=
 =?utf-8?B?d1dvQ3p3Rjh0Mm9ucjlkK1NRbUV2b0gvL3Roc0dEREZRYWZjTUhsZmdRajdk?=
 =?utf-8?B?aVJYZDNpd1BXQ015Q2o1SjA5QkpyWE1Pd3lLYlQ5V01oSEY1RE5QcDZiQ1Zm?=
 =?utf-8?B?Zy9mQ0V4ajZzQXJHWklPT0RXemV4cUJicjZxU3hFWko5STVTU2Y0VVlXOHYr?=
 =?utf-8?B?OS94VnVQN0pGU2hYNXVkMjYzaDB0dFYyQUVqUnlnTDdTa2dodkRkYmZlVWtB?=
 =?utf-8?B?QkZRL3ljd3JSd2xzeTJxcWgxSm9DdjdyZUVsUVIwVjVGZ24zY0lHL2JoblZa?=
 =?utf-8?B?NmJzRDR2d00yeGxJM2N2WXRMRW1aQ0MzWWtOUExuQ3V5aHlYczJiclIzZDZ4?=
 =?utf-8?B?dUZDd3FVWGkxc1Urd0JiVXpmdC9laWtTdVlkdHlhN041b1czU0k2eUxxVnRt?=
 =?utf-8?B?b2dHQnM5YU0wVjRvVHd0MkxwaFEwU0NIS0h6VEpuY1ZCQW9HaUl1VzNISDVC?=
 =?utf-8?B?RWY2Z3dsUWpldnVvSHBNcWVHc1g1QjlWdzkvaE9ya3g0bTZ4cWVhcXZBNW4x?=
 =?utf-8?B?aDdIK3VHSGcxQms0dk1lZkZTbFdXbGZ2RXhncE9NeWkvcTNpa1I4OWx1TTgv?=
 =?utf-8?B?aGlpVjNUVGZDQ0VJc0xDRForeGd5eEZCT2ZZMzJXUW8xTXl0Q1FLMDh6d1JC?=
 =?utf-8?B?Z3lFWUpPalBwQWY2RVNRTm95MFBMS0JCTlE0Rll4QU82alJacWJZQWtFME9Y?=
 =?utf-8?B?eTIrN3RpRS9TRm4vbG9zSm95YWNoaUF2aVBVVmczRCs3cDRrd09XUXk3Sk8w?=
 =?utf-8?B?TEI4bmZlaWljbEJxalhic0hqcjhKam5qMmw5NEo0RnlmUVNVSTV3Zzd5aDN1?=
 =?utf-8?B?S2FpWit5dkpMTDRqSS84TXVPem9GY0RKY3N2OWRxaWJxbTJ1UUVhNFdCeUk3?=
 =?utf-8?B?ZndLSkRwSGZkZXZxc1ZvS1g3UnN6UW9IVjZBZ004KzNobWZ1VWgxbFFoZkNI?=
 =?utf-8?B?RVoxdnhwd3dCMkYzVVdSM3BXZWVleWNoVFg3bHhFZ1VkV3RXTHV3bE9iUDQy?=
 =?utf-8?B?NFErcFN1b1FDaElQVFh5SVZIUjl0bkhzdi9MeFc3dHJhZkRsNVgrWmNxR0x3?=
 =?utf-8?B?MXpZMUYwdy9MYUxLU3FEbVd2Tmt5elBOalBSTUhMWkQ4SitHeG9uUFlzb1Rn?=
 =?utf-8?B?cFVUZ05OMzlDWUtJZ1V6VFdQdklhVmxQYW5RTVMybUxIOURDTW0zTUF3TVRw?=
 =?utf-8?B?NWNxd0xpWmhKSjZ2eGx0Z2V3R3d1UFNoaUlQS1kwVDFJSVUvQkQrQ1RCOENK?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <654ADFC1A375DA4C8C02DB852218628D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 95232514-70d0-4440-7409-08dcd0caeaf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 12:28:32.3186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 cLVn8cMlLR66g636GckWq36PO8WsYULNFxI+sRB5ybseDPRxFLTEAMDyjLNjAx14kIfD0ClUKlmdPCG0/71sVKV9FcjhyVXC7UuHY5szUt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
X-MailFrom: Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZKBHXBXUL2DM5OHXYJVFTWQEABHJQMPF
X-Message-ID-Hash: ZKBHXBXUL2DM5OHXYJVFTWQEABHJQMPF
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKBHXBXUL2DM5OHXYJVFTWQEABHJQMPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMDkuMDkuMjAyNCAxMTozOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOS8wOS8yMDI0IDEwOjM1LCBB
bmRyZWkgU2ltaW9uIHdyb3RlOg0KPj4gRnJvbTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5j
aXVib3Rhcml1QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gQWRkICdzb3VuZC1uYW1lLXByZWZpeCcg
cHJvcGVydHkgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGludGVyZmFjZXMgaW4NCj4+IERQQ00g
dXNlLWNhc2VzLiBQcm9wZXJ0eSBpcyBvcHRpb25hbC4NCj4+DQo+PiBbYW5kcmVpLnNpbWlvbkBt
aWNyb2NoaXAuY29tOiBBZGp1c3QgdGhlIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZS4NCj4+IFJl
d29yZCB0aGUgZGVzY3JpcHRpb24gZm9yICdzb3VuZC1uYW1lLXByZWZpeCcuXQ0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2No
aXAuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmVpIFNpbWlvbiA8YW5kcmVpLnNpbWlvbkBt
aWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgLi4uL2JpbmRpbmdzL3NvdW5kL21pY3JvY2hpcCxz
YW1hN2c1LWkyc21jYy55YW1sICAgICAgICAgICB8IDcgKysrKysrKw0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21pY3JvY2hpcCxzYW1hN2c1LWkyc21jYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21pY3JvY2hpcCxzYW1hN2c1
LWkyc21jYy55YW1sDQo+PiBpbmRleCBmYjYzMGExODQzNTAuLmFkMzRkZjY3YzdjMCAxMDA2NDQN
Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9taWNyb2No
aXAsc2FtYTdnNS1pMnNtY2MueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL21pY3JvY2hpcCxzYW1hN2c1LWkyc21jYy55YW1sDQo+PiBAQCAtNTIs
NiArNTIsMTMgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAtIGNvbnN0OiBnY2xrDQo+PiAgICAg
IG1pbkl0ZW1zOiAxDQo+Pg0KPj4gKyAgc291bmQtbmFtZS1wcmVmaXg6DQo+PiArICAgIHBhdHRl
cm46ICJeSTJTTUNDWzAtOV0kIg0KPiANCj4gVGhpcyBkb2VzIG5vdCBsb29rIGNvcnJlY3QuIE5h
bWUvcHJlZml4IGNhbiBiZSBhbnl0aGluZyBtYXRjaGluZyByZWFsDQo+IGhhcmR3YXJlLCB3aHkg
YXJlIHlvdSByZXN0cmljdGluZyBpdD8gSG93IGNhbiB5b3UgcHJlZGljdCBhbGwgbmFtZXM/DQo+
IA0KQmFzZWQgb24gdGhlIGRhdGFzaGVldCwgdGhlIFNvQyhzKSBoYXZlIHRoZSBmb2xsb3dpbmcg
bmFtaW5nIGNvbnZlbnRpb25zOg0KICAtIHNhbWE3ZzU6IEkyU01DQzAgYW5kIEkyU01DQzENCiAg
LSBzYW05eDYwL3NhbTl4NzU6IEkyU01DQw0KDQpUbyBhY2NvbW1vZGF0ZSB0aGVzZSB2YXJpYXRp
b25zLCBJIHByb3Bvc2UgdXNpbmcgYSBtb3JlIHJlbGF4ZWQgcGF0dGVybjogIl5JMlNNQ0MoMC05
KT8kIi4NClRoaXMgcGF0dGVybiBhbGxvd3MgZm9yIGJvdGggdGhlIGZpeGVkIHByZWZpeCBhbmQg
YW4gb3B0aW9uYWwgc2luZ2xlIGRpZ2l0IGF0IHRoZSBlbmQuDQpXaGF0IGFyZSB5b3VyIHRob3Vn
aHRzIG9uIHRoaXMgYXBwcm9hY2g/DQoNCg0KPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAg
VW5pcXVlIHByZWZpeGVzIGZvciB0aGUgc2luay9zb3VyY2UgbmFtZXMgb2YgdGhlIGNvbXBvbmVu
dCwgZW5zdXJpbmcNCj4+ICsgICAgICBkaXN0aW5jdCBpZGVudGlmaWNhdGlvbiBhbW9uZyBtdWx0
aXBsZSBpbnN0YW5jZXMuDQo+IA0KPiBZb3UgYXJlIGR1cGxpY2F0aW5nIHByb3BlcnR5IGRlZmlu
aXRpb25zLiBUaGlzIGlzIG5vdCBuZWVkZWQgYXQgYWxsLg0KPiBNYXliZSB5b3VyIHNjaGVtYSBt
aXNzZXMgJHJlZiB0byBjb21tb24gc2NoZW1hLg0KPiANCg0KSSB1bmRlcnN0YW5kIHRoZSBjb25j
ZXJuIGFib3V0IGR1cGxpY2F0aW5nIHByb3BlcnR5IGRlZmluaXRpb25zLg0KSW4gdGhlIGN1cnJl
bnQgZmlsZSwgSSBoYXZlIHJlZmVyZW5jZWQgYGRhaS1jb21tb25gIGFzIHNob3duIGhlcmU6DQpo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL21pY3JvY2hpcCUyQ3NhbWE3ZzUtaTJzbWNjLnlh
bWwjTDc0QzEtTDc1QzI3DQoNCkNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGlzIHJlZmVy
ZW5jZSBpcyBjb3JyZWN0bHkgaW1wbGVtZW50ZWQsDQpvciBzdWdnZXN0IGFueSBhZGp1c3RtZW50
cyBuZWVkZWQgdG8gYWxpZ24gd2l0aCB0aGUgY29tbW9uIHNjaGVtYT8NCg0KDQpCZXN0IFJlZ2Fy
ZHMsDQpBbmRyZWkgU2ltaW9uDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+
IA0K
