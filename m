Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B94F83A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2019 22:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130201614;
	Sat, 22 Jun 2019 22:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130201614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561237038;
	bh=nLSJscUyt0Y2fcOG3waGZWTTUJ+AQRvh5eTknXre34w=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P6mU66FA03dkY4D7HN5547d49VXuHpgh+eW18rNbRy/B205EarPWNXi1S9wkC9LkW
	 OAXal8WzOrj2wLRQM36dUpDZsBwPkUP0HuYuZw0vL297cYEtAq22tQsSSAODjSFznQ
	 3rJO2RjP3vEQD4oQaqfLrTqm03y9Y6gYbYN1Him4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6058DF8971A;
	Sat, 22 Jun 2019 22:55:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D961F8071F; Sat, 22 Jun 2019 22:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp.hora-obscura.de (hora-obscura.de [213.133.109.209])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6EEFF8071F
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 22:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6EEFF8071F
Received: from smtp.hora-obscura.de (localhost [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPS id C196EAF8081
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 22:55:26 +0200 (CEST)
Received: from ada.local (ipbcc14466.dynamic.kabel-deutschland.de
 [188.193.68.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.hora-obscura.de (Postfix) with ESMTPSA id 99A1BAF8027
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 22:55:26 +0200 (CEST)
To: alsa-devel@alsa-project.org
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
Message-ID: <65ad9ddb-bb67-2dc0-d5f5-e0c518641db2@hora-obscura.de>
Date: Sat, 22 Jun 2019 22:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] focusrite scarlett 18i20 : Mixer controls with
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

SGksCgp3aGVuIEkgcnVuCmFtaXhlciAtRCBodzo0IGNvbnRyb2xzIHwgc29ydCAtbiAtdCA9IC1r
MgoKSSBnZXQgdGhlIG91dHB1dCBiZWxvdwoKbnVtaWQ9MSxpZmFjZT1NSVhFUixuYW1lPSdLS0tL
S0tLS0tLS0tLw4PDg8ODw4PDg8ODw4PDg8ODw4PDgyBTd2l0Y2gnCm51bWlkPTIsaWZhY2U9Q0FS
RCxuYW1lPSdJbnRlcm5hbCBWYWxpZGl0eScKbnVtaWQ9MyxpZmFjZT1DQVJELG5hbWU9J1MvUERJ
RiBWYWxpZGl0eScKbnVtaWQ9NCxpZmFjZT1DQVJELG5hbWU9J0FEQVQgVmFsaWRpdHknCm51bWlk
PTUsaWZhY2U9TUlYRVIsbmFtZT0nU2NhcmxldHQgMThpMjAgVVNCLVN5bmMgQ2xvY2sgU291cmNl
JwpudW1pZD02LGlmYWNlPU1JWEVSLG5hbWU9JyBTd2l0Y2gnCm51bWlkPTcsaWZhY2U9Q0FSRCxu
YW1lPSdLZWVwIEludGVyZmFjZScKbnVtaWQ9OCxpZmFjZT1NSVhFUixuYW1lPSdNYXN0ZXIgUGxh
eWJhY2sgU3dpdGNoJwpudW1pZD05LGlmYWNlPU1JWEVSLG5hbWU9J01hc3RlciBQbGF5YmFjayBW
b2x1bWUnCm51bWlkPTEwLGlmYWNlPU1JWEVSLG5hbWU9J01hc3RlciAxIChNb25pdG9yKSBQbGF5
YmFjayBTd2l0Y2gnCm51bWlkPTExLGlmYWNlPU1JWEVSLG5hbWU9J01hc3RlciAxIChNb25pdG9y
KSBQbGF5YmFjayBWb2x1bWUnCi4uLiBsb3RzIG9mIGV4dHJhIGxpbmVzIC4uLgoKUGxlYXNlIG5v
dGUgdGhlIGxpbmVzIGZvciBudW1pZD0xIGFuZCBudW1pZD02LiBUaGUgZmlyc3Qgb25lIGNvbnRh
aW5zIHNvbWUKZ2FyYmFnZSBhbmQgdGhlIDJuZCBvbmUgbG9vayBsaWtlIGl0IHNob3VsZCBzdGFy
dCB3aXRoIGFub3RoZXIgd29yZC4KCkkgbm93IGFkZGVkIHNvbWUgZGVidWcgcHJpbnRpbmcgaGVy
ZToKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL3NvdW5kL3Vz
Yi9taXhlcl9zY2FybGV0dC5jI0w1NjIKCmFuZCBnZXQgb3V0cHV0IGluIGRtZXNnOgpbIDI5NzEu
NjQyMTM3XSB1c2IgMS0yOiBQcm9kdWN0OiBTY2FybGV0dCAxOGkyMCBVU0IKWyAyOTcxLjY0MjE0
MV0gdXNiIDEtMjogTWFudWZhY3R1cmVyOiBGb2N1c3JpdGUKWyAyOTcxLjcwOTc3M10gbmV3IGN0
cmw6IG5hbWU9J01hc3RlciBQbGF5YmFjayBTd2l0Y2gnLCBpbmRleD0xMCwgb2Zmc2V0PTEsCm51
bT0wOiBudW1pZD04ClsgMjk3MS43MDk3ODFdIG5ldyBjdHJsOiBuYW1lPSdNYXN0ZXIgUGxheWJh
Y2sgVm9sdW1lJywgaW5kZXg9MTAsIG9mZnNldD0yLApudW09MDogbnVtaWQ9OQpbIDI5NzEuNzA5
Nzg4XSBuZXcgY3RybDogbmFtZT0nTWFzdGVyIDEgKE1vbml0b3IpIFBsYXliYWNrIFN3aXRjaCcs
IGluZGV4PTEwLApvZmZzZXQ9MSwgbnVtPTE6IG51bWlkPTEwCgpTbyB0aGUgZmlyc3QgOCBjb250
cm9scyBhcmUgYWRkZWQgc29tZXdoZXJlIGVsc2UuIExvb2tzIGxpa2UgdGhpcyBpcyBmcm9tCm1p
eGVyLmMgYW5kIGFmdGVyCmVjaG8gLW4gJ2ZpbGUgc291bmQvdXNiL21peGVyLmMgK3AnID4vc3lz
L2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wKSSBnZXQKWyA0NDA1Ljg1NTQzMl0g
dXNiIDEtMjogWzUxXSBQVSBbS0tLS0tLS0tLS0tLS8ODw4PDg8ODw4PDg8ODw4PDg8ODw4MgU3dp
dGNoXSBjaCA9IDEsIHZhbCA9IDAvMQpbIDQ0MDUuODU2NDIzXSB1c2IgMS0yOiBbNTJdIFBVIFsg
U3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQoKSSBub3cgYWRkZWQgbW9yZSBkZWJ1ZyBwcmludHMg
aW50bwpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvc291bmQv
dXNiL21peGVyLmMjTDI0MzEKYW5kIGl0cyB0aGUgY29kZSB0aGF0IGNhbGxzIHNuZF91c2JfY29w
eV9zdHJpbmdfZGVzYygpClsgNTc1MC4xMjQxMjNdIHVzYiAxLTI6IG5hbWVpZD05MCwgbGVuPTM1
ClsgNTc1MC4xMjQxNTddIHVzYiAxLTI6IFs1MV0gUFUgW0tLS0tLS0tLS0tLS0vDg8ODw4PDg8OD
w4PDg8ODw4PDg8ODIFN3aXRjaF0gY2ggPSAxLCB2YWwgPSAwLzEKWyA1NzUwLjEyNTI0MV0gdXNi
IDEtMjogbmFtZWlkPTgyLCBsZW49MQpbIDU3NTAuMTI1MjYwXSB1c2IgMS0yOiBbNTJdIFBVIFsg
U3dpdGNoXSBjaCA9IDEsIHZhbCA9IDAvMQoKSW4gYm90aCBjYXNlcyB0aGUgcmV0dXJuZWQgbGVu
IHNlZW1zIHdyb25nIGFuZCB0aGUgZnVuY3Rpb24gZG9lcyBub3Qgc2VlbXMgdG8KY29weSBhbnkg
dXNlZnVsIHN0cmluZyBoZXJlLiBzbmRfdXNiX2NvcHlfc3RyaW5nX2Rlc2MoKSBpcyBqdXN0IGEg
d3JhcHBlciBhcm91bmQKdXNiX3N0cmluZygpLgoKSXMgbXkgaGFyZHdhcmUgcmV0dXJuaW5nIGJv
Z3VzIGRhdGEgaW4gdXNiIGRlc2NyaXB0b3JzPyBDYW4gdGhpcyBiZSBhZGRyZXNzCnRocm91Z2gg
c29tZSBxdWlya3MgdGFibGU/IEFueSBvdGhlciBpZGVhcz8KClRoYW5rcyEKU3RlZmFuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
