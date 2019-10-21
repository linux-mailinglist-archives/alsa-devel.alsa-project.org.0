Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA094DEB4F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 13:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712D21666;
	Mon, 21 Oct 2019 13:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712D21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571658431;
	bh=eW78RSZ5OdLJS/Csz3Y5NelQNtbjy8FwlL5aY52D8dc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDTfQDs3r4LSPW0wzSLadCcd63kmVYO6iHIfHW8lPCljxoPi4H8oQfqevjFLVMxZJ
	 8CdM26u/7UyJjV/EgwKPlS62Rym1CKOE5zndLChYU7nE+4w6DnjqNbm0+x2JH2qIKH
	 i4EduOcCVHEfKJU5aCPnbGT426qca5rmObMTFlbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44563F80368;
	Mon, 21 Oct 2019 13:45:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38B9F80368; Mon, 21 Oct 2019 13:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA38F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 13:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA38F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L2nU+xgC"
Received: by mail-wm1-x341.google.com with SMTP id 14so5792356wmu.0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
 b=L2nU+xgCbN5LtkAhVSUAyqXKpaIpDb2NbqaWZD/9o/EUs39LUEO2TGEXCZnz/+1GMK
 vmYJLj9mwZ8wqiG/kirdJIyY//VurXZfTQCPxCtOY9IL1skWqhSDbep7FMWDaLf13PQ/
 K/qp+YDO47tUKlxjf4r2zecpRPk3YMUhUEBQLnU3Q0XHC57ZyUaPxmpuZHIIAQIzaN+r
 Y/Xqo9jpEBUc0N9HPFcmvN3EWnuoZGNRmYXpqVEg0baVbVZf+XMCdVLcukyYbTdNbr2J
 T9Lw2o/kyFrxYKTVufYqj0aVqDHuuCSO2Xl0SadOAKJWb8w3occPpbjoyIxp+cJPLyhh
 MHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
 b=IHjOFvM9K7C5y+1DxrVAUyQfiqxf4g+agewjebN0gNAidDXMYGLIfoun6rx5FPvnfc
 23qbAVvuCh5WAE2YCsXce/7zDCKzuj346AbiQ2b0lNDBrXg8vuboS0k+KV161LWE9jyB
 cQUcvUgRWan3GIzCwa2yBqfNV9mj4tsAMyL9XN2S33obLSEKJSC/R1ZoFJgjTZcD5Ti1
 TxbaW/I1UBS5GRZTk4pCf86zQ09J4BmRt3KV9uh3EK+uPza0nFzZLPdbLwYRlU14vzeH
 lhe7iYz46Px8t8EZsIjtuWd7rsXCXGUfT43eyYZOffk+SQZ3NZZbRmLtkxGM2qWXfhxl
 OVXA==
X-Gm-Message-State: APjAAAV5jQlQg+9Pa/pAVAp1UMceEt8QE7iiZIi8YNUrs80fvlVnnJSh
 OCspdjgF1S35jWWecSkV4VeM4hTevUc=
X-Google-Smtp-Source: APXvYqxEr92jhtBT1uFAamq5FfTEOFtNLr64Fwysmfw5liFBfPgdTxylfL+k5nkA5UswqABKpIGI9A==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr6276449wmc.124.1571658322488; 
 Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id o4sm24943791wre.91.2019.10.21.04.45.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Date: Mon, 21 Oct 2019 12:45:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191021114520.GD4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 02/11] mfd: wcd934x: add support to
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

