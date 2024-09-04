Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA396B603
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 11:08:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED83868;
	Wed,  4 Sep 2024 11:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED83868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725440885;
	bh=2HXeOecED7CSYXsEqGGjNDmpuuN3E2bNdd/hwKsfaEM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gAHU94immbi3CSFQ4BZ8KOmld7dmaMTkJydI46ZrEovgm1LMpY2BXXc7euhJ2ZcBf
	 EjDPkkM9ID0kU88uCnD/FqHbMkCFo3hremxIdOd87o07VI2lK1/6zgKlvCkNaN91a4
	 5JJ6iLTKm7I07CU9SMdQY244+wr5tqeZwTSk4LCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35224F805B2; Wed,  4 Sep 2024 11:07:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BA9F805B5;
	Wed,  4 Sep 2024 11:07:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 572ECF80199; Wed,  4 Sep 2024 11:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07A84F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 11:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A84F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=Nl8wrbRo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBhq80sJlFKTxCDcqunexmXMKP8rMTfSmVUVpsKgm5XI/a4cRDfEhIx2ybPD/BSU11vgOQAiZaq0mG94lbhnesd1Y79lV6M4JtVNbSVGkQ2GGTmhKUBcpctE32DI60MN9iCeUUdbfANnNrL90Szll30JZmbfHfJSyX5AeJty27CO/civXyzVerqBWDjhb8eEzNddXhAWXaS3EHivCUIRytuEsrEQNeSNBTzbS6Z/RAThicN3EnoAmERu041oVXSSs3+eeSb7ZayAskoY6GCUWqPU9Ih7viYH5xfrc7QlnGnMbPwqyILWzCOeoG0GDHCI4Nf/6hBHHlBt+LzNKRN2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HXeOecED7CSYXsEqGGjNDmpuuN3E2bNdd/hwKsfaEM=;
 b=phc6EBqhrSF1dEPfcBzycxz6ZFCRt6zoijs8zLQH99rs4Pv08Ec9r6sRhlYNefC/Bsbu8rXgtPbvcPVP/oeOH/tBcXpBoK7CEXxw2Ws1v1V4SxTK3wez1Q43//HdbKSR++dMkY89NnxCA15ZJ5f+21aM33O2emSXqCtdrNBSOZ5hFgEQXQc/khRpUSZkC66HsStkhjKX2XzAmHy+tKKytUU56rJp8XoZw8/69lB/f42mLjaQCBI/hx9FmdPASLQtZmWsORXom5wKkdkzOb15bnU81Iohe2qJms1I2aHC1V4l1vUX/y8HihGRGWqKYLwL06BsuW1TVSkYvWc1f9tnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HXeOecED7CSYXsEqGGjNDmpuuN3E2bNdd/hwKsfaEM=;
 b=Nl8wrbRoytHtotU84n11OkfMByAQ/0cZIqae6LY9Ij8PCp9fsgUUS/EyaAHHv3qJwm+c0j7g92kskt+YUq5HHVcRcdqij3WUGsY56Ah6b84cV7kwkVfUFMZAM5xCZOgSdK6hm+oHwpgmZKh6VD73pxaJ7M2ha9C9YBZ3Eck9F2U3PTcFzjuDcTGq0iFx1n9vmYOVN8CQFUGqPTZZmNATgXA4l5FDbDC1fYUSbB246zrNRwlLCHwEI2kZ3iQ4aCk8IKlDNR6ZrPye2ZlflEe4fm9Fl2HBcfX4s6TpHNq5kxYH61UOPJMNxy2oR8seJmqHSzxarHRVe4gqT1t9in4Vow==
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI2PR04MB10668.eurprd04.prod.outlook.com (2603:10a6:800:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 09:07:31 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:07:30 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Jaroslav
 Kysela <perex@perex.cz>, "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: RE: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Topic: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
Thread-Index: AQHa/qnfcUTHd+JenEOxOSwCN6ywbA==
Date: Wed, 4 Sep 2024 09:07:30 +0000
Message-ID: 
 <DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <87msky1bqh.wl-tiwai@suse.de>
In-Reply-To: <87msky1bqh.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|VI2PR04MB10668:EE_
x-ms-office365-filtering-correlation-id: 46d9d4cb-1b54-433c-c48b-08dcccc101af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UVh3dGhiemVnYlYyL2p6eWxJRzUzTDVGbnlFNDFWTWltNFVXQU1HdVdaSC9R?=
 =?utf-8?B?azJjVEdMU0dsYVZ1YXFqQ0R1TVlwRzFIT2oxN296VUxoNkVwaU85d1NlNklZ?=
 =?utf-8?B?YmFLVnVVNU53UmcrUG1meGg1NURWWTVldjlkYVR3bUg3VitaV2Z3T2ZPY0dR?=
 =?utf-8?B?ZFh5dms1SzM1TUFROFZrcExlZzRNempYRE5XYjlEbEwrNUUyNXBtbDlNbHBH?=
 =?utf-8?B?eW5aak54SnBKaHJ3Ujh5NWxudEhJZHBCdFVadHVScHBUd3RmR2c4Y1BZMlJM?=
 =?utf-8?B?YSs1YzNUTXV6SU50ci9rdTdhZCtUMVVFa29sdDl0bzluUmZlYVRhM2o1V3ZX?=
 =?utf-8?B?RWV6cWhVcmE0c01QMUE1TEpsUWxYOWE2OC9IalIzenFROFpNSG1uL1JVMFN2?=
 =?utf-8?B?VUh0bTF6NVd2QXd5L1U1ZEtBcy84aVYxRTJLdCs5QjQyK09tdjZJdXZxSzJF?=
 =?utf-8?B?c016R2owaG1XT3dybFB0dVBYc3VzQ01sRzMwcGhWVllDK2pDTVNqR2pYSTZ4?=
 =?utf-8?B?VFluVnIwZmhLTHNodWU3MW9QVXdQRUZnQkNoNllkM1JFcWtYZDhpUXhRYzlr?=
 =?utf-8?B?bWdrV05qTnY3UHZiemV6eUFkSUhBWjVLbDIvV1pQVEhLR1ZocDJxWE9tY042?=
 =?utf-8?B?STRFN1VnVUQyY0d3YkdqWDF2VituVndYNnJlMzBmZ3pNM1BNZjg5T3hYenlp?=
 =?utf-8?B?T25jWnhkQlVxelpkY09GTTJyQW94Yno0ellEaDFpNTVybjdZV2xEdnBSWTlJ?=
 =?utf-8?B?WmVqc0EvMjN0QzkyR3o3RXpmN3lNNDlkMFlseGJiS0Z3WFZvK2diRHB3Z2Qz?=
 =?utf-8?B?L3NZcFFiTWxHbFdVT0tIWGNnQjRlTTFsMVo2L2JJWUhJeis1S3dGRENBL0Zv?=
 =?utf-8?B?Tm5lbFhUSXB3dnNwTGJMN21FTDJIWk1zd2xzWG1rUEhsVTB4aExvY2FBNCtx?=
 =?utf-8?B?ZmxnS2t5T2tlR3RBek5HeGJRTnR5OVM0K05zbzNMUldyai9VOTRYU3YrVmlO?=
 =?utf-8?B?ME81emhKMGFPTXRJQk1Oc3hLbDV4Qko0dTJ3SVZXK3FuYWlLRENGS3pDMTNL?=
 =?utf-8?B?VVJST0xmRldsUGJNTnJnalE3WHhmcnRtQWxLalFmT2t3MnpnTEZGd0tUeVBi?=
 =?utf-8?B?bVRLNy9nclpQVlNrNnlNeFJUU09LK0tuY0JOVC8zc0w4c2x3ZWVwek1xYTND?=
 =?utf-8?B?c0JCN3g0RWVGamlyN241WUlYZU1nb3dMYkVSc3VRZ1YyenZHMVlZY0c4Qys1?=
 =?utf-8?B?SHVDdkVzaVFmMmZOV3BsSDBRMGR3NGp5bkFGWlZKZzVjZURXOHRwT256T01o?=
 =?utf-8?B?RnFxMTZkUmxoa1RibVp4Q0NWbzJLZjN5MWxwZzFJMzJ4eFIvcWhKUzZOMW9J?=
 =?utf-8?B?ZEJqbWloNVZ3bG1qdXBiNFpsNVBIaEpOYklNb09zclQ4Q1h1QTZhcWx4WjVV?=
 =?utf-8?B?dFVySERwZUVQNThXQzJtT3NGQ1dIV1VHTUFWcWFPUzh2dW9PdFBVQW5mT1ov?=
 =?utf-8?B?bVBxU3I0T3RDRWxpMWZndVluWFlmZFlmQk5xbDR4MHlNMkcvSjFSYit4VjA5?=
 =?utf-8?B?ZVFqd2p5aEhDZHJaeG90bVRZdnZqMy9YbXpjWVZtRnJoKzJQeHlhSmJhOStF?=
 =?utf-8?B?YUxLdm9adVI5OVd5MkpYU014Nk9ZWnc2cTVpdDVJV1NCWWpjV2YvWEJ2d3BM?=
 =?utf-8?B?aUVsV25nYVRBZW9HMUY0ejFJOGJVaDA1NnZDdldLa1RCeFdzMTdPRHkzbjJt?=
 =?utf-8?B?eVAxRThFZ3dvd0g5bWxtU1EzVE5mMGN2a05QQnpwbUFmbE5KLzdZbVloTG5R?=
 =?utf-8?B?U2d2cEJPVW9aa0pNNlRSdm4zWnNvNnhEbFRVa2tFQ1kwZUpYNGhMbUVSYy9U?=
 =?utf-8?B?alJySktSb0djdENmb3dDU1dURlFVQ0JNSVA5dHJ3ekE3eUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WDFzR3FhcnFTQXRxdnFaMEc3aDN3UXFpVk9hUjcrbU5sd3R5cm1yVHNrUW5I?=
 =?utf-8?B?aWxUc3hrSjJYWnpwanVLRU11SldKZHd4UVM1RFM1QWtGK0hTU21NUmxRZ01U?=
 =?utf-8?B?WUpKRE9odTFkTUNtRUhJNDJWczJxVHhnZVhTaWJqQTBVb2xsaGtEVWlBdnkx?=
 =?utf-8?B?T2tBRGpSVnh4MDR4RHRqZHNNSzlLL3RIdXkvMGRXb2U1a1I3ZWpXYml6TEVu?=
 =?utf-8?B?ZUJFS2VhQmpKL2orTlJpOTVUdjhnSFp6VGFoUFdQMnFHQ1o2M1J3dnpYTGto?=
 =?utf-8?B?KzlmSzBmODFOczRYYXBCS3dvMWExbkZydTlrL0VveU42OHJlTW9Ycit3Tnl5?=
 =?utf-8?B?bFR4NWUweWJlU1JVTnBXcjNKcU53NzI3cUFBOTRDV1p2T2htYWF3T3ErSWpL?=
 =?utf-8?B?VmQ5M1Uvd1ZRZ0JHZThJMVpnVlRMQ2Y3WXM4am1iTFQyeHNMUzNyQUFqZzZm?=
 =?utf-8?B?bnhRK2syK1UxTGpXSTNiUlZxaHRBSTFkQ0ZBYmJ6YmN1R3p2cFR2aEpZdkg2?=
 =?utf-8?B?eS9CM28zaUswbms4c2lZQ3NqMVE1UzZldDdsUTdzTEhteU54bThDVlRuMm1s?=
 =?utf-8?B?ZXhqR3VZYTNkMVd5VmZENHpYUFFxUlczWVVYZHZXRmh1ZEZVbTcrM3loOEJ3?=
 =?utf-8?B?RGVnVVdLK3ZZL2d5bVU0Uktnc1IzZUpEVUc4SFFTQU53Nk8vckxnMHJJdVdG?=
 =?utf-8?B?YkJFbDQ5R0p0a0dNcE1YNWcyZUtDTnNQUWN6QzdRN1l1dlV2MERCZlpsUzZu?=
 =?utf-8?B?anhHY2tiRDJnSC90T1FTOGd5bmY5ck5ydE9HNi9maDJWdjVUTGQvUGJkNW5N?=
 =?utf-8?B?UWJQcWd0Q2NLNXdRMkNSWXcxZVQvU3ZBQjNUSmw4eXFDTllBVkEwcW1SZnp2?=
 =?utf-8?B?VE94aDRtRCtDb0J0TTRYYW10dzdvVS81NVRHb0RnMExBWkZacGp1bEkxenNB?=
 =?utf-8?B?NTJSYTBMWFJmSFJoNFk2amRWRmJ6Z2kwZmJTNW5LSUtLeHlVYXVHa2VwUUVY?=
 =?utf-8?B?SklYOFJxZnVhOGZGN3l4S01QelJ1Q3RKWVZSMUMzc0FzYVdNcFNOZ1RlTmtx?=
 =?utf-8?B?aGJMUHJhZjFxb3BoeGhxNjNXaWJSNzlBOXZNV0VLR0h1RjFieWpOVmJrOWxJ?=
 =?utf-8?B?R1BnclQ4MXk4QTF1YjVRaGh0VWpiVHZPN3JpTUJaVmZRSklVR2RPWmNJUW5i?=
 =?utf-8?B?alRYRzlFTTk1dDc0eU45MWFId0hiQXdiT3JtVDNVRnJOMGJISnBkU2Y2TnRh?=
 =?utf-8?B?UFVuSTB1SnNIN3VuOVNmOHNTODZoK01kaDJYRTMzMHhNQmpoZklTRjdyOU54?=
 =?utf-8?B?RnVwM2szenlsTFI1cWdWZjZaKzZBK2tURE80QmpxTzh5UGdkWnQxQUVVUlNQ?=
 =?utf-8?B?RG9BeGwxNlRFRmlXOGxLbmFxcjByZlNSVkl3RUdlRXdMWjh3VGV1OEZyZkZs?=
 =?utf-8?B?TnZsbEJ4eGRXVm1wWmdKR243NkRLa3I1S0k4aTdkaEc0eDlySTFGenZxQWRC?=
 =?utf-8?B?eWNweFJaQ3M1SzFRWHlkMGpoa29SUE5jTGR6ZHgrYnJQSXRtMi80ek9XUWNt?=
 =?utf-8?B?WmJCTFQ3WlhhQ3VBOSttTEhpdjJKN3VhcWNoSGhhak1TVHZNa3RNckRMcWc0?=
 =?utf-8?B?bVMxaURrNGltRlRycjhlVEpCdXNwSnRabFBBTWQyVk1wcDBJemVDZVRjSlcr?=
 =?utf-8?B?eUVWRldzSFBPQml2dGpKeGEwUUN0UlF0NFdJc2pHV0Nxbk1XVnM2WXFTRmNY?=
 =?utf-8?B?OVBDbTlTazdVbC9FWnF6USt6OGZaTEpOTTdySlZreTZUaUp4WWszbmR6TDhp?=
 =?utf-8?B?ZXF3bk10NFl0SXJmVTNrZnhuU2p6b0w5Y2FFZDBBUlFaaHVna3dRaUJueVJx?=
 =?utf-8?B?TlFsbFRzRkVNTWhaNDdmTm9QeVlSKzQzSWphYitkNTN3MXdOWGZTN3JyMndx?=
 =?utf-8?B?Uk5UK2Q5TnorNU9Wd0d5S2xXdlhIeUQxWjUyUFpYNno3TVlUUVpUc2NZYVNE?=
 =?utf-8?B?aWlwa0xvck5MbzN4VHNxaC9yMXBJLzh5ZUk3K3duSVQ1UDgvV0syNXE3ZVA3?=
 =?utf-8?B?dG9ITjB5VlJpUzFJVTd1bXovcEoyTFZ3T0pqc256V0l4ZG1OZkVzOXpic05T?=
 =?utf-8?Q?7TkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46d9d4cb-1b54-433c-c48b-08dcccc101af
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 09:07:30.8613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zGkZ4vU0FyIUcOqgns6YPuEpzAaGumNH6qozacIFY7poYxXeNEdL2BE1azDYonXtg9NL92pZCcfDCGLiTcf93g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10668
Message-ID-Hash: RUOML6WIKFOXVDTZM5O33AKIJI2CHKEZ
X-Message-ID-Hash: RUOML6WIKFOXVDTZM5O33AKIJI2CHKEZ
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3SLSYHUSAPPHRZW5KLRFVFCVMQ3MOK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5IGFuZCBzdWdnZXN0aW9ucy4gRmlu
YWxseSB3ZSBoYXZlIGZvdW5kIHRoZSByb290IGNhdXNlLiANClNlZW1zIGl0J3MgcmVsYXRlZCB0
byBib3RoIGRyaXZlcnMgYW5kIGFsc2EtbGliLg0KDQpXaGVuIHR3byBkbWl4IGNsaWVudHMgcnVu
IGluIHBhcmFsbGVsIHdlIGdldCB0d28gZGlyZWN0IGRtaXggaW5zdGFuY2VzLg0KMXN0IGRtaXgg
aW5zdGFuY2U6DQpzbmRfcGNtX2RtaXhfb3BlbigpDQoJc25kX3BjbV9kaXJlY3RfaW5pdGlhbGl6
ZV9zbGF2ZSgpDQoJCXNhdmVfc2xhdmVfc2V0dGluZygpDQpTaW5jZSB0aGUgZHJpdmVyIHdlIGFy
ZSB1c2luZyBoYXMgU05EX1BDTV9JTkZPX1JFU1VNRSBmbGFnLCBkbWl4LT5zcGNtLT5pbmZvDQpo
YXMgdGhpcyBmbGFnLiBUaGVuIHRoaXMgZmxhZyBpcyBjbGVhcmVkIGluIGRtaXgtPnNobXB0ci0+
cy5pbmZvLg0KCQkNCjJuZCBkbWl4IGluc3RhbmNlOg0Kc25kX3BjbV9kbWl4X29wZW4oKQ0KCXNu
ZF9wY21fZGlyZWN0X29wZW5fc2Vjb25kYXJ5X2NsaWVudCgpDQoJCWNvcHlfc2xhdmVfc2V0dGlu
ZygpDQoybmQgZG1peC0+c3BjbS0+aW5mbyBpcyBjb3BpZWQgZnJvbSBkbWl4LT5zaG1wdHItPnMu
aW5mbyBzbyBpdCBkb2VzbicgaGFzIHRoaXMNCmZsYWcuDQoNCklmIDFzdCBkbWl4IGluc3RhbmNl
IHJlc3VtZXMgZmlyc3RseSBpdCBzaG91bGQgaW1wbGVtZW50IHJlY292ZXJ5IG9mIHNsYXZlIHBj
bQ0KaW4gc25kX3BjbV9kaXJlY3Rfc2xhdmVfcmVjb3ZlcigpLiBCZWNhdXNlIDFzdCBkbWl4LT5z
cGNtLT5pbmZvIGhhcw0KU05EX1BDTV9JTkZPX1JFU1VNRe+8jHNuZF9wY21fcmVzdW1lKGRpcmVj
dC0+c3BjbSkgY2FuIGJlIGNhbGxlZCBjb3JyZWN0bHkgdG8NCnJlc3VtZSBzbGF2ZSBwY20uDQoN
Ckhvd2V2ZXIgaWYgMm5kIGRtaXggaW5zdGFuY2UgcmVzdW1lcyBmaXJzdGx5LCBzbmRfcGNtX3Jl
c3VtZShkaXJlY3QtPnNwY20pIHdpbGwNCm5vdCBiZSBjYWxsZWQgYmVjYXVzZSBpdCdzIHNwY20t
PmluZm8gZG9lc24ndCBoYXMgU05EX1BDTV9JTkZPX1JFU1VNRSBmbGFnLiBUaGUNCjFzdCBkbWl4
IGluc3RhbmNlIGFzc3VtZXMgc29tZW9uZSBlbHNlIGFscmVhZHkgZGlkIHJlY292ZXJ5IHNvDQpz
bmRfcGNtX3Jlc3VtZShkaXJlY3QtPnNwY20pIHdvbid0IGJlIGNhbGxlZCBuZWl0aGVyLiBJbiBy
ZXN1bHQgdGhlIHNsYXZlIHBjbQ0KZmFpbHMgdG8gcmVzdW1lLg0KDQpTTkRfUENNX0lORk9fUkVT
VU1FIGZsYWcgaGFzIGltcGFjdCBvbiB0aGUgZmxvdyBvZiBkbWl4IHJlc3VtZS4gSW4gbXkgb3Bp
bmlvbg0KdGhlIGZpcnN0IHJlc3VtZWQgZG1peCBpbnN0YW5jZSBzaG91bGQgbWFrZSBzdXJlIHNs
YXZlIHBjbSBjYW4gYmUgcmVjb3ZlcmVkDQpwcm9wZXJseSBubyBtYXR0ZXIgaXQncyB0aGUgZmly
c3Qgb3BlbmVkIGluc3RhbmNlIG9yIHNlY29uZGFyeSBvcGVuZWQgaW5zdGFuY2UuDQpEbyB5b3Ug
a25vdyB3aHkgdGhlIHNlY29uZGFyeSBvcGVuZWQgaW5zdGFuY2UgY2xlYXIgdGhlIFNORF9QQ01f
SU5GT19SRVNVTUUNCmZsYWc/IENhbiB3ZSBkbyB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbj8N
Cg0KZGlmZiAtLWdpdCBhL3NyYy9wY20vcGNtX2RpcmVjdC5jIGIvc3JjL3BjbS9wY21fZGlyZWN0
LmMNCkBAIC0xMTgzLDggKzEyMjYsNiBAQCBzdGF0aWMgdm9pZCBzYXZlX3NsYXZlX3NldHRpbmco
c25kX3BjbV9kaXJlY3RfdCAqZG1peCwgc25kX3BjbV90ICpzcGNtKQ0KICAgICAgICBDT1BZX1NM
QVZFKGJ1ZmZlcl90aW1lKTsNCiAgICAgICAgQ09QWV9TTEFWRShzYW1wbGVfYml0cyk7DQogICAg
ICAgIENPUFlfU0xBVkUoZnJhbWVfYml0cyk7DQotDQotICAgICAgIGRtaXgtPnNobXB0ci0+cy5p
bmZvICY9IH5TTkRfUENNX0lORk9fUkVTVU1FOw0KDQpSZWdhcmRzLMKgDQpDaGFuY2VsIExpdQ0K
DQo+IFsgaXQgc2VlbXMgdGhhdCBteSBwcmV2aW91cyBwb3N0IGRpZG4ndCBnbyBvdXQgcHJvcGVy
bHksIHNvIHJlc2VudDsNCj4gICBpZiB5b3UndmUgc2VlbiBhbHJlYWR5IHRoZSBzYW1lLCBwbGVh
c2UgZGlzcmVnYXJkIF0NCj4gDQo+IE9uIFR1ZSwgMjcgQXVnIDIwMjQgMDk6MDY6MzkgKzAyMDAs
DQo+IENoYW5jZWwgTGl1IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBIaSBUYWthc2hpIEl3YWksIEph
cm9zbGF2IEt5c2VsYQ0KPiA+DQo+ID4gV2UgZm91bmQgYW4gaXNzdWUgb24gZG1peCBpbiBhbHNh
LWxpYiB3aGVuIGRvIHN1c3BlbmQgYW5kIHJlc3VtZS4gSXQNCj4gPiBjYW4gYmUgZWFzaWx5IHJl
cHJvZHVjZWQgYnkgZm9sbG93aW5nIHN0ZXBzOg0KPiA+DQo+ID4gMS4gUnVuIHR3byBkbWl4IGNs
aWVudHMgaW4gcGFyYWxsZWwuIChPbmx5IG9uZSBjbGllbnQgZG9lc27KvHQgaGFzIHN1Y2gNCj4g
PiBpc3N1ZSkNCj4gPg0KPiA+IH4jIGFwbGF5IHh4eDEud2F2ICYNCj4gPg0KPiA+IH4jIGFwbGF5
IHh4eDIud2F2ICYNCj4gPg0KPiA+IEhlcmUgSSBhdHRhY2ggdGhlIGFzb3VuZC5jb25mIHdlJ3Jl
IHVzaW5nLg0KPiA+DQo+ID4gfiMgY2F0IC9ldGMvYXNvdW5kLmNvbmYNCj4gPg0KPiA+IGRlZmF1
bHRzLnBjbS5yYXRlX2NvbnZlcnRlciAibGluZWFyIg0KPiA+DQo+ID4gcGNtLmRtaXhfNDQxMDB7
DQo+ID4NCj4gPiAgICAgdHlwZSBkbWl4DQo+ID4NCj4gPiAgICAgaXBjX2tleSA1Njc4MjkzDQo+
ID4NCj4gPiAgICAgaXBjX2tleV9hZGRfdWlkIHllcw0KPiA+DQo+ID4gICAgIHNsYXZlew0KPiA+
DQo+ID4gICAgICAgICBwY20gImh3OjAsMCINCj4gPg0KPiA+ICAgICAgICAgcGVyaW9kX3RpbWUg
NDAwMDANCj4gPg0KPiA+ICAgICAgICAgZm9ybWF0IFMxNl9MRQ0KPiA+DQo+ID4gICAgICAgICBy
YXRlIDQ0MTAwDQo+ID4NCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+IH0NCj4gPg0KPiA+IHBjbS5h
c3ltZWR7DQo+ID4NCj4gPiAgICAgdHlwZSBhc3ltDQo+ID4NCj4gPiAgICAgcGxheWJhY2sucGNt
ICJkbWl4XzQ0MTAwIg0KPiA+DQo+ID4gICAgIGNhcHR1cmUucGNtICJkc25vb3BfNDQxMDAiDQo+
ID4NCj4gPiB9DQo+ID4NCj4gPiBwY20uIWRlZmF1bHR7DQo+ID4NCj4gPiAgICAgdHlwZSBwbHVn
DQo+ID4NCj4gPiAgICAgcm91dGVfcG9saWN5ICJhdmVyYWdlIg0KPiA+DQo+ID4gICAgIHNsYXZl
LnBjbSAiYXN5bWVkIg0KPiA+DQo+ID4gfQ0KPiA+DQo+ID4gMi4gTGV0IGxpbnV4IGVudGVyIGlu
dG8gc3VzcGVuZCBhbmQgdGhlbiByZXN1bWUoUmVwZWF0IHRoaXMgc3RlcCBpZg0KPiA+IG5vdA0K
PiA+IHJlcHJvZHVjZWQpDQo+ID4NCj4gPiAzLiBBZnRlciByZXN1bWUsIGFwbGF5IHdpbGwgZ2V0
IHN0dWNrIGluIHNuZF9wY21fd2FpdCgpLiBUaGUgR0RCIHNob3dzOg0KPiA+DQo+ID4gKGdkYikg
YnQNCj4gPg0KPiA+ICMwICAweDAwMDBmZmZmZjdkYTkyNjQgaW4gX19HSV9fX3BvbGwgKGZkcz1m
ZHNAZW50cnk9MHhmZmZmZmZmZmY0ODAsDQo+ID4gbmZkcz0gbmZkc0BlbnRyeT0xLCB0aW1lb3V0
PXRpbWVvdXRAZW50cnk9MjQwKQ0KPiA+DQo+ID4gICAgIGF0IC91c3Ivc3JjL2RlYnVnL2dsaWJj
LzIuMzkrZ2l0L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3BvbGwuYzo0MQ0KPiA+DQo+ID4gIzEg
IDB4MDAwMGZmZmZmN2VkZjQ2OCBpbiBwb2xsIChfX3RpbWVvdXQ9MjQwLCBfX25mZHM9MSwNCj4g
PiBfX2Zkcz0weGZmZmZmZmZmZjQ4MCkNCj4gPg0KPiA+ICMyICBzbmQxX3BjbV93YWl0X25vY2hl
Y2sgKHBjbT1wY21AZW50cnk9MHhhYWFhYWFhZDJjYjAsDQo+IHRpbWVvdXQ9MjQwLA0KPiA+IHRp
bWVvdXRAZW50cnk9LTEwMDAxKSBhdCBwY20uYzoyOTkzDQo+ID4NCj4gPiAjMyAgMHgwMDAwZmZm
ZmY3ZWU1NGEwIGluIHNuZDFfcGNtX3dyaXRlX2FyZWFzDQo+ID4gKHBjbT1wY21AZW50cnk9MHhh
YWFhYWFhZDJjYjAsIGFyZWFzPWFyZWFzQGVudHJ5PTB4ZmZmZmZmZmZmNTYwLA0KPiA+IG9mZnNl
dD08b3B0aW1pemVkIG91dD4sIG9mZnNldEBlbnRyeT0wLCBzaXplID08b3B0aW1pemVkIG91dD4s
DQo+ID4NCj4gPiAgICAgc2l6ZUBlbnRyeT0xNzY4LCBmdW5jPWZ1bmNAZW50cnk9MHhmZmZmZjdl
ZjUxOTANCj4gPiA8c25kX3BjbV9wbHVnaW5fd3JpdGVfYXJlYXM+KSBhdCBwY20uYzo3Njk5DQo+
ID4NCj4gPiAjNCAgMHgwMDAwZmZmZmY3ZWY1MDIwIGluIHNuZF9wY21fcGx1Z2luX3dyaXRlaSAo
cGNtPTB4YWFhYWFhYWQyY2IwLA0KPiA+IGJ1ZmZlcj0gPG9wdGltaXplZCBvdXQ+LCBzaXplPTE3
NjgpIGF0IHBjbV9wbHVnaW4uYzozNTQNCj4gPg0KPiA+IEl0IHNlZW1zIHRoYXQgc29tZXRpbWVz
IGFmdGVyIHN1c3BlbmQgYW5kIHJlc3VtZSB0aGVyZSdzIG5vIGF2YWlsYWJsZQ0KPiA+IHNwYWNl
IGZvciBkYXRhIHdyaXR0ZW4gaW50byBidWZmZXIuIFRoZW4gYXBsYXkga2VlcHMgc3R1Y2sgaW4N
Cj4gPiBzbmRfcGNtX3dhaXQoKS4gSSBjaGVja2VkIHRoZSBod19wdHIgb2YgZG1peCBhbmQgZm91
bmQgdGhhdCBod19wdHIgaXMNCj4gYWx3YXlzIDAgYWZ0ZXIgcmVzdW1lLg0KPiA+DQo+ID4gSSBk
b24ndCBoYXZlIGEgc29sdXRpb24gbm93IHNvIEkgdHVybiB0byB5b3UgZm9yIGhlbHAuIFRoZSB2
ZXJzaW9uIG9mDQo+ID4gYWxzYS1saWIgaXMgdjEuMi4xMS4gQ291bGQgeW91IHBsZWFzZSBoZWxw
IGNoZWNrIGl0Pw0KPiANCj4gSSB0cmllZCB5b3VyIHNldHVwIGJ1dCBJIGNvdWxkbid0IHJlcHJv
ZHVjZSB0aGUgaXNzdWUgbG9jYWxseSB3aXRoIG15IGxhcHRvcCBhbmQNCj4gSEQtYXVkaW8gZGV2
aWNlLiAgUG9zc2libHkgZGVwZW5kaW5nIG9uIHRoZSBrZXJuZWwgZHJpdmVyPw0KPiANCj4gSW4g
dGhlIGNhc2Ugb2YgZG1peCwgaXQncyBhIHBvbGwoKSBhZ2FpbnN0IHRoZSBQQ00gc2xhdmUgdGlt
ZXIuICBTbyBpdCBkb2Vzbid0IHRha2UNCj4gY2FyZSBvZiBzdXNwZW5kL3Jlc3VtZSBzdGF0ZSB1
bmxpa2UgdGhlIHJlYWwgUENNIGRldmljZS4gIE9UT0gsIHRoZSB0aW1lcg0KPiBkZXZpY2Ugc2hv
dWxkIHNlbmQgbm90aWZpY2F0aW9uIGV2ZW50cyBhdCBzdXNwZW5kL3Jlc3VtZSwgYW5kIGl0IHNo
b3VsZCB0cmlnZ2VyDQo+IHRoZSBwb2xsIHdha2V1cCwgdG9vLg0KPiANCj4gRG9lcyBwb2xsKCkg
cmV0dXJuIGFmdGVyIHRoZSBzdXNwZW5kL3Jlc3VtZSBvbmNlIGJ1dCBmYWxscyBpbnRvIGEgbG9v
cCBkdWUgdG8NCj4gcmV2ZW50cyBiZWluZyB1bnNldD8gIE9yIGl0J3Mgc3R1Y2sgYW5kIG5ldmVy
IHJldHVybnMgYXQgc3VzcGVuZC9yZXN1bWU/DQo+IA0KPiANCj4gdGhhbmtzLA0KPiANCj4gVGFr
YXNoaQ0K
