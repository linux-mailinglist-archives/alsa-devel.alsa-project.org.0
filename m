Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0426A69F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 15:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D65823;
	Tue, 15 Sep 2020 15:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D65823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600178201;
	bh=wEZjTSljK9pucH5F/n/IBsHWc6AabljGjcHC3C3L7EU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4XOdk+goyCgLtG1mvqn9WwtoiuvZThIka9z3U4kfTjENFlvC5FPBpb1QWPduBXTj
	 4hrN3jWN6vAzHnCnw0GFpbuwJkdaSkYfBAfwi3FsIIR+alP0i17nG7b9MdOXyJSyXf
	 TakbmyamlmnVFdosKjVUCrYvKWvsrRQsN0hBsBRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BE9F8025E;
	Tue, 15 Sep 2020 15:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D909F80212; Tue, 15 Sep 2020 15:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED41CF800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 15:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED41CF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=infinera.com header.i=@infinera.com
 header.b="cs6GtDMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyou6AF0YUIUCwmAqVvW8swMkDAsuPIBW6MbXOYEV8vuEvvbmQ7VjC1JlHBkQ3mcy3rSqLErXfwQMZVNUy+5YpIqU1rgTVj/AhuSdneunKWYfOO5N1/xvaofvyNkliP13cM9i1qxQI0WiGU5dEeY1/Joyqtc5xQbSp0IdAc/bdlHc40Q2k9sys0A8GsCMKTDfCvKheA0gDm0rTMZaCBkj4kxVPU50paJFedO14Ct1abjpDbeyFkGv6EakkEhk9/r2zaksmjoX+l3pCnd1qT67Y5d/H2n8ZEe1V9VTo0zdW204eVAek6GJkeEw66mKiOiSufE3u6jW3DV2K2ODWLeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEZjTSljK9pucH5F/n/IBsHWc6AabljGjcHC3C3L7EU=;
 b=Upwu0BmgIQHDmmBuDptCZi0I2TjGIeomeqa3HuRe3rFA1u2prs7skb9tYHBhcpRJPPUBlo8Zh2Qb8Ke5WFqCpiN576g4SN+7KIgSqgztDfUNgJPRW3+JtduJl++EjHl1pnWEzg1UF+Cnxc+tI75latRRXzHp7fRgL8OMCMdXD+Wyii2l/RlkzXcQeCEZyxiAf4Kqyz5CTDkW7bZIHVYn89/D7/Y0iHNLe75cfT+JDB1KjEfJgXbzahWwanlU0gO/2RWhuhpIeL7xV4IUmWuWglxGe+ljqW3l8TT/HjOdLJUmjfH4tWwqKDuBMaB8Ra/rBisNq477zKHCHC9I+XILKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEZjTSljK9pucH5F/n/IBsHWc6AabljGjcHC3C3L7EU=;
 b=cs6GtDMPqGKCJsfgqxLV2zddIrZsDjTJEp5KcwKcza+7A9t/nRcQUpEWWCHKPNEbxv0D1bC8JtsxBwGSplJP31pdb+8498eB0n1LC1rHrzB6U5AsmJlXX5m4T+P7uMVEJ1uV5kUJB2ZNg4/YTZVr2mBUEhS12wPJoO97/XIhVAw=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1480.namprd10.prod.outlook.com
 (2603:10b6:903:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 13:54:44 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 13:54:44 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for H570e USB headsets
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for H570e USB headsets
Thread-Index: AQHWh0/fePjx1NowkkyEsKM5VQOxhqlpwOgA
Date: Tue, 15 Sep 2020 13:54:44 +0000
Message-ID: <f3942ae6bdc77a21b893939883adbcc9a5f4f60c.camel@infinera.com>
References: <20200910085328.19188-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20200910085328.19188-1-joakim.tjernlund@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.92 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e4ef84b-4468-4c4c-f41c-08d8597ee6f3
x-ms-traffictypediagnostic: CY4PR10MB1480:
x-microsoft-antispam-prvs: <CY4PR10MB14800AC1EFB87CC037A85128F4200@CY4PR10MB1480.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kkksqWi0CYAIktECK8HZXN7QxLdeCbrovDOqzezwz7rAikt3JKmbILQvWn6FL+YpgOINadHLGj0vD+sYutGAEDL4NYB0Z+gKMiG6FeOrVjFmG45rMOeJlq468Ec3TxpO4Dd4K7LzWnV2hS0pVTuu/h6L/UHvzK5ROhow0vu2FWJrqil7i0aOnS+vev9mlIKZTLsRZ6HpgCDr06AY2JcqIKcQo7POOULcCTxoSSE5HtpVsNwRkbKV9xgZfyVqZ8zQzC6tMw7fxNBybrNyMcNARiOrmsjUeBpUgfj3c1nPUPFGs3yq70K9nD4H6oDB+cxE/jri0tyLssRn8jiz90bxARBD+QPZqQaWCgZPs3INf5qTMvQNY2GsqHM74hNvVSxr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(6486002)(71200400001)(36756003)(186003)(8676002)(26005)(5660300002)(6512007)(2906002)(8936002)(316002)(86362001)(6506007)(4326008)(478600001)(2616005)(66946007)(76116006)(66476007)(66556008)(64756008)(91956017)(6916009)(66446008)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Wp780FgfXMu9Uw2RHQxiu3AFZuS0Ux0/D0Vse53CPH7sekVU83OmFM9LqE8R9w0iOY3Ld69rC5K7pFFv909hGi1L6DvM7Vway6Y0z/TllFmvdNu5XEGTfnG+VzyK0xzQDRw5pvx1ndnHc+dmGZocNlC3gWq38FiJQYY3Q9gh/BTkN9JBwwMPqjfNHw0QU3xbKB6I5j4aJjEtaHalZTLozusG+aYAAeCjG+fUKB+2LiXcxXLS4pl1YeZV8M3kF/Fm5+6daDnaofBtCoZHzr/mAyz5d4Bh+kVqupSg/1dZvVR+G4vwFnF5RJpDUuYpYR3rKrZ3oztTNxRPSE4BP5dyZUTwND2qjX7gNKCfeAung3phTX2EmRfRg0RGxyHlAy8ihGAtEPX+XAvO9ADyMrURNhIhiPQK0mYHYi6gtYJt14tvZxGuzQbkFXTGSu0yPQ9xo3SxyEk63dlWf9vFTq5Nx1u/s/UFMLHR9leX8b98yt10rP3O4aeW0YWmaUv/F9xh/mXHSLj/1dHkGyek0TDqBkdl6gWPtqDPpqrWYj7qYEj37+7aigF5gb75KrT2OHPgqz9Zn8jw7Bgm0T3MaXmNhQVD/6L/S2O6FM3sVogz1V1CDFuv2UL7H4lTiqZ7Tzjfxxqf0/meVTm68QeNUcGQSA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7357DC638A8D56429C5863C80C4E29DF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4ef84b-4468-4c4c-f41c-08d8597ee6f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 13:54:44.7744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: me0JuYsfaMcly/xURn5HLZtOORXPr/4oE4q1MSZEqNk1/poYGJZhl20b1na1p6a+w6zMLOpKvfXJqmz41b2guQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1480
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
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

UGluZz8gV2FzIHRoaXMgYWNjZXB0ZWQgb3IgZHJvcHBlZCA/DQoNCiAgIEpvYWtpbQ0KT24gVGh1
LCAyMDIwLTA5LTEwIGF0IDEwOjUzICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiBO
ZWVkcyB0aGUgc2FtZSBkZWxheSBhcyBINjUwZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9ha2lt
IFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiDCoHNvdW5kL3VzYi9xdWlya3MuYyB8IDcgKysrKy0t
LQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIvc291bmQvdXNiL3F1aXJrcy5j
DQo+IGluZGV4IDc1YmJkYzY5MTI0My4uODkyMjk2ZGYxMzFkIDEwMDY0NA0KPiAtLS0gYS9zb3Vu
ZC91c2IvcXVpcmtzLmMNCj4gKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQo+IEBAIC0xNjc4LDEy
ICsxNjc4LDEzIEBAIHZvaWQgc25kX3VzYl9jdGxfbXNnX3F1aXJrKHN0cnVjdCB1c2JfZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCBwaXBlLA0KPiDCoAkgICAgJiYgKHJlcXVlc3R0eXBlICYgVVNC
X1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfQ0xBU1MpDQo+IMKgCQltc2xlZXAoMjApOw0KPiDCoA0K
PiANCj4gLQkvKiBab29tIFIxNi8yNCwgTG9naXRlY2ggSDY1MGUsIEphYnJhIDU1MGEsIEtpbmdz
dG9uIEh5cGVyWCBuZWVkcyBhIHRpbnkNCj4gLQkgKiBkZWxheSBoZXJlLCBvdGhlcndpc2UgcmVx
dWVzdHMgbGlrZSBnZXQvc2V0IGZyZXF1ZW5jeSByZXR1cm4gYXMNCj4gLQkgKiBmYWlsZWQgZGVz
cGl0ZSBhY3R1YWxseSBzdWNjZWVkaW5nLg0KPiArCS8qIFpvb20gUjE2LzI0LCBMb2dpdGVjaCBI
NjUwZS9INTcwZSwgSmFicmEgNTUwYSwgS2luZ3N0b24gSHlwZXJYDQo+ICsJICogIG5lZWRzIGEg
dGlueSBkZWxheSBoZXJlLCBvdGhlcndpc2UgcmVxdWVzdHMgbGlrZSBnZXQvc2V0DQo+ICsJICog
IGZyZXF1ZW5jeSByZXR1cm4gYXMgZmFpbGVkIGRlc3BpdGUgYWN0dWFsbHkgc3VjY2VlZGluZy4N
Cj4gwqAJICovDQo+IMKgCWlmICgoY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDE2ODYsIDB4MDBk
ZCkgfHwNCj4gwqAJICAgICBjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MDQ2ZCwgMHgwYTQ2KSB8
fA0KPiArCSAgICAgY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDA0NmQsIDB4MGE1NikgfHwNCj4g
wqAJICAgICBjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MGIwZSwgMHgwMzQ5KSB8fA0KPiDCoAkg
ICAgIGNoaXAtPnVzYl9pZCA9PSBVU0JfSUQoMHgwOTUxLCAweDE2YWQpKSAmJg0KPiDCoAkgICAg
KHJlcXVlc3R0eXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfQ0xBU1MpDQoNCg==
