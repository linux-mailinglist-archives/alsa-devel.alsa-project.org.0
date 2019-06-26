Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BEE56288
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 08:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78381616;
	Wed, 26 Jun 2019 08:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78381616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561531421;
	bh=e6DWlqa5V8wyhMp8GepAVZf0IJojtnlBi9q8kWgAjKo=;
	h=To:From:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUpdcD43AYoAibg3JUiyuVfwj7GxmX/jhGJBWvGtKUDTlsPvlQqtiBCozcCAIaZg8
	 gGVHAvSVbGEaqd/UWPlHiY1b6GdyHXnNy6k8Sv+4RsGrtc1Re+zCnbMxctsA/C2rF7
	 mYXT1kGp4eNke2ypalHdSqRROkT0AhHshOdfhCpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC84F896CC;
	Wed, 26 Jun 2019 08:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58DD7F896B9; Wed, 26 Jun 2019 08:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD6EF806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 08:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD6EF806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Cy2Z4bFo"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190626064148euoutp024acfa80469ffc87be49d937472c2ce93~rrHOpVitd2733527335euoutp02a
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 06:41:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190626064148euoutp024acfa80469ffc87be49d937472c2ce93~rrHOpVitd2733527335euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1561531308;
 bh=yIoJJvc6Eb5peEiRvNcUCDkcOBErMHu2ZBzdO7RV82I=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=Cy2Z4bFobCyrmRv7ziQkBCo9iriMZfjGoLXr6znhNwza95nMgbOZOxTjrFA4Axtba
 xdH6Sa+gvDGWR0VnwJsf5sfPHeBi5lxzbu3uJ1EqLBIR6lI/+ZEAQABs18ivWtAwQh
 rZJeNohCqX7u8eG1eYtk5Lbj2qRrWIbVJBm5Ubcc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190626064147eucas1p29c55bcfcad997445d92529b9d891ee83~rrHN_Vitx3245732457eucas1p2T;
 Wed, 26 Jun 2019 06:41:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7B.AE.04325.BA3131D5; Wed, 26
 Jun 2019 07:41:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190626064146eucas1p178edbb9f0719427d5c80a51cf64c086f~rrHNINdHu1064210642eucas1p1z;
 Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190626064146eusmtrp115c870f06030884bf2f981d187db5fdd~rrHM6GVZB1523615236eusmtrp1y;
 Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-b9-5d1313ab635e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.3A.04146.AA3131D5; Wed, 26
 Jun 2019 07:41:46 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190626064146eusmtip1cdd0655a2dc87129e6fc7e987e468eb2~rrHMismUL0903009030eusmtip1n;
 Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7a96b050-4ad7-0a9f-41a1-adf27704bf61@samsung.com>
