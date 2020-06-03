Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C41ED16C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 15:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5831665;
	Wed,  3 Jun 2020 15:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5831665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591192338;
	bh=jwnn3BpiVJ43Pjm9A4aConW48lY8yM/F4kKqerAKBTc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNUGIakzN8V8GNJ4YXmmuDTEEQCFQS7QqhuGvUoWbo5REwieoKViiHkLUe/9yAZeO
	 vhwKfOwzFUNL52TwG53hn30nFHoSULCFRim5NRTYYRctjFnoqqM6G0ubLBjNwTf1Pd
	 XWSI6yKynquMUzqiwdrNfYUgBvnKFo01sWAOi1mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD701F800BC;
	Wed,  3 Jun 2020 15:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE84F801ED; Wed,  3 Jun 2020 15:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 4A68AF8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 15:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A68AF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="LhGZIho9"
X-UUID: f02de469bbed45d2965093fe4b35b54b-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jwnn3BpiVJ43Pjm9A4aConW48lY8yM/F4kKqerAKBTc=; 
 b=LhGZIho9jN0hDjOABgQ8qTYDj9w5Iyvxpas89RSIL8YaBplgybUe38w+Wtt1TMK4LRXLjE7c7IKX9Fnqwd2Sou1EHmdf05KEUSNlIdlIgiHncoMYI/aRlVufxEX8pH0aVYaMquBjDMt+fH5zix3Ue4Q0zNXiLA5JhD8jJshexIA=;
X-UUID: f02de469bbed45d2965093fe4b35b54b-20200603
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 201727731; Wed, 03 Jun 2020 21:50:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 21:50:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 21:50:12 +0800
Message-ID: <1591192216.23525.72.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 3 Jun 2020 21:50:16 +0800
In-Reply-To: <s5hr1uwco4c.wl-tiwai@suse.de>
References: <s5hpnahhbz8.wl-tiwai@suse.de>
 <1591153515.23525.50.camel@mtkswgap22>	<s5heeqwfyti.wl-tiwai@suse.de>
 <s5hblm0fxl0.wl-tiwai@suse.de>	<s5h367cfsga.wl-tiwai@suse.de>
 <1591187964.23525.61.camel@mtkswgap22> <s5hr1uwco4c.wl-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B7292D25D0CC9D9E834BBB7EEEB79C45CDBB9BDCEBA293A96ABF504C88603DA2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org,
 Szabolcs =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Johan Hovold <johan@kernel.org>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
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

