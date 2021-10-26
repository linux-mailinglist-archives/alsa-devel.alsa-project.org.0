Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E943B2B5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 14:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A7E16F6;
	Tue, 26 Oct 2021 14:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A7E16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635252755;
	bh=YfOFbLIOuy8XhHX50ur7DiIeHe+jUQA9lO6g5REZcH8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0Ok7HvAFB+aZVYDDHmgvy1btXdrDCywaSN8TGUrYQ/cnrThC795z+ooGM03y4Z/m
	 KbSLLLKzS0cRqe3gs9ZXRXn2j1ySpiEFrXHYAF68lC34ASaAW0cPYuXm224SdyAy9T
	 riecZn+Om1EOBWHXBN3yumyXnemBrI+sD9w9Y4Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C8AF8014D;
	Tue, 26 Oct 2021 14:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E586F802C8; Tue, 26 Oct 2021 14:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410107.outbound.protection.outlook.com [40.107.141.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF78AF8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 14:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF78AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=connect.ust.hk header.i=@connect.ust.hk
 header.b="UiYHylV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVKTDRrQvLHIshnSofYi0cFaisajBjdNGREtpaHjI04jGoobqUA9KvZDrfHHdqfBT3Ck5wCp11Mfi3bhzbtGVe2tYQ5Xh6K0TfSpBBx5ARESPvQ3EWJXfgyXOkr1aGPhdETyxTIXbrvgZCGD2YhzUsiPy2sC/PxlYlsxJGivii/HEH3RhSltmLLBMwaXQHHNGOsvjNXkRsgYV2yR9+a72Uh2VIOmyTemow0UzOuzz7UE8xO2wIky61ZY+ehe8QB7u81JGWaPPtRxRsE/hQjqHqL0ge0eZ8+4sMOn51OYXgzobVqJWMwfdpvtDDQlPKCUZYHPGIklujIMSA1q06/Lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfOFbLIOuy8XhHX50ur7DiIeHe+jUQA9lO6g5REZcH8=;
 b=ljdAlIf6/96l5IIbz4+kuoh7dMOuR6q93c40uuAjkjpWsQmjSbYMcXaS14sShe5OV+LNBgFvGQNRc0rPI90QPM3wZSZOG1TkfRWf5JtaQjPGKVFmseS8U+RtaBIHn6VXoBvu4CXE6o6nTgQCxT3VdIKDTtKt3OV9L7KQQmAtCkN/OKu6tdwk+lR6ajZJUaLqJXxIklhoWE8WabUzDVrgI995QJS5h4q6rAKCkWsw953Qtjkz3vTS23Nbsi5fEhv2c++84YMy6805S5RK5shbje0l5XBWWOQRHTmPjdO8nymqa+0fHGc7V2SWDfqxc5I81AXZpEQL3+i/4abHRzaBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfOFbLIOuy8XhHX50ur7DiIeHe+jUQA9lO6g5REZcH8=;
 b=UiYHylV9l57JsMY/neYSncx1p0bQEUBPszkzOCwt58EHYavQ2kDyu3VXpgaXOtQ68rCDsOYwFgMoPWy4Hmjccoj90ImeDTe5kZeExawY80hpR+1OF+800QPJD+Irq3EmfAjMI0K/M3JKKW589PyGYiSixHOBjvZKEtiY6ADhNDM=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYCP286MB0928.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15; Tue, 26 Oct 2021 12:51:00 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04%7]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 12:51:00 +0000
From: YE Chengfeng <cyeaa@connect.ust.hk>
To: Takashi Iwai <tiwai@suse.de>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gc291bmQvdXNiOiBmaXggbnVsbCBw?=
 =?utf-8?Q?ointer_dereference_on_pointer_cs=5Fdesc?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHNvdW5kL3VzYjogZml4IG51bGwgcG9pbnRlciBk?=
 =?utf-8?Q?ereference_on_pointer_cs=5Fdesc?=
