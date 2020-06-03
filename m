Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3711EC9BE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 08:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976FB1666;
	Wed,  3 Jun 2020 08:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976FB1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591167183;
	bh=L+DrCpIEAYTVQCwp296+Y/xwAm4Cp+o2PI6mpzWsPDc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPrgE8Oqyat5OOjbVwyWZXCW7SlwLjU0001YJwyMOPf6JNuH1UaSBm3avLy8Vahlj
	 RpyXTqYsWy92rQWNCAwl2O5aItU06k1Dc8lWiHwdiI+DFJItkAfBvSYXg6YKni+cDb
	 lWu+p4hW5JNjhjrkpGFYlx5GG/mgLyqOuIcgOjzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5819F801F5;
	Wed,  3 Jun 2020 08:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE5B6F800D0; Wed,  3 Jun 2020 08:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9F6CF800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 08:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F6CF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="UO9HgZKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G01EGLia7em3AB/OAFuTwOFoyPS01yz4nPUUwPc1TmisU1FbyzHtPWSM3BiyjRnHGpZcNauTZEjzjt70+jbvlMUo9sz5OCFsVx967mpRBikKL+5AuSHCxZzA+l9v9d3jkYygQ9Blo84ylM0p2zPmWCt+GWGIIFmTUZyIoNWCTsbGdEohYbyBft3AgbJ7nufjsd+JgVEJw8mtNfjWiYTkP4O3v+6sGMNcXYR2X27Tl6j/UzVHjFzwCKxaGFz9bv8bJ+VPVbuJ2FQdZnOx2Y9KFRQjBevLGpROGIkGEI/Txg2M2AUj6qQ7ST1YQypwVxBFQUKAB0/PpQUgYFomptSbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+DrCpIEAYTVQCwp296+Y/xwAm4Cp+o2PI6mpzWsPDc=;
 b=k9n3K+nRZA5EJoElrvysoKXMwxp5kB31ptSekt/2l/hxmkgSuHqeDHMCxWCOdG4vqtovmqXlD433l9Z9ECG1i/IerCYPqQ2D4Pjf9wai+PYnNOk9l2a5c+W2+K7uqEJt8SWAQJFH9kbEAcoM1rhvs1+yjFKzdutRYrlyeylP6vfhahB0V72OGyuS+pmq8ydbp9vRll8x68fnotNPVet35QMmS0sS4YbyxbflSFqze6vANuggm3MjK81fvDxZdQhcGsxNfzUytherzkWaSX2cm7tjdPCu6X1c8KO0NPl0+Ji6VXa1JolP33s6MWh4jw9b8ICBt+h+szEImiCsmwJ/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+DrCpIEAYTVQCwp296+Y/xwAm4Cp+o2PI6mpzWsPDc=;
 b=UO9HgZKBh2Zoo+x7Ggp30FuPus9x8st1UkAUxgyOLnU9PoRzbj2p4HXk9uoN81Vnk+356iOSrRH5rIVj+cwajNFJynSnP3XH9a3NmJ1//pDZEOJNIysGzFVTOJRc2AiRr7xSRWLGjwXaTQvPjJZ8JOvmV8ER4fwNhC6vKuHBIj4=
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1536.namprd11.prod.outlook.com (2603:10b6:301:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 06:51:06 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:51:05 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: RE: [GIT PULL] ASoC updates for v5.8
Thread-Topic: [GIT PULL] ASoC updates for v5.8
Thread-Index: AQHWOFokKpVzl/qJW02GB1YlanAA06jFiOKAgADroWA=
Date: Wed, 3 Jun 2020 06:51:05 +0000
Message-ID: <MWHPR11MB20478DA8CD775A6F5D9B81E992880@MWHPR11MB2047.namprd11.prod.outlook.com>
References: <20200601121323.GB45647@sirena.org.uk>
 <s5hblm2iq1k.wl-tiwai@suse.de>	<s5h8sh6iiyg.wl-tiwai@suse.de>
 <s5hv9k9fmha.wl-tiwai@suse.de>
In-Reply-To: <s5hv9k9fmha.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [211.35.184.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34bf95c8-bb10-44b2-b6ae-08d8078a7d1f
x-ms-traffictypediagnostic: MWHPR11MB1536:
x-microsoft-antispam-prvs: <MWHPR11MB15366EF965381252F630054B92880@MWHPR11MB1536.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jR25bcWXbOT2oOHxf6VbJP4+1In4fabrIq+qqoY1yES0+nXQs6pEgnRWTqeT2g701Ltb7pNMXB7XqljSeahTtdk3Har1SNPXJUqm3ChIFIrmoFymb73CzvA/dufOCoqAFdwCxdTIRJAoSh8g5Mb8BKhNCVzoi+HJ8PUFc0ryv0A/dW9o6YyleCXjTFOpcp5NH/zTVqjSL+Ol1wFeb8Iz8KySPNBkmOp889oG31CGZGEzy0drPabCAu+pjtjylvcrYD8NXKhqUhvoyFkWYEhCdjgENMvyfUJ7fRGNN2cp2AIZtunPL+QmC4iNesUHXp9M257SKIdeGZOCrha3UGJzzd41dSdfGt40blzgnGiBrkq35Cs3WAjWgnRp3fMIyLqc8RgOvVIlia2tE+WTihyoQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(66446008)(66556008)(76116006)(54906003)(66476007)(66946007)(110136005)(71200400001)(52536014)(4326008)(186003)(15650500001)(64756008)(316002)(55016002)(2906002)(7696005)(45080400002)(26005)(53546011)(9686003)(33656002)(6506007)(478600001)(966005)(5660300002)(86362001)(8936002)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PbUrwpIXXvAqqDQvwaaAxIDr+AAKwrjeUmksDgytP9GVAh70Hg8crRYXGeukNa20PkSjex4Viqp978/0qL45uQY0fO+UOovW12xpdn0kP8zrKuL5ENwWs5mKgy6/xWBD81LCxgMfGKAMbSgSMTGvQBrhA8yfyKdvAgTSNSQpP3ctO8JMr3VFe3amiQa+Ucj4IqSov5K5eJMlBbNa5vn7n8L+66cTTLTYTbnuucvUyrBLIey73zF4fRMFhPjoXNk65c+1zsps1aFfJowwgENKDFLv2XcE2Y5DSqlQBh1IXk4h8G3u69JgZxFxIfrDr8YGayZlajENwxIkoLVTG36sJIvs1JwXvvt8pgfFx7/q+Bvwb3g7VcsmAgAsg9gg/SEpLmJyLkT17ja21WlEnusOxAdJ+dfs7g81JCZBbL25JbvNEwitwGGMR6QAit6ToXHT1JSTK88GWdvHoQ7W3mnWacTo9tkhpdyEcEKBg4zeOcg5SQLX7k2OdBaSJ1G+Uk11
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bf95c8-bb10-44b2-b6ae-08d8078a7d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 06:51:05.7117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQ+847AhLOg/dILtVcOaymewAA1+mU9OjtrN9mgl5UHVBygdmsi819ChTUx4Mbwi3YU+KgX8mEAQuSAmiLDgHJ5NA55LefpxhKq3oLavwrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1536
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuZGU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAzLCAyMDIwIDE6NDIgQU0NCj4gVG86
IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZzsgTGlhbSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT47DQo+IFN0ZXZl
IExlZSA8U3RldmVTLkxlZUBtYXhpbWludGVncmF0ZWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW0dJ
VCBQVUxMXSBBU29DIHVwZGF0ZXMgZm9yIHY1LjgNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0K
PiANCj4gDQo+IE9uIE1vbiwgMDEgSnVuIDIwMjAgMjM6MTc6NTkgKzAyMDAsDQo+IFRha2FzaGkg
SXdhaSB3cm90ZToNCj4gPg0KPiA+IE9uIE1vbiwgMDEgSnVuIDIwMjAgMjA6NDQ6NTUgKzAyMDAs
DQo+ID4gVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgMDEgSnVuIDIw
MjAgMTQ6MTM6MjMgKzAyMDAsDQo+ID4gPiBNYXJrIEJyb3duIHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+IDljYjFmZDBlZmQxOTU1
OTBiODI4YjliODY1NDIxYWQzNDVhNGExNDU6DQo+ID4gPiA+DQo+ID4gPiA+ICAgTGludXggNS43
LXJjNyAoMjAyMC0wNS0yNCAxNTozMjo1NCAtMDcwMCkNCj4gPiA+ID4NCj4gPiA+ID4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+IGh0dHBzOi8vbmFtMDIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRg0KPiA+ID4gPg0KPiBnaXQua2VybmVsLm9yZyUyRnB1YiUyRnNjbSUyRmxp
bnV4JTJGa2VybmVsJTJGZ2l0JTJGYnJvb25pZSUyRnNvdW4NCj4gPiA+ID4NCj4gZC5naXQmYW1w
O2RhdGE9MDIlN0MwMSU3Q3N0ZXZlcy5sZWUlNDBtYXhpbWludGVncmF0ZWQuY29tJTdDM2RhZDIx
DQo+ID4gPiA+DQo+IDA1YzViZjRmODMwOTJhMDhkODA3MTNlZjFiJTdDZmJkOTA5ZGZlYTY5NDc4
OGE1NTRmMjRiNzg1NGFkMDMlN0MwJQ0KPiA+ID4gPg0KPiA3QzAlN0M2MzcyNjcxMjk0OTU0ODQ1
OTImYW1wO3NkYXRhPXBWYWFIbTdHTGRoRUU2SFdOUE1pVWJ0bzdCdA0KPiBMSmlwDQo+ID4gPiA+
IFBPOFYyOUxMZ3pCZyUzRCZhbXA7cmVzZXJ2ZWQ9MCB0YWdzL2Fzb2MtdjUuOA0KPiA+ID4gPg0K
PiA+ID4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCj4gMzU4YzdjNjFmZDA0ZDMy
NGY4M2Q3OTY4ZGFmOGRkOWE2ZmY4NmE5YToNCj4gPiA+ID4NCj4gPiA+ID4gICBNZXJnZSByZW1v
dGUtdHJhY2tpbmcgYnJhbmNoICdhc29jL2Zvci01LjgnIGludG8gYXNvYy1saW51cw0KPiA+ID4g
PiAoMjAyMC0wNi0wMSAxMzowMToxNSArMDEwMCkNCj4gPiA+ID4NCj4gPiA+ID4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gPiBBU29DOiBVcGRhdGVzIGZvciB2NS44DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgaGFz
IGJlZW4gYW5vdGhlciB2ZXJ5IGFjdGl2ZSByZWxlYXNlIHdpdGggYSBidW5jaCBvZiBuZXcNCj4g
PiA+ID4gZHJpdmVycywgbG90cyBvZiBmaXhlcyBldmVyeXdoZXJlIGFuZCBjb250aW51ZWQgY29y
ZSBpbXByb3ZlbWVudHMNCj4gPiA+ID4gZnJvbQ0KPiA+ID4gPiBNb3JpbW90by1zYW46DQo+ID4g
PiA+DQo+ID4gPiA+ICAtIExvdHMgb2YgY29yZSBjbGVhbnVwcyBhbmQgcmVmYWN0b3JpbmdzIGZy
b20gTW9yaW1vdG8tc2FuLCBmYWN0b3JpbmcNCj4gPiA+ID4gICAgb3V0IGNvbW1vbiBvcGVyYXRp
b25zIGFuZCBtYWtpbmcgdGhlIGNhcmQgYWJzdHJhY3Rpb24gbW9yZSBzb2xpZC4NCj4gPiA+ID4g
IC0gQ29udGludWVkIHdvcmsgb24gY2xlYW5pbmcgdXAgYW5kIGltcHJvdmluZyB0aGUgSW50ZWwg
ZHJpdmVycywgYWxvbmcNCj4gPiA+ID4gICAgd2l0aCBzb21lIG5ldyBwbGF0Zm9ybSBzdXBwb3J0
IGZvciB0aGVtLg0KPiA+ID4gPiAgLSBGaXhlcyB0byBtYWtlIHRoZSBNYXJ2ZWxsIFNTUEEgZHJp
dmVyIHdvcmsgdXBzdHJlYW0uDQo+ID4gPiA+ICAtIFN1cHBvcnQgZm9yIEFNRCBSZW5vaXIgQUNQ
LCBEaWFsb2cgREE3MjEyLCBGcmVlc2NhbGUgRUFTUkMgYW5kDQo+ID4gPiA+ICAgIGkuTVg4TSwg
SW50ZWwgRWxraGFyZCBMYWtlLCBNYXhpbSBNQVg5ODM5MCwgTnV2b3RvbiBOQVU4ODEyIGFuZA0K
PiA+ID4gPiAgICBOQVU4ODE0IGFuZCBSZWFsdGVrIFJUMTAxNi4NCj4gPiA+DQo+ID4gPiBQdWxs
ZWQgbm93LiAgVGhhbmtzLg0KPiA+DQo+ID4gQlRXLCB0aGlzIHB1bGwgcmVxdWVzdCBjYXVzZWQg
YSBjb21waWxlIHdhcm5pbmc6DQo+ID4gICBzb3VuZC9zb2MvY29kZWNzL21heDk4MzkwLmM6IElu
IGZ1bmN0aW9uIOKAmG1heDk4MzkwX2RzbV9pbml04oCZOg0KPiA+ICAgc291bmQvc29jL2NvZGVj
cy9tYXg5ODM5MC5jOjc4MTozOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWxk4oCZIGV4cGVjdHMNCj4g
PiBhcmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgaW504oCZLCBidXQgYXJndW1lbnQgNCBoYXMgdHlw
ZSDigJhzaXplX3Qge2FrYQ0KPiA+IGNvbnN0IHVuc2lnbmVkIGludH3igJkgWy1XZm9ybWF0PV0N
Cj4gPg0KPiA+IFRoaXMgc2hvdWxkIGJlIGZpeGVkIGJ5IHRoZSBjb3JyZWN0IHF1YWxpZmllciAn
eicgaW5zdGVhZCBvZiAnbCcuDQo+IA0KPiBTaW5jZSBubyBvbmUgcmVhY3RzOiBiZWxvdyBpcyB0
aGUgcXVpY2sgZml4LiAgSSdsbCByZXN1Ym1pdCBsYXRlciB2aWEgZ2l0LXNlbmQtZW1haWwuDQo+
IA0KPiBCdXQsIGxvb2tpbmcgbW9yZSBhdCB0aGUgY29kZSBhcm91bmQgdGhhdCBsaW5lLCBJIGNv
dWxkIHNwb3QgbWFueSBvdGhlciBidWdzLg0KPiBZb3UgY2Fubm90IHRydXN0IHRoZSBmaXJtd2Fy
ZSBmaWxlIGFuZCB5b3UgbXVzdCBjaGVjayB0aGUgc2l6ZS4gIFRoZSBjdXJyZW50DQo+IGNvZGUg
Y2FuIHRyaWdnZXIgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGFuZCBjcmFzaCB2ZXJ5IGVhc2lseSB3
aGVuIGEgbWFsZm9ybWVkDQo+IGZpcm13YXJlIGZpbGUgaXMgdG9zc2VkOyBlLmcuIGp1c3QgcHV0
IGFuIGVtcHR5IGZpbGUgKG9yIGEgaHVnZSBmaWxlKSBhcw0KPiBkc21fcGFyYW0uYmluLg0KPiAN
Cj4gU3RldmUsIGNvdWxkIHlvdSBmaXggaXQgcXVpY2tseSwgc28gdGhhdCB3ZSBjYW4gY292ZXIg
aXQgZm9yIHJjMT8NCj4gDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBUYWthc2hpDQoNCiBTb3JyeSBm
b3IgcmVwbHkgbGF0ZS4gSSB3aWxsIGZpeCBpdCBhbmQgdXBkYXRlLg0KDQo+IA0KPiAtLSA4PCAt
LQ0KPiBGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+IFN1YmplY3Q6IFtQQVRD
SF0gQVNvQzogbWF4OTgzOTA6IEZpeCBpbmNvcnJlY3QgcHJpbnRmIHF1YWxpZmllcg0KPiANCj4g
VGhpcyBwYXRjaCBhZGRyZXNzZXMgYSBjb21waWxlIHdhcm5pbmc6DQo+ICAgc291bmQvc29jL2Nv
ZGVjcy9tYXg5ODM5MC5jOjc4MTozOiB3YXJuaW5nOiBmb3JtYXQg4oCYJWxk4oCZIGV4cGVjdHMg
YXJndW1lbnQNCj4gb2YgdHlwZSDigJhsb25nIGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5
cGUg4oCYc2l6ZV90IHtha2EgY29uc3QgdW5zaWduZWQgaW50feKAmSBbLQ0KPiBXZm9ybWF0PV0N
Cj4gDQo+IEZpeGVzOiBhNmUzZjRmMzRjZGIgKCJBU29DOiBtYXg5ODM5MDogQWRkZWQgQW1wbGlm
aWVyIERyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5k
ZT4NCj4gLS0tDQo+ICBzb3VuZC9zb2MvY29kZWNzL21heDk4MzkwLmMgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4MzkwLmMgYi9zb3VuZC9zb2MvY29kZWNzL21heDk4
MzkwLmMNCj4gaW5kZXggYjljZTQ0ZGRhODg2Li5iZTdjZDBhZWI2YTYgMTAwNjQ0DQo+IC0tLSBh
L3NvdW5kL3NvYy9jb2RlY3MvbWF4OTgzOTAuYw0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL21h
eDk4MzkwLmMNCj4gQEAgLTc3OCw3ICs3NzgsNyBAQCBzdGF0aWMgaW50IG1heDk4MzkwX2RzbV9p
bml0KHN0cnVjdA0KPiBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQ0KPiAgICAgICAgIH0N
Cj4gDQo+ICAgICAgICAgZGV2X2RiZyhjb21wb25lbnQtPmRldiwNCj4gLSAgICAgICAgICAgICAg
ICJtYXg5ODM5MDogcGFyYW0gZncgc2l6ZSAlbGRcbiIsDQo+ICsgICAgICAgICAgICAgICAibWF4
OTgzOTA6IHBhcmFtIGZ3IHNpemUgJXpkXG4iLA0KPiAgICAgICAgICAgICAgICAgZnctPnNpemUp
Ow0KPiAgICAgICAgIGRzbV9wYXJhbSA9IChjaGFyICopZnctPmRhdGE7DQo+ICAgICAgICAgZHNt
X3BhcmFtICs9IE1BWDk4MzkwX0RTTV9QQVlMT0FEX09GRlNFVDsNCj4gLS0NCj4gMi4xNi40DQoN
Cg==
