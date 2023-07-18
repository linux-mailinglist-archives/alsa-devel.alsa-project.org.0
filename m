Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75477757BAD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0683AE9;
	Tue, 18 Jul 2023 14:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0683AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682890;
	bh=Ri0zfK2hY4L0jOIG1zMaup7ETnipgavpYVEb/UyrYGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZqeH2PwRcfo6NTwXIvIqXz/tZEa43uCLC18gK5NAb/e0LpYSJZXQXvLicwtrLf0em
	 v/W4sIiB0dCpIVgCWZUcl6HXRhYTZncMGX45mBS2MDtxa0T3hfNGSaeHz2qDJ6nB1B
	 iIy78vpb33pmE5/+d5iTkuUTGGG4pOsqIDng/z5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14FD3F804DA; Tue, 18 Jul 2023 14:20:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FDFCF8027B;
	Tue, 18 Jul 2023 14:20:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAFA7F8032D; Tue, 18 Jul 2023 13:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62E0EF80153;
	Tue, 18 Jul 2023 13:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E0EF80153
Message-ID: <2a727311-46d8-e999-1461-2ed2f1b704e0@linux.intel.com>
Date: Tue, 18 Jul 2023 13:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [v2 PATCH 1/2] ALSA: hda/intel: Fix error handling in azx_probe()
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-6-maarten.lankhorst@linux.intel.com>
 <87h6q1o82l.wl-tiwai@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87h6q1o82l.wl-tiwai@suse.de>
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7M4626CXOGU7WT4G3ASP3WE3K4PL6MEA
X-Message-ID-Hash: 7M4626CXOGU7WT4G3ASP3WE3K4PL6MEA
X-Mailman-Approved-At: Tue, 18 Jul 2023 12:20:35 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7M4626CXOGU7WT4G3ASP3WE3K4PL6MEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGV5LA0KDQpPbiAyMDIzLTA3LTE4IDExOjU3LCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+IE9uIFR1
ZSwgMTggSnVsIDIwMjMgMTA6NDU6MjAgKzAyMDAsDQo+IE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3Rl
Og0KPj4gTm93IHRoYXQgd2UgY2FuIHVzZSAtRVBST0JFX0RFRkVSLCBpdCdzIG5vIGxvbmdlciBy
ZXF1aXJlZCB0byBzcGluIG9mZg0KPj4gdGhlIHNuZF9oZGFjX2k5MTVfaW5pdCBpbnRvIGEgd29y
a3F1ZXVlLg0KPj4NCj4+IFVzZSB0aGUgLUVQUk9CRV9ERUZFUiBtZWNoYW5pc20gaW5zdGVhZCwg
d2hpY2ggbXVzdCBiZSByZXR1cm5lZCBpbiB0aGUNCj4+IHByb2JlIGZ1bmN0aW9uLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4+IC0tLQ0KPj4gICBzb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIHwgNTgg
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMN
Cj4+IGluZGV4IDVhZjExMzhlNzQ1YmMuLmQ0MDM0NWEwMDg4ZDggMTAwNjQ0DQo+PiAtLS0gYS9z
b3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jDQo+PiArKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9pbnRl
bC5jDQo+PiBAQCAtMjEzLDYgKzIxMyw3IEBAIE1PRFVMRV9ERVNDUklQVElPTigiSW50ZWwgSERB
IGRyaXZlciIpOw0KPj4gICAjZW5kaWYNCj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gK3N0YXRpYyBE
RUNMQVJFX0JJVE1BUChwcm9iZWRfZGV2cywgU05EUlZfQ0FSRFMpOw0KPj4gICANCj4+ICAgLyoN
Cj4+ICAgICovDQo+PiBAQCAtMjA5NCw4ICsyMDk1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBo
ZGFfY29udHJvbGxlcl9vcHMgcGNpX2hkYV9vcHMgPSB7DQo+PiAgIAkucG9zaXRpb25fY2hlY2sg
PSBhenhfcG9zaXRpb25fY2hlY2ssDQo+PiAgIH07DQo+PiAgIA0KPj4gLXN0YXRpYyBERUNMQVJF
X0JJVE1BUChwcm9iZWRfZGV2cywgU05EUlZfQ0FSRFMpOw0KPj4gLQ0KPj4gICBzdGF0aWMgaW50
IGF6eF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLA0KPj4gICAJCSAgICAgY29uc3Qgc3RydWN0
IHBjaV9kZXZpY2VfaWQgKnBjaV9pZCkNCj4+ICAgew0KPiBBbnkgc3BlY2lmaWMgcmVhc29uIHRv
IG1vdmUgdGhlIGRlZmluaXRpb24/ICBPdGhlcndpc2UgbGV0J3MNCj4gY29uY2VudHJhdGUgb24g
dGhlIG5lZWRlZCBjaGFuZ2UuDQoNCk9yaWdpbmFsbHkgSSBtb3ZlZCB0aGUgY2h1bmsgdG8gYXp4
X2NyZWF0ZSgpLCBidXQgSSBmZWx0IGl0IHdhcyB0aGUgDQp3cm9uZyBwbGFjZS4gRml4ZWQgbm93
Lg0KDQo+DQo+PiBAQCAtMjE3NCw3ICsyMTczLDM2IEBAIHN0YXRpYyBpbnQgYXp4X3Byb2JlKHN0
cnVjdCBwY2lfZGV2ICpwY2ksDQo+PiAgIAl9DQo+PiAgICNlbmRpZiAvKiBDT05GSUdfU05EX0hE
QV9QQVRDSF9MT0FERVIgKi8NCj4+ICAgDQo+PiAtI2lmbmRlZiBDT05GSUdfU05EX0hEQV9JOTE1
DQo+PiArI2lmZGVmIENPTkZJR19TTkRfSERBX0k5MTUNCj4+ICsJLyogYmluZCB3aXRoIGk5MTUg
aWYgbmVlZGVkICovDQo+PiArCWlmIChjaGlwLT5kcml2ZXJfY2FwcyAmIEFaWF9EQ0FQU19JOTE1
X0NPTVBPTkVOVCkgew0KPj4gKwkJZXJyID0gc25kX2hkYWNfaTkxNV9pbml0KGF6eF9idXMoY2hp
cCksIGZhbHNlKTsNCj4+ICsJCWlmIChlcnIgPCAwKSB7DQo+PiArCQkJLyogaWYgdGhlIGNvbnRy
b2xsZXIgaXMgYm91bmQgb25seSB3aXRoIEhETUkvRFANCj4+ICsJCQkgKiAoZm9yIEhTVyBhbmQg
QkRXKSwgd2UgbmVlZCB0byBhYm9ydCB0aGUgcHJvYmU7DQo+PiArCQkJICogZm9yIG90aGVyIGNo
aXBzLCBzdGlsbCBjb250aW51ZSBwcm9iaW5nIGFzIG90aGVyDQo+PiArCQkJICogY29kZWNzIGNh
biBiZSBvbiB0aGUgc2FtZSBsaW5rLg0KPj4gKwkJCSAqLw0KPj4gKwkJCWlmIChDT05UUk9MTEVS
X0lOX0dQVShwY2kpKSB7DQo+PiArCQkJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikNCj4+ICsJ
CQkJCWRldl9lcnIoY2FyZC0+ZGV2LA0KPj4gKwkJCQkJCSJIU1cvQkRXIEhELWF1ZGlvIEhETUkv
RFAgcmVxdWlyZXMgYmluZGluZyB3aXRoIGdmeCBkcml2ZXJcbiIpOw0KPj4gKw0KPj4gKwkJCQlj
bGVhcl9iaXQoY2hpcC0+ZGV2X2luZGV4LCBwcm9iZWRfZGV2cyk7DQo+PiArCQkJCXBjaV9zZXRf
ZHJ2ZGF0YShwY2ksIE5VTEwpOw0KPj4gKwkJCQlzbmRfZGV2aWNlX2ZyZWUoY2FyZCwgY2hpcCk7
DQo+PiArCQkJCXJldHVybiBlcnI7DQo+IFRoaXMgbWF5IGxlYWsgcmVzb3VyY2VzLCBJJ20gYWZy
YWlkLg0KPg0KPiBIZXJlIHlvdSBqdXN0IG5lZWQgdG8gImdvdG8gb3V0X2ZyZWU7IiBpbnN0ZWFk
IG9mIG1hbnVhbCByZXNvdXJjZQ0KPiByZWxlYXNlcywgd2hpY2ggZXZlbnR1YWxseSBjYWxscyBz
bmRfY2FyZF9mcmVlKCksIGFuZCB0aGF0J3MgYWxsLg0KPg0KPiAoVGhvdWdoLCBwY2lfc2V0X2Ry
dmRhdGEocGNpLCBOVUxMKSBtaWdodCBiZSBzdGlsbCBtaXNzaW5nOyBidXQgaXQncw0KPiAgIG5v
dCBvbmx5IGZvciB0aGlzIGNoYW5nZSwgYW5kIHdlJ2xsIG5lZWQgdG8gYWRkcmVzcyBpdCBpbiBh
bm90aGVyDQo+ICAgcGF0Y2guKQ0KDQpnaXQgYW0gLS1zY2lzc29ycyBwYXRjaCBiZWxvdyBmb3Ig
Y2xlYW51cCBvZiBlcnJvciBwYXRoLg0KDQpJdCBzZWVtcyBhenhfZnJlZSB3aWxsIHVucmVnaXN0
ZXIgZnJvbSB2Z2Ffc3dpdGNoZXJvbyBzYWZlbHkuDQoNCi0tLS0tLS0tLS0tLT44LS0tDQoNCk1h
a2Ugc3VyZSBhenggaXMgZnJlZWQgYWZ0ZXIgYXp4X2NyZWF0ZSgpIHN1Y2NlZWRlZCBhbmQgYW4g
ZXJyb3Igd2FzDQplbmNvdW50ZXJlZC4NCg0KU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9y
c3Q8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KLS0tDQogIHNvdW5kL3BjaS9o
ZGEvaGRhX2ludGVsLmMgfCA3ICsrKysrLS0NCiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvaGRhX2lu
dGVsLmMgYi9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jDQppbmRleCA1YWYxMTM4ZTc0NWJjLi4x
OTZjYTc2YWM0M2FkIDEwMDY0NA0KLS0tIGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYw0KKysr
IGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYw0KQEAgLTIxNTAsNyArMjE1MCw3IEBAIHN0YXRp
YyBpbnQgYXp4X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwY2ksDQogIAllcnIgPSByZWdpc3Rlcl92
Z2Ffc3dpdGNoZXJvbyhjaGlwKTsNCiAgCWlmIChlcnIgPCAwKSB7DQogIAkJZGV2X2VycihjYXJk
LT5kZXYsICJFcnJvciByZWdpc3RlcmluZyB2Z2Ffc3dpdGNoZXJvbyBjbGllbnRcbiIpOw0KLQkJ
Z290byBvdXRfZnJlZTsNCisJCWdvdG8gb3V0X2F6eF9mcmVlOw0KICAJfQ0KICANCiAgCWlmIChj
aGVja19oZG1pX2Rpc2FibGVkKHBjaSkpIHsNCkBAIC0yMTY5LDcgKzIxNjksNyBAQCBzdGF0aWMg
aW50IGF6eF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLA0KICAJCQkJCSAgICAgICZwY2ktPmRl
diwgR0ZQX0tFUk5FTCwgY2FyZCwNCiAgCQkJCQkgICAgICBhenhfZmlybXdhcmVfY2IpOw0KICAJ
CWlmIChlcnIgPCAwKQ0KLQkJCWdvdG8gb3V0X2ZyZWU7DQorCQkJZ290byBvdXRfYXp4X2ZyZWU7
DQogIAkJc2NoZWR1bGVfcHJvYmUgPSBmYWxzZTsgLyogY29udGludWVkIGluIGF6eF9maXJtd2Fy
ZV9jYigpICovDQogIAl9DQogICNlbmRpZiAvKiBDT05GSUdfU05EX0hEQV9QQVRDSF9MT0FERVIg
Ki8NCkBAIC0yMTg3LDYgKzIxODcsOSBAQCBzdGF0aWMgaW50IGF6eF9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGNpLA0KICAJCWNvbXBsZXRlX2FsbCgmaGRhLT5wcm9iZV93YWl0KTsNCiAgCXJldHVy
biAwOw0KICANCitvdXRfYXp4X2ZyZWU6DQorCWF6eF9mcmVlKGNoaXApOw0KKwlwY2lfc2V0X2Ry
dmRhdGEocGNpLCBOVUxMKTsNCiAgb3V0X2ZyZWU6DQogIAlzbmRfY2FyZF9mcmVlKGNhcmQpOw0K
ICAJcmV0dXJuIGVycjsNCi0tIA0KMi4zOS4yDQoNCg==
