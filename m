Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68083B611A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE07A167C;
	Wed, 18 Sep 2019 12:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE07A167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801421;
	bh=FPx2HIWBEOhhh7r+rrlgDpqKm9zFwHoAirhTv3iXxMQ=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFiT5lEhB4/bMlA74mftf/+KQOmtgoCPLEh7h6QQ9sGG3+ORZ5CEjCX+riaqShCc8
	 yfUjuIz9hnJ73GN5QxAfjTmzdCzdSSReFWAdXskN574iIy7WzR/CXHcrTwaOPuST0R
	 Fmq+D21XlQw6yNIgzWzKn6Z5YMWAsIr86NWNgR5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52824F80292;
	Wed, 18 Sep 2019 12:08:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC5FFF80506; Wed, 18 Sep 2019 12:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E84BF800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E84BF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="RShI18E3"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190918100829euoutp02fc0373161e1694d3dc5383fc3d3a9c05~FgHqSB5SV0857808578euoutp02X
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190918100829euoutp02fc0373161e1694d3dc5383fc3d3a9c05~FgHqSB5SV0857808578euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568801309;
 bh=SoPSWmL46dCyt6jpMsIRlH+mTit8bx9z6UaNw4gYnuI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=RShI18E3AIkV+vc3zkY/d14qzsLlwmZSYxJ3+fLY7uKxFQo8eD5YYI5S5OypnlZ2+
 l22di0vlPDk/MIKb9Xl8nSmGFg/1vHvsZ/d3dLXuz4utwqAVhvWE6nmKs7hgQV0J4u
 yYOxTyYYf6N/ry5BNVy8g08breBk+Hf9XnDkjg2Y=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190918100828eucas1p2dd539e07f9d877b5259c14c70ebd3c5b~FgHp1uUNc1518015180eucas1p2A;
 Wed, 18 Sep 2019 10:08:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D4.11.04469.C12028D5; Wed, 18
 Sep 2019 11:08:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190918100827eucas1p236c0c2ac8b2b76a66165adb8cc8cb6b1~FgHpEl5C21741517415eucas1p2F;
 Wed, 18 Sep 2019 10:08:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190918100827eusmtrp13cd48098d61b1affadf4d1b91330fc83~FgHo0YvKq0828208282eusmtrp1j;
 Wed, 18 Sep 2019 10:08:27 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-c6-5d82021ca455
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 29.B1.04166.B12028D5; Wed, 18
 Sep 2019 11:08:27 +0100 (BST)