Thread-Index: AQHXyMjGZ4harhO8gEmKo3wBUTRXUaviAAbhgALO3ICAAG+oIA==
Date: Tue, 26 Oct 2021 12:51:00 +0000
Message-ID: <TYCP286MB1188FAE2E2B98600F96A99BF8A849@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: <20211024111736.11342-1-cyeaa@connect.ust.hk>
 <TYCP286MB1188D80DA04A5EE1B96814B28A829@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
 <s5hk0i0xqms.wl-tiwai@suse.de>
In-Reply-To: <s5hk0i0xqms.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d2a1d5b-d44a-4d28-f482-08d9987f4310
x-ms-traffictypediagnostic: TYCP286MB0928:
x-microsoft-antispam-prvs: <TYCP286MB09280CDD8571B19C848F60D48A849@TYCP286MB0928.JPNP286.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wAI2kdQxhMNfNrg/FwBhhdAlvoRuteJPy64TU422dNVsxJj4i77GH+yQBfNY1gKlgRwdS5W5uZsircdonQLtOxn2W5FZAJpbyVF11TvYWhyZX5pln4J6rqyS4A0J5hY4k1BdEHqpH/u77Z/HVea3gXvlmUOEYPp0fGb8oZ6bbitBeOOHfDNbA9GXuc1ZE3T0urFMgu8XmsM9p//7382pfR996Udq01C9CTVVVVfQrLc5dVpo6xLNoIH/DvHUGI/Go2cmmmOIA7zs/W2nNdcyyVpsERcRkLlTRR3vkSO4cn8ZDjasAZL9LvYawho5Ij2u2DC97JAVWoBBboSTGOB1Tstxl7vVOaNjsrWA8LuDFHrIMdPboVepdBGRniah7FvoVZzMBM7KJWaVB+eupi3f+44X9xj79IlMa05AvrEjEsb3FpJN/PTSEtS6oalgjb9OBgd3eexBA6EO+qfAC8CZANx2UCfY/pgNCSN0HKpoCavNNcRiw2/Q4JiZtYWZsEME8imeXghdqXQBNsO8vrLxtb0Yxih39Rm8BXguYGQgGoY2PNleMcjRJa7w6OBpjpbK4YLL0YYpgAPyvR40Okx6fU79xP4kLxenAtXy0wF5aPWexWMA0kD0Ft2ruD/NeViFxxO+oz3fcUgUx15fm6zBibWNr5K19Zmxq0sbKGoN3u+/r9UOR5cKVtosHWL4Oz9Xrd7YjQGF/LoQxGIKqTXoqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(9686003)(7696005)(64756008)(38100700002)(66446008)(54906003)(52536014)(76116006)(38070700005)(33656002)(508600001)(122000001)(5660300002)(2906002)(66556008)(71200400001)(83380400001)(186003)(6506007)(8936002)(26005)(86362001)(4326008)(6916009)(66476007)(316002)(786003)(224303003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFN0M2p1cm1scTRQTHVLbnpwYXhFaGF0MWttYUU1N04wbzYycTFoTk5tbjZi?=
 =?utf-8?B?Z1BWRTl4djUrNG1TOENVN2VDWE8zYlBFNi8ybk9iU3BYOHp3bU0xT0svbHJp?=
 =?utf-8?B?d3ArbFFCYW1sazlMOW56MlNheEZKUThuV3hLYnhJVnh5dll4Sk8wUDZ6Rmgv?=
 =?utf-8?B?VFo1V2VCY2JDR29IVy9waE1nWGp4Y2VsNjEyUW55bG14RlUyUVlHbWhGRG1a?=
 =?utf-8?B?OU5vVHJmcFFSQkI0a0tteFB0djI3bS8zN096TDNkcm5uN0x4TDFvNStYRXYr?=
 =?utf-8?B?V1FXeTRNVmd2T3FtVlFsUUpwRzFQTWJ5aVpXeUJmYVhIcVlCdTVaQ2ZoK3dR?=
 =?utf-8?B?QUVtdGdrN0JrMVRwMFNENVNSUE1tOWJmN1h3SUs5MTlRaVRlRStIMy9odk5D?=
 =?utf-8?B?dEtlNEk2NE12V0llcHMwQ2FBQzRoTVhLTFg5VFFDVWpUT2FPM0lzd081bXhI?=
 =?utf-8?B?eEdUS0UvQmJtaERzQkVPVUNFRGdCY0xMWnBoM3p5NHZnOHY4YXZkVFJIV282?=
 =?utf-8?B?VWRRNXNyR2M0VE1IMFNCYzJiVFFxMWdXSVVWQlpQY0FHVVBmYzJNaXFoMWVv?=
 =?utf-8?B?dU9wVGRNbWIwTVpxL0RXbUlnT2V1N2RGVWRma1I3Rk1zNldycHNsU1pZck9W?=
 =?utf-8?B?YkJwNXNnTHBFWE9oUEFicDVZak4xdUVOT3VtRHc4WXZPd1hEOThiZDhlalo3?=
 =?utf-8?B?RkZQVU5ZNGdQeXk3WldRRFppK0VnMm9XSEJreGZHNWZQR0h1WHBESm1Ra2ww?=
 =?utf-8?B?WjhmT3NETE1TY2lsMUI1T3d4bGdaQmVtYmxKQ0krTEZmb0x6dHY1N2U1c0Zj?=
 =?utf-8?B?eEJnMVBXM3UzUUJXMFFIVGZxWGhjcUdYQUUvb3pXaGttY0NBY0pCZGhKZWU5?=
 =?utf-8?B?K0JTSWZKbGtIbjV4bFIyVWZyZC9qSGdOaGtUKzZZallnN3dxYldiTWtXd20v?=
 =?utf-8?B?Q0YwWlJQRy9lZUFQN2dZbXMwSkJ5UHJLQjNLUmJWSkJwQVZTbzZHNkt0LzRl?=
 =?utf-8?B?Q3FDQ3p2aWhuUmRpckl6SjV0K3huSUZIaEx6ckVWNGlPZVBRSldoTmlzci8z?=
 =?utf-8?B?STJ6eGZrQWZjMEtoUHhEc0RBUzlqSE4ybTRxeElsOGRXZkZrMTdyZVVVbHJY?=
 =?utf-8?B?NjJ2a0swSmdhMHpGVk5sZTJLNXh1ZU42Ykw1YlhZRnlaem9vMklqdHYrWWIr?=
 =?utf-8?B?UGpSZ1VKYU1WemZkOHgyUHNIZkZVNEtKQ29SL0FuaUtpOGgxMFhoblhxNUhr?=
 =?utf-8?B?eEh6ajk0VmYvQnZXbThrWU1Yd1dIMkd3UEhyVXdOcjZ4aUd5QmozMVFNSVhu?=
 =?utf-8?B?WlNndGt5VGJ1dDdHOStUS0FocXR2bmNKZXZUVWFSQ0QyQ3gvTGpFaTZaRzhv?=
 =?utf-8?B?djd2NEJCbjJpZHVOWjkxR2pnREFrcmJONGgxRmJPODRGRkZ4d3Rsc1hBVVhl?=
 =?utf-8?B?eUJHY1dnK2JUWi90UG9aM1NhdXhudktQWGVqdzRad2VDdWpqd0tLdkpUbEho?=
 =?utf-8?B?ejNLb1ZSdm9kRW56S0JxOXBqVDFaS1BWN1M4T1d3TU1mdXFLMm5kNzFlaVd1?=
 =?utf-8?B?UzNnanVkanU1ZnFDeWtyeXVNYW81K0JFNWpQeDIrREFRU3VMM3FNelMyVmxt?=
 =?utf-8?B?TS96N3Q5dHBGRVNDZnhBeTFIdm05OENhRnJTQzdoaFhiWkEwTDYwMjJvNmUy?=
 =?utf-8?B?RTUrTXVOcDR1SVFmOHZUVmx5b0F5TVpyRkhSU28yUUorRTdCWTNmcTEvVFJt?=
 =?utf-8?B?RkNVQitjYS8zUmlWakZoRG5QbmI1MTJEZGNveDJHNDVxajlTRkp1M0tHQVJI?=
 =?utf-8?B?Y041c3d0UVlUckViZWZpMmJjeEVIeGR2aEdYbDk3RVhsUE1yWEhMNE0xN0RT?=
 =?utf-8?B?ZWdPK0VzQ0l4L0FTYk5VK2Rldm1LaGxpVU9NaXVZdUxhYTl6VHAxaExncVJr?=
 =?utf-8?B?NDU0bkI0bDFKdnZiekdrdHdNMzBLVWdHaFYrMksyaVdYVk9yVklJWUo3Ym9x?=
 =?utf-8?B?ZHJGT3NRd2RXcWxZNkdLN04rZHJWU3VncUxVdG1IT3djNjVUaGxLQ0VLMTlk?=
 =?utf-8?B?b1ljdFBQMnA5UmNUSEZFZDAwVVRzUksyanl5eEdCTGFHeG10dzBaSTdRUGpM?=
 =?utf-8?B?cmp1NnVyaVpQL0praW5ZRUwwb21OT3BrbTBPbzRpcnBjemFWdEdCNFNaMEZC?=
 =?utf-8?Q?O8Yd4gt2RrbMf+ki7fa4mrU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2a1d5b-d44a-4d28-f482-08d9987f4310
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 12:51:00.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gO+DfEW3xDP/fOc6B4STJAvTNXz3cTYIWD56nXakr3zENLc5sCWXm42gRl8c5ESndCvQDOSPiJP+P3+8nHs6sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0928
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "damien@zamaudio.com" <damien@zamaudio.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "chihhao.chen@mediatek.com" <chihhao.chen@mediatek.com>
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

