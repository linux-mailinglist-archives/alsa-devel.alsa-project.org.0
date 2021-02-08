Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DEC31348B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 15:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324E2167B;
	Mon,  8 Feb 2021 15:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324E2167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612793402;
	bh=HEtOGYP6o7XRtn8NzbvpHTjRc8xDzTw4SvuSQ9h0xPk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKYEvy+zHYYw0M/usvz3J5HUK2or7vGrvXsnxVMFFG9mu5hyLLNh9ztsiswvF7Mky
	 Z1vtGzubZhs1Z9tAHe2KYkr9xRGfPVRTyuLRY2bL4K8PZVtjo6dArcd2EW9gt2/jH8
	 XSdwCW3fttJoa8YrSnOkA6sPUhl+omnkoSLzUEMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 809F5F8022D;
	Mon,  8 Feb 2021 15:08:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80350F8022B; Mon,  8 Feb 2021 15:08:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA24F8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 15:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA24F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="yg7A/1gF"
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118E2K2P019099; Mon, 8 Feb 2021 09:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=HEtOGYP6o7XRtn8NzbvpHTjRc8xDzTw4SvuSQ9h0xPk=;
 b=yg7A/1gFvELwPm+og9LmWZLtFM1C4WHSuIvHVd/SlDwCwj22RiJfyW+V9MSfWbZ7zvoZ
 Nv2bYQ5cvshCFrYUAFr2zQLfBKkLo0kL6SeIIEKQUJhexiN8m/Y5WJvHFCFfQgZ9/7US
 HVkZwvn5tjPkOdceN76Add/dc+XjrVrpo7vGHDD/7fKJXQiCKKSinTkkLrD3aHvQ4J2s
 OrjC1nFIkb7//fxrgS91XVCqeLj7HBYzPlVrKj8iJH1xbIg3pZSVkH4uXQ+mqAZVZ+ui
 xQ/I9EB+GYxF7BGza5EwD9WgV/2xNqEE6FGeIZ2c0WwmDQix6T94U73QKWUr3MnBPumB WQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 36hq51cgvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 09:08:19 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118E5jGQ182680; Mon, 8 Feb 2021 09:08:18 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0b-00154901.pphosted.com with ESMTP id 36hp907a7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 09:08:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxLHRJXc8odDxd5tsNKER8NOyKQSl2iETprpJdqrejy1WwN2wv/7T3B6QQcIYv1oxW+VdffssgMMt2kNIz7P9B7904DLNFNLshkUVbLeMvvzI1yjapNtcFh8HprnWj7KUKmTmRPM2ZgHcGa9aM+MHIHuEGAvOdRP6fh0fojN18lhONtcjI+/yn98TN8p12XFXUmJw7QTN62vfesvD+B5wZc3qTJ+TGXH/c05uLevFVM1LJSImjWM1f1wU/bgASp5xr/2H3O27Yy9kGIJaawlJl4acap2ARalP6EKXfqutvCJuSSfy5K6rFSql0nbgpK2bb+R2Uk3WXwSLYRNQAWqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEtOGYP6o7XRtn8NzbvpHTjRc8xDzTw4SvuSQ9h0xPk=;
 b=dz/3l8SDRrtIXRdTOwbjKUts+jicl7S3Jp4Z7qIiv+CkIS8h3KZzH45tRgKDzauVn4Xm6DajWqlTDTuIPEkZrL6tJsXAeg1pJkGpDqQn2Tgv3cyojH2KA6VJ5eMqtazb9T+p26iE6psH8/YciIkGY0w/HKvUvjjGwjTy6qt+1hZ0JilWRpU1jLrCLoVejXCKoyPo/wrZAKnW/nV2dmoGtqOPsNcytahBfoNX8rkSrbmxiwB1hhSxgWutEHbGnoTYzgL61E1cMnFhxqbj5BYmVPLely/utAIBl2f1Iby+zs/c0raYJb7J3oO/W5wHoqh55K8Dyn5KnheVMXoxHYUtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by SJ0PR19MB4447.namprd19.prod.outlook.com (2603:10b6:a03:284::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Mon, 8 Feb
 2021 14:08:15 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::50bf:f1c3:9600:fe6b]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::50bf:f1c3:9600:fe6b%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 14:08:15 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Jaroslav Kysela <perex@perex.cz>, Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