Received: from [106.120.51.95] (unknown [106.120.51.95]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190918100826eusmtip19afee81663cbbea5348d86db266519e0~FgHoOsVsC1971319713eusmtip1J;
 Wed, 18 Sep 2019 10:08:26 +0000 (GMT)
To: Rob Herring <robh+dt@kernel.org>
From: Maciej Falkowski <m.falkowski@samsung.com>
Message-ID: <40f56f61-a1db-a1a2-262e-1f4c771481e1@samsung.com>
Date: Wed, 18 Sep 2019 12:08:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djPc7oyTE2xBotmiFjcWneO1eLKxUNM
 FlMfPmGzmH8EyD1/fgO7xbcrHUwWl3fNYbOYcX4fk8XaI3fZLZZev8hk0br3CLvF4TftrBYX
 V3xhcuD12PC5ic1jzbw1jB47Z91l99i0qpPNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDKO
 9egV7NarOHFrLmMD4zulLkZODgkBE4lLl66xgthCAisYJX4sNO9i5AKyvzBKzHvzngXC+cwo
 Mf/+XSaYjt4rZ5khEssZJSat+8YI4bxllGj49wKsSlggVuJ591IWEFtEQEViw/NbYB3MAv+Z
 JeY/7WYDSbAJGEj0v9kLVsQrYCfx7Oh3dhCbRUBVoqHzCFhcVCBC4tODw6wQNYISJ2c+AYtz
 CgRKXGqGqGEWkJdo3jqbGcIWl7j1ZD4TyDIJgXvsElvW3mKGuNtF4snzHVA/CEu8Or6FHcKW
 kTg9uQdoEAeQXS1x7ZssRG8Lo8T1aW/ZIGqsJf6smsgGUsMsoCmxfpc+RNhRYtmL70wQrXwS
 N94KQpzAJzFp23RmiDCvREebEISpKvFmQixEo7RE65r9jBMYlWYh+WsWkl9mIfllFsLaBYws
 qxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQKT2Ol/xz/tYPx6KekQowAHoxIPr8TZhlgh
 1sSy4srcQ4wSHMxKIrwBtfWxQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqem
 FqQWwWSZODilGhhVdp8WvcO33PvEfslTesrytuueJ5mYxk7uKHe7s0pEwe3+bpbubI4jfn1T
 lvPwZXZfDzzDXD5953U1/kgBqYnOydPeX3BPawjnVI7fJ7jetE7vY5Po+jflp+cc0VcoKJgo
 f4g5WCBne9DKtKKJlo8OLeWWXP8h+hLLnzy7I2tDVt55eXPaDnElluKMREMt5qLiRACWyBR1
 XgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xu7rSTE2xBuubZS1urTvHanHl4iEm
 i6kPn7BZzD8C5J4/v4Hd4tuVDiaLy7vmsFnMOL+PyWLtkbvsFkuvX2SyaN17hN3i8Jt2VouL
 K74wOfB6bPjcxOaxZt4aRo+ds+6ye2xa1cnm0bdlFaPH501yAWxRejZF+aUlqQoZ+cUltkrR
 hhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnHevQKdutVnLg1l7GB8Z1SFyMn
 h4SAiUTvlbPMXYxcHEICSxklVl57xwSRkJbYf+0jO4QtLPHnWhcbRNFrRok/b5rZQBLCArES
 jaf+gNkiAioSG57fApvELNDIItGy+TPU2C4mibu//oCNZRMwkOh/s5cFxOYVsJN4dvQ72AoW
 AVWJhs4jYHFRgQiJwztmMULUCEqcnPkELM4pEChxqRmihlnATGLe5ofMELa8RPPW2VC2uMSt
 J/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGL3bjv3c
 vIPx0sbgQ4wCHIxKPLwHTjXECrEmlhVX5h5ilOBgVhLhDaitjxXiTUmsrEotyo8vKs1JLT7E
 aAr03ERmKdHkfGBiySuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnV
 wNilcH1S89EHX33fWlcFpp6cc2NHvMqhe2LhgU3d0+/+WFJ73Lv7Q9s1/7Pev55kNwYeyHjD
 ejbngcZzx49hl1elnf7y/OnvBXO2xQkqKXC/N3x8dcZLDp9Ox2vzm2c4becULDGQljP4fNb3
 XM6+bc3VF5VevNn9f//s/2IWrVM2xG07Yam9JyNfiaU4I9FQi7moOBEAMz+JDPQCAAA=
X-CMS-MailID: 20190918100827eucas1p236c0c2ac8b2b76a66165adb8cc8cb6b1
X-Msg-Generator: CA
X-RootMTR: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
References: <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com>
 <20190917120452.28135-1-m.falkowski@samsung.com>
 <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] dt-bindings: sound: Convert Samsung
 I2S controller to dt-schema
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