R290IGl0LiANCg0KVGhhbmtzIHNvIG11Y2guDQotQ2hlbmdmZW5nDQoNCi0tLS0t6YKu5Lu25Y6f
5Lu2LS0tLS0NCuWPkeS7tuS6ujogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiANCuWPkemA
geaXtumXtDogMjAyMeW5tDEw5pyIMjbml6UgMTQ6MTENCuaUtuS7tuS6ujogWUUgQ2hlbmdmZW5n
IDxjeWVhYUBjb25uZWN0LnVzdC5oaz4NCuaKhOmAgTogcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1
c2UuY29tOyBjaGloaGFvLmNoZW5AbWVkaWF0ZWsuY29tOyBkYW1pZW5AemFtYXVkaW8uY29tOyBh
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
CuS4u+mimDogUmU6IOWbnuWkjTogW1BBVENIXSBzb3VuZC91c2I6IGZpeCBudWxsIHBvaW50ZXIg
ZGVyZWZlcmVuY2Ugb24gcG9pbnRlciBjc19kZXNjDQoNCk9uIFN1biwgMjQgT2N0IDIwMjEgMTM6
MjA6NDggKzAyMDAsDQpZRSBDaGVuZ2Zlbmcgd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IEkgZm91
bmQgYW5vdGhlciBwb3RlbnRpYWwgbnVsbC1wdHItZGVyZWZlcmVuY2UgcHJvYmxlbSBpbiB0aGlz
IGZpbGUsIA0KPiBhbmQgbm90IHN1cmUgd2hldGhlciBpdCBpcyB0cnVlLiAgSSBzZW5kIHRoaXMg
cGF0Y2ggdG8geW91IGp1c3QgZm9yIA0KPiByZWZlcmVuY2UsIHRoaW5rcyBhIGxvdCBpZiB5b3Ug
Y291bGQgc3BhcmUgc29tZSB0aW1lIHRvIGxvb2sgYXQgaXQuDQoNClRoZSBGaXhlcyB0YWcgZG9l
c24ndCBsb29rIGNvcnJlY3QgKHRoZSBjb2RlIGJlZm9yZSB0aGUgcmVmYWN0b3JpbmcgYWxzbyBk
aWRuJ3QgaGF2ZSBOVUxMIGNoZWNrcyksIHNvIGFwcGxpZWQgd2l0aG91dCBpdCBub3cuDQoNCg0K
dGhhbmtzLA0KDQpUYWthc2hpDQoNCj4gDQo+IFRoYW5rcyBzbyBtdWNoLA0KPiBDaGVuZ2ZlbmcN
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiAtLS0tLS0tLQ0KPiDlj5Hku7bkuro6IFlFIENoZW5nZmVuZyA8
Y3llYWFAY29ubmVjdC51c3QuaGs+DQo+IOWPkemAgeaXtumXtDogMjAyMeW5tDEw5pyIMjTml6Ug
MTk6MTcNCj4g5pS25Lu25Lq6OiBwZXJleEBwZXJleC5jeiA8cGVyZXhAcGVyZXguY3o+OyB0aXdh
aUBzdXNlLmNvbSA8dGl3YWlAc3VzZS5jb20+OyANCj4gY2hpaGhhby5jaGVuQG1lZGlhdGVrLmNv
bSA8Y2hpaGhhby5jaGVuQG1lZGlhdGVrLmNvbT47IA0KPiBkYW1pZW5AemFtYXVkaW8uY29tIDxk
YW1pZW5AemFtYXVkaW8uY29tPg0KPiDmioTpgIE6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZyA8YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnPjsgDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBZRSANCj4gQ2hlbmdmZW5n
IDxjeWVhYUBjb25uZWN0LnVzdC5oaz4NCj4g5Li76aKYOiBbUEFUQ0hdIHNvdW5kL3VzYjogZml4
IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBvbiBwb2ludGVyIGNzX2Rlc2MNCj4gIA0KPiBUaGUg
cG9pbnRlciBjc19kZXNjIHJldHVybiBmcm9tIHNuZF91c2JfZmluZF9jbG9ja19zb3VyY2UgY291
bGQgYmUgDQo+IG51bGwsIHNvIHRoZXJlIGlzIGEgcG90ZW50aWFsIG51bGwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBpc3N1ZS4NCj4gRml4IHRoaXMgYnkgYWRkaW5nIGEgbnVsbCBjaGVjayBiZWZvcmUg
ZGVyZWZlcmVuY2UuDQo+IA0KPiBGaXhlczogOWVjNzMwMDUgKCJBTFNBOiB1c2ItYXVkaW86IFJl
ZmFjdG9yaW5nIFVBQzIvMyBjbG9jayBzZXR1cCANCj4gY29kZSIpDQo+IFNpZ25lZC1vZmYtYnk6
IENoZW5nZmVuZyBZZSA8Y3llYWFAY29ubmVjdC51c3QuaGs+DQo+IC0tLQ0KPiAgc291bmQvdXNi
L2Nsb2NrLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9zb3VuZC91c2IvY2xvY2suYyBiL3NvdW5kL3VzYi9jbG9jay5jIGlu
ZGV4IA0KPiA4MWQ1Y2UwN2Q1NDguLjk4MzQ1YTY5NWRjYyAxMDA2NDQNCj4gLS0tIGEvc291bmQv
dXNiL2Nsb2NrLmMNCj4gKysrIGIvc291bmQvdXNiL2Nsb2NrLmMNCj4gQEAgLTQ5Niw2ICs0OTYs
MTAgQEAgaW50IHNuZF91c2Jfc2V0X3NhbXBsZV9yYXRlX3YydjMoc3RydWN0IA0KPiBzbmRfdXNi
X2F1ZGlvICpjaGlwLA0KPiAgICAgICAgICB1bmlvbiB1YWMyM19jbG9ja19zb3VyY2VfZGVzYyAq
Y3NfZGVzYzsNCj4gIA0KPiAgICAgICAgICBjc19kZXNjID0gc25kX3VzYl9maW5kX2Nsb2NrX3Nv
dXJjZShjaGlwLCBjbG9jaywgDQo+IGZtdC0+cHJvdG9jb2wpOw0KPiArDQo+ICsgICAgICAgaWYg
KCFjc19kZXNjKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICsNCj4gICAgICAgICAg
aWYgKGZtdC0+cHJvdG9jb2wgPT0gVUFDX1ZFUlNJT05fMykNCj4gICAgICAgICAgICAgICAgICBi
bUNvbnRyb2xzID0gbGUzMl90b19jcHUoY3NfZGVzYy0+djMuYm1Db250cm9scyk7DQo+ICAgICAg
ICAgIGVsc2UNCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiANCg==
