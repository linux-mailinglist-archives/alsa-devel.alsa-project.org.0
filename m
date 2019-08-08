Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF948658A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 17:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8A385D;
	Thu,  8 Aug 2019 17:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8A385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565277562;
	bh=nrpxFnWBq9WOh3dSy5V2pnTKg9a1JX2mpwgJ1zHUCc0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IamF30jCjdDTW+HU01znCApz1kBXJYsYivMTwh3Ow5gXROi3n1cmPD+aaD6gCtCsL
	 CwtU2Rq53yv+OgkdH2mKUqszlti3iMyudW0ROKQD0mV9HIBi7ruPXEXmWlcMkNUZDI
	 b+BzSF85BGQdu9EzN5SrMkQ7RYv2y9t4kDUBfE8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2F0F800E4;
	Thu,  8 Aug 2019 17:17:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA1F0F800E3; Thu,  8 Aug 2019 17:17:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB2CF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 17:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB2CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RPKemEq/"
Received: by mail-wm1-x342.google.com with SMTP id 207so2807497wma.1
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JH79KLt/cUnUFrKqTtYF5L+pOS2C3hiTwjXkizwU6G0=;
 b=RPKemEq/ngZ4XjkAzy5p6s0pFtRFtPfOVsD/+Z5n0ckPkUjKaDVfcUKCJ6xU31lahb
 dXbkMwZ95S1PMkjcpZ2UobVQneuuBSFUepU8Rp973z7umkq9ItwCOxA/6VIZBos0hZTE
 JKSG7rIvsM+ceVU4YtEcfqSC9mIrKLhhLhQC6cBP6CLrjbcSC6MaXTJD3An8duBbRPgz
 PUv0ohwddDt3Yp7z5E8VjLbPZTzMzycd/B/lhdU7/smHV3qswv6W7LjBXIZMQzJ1pmiu
 aeOV4/Fx6DvkZTOqR+stPYzRw4YvqArNDGJZInzd6i6fAYf1Ntp2h06vXV9XtBcF2iQl
 BviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JH79KLt/cUnUFrKqTtYF5L+pOS2C3hiTwjXkizwU6G0=;
 b=T9yrPFqfFI6Jo/xyNR87BA1ZEiTcsh3H52yTVYbSPw4GrlZUgVj9OKkws1Y3g9FmXC
 mZ2vbcR6TbFV6OpJof7kE4XJkwjZrBuX8rxBt9v8YppH/jNGP+Xohze5f11jqZx2paJL
 VtgJBT01vVe272Bfr//7jdSkS4GdJUcJZcKL28Uw2IHoA+Ad/2IzbQn08nn98jHalq6/
 Y8LTn5YCxO6S388Xhc19j48zgoXOk1Jee5XRhTuoX/L2HJ5WFCFuFk3wSMImfHUR/kkq
 uw/R7UTDjbCAS9dun5gBhgcIYb5j1SO77S3OtxxxXwDx07GVIc6VHucN+hl5hydxlB+7
 o3Mw==
X-Gm-Message-State: APjAAAXgMql7WzrvLxvZvCEtXlEpM2brbZAdrv87L1f9CC41YlTAz3X1
 F1AvXTW7npJ2j4D0msvHWHYFPA==
X-Google-Smtp-Source: APXvYqyrp7wFg8Mu3fozGa9Vv2k13JVkluOFUNFjwI6aSKz9AEJVqZgF8MJw6L5ZWJ419QegEd1mNQ==
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr5268987wmm.81.1565277453643; 
 Thu, 08 Aug 2019 08:17:33 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t19sm2992693wmi.29.2019.08.08.08.17.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 08:17:32 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
 <42ca4170-0fa0-6951-f568-89a05c095d5a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <564f5fa4-59ec-b4e5-a7a5-29dee99039b3@linaro.org>
Date: Thu, 8 Aug 2019 16:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <42ca4170-0fa0-6951-f568-89a05c095d5a@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
 support for slave devices
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

VGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXcuCgpPbiAwOC8wOC8yMDE5IDE2OjAwLCBQ
aWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4gQEAgLTM1LDYgKzM2LDcgQEAgc3RhdGlj
IGludCBzZHdfc2xhdmVfYWRkKHN0cnVjdCBzZHdfYnVzICpidXMsCj4+IMKgwqDCoMKgwqAgc2xh
dmUtPmRldi5yZWxlYXNlID0gc2R3X3NsYXZlX3JlbGVhc2U7Cj4+IMKgwqDCoMKgwqAgc2xhdmUt
PmRldi5idXMgPSAmc2R3X2J1c190eXBlOwo+PiArwqDCoMKgIHNsYXZlLT5kZXYub2Zfbm9kZSA9
IG9mX25vZGVfZ2V0KHRvX29mX25vZGUoZndub2RlKSk7Cj4gCj4gc2hvdWxkbid0IHRoaXMgcHJv
dGVjdGVkIGJ5Cj4gI2lmIElTX0VOQUJMRUQoQ09ORklHX09GKSA/Cj4gClRoZXNlIG1hY3JvcyBh
bmQgZnVuY3Rpb25zIGhhdmUgZHVtbXkgZW50cmllcywgc28gaXQgc2hvdWxkIG5vdCBiZSBhbiBp
c3N1ZS4KSSBkaWQgYnVpbGQgc291bmR3aXJlIHdpdGggaTM4Nl9kZWZjb25maWcgd2l0aCBubyBp
c3N1ZXMuCgo+PiDCoMKgwqDCoMKgIHNsYXZlLT5idXMgPSBidXM7Cj4+IMKgwqDCoMKgwqAgc2xh
dmUtPnN0YXR1cyA9IFNEV19TTEFWRV9VTkFUVEFDSEVEOwo+PiDCoMKgwqDCoMKgIHNsYXZlLT5k
ZXZfbnVtID0gMDsKPj4gQEAgLTExMiwzICsxMTQsNDggQEAgaW50IHNkd19hY3BpX2ZpbmRfc2xh
dmVzKHN0cnVjdCBzZHdfYnVzICpidXMpCj4+IMKgIH0KPj4gwqAgI2VuZGlmCj4+ICsKPj4gKy8q
Cj4+ICsgKiBzZHdfb2ZfZmluZF9zbGF2ZXMoKSAtIEZpbmQgU2xhdmUgZGV2aWNlcyBpbiBtYXN0
ZXIgZGV2aWNlIHRyZWUgbm9kZQo+PiArICogQGJ1czogU0RXIGJ1cyBpbnN0YW5jZQo+PiArICoK
Pj4gKyAqIFNjYW5zIE1hc3RlciBEVCBub2RlIGZvciBTRFcgY2hpbGQgU2xhdmUgZGV2aWNlcyBh
bmQgcmVnaXN0ZXJzIGl0Lgo+PiArICovCj4+ICtpbnQgc2R3X29mX2ZpbmRfc2xhdmVzKHN0cnVj
dCBzZHdfYnVzICpidXMpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gYnVz
LT5kZXY7Cj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+PiArCj4+ICvCoMKg
wqAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShidXMtPmRldi0+b2Zfbm9kZSwgbm9kZSkgewo+PiAr
wqDCoMKgwqDCoMKgwqAgc3RydWN0IHNkd19zbGF2ZV9pZCBpZDsKPj4gK8KgwqDCoMKgwqDCoMKg
IGNvbnN0IGNoYXIgKmNvbXBhdCA9IE5VTEw7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpbnQgdW5pcXVl
X2lkLCByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpbnQgdmVyLCBtZmdfaWQsIHBhcnRfaWQsIGNs
YXNzX2lkOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXQgPSBvZl9nZXRfcHJvcGVydHko
bm9kZSwgImNvbXBhdGlibGUiLCBOVUxMKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY29tcGF0
KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0ID0gc3NjYW5mKGNvbXBhdCwgInNkdyV4LCV4LCV4LCV4IiwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZ2ZXIsICZtZmdfaWQsICZwYXJ0X2lkLCAmY2xhc3Nf
aWQpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCAhPSA0KSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiTWFuZiBJRCAmIFByb2R1Y3QgY29kZSBub3QgZm91bmQg
JXNcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0KTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJzZHct
aW5zdGFuY2UtaWQiLCAmdW5pcXVlX2lkKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJJbnN0YW5jZSBpZCBub3Qg
Zm91bmQ6JWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+
IAo+IEkgYW0gY29uZnVzZWQgaGVyZS4KPiBJZiB5b3UgaGF2ZSB0d28gaWRlbnRpY2FsIGRldmlj
ZXMgb24gdGhlIHNhbWUgbGluaywgaXNuJ3QgdGhpcyBwcm9wZXJ0eSAKPiByZXF1aXJlZCBhbmQg
dGhhdCBzaG91bGQgYmUgYSByZWFsIGVycm9yIGluc3RlYWQgb2YgYSBjb250aW51ZT8KClllcywg
SSBhZ3JlZSBpdCB3aWxsIGJlIG1hbmRhdG9yeSBpbiBzdWNoIGNhc2VzLgoKQW0gb2theSBlaXRo
ZXIgd2F5LCBJIGRvbnQgbWluZCBjaGFuZ2luZyBpdCB0byByZXR1cm5pbmcgRUlOVkFMIGluIGFs
bCAKdGhlIGNhc2VzLgoKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqAgaWQuc2R3X3ZlcnNpb24gPSB2ZXIgLSAweEY7Cj4gCj4gbWF5YmUgYSBjb21tZW50IGlu
IHRoZSBjb2RlIHdvdWxkIGhlbHAgdG8gbWFrZSB0aGUgZW5jb2RpbmcgCj4gc2VsZi1leHBsYW5h
dG9yeSwgYXMgeW91IGRpZCBpbiB0aGUgRFQgYmluZGluZ3MKPiAKPiAgwqAgVmVyc2lvbiBudW1i
ZXIgJzB4MTAnIHJlcHJlc2VudHMgU291bmRXaXJlIDEuMAo+ICDCoCBWZXJzaW9uIG51bWJlciAn
MHgxMScgcmVwcmVzZW50cyBTb3VuZFdpcmUgMS4xCgpNYWtlcyBzZW5zZSwgd2lsbCBmaXggdGhp
cyBpbiBuZXh0IHZlcnNpb24uClRoaXMgaW5mbyBpcyBhbHNvIGF2YWlsYWJsZSBpbiBiaW5kaW5n
cy4KCgotLXNyaW5pCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCBpZC51bmlxdWVfaWQgPSB1bmlxdWVf
aWQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZC5tZmdfaWQgPSBtZmdfaWQ7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBpZC5wYXJ0X2lkID0gcGFydF9pZDsKPj4gK8KgwqDCoMKgwqDCoMKgIGlkLmNsYXNzX2lk
ID0gY2xhc3NfaWQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzZHdfc2xhdmVfYWRkKGJ1cywgJmlkLCBv
Zl9md25vZGVfaGFuZGxlKG5vZGUpKTsKPj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgcmV0dXJuIDA7
Cj4+ICt9Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