T24gV2VkLCAyMDIwLTA2LTAzIGF0IDE0OjQ3ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IE9uIFdlZCwgMDMgSnVuIDIwMjAgMTQ6Mzk6MjQgKzAyMDAsDQo+IE1hY3BhdWwgTGluIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFdlZCwgMjAyMC0wNi0wMyBhdCAxMDo0NSArMDIwMCwgVGFrYXNoaSBJ
d2FpIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAwMyBKdW4gMjAyMCAwODo1NDo1MSArMDIwMCwNCj4g
PiA+IFRha2FzaGkgSXdhaSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdlZCwgMDMgSnVu
IDIwMjAgMDg6Mjg6MDkgKzAyMDAsDQo+ID4gPiA+IFRha2FzaGkgSXdhaSB3cm90ZToNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBBbmQsIHRoZSBtb3N0IHN1c3BpY2lvdXMgY2FzZSBpcyB0aGUgbGFz
dCBvbmUsDQo+ID4gPiA+ID4gY2hpcC0+bnVtX3N1c3BlbmRlZC1pbnRmLiAgSXQgbWVhbnMgdGhh
dCB0aGUgZGV2aWNlIGhhcyBtdWx0aXBsZQ0KPiA+ID4gPiA+IFVTQiBpbnRlcmZhY2VzIGFuZCB0
aGV5IHdlbnQgdG8gc3VzcGVuZCwgd2hpbGUgdGhlIHJlc3VtZSBpc24ndA0KPiA+ID4gPiA+IHBl
cmZvcm1lZCBmb3IgdGhlIGFsbCBzdXNwZW5kZWQgaW50ZXJmYWNlcyBpbiByZXR1cm4uDQo+ID4g
PiA+IA0KPiA+ID4gPiBJZiB0aGlzIGlzIHRoZSBjYXVzZSwgYSBwYXRjaCBsaWtlIGJlbG93IG1p
Z2h0IGhlbHAuDQo+ID4gPiA+IEl0IGdldHMvcHV0cyB0aGUgYWxsIGFzc2lnbmVkIGludGVyZmFj
ZWQgaW5zdGVhZCBvZiBvbmx5IHRoZSBwcmltYXJ5DQo+ID4gPiA+IG9uZS4NCj4gPiA+IA0KPiA+
ID4gLi4uIGFuZCBjb25zaWRlcmluZyBvZiB0aGUgcHJvYmxlbSBhZ2FpbiwgcmF0aGVyIHRoZSBw
YXRjaCBiZWxvdyBtaWdodA0KPiA+ID4gYmUgdGhlIHJpZ2h0IGFuc3dlci4gIE5vdyB0aGUgZHJp
dmVyIHRyaWVzIHRvIHJlbWVtYmVyIGF0IHdoaWNoIHN0YXRlDQo+ID4gPiBpdCBlbnRlcmVkIGlu
dG8gdGhlIHN5c3RlbS1zdXNwZW5kLiAgVXBvbiByZXN1bWUsIGluIHJldHVybiwgd2hlbiB0aGUN
Cj4gPiA+IHN0YXRlIHJlYWNoZXMgYmFjayB0byB0aGF0IHBvaW50LCBzZXQgdGhlIGNhcmQgc3Rh
dGUgdG8gRDAuDQo+ID4gPiANCj4gPiA+IFRoZSBwcmV2aW91cyBwYXRjaCBjYW4gYmUgYXBwbGll
ZCBvbiB0aGUgdG9wLCB0b28sIGFuZCBpdCBtaWdodCBiZQ0KPiA+ID4gd29ydGggdG8gYXBwbHkg
Ym90aC4NCj4gPiA+IA0KPiA+ID4gTGV0IG1lIGtub3cgaWYgYW55IG9mIHRob3NlIGFjdHVhbGx5
IGhlbHBzLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFRha2FzaGkNCj4gPiANCj4gPiBUaGFua3Mg
Zm9yIHlvdXIgcmVzcG9uc2Ugc28gcXVpY2tseS4NCj4gPiBJJ3ZlIGp1c3QgdGVzdCB0aGlzIHBh
dGNoIHNpbmNlIGl0IGxvb2tzIGxpa2UgZW5vdWdoIGZvciB0aGUgaXNzdWUuDQo+IA0KPiBHb29k
IHRvIGhlYXIhDQo+IA0KPiA+IFRoaXMgcGF0Y2ggd29ya2VkIHNpbmNlIHRoZSBmbGFnIHN5c3Rl
bV9zdXNwZW5kIHdpbGwgYmUgc2V0IGF0IHRoZSBzYW1lDQo+ID4gdGltZSB3aGVuIHBvd2VyIHN0
YXRlIGhhcyBiZWVuIGNoYW5nZWQuIEkgaGF2ZSAyIGludGVyZmFjZSB3aXRoIHRoZSBoZWFkDQo+
ID4gc2V0LiBCdXQgYWN0dWFsbHkgdGhlIHByb2JsZW0gaGFwcGVuZWQgd2hlbiBwcmltYXJ5IG9u
ZSBpcyBzdXNwZW5kZWQuDQo+IA0KPiBDdXJyZW50bHkgdGhlIGF1dG9zdXNwZW5kIGlzIHNldCBv
bmx5IHRvIHRoZSBwcmltYXJ5IGludGVyZmFjZTsgSU9XLA0KPiB0aGUgb3RoZXIgaW50ZXJmYWNl
cyB3aWxsIG5ldmVyIGdldCBhdXRvc3VzcGVuZCwgYW5kIHRoZSBhbm90aGVyDQo+IHN1c3BlbmQt
YWxsLWludGYgcGF0Y2ggc2hvdWxkIGltcHJvdmUgdGhhdCBzaXR1YXRpb24uICBCdXQgaXQgd29u
J3QNCj4gZml4IHlvdXIgYWN0dWFsIGJ1Zywgb2J2aW91c2x5IDopDQo+IA0KPiA+IFNvIEkgZGlk
bid0IHRlc3QgdGhlIGVhcmxpZXIgcGF0Y2ggInN1c3BlbmQgYWxsIGludGVyZmFjZSBpbnN0ZWFk
IG9mDQo+ID4gb25seSB0aGUgcHJpbWFyeSBvbmUuIg0KPiANCj4gQ291bGQgeW91IHRyeSBpdCBv
bmUgb24gdG9wIG9mIHRoZSBsYXN0IHBhdGNoPyAgQXQgbGVhc3QgSSdkIGxpa2UgdG8NCj4gc2Vl
IHdoZXRoZXIgaXQgY2F1c2VzIGFueSByZWdyZXNzaW9uLg0KDQpJJ3ZlIHRyaWVkIGJvdGggb2Yg
dGhlc2UgMiBwYXRjaGVzIHRvZ2V0aGVyLCBhbmQgaXQgbG9va3Mgb2theS4NCg0KPiA+IFdpbGwg
eW91IHJlc2VuZCB0aGlzIHBhdGNoIG9mZmljaWFsbHkgbGF0ZXI/IEkgdGhpbmsgdGhpcyBzb2x1
dGlvbiBpcw0KPiA+IHJlcXVpcmVkIHRvIHNlbmQgdG8gc3RhYmxlLCB0b28uIEl0J3MgYmV0dGVy
IHRvIGhhdmUgaXQgZm9yIG90aGVyIHN0YWJsZQ0KPiA+IGtlcm5lbCB2ZXJzaW9ucyBpbmNsdWRl
IGFuZHJvaWQncy4NCj4gDQo+IFllcywgdGhhdCdzIGEgZ2VuZXJhbCBidWcgYW5kIHdvcnRoIHRv
IGJlIG1lcmdlZCBxdWlja2x5Lg0KPiBJJ20gZ29pbmcgdG8gc3VibWl0IGEgcHJvcGVyIHBhdGNo
IHNvb24gbGF0ZXIuDQo+IA0KPiANCj4gdGhhbmtzLA0KPiANCj4gVGFrYXNoaQ0KPiANCg0KVGhh
bmtzIQ0KTWFjcGF1bCBMaW4NCg==

