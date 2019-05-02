Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D1124B2
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 00:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4B51826;
	Fri,  3 May 2019 00:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4B51826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556837171;
	bh=sCBIl3D7O94DMo3K8AylPGuUyPqjuR5zmVi2UZKju4w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCCNE0Ie5yxBc6+JNr5OpX+2KpLHYFVJyDm/WQvj4hbbYht6cxH8a3dBJwXkE6Izh
	 9NvmviNfADFeK5Bd/J7I1YUCTdUc1YzVSRv41D7pETQp/Fsmd6D4UDBjlnHfNibrBJ
	 nDylwgPDkVtFIDz7FlYtKE/TYAJ33IHDhXSx6fjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EDB8F896C7;
	Fri,  3 May 2019 00:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4D84F896C7; Fri,  3 May 2019 00:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5BB2F80722
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 00:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5BB2F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ViH32LHW"
Received: by mail-wr1-x441.google.com with SMTP id f7so5509533wrs.2
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SuUpfHu3jsyrHNGkijE3t4kxZS81qdHPL95LsioUnGs=;
 b=ViH32LHWXkf+gwRwBFv9arWh1x/EQk3jp2GPbg9ZDbhOQGKi18HcFZ2a2WhvUdi0E2
 hLvmZB7C0IFgBg2Wt5nPCV3wA+dJCEcrgd8xjJ5KKdM2aS0VsIPysO9DPqo1Y5f9lYLo
 qaAhnsjBl9hDzPhHjUXmIAW3wvTicKFLDFu7kZq52ny7jUEI//hYwQuWSMS3chSvHm+Z
 VO0Wdt5xL/wnXtyjcztI2b0wSpaSa5bw4RaFt5QAqXPbUY35WUbALfrrAL/ZYAb1oMdX
 OltRwihVxtM4GvvA+QkJh+Xvo+IGoR8HSfpyGf6+K0hBJW1uT5Suj0QV35es4Q/JcWMf
 9MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SuUpfHu3jsyrHNGkijE3t4kxZS81qdHPL95LsioUnGs=;
 b=OHvDFa2IUwKnF9M4QHVTxi+4g4Jwa4P1ZvuFFen1gEy8IbAdquy257vueXFi5vTeIt
 Lz0IKHqzIpJIGa8c4ncHkbLPienxoyoxMAWqKZVC+E1FHOgSBouii8oFHtIkpd44nRYV
 tPgEcWKBGZOtZ9zANiM74giGCAUkU0Zai2TH2E7c/yVACM4ZNW1cyz8lMUgLU6NrnVFV
 pkenmjJHgL0v4OIxBqe3ckf176nrAQmV82hSnQULL6WNEpag32Ccyg+3gFzwMZKC5oAD
 F947z29eyYlUddcOq9FvfPrXuYHnu4N/ZT9GYSx50k2It6yQMzBJSUMOZUB8GZ6lvaNk
 RJmw==
X-Gm-Message-State: APjAAAUSDfIUuQK5bBSZ4g7qv0KCVDgxpa72v+OW+6+nhTneqAONohxO
 C5Vu763ZI2qZExhCRBKc5gg63AhBoJeIpTlk2Lw=
X-Google-Smtp-Source: APXvYqwNoLYrunH147NNmfIlbuaw02XNIikLKmKRNPweSoKWE52cBbTEMFCd6StVQmgpG2uMD74V9CWt37ZivUZ4L9I=
X-Received: by 2002:a5d:6101:: with SMTP id v1mr4479676wrt.222.1556837059885; 
 Thu, 02 May 2019 15:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190502181332.5503-1-sravanhome@gmail.com>
In-Reply-To: <20190502181332.5503-1-sravanhome@gmail.com>
From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Fri, 3 May 2019 00:44:31 +0200
Message-ID: <CA+sos7-U49b7DyQ76h-RohhGqPSPqsV-u-r+oaZnB5=DAkbm6w@mail.gmail.com>
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: Alsa-devel <alsa-devel@alsa-project.org>, lgirdwood@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3] ASoC: tlv320aic3x: Add support for high
 power analog output
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

