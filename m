Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A30526D1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 10:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4472D165D;
	Tue, 25 Jun 2019 10:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4472D165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561451974;
	bh=/YBewsF2XRtLASQWj/5rkWi6xo4yzYB2mh899mFLTqU=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLeWGUIzF2a0tMZmbRq6+GW4W88EMOLZMpRSBzGQqFnNJGQuWiq2YN6Ktg4Mi/d2t
	 FxgWxoew5N+bafr8/ptalNlLpa5rsLTiQGmhBppJ5rUA5Q7PNHtszaS9hMCHG1XalY
	 MRAwzgqUE70G89hCvyXxxlv6DZUi02Nh+svszGmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1875F896F9;
	Tue, 25 Jun 2019 10:37:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3E9F896F9; Tue, 25 Jun 2019 10:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444FBF8075C
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 10:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444FBF8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="SpWNY5IW"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190625083738euoutp01c61ee6c81170386c5422f8e91ffe71ed~rZDEupiHw2087620876euoutp015
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 08:37:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190625083738euoutp01c61ee6c81170386c5422f8e91ffe71ed~rZDEupiHw2087620876euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1561451858;
 bh=gUu1qsugbXLl7Y57N5vJ22G83Wm3d4LP+lI00mJSLcM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SpWNY5IW3dSuEcQXLiZWpNM1sYrYihlA6jbVy5oRw4b8pQjLNSjwB7l+LNABplUd1
 dTC5qvJ9ZhvMVDoketMDroY/eVWnUSvCpwlRH8pQ7A/dZIUGLbikE9wIhKeH5FM66G
 tTA28HrTSmqkSfbywrK/8U8fljWY2YQdUGvDpoJU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190625083737eucas1p23a40597cdfe362ff3dd59803538ec942~rZDEOiz4I0854908549eucas1p2B;
 Tue, 25 Jun 2019 08:37:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2A.A9.04298.15DD11D5; Tue, 25
 Jun 2019 09:37:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190625083736eucas1p22826431f49ee09a9a10854135d8daf7a~rZDDiU73c1982019820eucas1p2m;
 Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190625083736eusmtrp1f0610bf8870a7154deba28afc3769434~rZDDUQ4Nq1447714477eusmtrp1V;
 Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-49-5d11dd51e6f9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 43.28.04140.05DD11D5; Tue, 25
 Jun 2019 09:37:36 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190625083736eusmtip264612efb5d2fcb40b976e028ba6f4085~rZDC93EJL1363613636eusmtip2y;
 Tue, 25 Jun 2019 08:37:36 +0000 (GMT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c4bb4599-e5d5-926b-75d5-d5c349ed8076@samsung.com>
Date: Tue, 25 Jun 2019 10:37:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <877e9a2hvn.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7qBdwVjDb4ukrS4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKC6b
 lNSczLLUIn27BK6Mk18sCmbyV7z9tJC5gfEETxcjJ4eEgInEmt6VLF2MXBxCAisYJfb8/sUM
 4XxhlOg7thTK+cwo0db+lBWmpWvJdFaIxHJGiSlta8ESQgJvGSVWT+ECsYUF0iU6Oj+ygNgi
 AhYSLR82g+1gFnjAKLFv0nOwBjYBQ4mut11sIDavgJ3EtfnbwWwWAVWJezs3MoPYogIxEg/n
 34GqEZQ4OfMJ2FBOAVuJdx3z2UFsZgF5ieats5khbHGJW0/mM4EskxBYxS6x7fAPNoizXSTe
 L/jKAmELS7w6voUdwpaROD25hwWioZlR4uG5tewQTg+jxOWmGYwQVdYSh49fBDqbA2iFpsT6
 XfoQYUeJd/f3soGEJQT4JG68FYQ4gk9i0rbpzBBhXomONiGIajWJWcfXwa09eOES8wRGpVlI
 XpuF5J1ZSN6ZhbB3ASPLKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMDUc/rf8U87GL9e
 SjrEKMDBqMTDu+CIQKwQa2JZcWXuIUYJDmYlEd6liUAh3pTEyqrUovz4otKc1OJDjNIcLEri
 vNUMD6KFBNITS1KzU1MLUotgskwcnFINjFkV0Z4GjHtNvl2bGGvxmHFPbYZLr1ih6afL9x6q
 KfRN2++//PDuBfqPd3s/WVf93OHJS5vVP3eVyDHP8WA+03zbZTnjp3vqq1vu/C1lXRjzZnpR
 2dr4D10fc9evmiRRG//A1JK5KvFe2xq5AEWGn641Ppzpt1RNCtmvhb6J1GjlzO5au+fiLiWW
 4oxEQy3mouJEAFgYZXU5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7oBdwVjDc4+VLe4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mk18sCmby
 V7z9tJC5gfEETxcjJ4eEgIlE15LprCC2kMBSRonpt8Uh4jISJ6c1sELYwhJ/rnWxdTFyAdW8
 ZpS49+YiE0hCWCBdoqPzIwuILSJgIdHyYTMLSBGzwANGiWtvX0J1TGaWuN2+CqyKTcBQoust
 yChODl4BO4lr87eD2SwCqhL3dm5kBrFFBWIkuqb+ZIGoEZQ4OfMJmM0pYCvxrmM+O4jNLGAm
 MW/zQ2YIW16ieetsKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07M
 LS7NS9dLzs/dxAiMtW3Hfm7Zwdj1LvgQowAHoxIP74IjArFCrIllxZW5hxglOJiVRHiXJgKF
 eFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YBvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmk
 J5akZqemFqQWwfQxcXBKNTCekv2VZrw/yuqLm+uz4srgZ3el3Cp3XnrPP/twz5UDXn7H7l36
 a8yk/neL4gGuqmW8d4+slf/u180580i8QqZ5Y17OtS9L+59J7eTJnlX1edU86ZR5P96fF0pJ
 Xm6UKf+mqKbXYUuWsVXQv6w0Zol1JdwObfpndl84Vj2hzPHUhPNK+Y/uTytSYinOSDTUYi4q
 TgQAkNqV9ssCAAA=
X-CMS-MailID: 20190625083736eucas1p22826431f49ee09a9a10854135d8daf7a
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

SGkgS3VuaW5vcmksCgpPbiAyMDE5LTA2LTI1IDEwOjI1LCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToKPj4+IEkgaGF2ZSBubyBpZGVhIHNvIGZhciwgYnV0IG9uZSBjYXBhYmlsaXR5IGlzIHRoYXQg
aWYgeW91ciBzeXN0ZW0KPj4+IHVzZWQgLyBiYXNlZCBkdW1teSBwbGF0Zm9ybSwgYW5kIGlmIHlv
dXIgQ1BVIGRyaXZlciBkaWRuJ3QgdXNlL2hhdmUKPj4+IHNuZF9zb2Nfc2V0X3J1bnRpbWVfaHdw
YXJhbXMoKSAvIHNuZF9wY21fbGliX2lvY3RsLAo+Pj4gaXQgbWlnaHQgYmUgaGFwcGVuLCBidXQg
dGhpcyBwYXRjaCBzZWVtcyBub3QgcmVsYXRlZCB0byBpdC4uLgo+PiBSZXZlcnRpbmcgdGhpcyBw
YXRjaCBmaXhlcyB0aGUgaXNzdWUsIHNvIGl0IGlzIGRlZmluaXRlbHkgcmVsYXRlZCBzb21laG93
Lgo+IEFoaC4uLiBPSyBub3cgSSB0aGluayBJIGNvdWxkIHVuZGVyc3RhbmQgeW91ciBpc3N1ZS4K
PiBZb3VyIENQVSBpcyB1c2luZyBkZXZtX3NuZF9kbWFlbmdpbmVfcGNtX3JlZ2lzdGVyKCkgd2l0
aCBzYW1lICpkZXYuCj4gSW4gc3VjaCBjYXNlLCBpbmRlZWQgdGhpcyBwYXRjaCBicmVha3Mgc291
bmQgY2FyZC4KPgo+IENhbiBJIGNvbmZpcm0gaXQgPwo+IEluIGxvY2FsIGVtYWlsLCBJIGFza2Vk
IHByaW50aW5nIGNvbXBvbmVudCBuYW1lIGxpc3QuCj4gQ2FuIHlvdSBwbGVhc2UgcmVwbGFjZSBp
dCB0byBiZWxvdyA/Cj4gSSB0aGluayBkaXNhcHBlYXIgY29tcG9uZW50IGlzICJzbmRfZG1hZW5n
aW5lX3BjbSIuCj4gSWYgc28sIGFib3ZlIG15IHBhdGNoIGlzIHRoZSBidWcuCj4KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1jb3JlLmMg
Yi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+IGluZGV4IDRjZDc3Y2QuLjRiMWY4YWUgMTAwNjQ0Cj4g
LS0tIGEvc291bmQvc29jL3NvYy1jb3JlLmMKPiArKysgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+
IEBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGljIGludCBzbmRfc29jX3J0ZGNvbV9hZGQoc3RydWN0
IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCwKPiAgIAluZXdfcnRkY29tLT5jb21wb25lbnQgPSBj
b21wb25lbnQ7Cj4gICAJSU5JVF9MSVNUX0hFQUQoJm5ld19ydGRjb20tPmxpc3QpOwo+ICAgCj4g
KwlwcmludGsoIi0tLS0tJXMgOiAlc1xuIiwgY29tcG9uZW50LT5uYW1lLCBjb21wb25lbnQtPmRy
aXZlci0+bmFtZSk7Cj4gICAJbGlzdF9hZGRfdGFpbCgmbmV3X3J0ZGNvbS0+bGlzdCwgJnJ0ZC0+
Y29tcG9uZW50X2xpc3QpOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgaGVscCAhIQoKcHVyZSBuZXh0LTIwMTkw
NjI0OgoKW8KgwqDCoCAzLjU0OTcxMl0gLS0tLS0zODMwMDAwLmkycyA6IHNhbXN1bmctaTJzClvC
oMKgwqAgMy43Njc3MzJdIC0tLS0tbWF4OTgwOTUuNy0wMDExIDogKG51bGwpClvCoMKgwqAgMy45
ODYzNzBdIC0tLS0taGRtaS1hdWRpby1jb2RlYy4zLmF1dG8gOiAobnVsbCkKCm5leHQtMjAxOTA2
MjQgKyBSZXZlcnQgIkFTb0M6IHNhbXN1bmc6IHNub3c6IGRvbid0IHNlbGVjdCB1bm5lY2Vzc2Fy
eSAKUGxhdGZvcm0iOgoKW8KgwqDCoCAzLjUwODM5MV0gLS0tLS0zODMwMDAwLmkycyA6IHNhbXN1
bmctaTJzClvCoMKgwqAgMy43MjYzMzJdIC0tLS0tbWF4OTgwOTUuNy0wMDExIDogKG51bGwpClvC
oMKgwqAgMy45NDQ5MDZdIC0tLS0taGRtaS1hdWRpby1jb2RlYy4zLmF1dG8gOiAobnVsbCkKW8Kg
wqDCoCA0LjM3NjYzOV0gLS0tLS0zODMwMDAwLmkycyA6IHNuZF9kbWFlbmdpbmVfcGNtCgoKQmVz
dCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRl
IFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
