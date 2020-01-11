Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BD13838C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 21:43:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B2F16AA;
	Sat, 11 Jan 2020 21:43:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B2F16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578775434;
	bh=okisCN5xatSFERHChcIOLUtoqVlUuXfzpT2VZK1yZ/o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Am3JIVtMjMD/ZekWsRaaQk5Kl16op7JlSZw7LFHCBXcCJ5yRAe5IyGYAtYT8KMMYt
	 0+QgZ8YwBdcAzjZKZpM8aj2J+RspMq1uR32fj7hlxugsXwsqF9O2wTuMzx+Uj/U78y
	 3ols82JTgPvxop/6aRY0ml2m3KjYlvbP2UuNPTs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C289F80172;
	Sat, 11 Jan 2020 21:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32C4F801F4; Sat, 11 Jan 2020 21:42:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A177EF8012F
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 21:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A177EF8012F
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5Qhx-1irl1i14Wz-001S3v for <alsa-devel@alsa-project.org>; Sat, 11 Jan
 2020 21:42:03 +0100
Received: by mail-qk1-f169.google.com with SMTP id c17so5186460qkg.7
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 12:42:03 -0800 (PST)
X-Gm-Message-State: APjAAAUly8yPewr81ryuQCada4mqZB0TnY/+yabIK1+u2IQ6K9tabqDY
 2Nysu5S8lpCsP3oEDdPX5ywaWRE1wAm5bVexDV0=
X-Google-Smtp-Source: APXvYqz97taROjaLU92LNCUGLjjGGzGSXV0C2/iMKJlrCCckcQnSn90v6mZzwwOjhtUDA7lV3a9rijzo/vfPWflrHL0=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr9453125qka.286.1578775322178; 
 Sat, 11 Jan 2020 12:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20200111203325.20498-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200111203325.20498-1-pierre-louis.bossart@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Jan 2020 21:41:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2rVXbYy68iyLR9cR1Y6ztP-73wtLbCyj5OP4U=ar-52g@mail.gmail.com>
Message-ID: <CAK8P3a2rVXbYy68iyLR9cR1Y6ztP-73wtLbCyj5OP4U=ar-52g@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Provags-ID: V03:K1:9guZ86M+gz2WMzZ+pgRdtRh9sEGxl2dHAJvB3jyn6ZCom16wNCi
 GWRPxBaq+o399w6QCrWA+2zqG0599ZiTOAGCEWlyCrBZ7HbsbzTv5+rH8yTjsWYJTQhXI2a
 TBR/e5OvOMAxbFUiKJzhMmqd7iaNNaAZD64AhBq5CD5MiIlzI38lfWmsjUPUvazASylI0jN
 Byyk4prSxTUoxhrTRQgJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ehjv7ry8+Mk=:FPVSrskbrJCDzWqoEf3ssO
 rSaaA6aBAzqVwL7ZU7iNMpcdgTcCFYPZtVKTnI/7pOgfeJcSBT4I/uuSaZ7NJY2JCVifYSW3U
 JzXWFuOZV5xcbU8FYNMYArKCoYuKZYGv7evwF+TmrIRn7zpRv3dvIoX6BX7Jo9zvPOzgMzSyp
 pnQv7u2AcfDLDs03XtpQ0f2dpJQdHHn8HePU6aTt5FO1JnSx/J9zff0kHyBHjS5xqYdw5XhE+
 z9pTUlcOrw8vgeUqLNFDX29LfOyb1fmOYPhSw+vV6a818dW2Poj2h0SMCvt358wqzbVeQz7R1
 4AX58yXwWCFfamnwjfHenBN+1iv1AJgfHV8EwdYREI8+B3YbDqVfDdbvZNQksBjVu4a9jWl3X
 1Lp5e4ejB3Gwt+4NG40XycKnH/KRikoGbCQ+r7+XQP6atBHMdWtzHUHVk+iwwac621cRzSWwG
 rqrYKncNrcxAfjj2CbwDHYyRUDnfuG4UZgiSUipV9bbB2Ikx62gMin3pELauDbqO5rA7hJqpo
 cQ2FxMeiyObT//r3LRV7IJ5W7Gmw50uRFmK24GzbRhAZL4gRnqaRtWqGPOyWm8TBDGy3M/Wv4
 TWH/K4XebKesPvs8L1ED3Jc6qr6VGkIJjYvYIsTPrXCN0BY3ci+nDzSzsVajtfL2MZMOO0l4o
 MoWmUVwJXeJ5XDF/hysXcVkY3JdPokZXpn9GJHYlGSHK2ULp30xAL+/NkcnzaSWMhrXyCK7d+
 YhoCWHlhRwGfFXDkRaZifoLC7/jWKil+o9ojhZt6xqYfyjG4EWBuRhwnF/nf48WN0XC1vY6r4
 H/wS38YNrzp/OxDnjO4shksPAX3iluDe60LwNTCWjIMbg6gSLMl1p2nORvPF66HozmSo05/VM
 GWMNzDLxXfD2K/xak6Sw==
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: timer: fix nsec/sec initialization
	confusion
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

