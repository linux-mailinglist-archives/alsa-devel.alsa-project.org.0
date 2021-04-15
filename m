Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B1360BD3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 16:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6588C1676;
	Thu, 15 Apr 2021 16:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6588C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618497098;
	bh=zSBMnkPaiCTLYBVPXqTqlcO01NCfRN0IaFDeV4vZJSQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9w0IpQxtnyGv71Rmh5Q6WPn7klo4RB3qgHB5NzZXtnyKZ0BIn36ghSaZHrXymqqn
	 bqv9oYqmOScQ3II4tXNm7jtkrO1/ko5ksFvLhD1rAtVJ8qOhptk0IT31Dmsm3eQ7hk
	 o0QhsuCbFUhZu69BfBSSSyvW87NfZ17mhgeWWxe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2E5F8022B;
	Thu, 15 Apr 2021 16:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 863A9F8022B; Thu, 15 Apr 2021 16:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2118.outbound.protection.outlook.com [40.107.94.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4FBFF80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 16:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FBFF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=purdue0.onmicrosoft.com
 header.i=@purdue0.onmicrosoft.com header.b="ldO8ITN0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf/9hn6Hv1P+g1FFakOMtSJ/nBtXw34w9FeFvB3yvDbAgLFa1f5Ay8i7x85yeaHo++u8s2I8wHLCVr70MqkqqjlOk23a4oARaGqZcoTuDgMmRs/W3M61LXQ5xWk99IVn0vGk1tM3C0J8JyFR+6tsk/60mXvnB7DH1k9SSgnROBmV3yXRswIYLaRz5F0LK2rz+xbFA3UNcmuHhpLM9OwUctfghpp+2iAMwvoI1TsI7v9Y05W017H47xGj5+425AhmNaauZ6aMXE4Pg60KtvJqLEKbjdOfTJx7EtE8huL90/wb8JLU6JkipjUom/MR9aayf9rzTaNNoLQ8Ppglf0TRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zksN7qxJuq+14w160oW0bajgdpDtZWPDFeb/U3lMXZE=;
 b=ClK1KiE2J29Xtb1FBKpoE1XoUlVhzzRSGDY9v1fu9IZt/BV48dV9TYgmrpanwHttNKZgc6JnQJx5lLIgOkUFYjAbOazEQIy3Gr14LVZcCMMRBlHZB2bO2iEoaxNzb6eC5mYumQKDydNp/tvhf3JPJvha4w9wMJxsSC9vCjUDGIP+Ud8tFd/jWnCjtyy2c9Ryug3JKWKfWzEzNH1CJD82X7+gAGnnHV+q3nOBJiUk9P+yC84hXl2A7rhLvsS25DXUIaBun70LTj3dciYxe9w2nrQICZo5EtVax9NwQioTtdrhGBJAK7tKklBSBUxBweG3+d+Ns1/zDGIzvkoUmGgryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purdue0.onmicrosoft.com; s=selector2-purdue0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zksN7qxJuq+14w160oW0bajgdpDtZWPDFeb/U3lMXZE=;
 b=ldO8ITN0sD6n6iWO4G1pCIMMFllxwiRwVyHlGXBVmzLBbJHujsaY6DfSzXxMTlO075dlAqiNLvSSyyNMw0RfbHrus47AfyD3AtpF8EBWT3wqP7uRg3KTE44cqgavB8VW/crzmThuHMt37A9pBjKSWhOFwkN+K/cpI1FGe6P0j+c=
Received: from CH2PR22MB2056.namprd22.prod.outlook.com (2603:10b6:610:5d::11)
 by CH2PR22MB1845.namprd22.prod.outlook.com (2603:10b6:610:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 14:28:35 +0000
Received: from CH2PR22MB2056.namprd22.prod.outlook.com
 ([fe80::fd2f:cbcc:563b:aa4f]) by CH2PR22MB2056.namprd22.prod.outlook.com
 ([fe80::fd2f:cbcc:563b:aa4f%5]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 14:28:35 +0000
From: "Gong, Sishuai" <sishuai@purdue.edu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [Problem] A data race in snd_ctl_elem_add()
Thread-Topic: [Problem] A data race in snd_ctl_elem_add()
Thread-Index: AQHXMZlCLtewExAl6k2avtlvCULBJ6q1RvAAgABdGAA=
Date: Thu, 15 Apr 2021 14:28:35 +0000
Message-ID: <5236A79D-9EBF-435E-979D-F7294159FA9A@purdue.edu>
References: <FEEBF384-44BE-42CF-8FB3-93470933F64F@purdue.edu>
 <s5hmtu0sz9h.wl-tiwai@suse.de>
In-Reply-To: <s5hmtu0sz9h.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=purdue.edu;
x-originating-ip: [66.253.158.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 306509d6-27f5-48ec-c872-08d9001ac0c1
x-ms-traffictypediagnostic: CH2PR22MB1845:
x-microsoft-antispam-prvs: <CH2PR22MB18455F6575A583420A8F8B2BDF4D9@CH2PR22MB1845.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HmQun2bOdBlIUuJ4XN57BKrpK7O3FTbNXSONiXNDBM7zSytzYNO1uyYx9uMR3eyflRrlWfRGWIaCkNizd6dJKYUJnSoXCKI7qacsYIaApwjbcV3wMMtC86sVik2miMIk9Hb/RMZfRTKPT3i//igmI2qCq5AazHKvj3XO7tUekGU2leYKqKC+KwsM7oxYR3e+PZ1aKGVZ99e0vT2nm7xl+R3/Nj7c+51ovtvJBopiFJQSBdp9GLd/C+siVP28vK/aH1oDO8CAq5miMRzraJupz+IoEVh8cWhv5wHXsVdMq23JANuuSIOsJWRd4LJYbbZbF2DOwX7z1avlgkaPc51qlJxbN7hzPbnSK3zl+jzjGqquXrHO8iATJpUbWy3gX2l0jVNK+pGTiQmtOm47dQBrgywTDLXRib1FffpPu8EapPsmswpjFbWgX6WC9K+Qu4Ee6dQxKhKDmgbQgi44KNoOF8yskfEDESOzL1EV6AEogykLqA4Ka262LlZUVkEwA2d/f1YgvtBPHoHKrqbT5GsCxKPSXuPb4f6MzvM2bKwiGfzs4UWPfWFycDiLTDiqnJPI2i9cQ9Qo67+hw2HbLowBs8p4iOpxEZPV7i/jscNPxeJRh+X4468mPHM84HqskVJWMGRhM8kYSxaAcsKC5Tfsxwlqb3sgUrXAysjPwTA7uqs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR22MB2056.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(39860400002)(346002)(396003)(66476007)(66946007)(8936002)(2616005)(6916009)(66446008)(64756008)(478600001)(66556008)(786003)(8676002)(36756003)(53546011)(76116006)(4326008)(316002)(54906003)(2906002)(83380400001)(71200400001)(122000001)(6486002)(5660300002)(6512007)(33656002)(86362001)(6506007)(38100700002)(186003)(26005)(75432002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UWhCajlTbEFmN0RRdUhnSXBkTFk4dTI3Y2ZmOGc5WjVndHlqVlJUNGtENkd3?=
 =?utf-8?B?dTMwejRSdzgwL1hRMHJ5ai9XWVhNTDZxclBzUUtXM3BXQ1BVTnc2Q3FzbGIx?=
 =?utf-8?B?YWtSMnJLSlZDemdLUmVXaU9yWStlWHZZWmwyWlZTNmRUTTYrdFhrODI4WXE3?=
 =?utf-8?B?R1dpa3RLaEcydzYvMjVDQ1BXQUZJV3grWG9NSDNoNVU5ZEJQQW1rV0gzOXhT?=
 =?utf-8?B?V092THdyNFhCZVR0bW5GWmNNdlU1VWRYNkM1LzhZNnpLRmRSS0JsNnQ4ckNX?=
 =?utf-8?B?WkZtOWFQRndOQlB4MzBDUHAxM1NtR0UwUFpHTTlqWEFWVHAyTGJOUFFaTUhI?=
 =?utf-8?B?N2RKaXVPWXk1enM0MEJSL2YzRWlhUFJ6NHp0MzU1bmMvcG5MUG01UkdhVmY1?=
 =?utf-8?B?WVhSZXBJQXQ4YnV0ZVd2dUJqZHdFWitHQVpMNkNpaFlRc2JLT0U4NlVQejNk?=
 =?utf-8?B?c25vZFZoMTdraE1Eb1piOGZCa2QvWUpRcXpCckM4UUw4YVp0UkNmaEE5NHBJ?=
 =?utf-8?B?aVNMbENxTWZOeWVhT2N3QlEzNC8wTHp2TVQ3cG1hdU9ZOEVOT2JacXFoRFdx?=
 =?utf-8?B?Qzl5ZXNCMzZvcUxrYUFtY0thd1ZoUmlGM1hOS3FYKzZoQVM0ektiRnR5ZkZ3?=
 =?utf-8?B?aHZXenpqd1dwUnVWNjhSWTVrQlhmRkdOeko3RGlTWE9BL2l2b0xPU1gxYVFj?=
 =?utf-8?B?RlFmSmQwQXg2OVNYQ2E0eVE5bFUreWl2ODNRckpUMEdrZ0pDYTdPVlNwRFA0?=
 =?utf-8?B?OXZRa1FwaVVXbFk0b0VWU1JabzJsNFpJYXdvTG5IV1crMlAyRlhTbEgvUUds?=
 =?utf-8?B?YWEwQ1lBY2hxNUFBc29saDRPSk8rK1hseTlYajZpeTRCbmtNK0s5OHpXanJu?=
 =?utf-8?B?dWlWYTVha1pVWE4vZUhvUUZXYm9GOXB1RFphcGphUEE3NW9iVloxRmdmcEhV?=
 =?utf-8?B?c1k2dEkxUC9BejVocFptTFcwM2Z4SFozbW85QlVTbGRMZ0JnR21URjV6WHU1?=
 =?utf-8?B?TkhvSFFEU1dBcUpHVHhnQjdIdFJCOVp6TWFsSHdlMDZnU3hWaHMzdTY4QVI3?=
 =?utf-8?B?dEQ3UXp1OWRYcjNHRHZ6QTdZZ1N0YzFWS2JqRDQwRnNvUGtjd3dpYXltcjk3?=
 =?utf-8?B?TGJINEhzMStXOXZvSzAxc0FDTHY1ZDBvQlJvWGxobWwxemo0S1NsNCtDZTJs?=
 =?utf-8?B?TGVuZmh0dTlabGpsUlR2dk1PTDhFc3p5N1JvSmZsRUVpTWNuc2kwdm5tWFdF?=
 =?utf-8?B?bU53cFU2RTB4RzNleHFWYmN3eUFRdGZ5SktMWWh2c2RJQmYrM2pQVERzVjFG?=
 =?utf-8?B?dElXUXU0ZmFKUGpOMU1iTkFZYm54dmtJc042TFZJaHh4OC8rVzNUd1NxT1lK?=
 =?utf-8?B?YmxxQlh4eElaR2tUZU1RcDFyYW44N1BXWGl1UEp1dlNTRHNFWDJiYUp3TEk3?=
 =?utf-8?B?OWJWclpIcS96M1ZXSlBHUC9kQ05LY3ZpVDJXdDkzcVZkeFkvTVJyRUl0Qzds?=
 =?utf-8?B?bGZnaWREU2RteWxHMjFENUZsQ3RVMHp6bllUOEtxZEFMeFJYNWJDaWFETkds?=
 =?utf-8?B?NTdvbzZKR1hoYTlzdGhFdWlMMWJMTVdBcEc5bFRqamd3VnZEY3Rwc0RwaXVq?=
 =?utf-8?B?dzFqSGp0ekd0NzdSc0l3QmpNT0sxRzE3dGNzRDFlS2VOWjYzV2habEZEaFdz?=
 =?utf-8?B?NVdTZzFCbndTbVltZmxwTnlmb09NWlF5S1pDbUprRXJpY0dlSWVVVFB4YkpE?=
 =?utf-8?B?aUlQUWdsZHhyajVqYmU3QXNqbVBLVGQ3Z09Nd1BFUWFFSVd3VDY0RGczNVVx?=
 =?utf-8?B?LzJJbTl6MWZSWUxLdGVVQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB2056.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306509d6-27f5-48ec-c872-08d9001ac0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 14:28:35.1446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHRPiAtWUnJJVsbRXPq3JrnzCBdqpZxdNkixPlytWvB32tvw/oLMmc+L8rkVcuCDYU1v8qmkEJ2N10g8E/xxCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR22MB1845
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>
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

T24gQXByIDE1LCAyMDIxLCBhdCA0OjU1IEFNLCBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU8
bWFpbHRvOnRpd2FpQHN1c2UuZGU+PiB3cm90ZToNCg0KT24gVGh1LCAxNSBBcHIgMjAyMSAwMzo0
NzoxNCArMDIwMCwNCkdvbmcsIFNpc2h1YWkgd3JvdGU6DQoNCkhpLA0KDQpXZSBmb3VuZCBhIGRh
dGEgcmFjZSBpbiBzb3VuZC9jb3JlL2NvbnRyb2wuYyBpbiBsaW51eC01LjEyLXJjMyBhbmQgd2Ug
YXJlIGFibGUgdG8gcmVwcm9kdWNlIGl0IHVuZGVyIHg4Ni4NCkluIGdlbmVyYWwsIHdlIGZvdW5k
IHdoZW4gMiBrZXJuZWwgdGhyZWFkcyBhcmUgYm90aCBydW5uaW5nIHNuZF9jdGxfZWxlbV9hZGQo
KSwNCm9uZSBtYXkgcmVhZCBhIHN0YWxlIHZhbHVlIG9mIGNhcmQtPnVzZXJfY3RsX2NvdW50LCBh
cyBzaG93biBiZWxvdy4NCg0KQ3VycmVudGx5LCB3ZSBoYXZlbuKAmXQgZm91bmQgYW55IGV4cGxp
Y2l0IGVycm9ycyBkdWUgdG8gdGhpcyBkYXRhIHJhY2UsIGJ1dCBpdCBsb29rcyB0aGUgcmVhZGVy
IHRocmVhZHMNCm1heSBvcGVyYXRlIGluIGFuIGluY29uc2lzdGVudCAgc3RhdGUsIHdoZXJlIGNh
cmQtPnVzZXJfY3RsX2NvdW50ICsgMSBpcyBhY3R1YWxseSBiaWdnZXINCnRoYW4gTUFYX1VTRVJf
Q09OVFJPTFMsIHNvIHdlIHdhbnQgdG8gcG9pbnQgaXQgb3V0Lg0KDQpUaHJlYWQgMSBUaHJlYWQg
Mg0KLy9zbmRfY3RsX2VsZW1fYWRkKCkgLy9zbmRfY3RsX2VsZW1fYWRkKCkNCmlmIChjYXJkLT51
c2VyX2N0bF9jb3VudCArIDEgPiBNQVhfVVNFUl9DT05UUk9MUykNCnJldHVybiAtRU5PTUVNOw0K
DQpjYXJkLT51c2VyX2N0bF9jb3VudCsrOw0KdW5sb2NrOg0KdXBfd3JpdGUoJmNhcmQtPmNvbnRy
b2xzX3J3c2VtKTsNCnJldHVybiBlcnI7DQoNClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4gIEluZGVl
ZCB0aGlzIGlzIGEgcmFjZSBhdCByZWFkLg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJIGFtIGds
YWQgSSBjb3VsZCBiZSBoZWxwZnVsLg0KT1RPSCwgaXQncyBub3QgbXVjaCBzZXJpb3VzIHNpbmNl
IHRoaXMgY2hlY2sgaXMgb25seSBmb3IgYSBzb3J0IG9mDQpzb2Z0LWxpbWl0IHRvIGF2b2lkIHRo
ZSBtZW1vcnkgZXhoYXVzdGlvbi4gIElmIGFueSwgd2UgY2FuIGFkZCB0aGUNCnNhbWUgY2FyZC0+
dXNlcl9jdGxfY291bnQgY2hlY2sganVzdCBiZWZvcmUgX19zbmRfY3RsX2FkZF9yZXBsYWNlKCkN
CmNhbGwsIGJ1dCBtYXliZSBub3Qgd29ydGggZm9yIGV4dHJhIHdvcmsuDQoNCkl0IGxvb2tzIGxp
a2UgdGhpcyBpcyBzdGlsbCBhIGhhcm1mdWwgZGF0YSByYWNlLCBhbHRob3VnaCBub3QgbXVjaCBz
ZXJpb3VzLCBhcyB5b3Ugc2FpZC4NClBvc3NpYmx5LCB0aGVyZSBjb3VsZCBiZSBhIGNyYXp5IG51
bWJlciBvZiBzbmRfY3RsX2VsZW1fYWRkKCkgcGFzc2luZyB0aGlzIGNoZWNrDQpidXQgcGF1c2lu
ZyBiZWZvcmUgaW5jcmVhc2luZyBjYXJkLT51c2VyX2N0bF9jb3VudCAoc28gb3RoZXIgc25kX2N0
bF9lbGVtX2FkZCgpDQpjYW4gc3RpbGwgcGFzcyB0aGUgY2hlY2spLiBPbmNlIHRoZXkgYWxsIGZp
bmlzaCwgdGhleSBjYW4gY2F1c2UgYSBjcmF6eQ0KY2FyZC0+dXNlcl9jdGxfY291bnQgdmFsdWUg
YW5kIGFsc28gbWVtb3J5IGV4aGF1c3Rpb24uDQoNCkFueXdheSwgc2luY2UgdGhlIGNvZGUgd2ls
bCBiZSBjaGFuZ2VkIHNvIHByb2JhYmx5IGl0IGlzIG5vdCB3b3J0aCBvZiBleHRyYSBmaXguDQpU
byBiZSBub3RlZCwgdGhlIHJlbGV2YW50IGNvZGUgd2FzIGFscmVhZHkgY2hhbmdlZCBzaWduaWZp
Y2FudGx5IGZvcg0KNS4xMyAoY3VycmVudGx5IGluIGZvci1uZXh0IGJyYW5jaCksIGhlbmNlIHRo
ZSBmaXggSSBtZW50aW9uZWQgaW4gdGhlDQphYm92ZSB3b24ndCBiZSBhcHBsaWNhYmxlLiAgQW5k
LCBJIG5vdGljZWQgdGhhdCBhIHNpbWlsYXIgcHJvYmxlbSBpcw0Kc2VlbiB0aGVyZSwgZXZlbiB3
b3JzZSAtLSBhIHJhY2UgbWF5IGhhcHBlbiBhdCB0aGUgd3JpdGUgc2lkZSBpbiB0aGlzDQpjYXNl
LCB3aGljaCBuZWVkcyBhIGZpeC4gIFdpbGwgdGFrZSBhIGRlZXBlciBsb29rIGxhdGVyLg0KDQoN
CnRoYW5rcywNCg0KVGFrYXNoaQ0KDQo=
