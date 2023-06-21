Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAA73837B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:18:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2992984A;
	Wed, 21 Jun 2023 14:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2992984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687349892;
	bh=Xp6mJ4sbi67A1yWoZL4H+SLG6DRZt/m2vmisORlztow=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t8rK5nXHVd7iggqAAJ+9ez/9GXsxmDtIURigJwcp/a0zopnO1Mvmy2hkoc1N1Jmmg
	 3GF3swhBX4tsva0X0DzgaB9SM5+mGZA5p7QpF/g2087aX7EmmaNkm93MBQ9PIWKfGn
	 Y+iMBT8o7txQM4KmUQDitZsXlWbajqWZ377L2FnA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADFB0F805C7; Wed, 21 Jun 2023 14:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0EEF805BF;
	Wed, 21 Jun 2023 14:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A4EF80141; Wed, 21 Jun 2023 11:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700f::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 954D6F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 11:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 954D6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=exaleapsemi.onmicrosoft.com header.i=@exaleapsemi.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-exaleapsemi-onmicrosoft-com
 header.b=jSVGWn6p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMryoTKw1HCPpOlImsQGL++U2+Ito9n+fL0yXZVXaXrvXPIIkvX7hhl9GelHnUotb/MJqIBXW2+2l4EeDjoglmQUN3waLVgZRXZeYnVjjtAQj9AfAGxbt1JYqrqh6pauUHIQr1IDEcUAD1LFGPg8ka3qWMwl1UY83hsXDLpsWQl0zGwi7W9/gHffUYLxj+5ZCsC7Hiv0V8C27g2KZVbUvqVjlS0Q21RoQeq6Jv9BqaWVXJG64b+Y/uE7PMPMrjDow8SwPMmu1Bafx5oCevN2OkI5sur4U8fDs5b0ObIQPtjsdIJkyGiBYYjYWxotfFQ+ZEo/WPjSjHAQTnZ7WWvQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpAAedGfktF/zjQ2lMHPo3MHqyxYVzbNQzmYq+TBm2c=;
 b=A4ul+f+NcPuzRNaw0+Rmp6VVGMy2vZi3qPO4cGDwg0Mfl/HulUvEk6WHzweMz8WoD4nMBbL2A09a1HwZaU2idsYWs46rZKUYpJszLnD58YqkORZdsZYvSA9ZcFuPYukH0/TZbPXhg55GeEOwSYCgeS+k2IUc3L6NuEShZZ2aEWsZQRUiQRTiz36F3hu2Nj5u7XOmOVHPU8/9AAtizPmjtw4q4dWW1JomQb4WusQ56qQ1Vb9DTvIyqMS/mWkiIDkUmhv4JQgjrwjH1sg8ZKewrRAfTRWbS+8qcuNuhsTQWMIxl6fSomGRfSu25vbfoh3Yu2UZBq3nEofqYHqpRaDOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpAAedGfktF/zjQ2lMHPo3MHqyxYVzbNQzmYq+TBm2c=;
 b=jSVGWn6pkfpq15MqMTqSDGGTIu4vS1SD4k0A93i8JI1CsQBURA6Oe1ZN9iI/UGyCwfL1tBPR3cguv/N2jVcxMFN4eZkXf1u89xRo8Y+79wDZvNXWNF/A4AXuwGm+JYkYWF32Esg70yN+AmXQID3LM6XAleX0XR/yVEThLPoCr/U=
Received: from MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2b::9)
 by MAXPR01MB4455.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 09:09:52 +0000
Received: from MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::15d4:7258:75c0:71bb]) by MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::15d4:7258:75c0:71bb%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 09:09:52 +0000
From: Rizwan Mubarak Chikodi <Rizwan.mc@exaleapsemi.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: Satish <satish@exaleapsemi.com>, Vaibhav Kumar Roy
	<vaibhav.kr@exaleapsemi.com>, Anish Khurana <Anish.k@exaleapsemi.com>,
	Krishna M P <krishna@exaleapsemi.com>, "Sarath Kumar  C"
	<Sarath.c@exaleapsemi.com>
