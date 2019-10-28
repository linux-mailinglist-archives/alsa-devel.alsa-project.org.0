Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE30E7CDD
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 00:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF8321A2;
	Tue, 29 Oct 2019 00:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF8321A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572305499;
	bh=KG1t0cIUS5FYrrqFQiGIQvS6vER1vHwsXklyg4Q0WvU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kehyZ6dNTrQuYOEYbwX4TKd3qU9OrLwSzz1VTjUc9Tug9Fp0l+4l6muP7T5Io8CZ0
	 HD+ku1rDd36aXb9NRWXAONCVXTX1qaz2qECpIwMTJ/J16W6C5/YXxbNNvD9QDSLWlM
	 TXgs50jdN/7yubpJUkiUt0jAqcYAjW7sLqmP4agQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8950DF80361;
	Tue, 29 Oct 2019 00:29:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 321DCF80361; Tue, 29 Oct 2019 00:29:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C88EDF8011D
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 00:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C88EDF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r6Be/t5h"
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E23A21920
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572305380;
 bh=7Gaaf6qwiBEYhOFxiCWLOekDtJw6Ox4++B/1fEyh4/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r6Be/t5h+cVOxrGvrcglVP5hJwDvjL5PLKNDq90oCNRJLp9UcsbiZpQ/MqVTTFM7D
 MPfnkF5Oh2r9PkgqTr1XvHrvyE9ICsO86YKWf9p2o/vI04SyzrzoOc6wbIkJ/rU7KC
 iwwFa19gEZ3MuO1igXE9398TuK4RMhNOST+UF9fc=
Received: by mail-qt1-f172.google.com with SMTP id g50so17354962qtb.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 16:29:40 -0700 (PDT)
X-Gm-Message-State: APjAAAVgpustmKAgkxa2Z20vAYZtVeKB08HQeS3IOxoAaM5VmR4Cx2Y2
 zdDDLzv2NqLprtVapn4WKXyIAxhJLy0Ejnp/+w==
X-Google-Smtp-Source: APXvYqw0R7s1hrV6VYjOGPRDkr+OyJrA+Qw1rwyUmS5BM2DLn9OgWHjM15sPoWVzEF/ayMDFYuIjBF4P3C3Nu05OPqg=
X-Received: by 2002:a0c:ed29:: with SMTP id u9mr4303137qvq.136.1572305379547; 
 Mon, 28 Oct 2019 16:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191021140816.262401-1-nuno.sa@analog.com>
 <20191021140816.262401-2-nuno.sa@analog.com>