T24gU2F0LCBKYW4gMTEsIDIwMjAgYXQgOTozMyBQTSBQaWVycmUtTG91aXMgQm9zc2FydAo8cGll
cnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IEdDQyByZXBvcnRz
IGEgd2FybmluZyB3aXRoIFc9MToKPgo+IHNvdW5kL2NvcmUvdGltZXIuYzogSW4gZnVuY3Rpb24g
4oCYc25kX3RpbWVyX3VzZXJfcmVhZOKAmToKPiBzb3VuZC9jb3JlL3RpbWVyLmM6MjIxOToxOTog
d2FybmluZzogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4KPiBbLVdvdmVycmlkZS1pbml0
XQo+ICAyMjE5IHwgICAgIC50c3RhbXBfc2VjID0gdHJlYWQtPnRzdGFtcF9uc2VjLAo+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgXn5+fn4KPiBzb3VuZC9jb3JlL3RpbWVyLmM6MjIxOToxOTog
bm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yCj4g4oCYKGFub255bW91cykudHN0YW1wX3Nl
Y+KAmSkKPgo+IEFzc2lnbmluZyBuc2VjIHZhbHVlcyB0byBzZWMgZmllbGRzIGlzIHByb2JsZW1h
dGljIGluIGdlbmVyYWwsIGV2ZW4KPiBtb3JlIHNvIHdoZW4gdGhlIGluaXRpYWwgZ29hbCB3YXMg
dG8gc3Vydml2ZSB0aGUgMjAzMCB0aW1lcgo+IGFybWFnZWRkb24uCj4KPiBGaXggYnkgdXNpbmcg
dGhlIHByb3BlciBmaWVsZCBpbiB0aGUgaW5pdGlhbGl6YXRpb24KPgo+IENjOiBCYW9saW4gV2Fu
ZyA8YmFvbGluLndhbmdAbGluYXJvLm9yZz4KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KCkdvb2QgY2F0Y2ghCgpBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KCj4gRml4ZXM6IDA3MDk0YWU2Zjk1MjcgKCJBTFNBOiBBdm9pZCB1c2luZyB0aW1lc3BlYyBm
b3Igc3RydWN0IHNuZF90aW1lcl90cmVhZCIpCj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlz
IEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAg
c291bmQvY29yZS90aW1lci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9zb3VuZC9jb3JlL3RpbWVyLmMgYi9z
b3VuZC9jb3JlL3RpbWVyLmMKPiBpbmRleCA4ODM1ZmY5MWE4OTMuLmQ5Zjg1ZjJkNjZhMyAxMDA2
NDQKPiAtLS0gYS9zb3VuZC9jb3JlL3RpbWVyLmMKPiArKysgYi9zb3VuZC9jb3JlL3RpbWVyLmMK
PiBAQCAtMjIxNiw3ICsyMjE2LDcgQEAgc3RhdGljIHNzaXplX3Qgc25kX3RpbWVyX3VzZXJfcmVh
ZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIgKmJ1ZmZlciwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB0cmVhZDMyID0gKHN0cnVjdCBzbmRfdGltZXJfdHJlYWQzMikgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLmV2ZW50ID0gdHJlYWQtPmV2ZW50LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnRzdGFtcF9zZWMgPSB0cmVhZC0+dHN0YW1wX3Nl
YywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC50c3RhbXBfc2VjID0gdHJlYWQt
PnRzdGFtcF9uc2VjLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLnRzdGFtcF9u
c2VjID0gdHJlYWQtPnRzdGFtcF9uc2VjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLnZhbCA9IHRyZWFkLT52YWwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPgo+IC0t
Cj4gMi4yMC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
