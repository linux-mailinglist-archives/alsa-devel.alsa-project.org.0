Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1B1A92E
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 21:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2339F1797;
	Sat, 11 May 2019 21:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2339F1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557601919;
	bh=/j+KvQ+GmWp7JMVxXUJMAlm6QxuHixJpVb+nzNvlgAw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQXipsq3Tj3LGUmaVp8IaG7/ySyTPF8buKcyMG1SqPiMlCdcei2DJOpFdORAkzNc2
	 YfemPbdDbDIFXYaEOCd+7W0u7nZkcI44uy9QvF8VjbEMy76WBunZbtZfpqXMvSt1pl
	 rN4x7gTE0Ck7ggrPIJSWaIsLFI0xP+NioiyKD5pU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF363F896DF;
	Sat, 11 May 2019 21:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B27F1F89682; Sat, 11 May 2019 21:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A128F80737
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 21:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A128F80737
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bXrknFiQ"
Received: by mail-wm1-x343.google.com with SMTP id y2so10300960wmi.5
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 12:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MfGrmqC7D7F6enHrfpsTmPEIqWHqv5G2uRwI3xddp6M=;
 b=bXrknFiQeIOVGskqrvgOsC/geKwFDC3Yo86/CAKighwYpuQInu6FECJYMiJ76alKI2
 9+cYwRqcty0U7gjzes8v6xzXtlf2rqgAceyauoeyxTg+cGfw/OxFdprUhEq2tIVVHTAa
 Ikq0AIW3DgOCxm28Q+hkoypNLPpeb6/0lASFeXqCqvQ7gMEF5xVVm0AUA8e8b7UQkVNu
 NEhvuHdkepU9XvAdzgNYwClqwi3MYzkGvX4ZwzRsJzKcfyFklb2QSV4KOkmjG6CvuCI0
 x9eU12fG3MJd+rowd9vID23WJIADTi8QPi/vLC0mneWR+4+SVWROSVdrPtZtUJAzYDJJ
 68Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MfGrmqC7D7F6enHrfpsTmPEIqWHqv5G2uRwI3xddp6M=;
 b=gQj34n0wbdBpb5lAY+SetSW4azSk3IBatwnuFrYoKsr0f/uLcXmS6kUGmvTJcqAiHe
 orOkbaPdmJ1pPEghiswnF9/AMV2qm8DKHJNu/zwnpp0tDmlnZHcYSoyVSzEWD0mO+K4t
 +4z2H1D2WlM3a5+KaaGXRP1F4QCONj8yc5DCQm7sC5V9b/GBGS/bsB6gdXKCYEDoUP17
 /Pt927ioh+WEJV+d0XnwNLHFhkwRQnENRQFvr1xqXUaUvqGefB/ndeJQlNphRMV7soMY
 18OlFtuETGaLnLPRQTDrSimyjPdAienG0EnprWsk28WqEAk7ZEipqs3Zb77/7gSZyYjX
 xkLw==
X-Gm-Message-State: APjAAAW5ekJ9q4QzL118R3Nq37DSPVgGdWCHOi6EkzKZfxD0s3dIl9XJ
 ivLwEFVOB10GQ8aEUt9cFSAApeDUgwya0yOeX7M=
X-Google-Smtp-Source: APXvYqxtrXHmxuXeZG5+dLztGl2XzuGjN6KcXSqF9ibg83JTKY98Ld6NJtsvolWaVnE4iN/5T1rlOR0y5jo1Pys9oMU=
X-Received: by 2002:a1c:5f02:: with SMTP id t2mr10697632wmb.19.1557601808429; 
 Sat, 11 May 2019 12:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190511151149.28823-1-sravanhome@gmail.com>
In-Reply-To: <20190511151149.28823-1-sravanhome@gmail.com>
From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sat, 11 May 2019 21:10:32 +0200
Message-ID: <CA+sos7-KyuCmfuxby4ta46ypK6H-DmEA7RgoL3cyrghQa8i+zA@mail.gmail.com>
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: Alsa-devel <alsa-devel@alsa-project.org>, lgirdwood@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4] ASoC: tlv320aic3x: Add support for high
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

