Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224053D55CE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 10:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EBB171F;
	Mon, 26 Jul 2021 10:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EBB171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627289045;
	bh=ftaXOS/3o1K5e9QIw95Gptsd+LQrskymUwHdm4HqRmo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hy+vNsozmmgMRq0u+5fTPcas+Ga53LmvLZwDSM5BctuvYP/bR6JgZGOju34bDteJF
	 zY0kNGIka1A/vDFkh/EcmdRFW8a74uC/zbox5Q3qOfbyA6JxbuSTbIJ/aJJ1BHF5C1
	 epH0KzhEldYzexgD5CZ6/5QBTdzdKMex6/tvK2uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E38E4F80130;
	Mon, 26 Jul 2021 10:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2BDCF8025A; Mon, 26 Jul 2021 10:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7CFF8020D
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 10:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7CFF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="GbILj7Wa"
X-UUID: 63fe5baea5c5416d968f554e8c3cc940-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ftaXOS/3o1K5e9QIw95Gptsd+LQrskymUwHdm4HqRmo=; 
 b=GbILj7WarPTCnRJlbYaiIMHV8CjxMqFun0YmUUCBKwrrKAEftW1VoaVllklV5x/SRq/lOHCiS4ZR0/f3mhycaw1eQz2I2CIO4OmGYDgjgbtqAtfWdfR2zolbuWtOus1daUlsX4ksjn2lNBiupW9z5MElO4uGhY/fkhpQEhKo5Bw=;
X-UUID: 63fe5baea5c5416d968f554e8c3cc940-20210726
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1045518810; Mon, 26 Jul 2021 16:42:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 16:42:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 16:42:14 +0800
Message-ID: <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
From: chihhao chen <chihhao.chen@mediatek.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>, Takashi Iwai <tiwai@suse.de>
Date: Mon, 26 Jul 2021 16:42:14 +0800
In-Reply-To: <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
 <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

