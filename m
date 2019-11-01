Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E1EC771
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B775235D;
	Fri,  1 Nov 2019 18:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B775235D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572628998;
	bh=6N1hG8XavGIuwXCp/W3xd5fpEdXzZYRYxNiUirCfiM4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D73+4pW/ukFvB8W/ybVtqDhLaIzdcPwRGoINJ7BK8wKc/8iWMAeFXW4VN9VjQGBq6
	 N2MUdrwaenIZ8dbEWMMO74YM3WuqCvC2tTDNKfNpBgZ67yDVM/Z+L6CoFumeScO+92
	 JkeT6k6/9J0PZQloBjURk4cgXl7OrsDTeLpxLWLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA0F7F80120;
	Fri,  1 Nov 2019 18:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DB9FF803D6; Fri,  1 Nov 2019 18:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1F5F80120
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1F5F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G7gUsER0"
Received: by mail-wm1-x341.google.com with SMTP id 8so2693602wmo.0
 for <alsa-devel@alsa-project.org>; Fri, 01 Nov 2019 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MpRg6nqoHYJ/pSBwFIjrrktBed6kT7iSbfFA/w2faoE=;
 b=G7gUsER0tv0aZqOVv8Y3URfYq478/asw+rQpa5aMIbdQ3gHHxu5VxIioUzSRzO0C90
 m6oKt0WJy+Ih0so1DbrGyD0PI7ZZ6AtmRXyaasQcKVsFoPflGG5F06K+lS1ZVQ/jV2NL
 iplZw7ZrvqRg7oKm4qBvgKoxGxtLx3nSSpAz728tvFbh1EztgcuRY8Hp5iPnBbKQUWfd
 bUe8DDLcTCFbLjYpg7uV2REvjjvTj2Dw0MecZRxRRoj2SVppAOupQ+UzPB+fmE+HDO/A
 eIpKbhZtJcqvofllGCu6pREuPuaZHXzoN8qam2C865TRazuBdyOX1Su7xy7m+WpiEBjM
 P5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpRg6nqoHYJ/pSBwFIjrrktBed6kT7iSbfFA/w2faoE=;
 b=N2G+Hmrdxwnz7uWsEqzBDEWEieMmhFy8roQdJf/ZNvdHIgiIJpluMHw3hwKaYwBNyw
 fw3YxFnqK9TiGTr2dSFZYkBtNjvqBLUQu7QngOND5Ulw4QSMXLpvazgUWIGEgSDrck+v
 vjeFC1X5Do9+m2VQLiIwsw0NL9U5yOqg2j64vJH0zLn+fv/AlN/yUhtcNrqvslBLXX5A
 yMpyGQk7JePat32gouM1pOCMtKaWWVhwc1Is+LoaQ+CHJ5Gye6Eq7TMxyDBpu5JpdrP2
 dmfM9G78NwNlqT+Wxn/WQ6+QQhQNyKq+FN/iRxnfD9DU8p/zOXKq1WKY8N+iSrr0No3k
 5YFw==
X-Gm-Message-State: APjAAAUcO6greDNvoRAZH+c9S4UM8hJYn0yMj9Ax42K8x5UARgYnNjE2
 NwtSfx+xZC56JD4zt2gEL0UndQ==
X-Google-Smtp-Source: APXvYqw0qJqgEGHH9z4Y57tq14rEexdFZkWs0tWv7RFkvZVXE35wyn8WRC4YEb7LPfsnBK/ASDhOsA==
X-Received: by 2002:a05:600c:2385:: with SMTP id
 m5mr4227405wma.9.1572628926436; 
 Fri, 01 Nov 2019 10:22:06 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u1sm12264367wru.90.2019.11.01.10.22.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Nov 2019 10:22:05 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh@kernel.org, vkoul@kernel.org
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
 <20191030153150.18303-3-srinivas.kandagatla@linaro.org>
 <af29ec6e-d89e-7fa4-a8cd-29ab944ecd5c@linux.intel.com>
 <926bd15f-e230-8f5e-378d-355bfeeecf27@linaro.org>
 <3d17a2a2-3033-e740-a466-e6cf7919adb2@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7ea278b4-ecd4-bd17-4550-3f6f9136260e@linaro.org>
Date: Fri, 1 Nov 2019 17:22:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d17a2a2-3033-e740-a466-e6cf7919adb2@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 2/2] soundwire: qcom: add support for
 SoundWire controller
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