Subject: ALSA PM issues
Thread-Topic: ALSA PM issues
Thread-Index: AQHZpBuV13ecgt6ZOEKFyRu9U6dWxg==
Date: Wed, 21 Jun 2023 09:09:51 +0000
Message-ID: 
 <MA0PR01MB75234A93A4C2CF205F79CB13FA5DA@MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exaleapsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB7523:EE_|MAXPR01MB4455:EE_
x-ms-office365-filtering-correlation-id: 0a828f68-f1fd-4b40-d59f-08db7237459b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xptdhdF9Pa9p6P+yyCpoTnv/Eui9p8xKsCytWr46y+GnCGLyYF9rzZCkMzpgIJN0mkyFfjLsW/EGGjDUiwJZnQlW69bxtaaavQG5yKw2/k1fyvlkJXRJSzYXiAqZNLVfP8ekdsoPiqTL2qrUODPuxY/kXAE++LzV6wEdNKwCnK12ITrCTKyPCbf3AJvc2NkNF8ZD2IqNGb19bwOJWi9WesMGP6qNlzv1A4jwL7HLW6lDp2HueYS0RQA3W0HOgUMrDb1TNe6W8eLCjS4lCbnEaD4atbGbey8LLVbudmdyyoMCsAom9IVP+R0gfSM1ShDfZaYwmV+PVRA9oiGmkW+2NX6GWN4c/wJCpXllviPqZgOnVWsWbIFBf2xJpWwqbmARdgQU3TdBlJhceD8/JjGFXw1/cw3DdQYlKN7IBa/B63WLPRWLPAbk/8oaWjQ6UuR9qsmhZo3I4FWmubaRWCnT9XYS8mq9I0M+JXZHq7m/tGILUrFSSm11i5zTrP+m6T3gozOcbB/L7/Y/49UzzKEqAwL7Fl/dFWYRjkqw693FPVrCXFPMo/zNxxt/hVUUCuHj5gpl9xwcafAypSW2HGbEOr1PUyAK9NbetjNCT0HRucay+7xf0LDFAnGG/4yxgZcX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(39830400003)(136003)(451199021)(316002)(71200400001)(3480700007)(2906002)(107886003)(6506007)(7696005)(26005)(9686003)(186003)(55236004)(33656002)(54906003)(19627405001)(5660300002)(86362001)(66476007)(66946007)(66556008)(66446008)(6916009)(38070700005)(64756008)(4326008)(91956017)(478600001)(76116006)(122000001)(38100700002)(83380400001)(7116003)(52536014)(55016003)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UjY3ejRmTUdVcFlvT1dzUnovakpvLzdURUg3ZkxQSHBqaGZHQXVOYm9NTlQv?=
 =?utf-8?B?QzQ0bU1Gc0syN0tSM1U1YitKbVJlSVJvWU0wMlFFQSs0d1pKK0hGQWpTY0Iy?=
 =?utf-8?B?WTlSTGcwTXFqcTVQZkFQV2V0QkNKOEFORnBXMW5kcXd2QkJSZWp2UlhhMFBk?=
 =?utf-8?B?dFZYanM2SzdWeDArOEpGTU11MVNqZzFHTkI0WGlJdE5tUitMSjRlcUFEQ1lM?=
 =?utf-8?B?OGxhN2p0dGx0M3JUc0NlM1oycnBEVTlaOVErNWlwSDA2WHhybHpBSE5jNWFF?=
 =?utf-8?B?Q3pmMFlTaUNtdEhITVJRUU0vSUVHY01xQXFlRFhSK1FJVUV4L2ExZEZRQ29K?=
 =?utf-8?B?bzJHL2prOHljREFieGRqd0M4Nm1SUjM0aWRPOWlyNVlOMzNZSHJjRXhoa21u?=
 =?utf-8?B?M0lvcTdWNVJxSy9GK1FGTGZZenZiMTNVVUxPUHFaL0dTZW9vMVp0azFJNVdG?=
 =?utf-8?B?bjJtQnlRS0dnbWI3TVI0eGxGTkd0TDVBR3NBa1RTaWoxOWNTeExoZlQvejhR?=
 =?utf-8?B?alBtZUdmZWlEb1pxS1ZWTkVEbWY4ekVPZVkvZ2RtaERkemF6WGhhM0JxTE1Y?=
 =?utf-8?B?YzM2bHZOdzhuTlhtLzJIRnhwY2U4ZnF0RGxSZEY5VktEWW9jMVhsYVh1ckdY?=
 =?utf-8?B?WHlYSEhTMmVPN21SdmxFR25JS2hXMnZIcS9YU3Z3RGhxQmRlTlRKL2ZnbGI2?=
 =?utf-8?B?VTM1RXNNSFowd2Roc2JEZEt0L0RvODhpUUZBVWRNUGNqTy9QR2pkMzhUY0s3?=
 =?utf-8?B?YnA4TXQ4ZUNFeW1TQnBtWkpkd1NEVDVkZFZMMHk1eUJySVVqT01Sd3E2blVs?=
 =?utf-8?B?UDZaUTR3VWZKYktLdnVjSWdEdGJjSnV1MkptbU02NnlCbmJwVlp5bmkvSVRa?=
 =?utf-8?B?Rzh2NFZJK1NNU0pxa2RpVTVIU2h4LzMyRE9SY3pMeTl3L1hLTWFzSzhNRnJr?=
 =?utf-8?B?dnNKL1I5MTJyZ01adm5PdzVMSllLRDY1Qm5hWUlWemFDM2lSRmF5WlJoM2g1?=
 =?utf-8?B?WDM2SjlqOEVFS01TTlB3WXlRWUMxL0tuUUVCbDJTWDFpZ3V1VjRENVJuYkFG?=
 =?utf-8?B?STJONG5LSFVyZ3p5MGwyODRycXIzcGxIRjlUL0J5dCtRTHI2a1BrWVdaeTFh?=
 =?utf-8?B?ZUFKaUttYmplNkFWekNQZjdNQzB5ZjBpdnJnTi84dUpzZlRuY0tlSys3OEJE?=
 =?utf-8?B?MEM4Q0IwQ0tlL2IrWStsb0JPMTRRM2hLcWJrU0Y0Kzk2VUlTL00zU3ZVMUVR?=
 =?utf-8?B?amJnTFExY2lJa2tOanY4a044RWQzVmh0TFdmOHBSVUVlV3lOd3A5azdJS2VF?=
 =?utf-8?B?QlFYeUtvKzFhZ0EvOXBJOCtadkxjaDYxdU0xeDFjWStNdDhiUWNZc3hlVmxW?=
 =?utf-8?B?cERzS2dTNmg5QjlUUXY5d2tXTkN0RW9tMkp5bHVla0tXL0k4L20wdjd0T095?=
 =?utf-8?B?SU5HNkNhcm9iZHo2aUdYUkpPNTdSaGhZMEl5TkZlU0JOOHNLUHJ3MndGWnAr?=
 =?utf-8?B?akVXbkhCUWdqMFN2azN2ZThMNnVkdm1QcEF1aHhIeGEyVG5jYzRKSXZlamFQ?=
 =?utf-8?B?cm5HTFo4SXBzT05qVDY4MXFkNEtlY2dETXJvNjV6cHJmb0paVGM4NGNBUXlo?=
 =?utf-8?B?Qit5M1VGV3FqOHBJYTJPZi9DS3lkc2tRNzVaRG9oclRrclRPWlM5T3lhd25P?=
 =?utf-8?B?Ym1IdEd0UXdTQ3hwOFNwU2pqRDMxMGNZcEkxTDlRYVZIdzNLOXpaZElmdnVJ?=
 =?utf-8?B?aW8yNmNGSFVpL25HVE0rSzVta3luZ21jdndhZkpHSlVzZ3J3d3FnMEpFbFVx?=
 =?utf-8?B?elNxOHZ1U0JJZy9PM2wxN255ZDZpa08wMlBxdWw0Y3ErcmFGQm5XS3VXQlh3?=
 =?utf-8?B?Q1U1SWdJVEpMazVzUVdXK3NXK0JKZVNndDQ1V3ZyR240L3B3WmhraDdzV3NW?=
 =?utf-8?B?UXk5REp0NDVlcUgwZnltUEJBN3g1YS9YRWVaSUx0QlkwbFhyallVTS9nSDZL?=
 =?utf-8?B?M1E3KzJpRFZNN1dhYW0yaTFZcVpzQlQ1b1VSRytJcWt3cWtDd2owVzh3RHFn?=
 =?utf-8?B?alBMNWd2eWV3cThqWktIRXU0b203SGM5Q1QrZUNzcm12bEFqYmlsRmNoS2RI?=
 =?utf-8?Q?grFIERlKsZfOYszK2SnV2POJ6?=
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB7523.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a828f68-f1fd-4b40-d59f-08db7237459b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 09:09:51.9304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6WtFh3twulgb5D/6oomum4mkFT5BCE8kwYgkhI97zrPD5sgJQ+9k4PV1RznXIMjy0J6mhMlilKzD+KVzjVsakp1Vy6Gu9/Am0X3m7G/mSS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4455
X-MailFrom: Rizwan.mc@exaleapsemi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 65C4GR6FD7D2PP3UINJWF3SC2P5BXK6H
X-Message-ID-Hash: 65C4GR6FD7D2PP3UINJWF3SC2P5BXK6H
X-Mailman-Approved-At: Wed, 21 Jun 2023 12:15:08 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZR5GLJJH6LRBRL3J2BIBAZITS2TXG6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQUxTQSB0ZWFtLA0KDQpXZSBhcmUgdXNpbmcgdGhlIHN0YW5kYXJkIEFMU0EgZHJpdmVyIGZy
YW1ld29yayBmb3IgY2FwdHVyZSBhbmQgcGxheWJhY2sgaW4gb3VyIExpbnV4IHBsYXRmb3JtLiBJ
biBvdXIgcGxhdGZvcm0gYXJlY29yZCBhbmQgYXBsYXkgd29yayBhcyBleHBlY3RlZCB1c2luZyBJ
MlMtQ09ERUMsIEluIG9uZSBvZiBvdXIgYXBwbGljYXRpb25zIHdlIGhhdmUgdG8gZG8gU3VzcGVu
ZCB0byBSQU0gKFMyUikgb3BlcmF0aW9uLg0KDQpXaGVuIFN1c3BlbmQgdG8gUkFNIHRyaWdnZXJz
IHdoaWxlIHBsYXlpbmcgYXVkaW8gdGhyb3VnaCBJMlMtQ09ERUMsIFRoZSBwbGF5YmFjayBmYWls
cyB0byByZXN1bWUtYmFjayBvbmNlIHRoZSBzeXN0ZW0gaXMgcmVzdW1lZC4NCg0KV2UgaGF2ZSB0
aG9yb3VnaGx5IHZlcmlmaWVkIHRoZSBkcml2ZXJzIG9mIHRoZSBJMlMgY29udHJvbGxlciBhbmQg
Q09ERUMsIEJ1dCBoYXZlIG5vdCBvYnNlcnZlZCBhbnkgaXNzdWVzLCBXZSBhcmUgc3VzcGVjdGlu
ZyB0aGF0IHRoZSBpc3N1ZSBtaWdodCBiZSBpbiB0aGUgQVNPQyBsYXllci4NCg0KRm9sbG93aW5n
IGFyZSB0aGUgZGV0YWlsczoNCg0KICAqICAga2VybmVsIHZlcnNpb246IDUuMTAuNDENCiAgKiAg
IFBsYXRmb3JtOiBSaXNDVjY0DQoNCldlIGFyZSBwbGF5aW5nIGF1ZGlvIGluIG9uZSB0ZXJtaW5h
bCB1c2luZyAiIGFwbGF5ICAodXNpbmcgc3RhbmRhcmQgYWxzYS11dGlscyBwYWNrYWdlKSIgY29t
bWFuZCBhbmQgcnVubmluZyBTMlIgY29tbWFuZCAiIGVjaG8gbWVtID4gL3N5cy9wb3dlci9zdGF0
ZSAiIGluIG90aGVyIHRlcm1pbmFscyB0byBzdXNwZW5kIGFuZCByZXN1bWUgdGhlIHN5c3RlbS4N
Cg0KV2UgYXJlIGZhY2luZyBpbnB1dC9lcnJvciBvbmNlIHRoZSBzeXN0ZW0gcmVzdW1lZCBiYWNr
IGFzIG1lbnRpb25lZCBiZWxvdywNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0Kcm9vdEBYWC1TT0MtQlNQLTMxSkFOMjMtUkVMMTItdjE6fiMgYXBsYXkgLURodzoyLDAgMy53
YXbigILigILigILigILigIINClBsYXlpbmcgV0FWRSAnMy53YXYnIDogU2lnbmVkIDE2IGJpdCBM
aXR0bGUgRW5kaWFuLCBSYXRlIDQ0MTAwIEh6LCBTdGVyZW8NCmFwbGF5OiBwY21fd3JpdGU6MjA2
MTogd3JpdGUgZXJyb3I6IElucHV0L291dHB1dCBlcnJvcuKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KDQpBbmQgd2UgZm91bmQgdGhhdCBpbiAiIHBjbV9saWIuYyAiIHRoZSB0
b3V0IHRpbWUgaXMgMi41IHNlY29uZHMsIG9uY2Ugd2UgZG8gU3VzcGVuZCB0byByZXN1bWUgd2Ug
b2JzZXJ2ZSB0aGUgdG91dCBpcyB6ZXJvLg0KDQogaWYgKHJ1bnRpbWUtPm5vX3BlcmlvZF93YWtl
dXApDQogICAgICAgICAgICAgICAgd2FpdF90aW1lID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQog
ICAgICAgIGVsc2Ugew0KICAgICAgICAgICAgICAgIC8qIHVzZSB3YWl0IHRpbWUgZnJvbSBzdWJz
dHJlYW0gaWYgYXZhaWxhYmxlICovDQogICAgICAgICAgICAgICAgaWYgKHN1YnN0cmVhbS0+d2Fp
dF90aW1lKSB7DQogICAgICAgICAgICAgICAgICAgICAgICB3YWl0X3RpbWUgPSBzdWJzdHJlYW0t
PndhaXRfdGltZTsNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAg
ICAgICAgd2FpdF90aW1lID0gMTA7DQoNCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChydW50
aW1lLT5yYXRlKSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvbmcgdCA9IHJ1
bnRpbWUtPnBlcmlvZF9zaXplICogMiAvDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJ1bnRpbWUtPnJhdGU7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHdhaXRfdGltZSA9IG1heCh0LCB3YWl0X3RpbWUpOw0KICAgICAgICAgICAgICAgICAgICAgICAg
fQ0KICAgICAgICAgICAgICAgICAgICAgICAgd2FpdF90aW1lID0gbXNlY3NfdG9famlmZmllcyh3
YWl0X3RpbWUgKiAxMDAwKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIHByaW50aygiKioqKioq
c291bmQvY29yZS9wY21fbGliLmMgOjo6IHRvdXQgPSAlbGQgKioqKiIsd2FpdF90aW1lKTsNCiAg
ICAgICAgICAgICAgICB9DQogICAgICAgIH0NCi4uLi4uLi4NCg0KdG91dCA9IHNjaGVkdWxlX3Rp
bWVvdXQod2FpdF90aW1lKTsNCg0KDQpUaGFua3MgJiByZWdhcmRzDQpSaXp3YW4gQ2hpa29kaQ0K
