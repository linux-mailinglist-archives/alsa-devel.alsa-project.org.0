Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7952F72F6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 12:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE7A167D;
	Mon, 11 Nov 2019 12:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE7A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573471246;
	bh=ZlfSrR1kVr2v0MpbciromAq17i75qQtjJjm0s01VQFk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9KpAM6D9AdFEWeIJPuzULJFbAz8pcWtsORWWD8LzpYy5gZBId1QV3PXXUYOIVqWu
	 S163Nlo9RifI6c91QOIgrYhx6lALhdGzE8xFH9aQ/+q8GMFBM+vaFd4tRkgDL6G95G
	 gyh9jcRreiNTQ1L7hDCrg+3CtsNcL8OpcDl2+w9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3159CF80519;
	Mon, 11 Nov 2019 12:18:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D32CF8053A; Mon, 11 Nov 2019 12:18:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331F9F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 12:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331F9F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZgxTQ/SM"
Received: by mail-wr1-x441.google.com with SMTP id z10so8864088wrs.12
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=LuIR7Y2Q8l8W+0L2qZWEBQmcPwgT0vQE3HF6dstyhYs=;
 b=ZgxTQ/SMx8RXWfAtO0tX/HSbwWdlMF4ZFU1BMTahqPHlAoJxF3Xg0PfINgYJmXfxlZ
 OshY2p8kNkC/xP0vWpYjZY2wfnkR+O3Dg46CJQgFLTwOzVANgUqK6wmkyyfcf1ZJsLZj
 FnBPR7NxsGBs3OErPednAFnHJ/HBxbSOZ3w6SuksnH/q+r0ywpB22djThh/T5tqraUbT
 q7XunKfZJOAOr3DFtZqgWGpatFxS3EIq3jReFRj9lo519Xdq/u4MHF/Wo2wSib/fueUb
 4M8nuNwqP1GGn66DoUNKFxyjt4/twnJaYJuEdlRmJak7ZLM7iJS052LpmZuzhMlJU9T0
 lF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LuIR7Y2Q8l8W+0L2qZWEBQmcPwgT0vQE3HF6dstyhYs=;
 b=AkhnQE+dp3tpyH8r8Ocnzwk2H3szSxGoibHhR0eQYYHXkFOMrXx8bByOrwz6mzz28W
 gcqS09hKEL1XW/bX1hij3l/w2x8d/2rR281M0aU5GXmD+1TqriirF0DXf29OwUZ24W/X
 Uy8SUtMn1FcA2KNvipQC7Bts2JWAim+9RWY+lOf5rsUKyj0G3O4tWwgLbnjnn0tqYsaO
 AtFlDqeQs7Empfu8Y64LqddTVfMjO318LZfk1iNzCPtOpFZxF5w9xLyu2+0A+W00ZBsS
 uOP/UoxtkrR9O7T7y02XYdEImBau59tg4zqIc05HxI8drdD9uKTcnOqLNE/2GgkCY2cc
 ocHg==
X-Gm-Message-State: APjAAAWFTjqcLBKZ5rhyt7TWwV9gq47NbpjiQI4LNJ8blwWAAU4W6PhX
 Z8Kukohyd9ppVBtCU+pu7DubUmYAzYo=
X-Google-Smtp-Source: APXvYqyWr0UkuHqzO+zZQypF+G5AGLM3U1R356CjHpgEyPXpa4/0gkSoA2aynuLIBXU/vxzN2zsZzQ==
X-Received: by 2002:adf:e701:: with SMTP id c1mr12490027wrm.166.1573471124238; 
 Mon, 11 Nov 2019 03:18:44 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id x205sm23341057wmb.5.2019.11.11.03.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 03:18:43 -0800 (PST)
Date: Mon, 11 Nov 2019 11:18:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191111111836.GH3218@dell>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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