CgpPbiAwMS8xMS8yMDE5IDE2OjM5LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4+
PiArc3RhdGljIGludCBxY29tX3N3cm1fcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHNuZF9zb2NfZGFpICpkYWkpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0cnVjdCBxY29tX3N3cm1f
Y3RybCAqY3RybCA9IGRldl9nZXRfZHJ2ZGF0YShkYWktPmRldik7Cj4+Pj4gKwo+Pj4+ICvCoMKg
wqAgaWYgKCFjdHJsLT5zcnVudGltZVtkYWktPmlkXSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0dXJuIHNkd19lbmFibGVfc3RyZWFt
KGN0cmwtPnNydW50aW1lW2RhaS0+aWRdKTsKPj4+Cj4+PiBTbyBpbiBod19wYXJhbXMgeW91IGNh
bGwgc2R3X3ByZXBhcmVfc3RyZWFtKCkgYW5kIGluIF9wcmVwYXJlIHlvdSAKPj4+IGNhbGwgc2R3
X2VuYWJsZV9zdHJlYW0oKT8KPj4+Cj4+PiBTaG91bGRuJ3QgdGhpcyBiZSBoYW5kbGVkIGluIGEg
LnRyaWdnZXIgb3BlcmF0aW9uIGFzIHBlciB0aGUgCj4+PiBkb2N1bWVudGF0aW9uICJGcm9tIEFT
b0MgRFBDTSBmcmFtZXdvcmssIHRoaXMgc3RyZWFtIHN0YXRlIGlzIGxpbmtlZCB0bwo+Pj4gLnRy
aWdnZXIoKSBzdGFydCBvcGVyYXRpb24uIgo+Pgo+PiBJZiBJIG1vdmUgc2R3X2VuYWJsZS9kaXNh
YmxlX3N0cmVhbSgpIHRvIHRyaWdnZXIgSSBnZXQgYSBiaWcgY2xpY2sgCj4+IG5vaXNlIG9uIG15
IHNwZWFrZXJzIGF0IHN0YXJ0IGFuZCBlbmQgb2YgZXZlcnkgcGxheWJhY2suIFRyaWVkIAo+PiBk
aWZmZXJlbnQgdGhpbmdzIGJ1dCBub3RoaW5nIGhlbHBlZCBzbyBmYXIhLiBFbmFibGluZyBTcGVh
a2VyIERBQ3MgCj4+IG9ubHkgYWZ0ZXIgU291bmRXaXJlIHBvcnRzIGFyZSBlbmFibGVkIGlzIHdv
cmtpbmcgZm9yIG1lIQo+PiBUaGVyZSBpcyBub3RoaW5nIGNvbXBsaWNhdGVkIG9uIFdTQTg4MXgg
Y29kZWMgc2lkZSBhbGwgdGhlIERBQ3MgYXJlIAo+PiBlbmFibGVkL2Rpc2FibGVkIGFzIHBhcnQg
b2YgREFQTS4KPiAKPiB0aGF0IGxvb2tzIGxpa2UgYSB3b3JrLWFyb3VuZCB0byBtZT8gSWYgeW91
IGRvIGEgYmFuayBzd2l0Y2ggd2l0aG91dCAKPiBhbnl0aGluZyB0cmlnZ2VyZWQsIHlvdSBhcmUg
bW9zdCBsaWtlbHkgc2VuZGluZyBhIGJ1bmNoIG9mIHplcm9lcyB0byAKPiB5b3VyIGFtcGxpZmll
ciBhbmQgZW5hYmxpbmcgY2xpY2svcG9wIHJlbW92YWxzIHNvbWVob3cuCj4gCj4gSXQnZCBiZSB3
b3J0aCBsb29raW5nIGludG8gdGhpcywgbWF5YmUgdGhlcmUncyBhIG1pc3NpbmcgZGlnaXRhbCAK
PiBtdXRlL3VubXV0ZSB0aGF0J3Mgbm90IGRvbmUgaW4gdGhlIHJpZ2h0IG9yZGVyPwoKRGlnaXRh
bCBtdXRlIGRvZXMgbm90IGhlbHAgdG9vLCBhcyB0aGV5IGdldCB1bm11dGVkIGJlZm9yZSAKc2R3
X2VuYWJsZV9zdHJlYW0oKSBjYWxsIGluIHRyaWdnZXIsIEkgaGl0IHNhbWUgY2xpY2sgc291bmQu
CgpTYW1lIGluIHRoZSBkaXNhYmxlIHBhdGggdG9vIQoKQWxzbyBJIG5vdGljZWQgdGhhdCB0aGVy
ZSBhcmUgbW9yZSB0aGFuIDIwKyByZWdpc3RlciByZWFkL3dyaXRlcyBpbiB0aGUgCnNkd19lbmFi
bGVfc3RyZWFtKCkgcGF0aCB3aGljaCB0b29rIGF0bGVhc3QgMzAgdG8gNDAgbWlsbGlzZWNvbmRz
LgoKCkkgd2lsbCB0cnkgbXkgbHVjayBjaGVja2luZyB0aGUgZG9jcyB0byBzZWUgaWYgSSBjYW4g
ZmluZCBzb21ldGhpbmcgCndoaWNoIHRhbGtzIGFib3V0IHRoaXMuCgotLXNyaW5pCgoKPiAKPj4K
Pj4+Cj4+PiBJdCdzIGFsc28gbXkgdW5kZXJzdGFuZGluZyB0aGF0IC5wcmVwYXJlIHdpbGwgYmUg
Y2FsbGVkIG11bHRpcGxlcyB0aW1lcywgCj4+Cj4+IEkgYWdyZWUsIG5lZWQgdG8gYWRkIHNvbWUg
ZXh0cmEgY2hlY2tzIGluIHRoZSBwcmVwYXJlIHRvIGRlYWwgd2l0aCB0aGlzIQo+Pgo+Pj4gaW5j
bHVkaW5nIGZvciB1bmRlcmZsb3dzIGFuZCByZXN1bWUgaWYgeW91IGRvbid0IHN1cHBvcnQgSU5G
T19SRVNVTUUuCj4+Cj4+Pgo+Pj4gdGhlIHNkd19kaXNhYmxlX3N0cmVhbSgpIGlzIGluIC5od19m
cmVlLCB3aGljaCBpcyBub3QgbmVjZXNzYXJpbHkgCj4+PiBjYWxsZWQgYnkgdGhlIGNvcmUsIHNv
IHlvdSBtYXkgaGF2ZSBhIHJpc2sgb2Ygbm90IGJlaW5nIGFibGUgdG8gcmVjb3Zlcj8KPj4KPj4g
SG1tLCBJIHRob3VnaHQgaHdfZnJlZSBpcyBhbHdheXMgY2FsbGVkIHRvIHJlbGVhc2UgcmVzb3Vy
Y2VzIGFsbG9jYXRlZCAKPj4gaW4gaHdfcGFyYW1zLgo+Pgo+PiBJbiB3aGF0IGNhc2VzIGRvZXMg
dGhlIGNvcmUgbm90IGNhbGwgdGhpcz8KPiAKPiB5ZXMsIGJ1dCBwcmVwYXJlIGNhbiBiZSBjYWxs
ZWQgd2l0aG91dCBod19mcmVlIGNhbGxlZCBmaXJzdC4gdGhhdCdzIHdoeSAKPiB3ZSB1cGRhdGVk
IHRoZSBzdGF0ZSBtYWNoaW5lIHRvIGFsbG93IGZvciBESVNBQkxFRHxERVBSRVBBUkVEIC0+IAo+
IFBSRVBBUkVEIHRyYW5zaXRpb25zLgo+IAo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgcWNvbV9zd3JtX2Rldl9wbV9vcHMgPSB7Cj4+Pj4gK8KgwqDCoCBTRVRfUlVOVElNRV9Q
TV9PUFMocWNvbV9zd3JtX3J1bnRpbWVfc3VzcGVuZCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBxY29tX3N3cm1fcnVudGltZV9yZXN1bWUsCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTlVMTAo+Pj4+ICvCoMKgwqAgKQo+Pj4+ICt9Owo+Pj4KPj4+IE1heWJl
IGRlZmluZSBwbV9ydW50aW1lIGF0IGEgbGF0ZXIgdGltZSB0aGVuPyBXZSd2ZSBoYWQgYSBsb3Qg
b2YgcmFjZSAKPj4+IGNvbmRpdGlvbnMgdG8gZGVhbCB3aXRoLCBhbmQgaXQncyBvZGQgdGhhdCB5
b3UgZG9uJ3Qgc3VwcG9ydCBwbGFpbiAKPj4+IHZhbmlsbGEgc3VzcGVuZCBmaXJzdD8KPj4+Cj4+
IFRyeWluZyB0byBrZWVwIHRoaW5ncyBzaW1wbGUgZm9yIHRoZSBmaXJzdCBwYXRjaHNldCEgYWRk
ZWQgdGhpcyAKPj4gZHVtbWllcyB0byBrZWVwIHRoZSBzb3VuZHdpcmUgY29yZSBoYXBweSEKPiAK
PiBJZiB5b3UgYXJlIHJlZmVycmluZyB0byB0aGUgZXJyb3JzIHdoZW4gcG1fcnVudGltZSBpcyBu
b3QgZW5hYmxlZCwgd2UgCj4gZml4ZWQgdGhpcyBpcyB0aGUgc2VyaWVzIHRoYXQncyBiZWVuIG91
dCBmb3IgcmV2aWV3IGZvciAxMCBkYXlzIG5vdy4uLgo+IAo+IHNlZSAnW1BBVENIIDAzLzE4XSBz
b3VuZHdpcmU6IGJ1czogYWRkIFBNL25vLVBNIHZlcnNpb25zIG9mIHJlYWQvd3JpdGUgCj4gZnVu
Y3Rpb25zJywgdGhhdCBzaG91bGQgcmVtb3ZlIHRoZSBuZWVkIGZvciBkdW1teSBmdW5jdGlvbnMu
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
