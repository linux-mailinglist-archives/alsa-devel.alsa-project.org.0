Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0AE522E9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 07:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78EE165D;
	Tue, 25 Jun 2019 07:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78EE165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561441115;
	bh=HtpPvBytsxOFQe76vRX6NJBYogn+wyKVYpeBMaTm6xk=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eSn9sfFizUvfMg9kYacIMV1rxv/ua8KFeSz3tDHdO4yQ9oM+Y48WTL5ZUIpbv3XyB
	 qB9bUG8j8x6Xd9C2cWjeXHSBq8UO3JDpZy+iGAZU1vf05fLZTQTUZhLKk8QuuvXWjh
	 DeWjG0MwLCN9NiPXw3W4XY7zBuwhAKUsu//3pqJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B087F896FD;
	Tue, 25 Jun 2019 07:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C26D4F896F9; Tue, 25 Jun 2019 07:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 214F4F896EA
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 07:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 214F4F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="TMtAzmaC"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190625053639euoutp0131a15e9643286538faf91a0c0cfb9c32~rWlDzWznR1835618356euoutp01h
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 05:36:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190625053639euoutp0131a15e9643286538faf91a0c0cfb9c32~rWlDzWznR1835618356euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1561440999;
 bh=uScNoZesmYLMa3NIs+nFiJ45ln9qRAf3qeTJ8h9cAa4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=TMtAzmaCR5qSnPT7RAxIpyNod0Zy95wNqFNOytBSV10du48MiWIxpOP8OGvC3Ne1i
 4gPHkq9lGoeYHEa/CN9hm/rNX4Ae2UQZfvSl8hZtejYnfqzvEcuMUnRPDU11ovoIUU
 y/4Iygv8Wxc7XUv+OmAFI1YGRvsggkaNPppmEv+4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190625053639eucas1p26f858a1e1a05a9ac8b0271146ac106b2~rWlDW5XLV2882428824eucas1p2M;
 Tue, 25 Jun 2019 05:36:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A9.51.04298.6E2B11D5; Tue, 25
 Jun 2019 06:36:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190625053638eucas1p1e4bcdf8a627054556921f5929f5b0b58~rWlCkYCO62894228942eucas1p1R;
 Tue, 25 Jun 2019 05:36:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190625053637eusmtrp26c1c1037468d691a0f92a7fda318adab~rWlCWTOAU2961529615eusmtrp2L;
 Tue, 25 Jun 2019 05:36:37 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-96-5d11b2e6e16c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9F.92.04140.5E2B11D5; Tue, 25
 Jun 2019 06:36:37 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190625053637eusmtip1da623b534cee562b5f28d902611293d1~rWlCBtXbJ0323303233eusmtip1b;
 Tue, 25 Jun 2019 05:36:37 +0000 (GMT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <80c5c575-6f28-c6a6-91b2-d701bb9fbce8@samsung.com>
Date: Tue, 25 Jun 2019 07:36:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87d0j232wg.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7rPNgnGGsw6om1x5eIhJoupD5+w
 WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUVw2
 Kak5mWWpRfp2CVwZH57MYC9Yzl+xbsELpgbGAzxdjJwcEgImEmcOLGHsYuTiEBJYwSjRvXsl
 K4TzhVHi2s6DUM5nRonVX/exwrQ8fHsZqmU5o8TambvYIZy3jBLfOx6AVQkLpEt0dH5kAbFF
 BCwkWj5sZgEpYhZ4wCixb9JzsCI2AUOJrrddbCA2r4CdxL+525hBbBYBVYkdH1+yg9iiAjES
 D+ffgaoRlDg58wnYUE4BW4kXRzrAbGYBeYnmrbOZIWxxiVtP5jOBLJMQWMUusXr9RXaIu10k
 lrx8wAhhC0u8Or4FKi4j8X8nTEMzo8TDc2vZIZweRonLTTOgOqwlDh+/CHQ2B9AKTYn1u/Qh
 wo4S7+7vZQMJSwjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQvDYL
 yTuzkLwzC2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIHp5/S/4592MH69lHSI
 UYCDUYmHd8ERgVgh1sSy4srcQ4wSHMxKIrxLE4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZ
 HkQLCaQnlqRmp6YWpBbBZJk4OKUaGI3qNL4HqIuW7sgw9LH/kXYq9cbjozN3zWi7ePWl29rV
 D2Xv9ZzUcuiMrPE21fBQ+5Z06d79L1NWNrKIb3gfcvSt6af49TY2DKcN7v9qyBFkvFFS980n
 zL5tUu6RrTcV/+emXXjbevp6MTvjw1i2ul2ZD2z2/puyWp2pV+F7ck+C3dp3HDnXNiixFGck
 GmoxFxUnAgAxnvDXOwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xu7pPNwnGGtz8ZWVx5eIhJoupD5+w
 WZw/v4Hd4tXhXYwWM87vY7I4/Kad1YHNY8PnJjaPTas62Ty+nZnI4tG3ZRWjx+dNcgGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZH57MYC9Y
 zl+xbsELpgbGAzxdjJwcEgImEg/fXmbsYuTiEBJYyihxrf0LI0RCRuLktAZWCFtY4s+1LjaI
 oteMEs1rr4MlhAXSJTo6P7KA2CICFhItHzazgBQxCzwAmvT2JRtIQkhgNZPExWuiIDabgKFE
 19susDivgJ3Ev7nbmEFsFgFViR0fX7KD2KICMRJdU3+yQNQISpyc+QTM5hSwlXhxpAPMZhYw
 k5i3+SEzhC0v0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn
 5haX5qXrJefnbmIERtu2Yz+37GDsehd8iFGAg1GJh3fBEYFYIdbEsuLK3EOMEhzMSiK8SxOB
 QrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAR5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE
 0hNLUrNTUwtSi2D6mDg4pRoYKyuEP3JFs118tkeqpN6ZPezktQ0FT3TPmj/yvDyfn9H/Q3fU
 jk2z6h++3PM6s5Z/KveTwxUut1/ce9Ect+r7k+RFWVPcpsvx3D/8pmDt8g1+hzZrrai5J7h9
 dnirD5N1OLPgmpU3JmV/uRXOx6U7iVWco2lZS73j+dyN5dwuF65YLhOYe/fxfCWW4oxEQy3m
 ouJEAJL46NrMAgAA
X-CMS-MailID: 20190625053638eucas1p1e4bcdf8a627054556921f5929f5b0b58
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
Cc: 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
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

SGkgS3VuaW5vcgoKT24gMjAxOS0wNi0yNSAwMjo1MSwgS3VuaW5vcmkgTW9yaW1vdG8gd3JvdGU6
Cj4gSGkgTWFyZWsKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBvcnQuCj4KPj4+IEFMU0EgU29D
IGlzIG5vdyBzdXBwb3J0aW5nICJubyBQbGF0Zm9ybSIuIFNvdW5kIGNhcmQgZG9lc24ndCBuZWVk
IHRvCj4+PiBzZWxlY3QgIkNQVSBjb21wb25lbnQiIGFzICJQbGF0Zm9ybSIgYW55bW9yZSBpZiBp
dCBkb2Vzbid0IG5lZWQKPj4+IHNwZWNpYWwgUGxhdGZvcm0uCj4+PiBUaGlzIHBhdGNoIHJlbW92
ZXMgc3VjaCBzZXR0aW5ncy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90
byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4+IFRoaXMgcGF0Y2ggY2F1c2Vz
IHJlZ3Jlc3Npb24gb24gU2Ftc3VuZyBFeHlub3MtYmFzZWQgYm9hcmRzOiBTbm93LAo+PiBQZWFj
aC1QaSBhbmQgUGVhY2gtUGl0IChhbGwgdGhhdCB1c2Ugc25vdyBtYWNoaW5lIGRyaXZlcikgc2lu
Y2UgbGludXgKPj4gbmV4dC0yMDE5MDYyMC4gQVNvQyBkZXZpY2UgaXMgcHJvcGVybHkgcmVnaXN0
ZXJlZCwgYnV0IGl0IGlzIG5vdCB1c2FibGU6Cj4+Cj4+IFvCoMKgwqAgMy4yMDMwMDZdIHNhbXN1
bmctaTJzIDM4MzAwMDAuaTJzLXNlYzogRE1BIGNoYW5uZWxzIHNvdXJjZWQgZnJvbQo+PiBkZXZp
Y2UgMzgzMDAwMC5pMnMKPj4gW8KgwqDCoCAzLjIxMzQ0MF0gc25vdy1hdWRpbyBzb3VuZDogRmFp
bGVkIHBhcnNpbmcgY29kZWMgbm9kZQo+PiBbwqDCoMKgIDMuNDIzMjQxXSBzbm93LWF1ZGlvIHNv
dW5kOiBtdWx0aWNvZGVjIDwtPiBzYW1zdW5nLWkycyBtYXBwaW5nIG9rCj4+IFvCoMKgwqAgMy40
Mjk3NzZdIG1heDk4MDk1IDctMDAxMTogQVNvQzogbXV4IEV4dGVybmFsIE1JQyBoYXMgbm8gcGF0
aHMKPj4gW8KgwqDCoCAzLjQzNDUxM10gbWF4OTgwOTUgNy0wMDExOiBBU29DOiBtdXggTGluZWlu
IE11eCBoYXMgbm8gcGF0aHMKPj4gW8KgwqDCoCA0LjA0MzQ4OF0gQUxTQSBkZXZpY2UgbGlzdDoK
Pj4gW8KgwqDCoCA0LjA0NzE3MV3CoMKgICMwOiBTbm93LUkyUy1NQVg5ODA5NQo+Pgo+PiAjIHNw
ZWFrZXItdGVzdCAtbDEKPj4KPj4gc3BlYWtlci10ZXN0IDEuMS4zCj4+Cj4+IFBsYXliYWNrIGRl
dmljZSBpcyBkZWZhdWx0Cj4+IFN0cmVhbSBwYXJhbWV0ZXJzIGFyZSA0ODAwMEh6LCBTMTZfTEUs
IDEgY2hhbm5lbHMKPj4gVXNpbmcgMTYgb2N0YXZlcyBvZiBwaW5rIG5vaXNlCj4+IFBsYXliYWNr
IG9wZW4gZXJyb3I6IC0yMixJbnZhbGlkIGFyZ3VtZW50Cj4gSG1tLi4gc3RyYW5nZS4uLgo+IENh
biB5b3UgdGVzdCBub3JtYWwgYXBsYXkgaGVyZSA/IEknbSBub3QgZmFtaWxpYXIgd2l0aCBzcGVh
a2VyLXRlc3QuCgpUaGUgc2FtZSBpc3N1ZToKCiMgYXBsYXkgL3Vzci9zaGFyZS9zb3VuZHMvYWxz
YS9Gcm9udF9DZW50ZXIud2F2CmFwbGF5OiBtYWluOjc4ODogYXVkaW8gb3BlbiBlcnJvcjogSW52
YWxpZCBhcmd1bWVudAojCgoKPiBJIGhhdmUgbm8gaWRlYSBzbyBmYXIsIGJ1dCBvbmUgY2FwYWJp
bGl0eSBpcyB0aGF0IGlmIHlvdXIgc3lzdGVtCj4gdXNlZCAvIGJhc2VkIGR1bW15IHBsYXRmb3Jt
LCBhbmQgaWYgeW91ciBDUFUgZHJpdmVyIGRpZG4ndCB1c2UvaGF2ZQo+IHNuZF9zb2Nfc2V0X3J1
bnRpbWVfaHdwYXJhbXMoKSAvIHNuZF9wY21fbGliX2lvY3RsLAo+IGl0IG1pZ2h0IGJlIGhhcHBl
biwgYnV0IHRoaXMgcGF0Y2ggc2VlbXMgbm90IHJlbGF0ZWQgdG8gaXQuLi4KClJldmVydGluZyB0
aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSwgc28gaXQgaXMgZGVmaW5pdGVseSByZWxhdGVkIHNv
bWVob3cuCgoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBS
JkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
