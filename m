Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA57593B5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 13:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95524200;
	Wed, 19 Jul 2023 13:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95524200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689764713;
	bh=OqAGYShTfOwwuTgb57OnvIhir5Stns3gFCkVkTB331w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nOVUkQMk4OAaIaLeVzR5l+RILY/Onss+/2zytoAX8Q8q95JcGzq68/gjUeUzEiTH0
	 0K2S4MVb7YZsRlujd7QZLAu2eBrrjhvSaSO0kFrHoixRz945FvJCrdN2eT4fzTsv7N
	 2HH+rwHNpe8wYCPL5HmmDxzchvr/gZnptvYNBNW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D7DF80494; Wed, 19 Jul 2023 13:04:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE35F8032D;
	Wed, 19 Jul 2023 13:04:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9289FF8047D; Wed, 19 Jul 2023 11:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77376F8007E;
	Wed, 19 Jul 2023 11:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77376F8007E
Message-ID: <66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
Date: Wed, 19 Jul 2023 11:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
 <874jm0modf.wl-tiwai@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <874jm0modf.wl-tiwai@suse.de>
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2VNCTG2BP7VS3YMCOXGTYBVGKVRNEDUB
X-Message-ID-Hash: 2VNCTG2BP7VS3YMCOXGTYBVGKVRNEDUB
X-Mailman-Approved-At: Wed, 19 Jul 2023 11:03:57 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VNCTG2BP7VS3YMCOXGTYBVGKVRNEDUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGV5LA0KDQpPbiAyMDIzLTA3LTE5IDA4OjAxLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+IE9uIFR1
ZSwgMTggSnVsIDIwMjMgMTk6MDQ6NDEgKzAyMDAsDQo+IEthaSBWZWhtYW5lbiB3cm90ZToNCj4+
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9pbnRlbC9oZGEtY29kZWMuYyBiL3NvdW5kL3Nv
Yy9zb2YvaW50ZWwvaGRhLWNvZGVjLmMNCj4+PiBpbmRleCBmMWZkNWI0NGFhYWM5Li4zNDRiNjE1
NzZjMGUzIDEwMDY0NA0KPj4+IC0tLSBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWNvZGVjLmMN
Cj4+PiArKysgYi9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1jb2RlYy5jDQo+Pj4gQEAgLTQxNSw3
ICs0MTUsNyBAQCBpbnQgaGRhX2NvZGVjX2k5MTVfaW5pdChzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNk
ZXYpDQo+Pj4gICAJCXJldHVybiAwOw0KPj4+ICAgDQo+Pj4gICAJLyogaTkxNSBleHBvc2VzIGEg
SERBIGNvZGVjIGZvciBIRE1JIGF1ZGlvICovDQo+Pj4gLQlyZXQgPSBzbmRfaGRhY19pOTE1X2lu
aXQoYnVzLCB0cnVlKTsNCj4+PiArCXJldCA9IHNuZF9oZGFjX2k5MTVfaW5pdChidXMsIGZhbHNl
KTsNCj4+PiAgIAlpZiAocmV0IDwgMCkNCj4+PiAgIAkJcmV0dXJuIHJldDsNCj4+IE15IG9ubHkg
YmlnZ2VyIGNvbmNlcm4gaXMgY29ybmVyIGNhc2VzIHdoZXJlIHRoZSBkaXNwbGF5IFBDSSBkZXZp
Y2UgaXMgb24NCj4+IHRoZSBidXMgYW5kIHZpc2libGUgdG8ga2VybmVsLCBidXQgZm9yIHNvbWUg
cmVhc29uIHRoZXJlIGlzIG5vIHdvcmtpbmcNCj4+IGRyaXZlciBpbiB0aGUgc3lzdGVtIG9yIGl0
IGlzIGRpc2FibGVkLg0KPj4NCj4+IFdpdGggdGhpcyBwYXRjaCwgbm90IGhhdmluZyBhIHdvcmtp
Z24gZGlzcGxheSBkcml2ZXIgbWVhbnMgdGhhdCB0aGVyZSBpcw0KPj4gYWxzbyBubyBhdWRpbyBp
biB0aGUgc3lzdGVtIGFzIHRoZSBTT0YgZHJpdmVyIHdpbGwgbmV2ZXIgZ2V0IHByb2JlZC4NCj4+
DQo+PiBJbiBjdXJyZW50IG1haW5saW5lLCBvbmUgd2lsbCBnZXQgdGhlIDYwc2VjIHRpbWVvdXQg
d2FybmluZyBhbmQgdGhlbg0KPj4gYXVkaW8gZHJpdmVyIHdpbGwgcHJvY2VlZCB0byBwcm9iZSBh
bmQgeW91J2xsIGhhdmUgYXVkaW8gc3VwcG9ydCAobWludXMNCj4+IEhETUkvRFApLg0KPiBZZWFo
LCB0aGF0IHdhcyBhIGNvbmNlcm4gaW4gdGhlIHBhc3QsIHRvby4gIGUuZy4gd2hlbiB5b3UgcGFz
cw0KPiAibm9tb2Rlc2V0IiBib290IG9wdGlvbiwgdGhlIGRyaXZlciB3aWxsIGJlY29tZSB1bnVz
YWJsZSwgZXZlbiBpZiB0aGUNCj4gYnVzIGlzIHVzZWQgZ2VuZXJpY2FsbHkgZm9yIGJvdGggYW5h
bG9nIGFuZCBIRE1JIGNvZGVjcy4NCg0KWWVhaCwgSSBoYXZlIG5vIGFuc3dlciBmb3IgdGhpcy4g
TXkgZ3Vlc3MgaXPCoHRoYXQgaW4gYW4gaWRlYWwgd29ybGQsIHRoZSBvcHRpb25hbCBmZWF0dXJl
cw0KcmVsYXRlZCB0byBIRE1JIG91dHB1dHMgd291bGQgYmUgcHV0IGluIGEgc2VwYXJhdGUgc3Vi
LWRyaXZlciwgd2hpY2ggY291bGQgLUVQUk9CRV9ERUZFUi4NCk9ubHkgd2hlbiB0aGlzIGRyaXZl
ciBsb2FkcywgZmVhdHVyZXMgcmVsYXRlZCB0byBkaXNwbGF5IHdpbGwgd29yaywgYnV0IHRoZSBt
YWluIGF1ZGlvIGRyaXZlcg0KY291bGQgc3RpbGwgbG9hZC4NCg0KPj4gVGhpcyBpcyBtb3N0bHkg
YW4gaXNzdWUgd2l0aCB2ZXJ5IG5ldyBoYXJkd2FyZSAoZS5nLiBodyBpcyBzdGlsbA0KPj4gYmVo
aW5kIGZvcmNlX3Byb2JlIGZsYWcgaW4geGUvaTkxNSBkcml2ZXIpLCBidXQgd2UndmUgaGFkIHNv
bWUgb2RkDQo+PiBjYXNlcyB3aXRoIGUuZy4gc3lzdGVtcyB3aXRoIGJvdGggSW50ZWwgSUdGWCBh
bmQgb3RoZXIgdmVuZG9ycycgREdQVS4NCj4+IEF1ZGlvIGRyaXZlcnMgc2VlIHRoZSBJbnRlbCBW
R0EgY29udHJvbGxlciBpbiBzeXN0ZW0gYW5kIHdpbGwNCj4+IGNhbGwgc25kX2hkYWNfaTkxNV9p
bml0KCksIGJ1dCB0aGUgYXVkaW8gY29tcG9uZW50IGJpbmQgd2lsbCBuZXZlcg0KPj4gc3VjY2Vl
ZCBpZiB0aGUgdGhlIEludGVsIElHRlggaXMgbm90IGluIGFjdHVhbCB1c2UuDQo+Pg0KPj4gV2ls
bCBuZWVkIGEgYml0IG9mIHRpbWUgdG8gdGhpbmsgYWJvdXQgcG9zc2libGUgc2NlbmFyaW9zLiBQ
b3NzaWJseSB0aGlzDQo+PiBpcyBub3QgYW4gaXNzdWUgb3V0c2lkZSBlYXJseSBkZXZlbG9wbWVu
dCBzeXN0ZW1zLiBJbiB0aGVvcnkgaWYgSUdGWCBpcw0KPj4gZGlzYWJsZWQgaW4gQklPUywgYW5k
IG5vdCB2aXNpYmxlIHRvIE9TLCB3ZSBhcmUgZ29vZCwgYW5kIGlmIGl0J3MgdmlzaWJsZSwNCj4+
IHRoZSBpOTE1L3hlIGRyaXZlciBzaG91bGQgYmUgbG9hZGVkLCBzbyB3ZSBhcmUgZ29vZCBhZ2Fp
bi4NCj4gVGhlIDYwIHNlY29uZHMgdGltZW91dCBpcyBhIHRoaW5nICJiZXR0ZXIgdGhhbiBjb21w
bGV0ZSBkaXNhYmxlbWVudCIsDQo+IHNvIGl0J3Mgbm90IGlkZWFsLCBlaXRoZXIuICBNYXliZSB3
ZSBjYW4gYWRkIHNvbWV0aGluZyBsaWtlIHRoZQ0KPiBmb2xsb3dpbmc6DQo+DQo+IC0gQ2hlY2sg
d2hlbiB0aGUgZGVmZXJyZWQgcHJvYmUgdGFrZXMgdG9vIGxvbmcsIGFuZCB3YXJuIGl0DQo+IC0g
UHJvdmlkZSBzb21lIHJ1bnRpbWUgb3B0aW9uIHRvIGRpc2FibGUgdGhlIGNvbXBvbmVudCBiaW5k
aW5nLCBzbw0KPiAgICB0aGF0IHVzZXIgY2FuIHdvcmsgYXJvdW5kIGl0IGlmIG5lZWRlZA0KDQpB
IG1vZHVsZSBvcHRpb24gdG8gc25kX2hkYWNfaTkxNV9pbml0IHdvdWxkIHByb2JhYmx5IGJlIHRo
ZSBsZWFzdCBvZiBhbGwgDQpldmlscyBoZXJlLg0KDQpJIHNlZSB0aGUgcmVtb3ZhbCBvZiB0aGUg
NjAgc2Vjb25kIHRpbWVvdXQgYXMgYSBnb29kIHRoaW5nIHJlZ2FyZGxlc3MuIA0KOi0pIFVzdWFs
bHkgd2hlbiBub21vZGVzZXQgaXMgdXNlZCwgaXQncyBqdXN0IGZvciBzYWZlIG1vZGUuDQoNCldp
dGggdGhlIGFkZGl0aW9uIG9mwqAgdGhlIHhlIGRyaXZlciwgYmxpbmRseSBtb2Rwcm9iaW5nIGk5
MTUgd2lsbCBmYWxsIA0KYXBhcnQgcmVnYXJkbGVzcy4NCg0Kfk1hYXJ0ZW4NCg==
