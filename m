Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3E8B1C46
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 09:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BB3E66;
	Thu, 25 Apr 2024 09:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BB3E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714031710;
	bh=vRBK1tGIksdvmEJ3yyacPeqvBEzSzzKwG56ZNfZ+3nU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PwLVH4sOmL2G+qN2qcuAC+MDQl5QNVH/jCl+v91lKVNiwLstPehAO1MwVlblRCptD
	 5vCu+zhGF81mloRS6ODXBndKvYbWx4qMAMF2T/9/4mHkil70YQRHEnBhcb4MJlGkrH
	 WCQJMLPp1hVzGmhhugtcMXE0xV7VB4beOrdKTCmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6EF7F805AD; Thu, 25 Apr 2024 09:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC9CF80548;
	Thu, 25 Apr 2024 09:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83132F80423; Thu, 25 Apr 2024 09:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BC0EF8003A
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 09:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC0EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=sz4QI7xG
Received: from [192.168.1.152] (unknown [222.129.33.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B0B3F3F950;
	Thu, 25 Apr 2024 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714031665;
	bh=2U4eh3Qpu+E6acBnezi9TrCzbonPPfKsJhHsj7XAieM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To;
	b=sz4QI7xGc4f9Ph1zobEDx+DUTLewodGxEq5Lw8ACvGKstNGLGgYjXmszQSWdeMC+8
	 kbaiR7HP+T3mWOR53W+mODWaZFXGeKN1hdIlS2aKwLPDSXrG4uNFxHRd+QTyG9zojL
	 UGQrNZme/RzkSQM2wQiRp0fQBDwfkuUP6kkZmLrFZb1FFSUI61ilN+jxQDlQtSIPYS
	 +QRONeAzTZ9HHItghdaCCrTgjsxoaGRZx/DKHRL0aAEisFc4gpsGibHScB2Y45Z9eW
	 USfBZntLPecRnVP+N26v1Aq5k6vfSC5gyRbPEnEiQvDuR7XYAPx/Pqm+00XyP8+4xm
	 Eyw79uy2/PycA==
Message-ID: <3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
Date: Thu, 25 Apr 2024 15:54:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com
References: <20240425072000.22284-1-aaron.ma@canonical.com>
 <87h6fpc21p.wl-tiwai@suse.de>
Content-Language: en-US
From: Aaron Ma <aaron.ma@canonical.com>
Autocrypt: addr=aaron.ma@canonical.com; keydata=
 xsBNBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAHNIUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPsLAdwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrazsBNBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAHCwF8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
In-Reply-To: <87h6fpc21p.wl-tiwai@suse.de>
Message-ID-Hash: AX4SOUV2E55SJ4XMYH4MN3IJEIUNLGL4
X-Message-ID-Hash: AX4SOUV2E55SJ4XMYH4MN3IJEIUNLGL4
X-MailFrom: aaron.ma@canonical.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AX4SOUV2E55SJ4XMYH4MN3IJEIUNLGL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA0LzI1LzI0IDE1OjUyLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+IE9uIFRodSwgMjUgQXBy
IDIwMjQgMDk6MjA6MDAgKzAyMDAsDQo+IEFhcm9uIE1hIHdyb3RlOg0KPj4gVEkgdXBzdHJlYW0g
dGhlIGZpbGVzIGluIHRpL3RhczI3ODEgZm9yIGxpbnV4LWZpcm13YXJlLg0KPj4gTWFrZSB0aGUg
ZHJpdmVyIGZpbmQgdGhlIGNvcnJlY3QgZmlsZXMuDQo+IE5vdGUgdGhhdCB0aGUgdXBzdHJlYW0g
bGludXgtZmlybXdhcmUgcHJvdmlkZXMgc3ltbGlua3MgdG8NCj4gdGkvdGFzMjc4MS8qIGZpbGVz
LCBzbyBpdCdzIG5vdCAiaW5jb3JyZWN0Iiwgc28gZmFyIDopDQoNCiQgZmluZCAuIC1pbmFtZSBU
SUFTMjc4MVJDQTIuYmluDQouL3RpL3RhczI3ODEvVElBUzI3ODFSQ0EyLmJpbg0KDQpPbmx5IG9u
ZSBiaW4gZmlsZSBmb3VuZC4NCkNvdWxkIHlvdSBwb2ludCBpdCBvdXQgY2xlYXJseT8NCg0KVGhh
bmtzLA0KQWFyb24NCg0KPg0KPg0KPiB0aGFua3MsDQo+DQo+IFRha2FzaGkNCj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEFhcm9uIE1hPGFhcm9uLm1hQGNhbm9uaWNhbC5jb20+DQo+PiAtLS0NCj4+ICAg
aW5jbHVkZS9zb3VuZC90YXMyNzgxLmggICAgICAgICAgIHwgMSArDQo+PiAgIHNvdW5kL3BjaS9o
ZGEvdGFzMjc4MV9oZGFfaTJjLmMgICB8IDIgKy0NCj4+ICAgc291bmQvc29jL2NvZGVjcy90YXMy
NzgxLWNvbWxpYi5jIHwgMiArLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC90YXMy
NzgxLmggYi9pbmNsdWRlL3NvdW5kL3RhczI3ODEuaA0KPj4gaW5kZXggOTljYTNlNDAxZmQxLi43
MjExOWNjMzJjMGYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3NvdW5kL3RhczI3ODEuaA0KPj4g
KysrIGIvaW5jbHVkZS9zb3VuZC90YXMyNzgxLmgNCj4+IEBAIC0yMSw2ICsyMSw3IEBADQo+PiAg
IC8qIHZlcnNpb24gbnVtYmVyICovDQo+PiAgICNkZWZpbmUgVEFTMjc4MV9EUlZfVkVSCQkJMQ0K
Pj4gICAjZGVmaW5lIFNNQVJUQU1QX01PRFVMRV9OQU1FCQkidGFzMjc4MSINCj4+ICsjZGVmaW5l
IFRBUzI3ODFfRklSTVdBUkVfUk9PVAkJInRpL3RhczI3ODEvIg0KPj4gICAjZGVmaW5lIFRBUzI3
ODFfR0xPQkFMX0FERFIJMHg0MA0KPj4gICAjZGVmaW5lIFRBUzI1NjNfR0xPQkFMX0FERFIJMHg0
OA0KPj4gICAjZGVmaW5lIFRBU0RFVklDRV9SQVRFUwkJCShTTkRSVl9QQ01fUkFURV80NDEwMCB8
XA0KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvdGFzMjc4MV9oZGFfaTJjLmMgYi9zb3Vu
ZC9wY2kvaGRhL3RhczI3ODFfaGRhX2kyYy5jDQo+PiBpbmRleCA3NWY3Njc0YzY2ZWUuLjcyZGMx
NDY5NjU1ZiAxMDA2NDQNCj4+IC0tLSBhL3NvdW5kL3BjaS9oZGEvdGFzMjc4MV9oZGFfaTJjLmMN
Cj4+ICsrKyBiL3NvdW5kL3BjaS9oZGEvdGFzMjc4MV9oZGFfaTJjLmMNCj4+IEBAIC02NDksNyAr
NjQ5LDcgQEAgc3RhdGljIHZvaWQgdGFzZGV2X2Z3X3JlYWR5KGNvbnN0IHN0cnVjdCBmaXJtd2Fy
ZSAqZm13LCB2b2lkICpjb250ZXh0KQ0KPj4gICAJdGFzZGV2aWNlX2RzcF9yZW1vdmUodGFzX3By
aXYpOw0KPj4gICANCj4+ICAgCXRhc19wcml2LT5md19zdGF0ZSA9IFRBU0RFVklDRV9EU1BfRldf
UEVORElORzsNCj4+IC0Jc2NucHJpbnRmKHRhc19wcml2LT5jb2VmX2JpbmFyeW5hbWUsIDY0LCAi
VEFTMlhYWCUwNFguYmluIiwNCj4+ICsJc2NucHJpbnRmKHRhc19wcml2LT5jb2VmX2JpbmFyeW5h
bWUsIDY0LCAiJXNUQVMyWFhYJTA0WC5iaW4iLCBUQVMyNzgxX0ZJUk1XQVJFX1JPT1QsDQo+PiAg
IAkJY29kZWMtPmNvcmUuc3Vic3lzdGVtX2lkICYgMHhmZmZmKTsNCj4+ICAgCXJldCA9IHRhc2Rl
dmljZV9kc3BfcGFyc2VyKHRhc19wcml2KTsNCj4+ICAgCWlmIChyZXQpIHsNCj4+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL3RhczI3ODEtY29tbGliLmMgYi9zb3VuZC9zb2MvY29kZWNz
L3RhczI3ODEtY29tbGliLmMNCj4+IGluZGV4IDNhYTgxNTE0ZGFkNy4uOTZmZTFiODU1ZWM5IDEw
MDY0NA0KPj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy90YXMyNzgxLWNvbWxpYi5jDQo+PiArKysg
Yi9zb3VuZC9zb2MvY29kZWNzL3RhczI3ODEtY29tbGliLmMNCj4+IEBAIC0yNzcsNyArMjc3LDcg
QEAgaW50IHRhc2NvZGVjX2luaXQoc3RydWN0IHRhc2RldmljZV9wcml2ICp0YXNfcHJpdiwgdm9p
ZCAqY29kZWMsDQo+PiAgIAkgKi8NCj4+ICAgCW11dGV4X2xvY2soJnRhc19wcml2LT5jb2RlY19s
b2NrKTsNCj4+ICAgDQo+PiAtCXNjbnByaW50Zih0YXNfcHJpdi0+cmNhX2JpbmFyeW5hbWUsIDY0
LCAiJXNSQ0ElZC5iaW4iLA0KPj4gKwlzY25wcmludGYodGFzX3ByaXYtPnJjYV9iaW5hcnluYW1l
LCA2NCwgIiVzJXNSQ0ElZC5iaW4iLCBUQVMyNzgxX0ZJUk1XQVJFX1JPT1QsDQo+PiAgIAkJdGFz
X3ByaXYtPmRldl9uYW1lLCB0YXNfcHJpdi0+bmRldik7DQo+PiAgIAljcmM4X3BvcHVsYXRlX21z
Yih0YXNfcHJpdi0+Y3JjOF9sa3BfdGJsLCBUQVNERVZJQ0VfQ1JDOF9QT0xZTk9NSUFMKTsNCj4+
ICAgCXRhc19wcml2LT5jb2RlYyA9IGNvZGVjOw0KPj4gLS0gDQo+PiAyLjM0LjENCj4+DQo=