Thread-Topic: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
Thread-Index: AQHW/Y2Gnp5uHN8Ln0WmJSU+834rmapNK1AAgAD4ZICAACa2kA==
Date: Mon, 8 Feb 2021 14:08:15 +0000
Message-ID: <SJ0PR19MB4528FE30906B31C79E31A052848F9@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210207201157.869972-1-perex@perex.cz>
 <3195f3b6-6294-d872-ce1c-6f1a9deb5a6f@redhat.com>
 <cf6fc0bf-4eb6-c9f8-883f-4a48343cf6d9@perex.cz>
In-Reply-To: <cf6fc0bf-4eb6-c9f8-883f-4a48343cf6d9@perex.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-02-08T14:08:11.3991454Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=be76bfe8-c0db-4c47-9bed-ce747f6bbe38;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0817bb8d-ed38-4d48-12ab-08d8cc3afa66
x-ms-traffictypediagnostic: SJ0PR19MB4447:
x-microsoft-antispam-prvs: <SJ0PR19MB44470D54FE85E9EDAA61EAC3848F9@SJ0PR19MB4447.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f45PtTMm9IumGEfbFi+DXK55R27omT9Js0pzKP7tlzh6nWEaWGYtTB4ZK2c5bbW6sQ+nYW72TqFfvCEIQaT/ZSd730NavW49n5JXUIpfC1XgMeX9KW5azrL043gGrfkr0Kk1RXvqddWNbiVMsP/QRtCpTtfvcPjUUmU6A4U4ALU2057xRT6Mv5+LccFKcysIbdbOT9ptXIz0xr/WKeBXu4kPldWvhp6enU5h9qpgbPOt1oUd2HGw/n5/Cze/BzYX5nFoKAxFB5HEvxJ+himMcYvcpR0/O8iS360V+vZZmkqqbAZ9MXHjjaRWYUsllxmxeyFOQEux9xq4xlO0fxP08Lfe+TMl7Hdnj88nb5Vo+NKGBBoKfv66si15onWMrQvWAt8sClkS1Pgko7tMLlDDiAVRM6u5xZIV4k2Nrq5/2aGQQaeypVU1TKR5UrPsYGx6li9NIrm3FNqSWIfYcxM0K3hPE37vhBQe8z4jD9VcBfX1yUIptb/1cdMe4iOwQQfAly0qgr80lYZnTIjQGycCP8O2fiZgH77iyjcqvy6XTEoSIxEdm+8h3T91bPe4Rjhe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(8936002)(786003)(5660300002)(52536014)(26005)(55016002)(6506007)(86362001)(53546011)(66556008)(33656002)(2906002)(110136005)(478600001)(66946007)(7696005)(76116006)(66476007)(4326008)(83380400001)(186003)(66446008)(8676002)(71200400001)(9686003)(64756008)(316002)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UOU/Rf/9ieRSdYh7Rg6oSuIHcG02r0enjetROUJo1HA8EnpQD/JQX3KpDwJNeB+oi8gXKtaymDb06VeBNjqq813AvH6/34b03igHcl/RnpbKCy1vkmUfPbPEuJjYP7UEfKyB0mtCN7ERnmomzqgONOwAWt9/fSqkz9qz5229Zjd+3kAgQqiIYHPtMDvkURPwMkdzKz6z0ITjwyfdTHZQ/+aqmFImTwRAdH9VzvAPDEn1vDljO8GzrjzNZi8ftpxvNbsg+BjAmKGFtcKlpjJ8GPWUILitdox9jMBzDf4IKvXcjnEg3StznKd4+WkQfx8spD70ch+NT4Z+sra6I4NGWLcFmNgHSQcnn+Mqr6jsGszOnyXRnjkP3vd28NBG111eXAWa+5uANcqC6T+yuxP1x+WPXey9gic6MzhUpiUOKNeTNL6hmHD9jfEqey0g7g7CCkX1+j/jYoT8/9Bm/0uvHCglxu4VbhVi/xCSAcg55dcoWlFdtaDuv6zoYyBiDlE1FEcLL7a2THtvhaZMGrKkzZveeVuKJYiRHHpBRuFYtI2NrRyaeYSvHZ6dXpVE0zRWV43soP3MFWxLqlzLpjcoupewOT/ZFMwvSlTigACEf7p8H3Rno5XUWBEXQq7lBjReDQg1XSZd6PTATaJ5qQLHxpCjOgUSsbcoQDmeRbfeyA69aG6xaCxIRqRBoQBQB6NlAQGKdXqEss4KmBoh09r02VSykVsufVnSRoy90AR3WX0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0817bb8d-ed38-4d48-12ab-08d8cc3afa66
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 14:08:15.2305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dkBxeykYrWnYjnVHsnkfMk9DA9l7oUckoewrZFGYyGoTOAqufd+e9Fd5ugH+xU67BS2exTUSFUxNjtJj4GPZgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4447
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080096
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080096
Cc: Takashi Iwai <tiwai@suse.de>
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

