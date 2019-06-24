Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76050BCA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 15:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7C81665;
	Mon, 24 Jun 2019 15:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7C81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561382462;
	bh=41g+WMy3MR+r8qBTo3aOwQ5QIzLTooLSN6C56e5XLHI=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scqJqebtw7LFtcqbGkpZp+O1MJqIdu2UAAVlmsVOQ+bOIaMWRjcUACl+mj90DToWb
	 SeAtHXoMNjFcYIIIevqBrxUWrlgA+Lzh7gk0z4vFa7qNRBDEmPh808CIBpY/IYOwJe
	 VKhckBiJVmtXwp2VxV3bdaq9XmxdaIIZKAo6wd2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0431F896B9;
	Mon, 24 Jun 2019 15:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FD6F896B7; Mon, 24 Jun 2019 15:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9BA6F8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 15:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BA6F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="WzhAs9bR"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624131906euoutp025e6cee6006d37e8bc15eea7a8e57ce63~rJPjVXILO3094030940euoutp02I
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 13:19:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624131906euoutp025e6cee6006d37e8bc15eea7a8e57ce63~rJPjVXILO3094030940euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1561382347;
 bh=qeIgxpBh4XpIhF8fLol5EjhiufAt9+w5zpONIuxq8PY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WzhAs9bRX9ULXZKu26Opkk9dK889nnVYky13ZKWQBohcWUjw7+M6RFPH/qlEeJmdE
 Dwt0UZhkKbPT1kyC5jA8RytHvht3+0kdz4dPxgRKk/iQ9GR21GgTXZMmY6/c/ekzNr
 k0qPualpRHPDUKeXnprW+3WVfH4HLPZsglMdLzQ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190624131906eucas1p202eba20c57bbef91b6bd95ce524c2135~rJPi5DnAz0802308023eucas1p23;
 Mon, 24 Jun 2019 13:19:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B4.D9.04298.ACDC01D5; Mon, 24
 Jun 2019 14:19:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c~rJPiHjOd00771707717eucas1p26;
 Mon, 24 Jun 2019 13:19:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190624131905eusmtrp138f2754e181c96e6f55bf072898ab88a~rJPh5hgU-1728617286eusmtrp1i;
 Mon, 24 Jun 2019 13:19:05 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-be-5d10cdcab5ff
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 93.81.04140.9CDC01D5; Mon, 24
 Jun 2019 14:19:05 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624131905eusmtip1559711d9d8b3f7388156013c63dd8b8b~rJPhhxPfm2840528405eusmtip1F;
 Mon, 24 Jun 2019 13:19:04 +0000 (GMT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <9cfc8505-2903-033f-f68b-8ccc1c70132b@samsung.com>
Date: Mon, 24 Jun 2019 15:19:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7qnzgrEGlw4wmNx5eIhJoupD5+w
 WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUVw2
 Kak5mWWpRfp2CVwZV8+/Yiw4L17x5ddOpgbGdcJdjJwcEgImEge2v2XtYuTiEBJYwSjxbPNJ
 dgjnC6PEif/bmCGcz4wSM579ZYVpWfzvKxtEYjmjxMNlW6Cq3jJKfPy4iw2kSlggXaKj8yNL
 FyMHh4hAtMT103YgYWaBvYwSVxcrgthsAoYSXW+7wMp5Bewkbpzcxw5SziKgKvH/BliJqECM
 xMP5d6BKBCVOznzCAmJzCthKPNjdxAYxUl6ieetsZghbXOLWk/lMIOdICKxil+hvessGcbSL
 RP+7DkYIW1ji1fEt7BC2jMTpyT0sEA3NQM+cW8sO4fQwSlxumgHVYS1x+PhFVpDrmAU0Jdbv
 0ocIO0q8u7+XDSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzULy
 2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBCae0/+Of9rB+PVS
 0iFGAQ5GJR7eBUcEYoVYE8uKK3MPMUpwMCuJ8C5NBArxpiRWVqUW5ccXleakFh9ilOZgURLn
 rWZ4EC0kkJ5YkpqdmlqQWgSTZeLglGpgTOSQ49Zr/NrsJL6c9/dayaiKg0pXY0qfubb8k7Tu
 qlZcnsW0n6Xhe4+3gC7jvS9qTS+vHZqosLo26w37dvFeXZY656Nvg+YbnBTdUv+zbUWMSuP/
 S/6vpV0t7+dPLqjQaKnKX9s/yf705JBbTjMbM80NWA6HsEYZrj/085J9QObrs7bxl78rsRRn
 JBpqMRcVJwIA8accAzgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xu7onzwrEGpz8Impx5eIhJoupD5+w
 WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZV8+/Yiw4
 L17x5ddOpgbGdcJdjJwcEgImEov/fWXrYuTiEBJYyihxfuoKNoiEjMTJaQ2sELawxJ9rXVBF
 rxklpnXsZwJJCAukS3R0fmQBsUUEoiUmL/sPVsQssJ9Rou/TNLBuIYF8ibtL5jCD2GwChhJd
 b7vANvAK2EncOLmPvYuRg4NFQFXi/w1FkLCoQIxE19SfLBAlghInZz4BszkFbCUe7G4Ca2UW
 MJOYt/khM4QtL9G8dTaULS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kV
 J+YWl+al6yXn525iBMbatmM/t+xg7HoXfIhRgINRiYd3wRGBWCHWxLLiytxDjBIczEoivEsT
 gUK8KYmVValF+fFFpTmpxYcYTYF+m8gsJZqcD0wDeSXxhqaG5haWhubG5sZmFkrivB0CB2OE
 BNITS1KzU1MLUotg+pg4OKUaGO2X2d4QqTsqU7lXNPtKmXzxycXvlqW0ifr5x9wVst26tSgq
 SeO24LPthhyOD05uWrlOwvLRts0vbI+bVF389NiGd6ZV3OdF5xcY54sHmSZX2dh13HVf/EdV
 RGymiCUT4+Tvk+zCKyc8NK1+XFE/W3K30IN+oSDVn/ozsrOrzgWsnXh55amvb5RYijMSDbWY
 i4oTAbOSP9vLAgAA
X-CMS-MailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-Msg-Generator: CA
X-RootMTR: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
References: <877e9iwf9f.wl-kuninori.morimoto.gx@renesas.com>
 <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
 <CGME20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c@eucas1p2.samsung.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
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

SGkKCk9uIDIwMTktMDYtMTkgMDM6MTgsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOgo+IEZyb206
IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPgo+
IEFMU0EgU29DIGlzIG5vdyBzdXBwb3J0aW5nICJubyBQbGF0Zm9ybSIuIFNvdW5kIGNhcmQgZG9l
c24ndCBuZWVkIHRvCj4gc2VsZWN0ICJDUFUgY29tcG9uZW50IiBhcyAiUGxhdGZvcm0iIGFueW1v
cmUgaWYgaXQgZG9lc24ndCBuZWVkCj4gc3BlY2lhbCBQbGF0Zm9ybS4KPiBUaGlzIHBhdGNoIHJl
bW92ZXMgc3VjaCBzZXR0aW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3Rv
IDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KClRoaXMgcGF0Y2ggY2F1c2VzIHJl
Z3Jlc3Npb24gb24gU2Ftc3VuZyBFeHlub3MtYmFzZWQgYm9hcmRzOiBTbm93LCAKUGVhY2gtUGkg
YW5kIFBlYWNoLVBpdCAoYWxsIHRoYXQgdXNlIHNub3cgbWFjaGluZSBkcml2ZXIpIHNpbmNlIGxp
bnV4IApuZXh0LTIwMTkwNjIwLiBBU29DIGRldmljZSBpcyBwcm9wZXJseSByZWdpc3RlcmVkLCBi
dXQgaXQgaXMgbm90IHVzYWJsZToKClvCoMKgwqAgMy4yMDMwMDZdIHNhbXN1bmctaTJzIDM4MzAw
MDAuaTJzLXNlYzogRE1BIGNoYW5uZWxzIHNvdXJjZWQgZnJvbSAKZGV2aWNlIDM4MzAwMDAuaTJz
ClvCoMKgwqAgMy4yMTM0NDBdIHNub3ctYXVkaW8gc291bmQ6IEZhaWxlZCBwYXJzaW5nIGNvZGVj
IG5vZGUKW8KgwqDCoCAzLjQyMzI0MV0gc25vdy1hdWRpbyBzb3VuZDogbXVsdGljb2RlYyA8LT4g
c2Ftc3VuZy1pMnMgbWFwcGluZyBvawpbwqDCoMKgIDMuNDI5Nzc2XSBtYXg5ODA5NSA3LTAwMTE6
IEFTb0M6IG11eCBFeHRlcm5hbCBNSUMgaGFzIG5vIHBhdGhzClvCoMKgwqAgMy40MzQ1MTNdIG1h
eDk4MDk1IDctMDAxMTogQVNvQzogbXV4IExpbmVpbiBNdXggaGFzIG5vIHBhdGhzClvCoMKgwqAg
NC4wNDM0ODhdIEFMU0EgZGV2aWNlIGxpc3Q6ClvCoMKgwqAgNC4wNDcxNzFdwqDCoCAjMDogU25v
dy1JMlMtTUFYOTgwOTUKCiMgc3BlYWtlci10ZXN0IC1sMQoKc3BlYWtlci10ZXN0IDEuMS4zCgpQ
bGF5YmFjayBkZXZpY2UgaXMgZGVmYXVsdApTdHJlYW0gcGFyYW1ldGVycyBhcmUgNDgwMDBIeiwg
UzE2X0xFLCAxIGNoYW5uZWxzClVzaW5nIDE2IG9jdGF2ZXMgb2YgcGluayBub2lzZQpQbGF5YmFj
ayBvcGVuIGVycm9yOiAtMjIsSW52YWxpZCBhcmd1bWVudAoKIwoKVGhlIGtlcm5lbCBsb2dzIGFy
ZSBleGFjdGx5IHRoZSBzYW1lIHdoZW0gaXQgd29ya2VkIGZpbmUgKGkuZS4gCm5leHQtMjAxOTA2
MTksIHNvIHRoZSBtZXNzYWdlIGFib3V0IGNvZGVjIG5vZGUgY2FuIGJlIGlnbm9yZWQpLgoKU2lt
aWxhciBpc3N1ZSBhcHBlYXJzIGFsc28gb24gSGFyZGtlcm5lbCdzIE9kcm9pZFhVIGJvYXJkIAoo
RXh5bm9zNTQxMC1iYXNlZCwgdXNlcyBzb3VuZC1jYXJkLXNpbXBsZSBBU29DIGRyaXZlcikgYW5k
IFNhbXN1bmcgVE0yIApib2FyZCAoRXh5bm9zNTQzMywgdXNlcyB0bTJfd201MTEwIGRyaXZlciku
IEknbSBvcGVuIHRvIHRlc3QgYW55IHBhdGNoIApvciBwcm92aWRlIG1vcmUgbG9ncyBpZiBuZWVk
ZWQuCgo+IC0tLQo+ICAgc291bmQvc29jL3NhbXN1bmcvc25vdy5jIHwgMTAgKysrLS0tLS0tLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2Mvc2Ftc3VuZy9zbm93LmMgYi9zb3VuZC9zb2Mvc2Ftc3VuZy9z
bm93LmMKPiBpbmRleCA4ZWE3Nzk5Li43ZDY2OWM0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9z
YW1zdW5nL3Nub3cuYwo+ICsrKyBiL3NvdW5kL3NvYy9zYW1zdW5nL3Nub3cuYwo+IEBAIC0xNCw5
ICsxNCw5IEBACj4gICAKPiAgICNkZWZpbmUgRklOX1BMTF9SQVRFCQkyNDAwMDAwMAo+ICAgCj4g
LVNORF9TT0NfREFJTElOS19ERUZTKGxpbmtzLAo+IC0JREFJTElOS19DT01QX0FSUkFZKENPTVBf
RU1QVFkoKSksCj4gLQlEQUlMSU5LX0NPTVBfQVJSQVkoQ09NUF9FTVBUWSgpKSwKPiArU05EX1NP
Q19EQUlMSU5LX0RFRihsaW5rc19jcHVzLAo+ICsJREFJTElOS19DT01QX0FSUkFZKENPTVBfRU1Q
VFkoKSkpOwo+ICtTTkRfU09DX0RBSUxJTktfREVGKGxpbmtzX2NvZGVjcywKPiAgIAlEQUlMSU5L
X0NPTVBfQVJSQVkoQ09NUF9FTVBUWSgpKSk7Cj4gICAKPiAgIHN0cnVjdCBzbm93X3ByaXYgewo+
IEBAIC0xNTAsOCArMTUwLDYgQEAgc3RhdGljIGludCBzbm93X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gICAJbGluay0+bnVtX2NwdXMgPSBBUlJBWV9TSVpFKGxpbmtzX2Nw
dXMpOwo+ICAgCWxpbmstPmNvZGVjcyA9IGxpbmtzX2NvZGVjczsKPiAgIAlsaW5rLT5udW1fY29k
ZWNzID0gQVJSQVlfU0laRShsaW5rc19jb2RlY3MpOwo+IC0JbGluay0+cGxhdGZvcm1zID0gbGlu
a3NfcGxhdGZvcm1zOwo+IC0JbGluay0+bnVtX3BsYXRmb3JtcyA9IEFSUkFZX1NJWkUobGlua3Nf
cGxhdGZvcm1zKTsKPiAgIAo+ICAgCWNhcmQtPmRhaV9saW5rID0gbGluazsKPiAgIAljYXJkLT5u
dW1fbGlua3MgPSAxOwo+IEBAIC0yMDcsOCArMjA1LDYgQEAgc3RhdGljIGludCBzbm93X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCX0KPiAgIAl9Cj4gICAKPiAtCWxp
bmstPnBsYXRmb3Jtcy0+b2Zfbm9kZSA9IGxpbmstPmNwdXMtPm9mX25vZGU7Cj4gLQo+ICAgCS8q
IFVwZGF0ZSBjYXJkLW5hbWUgaWYgcHJvdmlkZWQgdGhyb3VnaCBEVCwgZWxzZSB1c2UgZGVmYXVs
dCBuYW1lICovCj4gICAJc25kX3NvY19vZl9wYXJzZV9jYXJkX25hbWUoY2FyZCwgInNhbXN1bmcs
bW9kZWwiKTsKPiAgIAoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ft
c3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
