Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ED94FDA1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 08:13:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4666021E1;
	Tue, 13 Aug 2024 08:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4666021E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723529620;
	bh=6PjcX0xljjo8ZSGhnPvfCsDoptB8fUCyL6AXvMNo6bg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VaPz8q9b6v17c+vFda1oM4nVNgTcO1r13lLLFjcososgZ9F5HFnBC6YclT0KgxvyR
	 VkGPf5B46kM9n9MR7vjYSMBjj5ux8YNnTf3d7e6PXs+iMQUA/BnlJyoJ/rEgU+pcvY
	 Rz3qopcD0q0asL2PvdvjOqVF3RlzZ9D1kCX22Uq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4773EF805AB; Tue, 13 Aug 2024 08:13:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D77F805AA;
	Tue, 13 Aug 2024 08:13:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31F7FF80423; Tue, 13 Aug 2024 08:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SLXP216CU001.outbound.protection.outlook.com
 (mail-koreacentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CCC5F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 08:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCC5F8016E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9OxJBpzlMUzUIB6E9v26NJpIjdOea1SkWrSxnRdKQzfTezb16+1sEmHdr6yLT2cTP7IchUVRCg05KcX+ayN0+WEgeNpgVraGiB7/7d59UFZ9YX47Dy36YcwxFo6w9DF6rFiaX22GfEDH/U/X6XbogO2E7qYUKaBcPntT2tjMs79opsSpjyW0Oe6wcLYb5Wud7aPdwtfyrDeo+5TKNZfcf3Z+RCXx0RYaDoa62gVdzq3NDWCgIz0hIZ1eUJRly917iFrWz6k22amHtRQdelNaJ8syUCr4oafOJKM1GSqD+XrKS0syDs5ltTXoB7BNAbveADg4ndjL6eJlzy5yO4V4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PjcX0xljjo8ZSGhnPvfCsDoptB8fUCyL6AXvMNo6bg=;
 b=qc01AuSz43cpG7QGrAJg4BY5CTA3q8tMdmhdRfNL+m52jW2h3eoUH0g8/m8RbxwD0q3sJD0zRJKbllSYxLwl8CbMP7pT4M2uDJlRD6lVVhoVU/1LlUSccXCgob46vg5vX6QsP6eeAI8vGJc6EMM4Yn4ZRATsRjVVhaSlqzqjA5poz9NeX/8jckHbrHCK30S5sgW85218ab0z5Q3yij4YwCHYB151blD/ZUhW6by/2vxziyoyfMiUZn77XcFO5c+adsCyx4nnsezldq/P3pwsPPR3SEAD7FKOxJ6s8xAeMbnkvvRViJ8f8phQh4PW6luw+SItHIDxdALhpy7PobUQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB2076.KORP216.PROD.OUTLOOK.COM (2603:1096:101:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:12:43 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 06:12:42 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device SMA1307
 amplifier
Thread-Topic: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device SMA1307
 amplifier
Thread-Index: AQHa7Swqu+vMvEHVcEu0r6sewSQaH7IkrQCAgAADvPA=
Date: Tue, 13 Aug 2024 06:12:41 +0000
Message-ID: 
 <SL2P216MB2337A1BB7448C0329DE5A9D08C862@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240813025436.52410-1-kiseok.jo@irondevice.com>
 <20240813025436.52410-3-kiseok.jo@irondevice.com>
 <558482df-bc32-4f55-a73d-7aa57c0ca503@kernel.org>
In-Reply-To: <558482df-bc32-4f55-a73d-7aa57c0ca503@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB2076:EE_
x-ms-office365-filtering-correlation-id: 2da1c3be-5c2b-4dda-37b5-08dcbb5ef0bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OG03enRsU3F2d3BwNitUempMUXpCT0VPaVJpNzRiemNSa2VpNVRHMnUrTVhv?=
 =?utf-8?B?NHBLaUc0Sy9yaGxSOE9JVVhjWWlqNXlHYkVaL29JYW5Jd3lDWjhtRmlET0E3?=
 =?utf-8?B?clMrdmh0bWFka1pCc0NjaytRc2dXTzdYKzJFQkRuZmNCYllJSU9sblRWdnNj?=
 =?utf-8?B?SHp2RVRwdkVHaTJvSnQzNitKN24zNk9YVVRQUlZYSW1IS3d5Z2xYbW02d1V0?=
 =?utf-8?B?QmN2WXNZb1JDdkxMMFFBTFdlWmd6UUxLMzRqM0JkVFk5dHA2N0Y1Wjhkb1p6?=
 =?utf-8?B?QThPZVdOZ05YbmhuMm1FbmZ2b2VSbUhsSDZaVFcrZjVzMm9MZ3lhQkRpYjJB?=
 =?utf-8?B?RjJHU2ZrWU5henNnUjVYdDJUYlFsWkxDbFpWYTM3OWlWZG1OOTNxQVJSWXJi?=
 =?utf-8?B?dm1USWVqUVdhYkVkeDdGME9lU3dGQ0tBK1RORTBjVXhIVTR1OWR6TDk0bmMx?=
 =?utf-8?B?NUttODI1QXVpblN3K093UDRHVXY5NDhYYmN6VnNrTlRucUdNa3h6WllBeVkr?=
 =?utf-8?B?WS9DTXBlRFozd2UyMW5ZQzZnaGhWcDBGY1FIaVh1TE5iRXhJL0VwUzZFRStG?=
 =?utf-8?B?aE9UVjVEWFUwdjgzK3Jub1VKek5ONlhqM2NEdDVNdnhrOHhnSitBaHhqZFRO?=
 =?utf-8?B?RGZyRnJHMW9SZEJyaERxWExTTXhBbHhwTm1BMEhKb1Z6MGluUlFVRHpBTzc0?=
 =?utf-8?B?Zjd0TWwrRW1rYjZQWDIraXloaGQyOUg1QVJaQ0tPcW95dk9YWDhCQVJzaTJw?=
 =?utf-8?B?c2tWOVgxQ0xQOEh5TVNGaTdUSU4vVWsrM0VaQ2xLYStaSEVzbk9HQytweXA1?=
 =?utf-8?B?d01UMEdydmJXeEZaeVFzTEY1NlAxaFBFWXNoS2lPVlVWZFE4OWR3VTVPQ1NL?=
 =?utf-8?B?YjRHcEJFdDBsSWtLVmlBeEZnd3ZEQk80R3NCa2R3bzZQemdrK0RSZGx3L2VL?=
 =?utf-8?B?M3FRLzNmRGllbUkrL0UzUDU0ZTZ4RXc0blcvMmE3bElpdW5xUGk5VTVCYUxP?=
 =?utf-8?B?anZYZStLeUFRLzM0OXVVWjNiUEo3azdJTmNrbTFpRXhuWEUzMG5KOGUvVnpU?=
 =?utf-8?B?d2p2VzY5dFd5YzU1VlUyWGVRaHo2S2F6TmJacEQwYmlseEI0K0c0eTZaNWxM?=
 =?utf-8?B?NW9RNTMvOVZCcnlKeUFobmJGYWV6b21VbVZLekNpMElPakdoVjdjOWxvVzhy?=
 =?utf-8?B?TnV0bjlaNDU3anhEcERFSWRyWmdIY2k1Y3lSOFF2d2VTcnBMazFCVUhVRFJo?=
 =?utf-8?B?K3hlMGY3SjhJL1RVM1NILzNTdWNpeDFDb0t5a0JLclN5SUh4WlNhc0V5Q1hK?=
 =?utf-8?B?b2wxdWh3cFhrV1dSZzgrSVNuSWJnZWl6TkI1TGJHZ3JJd2EwaWIvVzJDWTZI?=
 =?utf-8?B?ZGZyNFpseFAzTFM4RjdLcjZvbjc5TmZ0OHRGL09EblZ6YTlXK015TzE5Smpx?=
 =?utf-8?B?STc2OTE5ZXRJcWJNRFMzMmcrTndTd0NTQmo2aE5xY3hPNTI4Um9RTWJIdTFI?=
 =?utf-8?B?cDJxS1RwSE8yUzVYNVBITUJ2bWJESitQQ1VVenppZGxobUVTbkVWVnpmNUlD?=
 =?utf-8?B?ZUFUcXdHeUdaeWREOG9hRUd4RzJLQWFoOUpQMmg1Ym4rSVNJZlpacFc5SUdj?=
 =?utf-8?B?ZGpDQlF4b1kvN05zNS91N0cvV3RKQjJMeWZuMVR6YUZyS3did0t3QTJPUHFu?=
 =?utf-8?B?TnRFSU5yQ0tndGJwSDgwcjBYclNuR3ozRlE0eDlVUS9CalkxaFAxU0ZKOHlB?=
 =?utf-8?B?SVJSN0ZnWkNJQnhWdXJQVnpkbWRLTTB3cnpWdE9MRWViRldqQlRjT254M3lp?=
 =?utf-8?Q?vjV4uBrDDBic3j5QWg7LS2T5BdEypiFyUqAmM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEt6VjY2bWoyalg5RVRRblRsYmpraHM2dG01RzV1K2NnRG5tZjVtTjVSR0lS?=
 =?utf-8?B?SjZ3MlIraGdsb2k0UFlYdmpNQjNFMXV3MXFCa1crdnE1WTROajdVdHVzRlBD?=
 =?utf-8?B?bmNPWDVsV0p0QzNabGlDT2FEbzh0dzFweUY1VGZUQjQwV0E4ZW9wWUMyVmY4?=
 =?utf-8?B?eGZKTlpjOVczMStnKzRsWTlpTTVkT1B4NXRRY2wvKzEwRE5Uc3VXTTFHRWtp?=
 =?utf-8?B?MnVwdWgraGpjNkFDUEJZc3NYZkZRd0tmbXZrR3JEZGc1TTI2eGRWRDhOL0po?=
 =?utf-8?B?TDVCVlluV3lTZGxxbDNZaGUwc1N6ZE1uL1BTaVJBb0x1U1g0VkZRc2tTL1pa?=
 =?utf-8?B?bFNsS2UrdTNhL3J2WjNvSGZQeGY4MEdYaDliYXNQV0dpeGhUSEJsRlpyb3M0?=
 =?utf-8?B?dzNSZVNNVFFIWkM5S1hnbVBlMGQ1MFRUWW96T0pnaVBib0lGN1MrRVZtd2oy?=
 =?utf-8?B?NTdWcjQ2WFRMNXQxdU93TGw4S1k4MCsrTm9LWEpFd2QzU0tDaDZVR1E0bWVw?=
 =?utf-8?B?Z3JhNUxXYmtPYy9GQU1XWGE0NHVkRVM4cUZoQzJGQjRhZDlySXJSNHJ0dXNQ?=
 =?utf-8?B?TEJJWnNhYVJ4VHRWbU5wZXlMSHJlU1FQZGpLWUJPZ0xlY2RiMEduYnl0ZWc5?=
 =?utf-8?B?QXBEL25uT29oUXBTL3ZnejZuY1dKNVFxLzZFZ0hFcEFtVmd0blJ6d3E4TVha?=
 =?utf-8?B?R1RhUDJnKytqT010MTZNbFFmbXFDMnA0dytiMlZvajVKdXVkWGpONUtUOGpM?=
 =?utf-8?B?YzMvYmlrSEU5WEVKeDdvNTFaaGRWamFjTDBDbUQ0empZMkdVcyt4dG1POThZ?=
 =?utf-8?B?dURaQU5uK0V2UjYrbkhLbmxZWXlVaWFIRFk1SjNxdWlzcVNjbVp4WDVQcWRz?=
 =?utf-8?B?TC9xcXhwOTJmSUIyZnRRblpINk4xNXROb1dsWHFLeUJnNEhVd3YyVnZ6RXJn?=
 =?utf-8?B?WmNnVXF5WktzM0drWW9abFNHK2hNOVJpZEhOTlFxT0pDYXJIdDBwUnc5aDhC?=
 =?utf-8?B?ZTlrUEZiS0hlZjlUQklCZFN6cithbG94M3o1TEo3VmpIS3hZbmk4ZUR6VStQ?=
 =?utf-8?B?OTVFZXBQdW9zNHNKelFJdW9OMWFMRzBwTVozQ1FGaWtHdXp4d1VkcnhKZTli?=
 =?utf-8?B?VjVjbnV1SEFXbVN4NGRZQml5dmhydUdrbjlESnQwMTZBYnRqNlJLWUdRdFdK?=
 =?utf-8?B?Zkg2bFpMTTI3d0NtS25pejE4UHhBZ1pjTVZDbUJIcXNOOHNsbW5UVmhDa1hq?=
 =?utf-8?B?ckVSditnbVNXOWZJSzJEVGx0MG5nY1VGR2pQS29pWlh1NjFvczAzcHQ5VVBi?=
 =?utf-8?B?RkRHTGNnZUovanV5RWFZOWJRT0V6TDlIaTdWcmhrR29xK2NiTG9xQUJySFlq?=
 =?utf-8?B?V2NMZzc2cDQzelArYk1TTXgyZ1Fpa3A5WmNwTFd1MDJveGFsMjArdU5laDYz?=
 =?utf-8?B?R0EvTVpDY0ZWa3YzMHNHUXNVL2dqZUFjNWZwdmRRdW8rWmdHRDI1THFNMzdB?=
 =?utf-8?B?Q3JTTmM2enNwTU9PMmMrcnd4bkFoSnp0NUtaUVVUSGFNKzJiSjRzanNKZ1JM?=
 =?utf-8?B?a004L2JGOFQwNml6WWVma2pnblZLenh2SXd4Q0RuRTZJRVovbzNncTVHTVJI?=
 =?utf-8?B?Z2E5aUtPRE9TVHJEOC9TM1VzSTdXNmczS29zc2IrY05TRnhjUmw2ZFhGUTZY?=
 =?utf-8?B?S3gxUmdUR2hrckwrOC9ySVMxaFA3R2RhMUFqcnBjMkcyTy9pd2x2R2k0eVlq?=
 =?utf-8?B?R0FiTXB5S0lJM0JCL2Y0anY5TlJJRXZqODNJeW5TMTluMVhsMHdtY2lrcm1n?=
 =?utf-8?B?aENwS3lvQk9yTTMvN011YzRGZ0ZGU3FuaUVoNTJ6R0hNNEoxbzNheXhldys3?=
 =?utf-8?B?Y3Z3a1hwdm5uUGRtbSsyWjVoaWxKQXl4d3JoOHR6eERYSnE4TmNEQ3ZJUXdk?=
 =?utf-8?B?M0FJVUlocU1ieDZ3OTZwTGxwM3VCc2VCSlNMTVFZKzZGTE01OUVQYVVUczhv?=
 =?utf-8?B?eEk3ZDZ3RDZ0NWpadlY2YW96a3dTdnFCempzcVNyeG1vM2R2N2JzamxBL0Zo?=
 =?utf-8?B?MU1PamRtV2NhUE5nNkpFdWVSZElxVUlOUUJUTW1uZmxlTXNrb2I5dUhGYVB2?=
 =?utf-8?Q?r2Qd1fkIYepevA3IsQs+Bpfy4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2da1c3be-5c2b-4dda-37b5-08dcbb5ef0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 06:12:41.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 l6ynmUQEp9eH+e2LzLxwA2diYwfK7nh3A34OggUy8nIJm1bFP0GKfu6eNbw+3Gb9X2SIus41D+RQxgvb/3+vbFJzYM3ZI93UQMdMV0QWajo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2076
Message-ID-Hash: LXIIBHLY6TKTHHA23SLFODX7GFJLARFA
X-Message-ID-Hash: LXIIBHLY6TKTHHA23SLFODX7GFJLARFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZWJ5AIACHYKWHCLXL4KN3IKQJWARMU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+IE9uIDEzLzA4LzIwMjQgMDQ6NTQsIEtpc2VvayBKbyB3cm90ZToNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBLaXNlb2sgSm8gPGtpc2Vvay5qb0Bpcm9uZGV2aWNlLmNvbT4NCg0KPiBNaXNzaW5nIGNv
bW1pdCBtc2cuIFBsZWFzZSBvcmRlciB0aGUgcGF0Y2hlcyBhcyBhc2tlZCBpbiBzdWJtaXR0aW5n
IGJpbmRpbmdzIC0gYmluZGluZ3MgYmVmb3JlIHVzZXJzLg0KDQo+IEEgbml0LCBzdWJqZWN0OiBk
cm9wIHNlY29uZC9sYXN0LCByZWR1bmRhbnQgImJpbmRpbmdzIGZvciIuIFRoZSAiZHQtYmluZGlu
Z3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuDQo+
IFNlZSBhbHNvOg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43LXJjOC9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5yc3QjTDE4DQoNClRoYW5rIHlvdSBmb3IgdGhlIGFkdmlzZS4gSSdsbCBtYWtlIHRoZSBjb3Jy
ZWN0aW9ucyBhbmQgcmVzZW5kIHRoZSBwYXRjaCB3aXRoIHRoZSBjaGFuZ2VzLiBMaWtlIGJlbG93
Og0KQVNvQzogZHQtYmluZGluZ3M6IGlyb25kZXZpY2Usc21hMTMwNzogQWRkIHNtYTEzMDcgYW1w
bGlmaWVyDQoNCj4gPGZvcm0gbGV0dGVyPg0KPiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50
YWluZXJzLnBsIHRvIGdldCBhIGxpc3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZSBhbmQgbGlzdHMgdG8g
Q0MgKGFuZCBjb25zaWRlciAtLW5vLWdpdC1mYWxsYmFjayBhcmd1bWVudCkuIEl0IG1pZ2h0IGhh
cHBlbiwgdGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyIGtlcm5lbCwgZ2l2ZXMgeW91
IG91dGRhdGVkIGVudHJpZXMuIFRoZXJlZm9yZSBwbGVhc2UgYmUgc3VyZSB5b3UgYmFzZSB5b3Vy
IHBhdGNoZXMgb24gcmVjZW50IExpbnV4IGtlcm5lbC4NCg0KPiBUb29scyBsaWtlIGI0IG9yIHNj
cmlwdHMvZ2V0X21haW50YWluZXIucGwgcHJvdmlkZSB5b3UgcHJvcGVyIGxpc3Qgb2YgcGVvcGxl
LCBzbyBmaXggeW91ciB3b3JrZmxvdy4gVG9vbHMgbWlnaHQgYWxzbyBmYWlsIGlmIHlvdSB3b3Jr
IG9uIHNvbWUgYW5jaWVudCB0cmVlIChkb24ndCwgaW5zdGVhZCB1c2UgbWFpbmxpbmUpIG9yIHdv
cmsgb24gZm9yayBvZiBrZXJuZWwgKGRvbid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSkuIEp1c3Qg
dXNlIGI0IGFuZCBldmVyeXRoaW5nIHNob3VsZCBiZSBmaW5lLCBhbHRob3VnaCByZW1lbWJlciBh
Ym91dCBgYjQgcHJlcCAtLWF1dG8tdG8tY2NgIGlmIHlvdSBhZGRlZCBuZXcgcGF0Y2hlcyB0byB0
aGUgcGF0Y2hzZXQuDQo+IDwvZm9ybSBsZXR0ZXI+DQoNCkkgc2VudCB0aGUgZW1haWxzIHVzaW5n
IGdldF9tYWludGFpbmVycy5wbCwgYnV0IEknbGwgdHJ5IHVzaW5nIGI0IGFzIHlvdSBzdWdnZXN0
ZWQuIFRoYW5rIHlvdSBmb3IgdGhlIGhlbHBmdWwgaW5mb3JtYXRpb24uDQoNCj4gPiArICBjb21w
YXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBpcm9uZGV2aWNlLHNtYTEzMDdh
LXcNCj4gPiArICAgICAgLSBpcm9uZGV2aWNlLHNtYTEzMDdhLWYNCj4gPiArICAgICAgLSBpcm9u
ZGV2aWNlLHNtYTEzMDdhcS1mDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgSXQg
aXMgZGl2aWRlZCBhY2NvcmRpbmcgdG8gdGhlIHBhY2thZ2UuDQo+ID4gKyAgICAgIFRoZSBXTENT
UCBwYWNrYWdlcyBhcmUgZGVub3RlZCB3aXRoICd3JywgYW5kIHRoZSBRRk4gcGFja2FnZXMgYXJl
IGRlbm90ZWQNCj4gPiArICAgICAgd2l0aCAnZicuIElmIGEgJ3EnIGlzIGFkZGVkLCBpdCBpbmRp
Y2F0ZWQgdGhlIHByb2R1Y3QgaXMgQUVDLVExMDANCj4gPiArICAgICAgcXVhbGlmaWVkIGZvciBh
dXRvbW90aXZlIGFwcGxpY2F0aW9ucy4NCg0KPiBQYWNrYWdlIHVzdWFsbHkgZG9lcyBub3QgbWVh
biBkaWZmZXJlbnQgY29tcGF0aWJsZXMuIEFyZW4ndCB0aGV5IGFsbCBjb21wYXRpYmxlPyBPciBl
dmVuIHRoZSBzYW1lPw0KDQpUaGV5IGFyZSBhbGwgZGlmZmVyZW50IHByb2R1Y3RzLiBGb3IgZXhh
bXBsZSwgdGhlcmUgaXMgbm8gc21hMTMwN2FxLXcsIHNvIEkgbGlzdGVkIHRoZW0gYWxsIHRvIGRp
c3Rpbmd1aXNoIGJldHdlZW4gdGhlbS4gVGhlcmUgYXJlIGhhcmR3YXJlIGRpZmZlcmVuY2VzIGJl
dHdlZW4gdGhlIHByb2R1Y3RzLg0KDQo+ID4gKw0KPiA+ICsgICcjc291bmQtZGFpLWNlbGxzJzoN
Cj4gPiArICAgIGNvbnN0OiAxDQo+ID4gKw0KPiA+ICsgIHVzZS1iaW5hcnk6DQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgd2hldGhlciB0byB1c2UgYmluYXJ5IGZpbGVzIGZvciBk
ZXZpY2Ugc2V0dGluZ3MuDQoNCj4gRHJvcCBwcm9wZXJ0eS4gWW91IGRlc2NyaWJlZCB0aGUgZGVz
aXJlZCBMaW51eCBmZWF0dXJlIG9yIGJlaGF2aW9yLCBub3QgdGhlIGFjdHVhbCBoYXJkd2FyZS4g
VGhlIGJpbmRpbmdzIGFyZSBhYm91dCB0aGUgbGF0dGVyLCBzbyBpbnN0ZWFkIHlvdSBuZWVkIHRv
IHJlcGhyYXNlIHRoZSBwcm9wZXJ0eSBhbmQgaXRzIGRlc2NyaXB0aW9uIHRvIG1hdGNoIGFjdHVh
bCBoYXJkd2FyZSBjYXBhYmlsaXRpZXMvZmVhdHVyZXMvY29uZmlndXJhdGlvbiBldGMuDQoNClRo
aXMgaXMgYW4gb3B0aW9uIGZvciBjaG9vc2luZyB3aGV0aGVyIHRvIHVzZSBhIGJpbmFyeSBmaWxl
IG9yIGRlZmF1bHQgdmFsdWVzIHdoZW4gY29uZmlndXJpbmcgdGhlIGhhcmR3YXJlLCBzbyBJIGNv
bnNpZGVyZWQgaXQgdG8gYmUgcmVsYXRlZCB0byBoYXJkd2FyZSBhbmQgaW5jbHVkZWQgaXQgaW4g
dGhlIGRldmljZSB0cmVlLiBJZiBpdCBpcyBub3QgYXBwcm9wcmlhdGUgYXMgYSBkZXZpY2UgdHJl
ZSBlbnRyeSwgSSB3aWxsIGNvbnNpZGVyIG1vdmluZyBpdCB0byBzeXNmcy4NCg0KPiA+ICsNCj4g
PiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAt
ICcjc291bmQtZGFpLWNlbGxzJw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGkyYyB7DQo+
ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgIGFtcGxpZmllckAxZSB7DQo+ID4gKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiaXJvbmRldmljZSxzbWExMzA3YS13IjsNCj4gPiArICAgICAg
ICAgICAgcmVnID0gPDB4MWU+Ow0KPiA+ICsgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvPjsNCj4gPiAr
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDw0IDA+Ow0KDQo+IEluY2x1ZGUgcHJvcGVyIGhlYWRl
ciBhbmQgdXNlIGRlZmluZXMgZm9yIGZsYWdzLg0KDQpJIHdpbGwgcmVtb3ZlIHRoZSBpbnRlcnJ1
cHQgYXMgaXQgaXMgbm90IGJlaW5nIHVzZWQuIElmIG5lZWRlZCBpbiB0aGUgZnV0dXJlLCBJIHdp
bGwgYWRkIHRoZSBoZWFkZXIgZm9yIGdwaW8uaC4NCg0KDQpUaGFuayB5b3UgZm9yIHlvdXIga2lu
ZCBmZWVkYmFjay4gSSdsbCBtYWtlIHRoZSBjb3JyZWN0aW9ucyBhbmQgZGlzdHJpYnV0ZSB0aGUg
dXBkYXRlZCB2ZXJzaW9uLg0KDQpCZXN0IHJlZ2FyZHMsDQpLaXNlb2sgSm8NCg==
