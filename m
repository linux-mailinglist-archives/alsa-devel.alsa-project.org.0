Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D497867B23
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 17:07:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD34C93A;
	Mon, 26 Feb 2024 17:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD34C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708963635;
	bh=ZMvhZigKuKizMrr0+h6O1c74ooBKprA2K+gnUVNhca0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aSnaZFr93TSFzkJG8wImu92lONk2r0FIs46yQDNzkk+UtolWygKgZThKJCYLohrPc
	 BiiCl6zgMNXKiKLef7sjDVlBuAjzG8gaOZQAsOtgXxLux+1MpDcJqFgXRn/BGeFxLS
	 cqKCay6QvOM5JSXNwnV71AFycdDV1tURnCWUurIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B16BF805D8; Mon, 26 Feb 2024 17:06:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F7E8F805D2;
	Mon, 26 Feb 2024 17:06:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4547EF805B0; Mon, 26 Feb 2024 17:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AA3FF800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 17:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA3FF800EE
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1redUb-009ZDO-Lw
	for alsa-devel@alsa-project.org; Mon, 26 Feb 2024 17:06:15 +0100
Received: from [192.168.1.114] (unknown [81.56.27.113])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id D167C4114D69F;
	Mon, 26 Feb 2024 17:06:12 +0100 (CET)
Message-ID: <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
Date: Mon, 26 Feb 2024 17:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Content-Language: en-US
To: Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <20240121140748.GA189921@workstation.local>
X-PPP-Message-ID: 
 <170896357314.440.2463217463659254382@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.10)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/ZX9pzGbOLmFDKP/QbwBYxPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wI8D5AnkcPR12/sl/nlqnGQ20HGDJnwk8BgzAUpYTUGKvp
 k7Vp2UXVHEQMIct0liJeX+1E2VE+xLsqWN7BcNgrswKQDamPN66SYe4XX4xmgH2v3XHcLfYVm1AF
 3hBI4lDweCYd+Pti7NQuPnSsszdrH0jOUgbT0uDDCNY2+Z8PMWCRC2LG4du+X8C3LzFXKuqIUp8P
 WMqBh8f7pLmoNVignRcU13vKFuQB0fNH+nnai9KGSUcZ6/+b2n7v0x3WCwTBPeWxfLTyo52lpUOn
 40xHoOAmb0xgXrrQKITtclJwwjxIPj1UU4msT2Odp9D6f/Om/kpOWQV1ILff1+qZar/CZdONW7YG
 NNLfGcEBhKT67v65ZMCDoMTi5uYdb/tvVuyNIoXKWjqHYxwfyv7IH2ggcd3QbXHil9nVohJvu6B5
 vcQRHhpp7PEHhQA50A06367BY8gmSRYkecci5wsYTNB2xQ0nfMeJr16/UsQutzu7g8kF+erhf12H
 AM8q90V8u0zXzXmHaN80JC+nfH561Te/6BtpbmdpMLvM58ZB4GVvZfvg7iEFLP+SSY+Av5+AiC6T
 1bK3QY/Xy/VMlZePtQsWg0NXAbdW9A3m+QN4CRcyTVkoDFRB/hnHYGXgnG9lqE2T7UVZD68nyrOg
 wO0GKtxt3Yysz5cH7Z2gctHoTvfY4sMR3pimW+H6hrLs7bihM+ep7Sq+vnK5vq335GkOmYDofi+D
 72jwvMDtszTIjsvGsa3MqZaw2oi92txmVDHMKlVxYnc5NSfLNJqHNS++ZtKfFktR5vxtvZbZMvkJ
 BBSEoVz1pRXWhjh9fdbl44I0Df0mnUwpn9+YJNgQ7FrKbMtetEGtlboXRpWdg1LYRH62vJGe89S2
 Xk8K1Cvg9piULZgZ99SJ6uKkUf5M3Jzws9T5lytEm0FsoVMbQAvNVvOMmZiTSRQA2iRjCMBEzOUL
 WJfIPXKGZQGLkuglJTefsXl+j3JiOSC6vtxuYy/MBLIoEUTnNXOff6MO7Fv8YHY7U3v3BNW5sZZT
 h+DsL7XEzJe3I8t6GjEph19oonzaoOZ+Hw==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: 7GJNFACBKLWUCTUVZMXZJCBFHBOT3DPJ
