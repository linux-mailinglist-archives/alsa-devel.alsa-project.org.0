Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA21262BA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 13:56:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E49615F8;
	Thu, 19 Dec 2019 13:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E49615F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576760191;
	bh=BbjDO4B7tH/OK7WKIA1hXoRxMTi8P66ngEjsowSSXIY=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQGGOZunhiORganjgdei4AjSDOshpny5Lws4ype0L76Qh18ueV2NLNMYG64lq+LKr
	 +A1p2MshoDyfvSXD2kq+B1ktUM9TwjJnR5Z93KdUVmfCoRYscqH/jKbRUDCqsRBCdU
	 GXl7wFs5JK3vMWnkO17xPg15WwzEarfPdVJl2HTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6F0F8023F;
	Thu, 19 Dec 2019 13:54:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1653F80234; Thu, 19 Dec 2019 13:54:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6E63F8013E
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 13:54:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E63F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="t0sUmwc+"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191219125439euoutp017f6355c44f0dfbe008d06665745b876b~hxvA5Xhoc0030800308euoutp01s
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 12:54:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191219125439euoutp017f6355c44f0dfbe008d06665745b876b~hxvA5Xhoc0030800308euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576760079;
 bh=Hrht/d8GmcmFKanCFb5HqQzFkDSgRpXPsI3GIUQrdvQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=t0sUmwc+rRMnzzc6+FcUxxvFdvYLo5RUaxOyFeM2KGpvLu5kUoW2GPDO/6S/A7A35
 Wi7J1Qmw6tS/EIQbCMyeugHC85M0DPgNy4wjznXdibol0R+xDVbAAV4oXC0S2a5XfX
 JyuUGYlFy1w0ltBgpGKHgGZX8Sv4AjmLi9ptEE9w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191219125439eucas1p1fd8a6f5514f76c3a3ddd866b56f5adfe~hxvAqAb0U3025930259eucas1p1N;
 Thu, 19 Dec 2019 12:54:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8F.AD.61286.F037BFD5; Thu, 19
 Dec 2019 12:54:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191219125438eucas1p1bd6e07610053d800a79e16bbb5123d60~hxvABMTkU0449204492eucas1p1r;
 Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191219125438eusmtrp2ad1ac7f668c1f7421752ee90316c1f1f~hxvAAiLKb2126321263eusmtrp2f;
 Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-b1-5dfb730fa908
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AC.CC.07950.E037BFD5; Thu, 19
 Dec 2019 12:54:38 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219125438eusmtip288e95f87ccb2fbe348a7f8cb45439211~hxu-gvtUA2426024260eusmtip2E;
 Thu, 19 Dec 2019 12:54:38 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