In-Reply-To: <20191021140816.262401-2-nuno.sa@analog.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Oct 2019 18:29:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_9pWQMbqyBuKGJQuxaoeUSbPGj4Y22z0yUK-oa1OSAQ@mail.gmail.com>
Message-ID: <CAL_JsqL_9pWQMbqyBuKGJQuxaoeUSbPGj4Y22z0yUK-oa1OSAQ@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgOTowOCBBTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cu
Y29tPiB3cm90ZToKPgo+IFRoaXMgY2hhbmdlcyBhcmUgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBy
ZXZpZXcgZG9uZSB0byB0aGlzIGJpbmRpbmdzLgo+IFRoaXMgaXMgYSBmb2xsb3ctdXAgcGF0Y2gg
dG8gOTY5ZDQ5YjJjZGM4Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sICAg
ICAgICAgIHwgMjUgKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpTdGlsbCBzb21lIGlzc3VlcyBoZXJlLi4uCgo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9h
ZGksYWRhdTcxMTgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9hZGksYWRhdTcxMTgueWFtbAo+IGluZGV4IGNmY2VmNjAyYjNkOS4uYzNmMTBhZmJkZDZmIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGks
YWRhdTcxMTgueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9hZGksYWRhdTcxMTgueWFtbAo+IEBAIC0yNiwxMyArMjYsMTEgQEAgcHJvcGVydGllczoK
PiAgICAiI3NvdW5kLWRhaS1jZWxscyI6Cj4gICAgICBjb25zdDogMAo+Cj4gLSAgSU9WREQtc3Vw
cGx5Ogo+ICsgIGlvdmRkLXN1cHBseToKPiAgICAgIGRlc2NyaXB0aW9uOiBEaWdpdGFsIElucHV0
L091dHB1dCBQb3dlciBTdXBwbHkuCj4gLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZSIKPgo+IC0gIERWREQtc3VwcGx5Ogo+ICsgIGR2ZGQtc3VwcGx5
Ogo+ICAgICAgZGVzY3JpcHRpb246IEludGVybmFsIENvcmUgRGlnaXRhbCBQb3dlciBTdXBwbHku
Cj4gLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIK
Pgo+ICAgIGFkaSxkZWNpbWF0aW9uLXJhdGlvOgo+ICAgICAgZGVzY3JpcHRpb246IHwKPiBAQCAt
NTgsMjMgKzU2LDIxIEBAIHByb3BlcnRpZXM6Cj4gIHJlcXVpcmVkOgo+ICAgIC0gIiNzb3VuZC1k
YWktY2VsbHMiCj4gICAgLSBjb21wYXRpYmxlCj4gLSAgLSBJT1ZERC1zdXBwbHkKPiAtICAtIERW
REQtc3VwcGx5Cj4gKyAgLSBpb3ZkZC1zdXBwbHkKPiArICAtIGR2ZGQtc3VwcGx5Cj4KPiAgZXhh
bXBsZXM6Cj4gICAgLSB8Cj4gLSAgICBpMmMwIHsKPiArICAgIGkyYyB7Cj4gICAgICAgICAgLyog
ZXhhbXBsZSB3aXRoIGkyYyBzdXBwb3J0ICovCj4gICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4gICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gLSAgICAgICAgc3RhdHVzID0gIm9r
YXkiOwo+IC0gICAgICAgIGFkYXU3MTE4X2NvZGVjOiBhZGF1NzExOC1jb2RlY0AxNCB7Cj4gKyAg
ICAgICAgYWRhdTcxMThfY29kZWM6IGF1ZGlvLWNvZGVjQDE0IHsKCkRvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTguZXhhbXBsZS5kdHM6MjEuNDQtMjku
MTU6Cldhcm5pbmcgKGkyY19idXNfcmVnKTogL2V4YW1wbGUtMC9pMmMvYXVkaW8tY29kZWNAMTQ6
IEkyQyBidXMgdW5pdAphZGRyZXNzIGZvcm1hdCBlcnJvciwgZXhwZWN0ZWQgImUiCgpVbml0LWFk
ZHJlc3Mgc2hvdWxkIGJlIGluIGhleC4KCj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImFkaSxhZGF1NzExOCI7Cj4gICAgICAgICAgICAgICAgICByZWcgPSA8MTQ+Owo+ICAgICAgICAg
ICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsKPiAtICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsKPiAtICAgICAgICAgICAgICAgIElPVkRELXN1cHBseSA9IDwmc3VwcGx5PjsK
PiAtICAgICAgICAgICAgICAgIERWREQtc3VwcGx5ID0gPCZzdXBwbHk+Owo+ICsgICAgICAgICAg
ICAgICAgaW92ZGQtc3VwcGx5ID0gPCZzdXBwbHk+Owo+ICsgICAgICAgICAgICAgICAgZHZkZC1z
dXBwbHkgPSA8JnN1cHBseT47Cj4gICAgICAgICAgICAgICAgICBhZGkscGRtLWNsay1tYXAgPSA8
MSAxIDAgMD47Cj4gICAgICAgICAgICAgICAgICBhZGksZGVjaW1hdGlvbi1yYXRpbyA9IDwxNj47
Cj4gICAgICAgICAgfTsKPiBAQCAtODQsNyArODAsNiBAQCBleGFtcGxlczoKPiAgICAgIGFkYXU3
MTE4X2NvZGVjX2h3OiBhZGF1NzExOC1jb2RlYy1odyB7Cj4gICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYWRpLGFkYXU3MTE4IjsKPiAgICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDww
PjsKPiAtICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+IC0gICAgICAgICAgICBJT1ZERC1z
dXBwbHkgPSA8JnN1cHBseT47Cj4gLSAgICAgICAgICAgIERWREQtc3VwcGx5ID0gPCZzdXBwbHk+
Owo+ICsgICAgICAgICAgICBpb3ZkZC1zdXBwbHkgPSA8JnN1cHBseT47Cj4gKyAgICAgICAgICAg
IGR2ZGQtc3VwcGx5ID0gPCZzdXBwbHk+Owo+ICAgICAgfTsKPiAtLQo+IDIuMjMuMAo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