RGVhciBTYXJhdmFuYW4gU2VrYXIsCgpPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDg6MTQgUE0gU2Fy
YXZhbmFuIFNla2FyIDxzcmF2YW5ob21lQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9y
dCB0byBvdXRwdXQgbGV2ZWwgY29udHJvbCBmb3IgdGhlIGFuYWxvZyBoaWdoIHBvd2VyIG91dHB1
dAo+IGRyaXZlcnMgSFBPVVQgYW5kIEhQQ09NLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FyYXZhbmFu
IFNla2FyIDxzcmF2YW5ob21lQGdtYWlsLmNvbT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAgICBDaGFu
Z2VzIGluIFYzOgo+ICAgICAtRml4ZWQgY29tcGlsYXRpb24gZXJyb3IKPgo+ICAgICBDaGFuZ2Vz
IGluIFYyOgo+ICAgICAtIFJlbW92ZWQgcG93ZXIgY29udHJvbCBhcyBpdCBpcyBoYW5kbGVkIGJ5
IERBUE0KPiAgICAgLSBBZGRlZCBsZXZlbCBjb250cm9sIGZvciBsZWZ0IGNoYW5uZWwKPgo+ICBz
b3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzN4LmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy90
bHYzMjBhaWMzeC5jIGIvc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzeC5jCj4gaW5kZXggNTE2
ZDE3Y2IyMTgyLi40ODlhNmQ4OWQ2M2QgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy90
bHYzMjBhaWMzeC5jCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzeC5jCj4gQEAg
LTMyNCw2ICszMjQsOSBAQCBzdGF0aWMgREVDTEFSRV9UTFZfREJfU0NBTEUoYWRjX3RsdiwgMCwg
NTAsIDApOwo+ICAgKi8KPiAgc3RhdGljIERFQ0xBUkVfVExWX0RCX1NDQUxFKG91dHB1dF9zdGFn
ZV90bHYsIC01OTAwLCA1MCwgMSk7Cj4KPiArLyogSFAvSFBDT00gdm9sdW1lcy4gRnJvbSAwIHRv
IDkgZEIgaW4gMSBkQiBzdGVwcyAqLwo+ICtzdGF0aWMgREVDTEFSRV9UTFZfREJfU0NBTEUoaHBf
dGx2LCAwLCAxMDAsIDApOwoKVGhpcyBjb3VsZCBiZSBtYWRlICJjb25zdCIgKGFzIHdlbGwgYXMg
dGhlIG90aGVyIGluc3RhbmNlcyBvZgpERUNMQVJFX1RMVl9EQl9TQ0FMRSgpKS4KClRoZSBocF90
bHYgbmFtaW5nIGlzIGZpbmUgZm9yIHRoZSBjaGFuZ2UgaGVyZSwgYnV0IHNvbWV0aGluZyBub3QK
SFAtc3BlY2lmaWMsIHN1Y2ggYXMgb3V0X3RsdiB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNvbnNp
ZGVyIHRoZQpmdXJ0aGVyIGNoYW5nZXMgdGhhdCBjb3VsZCB1c2UgdGhpcyBkZWZpbml0aW9uOgpz
dGF0aWMgREVDTEFSRV9UTFZfREJfU0NBTEUob3V0cHV0X3N0YWdlX3RsdiwgLTU5MDAsIDUwLCAx
KTsKKy8qIE91dHB1dCB2b2x1bWVzLiBGcm9tIDAgdG8gOSBkQiBpbiAxIGRCIHN0ZXBzICovCitz
dGF0aWMgY29uc3QgREVDTEFSRV9UTFZfREJfU0NBTEUob3V0X3RsdiwgMCwgMTAwLCAwKTsKCkUu
Zy4sIHRoZSBmb2xsb3dpbmcgY29udHJvbCBjb3VsZCBiZSBhZGRlZCB0byBhaWMzeF9zbmRfY29u
dHJvbHNbXToKK1NPQ19ET1VCTEVfUl9UTFYoIkxpbmUgUGxheWJhY2sgVm9sdW1lIiwgTExPUE1f
Q1RSTCwgUkxPUE1fQ1RSTCwgNCwKOSwgMCwgb3V0X3RsdiksCgpBbmQgdGhpcyBjb250cm9sIGNv
dWxkIGJlIGFkZGVkIHRvIGFpYzN4X21vbm9fY29udHJvbHNbXToKK1NPQ19TSU5HTEVfVExWKCJN
b25vIFBsYXliYWNrIFZvbHVtZSIsIE1PTk9MT1BNX0NUUkwsIDQsIDksIDAsIG91dF90bHYpLAoK
VGhlIE1PTk9MT1BNX0NUUkwgcmVnaXN0ZXIgZXhpc3RzIGZvciB0aGUgMzMgYW5kIDMxMDYsIGJ1
dCBub3QgZm9yIHRoZQozMSwgMzIsIDMwMDcsIGFuZCAzMTA0IChpdCBzaG91bGQgbm90IGJlIHdy
aXR0ZW4gdG8gZm9yIHRoZXNlIENPREVDcykuCkhvd2V2ZXIsIHRoZSBkcml2ZXIgdXNlcyB0aGlz
IHJlZ2lzdGVyIGZvciB0aGUgMzEgYW5kIDMyIHRvbywgd2hpY2gKc2hvdWxkIGJlIGZpeGVkIHJh
dGhlciB0aGFuIGRpc2FibGluZyB0aGUgY29ycmVzcG9uZGluZyBwaW4gYXMKc3VnZ2VzdGVkIGlu
IHRoZSBmaWxlIHRvcCBjb21tZW50LgoKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tj
b250cm9sX25ldyBhaWMzeF9zbmRfY29udHJvbHNbXSA9IHsKPiAgICAgICAgIC8qIE91dHB1dCAq
Lwo+ICAgICAgICAgU09DX0RPVUJMRV9SX1RMVigiUENNIFBsYXliYWNrIFZvbHVtZSIsCj4gQEAg
LTQxOSw2ICs0MjIsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IGFp
YzN4X3NuZF9jb250cm9sc1tdID0gewo+ICAgICAgICAgLyogUG9wIHJlZHVjdGlvbiAqLwo+ICAg
ICAgICAgU09DX0VOVU0oIk91dHB1dCBEcml2ZXIgUG93ZXItT24gdGltZSIsIGFpYzN4X3Bvd2Vy
b25fdGltZV9lbnVtKSwKPiAgICAgICAgIFNPQ19FTlVNKCJPdXRwdXQgRHJpdmVyIFJhbXAtdXAg
c3RlcCIsIGFpYzN4X3JhbXB1cF9zdGVwX2VudW0pLAo+ICsKPiArICAgICAgIC8qIEFuYWxvZyBI
UE9VVCwgSFBDT00gb3V0cHV0IGxldmVsIGNvbnRyb2xzICovCj4gKyAgICAgICBTT0NfRE9VQkxF
X1JfVExWKCJIUCBQbGF5YmFjayBWb2x1bWUiLCBIUExPVVRfQ1RSTCwgSFBST1VUX0NUUkwsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgNCwgOSwgMCwgaHBfdGx2KSwKCkNvcnJlY3QgZm9yIGFs
bCB0aGUgc3VwcG9ydGVkIENPREVDcy4KCj4gKyAgICAgICBTT0NfRE9VQkxFX1JfVExWKCJIUENP
TSBQbGF5YmFjayBWb2x1bWUiLCBIUExDT01fQ1RSTCwgSFBSQ09NX0NUUkwsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgNCwgOSwgMCwgaHBfdGx2KSwKCkNvcnJlY3QgZm9yIGFsbCB0aGUgc3Vw
cG9ydGVkIENPREVDcyBidXQgdGhlIFRMVjMyMEFJQzMwMDcuIFRoZSBsYXR0ZXIKaGFzIG5vIEhQ
UkNPTSBvdXRwdXQsIGJ1dCBvbmx5IEhQQ09NICg9IEhQTENPTSkuIFRoZSBIUFJDT01fQ1RSTApy
ZWdpc3RlciBvZiB0aGlzIENPREVDIGlzIHJlc2VydmVkIGFuZCBzaG91bGQgbm90IGJlIHdyaXR0
ZW4gdG8uIEFsbAp0aGUgcmVmZXJlbmNlcyB0byB0aGlzIHJlZ2lzdGVyIGZvciB0aGlzIENPREVD
IGFyZSBhY3R1YWxseSBicm9rZW4gaW4KdGhpcyBkcml2ZXIuIFlvdSBjb3VsZCBzdGlsbCBhZGQg
dGhpcyBjb250cm9sLCBhbmQgdGhlIDMwMDcgaXNzdWUKY291bGQgYmUgZml4ZWQgc2VwYXJhdGVs
eSBieSB5b3Ugb3Igc29tZW9uZSBlbHNlLgoKWW91IGNvdWxkIGtlZXAgdGhlIHZvbHVtZXMgZ3Jv
dXBlZCB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIHN3aXRjaGVzLApqdXN0IGxpa2UgYWxsIHRoZSBB
R0Mgb3IgUEdBIENhcHR1cmUgY29udHJvbHMgYXJlIGdyb3VwZWQgdG9nZXRoZXI6Ci0vKiBPdXRw
dXQgcGluIG11dGUgY29udHJvbHMgKi8KKy8qIE91dHB1dCBwaW4gY29udHJvbHMgKi8KK1NPQ19E
T1VCTEVfUl9UTFYoIkxpbmUgUGxheWJhY2sgVm9sdW1lIiwgTExPUE1fQ1RSTCwgUkxPUE1fQ1RS
TCwgNCwKOSwgMCwgb3V0X3RsdiksClNPQ19ET1VCTEVfUigiTGluZSBQbGF5YmFjayBTd2l0Y2gi
LCBMTE9QTV9DVFJMLCBSTE9QTV9DVFJMLCAzLCAweDAxLCAwKSwKK1NPQ19ET1VCTEVfUl9UTFYo
IkhQIFBsYXliYWNrIFZvbHVtZSIsIEhQTE9VVF9DVFJMLCBIUFJPVVRfQ1RSTCwgNCwKOSwgMCwg
b3V0X3RsdiksClNPQ19ET1VCTEVfUigiSFAgUGxheWJhY2sgU3dpdGNoIiwgSFBMT1VUX0NUUkws
IEhQUk9VVF9DVFJMLCAzLCAweDAxLCAwKSwKK1NPQ19ET1VCTEVfUl9UTFYoIkhQQ09NIFBsYXli
YWNrIFZvbHVtZSIsIEhQTENPTV9DVFJMLCBIUFJDT01fQ1RSTCwKNCwgOSwgMCwgb3V0X3Rsdiks
ClNPQ19ET1VCTEVfUigiSFBDT00gUGxheWJhY2sgU3dpdGNoIiwgSFBMQ09NX0NUUkwsIEhQUkNP
TV9DVFJMLCAzLCAweDAxLCAwKSwKCkFuZDoKK1NPQ19TSU5HTEVfVExWKCJNb25vIFBsYXliYWNr
IFZvbHVtZSIsIE1PTk9MT1BNX0NUUkwsIDQsIDksIDAsIG91dF90bHYpLApTT0NfU0lOR0xFKCJN
b25vIFBsYXliYWNrIFN3aXRjaCIsIE1PTk9MT1BNX0NUUkwsIDMsIDB4MDEsIDApLAoKPiAgfTsK
Pgo+ICAvKiBGb3Igb3RoZXIgdGhhbiB0bHYzMjBhaWMzMTA0ICovCgpCZXN0IHJlZ2FyZHMKQmVu
b8OudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