T24gTW9uLCAyMSBPY3QgMjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKCj4gVGhhbmtz
IExlZSBmb3IgdGFraW5nIHRpbWUgdG8gcmV2aWV3Lgo+IAo+IEkgYWdyZWUgd2l0aCBtb3N0IG9m
IHRoZSBzdHlsZSByZWxhdGVkIGNvbW1lbnRzLCB3aWxsIGZpeCB0aGVtIGluIG5leHQKPiB2ZXJz
aW9uLiBGb3Igb3RoZXJzIEkgaGF2ZSByZXBsaWVkIGl0IGlubGluZS4KClsuLi5dCgo+ID4gPiAr
c3RhdGljIGludCB3Y2Q5MzR4X2JyaW5nX3VwKHN0cnVjdCB3Y2Q5MzR4X2RhdGEgKndjZCkKPiA+
ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgcmVnbWFwICpybSA9IHdjZC0+cmVnbWFwOwo+ID4gCj4gPiBJ
dCdzIG11Y2ggbW9yZSBjb21tb24gdG8gdXNlICdyZWdtYXAnIG9yICdtYXAnLgo+IAo+IE9ubHkg
cmVhc29uIHRvIG1ha2UgaXQgc2hvcnQgaGVyZSBpcyB0byBzYXZlIHNvbWUgbGluZXMhCj4gSWYg
eW91IHByZWZlciByZWdtYXAsIEkgd2lsbCBhZGQgdGhhdCBpbiBuZXh0IHZlcnNpb24hCgpJIGRv
dWJ0IGl0J2Qgc2F2ZSBtYW55IChhbnk/KSBsaW5lcy4KClsuLi5dCgo+ID4gPiArc3RhdGljIGlu
dCB3Y2Q5MzR4X3NsaW1fc3RhdHVzKHN0cnVjdCBzbGltX2RldmljZSAqc2RldiwKPiA+ID4gKwkJ
CSAgICAgICBlbnVtIHNsaW1fZGV2aWNlX3N0YXR1cyBzdGF0dXMpCj4gPiA+ICt7Cj4gPiA+ICsJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnNkZXYtPmRldjsKPiA+ID4gKwlzdHJ1Y3Qgd2NkOTM0eF9k
YXRhICp3Y2Q7Cj4gPiA+ICsJaW50IHJldDsKPiA+IAo+ID4gVGhpcyBpcyBzZW1hbnRpY2FsbHkg
b2RkISAgV2h5IGFyZSB5b3UgZG9pbmcgbW9zdCBvZiB0aGUKPiA+IGluaXRpYWxpc2F0aW9uIGFu
ZCBicmluZy11cCBpbiAnc3RhdHVzJyBhbmQgbm90ICdwcm9iZScuICBTZWVtcwo+ID4gYnJva2Vu
IHRvIG1lLgo+IAo+IFNMSU1CdXMgZGV2aWNlIHdpbGwgbm90IGJlIGluIGEgc3RhdGUgdG8gY29t
bXVuaWNhdGUgYmVmb3JlIGVudW1lcmF0aW9uIChhdAo+IHByb2JlKSwgc28gYWxsIHRoZSBkZXZp
Y2UgaW5pdGlhbGl6YXRpb24gaXMgZG9uZSBpbiBzdGF0dXMgY2FsbGJhY2sgd2hlcmUgaXQKPiBp
cyByZWFkeSBmb3IgY29tbXVuaWNhdGlvbi4KCldoeSBkbyB3ZSBuZWVkIHRoZSBkZXZpY2UgdG8g
YmUgdXAgKmJlZm9yZSogY2FsbGluZyBwcm9iZT8KCj4gVGhpcyBpcyBzYW1lIHdpdGggU291bmRX
aXJlIEJ1cyBhcyB3ZWxsIQoKWy4uLl0KCj4gPiA+ICsJc3RydWN0IGRldmljZSAqZGV2Owo+ID4g
PiArCXN0cnVjdCBjbGsgKmV4dGNsazsKPiA+ID4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4g
PiA+ICsJc3RydWN0IHNsaW1fZGV2aWNlICpzZGV2Owo+ID4gCj4gPiBZb3UgZG9uJ3QgbmVlZCAn
c2RldicgYW5kICdkZXYnLgo+IAo+IHNsaW1fZGV2aWNlIGluc3RhbmNlIChzZGV2KSBpcyByZXF1
aXJlZCBieSBhdWRpbyBjb2RlYyBkcml2ZXIgdG8gYWxsb2NhdGUKPiBzdHJlYW0gcnVudGltZS4K
CllvdSBjYW4gZXh0cmFwb2xhdGUgb25lIGZyb20gdGhlIG90aGVyLgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