SGVsbG8sDQoNCkF0dGFjaCBVU0IgZGVzY3JpcHRvciBvZiBjbG9jayBzb3VyY2UgYW5kIHNlbGVj
dGlvciBmb3IgdGhpcyBlYXJwaG9uZS4NCg0KQUMgQ2xvY2sgU291cmNlIERlc2NyaXB0b3I6DQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KVmFsdWUJVmFsdWVuYW1lDQoweDA4CWJM
ZW5ndGgNCjB4MjQJYkRlc2NyaXB0b3JUeXBlDQoweDBBCWJEZXNjcmlwdG9yU3VidHlwZQ0KMHgw
OQliQ2xvY2tJRA0KMHgwMwlibUF0dHJpYnV0ZXMNCjB4MDcJYm1Db250cm9scw0KMHgwMAliQXNz
b2NUZXJtaW5hbA0KMHgwMAlpQ2xvY2tTb3VyY2UNCkhleCBkdW1wOiANCjB4MDggMHgyNCAweDBB
IDB4MDkgMHgwMyAweDA3IDB4MDAgMHgwMCANCg0KQUMgQ2xvY2sgU2VsZWN0b3IgRGVzY3JpcHRv
cjoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpWYWx1ZQlWYWx1ZW5hbWUNCjB4
MDkJYkxlbmd0aA0KMHgyNAliRGVzY3JpcHRvclR5cGUNCjB4MEIJYkRlc2NyaXB0b3JTdWJ0eXBl
DQoweDBCCWJDbG9ja0lEDQoweDAyCWJOckluUGlucw0KMHgwOQliYUNTb3VyY2VJRCgxKQ0KMHgw
QQliYUNTb3VyY2VJRCgyKQ0KMHgwMwlibUNvbnRyb2xzDQoweDAwCWlDbG9ja1NlbGVjdG9yDQpI
ZXggZHVtcDogDQoweDA5IDB4MjQgMHgwQiAweDBCIDB4MDIgMHgwOSAweDBBIDB4MDMgMHgwMCAN
Cg0KQUMgQ2xvY2sgU291cmNlIERlc2NyaXB0b3I6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCg0KVmFsdWUJVmFsdWVuYW1lDQoweDA4CWJMZW5ndGgNCjB4MjQJYkRlc2NyaXB0b3JU
eXBlDQoweDBBCWJEZXNjcmlwdG9yU3VidHlwZQ0KMHgwQQliQ2xvY2tJRA0KMHgwMwlibUF0dHJp
YnV0ZXMNCjB4MDcJYm1Db250cm9scw0KMHgwMAliQXNzb2NUZXJtaW5hbA0KMHgwMAlpQ2xvY2tT
b3VyY2UNCkhleCBkdW1wOiANCjB4MDggMHgyNCAweDBBIDB4MEEgMHgwMyAweDA3IDB4MDAgMHgw
MCANCg0KQUMgQ2xvY2sgU2VsZWN0b3IgRGVzY3JpcHRvcjoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KDQpWYWx1ZQlWYWx1ZW5hbWUNCjB4MDkJYkxlbmd0aA0KMHgyNAliRGVzY3Jp
cHRvclR5cGUNCjB4MEIJYkRlc2NyaXB0b3JTdWJ0eXBlDQoweDBDCWJDbG9ja0lEDQoweDAyCWJO
ckluUGlucw0KMHgwOQliYUNTb3VyY2VJRCgxKQ0KMHgwQQliYUNTb3VyY2VJRCgyKQ0KMHgwMwli
bUNvbnRyb2xzDQoweDAwCWlDbG9ja1NlbGVjdG9yDQpIZXggZHVtcDogDQoweDA5IDB4MjQgMHgw
QiAweDBDIDB4MDIgMHgwOSAweDBBIDB4MDMgMHgwMA0KDQpUaGFua3MNCkNoaWhoYW8NCg0KT24g
TW9uLCAyMDIxLTA3LTI2IGF0IDAyOjE2ICswMDAwLCBHZXJhbGRvIE5hc2NpbWVudG8gd3JvdGU6
DQo+IE9uIFN1biwgSnVsIDI1LCAyMDIxIGF0IDc6NDQgQU0gVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmRlPiB3cm90ZToNCj4gPiANCj4gPiBPbiBTYXQsIDI0IEp1bCAyMDIxIDE3OjA0OjEzICsw
MjAwLA0KPiA+IEdlcmFsZG8gTmFzY2ltZW50byB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gU2F0
LCBKdWwgMjQsIDIwMjEgYXQgODowNSBBTSBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+
ID4gPiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgbG9va3MgbGlrZSBhIHJlZ3Jlc3Np
b24gaW50cm9kdWNlZCBieSB0aGUgcmVjZW50IGNvbW1pdA0KPiA+ID4gPiBkMmU4ZjY0MTI1N2Qg
KCJBTFNBOiB1c2ItYXVkaW86IEV4cGxpY2l0bHkgc2V0IHVwIHRoZSBjbG9jaw0KPiA+ID4gPiBz
ZWxlY3RvciIpLCB3aGljaCBpcyBhIGZpeCBmb3IgY2VydGFpbiBkZXZpY2VzLiAgVG9vIGJhZCB0
aGF0DQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBiZWhhdmlvciByZWFsbHkgZGVwZW5kcyBvbiB0aGUg
ZGV2aWNlLi4uDQo+ID4gPiANCj4gPiA+IERyLiBJd2FpLCBwZXJoYXBzIHdlIGNvdWxkIHJlc3Ry
aWN0IHRoZSBnZW5lcmFsaXplZCBmaXggZm9yIHRoZQ0KPiA+ID4gQmVocmluZ2VyIFVGWDE2MDQg
LyBVRlgxMjA0IHdpdGggc29tZSBzaW1wbGUgbG9naWMgdG8gZGV2aWNlcw0KPiA+ID4gdGhhdA0K
PiA+ID4gb25seSBoYXZlICpvbmUqIGNsb2NrIHNvdXJjZS4NCj4gPiA+IA0KPiA+ID4gSW4gdGhh
dCBjYXNlIHRoZSBjbG9jayBzZWxlY3RvciBtdXN0IGJlIHNldCB0byB0aGUgb25seSBjbG9jaw0K
PiA+ID4gc291cmNlLg0KPiA+ID4gDQo+ID4gPiBUaGlzIHdheSB3ZSBrZWVwIHRoZSBnZW5lcmFs
aXphdGlvbiB3aXRob3V0IGJyZWFraW5nIGRldmljZXMgd2l0aA0KPiA+ID4gbW9yZQ0KPiA+ID4g
dGhhbiBvbmUgY2xvY2sgc291cmNlLg0KPiA+ID4gDQo+ID4gPiBKdXN0IGFuIGlkZWEuDQo+ID4g
DQo+ID4gSSBkb24ndCB0aGluayBpdCdzIGVhc3kgdG8gZ2VuZXJhbGl6ZS4gIEFsbCB0aG9zZSBi
dWdzIGFyZSBtb3JlIG9yDQo+ID4gbGVzcyBCSU9TIGJ1Z3MsIGFuZCBhIGxvZ2ljIGRvZXNuJ3Qg
YXBwbHkgYWx3YXlzLCBqdXN0IGJlY2F1c2UgaXQncw0KPiA+IGENCj4gPiBidWcgOikgIEZvciBl
eGFtcGxlLCBzZXR0aW5nIHRoZSBjbG9jayBzZWxlY3RvciBpdHNlbGYgc2hvdWxkIGJlIGENCj4g
PiB2YWxpZCBvcGVyYXRpb24gZnJvbSB0aGUgc3BlY2lmaWNhdGlvbiBQT1YsIHdoaWxlIHRoaXMg
bGVhZHMgdG8NCj4gPiBicmVha2FnZSBvbiBzb21lIGRldmljZXMuICBTbywgZXZlbiBpZiB3ZSBh
ZGQgYSBtb3JlIGdlbmVyaWMNCj4gPiB3b3JrYXJvdW5kLCB3ZSBuZWVkIHRvIHNlZSB3aGljaCBz
aWRlIGVmZmVjdCBpcyBtb3JlIGNvbW1vbmx5IHNlZW4NCj4gPiBhdA0KPiA+IGZpcnN0Lg0KPiA+
IA0KPiA+IA0KPiA+IFRha2FzaGkNCj4gDQo+IEhlbGxvLA0KPiANCj4gTGlrZSBJIHNhaWQgaW4g
b25lIG9mIHRoZSBvdGhlciBlbWFpbHMgaW4gdGhpcyB0aHJlYWQsIGl0J3MgaGFyZCB0bw0KPiBw
aW5wb2ludCBhIGNhdXNlIGZvciB0aGUgYnJlYWthZ2Ugb2YgU2Ftc3VuZyBVU0JDIEhlYWRzZXQg
KEFLRykgd2l0aA0KPiBWSUQvUElEICgweDA0ZTgvMHhhMDUxKSB3aXRob3V0IHRoZSBsc3VzYiAt
diBvZiB0aGUgZGV2aWNlIGluDQo+IHF1ZXN0aW9uLg0KPiANCj4gQnV0IGZyb20gdGhlIGRlc2Ny
aXB0aW9uIENoaWhoYW8gQ2hlbiBnYXZlIGluIHRoZSBvcmlnaW5hbCBtZXNzYWdlLA0KPiBJJ20g
Kmd1ZXNzaW5nKiB0aGUgQ2xvY2sgU291cmNlIGZvciB0aGUgU2Ftc3VuZyBVU0IgSGVhZHNldCAo
QUtHKQ0KPiBydW5zDQo+IGF0IDQ4MDAwaHogYW5kIHRoYXQgd2UnZCBzZWUgYSAyeCBDbG9jayBN
dWx0aXBsaWVyIGluIHRoZSBsc3VzYiAtdg0KPiANCj4gVGhpcyBpcyBhbGwgYSB3aWxkIGd1ZXNz
LCB3aXRob3V0IHRoZSBsc3VzYiAtdiBpdCdzIGltcG9zc2libGUgdG8gYmUNCj4gc3VyZSwgYnV0
IGlmIEknbSByaWdodCB0aGVuIHRoZSB2YWxpZCBzZXR0aW5nIGZvciB0aGUgTWljcm9waG9uZSdz
DQo+IENsb2NrIFNlbGVjdG9yIGlzIHRoZSBDbG9jayBNdWx0aXBsaWVyLCBub3QgdGhlIENsb2Nr
IFNvdXJjZSwgd2hpY2gsDQo+IHJlbWVtYmVyLCBydW5zIGF0IGhhbGYgdGhlIGNsb2NrLCBoZW5j
ZSB3aHkgQ2hpaGhhbyBDaGVuIHNlZXMgaGFsZg0KPiB0aGUNCj4gZGF0YSByYXRlIGZvciBVU0Ig
SU4uDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IG91ciBrZXJuZWwgY29kZSBwcmVzZW50bHkgKmRvZXMq
IGFsd2F5cyBzZXQgdGhlIENsb2NrDQo+IFNlbGVjdG9yIHRvIHRoZSBDbG9jayBTb3VyY2UsIHdo
aWNoIGlzIGEgYmFkIGFzc3VtcHRpb24gdG8gbWFrZSBpbiBteQ0KPiBodW1ibGUgb3Bpbmlvbi4N
Cj4gDQo+IFRoZSBvbmx5IHZhbGlkIGNhc2UgZm9yIHNldHRpbmcgdGhlIENsb2NrIFNlbGVjdG9y
IHRvIHRoZSBDbG9jaw0KPiBTb3VyY2UNCj4gaXMgd2hlbiB0aGVyZSdzIHByZWNpc2VseSBvbmUg
Q2xvY2sgU2VsZWN0b3IsIHByZWNpc2VseSBvbmUgQ2xvY2sNCj4gU291cmNlIGFuZCBubyBDbG9j
ayBNdWx0aXBsaWVycy4NCj4gDQo+IEluIHRoYXQgc3BlY2lhbCBjYXNlIHdlIG1heSBiZSBhYmxl
IHRvIHRvdWNoIHRoZSBzZXR0aW5nIG9mIHRoZSBvbmx5DQo+IENsb2NrIFNlbGVjdG9yIHRvIG1h
dGNoIHRoZSBvbmx5IENsb2NrIFNvdXJjZS4NCj4gDQo+IEFuZCwgZnJhbmtseSwgdGhlIG9ubHkg
cmVhc29uIHdlJ3JlIGZvcmNlZCB0byBkbyB0aGF0IGV4cGxpY2l0bHkgaXMNCj4gYmVjYXVzZSBz
b21lIEJlaHJpbmdlciBnZWFyIChBcmNod2F2ZSBBRyBEQUNzKSBnZXRzIGNvbmZ1c2VkIGFuZA0K
PiBzZWVtcw0KPiB0byBzb21laG93IGtlZXAgdGhlIG9sZCByYXRlIG9uIHRoZSBDbG9jayBTZWxl
Y3RvciB1cG9uIHNhbXBsZSByYXRlDQo+IGNoYW5nZS4NCj4gDQo+IFRoYW5rIHlvdSwNCj4gR2Vy
YWxkbyBOYXNjaW1lbnRvDQo=