T24gVHVlLCAyOSBPY3QgMjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKCj4gUXVhbGNv
bW0gV0NEOTM0MC9XQ0Q5MzQxIENvZGVjIGlzIGEgc3RhbmRhbG9uZSBIaS1GaSBhdWRpbyBjb2Rl
YyBJQy4KPiAKPiBUaGlzIGNvZGVjIGhhcyBpbnRlZ3JhdGVkIFNvdW5kV2lyZSBjb250cm9sbGVy
LCBwaW4gY29udHJvbGxlciBhbmQKPiBpbnRlcnJ1cHQgY29udHJvbGxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5v
cmc+Cj4gLS0tCgpObyBjaGFuZ2Vsb2c/Cgo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgIDEyICsKPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvbWZkL3djZDkzNHguYyAgICAgICAgICAgICAgICAgfCAzMDYg
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvcmVnaXN0ZXJzLmgg
fCA1MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9tZmQvd2Nk
OTM0eC93Y2Q5MzR4LmggICB8ICAzMSArKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDg3OSBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC93Y2Q5MzR4LmMKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvcmVnaXN0ZXJzLmgKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvd2NkOTM0eC5oCgpU
aGlzIGRyaXZlciByZWFkcyBtdWNoIGJldHRlciBub3cuIFRoYW5rcyBmb3IgbWFraW5nIHRoZSBj
aGFuZ2VzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMvbWZk
L0tjb25maWcKPiBpbmRleCBhZTI0ZDNlYTY4ZWEuLjlmZTdlNTRiMTNiZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21mZC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwo+IEBAIC0x
OTY3LDYgKzE5NjcsMTggQEAgY29uZmlnIE1GRF9TVE1GWAo+ICAJICBhZGRpdGlvbmFsIGRyaXZl
cnMgbXVzdCBiZSBlbmFibGVkIGluIG9yZGVyIHRvIHVzZSB0aGUgZnVuY3Rpb25hbGl0eQo+ICAJ
ICBvZiB0aGUgZGV2aWNlLgo+ICAKPiArY29uZmlnIE1GRF9XQ0Q5MzRYCj4gKwl0cmlzdGF0ZSAi
U3VwcG9ydCBmb3IgV0NEOTM0MC9XQ0Q5MzQxIENvZGVjIgo+ICsJZGVwZW5kcyBvbiBTTElNQlVT
Cj4gKwlzZWxlY3QgUkVHTUFQCj4gKwlzZWxlY3QgUkVHTUFQX1NMSU1CVVMKPiArCXNlbGVjdCBS
RUdNQVBfSVJRCj4gKwlzZWxlY3QgTUZEX0NPUkUKPiArCWhlbHAKPiArCSAgU3VwcG9ydCBmb3Ig
dGhlIFF1YWxjb21tIFdDRDkzNDAvV0NEOTM0MSBDb2RlYy4KPiArCSAgVGhpcyBkcml2ZXIgcHJv
dmlkZXMgY29tbW9uIHN1cHBvcnQgd2NkOTM0eCBhdWRpbyBjb2RlYyBhbmQgaXRzCj4gKwkgIGFz
c29jaWF0ZWQgUGluIENvbnRyb2xsZXIsIFNvdW5kd2lyZSBDb250cm9sbGVyIGFuZCBBdWRpbyBj
b2RlYy4KCllvdXIgY2FwaXRhbGlzYXRpb24gb2YgZGV2aWNlcyBpcyBhbGwgb3ZlciB0aGUgcGxh
Y2UgaW4gYm90aCB5b3VyIGhlbHAKc2VjdGlvbiBhbmQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBF
aXRoZXIgY2FwaXRhbGlzZSB0aGVtIGFsbCBvciBub25lCm9mIHRoZW0uIFBlcnNvbmFsbHkgSSB3
b3VsZCBwcmVmZXIgYWxsLCByYXRoZXIgdGhhbiBub25lLiBXaGF0IGV2ZXIKeW91IGNob29zZSwg
cGxlYXNlIGJlIGNvbnNpc3RlbnQuCgpTYW1lIGZvciAid2NkOTM0eCIsIHRoaXMgc2hvdWxkIHJl
YWQgIldDRDkzNHgiIGluIGFsbCBjb21tZW50cyBhbmQgdGhlCmhlbHAuCgpbLi4uXQoKPiArc3Rh
dGljIGJvb2wgd2NkOTM0eF9pc192b2xhdGlsZV9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGludCByZWcpCj4gK3sKPiArCXN3aXRjaCAocmVnKSB7Cj4gKwljYXNlIFdDRDkz
NFhfSU5UUl9QSU4xX1NUQVRVUzAuLi5XQ0Q5MzRYX0lOVFJfUElOMl9DTEVBUjM6Cj4gKwljYXNl
IFdDRDkzNFhfU1dSX0FIQl9CUklER0VfUkRfREFUQV8wOgo+ICsJY2FzZSBXQ0Q5MzRYX1NXUl9B
SEJfQlJJREdFX1JEX0RBVEFfMToKPiArCWNhc2UgV0NEOTM0WF9TV1JfQUhCX0JSSURHRV9SRF9E
QVRBXzI6Cj4gKwljYXNlIFdDRDkzNFhfU1dSX0FIQl9CUklER0VfUkRfREFUQV8zOgo+ICsJY2Fz
ZSBXQ0Q5MzRYX1NXUl9BSEJfQlJJREdFX0FDQ0VTU19TVEFUVVM6Cj4gKwljYXNlIFdDRDkzNFhf
QU5BX01CSENfUkVTVUxUXzM6Cj4gKwljYXNlIFdDRDkzNFhfQU5BX01CSENfUkVTVUxUXzI6Cj4g
KwljYXNlIFdDRDkzNFhfQU5BX01CSENfUkVTVUxUXzE6Cj4gKwljYXNlIFdDRDkzNFhfQU5BX01C
SENfTUVDSDoKPiArCWNhc2UgV0NEOTM0WF9BTkFfTUJIQ19FTEVDVDoKPiArCWNhc2UgV0NEOTM0
WF9BTkFfTUJIQ19aREVUOgo+ICsJY2FzZSBXQ0Q5MzRYX0FOQV9NSUNCMjoKPiArCWNhc2UgV0NE
OTM0WF9BTkFfUkNPOgo+ICsJY2FzZSBXQ0Q5MzRYX0FOQV9CSUFTOgo+ICsJCXJldHVybiB0cnVl
Owo+ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwl9Cj4gKwoKTml0OiBQbGVhc2Ug
cmVtb3ZlIHRoZSBzdXBlcmZsdW91cyBlbXB0eSBsaW5lLgoKPiArfTsKClsuLi5dCgo+ICtzdGF0
aWMgaW50IHdjZDkzNHhfc2xpbV9wcm9iZShzdHJ1Y3Qgc2xpbV9kZXZpY2UgKnNkZXYpCj4gK3sK
PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzZGV2LT5kZXY7Cj4gKwlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+ICsJc3RydWN0IHdjZDkzNHhfZGRhdGEgKmRkYXRhOwo+
ICsJaW50IHJlc2V0X2dwaW8sIHJldDsKPiArCj4gKwlkZGF0YSA9IGRldm1fa3phbGxvYyhkZXYs
IHNpemVvZigqZGRhdGEpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghZGRhdGEpCj4gKwkJcmV0dXJu
CS1FTk9NRU07Cj4gKwo+ICsJZGRhdGEtPmlycSA9IG9mX2lycV9nZXQobnAsIDApOwo+ICsJaWYg
KGRkYXRhLT5pcnEgPCAwKSB7Cj4gKwkJaWYgKGRkYXRhLT5pcnEgIT0gLUVQUk9CRV9ERUZFUikK
PiArCQkJZGV2X2VycihkZGF0YS0+ZGV2LCAiRmFpbGVkIHRvIGdldCBJUlE6IGVyciA9ICVkXG4i
LAo+ICsJCQkJZGRhdGEtPmlycSk7Cj4gKwkJcmV0dXJuIGRkYXRhLT5pcnE7Cj4gKwl9Cj4gKwo+
ICsJcmVzZXRfZ3BpbyA9IG9mX2dldF9uYW1lZF9ncGlvKG5wLCAicmVzZXQtZ3Bpb3MiLCAwKTsK
PiArCWlmIChyZXNldF9ncGlvIDwgMCkgewo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdl
dCByZXNldCBncGlvOiBlcnIgPSAlZFxuIiwKPiArCQkJcmVzZXRfZ3Bpbyk7Cj4gKwkJcmV0dXJu
IHJlc2V0X2dwaW87Cj4gKwl9Cj4gKwo+ICsJZGRhdGEtPmV4dGNsayA9IGRldm1fY2xrX2dldChk
ZXYsICJleHRjbGsiKTsKPiArCWlmIChJU19FUlIoZGRhdGEtPmV4dGNsaykpIHsKPiArCQlkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZXh0Y2xrIik7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoZGRh
dGEtPmV4dGNsayk7Cj4gKwl9Cj4gKwo+ICsJZGRhdGEtPnN1cHBsaWVzWzBdLnN1cHBseSA9ICJ2
ZGQtYnVjayI7Cj4gKwlkZGF0YS0+c3VwcGxpZXNbMV0uc3VwcGx5ID0gInZkZC1idWNrLXNpZG8i
Owo+ICsJZGRhdGEtPnN1cHBsaWVzWzJdLnN1cHBseSA9ICJ2ZGQtdHgiOwo+ICsJZGRhdGEtPnN1
cHBsaWVzWzNdLnN1cHBseSA9ICJ2ZGQtcngiOwo+ICsJZGRhdGEtPnN1cHBsaWVzWzRdLnN1cHBs
eSA9ICJ2ZGQtaW8iOwo+ICsKPiArCXJldCA9IHJlZ3VsYXRvcl9idWxrX2dldChkZXYsIFdDRDkz
NFhfTUFYX1NVUFBMWSwgZGRhdGEtPnN1cHBsaWVzKTsKPiArCWlmIChyZXQgIT0gMCkgewoKTml0
OiAiaWYgKHJldCkiCgo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBzdXBwbGllczog
ZXJyID0gJWRcbiIsIHJldCk7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlyZXQgPSBy
ZWd1bGF0b3JfYnVsa19lbmFibGUoV0NEOTM0WF9NQVhfU1VQUExZLCBkZGF0YS0+c3VwcGxpZXMp
Owo+ICsJaWYgKHJldCAhPSAwKSB7CgpOaXQ6ICJpZiAocmV0KSIKCj4gKwkJZGV2X2VycihkZXYs
ICJGYWlsZWQgdG8gZW5hYmxlIHN1cHBsaWVzOiBlcnIgPSAlZFxuIiwgcmV0KTsKPiArCQlyZXR1
cm4gcmV0Owo+ICsJfQo+ICsKPiArCS8qCj4gKwkgKiBGb3IgV0NEOTM0WCwgaXQgdGFrZXMgYWJv
dXQgNjAwdXMgZm9yIHRoZSBWb3V0X0EgYW5kCj4gKwkgKiBWb3V0X0QgdG8gYmUgcmVhZHkgYWZ0
ZXIgQlVDS19TSURPIGlzIHBvd2VyZWQgdXAuCj4gKwkgKiBTWVNfUlNUX04gc2hvdWxkbid0IGJl
IHB1bGxlZCBoaWdoIGR1cmluZyB0aGlzIHRpbWUKPiArCSAqLwo+ICsJdXNsZWVwX3JhbmdlKDYw
MCwgNjUwKTsKPiArCWdwaW9fZGlyZWN0aW9uX291dHB1dChyZXNldF9ncGlvLCAwKTsKPiArCW1z
bGVlcCgyMCk7Cj4gKwlncGlvX3NldF92YWx1ZShyZXNldF9ncGlvLCAxKTsKPiArCW1zbGVlcCgy
MCk7Cj4gKwo+ICsJZGRhdGEtPmRldiA9IGRldjsKPiArCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRk
YXRhKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgd2NkOTM0eF9z
bGltX3JlbW92ZShzdHJ1Y3Qgc2xpbV9kZXZpY2UgKnNkZXYpCj4gK3sKPiArCXN0cnVjdCB3Y2Q5
MzR4X2RkYXRhICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YSgmc2Rldi0+ZGV2KTsKPiArCj4gKwly
ZWd1bGF0b3JfYnVsa19kaXNhYmxlKFdDRDkzNFhfTUFYX1NVUFBMWSwgZGRhdGEtPnN1cHBsaWVz
KTsKPiArCW1mZF9yZW1vdmVfZGV2aWNlcygmc2Rldi0+ZGV2KTsKPiArCWtmcmVlKGRkYXRhKTsK
PiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbGltX2RldmljZV9pZCB3Y2Q5MzR4X3Ns
aW1faWRbXSA9IHsKPiArCXsgU0xJTV9NQU5GX0lEX1FDT00sIFNMSU1fUFJPRF9DT0RFX1dDRDkz
NDAsIDB4MSwgMHgwIH0sCgpXaGF0IGRvIHRoZSBsYXN0IHBhcmFtZXRlcnMgbWVhbj8gTWlnaHQg
YmUgYmV0dGVyIHRvIGRlZmluZSB0aGVtLgoKPiArCXt9Cj4gK307CgpbLi4uXQoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