Date: Wed, 26 Jun 2019 08:41:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87a7e5ywqs.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7qrhYVjDS68ULK4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKC6b
 lNSczLLUIn27BK6M+Q86mAtOK1VcbNVoYJwp28XIwSEhYCKx6HlUFyMXh5DACkaJtuMnWCCc
 L4wSux6sYoVwPjNKfLu6hrmLkROs48+2u1CJ5YwSLxdOZYdw3jJKTDzwgg2kSlggXaKj8yPY
 LBGBaUwSK188BGtnEzCU6HrbBVbEK2AnMevLfDCbRUBVYurPTWC2qECMxMP5d6BqBCVOznzC
 AmJzCthKdH9/ywRiMwvISzRvnc0MYYtL3HoynwnivOnsEiduCUPYLhLTT2yCOltY4tXxLewQ
 tozE6ck9YMdJCDQzSjw8t5YdwulhlLjcNIMRospa4vDxi6ygYGIW0JRYv0sfIuwo8e7+XjZI
 6PFJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiWoczwk7nybzTiBUXEWki9nIfls
 FpLPZiHcsICRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZg4jn97/jXHYz7/iQdYhTg
 YFTi4W2QF4oVYk0sK67MPcQowcGsJMK7NFEgVog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcOD
 aCGB9MSS1OzU1ILUIpgsEwenVAMjp3BNu3noDb03rTKdVx592LPgQE2D5MX+c+E1Tjo7oj/N
 fxns6TWvWPdCAGdar+Sb9ies6Xfr3cLrTM2NNi7x9CrdGthvpr/crH7egf9dXYtOP9P9Lfpx
 sp/g4/7Tyg/WOtuu5zw7cfUNF46F/qd8XBOlGXWPvg5MzVv5brFkjXXP0bIFJw8qsRRnJBpq
 MRcVJwIA3fdFlzgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7qrhIVjDe58Ure4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M+Q86mAtO
 K1VcbNVoYJwp28XIySEhYCLxZ9td1i5GLg4hgaWMEvcPrmWFSMhInJzWAGULS/y51sUGUfSa
 UaK1/zcLSEJYIF2io/MjC0hCRGAGk8T0K0egRq1jkXjX/pcRpIpNwFCi6y1IOycHr4CdxKwv
 88FsFgFViak/N4HZogIxEl1Tf7JA1AhKnJz5BMzmFLCV6P7+lgnEZhYwk5i3+SEzhC0v0bx1
 NpQtLnHryXymCYyCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIE
 RtW2Yz8372C8tDH4EKMAB6MSD2+DvFCsEGtiWXFl7iFGCQ5mJRHepYkCsUK8KYmVValF+fFF
 pTmpxYcYTYGem8gsJZqcD4z4vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
 fUwcnFINjAbrpz6OifRwkpL/wbg5STYlyeto17VWHy/ROyeSE5l+L8n7Ujndjst7u90PlmDB
 a+0Ba7PPeE+22331lPCRRoZ1/zazqllN0MiZdFpzzcXwSZ5dV6TPdf2cIc814fdkUdVbHwR3
 mWg7xD203Jo0+QD3lYApU3LyTWs75WcLZnId6PTl6BG4r8RSnJFoqMVcVJwIAOanSHzAAgAA
X-CMS-MailID: 20190626064146eucas1p178edbb9f0719427d5c80a51cf64c086f
X-Msg-Generator: CA
X-RootMTR: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
References: <877e9iwf9f.wl-kuninori.morimoto.gx@renesas.com>
 <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
 <CGME20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c@eucas1p2.samsung.com>
 <9cfc8505-2903-033f-f68b-8ccc1c70132b@samsung.com>
 <87d0j232wg.wl-kuninori.morimoto.gx@renesas.com>
 <80c5c575-6f28-c6a6-91b2-d701bb9fbce8@samsung.com>
 <877e9a2hvn.wl-kuninori.morimoto.gx@renesas.com>
 <c4bb4599-e5d5-926b-75d5-d5c349ed8076@samsung.com>
 <87ef3hz0yn.wl-kuninori.morimoto.gx@renesas.com>
 <87a7e5ywqs.wl-kuninori.morimoto.gx@renesas.com>
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

