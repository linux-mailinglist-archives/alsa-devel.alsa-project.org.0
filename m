Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6034FB48
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 13:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D5931614;
	Sun, 23 Jun 2019 13:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D5931614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561289416;
	bh=uHrxZtRs+yj2FAvzveVcTcvOPzdW5JJaBoEBw1x7/l4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gumfvLob2zk9LVOlrxQjqnolcVZcASf9e2iqi3jFS+fpJ7JcedE+QOjP9/nohfBOX
	 n7i+OnEGd+cYH2qbcoumXxhXA2N8l5uA355RnXOw7fv7bNLz9tS6MP1Ft6drY/tUFz
	 zZqGD+pdpTOuk3ENkWHF5JFRjRxBkj6VLwUd8bWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48099F896EA;
	Sun, 23 Jun 2019 13:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41FD8F896F0; Sun, 23 Jun 2019 13:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.hora-obscura.de (hora-obscura.de [213.133.109.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A6EF8065D
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 13:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A6EF8065D
Received: from smtp.hora-obscura.de (localhost [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPS id 318C3AF824F
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 13:28:21 +0200 (CEST)
Received: from ada.local (ipbcc14466.dynamic.kabel-deutschland.de
 [188.193.68.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPSA id 07769AF80B9
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 13:28:20 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <65ad9ddb-bb67-2dc0-d5f5-e0c518641db2@hora-obscura.de>
 <b6d20ef6-c7ed-8969-1778-b27894f028df@hora-obscura.de>
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
Message-ID: <e368c7c0-213a-8053-108b-f179846b7177@hora-obscura.de>
Date: Sun, 23 Jun 2019 13:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b6d20ef6-c7ed-8969-1778-b27894f028df@hora-obscura.de>
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

QW5vdGhlciBmb2xsb3d1cC4gSSBtYWRlIGEgbGl0dGxlIHB5dGhvbiB0b29sIHRvIGR1bXAgYWxs
IHN0cmluZyBkZXNjcmlwdG9ycyB2aWEKcHl1c2IgLSBoZXJlIGlzIHRoZSBjb2RlIGFuZCB0aGUg
b3V0cHV0IGZvciB0aGUgZGV2aWNlLiBObyBpZGVhIHdoeSBsc3VzYiBoaWRlcwpzdHJpbmcgZGVz
Y3JpcHRvcnMuCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Vuc29uaWMvMDBmYTM0NGEwNWM4NzA5
MzA1OGE5OGE2Mjg5M2UzYjQKCkkganVzdCBkdW1wZWQgdGhlIGZpcnN0IDEwMCwgc2luY2UgSSBo
YXZlbid0IGZpZ3VyZWQgaG93IHRvIGNoZWNrIGZvciB0aGUgbnVtYmVyCm9mIHN0cmluZ3MgcHJv
dmlkZWQgYnkgdGhlIGRldmljZS4gSW4gYW55IGNhc2UgdGhlcmUgYXJlbid0IGFueSB1c2VmdWwg
c3RyaW5ncwpiZXlvbmQgaW5kZXg9NjIsIGJ1dCB0aGUgbWl4ZXIuYyBjb2RlIGlzIGFjY2Vzc2lu
ZyA4MiwgOTAuIFdpbGwgbm93IGZpZ3VyZSBob3cKaXQgZ2V0cyB0aGF0IG51bWJlci4KCklmIHRo
ZXJlIGFyZSByZWFkeSBtYWRlIHVzZWZ1bCB0b29scyB0aGF0IEkgc2hvdWxkIHVzZSBpbnN0ZWFk
IG9mIHdyaXRpbmcgdGhlbQpteXNlbGYgaW4gcHl0aG9uLCBwbGVhc2UgbGV0IG1lIGtub3cuIFRo
YW5rcwoKU3RlZmFuCgpBbSAyMi4wNi4xOSB1bSAyMzoxNyBzY2hyaWViIFN0ZWZhbiBTYXVlcjoK
PiBRdWljayBmb2xsb3d1cC4gSGVyZSBpcyB0aGUgbHN1c2IgLXYgb3V0cHV0IGZvciB0aGUgZGV2
aWNlOgo+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Vuc29uaWMvMmQyODZhODViYmY0YWNhMjVl
NmYzNmIzNTY5ODQ5YzMKPiAKPiBJIG5vdGljZWQgdHdvIHdhcm5pbmdzOgo+IFdhcm5pbmc6IEp1
bmsgYXQgZW5kIG9mIGRlc2NyaXB0b3IgKDE3IGJ5dGVzKToKPiAgICAgICAgIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIDAwIDAwCj4gQ291bGQgdGhvc2UgYmUg
dGhlIGNhdXNlPyBJIGRvbid0IG5vdyBob3cgdG8gbWFwIHRoZSAnbmFtZWlkJyBpbmRleCB0byBh
bnl0aGluZwo+IGluIHRoZSBsc3ViIG91dHB1dCB0aG91Z2guCj4gCj4gQW0gMjIuMDYuMTkgdW0g
MjI6NTUgc2NocmllYiBTdGVmYW4gU2F1ZXI6Cj4+IEhpLAo+Pgo+PiB3aGVuIEkgcnVuCj4+IGFt
aXhlciAtRCBodzo0IGNvbnRyb2xzIHwgc29ydCAtbiAtdCA9IC1rMgo+Pgo+PiBJIGdldCB0aGUg
b3V0cHV0IGJlbG93Cj4+Cj4+IG51bWlkPTEsaWZhY2U9TUlYRVIsbmFtZT0nS0tLS0tLS0tLS0tL
S8ODw4PDg8ODw4PDg8ODw4PDg8ODw4MgU3dpdGNoJwo+PiBudW1pZD0yLGlmYWNlPUNBUkQsbmFt
ZT0nSW50ZXJuYWwgVmFsaWRpdHknCj4+IG51bWlkPTMsaWZhY2U9Q0FSRCxuYW1lPSdTL1BESUYg
VmFsaWRpdHknCj4+IG51bWlkPTQsaWZhY2U9Q0FSRCxuYW1lPSdBREFUIFZhbGlkaXR5Jwo+PiBu
dW1pZD01LGlmYWNlPU1JWEVSLG5hbWU9J1NjYXJsZXR0IDE4aTIwIFVTQi1TeW5jIENsb2NrIFNv
dXJjZScKPj4gbnVtaWQ9NixpZmFjZT1NSVhFUixuYW1lPScgU3dpdGNoJwo+PiBudW1pZD03LGlm
YWNlPUNBUkQsbmFtZT0nS2VlcCBJbnRlcmZhY2UnCj4+IG51bWlkPTgsaWZhY2U9TUlYRVIsbmFt
ZT0nTWFzdGVyIFBsYXliYWNrIFN3aXRjaCcKPj4gbnVtaWQ9OSxpZmFjZT1NSVhFUixuYW1lPSdN
YXN0ZXIgUGxheWJhY2sgVm9sdW1lJwo+PiBudW1pZD0xMCxpZmFjZT1NSVhFUixuYW1lPSdNYXN0
ZXIgMSAoTW9uaXRvcikgUGxheWJhY2sgU3dpdGNoJwo+PiBudW1pZD0xMSxpZmFjZT1NSVhFUixu
YW1lPSdNYXN0ZXIgMSAoTW9uaXRvcikgUGxheWJhY2sgVm9sdW1lJwo+PiAuLi4gbG90cyBvZiBl
eHRyYSBsaW5lcyAuLi4KPj4KPj4gUGxlYXNlIG5vdGUgdGhlIGxpbmVzIGZvciBudW1pZD0xIGFu
ZCBudW1pZD02LiBUaGUgZmlyc3Qgb25lIGNvbnRhaW5zIHNvbWUKPj4gZ2FyYmFnZSBhbmQgdGhl
IDJuZCBvbmUgbG9vayBsaWtlIGl0IHNob3VsZCBzdGFydCB3aXRoIGFub3RoZXIgd29yZC4KPj4K
Pj4gSSBub3cgYWRkZWQgc29tZSBkZWJ1ZyBwcmludGluZyBoZXJlOgo+PiBodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvc291bmQvdXNiL21peGVyX3NjYXJsZXR0
LmMjTDU2Mgo+Pgo+PiBhbmQgZ2V0IG91dHB1dCBpbiBkbWVzZzoKPj4gWyAyOTcxLjY0MjEzN10g
dXNiIDEtMjogUHJvZHVjdDogU2NhcmxldHQgMThpMjAgVVNCCj4+IFsgMjk3MS42NDIxNDFdIHVz
YiAxLTI6IE1hbnVmYWN0dXJlcjogRm9jdXNyaXRlCj4+IFsgMjk3MS43MDk3NzNdIG5ldyBjdHJs
OiBuYW1lPSdNYXN0ZXIgUGxheWJhY2sgU3dpdGNoJywgaW5kZXg9MTAsIG9mZnNldD0xLAo+PiBu
dW09MDogbnVtaWQ9OAo+PiBbIDI5NzEuNzA5NzgxXSBuZXcgY3RybDogbmFtZT0nTWFzdGVyIFBs
YXliYWNrIFZvbHVtZScsIGluZGV4PTEwLCBvZmZzZXQ9MiwKPj4gbnVtPTA6IG51bWlkPTkKPj4g
WyAyOTcxLjcwOTc4OF0gbmV3IGN0cmw6IG5hbWU9J01hc3RlciAxIChNb25pdG9yKSBQbGF5YmFj
ayBTd2l0Y2gnLCBpbmRleD0xMCwKPj4gb2Zmc2V0PTEsIG51bT0xOiBudW1pZD0xMAo+Pgo+PiBT
byB0aGUgZmlyc3QgOCBjb250cm9scyBhcmUgYWRkZWQgc29tZXdoZXJlIGVsc2UuIExvb2tzIGxp
a2UgdGhpcyBpcyBmcm9tCj4+IG1peGVyLmMgYW5kIGFmdGVyCj4+IGVjaG8gLW4gJ2ZpbGUgc291
bmQvdXNiL21peGVyLmMgK3AnID4vc3lzL2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRy
b2wKPj4gSSBnZXQKPj4gWyA0NDA1Ljg1NTQzMl0gdXNiIDEtMjogWzUxXSBQVSBbS0tLS0tLS0tL
S0tLS8ODw4PDg8ODw4PDg8ODw4PDg8ODw4MgU3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQo+PiBb
IDQ0MDUuODU2NDIzXSB1c2IgMS0yOiBbNTJdIFBVIFsgU3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAv
MQo+Pgo+PiBJIG5vdyBhZGRlZCBtb3JlIGRlYnVnIHByaW50cyBpbnRvCj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9zb3VuZC91c2IvbWl4ZXIuYyNMMjQz
MQo+PiBhbmQgaXRzIHRoZSBjb2RlIHRoYXQgY2FsbHMgc25kX3VzYl9jb3B5X3N0cmluZ19kZXNj
KCkKPj4gWyA1NzUwLjEyNDEyM10gdXNiIDEtMjogbmFtZWlkPTkwLCBsZW49MzUKPj4gWyA1NzUw
LjEyNDE1N10gdXNiIDEtMjogWzUxXSBQVSBbS0tLS0tLS0tLS0tLS8ODw4PDg8ODw4PDg8ODw4PD
g8ODw4MgU3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQo+PiBbIDU3NTAuMTI1MjQxXSB1c2IgMS0y
OiBuYW1laWQ9ODIsIGxlbj0xCj4+IFsgNTc1MC4xMjUyNjBdIHVzYiAxLTI6IFs1Ml0gUFUgWyBT
d2l0Y2hdIGNoID0gMSwgdmFsID0gMC8xCj4+Cj4+IEluIGJvdGggY2FzZXMgdGhlIHJldHVybmVk
IGxlbiBzZWVtcyB3cm9uZyBhbmQgdGhlIGZ1bmN0aW9uIGRvZXMgbm90IHNlZW1zIHRvCj4+IGNv
cHkgYW55IHVzZWZ1bCBzdHJpbmcgaGVyZS4gc25kX3VzYl9jb3B5X3N0cmluZ19kZXNjKCkgaXMg
anVzdCBhIHdyYXBwZXIgYXJvdW5kCj4+IHVzYl9zdHJpbmcoKS4KPj4KPj4gSXMgbXkgaGFyZHdh
cmUgcmV0dXJuaW5nIGJvZ3VzIGRhdGEgaW4gdXNiIGRlc2NyaXB0b3JzPyBDYW4gdGhpcyBiZSBh
ZGRyZXNzCj4+IHRocm91Z2ggc29tZSBxdWlya3MgdGFibGU/IEFueSBvdGhlciBpZGVhcz8KPj4K
Pj4gVGhhbmtzIQo+PiBTdGVmYW4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+Pgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
