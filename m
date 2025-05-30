Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA14AC974A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 May 2025 23:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418C060221;
	Fri, 30 May 2025 23:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418C060221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748641719;
	bh=0obM9KkT1KOAc2OV29NL/WH9AQCgB9yC15O4Mb+zaCo=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UFgmRBH5LErNrBndV51vFuUXxgU8X5snHF7mLnEywh2VsOGHSx53QkRB5TJCGdHRB
	 /bUgPQAx92XANMflA4c/J4Zbjr9QKmgAL6JXKcAJo2EFWyFxwzjtfkTCWrJhHF2qvw
	 3pCG7toBQ11WfxCdKb3Om7WXp2PlBF6kLVdVxs+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76051F8049C; Fri, 30 May 2025 23:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 220FEF805BD;
	Fri, 30 May 2025 23:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B5F0F8049C; Fri, 30 May 2025 23:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
	T_SPF_PERMERROR shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B0BAF80075
	for <alsa-devel@alsa-project.org>; Fri, 30 May 2025 23:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B0BAF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=palmerwirelessmedtechcom.onmicrosoft.com
 header.i=@palmerwirelessmedtechcom.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-palmerwirelessmedtechcom-onmicrosoft-com header.b=iMEQvHVi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJYsfjR2TqBAhsDss0rDK8mChmRKc5HP+7OTxkb3/7lOQ7Jl0OWhQjBxyFf+EsSeXz0TI2oYu6Vmw28L4REu3z0Dm5HnTANQPgbUiTsDkyakV72gWJndtSTT90AZ11Z4kxuh7q3Wf+nzFBOGK4P8D4mOV0NXxp6p8YTGDANjruhTdEh0YZXWl5JJe/EUwhEpiLQXfCzVIvRNBt4WXJIKxGpAIbJveIntMRYJs9HcCNUA+hLyI+P5mpNClbmOVd0mMWsOSA/2CcEtSbaLVmYK39D0kng+/5vfV9uacjfOtPVNe0eNS8cxeGxVq9pl/OPLHKaxb9LwEzEbrrftjUlnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0obM9KkT1KOAc2OV29NL/WH9AQCgB9yC15O4Mb+zaCo=;
 b=VOml+CBZwpsK1/gwxtsbXy8ezWIxppnS0+EiuAiuOSqZQvhKSOvWwaR/mioZkpN4I//dcxcPNKTx8IGVe1fRSOx5ZAH+8V7mv1TVRtTCaHM6/U0Oy4SSsFGeJT2i4JkF3bhjy7/mk0hUgBn9Ybpnjrf44DM3fZxpMgXm4OI5h+Yx96O8Qf6FFWjWGxzDazUtfyAV2GjdDyPTL+iQOqNAWv+hilqT/4Z8w/ynp1WQwVDyM+9CkyGGPUTHxftFZdRtGFZtzI04NrLuSgwCmn7UMvXJlhiWeubGfr2TLXod8BOqkUQR5tuZZLqXrqaUxMI/o3qI3pJgwIDIokbsdKRz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=palmerwirelessmedtech.com; dmarc=pass action=none
 header.from=palmerwirelessmedtech.com; dkim=pass
 header.d=palmerwirelessmedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=palmerwirelessmedtechcom.onmicrosoft.com;
 s=selector2-palmerwirelessmedtechcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0obM9KkT1KOAc2OV29NL/WH9AQCgB9yC15O4Mb+zaCo=;
 b=iMEQvHViyIXNnHgvadLDoXjJm6JCmjnAFVh7DbgU59+fd+hPjggJY4Q/WnoVfcGByOZ3T6yWRZjmaQKksHUmM1ZmOXniql3hmweRMFViNlwj6AlZ0SSCGBY7jj5KqJosvwcP3QPH1G/VgPO1obzTP9eYhx+tfxovnFKuULM8DWY=
Received: from IA1PR15MB6008.namprd15.prod.outlook.com (2603:10b6:208:456::5)
 by IA1PR15MB5420.namprd15.prod.outlook.com (2603:10b6:208:3af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 21:47:53 +0000
Received: from IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e]) by IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 21:47:53 +0000
From: Steve Broshar <steve@palmerwirelessmedtech.com>
To: Lars-Peter Clausen <lars@metafoo.de>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Topic: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Index: AdvGm2GwhjF7ALRDTa6EaezGwRm8LgAxw3iAApIRTDA=
Date: Fri, 30 May 2025 21:47:53 +0000
Message-ID: 
 <IA1PR15MB600894BEC69309E17E839812B561A@IA1PR15MB6008.namprd15.prod.outlook.com>
