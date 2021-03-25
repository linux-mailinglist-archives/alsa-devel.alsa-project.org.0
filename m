Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC3348E79
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD121165E;
	Thu, 25 Mar 2021 12:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD121165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616670177;
	bh=br5HQbDrrKqXnMscV8A5vHf/pmmBAC99t4U3uzCM17s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jL818HdQoBDGE11gIJmALCoMNZl1Bp5a0pFyObWyiCwhemJh+MMBsNnCQ0ZIBNk/Y
	 x0VM6a8bBWA2Rr21soTpasv/FBscRlnlL+pczvlon5PdMKR04DOuBYT+0DwHZ5Wb6I
	 5bmgzn8PXlTC71UzZ3t/+6Xz6ZZAHE/bTHASGL60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 717DAF80268;
	Thu, 25 Mar 2021 12:01:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1E1F8025F; Thu, 25 Mar 2021 12:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDE7BF80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDE7BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=infinera.com header.i=@infinera.com
 header.b="XWcZPcoK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlGzkocHL9pVz/Qz23qIJh9lOT44wTTgIDBsptP/8NG+0IbQBT6kgGQgVt4FWXAcQvdc/5LnHbQjz9Sap9g45at12QObNXaswIDFlEfxowxPOx4Wq5Z5ZdVjC94Gf5Ym/ThHH5p2Z3RsVbhdYTGCCRUOg8Gl8izVbYvyYNXDqT5DmKjTREeo54L+lcbkjRCzYWfnetynN9D01H4uXQjpRMCKysxvt9PsNmg/44mN7mEgdt0QrlGxov5RBzHlc9LGhLx6trRVUSPvnQsi4Ki245FotM5miZi45shNLZvx4JBSlTcjoFNXExYYS8daQoZ2J7iHZW8Ocy9iqweC1yW9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br5HQbDrrKqXnMscV8A5vHf/pmmBAC99t4U3uzCM17s=;
 b=lUGy50DedsWqdudOse5wJfxocXgM2Qh0sA/mMfooB98v5xIBirl1fJrqA5NxAnB8J+Yr3bI9winIXCMoPQ0qCsUy8YTrRoZY/EhmWe+ZkDVoFhfn9k0DX4Z7sEaiN/RYRecu7kqOggmmH4vy0Usv5l1LqfpKw/HwbS9ZK/jTtvcJs5AxL8QQtmMhFui8doqPLZlRkjpl/Q5nqxZzHG1Uc3Brmz/1ca76z92o0o1+bx9pZepUiywjm/7p+6fzoerKVXnwBFmIaFyKGHw9DGp0ZJOViusmklYz734MkjV3dySggGQXkglZIoEPWwbKMMtPQNyFRwLWWRKlczhEkBDBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br5HQbDrrKqXnMscV8A5vHf/pmmBAC99t4U3uzCM17s=;
 b=XWcZPcoKAxf4G6RXv3RyS8YLhgw3vlGxxE2i29m3yDQNUSsNtqlqCgIS+0GDgzd/MUHfVE2v/mxeP3Tmu/lif9vtmg4NVxcwkk7jok7e8c4q2tEoHQR2KLGhAMAVcXZx7npusDRXHl5HiMlhMknlal5qLY0oPuNhE1c4WU7lYi0=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1557.namprd10.prod.outlook.com
 (2603:10b6:903:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 11:01:08 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79%5]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 11:01:08 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "ikjn@chromium.org" <ikjn@chromium.org>, "tiwai@suse.de" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
Thread-Topic: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
Thread-Index: AQHXIJu5KknmGOLeWU+zwJhqGFj8lKqS/PcAgAANJwCAAAzlgIABdBEA
Date: Thu, 25 Mar 2021 11:01:08 +0000
Message-ID: <72c6194f84221d2902941286e8ba0f74f4f1ad6d.camel@infinera.com>
References: <20210324105153.2322881-1-ikjn@chromium.org>
 <c21de867cf4ccbfcc8cf555c78dc70dd3a47dfe8.camel@infinera.com>
 <CAATdQgDrri-tMtu3AOFRcbGHfL6hONDfdMdZh45BusbdAoWfdw@mail.gmail.com>
 <s5ho8f8ogx8.wl-tiwai@suse.de>