RGVhciBTYXJhdmFuYW4gU2VrYXIsCgpPbiBTYXQsIE1heSAxMSwgMjAxOSBhdCA1OjEzIFBNIFNh
cmF2YW5hbiBTZWthciA8c3JhdmFuaG9tZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIHN1cHBv
cnQgdG8gb3V0cHV0IGxldmVsIGNvbnRyb2wgZm9yIHRoZSBhbmFsb2cgaGlnaCBwb3dlciBvdXRw
dXQKPiBkcml2ZXJzIEhQT1VUIGFuZCBIUENPTS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhcmF2YW5h
biBTZWthciA8c3JhdmFuaG9tZUBnbWFpbC5jb20+Cj4gLS0tCj4KPiBOb3RlczoKPiAgICAgTm90
ZXM6Cj4gICAgICAgICBDaGFuZ2VzIGluIFY0Ogo+ICAgICAgICAgLUFkZGVkIHNlcGFyYXRlIG1v
bm8gcGxheWJhY2sgdm9sdW1lIGNvbnRyb2wKPiAgICAgICAgIC1ncm91cGVkIHZvbHVtZSBjb250
cm9scyB3aXRoIGNvcnJlc3BvbmRpbmcgc3dpdGNoCj4KPiAgICAgICAgIENoYW5nZXMgaW4gVjM6
Cj4gICAgICAgICAtRml4ZWQgY29tcGlsYXRpb24gZXJyb3IKPgo+ICAgICAgICAgQ2hhbmdlcyBp
biBWMjoKPiAgICAgICAgIC0gUmVtb3ZlZCBwb3dlciBjb250cm9sIGFzIGl0IGlzIGhhbmRsZWQg
YnkgREFQTQo+ICAgICAgICAgLSBBZGRlZCBsZXZlbCBjb250cm9sIGZvciBsZWZ0IGNoYW5uZWwK
Pgo+ICBzb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzN4LmMgfCAxNCArKysrKysrKysrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvdGx2MzIwYWljM3guYyBiL3NvdW5kL3NvYy9jb2Rl
Y3MvdGx2MzIwYWljM3guYwo+IGluZGV4IDUxNmQxN2NiMjE4Mi4uNTk5ZTRlZDM4NTBiIDEwMDY0
NAo+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvdGx2MzIwYWljM3guYwo+ICsrKyBiL3NvdW5kL3Nv
Yy9jb2RlY3MvdGx2MzIwYWljM3guYwo+IEBAIC0zMjQsNiArMzI0LDkgQEAgc3RhdGljIERFQ0xB
UkVfVExWX0RCX1NDQUxFKGFkY190bHYsIDAsIDUwLCAwKTsKPiAgICovCj4gIHN0YXRpYyBERUNM
QVJFX1RMVl9EQl9TQ0FMRShvdXRwdXRfc3RhZ2VfdGx2LCAtNTkwMCwgNTAsIDEpOwo+Cj4gKy8q
IE91dHB1dCB2b2x1bWVzLiBGcm9tIDAgdG8gOSBkQiBpbiAxIGRCIHN0ZXBzICovCj4gK3N0YXRp
YyBjb25zdCBERUNMQVJFX1RMVl9EQl9TQ0FMRShvdXRfdGx2LCAwLCAxMDAsIDApOwo+ICsKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IGFpYzN4X3NuZF9jb250cm9sc1td
ID0gewo+ICAgICAgICAgLyogT3V0cHV0ICovCj4gICAgICAgICBTT0NfRE9VQkxFX1JfVExWKCJQ
Q00gUGxheWJhY2sgVm9sdW1lIiwKPiBAQCAtMzg2LDExICszODksMTcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IGFpYzN4X3NuZF9jb250cm9sc1tdID0gewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBEQUNMMV8yX0hQTENPTV9WT0wsIERBQ1IxXzJfSFBSQ09NX1ZP
TCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgMTE4LCAxLCBvdXRwdXRfc3RhZ2VfdGx2
KSwKPgo+IC0gICAgICAgLyogT3V0cHV0IHBpbiBtdXRlIGNvbnRyb2xzICovCj4gKyAgICAgICAv
KiBPdXRwdXQgcGluIGNvbnRyb2xzICovCj4gKyAgICAgICBTT0NfRE9VQkxFX1JfVExWKCJMaW5l
IFBsYXliYWNrIFZvbHVtZSIsIExMT1BNX0NUUkwsIFJMT1BNX0NUUkwsIDQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDksIDAsIG91dF90bHYpLAo+ICAgICAgICAgU09DX0RPVUJMRV9SKCJM
aW5lIFBsYXliYWNrIFN3aXRjaCIsIExMT1BNX0NUUkwsIFJMT1BNX0NUUkwsIDMsCj4gICAgICAg
ICAgICAgICAgICAgICAgMHgwMSwgMCksCj4gKyAgICAgICBTT0NfRE9VQkxFX1JfVExWKCJIUCBQ
bGF5YmFjayBWb2x1bWUiLCBIUExPVVRfQ1RSTCwgSFBST1VUX0NUUkwsIDQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDksIDAsIG91dF90bHYpLAo+ICAgICAgICAgU09DX0RPVUJMRV9SKCJI
UCBQbGF5YmFjayBTd2l0Y2giLCBIUExPVVRfQ1RSTCwgSFBST1VUX0NUUkwsIDMsCj4gICAgICAg
ICAgICAgICAgICAgICAgMHgwMSwgMCksCj4gKyAgICAgICBTT0NfRE9VQkxFX1JfVExWKCJIUENP
TSBQbGF5YmFjayBWb2x1bWUiLCBIUExDT01fQ1RSTCwgSFBSQ09NX0NUUkwsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDQsIDksIDAsIG91dF90bHYpLAo+ICAgICAgICAgU09DX0RPVUJMRV9S
KCJIUENPTSBQbGF5YmFjayBTd2l0Y2giLCBIUExDT01fQ1RSTCwgSFBSQ09NX0NUUkwsIDMsCj4g
ICAgICAgICAgICAgICAgICAgICAgMHgwMSwgMCksCj4KPiBAQCAtNDcyLDYgKzQ4MSw5IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBhaWMzeF9tb25vX2NvbnRyb2xzW10g
PSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDExOCwgMSwgb3V0cHV0X3N0YWdlX3Rs
diksCj4KPiAgICAgICAgIFNPQ19TSU5HTEUoIk1vbm8gUGxheWJhY2sgU3dpdGNoIiwgTU9OT0xP
UE1fQ1RSTCwgMywgMHgwMSwgMCksCj4gKyAgICAgICBTT0NfU0lOR0xFX1RMVigiTW9ubyBQbGF5
YmFjayBWb2x1bWUiLCBNT05PTE9QTV9DVFJMLCA0LCA5LCAwLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIG91dF90bHYpLAo+ICsKPiAgfTsKPgo+ICAvKgo+IC0tCj4gMi4xNy4xCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCgpSZXZpZXdl
ZC1ieTogQmVub8OudCBUaMOpYmF1ZGVhdSA8YmVub2l0LnRoZWJhdWRlYXUuZGV2QGdtYWlsLmNv
bT4KCkJlc3QgcmVnYXJkcywKQmVub8OudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
