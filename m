Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE4459937
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07D515E5;
	Tue, 23 Nov 2021 01:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07D515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637627973;
	bh=mO6Igq3b1XVv4tsOZg6i15C0vwc77ms5F6QRMBUyX3w=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQ2hMkGDKBphHHyFh6VmD6xXp4IuqJq0eQbc34ezYX7N7rq0tj0dnZ69OWlfmM+Ef
	 2qnwc/lIKwY5K1AtSxVEmTrHS8xsPlklPjHDaC4Q0pQ1Bcci9ESm/7OBCPI7c8ugxc
	 3ANjHFZs2+MejsoU1zmNnrE7XZ6VUXDlVfhBzvE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C61F80154;
	Tue, 23 Nov 2021 01:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9950F80212; Tue, 23 Nov 2021 01:38:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2020.outbound.protection.outlook.com [40.92.42.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73A7F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 01:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73A7F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="cgpiCGaw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMjMlQzjZkuzU7qD0WikmWQGsHb0nBzu7SsU6z6Aa0vFvwwrCTVjbsukZPi+irPXpXLQVb1GsCvtW32sKJ+MMx0W+2gd9NrhyekWvBmah84l/A5aefJKiqJO0o6ARYkKlxet/6pMN/TWKQQxeQJJUlFszgeHVVWrsFrMBi2/s6ic/rcEDLAt53xSqAugO6aUuRm5+hi1vt56wgw29vSxzVJOaueb6gnnqerrIAPEwXGYBtOzxHtKJJIGRzPJgXbjUzUXjLCh26Sc7eSRdtAHDx5AGLKd+pnr5ekY7vLgRb7M9hDgxeVPUFHUo5wHRzbvGuzyKdhpU4M0IUm62M3tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO6Igq3b1XVv4tsOZg6i15C0vwc77ms5F6QRMBUyX3w=;
 b=mPAmKokLhwxFHnnV1cx86fKwTGMW4lu7lISb4UNi/nfh6Ca6ATcG2h1cKJnYnFLSNBje3hoR7u/x07CEgC1potmBCoFLuOUZFj9RDEDBMbYE1tQjGzMycvjE/tl44hhxg6/jl7PkLcy6SzTCs0J03qEDGclv6tQxqlQ37p8Xn7zqnhtjtVO+QkCGWQc0AQn3T3UsPPqGmRikKmhtpNUNxEUDu3rXHoJJXYjSJUQPZjyVTYunbFN8KxtwO13msdUR/ypnK7C37qqt06CipbQcwbmj3RDMNw6MXFUeiLCnBvOv8il+xWalWB4oQZuJDWQffpJYm3OJVrl1XP7w4pm3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO6Igq3b1XVv4tsOZg6i15C0vwc77ms5F6QRMBUyX3w=;
 b=cgpiCGawU39Zram6YCGIqiQBJ2haJdr+Nl4vnSgvKlRJNoB/fZQbsXfMVhOYNuerhvgcrqzVYjLbpOaarCkaz6EYX7zVZ3pXL4+Jbzonh+Pwxsjej/B29a9SXzyjhet/NcfIyzVPg66ZklE1Sqs3ZmMZay5oY9xB6XbRgMJfDsdvAyABDQJVD38nv/dELfMrC+C59Qyvmlo2FLziAOvy6+Y2QglROD3N69AfDmjyQNK310g+PRXoyTW3koUlTdmOu2YUCUJpW1niZoWwIXhGdmUNCjRTzn8oGtN31nZdD7TJx+m11mbpjD/8QC0ejWppss2pPeoxuqmF5bnCwQNTyA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA0PR06MB6924.namprd06.prod.outlook.com (2603:10b6:806:bc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 00:38:00 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c049:32fc:5638:f0f8]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c049:32fc:5638:f0f8%7]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 00:38:00 +0000