References: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
In-Reply-To: <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=palmerwirelessmedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR15MB6008:EE_|IA1PR15MB5420:EE_
x-ms-office365-filtering-correlation-id: 01b66103-fae0-4e89-572a-08dd9fc3a172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MlFqVmUvazRLZFlKbHRxMkVpaGpqVmp5UVV6V3k2YTFvU1hVN0U5YVBRY0Ri?=
 =?utf-8?B?M2J0cXNNQml6amFaMHd3NEMvSFdjd2RPU0d4MVNYTHdVeGppTzZmZUFmbDlR?=
 =?utf-8?B?d1NQckZpQVllL3RNV1FURW9LamNycm5GdUxDbnRlS1p6aFhXQVR3MVpPNVpF?=
 =?utf-8?B?bnJRWXRVM3kzc0lXMjM0alZNK3AzSkMvUnhyM2crZnNFTnEvMmd6bEtVQlYw?=
 =?utf-8?B?SzJoTmlvYkZxajdJaitSWUZGSUlVcHZxalZwRVZiTUZxTjZTOXpWdlVQY2hF?=
 =?utf-8?B?SGdLMEZUeElJeENsWlppRmlhU3VVTUlyTFFhVE1XV1BKWFBZZU1peEErMDc5?=
 =?utf-8?B?UiswNWVFUlEyN3Zua3lIQUR6cCs5czJRYmM5R2RkTmpYRWRJQTk5VWxocngy?=
 =?utf-8?B?QmQ4ajByZEllMlArY1B5OE9RQXI5bFp2TDNoV0RDTlgyUzdBNzBGVGxCc1Bt?=
 =?utf-8?B?UE1jNmxTb2JXOWpVbG53aysxZEwxNEtqdXptSWk5YXkzaWVZQ1lOUjY1WUVm?=
 =?utf-8?B?Umtld0tBbHo0VlU4MzFPbEpOWDJBc0tMK09ucnBWV0F5TWRwMGhIcVZKYkJV?=
 =?utf-8?B?YjVyY0pLb0lMc0xHTkpzUHBIKzBWc1JPTmo5ZWFqdVZLR1ZjODZBb1NHbGRF?=
 =?utf-8?B?ckZNN1pQZ01aVHlUZjVSNmZZcFBaRjEzU2RRQ0ZVTDY4eWlJMDllbnBZTnN2?=
 =?utf-8?B?R212Z0p2c0JBZzAwdW5ZRHpHZkI2MWZQTW1GY1oycWtGSFl2dVZiUytsb0wy?=
 =?utf-8?B?eHJYeUt3YmFDU2cwWWRZUCtGVlorUS9BdC9wQVpIcnN1WnBWVWpBNlB6a0xk?=
 =?utf-8?B?U3A2aE5DNi9raGlBbC9FeHpySEoyblEvMmdWeXo0bU4wUmJnMVAyUC9zSCtn?=
 =?utf-8?B?Wjk1UUxhb01JMXVGN25ZRkxMQWphZFB6TkNwQnQxSnZQYWRFNWhDekdndlQ4?=
 =?utf-8?B?UjVrODNDQ2FSSERBYzZrcXl2d0F3TEVOY3lvNnJOQ2RzNllQVWJRaGh4RzBh?=
 =?utf-8?B?S1FVeFBpNkMyc2NIT0NuZHlDVytycTVzQWlpaHYrOWpDTXF4RS9Zc3RCNHpx?=
 =?utf-8?B?aXMvR0NyZEJNbzAzV2FxVUZMdVlJTXRNNHBVdE5ZMWxTSHFYRHZDb2JzQS9C?=
 =?utf-8?B?amoyaDdjSmxwRmR0aitZSzhjcnZkbXd1SkFTVlMwZXBDemk2UWsvbVFmTC95?=
 =?utf-8?B?ci9NVHBKZGhNbGhwNXUrVGozbUxETmh6NzBOS1lSK0VhdWR2R2dhbUhOQjg3?=
 =?utf-8?B?Q21SRm9aV1hDSkF5UDdPMC80SGR0aHBsQzlzU3FmY3R4YzZjVlBuVUF6akg5?=
 =?utf-8?B?S2hVZm9vb0tFbndEekl1ZEpqNE1lcTRMMlhNdk9lMVpseTZmOUZ1LzU2MS9U?=
 =?utf-8?B?MDZzRlFXbjZlMlY2TDhxSFE3WWU5ellGbjVvM0k3SjdCUEZFV3lNYnV1U1gy?=
 =?utf-8?B?YXl0QlZYNE0zRXY3MUhGcHNtTnd5TmFNU2VCZWdNSXFxWjZwdlc3OEdHQ1RW?=
 =?utf-8?B?QXVBSnJ4bkZocVF1cmlGbmsyTzI5ZVBKRjFXSVFNNmM2N0pBcjJOZU93aE5R?=
 =?utf-8?B?VFdnQmZFVFNhMHZjQTIxU3kvVFZXdTlNY0pCL3VWMVdManV4dDhCYldkeHZ5?=
 =?utf-8?B?eUJkQkh4NkFWV0hsTXNoSHJNSVh0SjBGd0hqcFAxWkx6MFFxclRiMWFPcXBV?=
 =?utf-8?B?OXFnVDFBWUxyT3BVcXZSQTFnSjBIRmQwWXozSEE0cWpnRmZOdktETXViY1NN?=
 =?utf-8?B?VzJZdUs5UElqSzRJNzk0UFk1REhoQk8vRUxFMjRNdmFMTytXbWFzRGFIVUFS?=
 =?utf-8?B?U2VVdXF0a3ViamprWFQ1NVVlYjVDZi9QY1d6aEQ1WHU5K0JONjMxekJVcHpZ?=
 =?utf-8?B?VWRMb2RtV2IxWHZoTzdIL0hOL0k5ZnVvVEhOZFErSVlwZjlkZVJLRnZycUFj?=
 =?utf-8?B?SFhITndBYkpvLzEwcDNHTDF5dmdsV2FTczFWVitYc1o0Q2pYbGw3TUtvS2Mz?=
 =?utf-8?B?NHBpNkFJVjhnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR15MB6008.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aW94ZDV1M2dtYzJuVHhFY0FyL0xHc25FZFFTMGVKZEtIa1VveGFhdUNwTWdQ?=
 =?utf-8?B?RnlhRVNaMUd4L3RURUhCcnc3KzhCVm01NGVCeVBKZzNZVWZiNFhpR1FYRVdv?=
 =?utf-8?B?RHU1YTVZSG4vN1VNQUdXdk5UQWxaZ3hraTZYdG1XZWRkWWhyL0lyOGE5d1h5?=
 =?utf-8?B?TXRsczVoNzZQUWs2R0U1bVkwTVBLeVM1WGJQSnpxT0VDUkVHdC9RcDkzOVBU?=
 =?utf-8?B?M1F4MjNwcmM5a0hxMTFVbzlUTkx6UGtoRVlkMkhWUW1WT2MwSmdZZ3pzQTVH?=
 =?utf-8?B?R0lrZ1hNbjNJbTAyVlRBOFh1RWpNbEdvV01LMzd5OFBuVytUOWJ4KzE2T0lB?=
 =?utf-8?B?dkFWVUFJLzZUYlZDTE1IRllCNXVSbDl4T29mS3NxMHJSM1ZOcWZvOWFCMTkx?=
 =?utf-8?B?NzJweEtKZVRTQlhsU0FYYXFwellEdjRxdzFzdXdlb2dqWnVIVy8vM0dtcjhR?=
 =?utf-8?B?QUVxY1BycS9aUHRESXNBeHZwRHl5U2xrUHFPN3k0M2JHZkZwUjNPbC9JZjRM?=
 =?utf-8?B?OFlmOWpSVnkwdUFzSlhMb25xZmtacTJWVi80aWd5U29hL2ptT29FRnd3R284?=
 =?utf-8?B?S0UwODdwSkJ3SHlZR1pLbFZUY0xubWdGNXRObzBPZTFnOWdnUEZTT0lOR3I5?=
 =?utf-8?B?QW5LdjhkNXhDRnJ1YnRlb3BJQVdpU244SzhnRzBCSHdacy9xRkVXZFhqWkFV?=
 =?utf-8?B?c0dJMzg2dmI1SU0wV0I1c2VoakMwME10ZERLdkF4RENWV0tOS2lkcDJLYUVW?=
 =?utf-8?B?emNKL1lHamdXWHJEbTkzUVJWd0JtWXh5N0F5Nm9yRUIwTmJMa0RPVTRLWFF6?=
 =?utf-8?B?d250UC9aMDZrQm40WkdvV0FwY0I0MXdJR0FCd2dLNkcwUzcxZWprMFZ2dHRk?=
 =?utf-8?B?LzZqZEhCbVdCM2llNDVHaHBoVXd3R2R1cTlPV3daaUN2aGR6V0RsTklLOW44?=
 =?utf-8?B?TTdvcTROeWdHTWhSZGhwY1J1VS91N2dpc0I1SnNkYjdjbkJrMUdGeFgySUJN?=
 =?utf-8?B?cVkxcklZSDVFUDhVZm85cXA1a0d4K1ltYnBjclFBSkl0eVFsbHZKQTZEalVv?=
 =?utf-8?B?QWFGcnhZMDZKWG9xTFI4ZGx2ZmhGODZQUUprMy9GREdsMS93UGUwME1HK0Fn?=
 =?utf-8?B?Mnp5UTY0aURwRmVEYjY2UklqYnJUMWdZNmU4NnZ5WC9sZlRwNk5kRTNnK1Bk?=
 =?utf-8?B?SEhRMWVxU2w4TWRwUnM1M25tTEhpcU0yckZOT1oxNHRQQjFEN29KRzBlcTB5?=
 =?utf-8?B?a3pJeXFoYmpWTHRTSnYxaXgwSWFzR1hwQS9NMW1NN3lhWUNzenExOVhlc3VB?=
 =?utf-8?B?YkdGWGd2MHlzcGxRMVVRZU1JUko0dlJnc29BalVmVld3U3BUS0xyR2MwbmJG?=
 =?utf-8?B?Wmswc1JlRVYyQ21kOGxwa2ZNMVBxRTJwM0UvTFNheFNUZS9XV2pENGRuenVF?=
 =?utf-8?B?cUp0Tk5kMXJFUUN3dmIyTWRPS21LeW4ySUFEVUNzb0pUV1ZUY2xYNzFmNkE1?=
 =?utf-8?B?ditoY0dOb1dlU2NOMDR3Y0ZhbzA0RkJMcnFOVEVROExNNkliS3FmV1paYktJ?=
 =?utf-8?B?SDFET3oxZkEwc2xsZ1JLQlo1WGdlaTJjY0FnVkRNZ2trTTlIZGJxUjdlK2NI?=
 =?utf-8?B?YlZ2YjFHajlDVlE5RlVVRjc3ZzdteGE5bVZsME5GaVVZR2xlb3I1NHRpdFBp?=
 =?utf-8?B?VHpiV1k1MGRoaWFSaHBiUjFyRWlaOU83ZGt4ZUtIZERTWVhWcVgwT0k2Mmkv?=
 =?utf-8?B?b0tiZTBlU3gwSTZEcHA5eGQvWnMrOEx2bFFxMHc5eXdkeTlRL2ZiN1dyalBm?=
 =?utf-8?B?cmJudng0Mlk2UjdNYXl1VG9oajMzTjJUejBONjc1STJUQndpTWJ2WXpla2Rj?=
 =?utf-8?B?a0RVYUJDUitGdGpFd0kwbVBpUHhhVDJyYjE4cm1GKyt5Umsyc1F0OUxFV1lw?=
 =?utf-8?B?bDRuS2dXNERUNkV2eHR3dDdTRjg4QVhQT3FMdW5tV1JJcTZIMjdrQjV6UTR4?=
 =?utf-8?B?WnZ4WUhKelBrWkFxTVBlaGxuSzIyRk1jSTBxVjh4b1E1UTgrZlRRLzBVa2V4?=
 =?utf-8?B?RW9RNnJZbG9QcWpUOHBocTZmV2w4Y0hPaExmN3FlY0RNOEFLeXBzWkRCWGwy?=
 =?utf-8?B?NHVpaWIvTTJNWWRPRXJ4MEV3Um91VWRocml0UUIyMnZ0QW5UUE1MN0EzQmlu?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: palmerwirelessmedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR15MB6008.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01b66103-fae0-4e89-572a-08dd9fc3a172
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 21:47:53.2148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 18187d5c-662c-4549-a9f0-3065d494b8dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UUWIgEWgj4t1gCVtKepEhFwH6O5yN8nMDAfDRon9Wnh0a2ktOPyYlgU+ntpSUZrMgbT8uaxRwbWNRsvZZii9D2/XMKyZFMlP2XXr6Gs9VwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB5420
Message-ID-Hash: 4PGPA7LOHYPBEL7563NN5HQW546HYTAX
X-Message-ID-Hash: 4PGPA7LOHYPBEL7563NN5HQW546HYTAX
X-MailFrom: steve@palmerwirelessmedtech.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXMSBT3X5CI3B432RAJX2VD3JG4EIYZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciB0aGUgaGVscC4gSSBsZWFybmVkIHRoYXQgdG8gb3V0cHV0IEkyUyB0byBhIHNs
YXZlIGRldmljZSwgSSBzaG91bGRuJ3QgbmVlZCBhIGRldmljZS1zcGVjaWZpYyBkcml2ZXI7IHRo
YXQgYnVpbHQtaW4gZHJpdmVycyBhcmUgYWxsIEkgbmVlZC4gSSB0aG91Z2h0IHRoYXQgd2FzIGdv
aW5nIHRvIGJlIGVhc3kgdG8gc2V0dXAsIGJ1dCBJIGhhdmUgbm8gbHVjayB3aXRoIGl0LiBUaGUg
Ym9vdCBsb2cgY29udGFpbnM6IHBsYXRmb3JtIHNvdW5kLWF1ZGl0b246IGRlZmVycmVkIHByb2Jl
IHBlbmRpbmcNCg0KSSBoYXZlIGJlZW4gd29ya2luZyB3aXRoIGNoYXRncHQgZXh0ZW5zaXZlbHkg
YXMgaXQgc2VlbXMgeW91IGRvIHRvby4gSXQgaGFzIGEgZGVlcCB1bmRlcnN0YW5kaW5nIG9mIHRo
ZSBsaW51eCBrZXJuZWwgY29kZWJhc2UuIEJ1dCwgc28gZmFyIEkgY2Fubm90IGdldCB0aGUgZGV2
aWNlIHRvIGluaXRpYWxpemUgKHByb2JlKS4gRG8geW91IGFncmVlIHRoYXQgSSBzaG91bGQgYmUg
YWJsZSB0byBhdm9pZCB0aGUgdXNlIG9mIGEgZGV2aWNlLXNwZWNpZmljIGRyaXZlcj8gRG8geW91
IHNlZSBhbnkgaXNzdWVzIGluIHRoZSBkZXZpY2UgdHJlZSBiZWxvdz8NCg0KSGVyZSdzIHRoZSBk
ZXZpY2UgdHJlZSBzZXR1cDoNCg0KJnNhaTIgew0KCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQoJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCglwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc2FpMj47
DQoJYXNzaWduZWQtY2xvY2tzID0gPCZjbGsgSU1YOE1OX0NMS19TQUkyPjsNCglhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZjbGsgSU1YOE1OX0FVRElPX1BMTDFfT1VUPjsNCglhc3NpZ25lZC1j
bG9jay1yYXRlcyA9IDwyNDU3NjAwMD47DQoJZnNsLHNhaS1tY2xrLWRpcmVjdGlvbi1vdXRwdXQ7
DQoJc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KCXBpbmN0cmxfc2FpMjogc2FpMmdycCB7DQoJCWZz
bCxwaW5zID0gPA0KCQkJTVg4TU5fSU9NVVhDX1NBSTJfVFhDX1NBSTJfVFhfQkNMSyAgICAgIDB4
ZDYNCgkJCU1YOE1OX0lPTVVYQ19TQUkyX1RYRlNfU0FJMl9UWF9TWU5DICAgICAweGQ2DQoJCQlN
WDhNTl9JT01VWENfU0FJMl9UWEQwX1NBSTJfVFhfREFUQTAgICAgMHhkNg0KCQkJLy9NWDhNTl9J
T01VWENfU0FJMl9SWEQwX1NBSTJfUlhfREFUQTAgICAgMHhkNg0KCQkJTVg4TU5fSU9NVVhDX1NB
STJfTUNMS19TQUkyX01DTEsgICAgMHhkNg0KCQk+Ow0KCX07DQoNCg0KCS8vIENvbXB0b24gYXVk
aW8gb3V0cHV0IGRvZXMgbm90IHJlcXVpcmUgYSBkZXZpY2Utc3BlY2lmaWMgY29kZWM7IHRoZSBi
dWlsdC1pbiwgZHVtbXkgZHJpdmVyIGlzIHN1ZmZpY2llbnQNCgljb2RlY19hdWRpdG9uOiBjb2Rl
Yy1zbmQtZG9jLWR1bW15IHsNCgkJY29tcGF0aWJsZSA9ICJsaW51eCxzbmQtc29jLWR1bW15IjsN
CgkgCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQoJfTsNCg0KCS8vIGF1ZGlvIG91dHB1dCBmb3Ig
Q29tcHRvbiBjYW4gYmUgYWNjb21wbGlzaGVkIHZpYSB0aGUgYnVpbHQtaW4gc2ltcGxlLWF1ZGlv
LWNhcmQgZHJpdmVyDQoJLy8gc2luY2Ugb25seSBuZWVkIHRvIHN0cmVhbSBJMlM7IGRldmljZSAo
QURBVTE0NjcpIGRvZXMgbm90IHJlcXVpcmUgc2V0dXAvY29udHJvbA0KCXNvdW5kLWF1ZGl0b24g
ew0KCQkvLyBzcGVjaWZ5IHRoZSBidWlsdC1pbiBzaW1wbGUgc291bmQgY2FyZCBkcml2ZXINCgkJ
Y29tcGF0aWJsZSA9ICJzaW1wbGUtYXVkaW8tY2FyZCI7DQoJCQ0KCQkvLyBkZXNjcmlwdGlvbiB0
aGF0IHNob3dzIGluIHVzZXJsYW5kOyBpLmUuIHZpYSAnYXBsYXkgLWwnDQoJCS8vIGF1ZGl0b246
IGEgcXVhbnR1bSBvZiBzb3VuZCA7KQ0KCQlzaW1wbGUtYXVkaW8tY2FyZCxuYW1lID0gImF1ZGl0
b24iOw0KCQkNCgkJLy8gc3BlY2lmeSBzdHJlYW0gZm9ybWF0DQoJCS8vIHN1cHBvcnRlZCBvcHRp
b25zOiBpMnMsIHJpZ2h0X2osIGxlZnRfaiwgZHNwX2EsIGRzcF9iLCBhYzk3LCBwZG0sIG1zYiwg
bHNiDQoJCS8vc2ltcGxlLWF1ZGlvLWNhcmQsZm9ybWF0ID0gImkycyI7IC8vIHdpdGggaTJzLCBi
b290IGxvZyBzaG93czogZGVmZXJyZWQgcHJvYmUgcGVuZGluZyBhbmQgbm8gZGV2aWNlIGlzIHNl
dHVwDQoJCXNpbXBsZS1hdWRpby1jYXJkLGZvcm1hdCA9ICJkc3BfYSI7DQoJCQ0KCQkvLyBhc3Np
Z24gQ1BVIGFzIG1hc3RlciBmb3IgYml0LWNsb2NrDQoJCXNpbXBsZS1hdWRpby1jYXJkLGJpdGNs
b2NrLW1hc3RlciA9IDwmY3B1X2xpbmtfYXVkaXRvbj47DQoJCQ0KCQkvLyBhc3NpZ24gQ1BVIGFz
IG1hc3RlciBmb3IgZnJhbWUtY2xvY2sNCgkJc2ltcGxlLWF1ZGlvLWNhcmQsZnJhbWUtbWFzdGVy
ID0gPCZjcHVfbGlua19hdWRpdG9uPjsNCg0KCQlzdGF0dXMgPSAib2theSI7DQoNCgkJY3B1X2xp
bmtfYXVkaXRvbjogc2ltcGxlLWF1ZGlvLWNhcmQsY3B1IHsNCgkJCXNvdW5kLWRhaSA9IDwmc2Fp
Mj47DQoJCQlkYWktdGRtLXNsb3QtbnVtID0gPDI+OyAvLyAyPT5zdGVyZW8NCgkJCWRhaS10ZG0t
c2xvdC13aWR0aCA9IDwzMj47IC8vIGJpdHMgcGVyIHNsb3QNCgkJfTsNCg0KCQlzaW1wbGUtYXVk
aW8tY2FyZCxjb2RlYyB7DQoJCQlzb3VuZC1kYWkgPSA8JmNvZGVjX2F1ZGl0b24+Ow0KCQl9Ow0K
CX07DQoNClRoYW5rcyBpbiBhZHZhbmNlLg0KDQpTdGV2ZSBCcm9zaGFyDQpQYWxtZXIgV2lyZWxl
c3MgTWVkdGVjaA0KPg0KDQo=
