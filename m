Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6464F845
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2019 23:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5B79F6;
	Sat, 22 Jun 2019 23:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5B79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561238331;
	bh=NYmzLF/VKDjzAXAP44PeYgno/JTi60AU+GUlDSaVo2s=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVbecez9FQjzeINeSC5/7bcs88EEDQhmdQvtVjs3tVNeINhJgjI7sVe9y3mwb4C5p
	 1a+1/UgNZH5aT+o4F02vCBfUlQfIbmmQmvXyVjGuvtmjfThKjyYQ+VVqqOAHqC8rgm
	 j+EA9L1/zr6m5tc5uyV/L2/w+j9VZvPEAxTUA+zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC347F8971B;
	Sat, 22 Jun 2019 23:17:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 819DCF89717; Sat, 22 Jun 2019 23:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.hora-obscura.de (hora-obscura.de [213.133.109.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28D2EF8071F
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 23:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D2EF8071F
Received: from smtp.hora-obscura.de (localhost [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPS id 71E46AF8081
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 23:17:01 +0200 (CEST)
Received: from ada.local (ipbcc14466.dynamic.kabel-deutschland.de
 [188.193.68.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPSA id 4AABEAF8027
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 23:17:01 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <65ad9ddb-bb67-2dc0-d5f5-e0c518641db2@hora-obscura.de>
From: Stefan Sauer <ensonic@hora-obscura.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ensonic@hora-obscura.de; prefer-encrypt=mutual; keydata=
 mQGiBDiW1zARBADnMiXRu0ZRcbWAw4NefyeZej5pRX/mzBAvplIhAeJ5vA0zfzd3aIyAxYv1
 iA+/p7QwGVAMZ9Gio8ZLvgfDYjrHbez7Bc4TWuTck6hmQAIBI7ptyWhOrePMiQ8b4yN8KP7I
 PoJHBpC0jLbuwmwC+/2yQPT4V9AQ+Unqe8xvuBJczwCgnAo6JpYIZDpy/vt4soFG3o38OrME
 AOPzt7SdyuzVp9w3mO/2XCzyJcn1fpUGlChbljayKvrDvPJEZtm5d65zBV6iYSSpF8GtdX1q
 znSF5siMSvF7DljZT4oIDqYTJAEZXDYYM7aYyTXeZ1hk9YoiRaMiT84AvQRvQVwYUqlygNMO
 q14zkcdhSpk5i1HDum+i1/T/RSFDBACcpdlqjvg4AoMbyf9UNr/tmfcITEKkLkYtPzmF4DIK
 Tqbq+FgqB5ltPPgTffJ6yWfTQAt1dr+XZeivdgyCX3bo6784rtOc7/ICjBdOktKj6zb88tPp
 kYw16Fr5OcNollJxm+/pY+JXwAl5IsbN3ysoBuBOBbu+pAC1Py39D/+af7QvU3RlZmFuIEtv
 c3QgKGVuc29uaWMpIDxlbnNvbmljQGhvcmEtb2JzY3VyYS5kZT6IXwQTEQIAHwIbAwQLBwMC
 AxUCAwMWAgECHgECF4ACGQEFAkKMY0QACgkQITDA+qr9gcydpwCfbGuNpfw+hge7Xcp9FerJ
 35fMMY0An0vvOJG3ORIUHE1VvfoC0ITb6heFuQENBDiW11IQBACUp8q45lLmzHujYh7w8fd4
 cjkb57oScfcD+lliCOmKHZOxRa8Ew3ULtgSze1JPnDT6a5jgnxMKPIHjqlTCpEyTxcMHOi3L
 8BBft2YzdB3cLnrMXx1mPU//vkT93VOnXTFjxKbMEK8OHSh+JpzgySjmXfwVfn/EiyXkroEV
 Lip92wADBQP/ej1uwM//zfKumDRJskyMCOfSAUfwRZhHkLWPvBQfPgUqdU7NcYACItAFVbIK
 tSES1Vd3L0kbBtnygCf4SwGMRARUALipof4DxVMxaK46igLGC+UkiTz8swUV/81+EUfKEqdd
 QjRv6Gp7VZSDkv4sBcjIMydr8o2Mc8P/ByKvUPWIRgQYEQIABgUCOJbXUgAKCRAhMMD6qv2B
 zLilAJ4jS2hqfeEbZxvmr1+0FxBx2/x9CQCaA5vugvJQg8PXRT7ScAnoGgCf994=
Message-ID: <b6d20ef6-c7ed-8969-1778-b27894f028df@hora-obscura.de>
Date: Sat, 22 Jun 2019 23:17:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <65ad9ddb-bb67-2dc0-d5f5-e0c518641db2@hora-obscura.de>
Content-Language: en-US
Subject: Re: [alsa-devel] focusrite scarlett 18i20 : Mixer controls with
 corrupted names for
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

UXVpY2sgZm9sbG93dXAuIEhlcmUgaXMgdGhlIGxzdXNiIC12IG91dHB1dCBmb3IgdGhlIGRldmlj
ZToKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZW5zb25pYy8yZDI4NmE4NWJiZjRhY2EyNWU2ZjM2
YjM1Njk4NDljMwoKSSBub3RpY2VkIHR3byB3YXJuaW5nczoKV2FybmluZzogSnVuayBhdCBlbmQg
b2YgZGVzY3JpcHRvciAoMTcgYnl0ZXMpOgogICAgICAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIDAwIDAwCkNvdWxkIHRob3NlIGJlIHRoZSBjYXVzZT8gSSBk
b24ndCBub3cgaG93IHRvIG1hcCB0aGUgJ25hbWVpZCcgaW5kZXggdG8gYW55dGhpbmcKaW4gdGhl
IGxzdWIgb3V0cHV0IHRob3VnaC4KCkFtIDIyLjA2LjE5IHVtIDIyOjU1IHNjaHJpZWIgU3RlZmFu
IFNhdWVyOgo+IEhpLAo+IAo+IHdoZW4gSSBydW4KPiBhbWl4ZXIgLUQgaHc6NCBjb250cm9scyB8
IHNvcnQgLW4gLXQgPSAtazIKPiAKPiBJIGdldCB0aGUgb3V0cHV0IGJlbG93Cj4gCj4gbnVtaWQ9
MSxpZmFjZT1NSVhFUixuYW1lPSdLS0tLS0tLS0tLS0tLw4PDg8ODw4PDg8ODw4PDg8ODw4PDgyBT
d2l0Y2gnCj4gbnVtaWQ9MixpZmFjZT1DQVJELG5hbWU9J0ludGVybmFsIFZhbGlkaXR5Jwo+IG51
bWlkPTMsaWZhY2U9Q0FSRCxuYW1lPSdTL1BESUYgVmFsaWRpdHknCj4gbnVtaWQ9NCxpZmFjZT1D
QVJELG5hbWU9J0FEQVQgVmFsaWRpdHknCj4gbnVtaWQ9NSxpZmFjZT1NSVhFUixuYW1lPSdTY2Fy
bGV0dCAxOGkyMCBVU0ItU3luYyBDbG9jayBTb3VyY2UnCj4gbnVtaWQ9NixpZmFjZT1NSVhFUixu
YW1lPScgU3dpdGNoJwo+IG51bWlkPTcsaWZhY2U9Q0FSRCxuYW1lPSdLZWVwIEludGVyZmFjZScK
PiBudW1pZD04LGlmYWNlPU1JWEVSLG5hbWU9J01hc3RlciBQbGF5YmFjayBTd2l0Y2gnCj4gbnVt
aWQ9OSxpZmFjZT1NSVhFUixuYW1lPSdNYXN0ZXIgUGxheWJhY2sgVm9sdW1lJwo+IG51bWlkPTEw
LGlmYWNlPU1JWEVSLG5hbWU9J01hc3RlciAxIChNb25pdG9yKSBQbGF5YmFjayBTd2l0Y2gnCj4g
bnVtaWQ9MTEsaWZhY2U9TUlYRVIsbmFtZT0nTWFzdGVyIDEgKE1vbml0b3IpIFBsYXliYWNrIFZv
bHVtZScKPiAuLi4gbG90cyBvZiBleHRyYSBsaW5lcyAuLi4KPiAKPiBQbGVhc2Ugbm90ZSB0aGUg
bGluZXMgZm9yIG51bWlkPTEgYW5kIG51bWlkPTYuIFRoZSBmaXJzdCBvbmUgY29udGFpbnMgc29t
ZQo+IGdhcmJhZ2UgYW5kIHRoZSAybmQgb25lIGxvb2sgbGlrZSBpdCBzaG91bGQgc3RhcnQgd2l0
aCBhbm90aGVyIHdvcmQuCj4gCj4gSSBub3cgYWRkZWQgc29tZSBkZWJ1ZyBwcmludGluZyBoZXJl
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9zb3VuZC91
c2IvbWl4ZXJfc2NhcmxldHQuYyNMNTYyCj4gCj4gYW5kIGdldCBvdXRwdXQgaW4gZG1lc2c6Cj4g
WyAyOTcxLjY0MjEzN10gdXNiIDEtMjogUHJvZHVjdDogU2NhcmxldHQgMThpMjAgVVNCCj4gWyAy
OTcxLjY0MjE0MV0gdXNiIDEtMjogTWFudWZhY3R1cmVyOiBGb2N1c3JpdGUKPiBbIDI5NzEuNzA5
NzczXSBuZXcgY3RybDogbmFtZT0nTWFzdGVyIFBsYXliYWNrIFN3aXRjaCcsIGluZGV4PTEwLCBv
ZmZzZXQ9MSwKPiBudW09MDogbnVtaWQ9OAo+IFsgMjk3MS43MDk3ODFdIG5ldyBjdHJsOiBuYW1l
PSdNYXN0ZXIgUGxheWJhY2sgVm9sdW1lJywgaW5kZXg9MTAsIG9mZnNldD0yLAo+IG51bT0wOiBu
dW1pZD05Cj4gWyAyOTcxLjcwOTc4OF0gbmV3IGN0cmw6IG5hbWU9J01hc3RlciAxIChNb25pdG9y
KSBQbGF5YmFjayBTd2l0Y2gnLCBpbmRleD0xMCwKPiBvZmZzZXQ9MSwgbnVtPTE6IG51bWlkPTEw
Cj4gCj4gU28gdGhlIGZpcnN0IDggY29udHJvbHMgYXJlIGFkZGVkIHNvbWV3aGVyZSBlbHNlLiBM
b29rcyBsaWtlIHRoaXMgaXMgZnJvbQo+IG1peGVyLmMgYW5kIGFmdGVyCj4gZWNobyAtbiAnZmls
ZSBzb3VuZC91c2IvbWl4ZXIuYyArcCcgPi9zeXMva2VybmVsL2RlYnVnL2R5bmFtaWNfZGVidWcv
Y29udHJvbAo+IEkgZ2V0Cj4gWyA0NDA1Ljg1NTQzMl0gdXNiIDEtMjogWzUxXSBQVSBbS0tLS0tL
S0tLS0tLS8ODw4PDg8ODw4PDg8ODw4PDg8ODw4MgU3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQo+
IFsgNDQwNS44NTY0MjNdIHVzYiAxLTI6IFs1Ml0gUFUgWyBTd2l0Y2hdIGNoID0gMSwgdmFsID0g
MC8xCj4gCj4gSSBub3cgYWRkZWQgbW9yZSBkZWJ1ZyBwcmludHMgaW50bwo+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9zb3VuZC91c2IvbWl4ZXIuYyNMMjQz
MQo+IGFuZCBpdHMgdGhlIGNvZGUgdGhhdCBjYWxscyBzbmRfdXNiX2NvcHlfc3RyaW5nX2Rlc2Mo
KQo+IFsgNTc1MC4xMjQxMjNdIHVzYiAxLTI6IG5hbWVpZD05MCwgbGVuPTM1Cj4gWyA1NzUwLjEy
NDE1N10gdXNiIDEtMjogWzUxXSBQVSBbS0tLS0tLS0tLS0tLS8ODw4PDg8ODw4PDg8ODw4PDg8OD
w4MgU3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQo+IFsgNTc1MC4xMjUyNDFdIHVzYiAxLTI6IG5h
bWVpZD04MiwgbGVuPTEKPiBbIDU3NTAuMTI1MjYwXSB1c2IgMS0yOiBbNTJdIFBVIFsgU3dpdGNo
XSBjaCA9IDEsIHZhbCA9IDAvMQo+IAo+IEluIGJvdGggY2FzZXMgdGhlIHJldHVybmVkIGxlbiBz
ZWVtcyB3cm9uZyBhbmQgdGhlIGZ1bmN0aW9uIGRvZXMgbm90IHNlZW1zIHRvCj4gY29weSBhbnkg
dXNlZnVsIHN0cmluZyBoZXJlLiBzbmRfdXNiX2NvcHlfc3RyaW5nX2Rlc2MoKSBpcyBqdXN0IGEg
d3JhcHBlciBhcm91bmQKPiB1c2Jfc3RyaW5nKCkuCj4gCj4gSXMgbXkgaGFyZHdhcmUgcmV0dXJu
aW5nIGJvZ3VzIGRhdGEgaW4gdXNiIGRlc2NyaXB0b3JzPyBDYW4gdGhpcyBiZSBhZGRyZXNzCj4g
dGhyb3VnaCBzb21lIHF1aXJrcyB0YWJsZT8gQW55IG90aGVyIGlkZWFzPwo+IAo+IFRoYW5rcyEK
PiBTdGVmYW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