Date: Thu, 19 Dec 2019 13:54:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219123709.GB5047@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7r8xb9jDWZdF7C4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
 PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AexWWTkpqTWZZapG+XwJXxd3N0wT7BikcHHzM2
 MM7i62Lk5JAQMJG4tvEPSxcjF4eQwApGicszb7FDOF8YJf5sOsoM4XxmlPg24yhrFyMHWMus
 1QIQ8eWMEicWz4Fqf8socf/3fHaQucICeRIHl6xmA7FFBJQlrn7fC1bELNDHLHHqzQ2wBJuA
 oUTX2y42kKm8AnYSmxq0QMIsAqoS5x41sYCERQViJTqWZ4CEeQUEJU7OfMICYnMKGEks3fAL
 bAqzgLxE89bZzBC2uMStJ/OZQFZJCFxjl3i6dTEjxNEuEi+eG0C8LCzx6vgWdghbRuL/Tpj6
 ZkaJh+fWskM4PcCwaJrBCFFlLXH4+EWw75kFNCXW79KHCDtKzL73mRliPp/EjbeCEDfwSUza
 Nh0qzCvR0SYEUa0mMev4Ori1By9cYp7AqDQLyWezkHwzC8k3sxD2LmBkWcUonlpanJueWmyY
 l1quV5yYW1yal66XnJ+7iRGYrE7/O/5pB+PXS0mHGAU4GJV4eB3SfscKsSaWFVfmHmKU4GBW
 EuG93fEzVog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OKWCi
 EeFIiff9d2qtemP8p1nNgg+sfzZ3tkW4TJSVYHjLPSVzUom/aNn+p0oJ/jKcG9zF1T96Xwvc
 KbbyutwCM5Mlyu9e7lwg85/hQW24xReu/LJ3ZRysYtXmK+Tef3O/2/d25grLgxMnhSevnmL+
 TtS9Z8onG66n/c51C0IeXfiY5Lx9gv7fFYpKLMUZiYZazEXFiQBOJ7mDUgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsVy+t/xe7p8xb9jDba+VLS4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
 PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
 Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxd3N0wT7BikcHHzM2MM7i62Lk4JAQMJGYtVqgi5GT
 Q0hgKaPEnydaILaEgIzEyWkNrBC2sMSfa11sXYxcQDWvgWqmnGUHSQgL5EkcXLKaDcQWEVCW
 uPp9LwtIEbNAH7PEjstzWCE6XjFLTNo/E6yDTcBQoustyCgODl4BO4lNDWDbWARUJc49amIB
 sUUFYiW+r/zECGLzCghKnJz5BCzOKWAksXTDL7BlzAJmEvM2P2SGsOUlmrfOhrLFJW49mc80
 gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA+Nx27OeWHYxd
 74IPMQpwMCrx8Dqk/Y4VYk0sK67MPcQowcGsJMJ7u+NnrBBvSmJlVWpRfnxRaU5q8SFGU6Dn
 JjJLiSbnA1NHXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRvcl
 63PTA2t1dXZ8afaL/HHUo2SmxsT/xcb1rqxTo84E+7wuf3RgbQ0b7x353YntGoo883uvnN3l
 eyfn1nN/QeNMrgqvBXe2v2Td3vfgELP699w5evGpe0wLRfreMF7ml7E10y5Q7dg762O33drA
 p30/NtrMeNiu5/lKdu9fb7v45V5KcgtWKbEUZyQaajEXFScCADCRm8LlAgAA
X-CMS-MailID: 20191219125438eucas1p1bd6e07610053d800a79e16bbb5123d60
X-Msg-Generator: CA
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