X-Message-ID-Hash: 7GJNFACBKLWUCTUVZMXZJCBFHBOT3DPJ
X-MailFrom: michele.perrone@weiss.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GJNFACBKLWUCTUVZMXZJCBFHBOT3DPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KSSdtIHZlcnkgc29ycnkgZm9yIG15IGxhdGUgcmVwbHkuDQoNCllvdSBh
cmUgY29ycmVjdCBhYm91dCB0aGUgYXZhaWxhYmxlIGlucHV0IGFuZCBvdXRwdXRzLCBidXQgSSdt
IG5vdCBzdXJlIA0KdGhhdCBJIHVuZGVyc3RhbmQgeW91ciByb3V0aW5nIHNjaGVtZSB2ZXJ5IHdl
bGwuDQoNCiAgKiBUaGUgY3VycmVudGx5IGFjdGl2ZSBkaWdpdGFsIGlucHV0IGNhbiBiZSBzZWxl
Y3RlZCB3aXRoICJEaWdpdGFsDQogICAgSW5wdXQgQ2FwdHVyZSBSb3V0ZSIsIGxpa2UgdGhpczoN
CiAgICAgIG8gQUVTL0VCVTogYW1peGVyIC1jIDAgY3NldCBudW1pZD0zLGlmYWNlPU1JWEVSLG5h
bWU9J0RpZ2l0YWwNCiAgICAgICAgSW5wdXQgQ2FwdHVyZSBSb3V0ZScgMA0KICAgICAgbyBTL1BE
SUYgUkNBOiBhbWl4ZXIgLWMgMCBjc2V0IG51bWlkPTMsaWZhY2U9TUlYRVIsbmFtZT0nRGlnaXRh
bA0KICAgICAgICBJbnB1dCBDYXB0dXJlIFJvdXRlJyAxDQogICAgICBvIFMvUERJRiB0b3NsaW5r
OiBhbWl4ZXIgLWMgMCBjc2V0DQogICAgICAgIG51bWlkPTMsaWZhY2U9TUlYRVIsbmFtZT0nRGln
aXRhbCBJbnB1dCBDYXB0dXJlIFJvdXRlJyAyDQogICAgICAgIFdoZW4gcGxheWluZyBzb3VuZCBm
cm9tIHN0cmVhbSBpbnB1dCwgaXQgZG9lc24ndCBtYWtlIGFueQ0KICAgICAgICBkaWZmZXJlbmNl
IHdoaWNoIG9uZSB0aGUgYWJvdmUgaXMgY3VycmVudGx5IHNlbGVjdGVkLg0KICAqIFRoZSBjbG9j
ayBjYW4gYmUgc2VsZWN0ZWQgaW5kZXBlbmRlbnRseSBmcm9tIHRoZSBjdXJyZW50IGlucHV0IHdp
dGgNCiAgICBBVi9DIFsxXS4NCiAgKiBUaGUgMi1jaGFubmVsIG91dHB1dCBjYW4gYmUgcm91dGVk
IHRvIGFsbCB0aGUgZGlnaXRhbCBhbmQgYW5hbG9nDQogICAgb3V0cHV0cyBzaW11bHRhbmVvdXNs
eSAoYnV0IGFuYWxvZyBvdXRwdXRzIGFyZSBvbmx5IGF2YWlsYWJsZSBpZiB0aGUNCiAgICBEQUMg
aXMgY29ubmVjdGVkKS4NCiAgICBPbmUgY2FuIGNob29zZSB3aGljaCBvdXRwdXRzIGFyZSBhY3Rp
dmUgb3Igbm90IHdpdGggdGhlICJPdXRwdXQNCiAgICBQbGF5YmFjayBTd2l0Y2giOg0KICAgICAg
byBBRVMvRUJVIG9uOiBhbWl4ZXIgLWMgMCBjc2V0IG51bWlkPTYsaWZhY2U9TUlYRVIsbmFtZT0n
WExSOjpYTFINCiAgICAgICAgT3V0cHV0IFBsYXliYWNrIFN3aXRjaCcgMQ0KICAgICAgICBBRVMv
RUJVIG9mZjogYW1peGVyIC1jIDAgY3NldCBudW1pZD02LGlmYWNlPU1JWEVSLG5hbWU9J1hMUjo6
WExSDQogICAgICAgIE91dHB1dCBQbGF5YmFjayBTd2l0Y2gnIDANCiAgICAgIG8gUy9QRElGIFJD
QSBvbjogYW1peGVyIC1jIDAgY3NldA0KICAgICAgICBudW1pZD03LGlmYWNlPU1JWEVSLG5hbWU9
J1JDQTo6UkNBIE91dHB1dCBQbGF5YmFjayBTd2l0Y2gnIDENCiAgICAgICAgUy9QRElGIFJDQSBv
ZmY6IGFtaXhlciAtYyAwIGNzZXQNCiAgICAgICAgbnVtaWQ9NyxpZmFjZT1NSVhFUixuYW1lPSdS
Q0E6OlJDQSBPdXRwdXQgUGxheWJhY2sgU3dpdGNoJyAwDQogICAgICBvIERBQyBvbjogYW1peGVy
IC1jIDAgY3NldCBudW1pZD0xMCxpZmFjZT1NSVhFUixuYW1lPSdEQUM6OkRBQw0KICAgICAgICBP
dXRwdXQgUGxheWJhY2sgU3dpdGNoJyAxDQogICAgICAgIERBQyBvZmY6IGFtaXhlciAtYyAwIGNz
ZXQgbnVtaWQ9MTAsaWZhY2U9TUlYRVIsbmFtZT0nREFDOjpEQUMNCiAgICAgICAgT3V0cHV0IFBs
YXliYWNrIFN3aXRjaCcgMA0KICAqIFRoZXJlIGlzIG5vIGhhcmR3YXJlIG1peGVyIGNhcGFiaWxp
dHksIGkuZS4gdGhlIGlucHV0cyBjYW5ub3QgYmUNCiAgICByb3V0ZWQgZGlyZWN0bHkgdG8gdGhl
IG91dHB1dHMuDQoNCk91ciBwcmVhbXAgbW9kZSB3b3JrcyBsaWtlIHRoaXM6DQoNCiAxLiBBIGRp
Z2l0YWwgaW5wdXQgc291cmNlIGlzIHNlbGVjdGVkIHdpdGggQVYvQyAoVG9zbGluaywgb3IgUkNB
LCBvcg0KICAgIFhMUiksIGkuZS4gd2l0aCAiRGlnaXRhbCBJbnB1dCBDYXB0dXJlIFJvdXRlIg0K
IDIuIENsb2NrIGlucHV0IHNvdXJjZSBpcyBzZXQgdG8gdGhlIHNhbWUgYXMgYXVkaW8gaW5wdXQg
c291cmNlIHdpdGgNCiAgICBBVi9DIFsxXQ0KIDMuIERJQ0UgY2xvY2sgcmF0ZSBpcyBzZXQgdG8g
ZXh0ZXJuYWwgY2xvY2sgcmF0ZSBbMl0NCiA0LiBBIHNpbXBsZSAyLWNoYW5uZWwgQUxTQSBsb29w
YmFjayB3aXRoIGRpZ2l0YWwgdm9sdW1lIGNvbnRyb2wgaXMNCiAgICBjcmVhdGVkIGJldHdlZW4g
aW5wdXQgYW5kIG91dHB1dA0KDQpJIGhvcGUgdGhpcyBhbnN3ZXJzIHlvdXIgcXVlc3Rpb25zLCBv
dGhlcndpc2UgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpLaW5kIHJlZ2FyZHMsDQpNaWNoZWxlIFBl
cnJvbmUNCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS93ZWlzcy1lbmdpbmVlcmluZy9zbmQtZGlj
ZS9ibG9iL2F2Yy9kaWNlLWF2Yy5jI0w0NzQNClsyXSBodHRwczovL2dpdGh1Yi5jb20vd2Vpc3Mt
ZW5naW5lZXJpbmcvc25kLWRpY2UvYmxvYi9hdmMvZGljZS1hdmMuYyNMNTQ5DQoNCk9uIDIxLzAx
LzI0IDE1OjA3LCBUYWthc2hpIFNha2Ftb3RvIHdyb3RlOg0KPiBIaSBNaWNoZWxlIFBlcnJvbmUs
IE1pY2hlbGUgUGVycm9uZSwNCj4NCj4gSSByZXN0YXJ0IG15IHdvcmsgdG8gc3VwcG9ydCBXZWlz
cyBtb2RlbHNbMV0gYXMgSSBoYXZlIGVub3VnaCB0aW1lIGFmdGVyDQo+IHNvbWUgdGFza3MuIEFm
dGVyIGltcGxlbWVudGluZyBjb250cm9sIGVsZW1lbnRzIGZvciB5b3VyIE1BTjMwMSwgSSBoYXZl
DQo+IHNvbWUgcXVlc3Rpb25zIGFib3V0IGludGVybmFsIHJvdXRpbmcuIFdvdWxkIEkgYXNrIHlv
dXIgYWR2aWNlcyBhYm91dA0KPiB0aGVtPw0KPg0KPiBJIHRoaW5rIHRoZSBtb2RlbCBoYXMgYmVs
b3cgaW5wdXRzL291dHB1dHMuDQo+DQo+ICogaW5wdXRzDQo+ICAgICAqIHNwZGlmLW9wdC1pbnB1
dC0xLzINCj4gICAgICogc3BkaWYtY29heC1pbnB1dC0xLzINCj4gICAgICogYWVzZWJ1LXhsci1p
bnB1dC0xLzINCj4gICAgICogc3RyZWFtLWlucHV0LTEvMg0KPiAqIG91dHB1dHM6DQo+ICAgICAq
IHN0cmVhbS1vdXRwdXQtMS8yDQo+ICAgICAqIHNwZGlmLWNvYXgtb3V0cHV0LTEvMg0KPiAgICAg
KiBhZXNlYnUteGxyLW91dHB1dC0xLzINCj4gICAgICogYW5hbG9nLXhsci1vdXRwdXQtMS8yDQo+
ICAgICAqIGFuYWxvZy1jb2F4LW91dHB1dC0xLzINCj4NCj4gQW5kIGF0IHByZXNlbnQgSSBndWVz
cyBpdHMgaW50ZXJuYWwgcm91dGluZyBpcyBsaWtlWzJdOg0KPg0KPiBgYGANCj4gc3BkaWYtb3B0
LWlucHV0LTEvMiAgLS0tKw0KPiBzcGRpZi1jb2F4LWlucHV0LTEvMiAtLShvciktLT4gZGlnaXRh
bC1pbnB1dC0xLzIgLS0tLS0tLS0tLS0tLS0tLS0+IHN0cmVhbS1vdXRwdXQtMS8yDQo+IGFlc2Vi
dS14bHItaW5wdXQtMS8yIC0tLSsgICAgICAgICAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2DQo+IHN0cmVhbS1pbnB1dC0xLzIgLS0tLS0tLS0tLS0tLS0t
LS0tLS0ob3IpLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT4gc3BkaWYtY29heC1vdXRwdXQtMS8y
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0+IGFlc2VidS14bHItb3V0cHV0LTEvMg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICstLWFuYWxvZy1vdXRwdXQtMS8yIC0tPiBhbmFs
b2cteGxyLW91dHB1dC0xLzINCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLT4gYW5hbG9nLWNvYXgtb3V0cHV0LTEvMg0K
PiBgYGANCj4NCj4gVGhlbiBJIGhhdmUgc29tZSBxdWVzdGlvbnMuDQo+DQo+IDEuIFRoZSBzaWdu
YWwgc291cmNlIGRlc2lnbmF0ZWQgZm9yIHN0cmVhbS1vdXRwdXQtMS8yDQo+IEkgdGhpbmsgaXQg
aXMgYW55IHR5cGUgb2YgZGlnaXRhbCBpbnB1dCBkZXNpZ25hdGVkIGJ5IGNvbnRyb2wgZWxlbWVu
dA0KPiAiRGlnaXRhbCBJbnB1dCBDYXB0dXJlIFJvdXRlIiwgb3Igc291cmNlIElEIGJsb2NrIHdo
aWNoIGdlbmVyYXRlcw0KPiBzaWxlbmNlLg0KPg0KPiAyLiBUaGUgc2lnbmFsIHNvdXJjZXMgZGVz
aWduYXRlZCBmb3IgdGhlIG91dHB1dHMNCj4gQWNjb3JkaW5nIHRvIHRoZSBtYW51YWwgb2YgTUFO
MzAxLCB0aGUgc291cmNlcyBhcmUgc2VsZWN0YWJsZSBzb21laG93Lg0KPiBUaGVyZSBhcmUgdHdv
IHdheXMgYXQgbGVhc3QgZm9yIHByZS1hbXAgYW5kIHBsYXllciBtb2Rlcy4gSSBndWVzcyB0aGF0
DQo+IGFueSBpbnRlcmZhY2UgaXMgZGVmaW5lZCB0byBjb25maWd1cmUgaW50ZXJuYWwgcm91dGVy
IGZvciB0aGUgcHVycG9zZS4NCj4NCj4gWzFdaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVj
dC9zbmQtZmlyZXdpcmUtY3RsLXNlcnZpY2VzL3RyZWUvdG9waWMvd2Vpc3Mtc3VwcG9ydA0KPiBb
Ml1odHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L3NuZC1maXJld2lyZS1jdGwtc2Vydmlj
ZXMvYmxvYi90b3BpYy93ZWlzcy1zdXBwb3J0L3Byb3RvY29scy9kaWNlL3NyYy93ZWlzcy9hdmMu
cnMjTDEyDQo+DQo+DQo+IFRoYW5rcw0KPg0KPiBUYWthc2hpIFNha2Ftb3Rv