Ck9uIDkvMTcvMTkgMzowNSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IE9uIFR1ZSwgU2VwIDE3
LCAyMDE5IGF0IDc6MDUgQU0gTWFjaWVqIEZhbGtvd3NraQo+IDxtLmZhbGtvd3NraUBzYW1zdW5n
LmNvbT4gd3JvdGU6Cj4+IENvbnZlcnQgU2Ftc3VuZyBJMlMgY29udHJvbGxlciB0byBuZXdlciBk
dC1zY2hlbWEgZm9ybWF0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogRmFsa293c2tpIDxt
LmZhbGtvd3NraUBzYW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3Nr
aSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+PiAtLS0KPj4gdjI6Cj4+IC0gQWRkZWQgbWlz
c2luZyBTaWduZWQtb2ZmLWJ5IGNlcnRpZmljYXRlCj4+IC0tLQo+PiAgIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL3NhbXN1bmctaTJzLnR4dCB8ICA4NCAtLS0tLS0tLS0tLS0tCj4+ICAg
Li4uL2JpbmRpbmdzL3NvdW5kL3NhbXN1bmctaTJzLnlhbWwgICAgICAgICAgIHwgMTE5ICsrKysr
KysrKysrKysrKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDg0
IGRlbGV0aW9ucygtKQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvc2Ftc3VuZy1pMnMudHh0Cj4+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zYW1zdW5nLWkycy55
YW1sCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvc2Ftc3VuZy1pMnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9zYW1zdW5nLWkycy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNTlkYzc2MDM1Y2I0Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3NhbXN1bmctaTJzLnlhbWwKPj4gQEAg
LTAsMCArMSwxMTkgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4g
KyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3NvdW5kL3NhbXN1bmctaTJzLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFNhbXN1bmcgU29DIEky
UyBjb250cm9sbGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KPj4gKyAgLSBTYW5nYmVvbSBLaW0gPHNia2ltNzNAc2Ft
c3VuZy5jb20+Cj4+ICsgIC0gU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcu
Y29tPgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGRlc2Ny
aXB0aW9uOiB8Cj4+ICsgICAgICBzYW1zdW5nLHMzYzY0MTAtaTJzOiBmb3IgOC8xNi8yNGJpdCBz
dGVyZW8gSTJTLgo+PiArCj4+ICsgICAgICBzYW1zdW5nLHM1cHYyMTAtaTJzOiBmb3IgOC8xNi8y
NGJpdCBtdWx0aWNoYW5uZWwoNS4xKSBJMlMgd2l0aAo+PiArICAgICAgc2Vjb25kYXJ5IGZpZm8s
IHMvdyByZXNldCBjb250cm9sIGFuZCBpbnRlcm5hbCBtdXggZm9yIHJvb3QgY2xrIHNyYy4KPj4g
Kwo+PiArICAgICAgc2Ftc3VuZyxleHlub3M1NDIwLWkyczogZm9yIDgvMTYvMjRiaXQgbXVsdGlj
aGFubmVsKDUuMSkgSTJTIGZvcgo+PiArICAgICAgcGxheWJhY2ssIHN0ZXJlbyBjaGFubmVsIGNh
cHR1cmUsIHNlY29uZGFyeSBmaWZvIHVzaW5nIGludGVybmFsCj4+ICsgICAgICBvciBleHRlcm5h
bCBkbWEsIHMvdyByZXNldCBjb250cm9sLCBpbnRlcm5hbCBtdXggZm9yIHJvb3QgY2xrIHNyYwo+
PiArICAgICAgYW5kIDcuMSBjaGFubmVsIFRETSBzdXBwb3J0IGZvciBwbGF5YmFjay4gVERNIChU
aW1lIGRpdmlzaW9uIG11bHRpcGxleGluZykKPj4gKyAgICAgIGlzIHRvIGFsbG93IHRyYW5zZmVy
IG9mIG11bHRpcGxlIGNoYW5uZWwgYXVkaW8gZGF0YSBvbiBzaW5nbGUgZGF0YSBsaW5lLgo+PiAr
Cj4+ICsgICAgICBzYW1zdW5nLGV4eW5vczctaTJzOiB3aXRoIGFsbCB0aGUgYXZhaWxhYmxlIGZl
YXR1cmVzIG9mIGV4eW5vczUgaTJzLgo+PiArCj4+ICsgICAgICBleHlub3M3IEkyUyBoYXMgNy4x
IGNoYW5uZWwgVERNIHN1cHBvcnQgZm9yIGNhcHR1cmUsIHNlY29uZGFyeSBmaWZvCj4+ICsgICAg
ICB3aXRoIG9ubHkgZXh0ZXJuYWwgZG1hIGFuZCBtb3JlIG5vLm9mIHJvb3QgY2xrIHNhbXBsaW5n
IGZyZXF1ZW5jaWVzLgo+PiArCj4+ICsgICAgICBzYW1zdW5nLGV4eW5vczctaTJzMTogSTJTMSBv
biBwcmV2aW91cyBzYW1zdW5nIHBsYXRmb3JtcyBzdXBwb3J0cwo+PiArICAgICAgc3RlcmVvIGNo
YW5uZWxzLiBleHlub3M3IGkyczEgdXBncmFkZWQgdG8gNS4xIG11bHRpY2hhbm5lbCB3aXRoCj4+
ICsgICAgICBzbGlnaHRseSBtb2RpZmllZCBiaXQgb2Zmc2V0cy4KPj4gKyAgICBlbnVtOgo+PiAr
ICAgICAgLSAic2Ftc3VuZyxzM2M2NDEwLWkycyIKPj4gKyAgICAgIC0gInNhbXN1bmcsczVwdjIx
MC1pMnMiCj4+ICsgICAgICAtICJzYW1zdW5nLGV4eW5vczU0MjAtaTJzIgo+PiArICAgICAgLSAi
c2Ftc3VuZyxleHlub3M3LWkycyIKPj4gKyAgICAgIC0gInNhbXN1bmcsZXh5bm9zNy1pMnMxIgo+
IE5vIG5lZWQgZm9yIHF1b3RlcyBoZXJlLgo+Cj4+ICsKPj4gKyAgcmVnOgo+PiArICAgIG1heEl0
ZW1zOiAxCj4+ICsKPj4gKyAgZG1hczoKPj4gKyAgICBkZXNjcmlwdGlvbjogbGlzdCBvZiBETUEg
Y29udHJvbGxlciBwaGFuZGxlIGFuZCBETUEgcmVxdWVzdCBsaW5lIG9yZGVyZWQgcGFpcnMuCj4g
SG93IG1hbnk/CgpIaSBSb2IsCgpJIGhhdmUgb25lIHByb2JsZW0gd2l0aCBkZXRlcm1pbmluZyBz
aXplIG9mIGRtYXMuCgpJdCBzZWVtcyB0aGF0IHRoZXJlIGFyZSBvbmx5IHR3byBvcHRpb25zIGZv
ciBkbWFzOiB0eCwgcnggb3IgdHgsIHJ4LCB0eC1zZWMuCgpJdCBsb29rcyBsaWtlIG1pbkl0ZW1z
IHNob3VsZCBiZSB0d28gYW5kIG1heEl0ZW1zIHNob3VsZCBiZSB0aHJlZS4KCkhvd2V2ZXIsIHNv
bWUgb2YgYmluZGluZ3MgaGF2ZSBkaWZmZXJlbnQgZGVmaW5pdGlvbiBvZiBkbWFzLgoKV2hlbiB0
aGVyZSBpczoKCiDCoMKgwqDCoMKgwqDCoCBkbWFzID0gPCZwZG1hMCAxMAogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZwZG1hMCA5CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnBkbWEwIDg+OwoKdGhlIG51bWJlciBvZiBJdGVtcyBmb3IgZG1hcyBpcyBvbmUsCgp3aGVu
IHRoZXJlIGlzOgoKIMKgwqDCoMKgwqDCoMKgIGRtYXMgPSA8JnBkbWEwIDEwPiwKIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZwZG1hMCA5PiwKIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZwZG1hMCA4PjsKCnRoZSBudW1iZXIgb2Yg
SXRlbXMgaXMgdGhyZWUuCgpCb3RoIG9mIHRoZXNlIGFyZSBlcXVhbCBmcm9tIHBlcnNwZWN0aXZl
IG9mIGR0YywKCmhvd2V2ZXIgZnJvbSBzY2hlbWEgcG9pbnQgb2YgdmlldywgdGhleSBoYXZlIGRp
ZmZlcmVudCBzaXplLgoKCldoYXQgaXMgYSBwcm9wZXIgc29sdXRpb24gdG8gdGhpcyBraW5kIG9m
IHByb2JsZW0/CgpCZXN0IHJlZ2FyZHMsCgpNYWNpZWogRmFsa293c2tpCgo+PiArCj4+ICsgIGRt
YS1uYW1lczoKPj4gKyAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgaWRlbnRpZmllciBzdHJp
bmcgZm9yIGVhY2ggRE1BIHJlcXVlc3QgbGluZSBpbiB0aGUgZG1hcyBwcm9wZXJ0eS4KPj4gKyAg
ICAgIFRoZXNlIHN0cmluZ3MgY29ycmVzcG9uZCAxOjEgd2l0aCB0aGUgb3JkZXJlZCBwYWlycyBp
biBkbWFzLgo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBtaW5JdGVtczogMQo+PiArICAgIG1h
eEl0ZW1zOiAzCj4+ICsKPj4gKyAgY2xvY2stbmFtZXM6Cj4+ICsgICAgb25lT2Y6Cj4+ICsgICAg
ICAtIGl0ZW1zOgo+PiArICAgICAgICAgIC0gY29uc3Q6IGlpcwo+PiArICAgICAgLSBpdGVtczoK
Pj4gKyAgICAgICAgICAtIGNvbnN0OiBpaXMKPj4gKyAgICAgICAgICAtIGNvbnN0OiBpMnNfb3Bj
bGswCj4+ICsgICAgICAtIGl0ZW1zOgo+PiArICAgICAgICAgIC0gY29uc3Q6IGlpcwo+PiArICAg
ICAgICAgIC0gY29uc3Q6IGkyc19vcGNsazAKPj4gKyAgICAgICAgICAtIGNvbnN0OiBpMnNfb3Bj
bGsxCj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4gKyAgICAgICJpaXMiIGlzIHRoZSBpMnMgYnVz
IGNsb2NrLgo+PiArICAgICAgRm9yIGkyczEgYW5kIGkyczIgLSAiaWlzIiwgImkyc19vcGNsazAi
Cj4+ICsgICAgICBGb3IgaTJzMCAtICJpaXMiLCAiaTJzX29wY2xrMCIsICJpMnNfb3BjbGsxIgo+
PiArCj4+ICsgICIjY2xvY2stY2VsbHMiOgo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gKyAgc2Ft
c3VuZyxpZG1hLWFkZHI6Cj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyCj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4gKyAgICAgIEludGVybmFsIERN
QSByZWdpc3RlciBiYXNlIGFkZHJlc3Mgb2YgdGhlIGF1ZGlvCj4+ICsgICAgICBzdWIgc3lzdGVt
KHVzZWQgaW4gc2Vjb25kYXJ5IHNvdW5kIHNvdXJjZSkuCj4+ICsKPj4gKyAgcGluY3RybC0wOgo+
PiArICAgIGRlc2NyaXB0aW9uOiBTaG91bGQgc3BlY2lmeSBwaW4gY29udHJvbCBncm91cHMgdXNl
ZCBmb3IgdGhpcyBjb250cm9sbGVyLgo+PiArCj4+ICsgIHBpbmN0cmwtbmFtZXM6Cj4+ICsgICAg
Y29uc3Q6IGRlZmF1bHQKPj4gKwo+PiArICAiI3NvdW5kLWRhaS1jZWxscyI6Cj4+ICsgICAgY29u
c3Q6IDEKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+
PiArICAtIGRtYXMKPj4gKyAgLSBkbWEtbmFtZXMKPj4gKyAgLSBjbG9ja3MKPj4gKyAgLSBjbG9j
ay1uYW1lcwo+PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAgaTJzMDogaTJzQDM4
MzAwMDAgewo+PiArICAgICAgICBjb21wYXRpYmxlID0gInNhbXN1bmcsczVwdjIxMC1pMnMiOwo+
PiArICAgICAgICByZWcgPSA8MHgwMzgzMDAwMCAweDEwMD47Cj4+ICsgICAgICAgIGRtYXMgPSA8
JnBkbWEwIDEwCj4+ICsgICAgICAgICAgICAgICAgJnBkbWEwIDkKPj4gKyAgICAgICAgICAgICAg
ICAmcGRtYTAgOD47Cj4+ICsgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCIsICJ0eC1zZWMi
Owo+PiArICAgICAgICBjbG9ja3MgPSA8JmNsb2NrX2F1ZHNzIDA+LCAvLyBFWFlOT1NfSTJTX0JV
Uwo+PiArICAgICAgICAgICAgICAgIDwmY2xvY2tfYXVkc3MgMD4sIC8vIEVYWU5PU19JMlNfQlVT
Cj4+ICsgICAgICAgICAgICAgICAgPCZjbG9ja19hdWRzcyAwPjsgLy8gRVhZTk9TX1NDTEtfSTJT
Cj4+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gImlpcyIsICJpMnNfb3BjbGswIiwgImkyc19vcGNs
azEiOwo+PiArICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4+ICsgICAgICAgIHNhbXN1bmcs
aWRtYS1hZGRyID0gPDB4MDMwMDAwMDA+Owo+PiArICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOwo+PiArICAgICAgICBwaW5jdHJsLTAgPSA8JmkyczBfYnVzPjsKPj4gKyAgICAgICAg
I3NvdW5kLWRhaS1jZWxscyA9IDwxPjsKPj4gKyAgICB9Owo+PiArCj4+IC0tCj4+IDIuMTcuMQo+
Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