SGkgTWFyaywKCk9uIDE5LjEyLjIwMTkgMTM6MzcsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gVGh1
LCBEZWMgMTksIDIwMTkgYXQgMDk6MDM6NDJBTSArMDEwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToKPj4gT24gMTguMTIuMjAxOSAxNzoyNCwgTWFyayBCcm93biB3cm90ZToKPj4KPj4gSSd2ZSBj
aGVja2VkIGFnYWluIHRoZSBleGFjdCBwcm9iZSBvcmRlciBhbmQgaGVyZSBpcyB3aGF0IGhhcHBl
bnMgaW4gdGhlCj4+IHN5c3RlbToKPj4KPj4gMS4gZmlyc3QgY2FsbCB0byBvZHJvaWRfYXVkaW9f
cHJvYmUoKSBpcyBqdXN0IGFmdGVyOgo+Pgo+PiBbICAgIDIuOTQyNDI4XSBzYW1zdW5nLWkycyAz
ODMwMDAwLmkycy1zZWM6IERNQSBjaGFubmVscyBzb3VyY2VkIGZyb20gZGV2aWNlIDM4MzAwMDAu
aTJzCj4+Cj4+IDIuIFRoYXQgdGltZSwgaTJzIGRhaSBhbmQgbWF4OTgwOTAgZGV2aWNlcyBhcmUg
YWxyZWFkeSByZWdpc3RlcmVkLgo+PiBIb3dldmVyIHRoZSBzbmRfc29jX29mX2dldF9kYWlfbGlu
a19jb2RlY3MoKSByZXR1cm4gLUVQUk9CRV9ERUZFUiwKPj4gYmVjYXVzZSBpdCBjYW5ub3QgZ2V0
IHRoZSBIRE1JIGNvZGVjIGNvbXBvbmVudC4KPj4KPj4gMy4gSERNSSBjb2RlYyBpcyBiZWluZyBy
ZWdpc3RlcmVkIHdoZW4gRXh5bm9zIERSTSBpbml0aWFsaXplcy4gVGhpcwo+PiBoYXBwZW5zIGxh
dGVyOgo+Pgo+PiBbwqDCoMKgIDMuMTI3ODMzXSBbZHJtXSBJbml0aWFsaXplZCBleHlub3MgMS4x
LjAgMjAxODAzMzAgZm9yIGV4eW5vcy1kcm0gb24KPj4gbWlub3IgMAo+Pgo+PiA0LiBUaGVuIG9k
cm9pZF9hdWRpb19wcm9iZSgpIGlzIGNhbGxlZCBhZ2FpbiBmcm9tIHRoZSBkZWZlcnJlZCBwcm9i
ZQo+PiB3b3JrZXIgYW5kIHN1Y2NlZWRzOgo+Pgo+PiBbwqDCoMKgIDMuNTAxMTk4XSBBTFNBIGRl
dmljZSBsaXN0Ogo+PiBbwqDCoMKgIDMuNTAxMzAwXcKgwqAgIzA6IE9kcm9pZC1VMwo+PiA1LiBU
aGVuIHVzZXJzcGFjZSBzdGFydHM6Cj4+IFvCoMKgwqAgMy42MDM4MjVdIFJ1biAvc2Jpbi9pbml0
IGFzIGluaXQgcHJvY2Vzcwo+Pgo+PiA2LiB3aGVuIHVzZXJzcGFjZSBpbml0IHNjcmlwdHMgKGFs
c2FjdGwpIGVudW1lcmF0ZXMgZGV2aWNlcyBpbiB0aGUKPj4gc3lzdGVtIHRoZSBsb2NrZGVwIHdh
cm5pbmcgaXMgdHJpZ2dlcmVkOgo+Pgo+PiBbICAgMTAuMDY4OTkwXSA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gWyAgIDEwLjA3MDk3MF0g
V0FSTklORzogcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IGRldGVjdGVkCj4+
IFsgICAxMC4wNzcxMzZdIDUuNS4wLXJjMi1uZXh0LTIwMTkxMjE4ICM3MTg4IE5vdCB0YWludGVk
Cj4+IFsgICAxMC4wODIxNjhdIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiBbICAgMTAuMDg4MzMyXSBhbHNhY3RsLzExMDYgaXMgdHJ5aW5n
IHRvIGFjcXVpcmUgbG9jazoKPj4KPj4gNy4gdGhlbiBhbHNhIHV0aWxzIHByb2JhYmx5IHRyaWVz
IHRvIGxvYWQgdGhlIHNhdmVkIHZhbHVlcyBmb3IgdGhlIGNvbnRyb2xzLCB3aGF0IHRyaWdnZXJz
IHRoZSBOVUxMIHB0ciBkZXJlZmVyZW5jZToKPj4KPj4gWy4uLi5dIFNldHRpbmcgdXAgQUxTQS4u
LlsgICAxMC41MDI2NzJdIDg8LS0tIGN1dCBoZXJlIC0tLQo+PiBbICAgMTAuNTAyNzcyXSBVbmFi
bGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBh
ZGRyZXNzIDAwMDAwMGIwCj4gT0ssIHNvIHRoaXMgaXMgcHJvYmFibHkgcmVsYXRlZCB0byBzb21l
IG9mIE1vcmltb3RvLXNhbidzIGJpc2VjdGlvbnMuCj4gSXMgdGhlcmUgYW55IGNoYW5jZSB5b3Ug
Y291ZGxkIGRvIGEgYmlzZWN0IHRvIHRyeSB0byBpc29sYXRlIHdoZXJlCj4gdGhpbmdzIGdvIHdy
b25nPwoKSSBjYW4gZG8gdGhlIGJpc2VjdCwgYnV0IHBsZWFzZSBsZXQgbWUga25vdyBleGFjdGx5
IHdoYXQgdG8gYmlzZWN0LgoKVGhlIGluaXRpYWwgYmlzZWN0aW9uIEkgZGlkIHdhcyBmcm9tIHY1
LjUtcmMxIHRvIGxpbnV4LW5leHQgYW5kIHBvaW50ZWQgCnRvIHRoZSAkc3ViamVjdCBjb21taXQu
CgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0
aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