In-Reply-To: <s5ho8f8ogx8.wl-tiwai@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.39.3 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 483d1a43-2554-4043-e11a-08d8ef7d4b34
x-ms-traffictypediagnostic: CY4PR10MB1557:
x-microsoft-antispam-prvs: <CY4PR10MB15571E72B4DC15F69A2D5591F4629@CY4PR10MB1557.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CkMkkJO2dt9AANJTbRr32gUwhGDsD0wP83VGF9oS1yKKTC9SY+XnwdnmGupwcM3vABnkDBW8W1Mkm7voVVPJUIf1v5gCjiQoYrJDJYW1lp3FwK6I2bTIqzGcXyqpj6lpyjMINkwuXBa8swxvqnz3vJ//PYJl38hKqpv2PH2rgonetyIPrtf7usw+uk20/dRb8OQwNabWpZ/qWkjPSo7G4t6A5uIvz9Z8g02pXvO2yCuFAJPQJokJuUEFJPRBmkZ7EXrvindyvnamu6+K5yGJiMFx1W5reiwdtSC6Nmc7KBeMRJB3XRCf3m6CGQwqmHx1OTKwxYGfQ6x8BYEPTxdcseNwCgRB5rJh4ZdYLPcYoFqTi0mJ6Q2sOnPDhK5roBSVxxPxB2Dh/x0uYuLbRlHg55mTVrDGNPKO4/z4s9Tet+O1CqBRwDA3NOh5X6DTybu5rKrtHW7QCnJ/f7Nqx0fv43vHm96A8wrD70g15GZnPptfM5OoMxw+xDJGCR5DI39KRSy0ZWGlnH2FHH0NqGao/tZecOfksfODcQaiS1NdWUoMCmNnSnpg/EQK9AR7QOsfcv99nX8kYFHJVTLEItYNMX1RPMiO7x51tIKujNPkRfKL5DgCfLBkFZ1aeWpdGCynoiyrF6Gvrn34/ZaiuH6ZLhVrbaDvnWcdw2dRItC/B7g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(4326008)(186003)(2906002)(8676002)(66946007)(38100700001)(36756003)(478600001)(6506007)(91956017)(6486002)(5660300002)(66446008)(54906003)(8936002)(76116006)(7416002)(316002)(64756008)(2616005)(86362001)(6512007)(71200400001)(66556008)(26005)(4744005)(110136005)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?T1FteWorSVE5Qm56bkVuNTgxVnFVekFWNGlUVWJMOWhBN1lweXozQkJWdWQv?=
 =?utf-8?B?aDlDNDRRM21rV2RNbm1xZkdlc1YrOVg4aE1XQ0dDb1pKZGMzc3EvZmN3N1Z0?=
 =?utf-8?B?anBBcDEvbktBSDRvZjExeE9PRWR0aHl5N2xibjlIazcrT0lySnMxZkhyaW9j?=
 =?utf-8?B?aklhby9vZldncVdjQ0djNkxyQThUaWlLK2J5ZC9BWm5pVDJQbHNYQUFQUUFT?=
 =?utf-8?B?QmoybEtqd3VMWnlwZjdvbVJhN2g1ZUZtU0xZTHcySUJZbWN3eEZUTm1DRFpW?=
 =?utf-8?B?VUFndXNlOFM2cXNZOWc0RkROV1RFVlNBKy8rbmdjNnN4L2srNGsvZHdZY2tY?=
 =?utf-8?B?ZHIwQUJKL29PSEx4RlJBV09YcGtPdms4QlhFZXNRNkZnc1RHWG9Zejc1aTlm?=
 =?utf-8?B?TTcrbzNxcDVrRTRMQlIzQ3ByVC9XcUhYd2JlNEJnUGY0TlU0V1N0cjV1Y2h1?=
 =?utf-8?B?K29mWkpoUEFCZlJNREEydkFXelE1bnVUd21zVE1FMGJWN0gyK0hKclI1Vlhs?=
 =?utf-8?B?Rk1wbFRiQU9wN29JazJYeTFpZytCSG15eDVPVWZiZWtiS2w4NmJrWSswU0Nz?=
 =?utf-8?B?SFBNVFdIN3FrendMWEdkTTdDVHVjYUJGaG1GaG5WYjVySURmSFV3YXBNNU55?=
 =?utf-8?B?ZVZadS93LzI0YWdYSUVkWXp0ckVHekFqSHhKN2VGZ3VFSm10N2lObVI1SDJw?=
 =?utf-8?B?bVpIUWxJUVF1Q1ErNXZRUTV1YWRLMm5Bc2ZsTWhKY1Y2L0RtUWNlZFNxZlFJ?=
 =?utf-8?B?Q2JaY2NUdWptdjEyOXgrSWJESnFxTTBWMHlma2RnSmpMMXVpVUVFdGozVFBZ?=
 =?utf-8?B?eDJGYW90N09hWFNxUVAzWFgwbWwra09IR2FYNVhFVkk0Vng1YVVsZzdOd3JT?=
 =?utf-8?B?MVF5bWp2YlFhZFo0VDBaNDVQdWl4TUpISWFXTVBpOSsyZzcxQmZ4WFBFTUk5?=
 =?utf-8?B?SXU2TngvQ2lpQkxHZjI3RGJZb0I1eGIxVTQ2UGJQSWtyUjVuTXpUYU95RTZW?=
 =?utf-8?B?K2pWS1VJS3ZNcG9DQ2hjKzY5bTJsRmlJVXdvYncweXJybzZBQ2NOS09Ydzd4?=
 =?utf-8?B?UTNzMnlEM0NCbDRXbnZiSnBrTVJ3d2l0RFREdDVrMjRPY0x2cmRxR1hKRmxX?=
 =?utf-8?B?c0ZmVHIyME53VXBteFBzVmExd2VkMGh6T2gvakZ5dmxCYm5YeHo3RDRwcW9i?=
 =?utf-8?B?YWhaZms0TXJlblVnc2pHL294OXRydEdnZmFiem5IRmZsL0RlZ3JiRzkrS2p3?=
 =?utf-8?B?ZWU0MStPTEx3Q28xQmdmQXVMRWZjSG9MNzFIbStSYlBZajlvSEJMWm5uQ3N0?=
 =?utf-8?B?S3RXcjRVV0hodkVYS1JwWEY5ZkNyTmRCcUFrT2hXUUw3NkNkWnBlMDBvZ0hn?=
 =?utf-8?B?d1d3anpDQ0ZLTS9YWUdQOVgyd0cyMXlwUUhZMjVlbFNUU053YnZTNEYyQ0Mr?=
 =?utf-8?B?OGlaSUtXTy9HTFFJV1hobnN2dlFrYmZtVmZzRllWeVJQeWVqeHMxZjdiNkZ1?=
 =?utf-8?B?SG4zU1c5YVpvV2lRalhiL00wRXhCQzl2R0dieTM5cmxtY2JZS2oxV0V5ZXJD?=
 =?utf-8?B?dWRueFUvT0ZNKzNjTTlkTGYzVWRjUEZaL2Ntak43YlN3bUdvNjRoQ0E4ckhZ?=
 =?utf-8?B?bmFGZUw3VnBzOU01citsNmdHcFB4Yk9tRkFaYzgxc2ovR1UxZUpWNlg3L2E4?=
 =?utf-8?B?UmpKTkdXUHgvVWYrMTZsaWFwZnBuWTFZU0R0eG5zOHd5eEJnSGl0MDRxY2Ro?=
 =?utf-8?Q?MAB4ihxN86UBrs5cW0DVDzGAhr6cBj9/ON2iakL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6149D0DD4EF9354DA208EA491A32199C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d1a43-2554-4043-e11a-08d8ef7d4b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 11:01:08.2765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04WOir213ArJPBzY6rNIyJiq4+rvpPcwX+XmusvCLT77VXO4m0ptFSnhyElIQHxblI2qqDbngYtDeJxYPyqxXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1557
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dylan_robinson@motu.com" <dylan_robinson@motu.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "alexander@tsoy.me" <alexander@tsoy.me>,
 "kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>,
 "grpintar@gmail.com" <grpintar@gmail.com>, "livvy@base.nu" <livvy@base.nu>
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

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDEzOjQ5ICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IE9uIFdlZCwgMjQgTWFyIDIwMjEgMTM6MDM6MTQgKzAxMDAsDQo+IElram9vbiBKYW5nIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFdlZCwgTWFyIDI0LCAyMDIxLCA3OjE2IFBNIEpvYWtpbSBUamVybmx1
bmQgPEpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEuY29tPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiAN
Cj4gVGhlIExvZ2l0ZWNoIGRldmljZXMgd2l0aCAwNDZkOiogc2hvdWxkIGJlIGNvdmVyZWQgZ2Vu
ZXJhbGx5IGluDQo+IHNuZF91c2JfY3RsX21zZ19xdWlyaygpLCBzbyBJIGd1ZXNzIGl0J3MgYSBk
aWZmZXJlbnQgcHJvYmxlbS4NCj4gQnV0IHBsZWFzZSBjaGVjayBpdCBmaXJzdC4NCj4gDQo+ID4g
QW5kIDIwbXMgY2FuIGJlIHRvbyBsb25nIGlmIGl0J3MgYXBwbGllZCB0byBldmVyeSBjb250cm9s
IHRyYW5zZmVyLiBJIHdpbGwNCj4gPiB0ZXN0IHRoZSBkZXZpY2Ugd2l0aCBzaG9ydGVyIGRlbGF5
IGlmIHlvdSBkaWRuJ3QgdHJ5IGl0IGJlZm9yZS4NCj4gDQo+IEFjdHVhbGx5IHRoZSBkZWxheSBh
cHBsaWVkIHRvIExvZ2l0ZWNoIGRldmljZXMgaXMgZnJvbSAxIHRvIDJtcywgbm90DQo+IDIwbXMu
ICBUaGUgMjBtcyBkZWxheSBpcyBhcHBsaWVkIGZvciBzb21lIG90aGVyIGRldmljZXMuICBCdXQg
aWYNCj4gZXh0ZW5kaW5nIHRoZSBkZWxheSBmaXhlcyB0aGUgcHJvYmxlbSwgd2UgbmVlZCB0byBy
ZWNvbnNpZGVyIHRoZSBkZWxheQ0KPiBsZW5ndGguDQo+IA0KDQpUaGVyZSBhcmUgYSBsb3Qgb2Yg
ZGV2aWNlcyBVU0IgQXVkaW8gZGV2aWNlcyB0aGF0IG5lZWQgdGhhdCAxLTIgbXMgZGVsYXkuIEhh
dmUNCnlvdSBjb25zaWRlcmVkIHRvIG1ha2UgdGhpcyBkZWxheSBnZW5lcmljKGZvciBhbGwgQXVk
aW8gVVNCIGRldmljZXMpID8NClNlZW1zIGxpa2UgV2luZG93cyBoYXMgc29tZXRoaW5nIHNpbWls
YXIgYXMgdGhlc2UgZGV2aWNlcyBqdXN0IHdvcmsgdGhlcmUuDQoNCiBKb2NrZQ0K