SGkgS3VuaW5vcmksCgpPbiAyMDE5LTA2LTI2IDAzOjE1LCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToKPiBIaSBNYXJlaywgYWdhaW4KPgo+PiBUaGFuayB5b3UgZm9yIHlvdXIgdGVzdC4KPj4gQW5k
IHNvIHNvcnJ5IHRvIGJvdGhlciB5b3UuCj4+IEkgd2lsbCBmaXh1cCB0aGlzIGlzc3VlLgo+Pgo+
Pj4+Pj4gSSBoYXZlIG5vIGlkZWEgc28gZmFyLCBidXQgb25lIGNhcGFiaWxpdHkgaXMgdGhhdCBp
ZiB5b3VyIHN5c3RlbQo+Pj4+Pj4gdXNlZCAvIGJhc2VkIGR1bW15IHBsYXRmb3JtLCBhbmQgaWYg
eW91ciBDUFUgZHJpdmVyIGRpZG4ndCB1c2UvaGF2ZQo+Pj4+Pj4gc25kX3NvY19zZXRfcnVudGlt
ZV9od3BhcmFtcygpIC8gc25kX3BjbV9saWJfaW9jdGwsCj4+Pj4+PiBpdCBtaWdodCBiZSBoYXBw
ZW4sIGJ1dCB0aGlzIHBhdGNoIHNlZW1zIG5vdCByZWxhdGVkIHRvIGl0Li4uCj4+Pj4+IFJldmVy
dGluZyB0aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSwgc28gaXQgaXMgZGVmaW5pdGVseSByZWxh
dGVkIHNvbWVob3cuCj4+Pj4gQWhoLi4uIE9LIG5vdyBJIHRoaW5rIEkgY291bGQgdW5kZXJzdGFu
ZCB5b3VyIGlzc3VlLgo+Pj4+IFlvdXIgQ1BVIGlzIHVzaW5nIGRldm1fc25kX2RtYWVuZ2luZV9w
Y21fcmVnaXN0ZXIoKSB3aXRoIHNhbWUgKmRldi4KPj4+PiBJbiBzdWNoIGNhc2UsIGluZGVlZCB0
aGlzIHBhdGNoIGJyZWFrcyBzb3VuZCBjYXJkLgo+IEknbSBub3cgbmVnb3RpYXRpbmcgdG8gTWFy
ayB0byByZXZlcnRpbmcgaXNzdWUgcGF0Y2hlcy4KPiBCdXQsIGFzIGFsdGVybmF0aXZlIGlkZWEs
IEkgdGhpbmsgYmVsb3cgcGF0Y2ggY2FuIHNvbHZlIHRoaXMgaXNzdWUuCj4gQ2FuIHlvdSBwbGVh
c2UgdGVzdCBpdCA/Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9zb2MtY29yZS5jIGIvc291bmQvc29jL3NvYy1jb3JlLmMKPiBpbmRleCAzNThmMWZi
Li43OWI5Y2M0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4gKysrIGIvc291
bmQvc29jL3NvYy1jb3JlLmMKPiBAQCAtOTMxLDkgKzkzMSwxMSBAQCBzdGF0aWMgaW50IHNvY19i
aW5kX2RhaV9saW5rKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQsCj4gICAJcnRkLT5jb2RlY19k
YWkgPSBydGQtPmNvZGVjX2RhaXNbMF07Cj4gICAKPiAgIAkvKiBGaW5kIFBMQVRGT1JNIGZyb20g
cmVnaXN0ZXJlZCBQTEFURk9STXMgKi8KPiArCS8qIENQVSBkcml2ZXIgbWlnaHQgaGFzIGJvdGgg
REFJIGFuZCBQTEFURk9STSAqLwo+ICAgCWZvcl9lYWNoX2NvbXBvbmVudChjb21wb25lbnQpIHsK
PiAgIAkJaWYgKCFzbmRfc29jX2lzX21hdGNoaW5nX2NvbXBvbmVudChkYWlfbGluay0+cGxhdGZv
cm1zLAo+IC0JCQkJCQkgICBjb21wb25lbnQpKQo+ICsJCQkJCQkgICBjb21wb25lbnQpICYmCj4g
KwkJICAgICFzbmRfc29jX2lzX21hdGNoaW5nX2NvbXBvbmVudChkYWlfbGluay0+Y3B1cywgY29t
cG9uZW50KSkKPiAgIAkJCWNvbnRpbnVlOwo+ICAgCj4gICAJCXNuZF9zb2NfcnRkY29tX2FkZChy
dGQsIGNvbXBvbmVudCk7Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKWWVzLCB0aGUgYWJvdmUg
Y2hhbmdlIGZpeGVzIHRoZSBpc3N1ZSBvbiBTYW1zdW5nIFNub3csIFBlYWNoLVBpdCBhbmQgClBl
YWNoLVBpIENocm9tZWJvb2tzLCBidXQgY2F1c2VzIHJlZ3Jlc3Npb24gb24gdGhlIG90aGVyIGJv
YXJkcywgZm9yIApleGFtcGxlIGhlcmUgaXMgdGhlIGxvZyBmcm9tIE9kcm9pZCBVMzoKCm1heDk4
MDkwIDEtMDAxMDogTUFYOTgwOTAgUkVWSUQ9MHg0MwptYXg5ODA5MCAxLTAwMTA6IHVzZSBkZWZh
dWx0IDIuOHYgbWljYmlhcwpvZHJvaWQtYXVkaW8gc291bmQ6IHNuZC1zb2MtZHVtbXktZGFpIDwt
PiBzYW1zdW5nLWkycyBtYXBwaW5nIG9rCm9kcm9pZC1hdWRpbyBzb3VuZDogbXVsdGljb2RlYyA8
LT4gc25kLXNvYy1kdW1teS1kYWkgbWFwcGluZyBvawotLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0t
LS0tLS0tLS0tLS0KV0FSTklORzogQ1BVOiAzIFBJRDogODggYXQgZnMvcHJvYy9nZW5lcmljLmM6
MzYxIHByb2NfcmVnaXN0ZXIrMHhmOC8weDEyYwpwcm9jX2Rpcl9lbnRyeSAnc3ViMC9wcmVhbGxv
YycgYWxyZWFkeSByZWdpc3RlcmVkCk1vZHVsZXMgbGlua2VkIGluOgpDUFU6IDMgUElEOiA4OCBD
b21tOiBrd29ya2VyLzM6MSBOb3QgdGFpbnRlZCAKNS4yLjAtcmM2LW5leHQtMjAxOTA2MjQtMDAw
MDQtZzU2MTFlZGIwNWMzNi1kaXJ0eSAjNjIzMwpIYXJkd2FyZSBuYW1lOiBTQU1TVU5HIEVYWU5P
UyAoRmxhdHRlbmVkIERldmljZSBUcmVlKQpXb3JrcXVldWU6IGV2ZW50cyBkZWZlcnJlZF9wcm9i
ZV93b3JrX2Z1bmMKWzxjMDExMjU0OD5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAxMGUw
MDQ+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpCnVzYiAxLTM6IG5ldyBoaWdoLXNwZWVkIFVTQiBk
ZXZpY2UgbnVtYmVyIDMgdXNpbmcgZXh5bm9zLWVoY2kKWzxjMDEwZTAwND5dIChzaG93X3N0YWNr
KSBmcm9tIFs8YzBhYTYzYmM+XSAoZHVtcF9zdGFjaysweDk4LzB4YzQpCls8YzBhYTYzYmM+XSAo
ZHVtcF9zdGFjaykgZnJvbSBbPGMwMTI3NGQ4Pl0gKF9fd2FybisweDEwYy8weDEyNCkKWzxjMDEy
NzRkOD5dIChfX3dhcm4pIGZyb20gWzxjMDEyNzUzND5dICh3YXJuX3Nsb3dwYXRoX2ZtdCsweDQ0
LzB4NjgpCls8YzAxMjc1MzQ+XSAod2Fybl9zbG93cGF0aF9mbXQpIGZyb20gWzxjMDMxZjhiOD5d
IAoocHJvY19yZWdpc3RlcisweGY4LzB4MTJjKQpbPGMwMzFmOGI4Pl0gKHByb2NfcmVnaXN0ZXIp
IGZyb20gWzxjMDMxZmI4OD5dIChwcm9jX2NyZWF0ZV9kYXRhKzB4MzgvMHg0NCkKWzxjMDMxZmI4
OD5dIChwcm9jX2NyZWF0ZV9kYXRhKSBmcm9tIFs8YzA3YTg4YTQ+XSAKKHNuZF9pbmZvX3JlZ2lz
dGVyKzB4ZTQvMHgxM2MpCls8YzA3YTg4YTQ+XSAoc25kX2luZm9fcmVnaXN0ZXIpIGZyb20gWzxj
MDdhODgwND5dIAooc25kX2luZm9fcmVnaXN0ZXIrMHg0NC8weDEzYykKaXJxIGV2ZW50IHN0YW1w
OiAxMjkyMwpoYXJkaXJxcyBsYXN0wqAgZW5hYmxlZCBhdCAoMTI5NDEpOiBbPGMwMTk3NmE4Pl0g
Y29uc29sZV91bmxvY2srMHg0YjgvMHg2YTgKaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMTI5
NTgpOiBbPGMwMTk3MmJjPl0gY29uc29sZV91bmxvY2srMHhjYy8weDZhOApzb2Z0aXJxcyBsYXN0
wqAgZW5hYmxlZCBhdCAoMTI5NTYpOiBbPGMwMTAyNmQ4Pl0gX19kb19zb2Z0aXJxKzB4NGYwLzB4
NWUwCnNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDEyOTc3KTogWzxjMDEyZjZmOD5dIGlycV9l
eGl0KzB4MTYwLzB4MTZjCi0tLVsgZW5kIHRyYWNlIDllMDg2NGQ5MGUyZTA4YWIgXS0tLQpvZHJv
aWQtYXVkaW8gc291bmQ6IEFTb0M6IGZhaWxlZCB0byByZWdpc3RlciBzb3VuZGNhcmQgLTEyCm9k
cm9pZC1hdWRpbyBzb3VuZDogc25kX3NvY19yZWdpc3Rlcl9jYXJkKCkgZmFpbGVkOiAtMTIKb2Ry
b2lkLWF1ZGlvOiBwcm9iZSBvZiBzb3VuZCBmYWlsZWQgd2l0aCBlcnJvciAtMTIKCmhlcmUgaXMg
dGhlIGNvbXBvbmVudCBsaXN0IHJlcG9ydGVkIGJ5IHlvdXIgcHJldmlvdXMgcGF0Y2ggZm9yIHRo
YXQgYm9hcmQ6CgpbwqDCoMKgIDMuMDEyNzgxXSAtLS0tLTM4MzAwMDAuaTJzIDogc2Ftc3VuZy1p
MnMKW8KgwqDCoCAzLjAxNTczNl0gLS0tLS1zbmQtc29jLWR1bW15IDogKG51bGwpClvCoMKgwqAg
My4wMTk1ODhdIC0tLS0tMzgzMDAwMC5pMnMgOiBzbmRfZG1hZW5naW5lX3BjbQpbwqDCoMKgIDMu
MDI0MTIyXSAtLS0tLXNuZC1zb2MtZHVtbXkgOiAobnVsbCkKW8KgwqDCoCAzLjAyNzk5MV0gLS0t
LS1oZG1pLWF1ZGlvLWNvZGVjLjAuYXV0byA6IChudWxsKQpbwqDCoMKgIDMuMDMyNjIwXSAtLS0t
LW1heDk4MDkwLjEtMDAxMCA6IChudWxsKQpbwqDCoMKgIDMuMDc4ODY1XSBtYXg5ODA5MCAxLTAw
MTA6IE1BWDk4MDkwIFJFVklEPTB4NDMKW8KgwqDCoCAzLjA4NTAzOF0gbWF4OTgwOTAgMS0wMDEw
OiB1c2UgZGVmYXVsdCAyLjh2IG1pY2JpYXMKW8KgwqDCoCAzLjExMzQzOF0gb2Ryb2lkLWF1ZGlv
IHNvdW5kOiBzbmQtc29jLWR1bW15LWRhaSA8LT4gc2Ftc3VuZy1pMnMgCm1hcHBpbmcgb2sKW8Kg
wqDCoCAzLjEyMzg0OV0gb2Ryb2lkLWF1ZGlvIHNvdW5kOiBtdWx0aWNvZGVjIDwtPiBzbmQtc29j
LWR1bW15LWRhaSAKbWFwcGluZyBvawpbwqDCoMKgIDMuMjYzMjA4XSBBTFNBIGRldmljZSBsaXN0
OgpbwqDCoMKgIDMuMjY0MjM0XcKgwqAgIzA6IE9kcm9pZC1VMwoKQmVzdCByZWdhcmRzCi0tIApN
YXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