SGkgSmFyb3NsYXYNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFyb3Ns
YXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gU2VudDogMjAyMeW5tDLmnIg45pelIDE5OjQy
DQo+IFRvOiBIYW5zIGRlIEdvZWRlOyBBTFNBIGRldmVsb3BtZW50DQo+IENjOiBUYWthc2hpIEl3
YWk7IFl1YW4sIFBlcnJ5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtSRkNdIEFMU0E6IGNvbnRy
b2wgLSBhZGQgZ2VuZXJpYyBMRUQgQVBJIHRvIHNvdW5kIGNvcmUNCj4gcm91dGluZXMNCj4gDQo+
IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiBEbmUgMDcuIDAyLiAyMSB2IDIxOjUyIEhhbnMg
ZGUgR29lZGUgbmFwc2FsKGEpOg0KPiA+IEhpIEphcm9zbGF2LA0KPiA+DQo+ID4gT24gMi83LzIx
IDk6MTEgUE0sIEphcm9zbGF2IEt5c2VsYSB3cm90ZToNCj4gPj4gW0RPIE5PVCBNRVJHRSFdDQo+
ID4+IFtUaGlzIGlzIGp1c3QgYW4gZWFybHkgcHJvcG9zYWwgZm9yIGNvbW1lbnRzXSBbVGhlIGNv
ZGUgaXMgbm90IHRlc3RlZA0KPiA+PiAvIGRlYnVnZ2VkXQ0KPiA+Pg0KPiA+PiBUaGUgcmVjZW50
IGxhcHRvcHMgaGF2ZSB1c3VhbGx5IHR3byBMRURzIGFzc2lnbmVkIHRvIHJlZmxlY3QgdGhlDQo+
ID4+IHNwZWFrZXIgYW5kIG1pY3JvcGhvbmUgbXV0ZSBzdGF0ZS4gVGhpcyBpbXBsZW1lbnRhdGlv
biBhZGRzIGEgdGlueQ0KPiA+PiBsYXllciBvbiB0b3Agb2YgdGhlIGNvbnRyb2wgQVBJIHdoaWNo
IGNhbGN1bGF0ZXMgdGhlIHN0YXRlIGZvciB0aG9zZQ0KPiA+PiBMRURzIHVzaW5nIHRoZSBkcml2
ZXIgY2FsbGJhY2tzLg0KPiA+Pg0KPiA+PiBUd28gbmV3IGFjY2VzcyBmbGFncyBhcmUgaW50cm9k
dWNlZCB0byBkZXNjcmliZSB0aGUgY29udHJvbHMgd2hpY2gNCj4gPj4gYWZmZWN0cyB0aGUgYXVk
aW8gcGF0aCBzZXR0aW5ncyAoYW4gZWFzeSBwYXRoIGZvciBkcml2ZXJzKS4NCj4gPj4NCj4gPj4g
VGhlIExFRCByZXNvdXJjZSBjYW4gYmUgc2hhcmVkIHdpdGggbXVsdGlwbGUgc291bmQgY2FyZHMg
d2l0aCB0aGlzDQo+ID4+IGNvZGUuIFRoZSB1c2VyIHNwYWNlIGNvbnRyb2xzIG1heSBiZSBhZGRl
ZCB0byB0aGUgc3RhdGUgY2hhaW4sIHRvby4NCj4gPj4NCj4gPj4gVGhpcyBjb2RlIHNob3VsZCBy
ZXBsYWNlIHRoZSBMRUQgY29kZSBpbiB0aGUgSERBIGRyaXZlciBhbmQgYWRkIGENCj4gPj4gcG9z
c2liaWxpdHkgdG8gZWFzeSBleHRlbmQgdGhlIG90aGVyIGRyaXZlcnMgKEFTb0MgY29kZWNzIGV0
Yy4pLg0KPiA+Pg0KPiA+PiBOb3RlOiBUaGUgc25kX2N0bF9ub3RpZnlfb25lKCkgY2hhbmdlcyBz
aG91bGQgYmUgbW92ZWQgdG8gYSBzZXBhcmF0ZQ0KPiA+PiBwYXRjaC4gSSB3aWxsIGRvIHRoaXMs
IHdoZW4gdGhpcyBwcm9wb3NhbCBpcyBhZ3JlZWQuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+DQo+ID4+IENjOiBQZXJyeSBZdWFuIDxQ
ZXJyeS5ZdWFuQGRlbGwuY29tPg0KPiA+PiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4NCj4gPg0KPiA+IE5pY2UgSSB0aGluayB0aGF0IGhhdmluZyB0aGlzIGhhbmRsZWQg
aW4gYSBnZW5lcmljIG1hbm5lciB3b3VsZCBiZSBhDQo+ID4gZ3JlYXQgaW1wcm92ZW1lbnQuDQo+
ID4NCj4gPiBJIGhhdmUgMiBIUCB4MiBtb2RlbHMgd2hpY2ggYXJlIEJheSBUcmFpbCByZXNwLiBD
aGVycnkgVHJhaWwgYmFzZWQsDQo+ID4gd2hpY2ggbWVhbnMgdGhleSB1c2UgSW50ZWwncyBMUEUg
KExvdyBQb3dlciBFbmdpbmUpIGZvciBhdWRpbyB3aGljaA0KPiA+IHVzZXMgQVNvQy4NCj4gPg0K
PiA+IFRoZXNlIGNvbWUgd2l0aCBkZXRhY2hhYmxlIFVTQiBrZXlib2FyZC1kb2NrcyB3aGljaCBo
YXZlIGEgc3BlYWtlcg0KPiA+IG11dGUgTEVELiBJIGhhdmUgYWxyZWFkeSBhZGRlZCBMRUQtY2xh
c3Mgc3VwcG9ydCB0byB0aGUgSElEIGRyaXZlciBmb3INCj4gPiB0aGVzZSwgYnV0IEkgbmV2ZXIg
Z290IGFyb3VuZCB0byBob29raW5nIHVwIGEgdHJpZ2dlciBmcm9tIHRoZSBBU29DDQo+ID4gY29k
ZS4NCj4gPg0KPiA+IFNvIGlmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5LCB0aGVuIGlm
IEkgYWRkIHRoaXMgcGF0Y2ggdG8gYQ0KPiA+IGtlcm5lbCBhbmQgaW4gdGhlIEFTb0MgY29kZWMg
ZHJpdmVyIGFkZA0KPiBTTkRSVl9DVExfRUxFTV9BQ0NFU1NfU1BLX0xFRA0KPiA+IHRvIG9uZSBv
ciBtb3JlIG9mIHRoZSBjb250cm9scywgYW5kIGFkZCAuZGVmYXVsdF90cmlnZ2VyID0NCj4gPiAi
YXVkaW8tbXV0ZSIgdG8gdGhlIGxlZF9jbGFzc19kZXYgZm9yIHRoZSBMRUQsIHRoZW4gaWYgSSB0
b2dnbGUgdGhlDQo+ID4gY29udHJvbCBvbiAvIG9mZiBpbiBhbHNhbWl4ZXIgdGhpcyBzaG91bGQg
dGhlbiBjb250cm9sIHRoZSBMRUQgPw0KPiANCj4gWWVzLCB0aGUgQUxTQSBjb250cm9sIGNvZGUg
c2hvdWxkIGRvIGp1c3QgdGhlIExFRCB0cmlnZ2VyLg0KPiBUaGUgTEVEIGNsYXNzIGRyaXZlciBp
cyBhIHNlcGFyYXRlIHRoaW5nLg0KPiANCj4gPiBJZiBJIGdvdCB0aGF0IHJpZ2h0IEkgd2lsbCBj
ZXJ0YWlubHkgZ2l2ZSB0aGlzIGEgdHJ5Lg0KPiA+DQo+ID4gQW55IGFkdmljZSBmb3Igd2hpY2gg
Y29udHJvbCB3b3VsZCBiZSB0aGUgYmVzdCB0byB1c2U/DQo+ID4gTG9va2luZyBhdCB0aGUgY29k
ZSwgaXQgYXNzdW1lcyB0aGF0IGlmIGEgY29udHJvbCBpcyBlbmFibGVkIHRoYXQgdGhlbg0KPiA+
IHRoZXJlIHdpbGwgYmUgYSByb3V0ZSwgd2hpY2ggbWFrZXMgc2Vuc2UgaWYgdGhlcmUgYXJlIGUu
Zy4gaGVhZHBob25lcw0KPiA+IGFuZCBzcGVha2VyIGFuZCBsaW5lb3V0IGNvbnRyb2xzLiBCdXQg
d2hhdCBhYm91dCBjaGFpbmVkIGNvbnRyb2xzLA0KPiA+IGUuZy4gc2VwYXJhdGUgdm9sdW1lICsg
bXV0ZSBjb250cm9scyBvciBtdWx0aXBsZSB2b2x1bWUgY29udHJvbHMNCj4gPiBjaGFpbmVkLiBX
aXRoIEFTb0MgdGhpcyBpcyBub3QgdW5oZWFyZCBvZi4gSSBndWVzcyB0aGUgYW5zd2VyIGlzIHRv
DQo+ID4gcGljayB0aGUgY29udHJvbCB3aGljaCB3ZSB3aWxsIGFsc28gd2FudCB0byB1c2UgZm9y
IGh3IHZvbHVtZS1jb250cm9sDQo+ID4gaWYvd2hlbiBVQ00gcHJvZmlsZXMgZ3JvdyBodyB2b2x1
bWUtY29udHJvbCBzdXBwb3J0ID8NCj4gDQo+IFRoZSBwcm9wb3NlZCBpbXBsZW1lbnRhdGlvbiBq
dXN0IGdvZXMgdGhyb3VnaCBhbGwgbWFya2VkIGNvbnRyb2xzIGFuZCBpZg0KPiBhbnkgb2YgdGhl
IG1hcmtlZCBjb250cm9scyBpcyBzZXQgdG8gdmFsdWUgZ3JlYXRlciB0aGFuIHRoZSBtaW5pbWFs
IHZhbHVlLCB0aGVuDQo+IHRoZSBwYXRoIGlzIGV2YWx1YXRlZCBhcyAib24iICh0aHVzIHRoZSBt
dXRlIExFRCBzaG91bGQgYmUgc2V0IHRvIG9mZikuDQo+IA0KPiBUaGUgY29udHJvbHMgdGllZCB0
byB0aGUgUENNIHN0cmVhbSAoREFDIC8gRE1BKSBzaG91bGQgYmUgbWFya2VkLiBUaGUNCj4gcGh5
c2ljYWwgaW5wdXRzIGJlaGluZCBhIG11bHRpcGxleGVyIHdpdGhvdXQgYSAiZ2xvYmFsIiB2b2x1
bWUgLyBzd2l0Y2gNCj4gY29udHJvbHMgd2lsbCByZXF1aXJlIGEgYml0IGRpZmZlcmVudCBoYW5k
bGluZy4gSSB3b3VsZCBqdXN0IHN0YXJ0IHdpdGggc29tZXRoaW5nDQo+IHNpbXBsZSBhbmQgd2Ug
Y2FuIGFkZCB0aGUgbW9yZSBjb21wbGV4IHRoaW5ncyBvbiBkZW1hbmQuDQo+IA0KPiA+DQo+ID4g
UmVnYXJkcywNCj4gPg0KPiA+IEhhbnMNCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IHAucy4gVGhp
cyB3b3VsZCBvbmx5IC8gYXQgbGVhc3QgYWRkIHByb3BlciBzdXBwb3J0IGZvciB0aGVzZSBMRURz
IGF0DQo+ID4gdGhlIGtlcm5lbCBsZXZlbC4gQVRNIHRoZXNlIGRldmljZXMgd2hpY2ggdXNlIFVD
TSBwcm9maWxlcyBkb24ndA0KPiA+IGFjdHVhbGx5IHVzZSBhbnkga2luZCBvZiBodyB2b2x1bWUt
Y29udHJvbC4gU28gd2Ugd291bGQgYWxzbyBuZWVkIHRvDQo+ID4gZml4IHRoYXQgKGluIHVzZXJz
cGFjZSkgdG8gZ2V0IHRoZXNlIExFRHMgdG8gcmVhbGx5IHdvcmsgd2hlbiBhbiB1c2VyDQo+ID4g
aGl0cyB0aGUgbXV0ZSBrZXksIG9yIGxvd2VycyB0aGUgdm9sdW1lIHRvIE5JTC4NCj4gDQo+IFRo
ZXJlJ3MgYWxyZWFkeSB0aGUgaHcgdm9sdW1lIHN1cHBvcnQgaW4gVUNNIGFuZCBpbiBQQSAoSSBh
ZGRlZCB0aGlzIHRvIFBBDQo+IDE0LjApLiBTb21lIGRyaXZlcnMgbGlrZSBTT0YgSERBIC8gU291
bmRXaXJlIGFscmVhZHkgc2V0IHRoZQ0KPiBQbGF5YmFja01peGVyRWxlbSAvIENhcHR1cmVNaXhl
ckVsZW0gdmFsdWVzLiBJdCdzIHRydWUgdGhhdCB0aGUgaHcgdm9sdW1lDQo+IGNvbnRyb2xzIGFy
ZSBtaXNzaW5nIGZvciB0aGUgSW50ZWwgU1NUIGhhcmR3YXJlLg0KPiANCj4gVGhlIHNpbWlsYXIg
c2l0dWF0aW9uIGlzIGZvciB0aGUgU291bmRXaXJlIGNvZGVjcyAobWlzc2luZyBMRUQgY29udHJv
bHMsDQo+IG1pc3NpbmcgaHcgdm9sdW1lIGNvbmZpZ3VyYXRpb24gaW4gVUNNKS4NCj4gDQo+IAkJ
CQkJSmFyb3NsYXYNCj4gDQo+IC0tDQo+IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+
DQo+IExpbnV4IFNvdW5kIE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5jLg0K
DQpXaWxsIHRoaXMgbmV3IGF1ZGlvIGxlZCBjb250cm9sIGltcGxlbWVudGF0aW9uIGJlIHN1cHBv
cnRpbmcgU09GL1NvdW5kd2lyZSBzdWJzeXN0ZW0gPw0KSWYgc28sIEkgY2FuIGhlbHAgdG8gZG8g
c29tZSB0ZXN0aW5nIHJlYmFzZSAgbXkgcHJpdmFjeSBkcml2ZXIgd2hpY2ggbmVlZHMgdGhlIGF1
ZGlvIGxlZCBjb250cm9sLg0KDQpQZXJyeQ0K
