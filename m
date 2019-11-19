Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A44102C7C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 20:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFE581690;
	Tue, 19 Nov 2019 20:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFE581690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574191354;
	bh=h1C8OGhriMIGaUGmKxpVYkH3j7aJCn/NArVaXLXxOeQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8jr50G6Qel+kTWttIrhfLEyNZIfJPDm0Q2nnaZIVcvk51yO69yizD5xs4t2ZNuZH
	 t06cPfAzcyFytjykzmwsoqctqpnrCxuYSdFSfHskLmZPxNeL9x7ZEuPIvNRJNdeky1
	 OTHY5pnfKABfcG9/vpY4W/WCqXovNsoOGRNuikbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 553F3F80145;
	Tue, 19 Nov 2019 20:20:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13CCCF80138; Tue, 19 Nov 2019 20:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8717CF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8717CF800F4
Received: from [192.168.178.21] ([95.116.123.164]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKt3r-1iGrmj1sAH-00LFly for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019
 20:20:44 +0100
To: alsa-devel@alsa-project.org
References: <s5ho9nt3yu7.wl-tiwai@suse.de>
 <6ab06af6-71f3-1f24-5706-6537ce4f6f34@jensverwiebe.de>
 <s5h7e3vy9fz.wl-tiwai@suse.de>
From: Jens Verwiebe <info@jensverwiebe.de>
Message-ID: <8f278b1d-889d-be80-0507-f992b26ae8c8@jensverwiebe.de>
Date: Tue, 19 Nov 2019 20:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5h7e3vy9fz.wl-tiwai@suse.de>
Content-Language: de-DE
X-Provags-ID: V03:K1:xcjowG17EkmPIuZtum60sbYpGtix5cXXYc9YvyeNcwwgQ7S/8AC
 /l0hV5Eb409wJJHz1zAcxGH0XUny1QmpIhNS5PTSyJZ1N7pVeqGb12l31fjCzAfhM93rS+X
 H4/ktEab+H07EjoAquKkeAcSsUSuF5CO4BYhlg+iNqm0bSJa43Iypo7rVniGFwSAfrC5eLW
 MLPyKlRyb1zBy/suTKMqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IdSQXAhHeR0=:ByOemQ9x2cyLsth5b/EaBF
 8FBQlh+uGPdl+NXCfELW+c+WFtoSiCx4oF3tbfIlfM5XawsRomI68HmOS0Lnx9iM1oT7J/PNu
 X/7sjwh8YbZLWFi97cvL3OEGwx8CToEYzwbDzvDX4xFDXShO6GJP1UduN4LKo09GT31yDfb2K
 3ujzU7byk0NsRnBA4eQEQMdTo1nBr3XAJ3TTu07x4ZAWhw5oo7mzZZkxfO+h9PZ1oxYW0oHqy
 A5rkzX30a2JpaSfzbTZpQRvlp5V4fSjnEFNjDqcoDLqYzxb6A8PA0pHFRdAnZublrd9QqReOV
 nhDrKym/A+p1qf9XFJo1eBeQcOxFDcUL63j7Pu0s07C2gNC4pi/KPBmQGYzjY2wJzA2i0fKXN
 QCerFoE1ZvIAZieTtzR/f+XyOMeQtSWjhjaMPsIBUtk9gMsH3CdG58KYS+BtpFDmcsGNQpDWm
 vb1UqMx8F0Dg+64JUhelhPNOJTq64SH1vkv3o9j3XmWUpWBmogmbSu+HDwAqppCdul4+NNCrc
 Es1dLWjqs7sJao1VH4xMvqm7yA+GayIRI3HClh75/PNgGSSMvtuvbJXhH4uX/sbnNLzRLHXaC
 OCn5e7kXyDXgqRWg+Ybb/7P8I4nVCUNhxEWG+I6snDRcB30STfPwBkhwPtZQbKlKW2awNhxJq
 +CY3KGz8P/8ogkoeZuHWvXa2bn8by6ZL4wJsq3xKooyyFWZDPZiJy4C0AQo2obMhxOxiSXBJ0
 LWmRg78oovXZLW3dnV0D+aOP89FrJuDub501h3Ak33ozmaaGLziZ2uneP/XE8mpih7olSKrMo
 n/oYUH5u+SUPjp8p3mWYjWhfI5ssBVWBnVZmxCTYOlwPx4X50SkbfHuHmMQ81ueMvwi7TBUVh
 cPICRM0kff0oCfuH6gx7xpTXe3d1tXfmQxGk40kNc=
Subject: Re: [alsa-devel] Focusrite Scarlett 6i6 gen1 - input handling fix,
 ping
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SSByZWFsbHkgZHVubm8gd2hhdCB5b3UgbWVhbiBieSAibGFzdCBrZXJuZWwiLCBzdGFydGluZyBv
dmVyIHdpdGggCnB1bGxpbmcgdGhlIGtlcm5lbCBzcmMgYWdhaW4sIGRpZmZpbmfCoCBldGMuID8K
CllvdSBjYW4gc2ltcGx5IHVzZSB0aGUgcGF0Y2ggYXMgaXMsIGl0IGFwcGxpZWQgZmluZSBvbiBr
ZXJuZWwgNS4zIGp1c3QgCmFuZCBpIGd1ZXNzIGl0IHdpbGwgb24gbWF0ZXIgdG9vLCBzaW5jZSBu
b3RoaW5nIGNoYW5nZWQgaW4gCm1peGVyX3NjYXJsZXR0LmMgb3RoZXIgdGhhbiBodW5rcyBtb3Zl
ZCBhcm91bmQuSSBkb24ndCBzZWUgYSByZWFzb24gd2h5IAp3ZSBzaG91bGQgbWFrZSBhbGwgc28g
Y29tcGxpY2F0ZWQuIEkgZG9uJ3Qgd2FubmEgcHV0IG1vcmUgZWZmb3JkIGluIHRoaXMgCmFueW1v
cmUsIHNvcnJ5LgoKQW0gMTkuMTEuMTkgdW0gMjA6MDQgc2NocmllYiBUYWthc2hpIEl3YWk6Cj4g
T24gVHVlLCAxOSBOb3YgMjAxOSAxOTozMDo0NSArMDEwMCwKPiBKZW5zIFZlcndpZWJlIHdyb3Rl
Ogo+PiBIaQo+Pgo+PiBJIHdvdWxkIGxpa2UgdG8gYnJpbmcgdXAgbXkgZm9yZ290dGVuIHBhdGNo
IHVwIGEgbGFzdCB0aW1lIGhlcmUuCj4+Cj4+IFNlZToKPj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxNy1Ob3ZlbWJlci8xMjc5MDYuaHRt
bAo+Pgo+PiBJIGR1bm5vIHdoYXQgZWxzZSB3b3VsZCBiZSBleHBlY3RlZCB0byB3cml0ZSBpbiB0
aGVyZSwgaSB0aGluayB0aGUKPj4gdGV4dCBzYXlzIGl0IGFsbCA/Cj4+Cj4+IEkgaGF2ZSB0aGlz
IGluIHVzZSBmb3IgMiB5ZWFycyBub3csIGJ1dCB0aGUgaW50ZXJmYWNlIHdpbGwgYmUgc29sZAo+
PiBub3csIHNvIGxhc3QgY2hhbmNlIHRvIHRlc3QgdGhlIGNvbW1pdAo+Pgo+PiBpZiBpdCBoYXBw
ZW5zIGFueXdheSA7LSkKPj4KPj4gQ2hlZXJzIC4uLiBKZW5zCj4gQ291bGQgeW91IHNpbXBseSBy
ZXN1Ym1pdCB0aGUgcGF0Y2ggZm9yIHRoZSBsYXRlc3Qga2VybmVsPwo+Cj4KPiB0aGFua3MsCj4K
PiBUYWthc2hpCj4KLS0gCgpKZW5zIFZlcndpZWJlCkFsbGVyc2tlaHJlIDQ0IC0gMjIzMDkgSGFt
YnVyZwoKVGVsLjogKzQ5IDQwIDY4IDc4IDUwCm1haWx0bzogaW5mb0BqZW5zdmVyd2llYmUuZGUK
d2ViOiBodHRwczovL3d3dy5qZW5zdmVyd2llYmUuZGUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