From: Christopher Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rk817: Add module alias for rk817-codec
Thread-Topic: [PATCH] ASoC: rk817: Add module alias for rk817-codec
Thread-Index: AQHX3ulKAFEi6BAvM0C4EiRy2L3q06wQPEWAgAAJsoA=
Date: Tue, 23 Nov 2021 00:38:00 +0000
Message-ID: <SN6PR06MB53420308B0D8742B2CFC15DCA5609@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <163762559549.2471670.593188809347574663.b4-ty@kernel.org>
In-Reply-To: <163762559549.2471670.593188809347574663.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [hIWh4I4sI86dZzWKlaC87+OCw002zniAPcpTYdFCRwdGMmW0D6LWDt66Vvu2q++PYLXLhkNsYhg=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e4a456f-cfe7-4d7b-eeb9-08d9ae1980cf
x-ms-traffictypediagnostic: SA0PR06MB6924:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 67nmHEQZlkNPl2Y0tV+sSEe1hy1duIcbV7/nMYepRnYnOmXFCZ0GHlwBrmdzS7c26RCauGX/d91ZV5tv/chm1REZOSLZTF4JVuFlYJWmSnfriYrlM/PFDnKTzZUGopq7pZWTjbbgA7PRUxXh1uysrCz7shxMWaeOClZk7ZPUcsGg3hii7MP24nUz1Cuc85kZkMKvxWn0Ys7emO0n9Z6Gn5qh4WGWMS+jLiB03Xdxuyh4M9G2z0vI/aZ+0S++KzQSU8IZLuqEjU8jCxHN4qypGoOZU5FCjDSnd1qGtu7bJ04zFpfPA3VuVkERSfi0v6b7xlVNo8NcHIFN4hsKSeXVB9fYOYCigULkvmAgYkID2SFa6CkwrDZHsJ5hKUv+zj6citx+fUQ2j+TZUVN6MUrdZgvEs8MvcZIuazcGpysZTJz0wioRW6mCOsU+rxycWDnddmuntBphAfAT77RUUCwV/pfaecG1BkeGm7fUQgZrBTJICHLo5eJIPVGt2lC3U3uLpJJEXvcbdb/wEicmbSxmMcCVdEZJIIpWolc5aauce1Dm9jtxjalpDFQ4c1DxXhL1Lj4z5NVj6aMiFCPWTCZes6CiVg2MbsjCOqu872KINykkB0Wfj4JvzrZdB2VCO1ga
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: LMzJEXxHYRpFaV3AUTI9An1F6CxZ16bUD7ajMEMcyB21SqDRllRaLlixyID6xcfCW/H+6yK25CuJefR22c/UGS0yXIwDjbt1FZoiNGndsNwAEEE+LF9XvVQL8Qsf6KP3T/iYLeluQdAQJjLBFFr/uC5qCD8N1ymYjV1Vyx6NRKcYFqJdjLa+BMXF6IXvgB/OAJfKcLbp+zuW/CCXx95zoSWtd4Mt9PVxww26Jk8UUx0BErqLcn3rD96nP+lYXACBlnddjNNANJMQdneYM/ntozauikrIfr0aihEjbG2iFvBiIGUoksnLutFfB53DVoq4RBqQ/A5ysSTf8kySOih/4PRqEVfXEzKuZprWc5NITyj2VQwaX2BXwIhGJVV+9dsdELVvedjG35NVl18NqZSfRayKoQqryKD2TAG7WYa8UkAuBQWYInX7NaKH5DVuU+GRZWks8NopCUNR107W0lLyGh9aU5tsbhzxsGSmBMq+dD0tiKLFpWUfmnzuSgvgBMany66HvH8y7a0Opwp0Gm9gotMRIV10h5IwslknbafMBoei0jNBYycOEAttbiVfDzfWTc8hwY948WI1UyYipNJPtIfTmLm0wdx7a/D9kl8u2au/e6Vv7PtZK0CvFzP96zlnUR1rZKuWbvL+vL/B9GLWG/OzchCkn8hXxUUzSA9K7oH1YDX6XluubVOrb6v9zyO1wtfkeALgmyjX5n827IvhL/Xijg0sxGDzwWgXoUTZJbr0/9SKirXcDw0xNgFJoE8ScvI8agXEY5ymobxEAHgqdA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <09AE83264F2EE246AAA030715FF8ABE8@sct-15-20-3174-20-msonline-outlook-94543.templateTenant>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-94543.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4a456f-cfe7-4d7b-eeb9-08d9ae1980cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 00:38:00.7032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR06MB6924
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>
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

SeKAmW0gc3VyZSBpdOKAmXMgb2theSwgYnV0IEkgYW0gb3V0IG9mIHRvd24gYW5kIHdpbGwgdGVz
dCB0aGlzIG9uZSBuZXh0IFN1bmRheSB3aGVuIEkgZ2V0IGJhY2suIFRoYW5rIHlvdSENCg0KPiBP
biBOb3YgMjIsIDIwMjEsIGF0IDU6NTkgUE0sIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4gd3JvdGU6DQo+IA0KPiDvu79PbiBTdW4sIDIxIE5vdiAyMDIxIDE2OjA1OjIwICswMTAwLCBO
aWNvbGFzIEZyYXR0YXJvbGkgd3JvdGU6DQo+PiBXaXRob3V0IGEgbW9kdWxlIGFsaWFzLCBhdXRv
bG9hZGluZyB0aGUgZHJpdmVyIGRvZXMgbm90IG9jY3Vycg0KPj4gd2hlbiBpdCBpcyBidWlsdCBh
cyBhIG1vZHVsZS4NCj4+IA0KPj4gQnkgYWRkaW5nIGEgbW9kdWxlIGFsaWFzLCB0aGUgZHJpdmVy
IG5vdyBwcm9iZXMgZmluZSBhdXRvbWF0aWNhbGx5DQo+PiBhbmQgdGhlcmVmb3JlIGFuYWxvZyBh
dWRpbyBvdXRwdXQgd29ya3MgYXMgaXQgc2hvdWxkLg0KPj4gDQo+PiANCj4+IFsuLi5dDQo+IA0K
PiBBcHBsaWVkIHRvDQo+IA0KPiAgIGh0dHBzOi8vbmEwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZzY20l
MkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRmJyb29uaWUlMkZzb3VuZC5naXQmYW1wO2RhdGE9MDQl
N0MwMSU3QyU3QzEwZmM1NmRlYTY5ODQ4ZmYyMDZiMDhkOWFlMTQyZmViJTdDODRkZjllN2ZlOWY2
NDBhZmI0MzVhYWFhYWFhYWFhYWElN0MxJTdDMCU3QzYzNzczMjIyMzk4OTE0MzUwMCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1oOUZmMWdJJTJCODl6
aUpIJTJCJTJCTkFkUmZScVhOZlZ6TTFSS1N0RDdVTjN4SzdZJTNEJmFtcDtyZXNlcnZlZD0wIGZv
ci1saW51cw0KPiANCj4gVGhhbmtzIQ0KPiANCj4gWzEvMV0gQVNvQzogcms4MTc6IEFkZCBtb2R1
bGUgYWxpYXMgZm9yIHJrODE3LWNvZGVjDQo+ICAgICAgY29tbWl0OiA0MjhlZTMwYTA1Y2QxMzYy
YzhhYTg2YTRjOTA5YjBkMWM2YmM0OGE0DQo+IA0KPiBBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5z
IHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQNCj4gdHJlZSAo
dXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMg
ZHVyaW5nDQo+IHRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVn
IGZpeCksIGhvd2V2ZXIgaWYNCj4gcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0
Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuDQo+IA0KPiBZb3UgbWF5IGdldCBmdXJ0aGVy
IGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nDQo+IGFu
ZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5n
IHByb2JsZW1zIGFuZA0KPiBzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNz
dWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4NCj4gDQo+IElmIGFueSB1cGRhdGVzIGFy
ZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkNCj4g
c2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0
LCBleGlzdGluZw0KPiBwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLg0KPiANCj4gUGxlYXNl
IGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiBy
ZXBseWluZw0KPiB0byB0aGlzIG1haWwuDQo+IA0KPiBUaGFua3MsDQo+IE1hcmsNCg==
