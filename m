Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08DE6803D3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 03:28:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E52851;
	Mon, 30 Jan 2023 03:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E52851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675045696;
	bh=j86ET29bJyfNL75nEVKxYZkorarNfzvhK6pY5o4vnzY=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ISdPATfUTlph/JQjaUqbydLGqrKASUHdYr0iUM6kmOZPOonRW//9tHkDlp+3aF7Lj
	 Xg/No1rBmylRyBX9XAz5PGb0oeW2tRmgYIhYycSZ/NcgwJZuFg6pZJKhqnKcWJO8tR
	 bdNzcuKxVsV/6CgmBYZikqZKn4PpwW3e9L+l2XMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF7FF80155;
	Mon, 30 Jan 2023 03:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E7EF804B2; Mon, 30 Jan 2023 03:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2082.outbound.protection.outlook.com [40.107.255.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B800F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 03:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B800F80155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz+N1J11QnmcuIrG82zuioKIR7STIc5fba4WCg0zDmyO/w2FQF2qi/ccP0zFDCe7grQL1HZ8EXCfW0mSx90B9kpIpSM5UZXl2BftqcfqmKCjfkfuFPYfTJ5mHulRNY6AuiPNjISjw0TEVtvAgD1SV9hMWDrHS4+M+unN3oN79VKV7k+0llhRwYBVoY26n5/Ysisgzrus0tx++CtT3v7XgLpVrZFimMo4SDEcupGzljOxg9tfiVndj8juwtyE8QT7x7gzbWK+aHFHNweS9fg62/XpQAhHqSta3rso7vlr641ux9M3YzwUwxRWUCx7Q0EKAlsGyMJnP55vvoXOqrTDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j86ET29bJyfNL75nEVKxYZkorarNfzvhK6pY5o4vnzY=;
 b=DkEsy/WTR1M4xeNaxtj3+UvALJtBR1qaQyefcMJsxpZ636YO978keCR3mzNEtaS6CxLXjoTJjKe++RymtokNYB+XAW4ivVbTe0E2kgeLoSQRXzl2cAzkuE643xJ3ADIiTaw0cDA6lEyu2cF6tnpsKahgVNySb21wmClyuKQoNZj/LUiCNW9YQ/hnw0vF00wxsjdCynRr4z9Lf5jNa78AB7IwpDJS2+KbhNjNUDZ7KUvRVCCEDRUR3MHcpYzVBtTXqp32zeLy+Fae4GvpuisoAkW+PDrTxMlldh68QejO7ruNyzazf1YTWntN1mRoy5920kJ1ztGmzQHgTJ09sMBUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0851.KORP216.PROD.OUTLOOK.COM (2603:1096:300:1f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 02:26:57 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 02:26:57 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: FW: [PATCH v4 1/2] The Iron Device SMA1303 is a boosted Class-D audio
 amplifier.
Thread-Topic: [PATCH v4 1/2] The Iron Device SMA1303 is a boosted Class-D
 audio amplifier.
Thread-Index: AQHZMSo/PO5tQ0ZIdUCRkwl04mxSSq60Ft6AgAImVNA=
Date: Mon, 30 Jan 2023 02:26:57 +0000
Message-ID: <SLXP216MB0077C55D61BA6F29EE2751838CD39@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230126020156.3252-3-kiseok.jo@irondevice.com>
 <167492633558.2479102.3539691390712703265.b4-ty@kernel.org>
In-Reply-To: <167492633558.2479102.3539691390712703265.b4-ty@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PS2P216MB0851:EE_
x-ms-office365-filtering-correlation-id: c349a306-19ef-4de3-7c22-08db026975b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NnPwqvEN8wwXv7ppm4p+7WYiwLBPe+LdiHAB5APQdybj1f9iGLlbxS6WNgaIatLSFQ1JP7umbEG32FeKQPhx8UsEA6bFdPLZyxd2B0NnaPWVKWMsHz4/IG8aLSXuTOtFXxgqDPQRmmof21g01qulIALbHrPQS6HV4bCmvhd4CvLTGUWSyy92Mz29cX3E3eZDWLEpp+eWYoAiMW0pPnT/w0rS0sqZFIA2gOu0TBORBvc9fM+DHkJxcqluzeeQmTdqelnCDl1xFfjeMOZeXCBV8i3Ng05eP7boFlAwEWwRTkUxkvNQOrREAF7XPvIKLoqOw2enAmfsI6O2COiWKnEeMykbGc91FV3Tf59aXlKAfya56b4daDPkocIUupgvchEn8iQoFshEQF20keO/GOoZJPVsjkPgS+BnqshJzAFr+GI3622E1K7WiDRv/RJuafBg5iE5V+Qog9frC/so0U5Ms7Kc7SNZHW5K25aEmmhJbJJN+o8E7TfbSm+4hlKWEvcRNh26HYwSmsaiKIRqRBdMmIPnUrem/CAluz3kmF+ULGEBU4d0laKgEI9otUCXR+G+uX+M+U+ikla6BOJwSCYtPB1BQSIHLPFatCoj9EWiMeEafMBqTizH2KdefN8ojfvzRJ3eikmgCVQqDfZ/wXozBFYde/vJCfoBx2JXmQQXy/q66qTI3umOcxOEiZA6EWUe7GvJc3eqCoqyi86VMWfipg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39830400003)(366004)(346002)(376002)(396003)(451199018)(2906002)(52536014)(5660300002)(38070700005)(86362001)(83380400001)(8936002)(41300700001)(71200400001)(478600001)(26005)(9686003)(7696005)(6506007)(186003)(107886003)(55016003)(33656002)(66556008)(66946007)(38100700002)(66476007)(6916009)(66446008)(64756008)(76116006)(4326008)(8676002)(54906003)(122000001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk9DT2tMVVppTjJ5UHdTR0VNbVJ3NGhMUjkzR0JlSVBQblNUQkZOQ0VkREE1?=
 =?utf-8?B?NVg4L2tnTVY1S2FXMVN5UUJrb0NBWVcvMHIyTGZXUDhKRHVLdnBISHhLL0pa?=
 =?utf-8?B?dTczS003OTJ1Z0FSRUNKZmYrcm5wRzdzeFhMNkNwS2dOeTNsS0ZRWkJvYThF?=
 =?utf-8?B?NWJNaFdKUzRxSnk2U0dBTnQ5a2ZMdVFjV0x4UUJjRkJ2SW1QTFpHdlI2UUxT?=
 =?utf-8?B?UjdpVzh0S3FodjkzK05RK2NUQURaeUhsR2JqbDZ3Nm1obmN2YVRXbDR6SVhP?=
 =?utf-8?B?djZuV1BLQ1BIVmRxYzY4TWpnYnE2R0g0YiswRk1lWjlIQ2Z4NnYwL3hrU3Vw?=
 =?utf-8?B?WkxFUEQyb1h0VG5NRU9OZUp6MG4vMTZPMWpJdGRnMnhsZ2JMVk0yQlg3dys2?=
 =?utf-8?B?OTNwaWNnSnNZTjB0UytsSE1EcEVRWDU5Nk5Cc2pJQUIyQlA0WGp2WG5STjFT?=
 =?utf-8?B?Z0pQTjVmdEVacHhqbFhRS0JGeVRCU2lQS0dETnFKM0x1a1VQRnduV21BYUd6?=
 =?utf-8?B?NGJ2TmJTUXZ3T094eW9zbHN0cVpkNEZrNDNHbklXSW54N00xeG40bVp0M1Fy?=
 =?utf-8?B?TU1nNXdHYUdnaWxBNGRSbzdvZkNINVFSTWpMdU5DNUFYVzhuVFJmNEZBSFFU?=
 =?utf-8?B?bk5WOWhtZ2JNZzVDQ0I3bTM3em91eUhxUWhXSkJ0eGl4V3pRZVhSQjRsTGZP?=
 =?utf-8?B?VGR5VnBkSzBFQlV3K2NzTVdLa3NhNFplMk9VZWg0dmF5THRqNExpN2tKUnMw?=
 =?utf-8?B?bzIralpXK1dPUXA1cWtNU055YmU2TTVRNzJsWlQ2aUs1eGJOTkJ1SmhObDFk?=
 =?utf-8?B?SHZnZmNrVXZZZW1YaUlVZ0UwTDI1UldXeVl4WVBLMGVtNENoSFphblJUMEs5?=
 =?utf-8?B?Y0gvRGhvcWt3Q2ZIdTlZMlB5dEZkNStFdSttODBZNHpYVko4SktkRWw1VEhL?=
 =?utf-8?B?KzVrQXVRWlpsVEw2OFZ6cUhOam5aZTBmaFdjeU10c0xrTGdaMnV4K09IMjd3?=
 =?utf-8?B?NnB2d3dSZDcxUHBSU0lrSUZwNlhzc0U3Z2xid3B5ajJZaFIxVXB3OEI0T1NG?=
 =?utf-8?B?NlZyQlpjQ1FYVnBBZUV2WG1Gc0R5TWtxbURpMjA4L05zOEZjd3JQNkhvbTky?=
 =?utf-8?B?Q2N6anBoUlZiMHozQkNxU2d2Uy9YSU9vRGQ0dVlpMW9xMWNsalpxUDV6ckFk?=
 =?utf-8?B?aTRqY25VbzZTTXRnUnVXMzF0WG4rYmdmdkwvQlBiVTROV0M5VXJMTE9NdjhC?=
 =?utf-8?B?R0IrZEExc1ZXM0pVUWdrWXE2U3NxblpXeWFYNzQ4WlFvVzZhUVlZd2tJaG9O?=
 =?utf-8?B?aWlDdExvSFlFUVlLbWN0ZDg1MHdXVGNZcDY5TXZJVlJwSFhpbVRqVEpJR0kw?=
 =?utf-8?B?QVUwbjFNM1lHK3IzTXlGMVROQ0lIMHJFcXJ3d2tqOGFJcE53SWwxNmFwd096?=
 =?utf-8?B?bk84OEp3UUpmaDBxWG9JamNCTU1PYi9VT0p0RjBaV0djdjhUdHZ5SExua3U0?=
 =?utf-8?B?OFJLNlNtaXdIQ3M4WUNzdTA5bUcxOThPbk5uVFo3enpQU2hJdVYyUzZFdU9t?=
 =?utf-8?B?Z3pDMVJ2R01jbXErcHQyT0hOY0M0eHBGSUczZmFuamFhUWxiQ2JBVVhZVExa?=
 =?utf-8?B?bTAvWjZTN2QxSSthSnd4T3laRGo5S2ZhUFExbmFPMUlwRWVyNjFMYlZFK1cy?=
 =?utf-8?B?WWowTUs0MTFCalFVbUxDbWhyME4rbjhrSmMyUStybWNSY2JXYUFWK0dUSXQ3?=
 =?utf-8?B?N3pHZ1JBVGdOR3pCSXAzbjdHbEx0eFkrREhTVi9LMnRYUUFNa25pclNhNlRv?=
 =?utf-8?B?VGx4REIycVIzejJSUlhOV3RSczdvNC8xVHh6TTF6bzRQd28xUjZwTEJwVWFI?=
 =?utf-8?B?Zzh4eDgycFo0NllpQktOdWN5VkR4NU9yRHAyZHhwNFpzbDJ1bDB1MWswaU83?=
 =?utf-8?B?dTRYTjdFR3FseEc3NS9UUlk5QWtLUmdTK2tsVENuWDNyR0tVeXU5QnZwTWNY?=
 =?utf-8?B?QzZUaHdQMlhsdTJ5eXkrWFhMT2R3TUlWWWErN3lnQm1vOFZiL1N2TU52MFM2?=
 =?utf-8?B?V3daclBRcTE0OHBmcGJUVTFlbWxEQVVGWHRGZkI3MDJralk4NElhQ2gxdzg2?=
 =?utf-8?Q?70Svqjm2PVmsSLTE5fJLdO5eI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c349a306-19ef-4de3-7c22-08db026975b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 02:26:57.2459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9MHcZrgrpcRJA3cUL7+4ICRsn5x1bpOvi/sb89haUKdKq0ePk0YAohGgxUoHGS8SuhGs/RoTYWr0kGqKD585Iy7Y0Cm+GbTc9qkHqYAj2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0851
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Gyu-Hwa Park <gyuhwa.park@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiANCj4gDQo+IEFwcGxpZWQgdG8NCj4gDQo+ICAgIGJyb29uaWUvc291bmQuZ2l0IGZvci1uZXh0
DQo+IA0KPiBUaGFua3MhDQo+IA0KPiBbMS8yXSBUaGUgSXJvbiBEZXZpY2UgU01BMTMwMyBpcyBh
IGJvb3N0ZWQgQ2xhc3MtRCBhdWRpbyBhbXBsaWZpZXIuDQo+ICAgICAgIGNvbW1pdDogNjhjZDM5
NGVmZDBmZGNlMjVkMGRlZjhkNmNiMWI4ODk4YjJjMTNkOQ0KPiBbMi8yXSBNb2RpZmllZCB0aGUg
c2NoZW1hIGJpbmRpbmcgYW5kIGFkZGVkIHRoZSB2ZW5kb3IgcHJlZml4ZXMuDQo+ICAgICAgIGNv
bW1pdDogZGNmNmQyZWYwZTgyMzM0NmEzYzFlYWUzZjk2ZTczM2U5MmNhNjU2Yw0KPiANCj4gQWxs
IGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRo
ZSBsaW51eC1uZXh0DQo+IHRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91
cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZyB0aGUNCj4gbmV4dCBtZXJnZSB3aW5kb3cgKG9y
IHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmIHByb2JsZW1zIGFyZQ0KPiBk
aXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLg0KPiAN
Cj4gWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBv
ciBtYW51YWwgdGVzdGluZyBhbmQNCj4gcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdl
IHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQgc2VuZA0KPiBmb2xsb3d1cCBwYXRj
aGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuDQo+
IA0KPiBJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1
cnRoZXIgY2hhbmdlcyB0aGV5DQo+IHNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0
ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcNCj4gcGF0Y2hlcyB3aWxsIG5vdCBiZSBy
ZXBsYWNlZC4NCj4gDQo+IFBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFp
bmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcgdG8NCj4gdGhpcyBtYWlsLg0KPiANCj4gVGhh
bmtzLA0KPiBNYXJrDQoNCkkgY29uZmlybWVkIHRoYXQgaXQgd2FzIHJlZ2lzdGVyZWQgaW4gYnJv
b25pZS9zb3VuZC5naXQuDQpBbmQgbWFpbnRhaW5lcnMgYXJlIGluY2x1ZGluZyBtZSB3aXRoIEND
Lg0KKFNob3VsZCBJIG5lZWQgdG8gZWRpdCB0aGUgTUFJTlRBSU5FUlMgZmlsZSBpbiByb290PykN
Cg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHAuDQpCZXN0IHJlZ2FyZHMsDQpLaXNlb2sgSm8NCg==
