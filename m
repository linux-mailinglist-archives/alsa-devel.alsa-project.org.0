Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD93603C6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 09:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B401680;
	Thu, 15 Apr 2021 09:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B401680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618473480;
	bh=k+rvFvaspG0QAeb9mg+7oM1UYaZANCNquWonEDuJpKI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cz6FVCuldIkTNihuuLzWh6sfLjfKpiFU/uY/HjJgR1EyxDueY+vlytLmxAYitEk9l
	 YQ9XJvHN1TA5YtbcJ6ffrem8g9f/XVBGF0/bSw1VJ4Xm8Pk15R9kvD7yxYHgfQERKV
	 112y2aFADtVV2lP5N9xxnO+rPX6cVUarh6r1cXE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A927AF802A9;
	Thu, 15 Apr 2021 09:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D3DF8022B; Thu, 15 Apr 2021 03:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2095.outbound.protection.outlook.com [40.107.236.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA38F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 03:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA38F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=purdue0.onmicrosoft.com
 header.i=@purdue0.onmicrosoft.com header.b="nkMRz3W1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPBwzj3ifXcVT86SZ0PDL0HN/KbEQjbwjntfmvnypFQ9hZLuvfFioyFhU2yfhSNy2zdkI6aDlVb0na/8T9skiuAt5OrRitNaFifecTODJVt27Zo1JWgvvw/fLjD3dRgUfOMVTgcswtsOFjk25ffw5SUByOsLKF84vhyw9/vXHw0L3djs6BBfGBE1YIFIble4jCijMTjiCTTJ2UvdiRm3MUTt3WPePCYgU/uTcnV6qXN3dvaEZvKbCYMZ/MXB5ivilvSqdx9sgx/4Id587K0bn3jp/aZpAY+6Xk3jYbT+lzhHRi1Uterb9p/ojwvUvwMbg5/HXAA/1RZ4shptLRZ0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+rvFvaspG0QAeb9mg+7oM1UYaZANCNquWonEDuJpKI=;
 b=BHnGWGcI13SO4QJ07Cak/2rR/i93JXQg8KA+DT6qfQRGSw21++Ph0BAUf/C4lQhaeX6uNymH1dbZ9V0iBQrA82jbv5rPYhP/EnK7w4pcQ4gXkresdYRjAAai1S/nG16tpfoa8i6I1pV+NN+HuRVlrGwnK2hxqelT2yJgWVAx3fa8K2mh9eKNDlvcgQDxXNtbJngABSNbF9U1Tpvk+J4Grp/B4wD/TeFzYkqEk8s2e1ExsbgtuTg2Q/pBSwNZGcUIAmiyNav8JKvOp3bdK1AwQj7LrR+vTj9evXBNJd1/ARhWAYczXwpgqBt3z2HJHziMoIzvoZYm8HSmTtOy/aH9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purdue0.onmicrosoft.com; s=selector2-purdue0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+rvFvaspG0QAeb9mg+7oM1UYaZANCNquWonEDuJpKI=;
 b=nkMRz3W15r+HBOaC5fdMahlgIZvPy3xGQB9QJHUCQhcNFKoET2apjGdciVaSlic7oB0LS0SQ0ndMrC47/slHHZleTtweFNM1MjvRN7Q1HzlzDidtJlcgrVx5e7TUm/pu4M0nk0O56KbFVERO2FXLdtVGjF4x4if2iaFIhu71vSc=
Received: from CH2PR22MB2056.namprd22.prod.outlook.com (2603:10b6:610:5d::11)
 by CH2PR22MB2006.namprd22.prod.outlook.com (2603:10b6:610:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 15 Apr
 2021 01:47:14 +0000
Received: from CH2PR22MB2056.namprd22.prod.outlook.com
 ([fe80::fd2f:cbcc:563b:aa4f]) by CH2PR22MB2056.namprd22.prod.outlook.com
 ([fe80::fd2f:cbcc:563b:aa4f%5]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 01:47:14 +0000
From: "Gong, Sishuai" <sishuai@purdue.edu>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: [Problem] A data race in snd_ctl_elem_add()
Thread-Topic: [Problem] A data race in snd_ctl_elem_add()
Thread-Index: AQHXMZlCO83G08As/0qVV0q7cVXrhg==
Date: Thu, 15 Apr 2021 01:47:14 +0000
Message-ID: <FEEBF384-44BE-42CF-8FB3-93470933F64F@purdue.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=purdue.edu;
x-originating-ip: [66.253.158.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e7729d1-24b4-489f-7b32-08d8ffb064c7
x-ms-traffictypediagnostic: CH2PR22MB2006:
x-microsoft-antispam-prvs: <CH2PR22MB20061D05BCB2790ACF62FFC3DF4D9@CH2PR22MB2006.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H/8Tr6RZ6hNw0RDRtiJTtt9kJYyZkjofc4r8lTcvRuPhjyxIcEXpRw+5ceSjQV3/moCOcFNMx9AtQqvCHSj5ZQ18TjLPhE2uRms3uoj/tib2b6MetTO+TsYkCfu0H1FFCdiU2nfNlaFPjT1uKd1Q7Lr7+FQ6hD7RH+QIYJSywegpfwNxMyULEBFkb53lpEqu/NENsJxEXheA26cuKqJWYdZk6s8nTCxXWkEl98gXZoEyk8hicRCZSVK4Ajao1n+J4zfUn8D+aCy65NWgyCDEB6oW+F6/K0q6AiZczw30FVFJPdzJKDxV9ZdlPgDBpLkC0hazEmfQp4GUkR1+gAFVOixmvbVuaIQnWYB7PNpAJmcx8ICmrN/dgkZ27i2JBhoJNj7vP9YpgbnTYRSgJVa2PVczeHzPZQwNBryHyHGPRGXDPJ4dd51SOXASDu3aNbZjLNpX6Ic3DMHfqVlJEU3vZNQkU54xLCYaoW3gutkqTN21OS2ZE+XLfugyfRmzxQ6vsEQBjkl2KZMAu3EXYifk+FNDZYhxum2629oHmn/Pc1CvhhVxCCeAkzcSxxcIf63bUSHilt1MsZItPo1onPGz0b44uRnH1y03JaYZc7atLDN0o89o8CA4Q/m3E4xgbSP9F1QVFHWx5v+CzJFWJ3mDBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR22MB2056.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(39860400002)(376002)(136003)(26005)(786003)(83380400001)(8936002)(122000001)(316002)(86362001)(6506007)(186003)(38100700002)(33656002)(2906002)(6512007)(6486002)(66556008)(64756008)(66476007)(76116006)(66446008)(110136005)(4326008)(2616005)(75432002)(36756003)(71200400001)(8676002)(4744005)(66946007)(5660300002)(478600001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2t5ajZSTnJidWVsVVlDMktya2EyYklhZlVEd2VHYjN2UFRhRVhuOFNvRHJL?=
 =?utf-8?B?ejVjd2tGaXNYNVN3OE4vOUdFdHBJUU5FNDdTZDYwalZ2T1gwQ2p6Y3ZsN053?=
 =?utf-8?B?U09IWjV0Zi9XSC83SHB0eXdTUklKNXMrZmk4TnBMNis5M0tYODkxVzRBRk5i?=
 =?utf-8?B?SHB5clpTbklYNmlHRE4rWVplVEYyU29ZOEhRVFVHOFhtT0NBVUwzdmx5WTN1?=
 =?utf-8?B?OG54bFJkSXVyRFZ0U1BFYXdjTldBaEFvRWIyWDRTOEZjOUF2WnRCY0tMc3Nq?=
 =?utf-8?B?S0Z5VTNSaGs3bkxZWHRWa0greG16MEo2Vk45b1pKbU1qb0Y4WUVTbGdwU1Jz?=
 =?utf-8?B?bytMaDIrVU9VUTBZc21uaTFpUFhKZnFOeitzS0VYdi9naW5BL2hTT2Z5bVlQ?=
 =?utf-8?B?dVhDdWtkaXcyTVZZUHNCQ0JjTE1aZTZMMUxiT0Jkai92bjlmRGFLSEhCUTVX?=
 =?utf-8?B?eHZCemFIV0ZrQ2JuWUVhUmVtM3lheTQrYzdSdWxTRzMwSXZhTVQycnk3ZGlj?=
 =?utf-8?B?bE1hOVRaYlpEb3lSWHBTNkt0UnFrM3B1QjZSN2NzZHRYbExHdDhqMFV3ZVhY?=
 =?utf-8?B?dmkwV0xjQ3h1UTZYd1VIajlaNm1yOFZtUEZNdUtBVGNUS2NsUWphUWlYOC9t?=
 =?utf-8?B?UW1vdXVJSThEdkJHV3RoVlVMRWdwUE5HUXV1dXdRa0xBWVBoUnJDOTFVVEJ5?=
 =?utf-8?B?RE1uQktpdU1ORnNRZ1BqZm4vUng3ODNyRk40bmdpR003UTQ0REE0SWNNM1U2?=
 =?utf-8?B?bjRqWmRiM0ZScTdhTlk4MGFHTDlkeWxOZDRmNDVpWmg4M2NnbXFBNTI3RkRh?=
 =?utf-8?B?bDZ3d1FCVGFMT0xSQVNPTFVkN0ZpU1kzVnhlck81WHh6UURPbHgxMUs4ZHVh?=
 =?utf-8?B?cXdxRWtTQ1ZwaDV1Q2NjL2lDWC9taEU4WXhZNERzS0RON3MxSWpER01NVWxs?=
 =?utf-8?B?OE4vOCtoK21jdFl6RkU5dyt0d2RZSFdWVk9rUFcxa09qb0I1cVV5MVQ0WVY4?=
 =?utf-8?B?bWREcDljMUF0VG1GUCtSOGp5UlZqT3M2Nnh0Q21FTloya1dtTXlZektHRDFn?=
 =?utf-8?B?RlhSalNsZnM5dElOSDhIZzNpdlczR2lXMDd3bmszcHhlbWlaVHVyUmRSMnIx?=
 =?utf-8?B?b3BEcGF4WU5GVE16K0huL0tVWkRzU2UzS0xRWHVMaFdTZVc4Vk9OM2NlRDdp?=
 =?utf-8?B?aERWNC9iQUxHbGRFRTdId1Z2VDJ5TkVvRWVFUlVKVUttd01rTnNjd0c1RFd1?=
 =?utf-8?B?aGxSbU1rbE91d21pbGpaNWlkUG9iVTE0dTd4UnA0VDNLdjBuTWo0NEZjNXRB?=
 =?utf-8?B?QVNZeWpVN3AwSThwWXRnWUU5ODJkb2gvbGlNYStUWVNCOUZ4cWJSRkVvMnNW?=
 =?utf-8?B?Vnd4YjRjUmxtd0gydzhVM1NhZUhXRGNUbFZUZHNjMUt6cEdHRWhmYWhMQ3pM?=
 =?utf-8?B?ZFBNZ2dicHcwRHd3bW8zajh0UXJ5cDM5NUJucCtuSkFvVkFTaDRPZXh6UWN0?=
 =?utf-8?B?cStybCtpY1IrTW5ad3ZVWHRMa1ZQWkh1YTVuUGNPQkdWZ1BSNDNocEY4ZHFO?=
 =?utf-8?B?TmYrMlNWeXM5NjFpY3lnbm1TdVZMOHRJR1c3TnZHWGxZSW90dC9TbFJQOHkr?=
 =?utf-8?B?U2FvMGZGVTJYMlFwZE0zT3N2ekcvY2h4REFRUDlsZ2RVWWl2MWlDV01IOHY2?=
 =?utf-8?B?UWtVRWRRaFpvNzNmaEk4S3owUWNhb1ZlbEdXMnlsYk5Ya0RRL2l0OFphcjdl?=
 =?utf-8?Q?EhtchDYBx4HeGauakfiR1d0qbGRAUlNSd4NjTp0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E696A22F190704FA80CBAEE8A858C07@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB2056.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7729d1-24b4-489f-7b32-08d8ffb064c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 01:47:14.1653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvRyUgtfGsWsoikJ2spGm+Hl322la21kf/TwjuNSWyPVuuASvMr+qLzjKc2Ah5y8lkg9/qBjNA7EiV4S1dCiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR22MB2006
X-Mailman-Approved-At: Thu, 15 Apr 2021 09:56:14 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGksDQoNCldlIGZvdW5kIGEgZGF0YSByYWNlIGluIHNvdW5kL2NvcmUvY29udHJvbC5jIGluIGxp
bnV4LTUuMTItcmMzIGFuZCB3ZSBhcmUgYWJsZSB0byByZXByb2R1Y2UgaXQgdW5kZXIgeDg2LiAN
CkluIGdlbmVyYWwsIHdlIGZvdW5kIHdoZW4gMiBrZXJuZWwgdGhyZWFkcyBhcmUgYm90aCBydW5u
aW5nIHNuZF9jdGxfZWxlbV9hZGQoKSwNCm9uZSBtYXkgcmVhZCBhIHN0YWxlIHZhbHVlIG9mIGNh
cmQtPnVzZXJfY3RsX2NvdW50LCBhcyBzaG93biBiZWxvdy4NCg0KQ3VycmVudGx5LCB3ZSBoYXZl
buKAmXQgZm91bmQgYW55IGV4cGxpY2l0IGVycm9ycyBkdWUgdG8gdGhpcyBkYXRhIHJhY2UsIGJ1
dCBpdCBsb29rcyB0aGUgcmVhZGVyIHRocmVhZHMgDQptYXkgb3BlcmF0ZSBpbiBhbiBpbmNvbnNp
c3RlbnQgIHN0YXRlLCB3aGVyZSBjYXJkLT51c2VyX2N0bF9jb3VudCArIDEgaXMgYWN0dWFsbHkg
YmlnZ2VyIA0KdGhhbiBNQVhfVVNFUl9DT05UUk9MUywgc28gd2Ugd2FudCB0byBwb2ludCBpdCBv
dXQuDQogDQpUaHJlYWQgMQkJCQkJVGhyZWFkIDINCi8vc25kX2N0bF9lbGVtX2FkZCgpCQkvL3Nu
ZF9jdGxfZWxlbV9hZGQoKQ0KCQkJCQkJaWYgKGNhcmQtPnVzZXJfY3RsX2NvdW50ICsgMSA+IE1B
WF9VU0VSX0NPTlRST0xTKQ0KCQkJCQkJCXJldHVybiAtRU5PTUVNOw0KCQkJCQkJDQpjYXJkLT51
c2VyX2N0bF9jb3VudCsrOw0KdW5sb2NrOg0KdXBfd3JpdGUoJmNhcmQtPmNvbnRyb2xzX3J3c2Vt
KTsNCnJldHVybiBlcnI7DQoNCg0KVGhhbmtzLA0KU2lzaHVhaQ0KDQo=
