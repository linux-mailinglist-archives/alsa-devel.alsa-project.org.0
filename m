Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99E9B418
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A13311C;
	Fri, 23 Aug 2019 17:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A13311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566575958;
	bh=HkrCWMPjvfJpzNcrRjzYead8+lppju+CdLnw7Pjcm20=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0N1A73kVDdQ/7CeW9HZdHI/iA484BpqlkvInubJdRQEYpiFNsmZ8eBaFK/sxpNHl
	 ZTDBzxzBKwIvODoi2/dSqzqQxcKmzIy4LEfCNBm32yngPYgCIDbwbw1HbNuJcxkZZq
	 4w8SuzdPCJahgDocUTLiFFKWQ1d7PyoAP7qowml4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A242EF80322;
	Fri, 23 Aug 2019 17:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 125ACF80306; Fri, 23 Aug 2019 17:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09B43F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09B43F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zvVqHz2V"
Received: by mail-wr1-x443.google.com with SMTP id j16so9074192wrr.8
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hodw0B1rU6OSggTzkDjrdfTrrPwaArVuQPWVuu09IUs=;
 b=zvVqHz2VpQBCK4S1LVU+jh9F+hVVJgTy/PjAaD0PaNWNrQSSo3AQXyK1x2j63ui/yH
 6uExGkNx1jbV5COHM7Dub0QWEwWatEoQo5VVUV2Mu1Feq4ROuOL4AtAmdSYGhz48UMQ6
 KbXbZsbA4+Tsckktx0c4fT793JXSbwuTiJ7y8gqGkHEsOGQmy1kFdoCSALAZx62sQUME
 CjtklaAM9Irl3oA0FcvX9yOlnM1KDE4xEIzwCK6MIvxO5kwAM7+Nov8iV4XNRMo7c6lE
 cwFlNR9a4amW/K6a3E7kkzfQwhR2J0852QJOW2b3C42GLDiVRMW4rWO/GEaw9C2LOSlC
 i8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hodw0B1rU6OSggTzkDjrdfTrrPwaArVuQPWVuu09IUs=;
 b=GggsJsTCL8otXwAeMyA4SITHu1dmMI6l9ZkkoqQuLv3+5iBIe5e/KjIG5gQngEx3PH
 ptU7pHleLjQtqoqCl/LRFIjuGeMPjqpMFHLYHvJgsbVyrXAOQ4QGaluVYJlrhswB5vZb
 dTfSrLEWubWIzZwO1bjFE3pVbaYZHswiNoGy6gwBHsZNpW1t/auj/G+Vpb9INV28B51W
 qLPUZ74eiOjQN37dMxht6tg1txDoaxcyspU6xn3Z9m/tsV6YV0gpiUhGJVBIrMzphNCx
 qAiTlnlYPjQxHh7X+LiEjPHnIYEhIT9NMpObu1ZQaYu2j9RiG+LTRgRDH+BQYPW+Wot5
 su/A==
X-Gm-Message-State: APjAAAWYamoiq0XPvsJtQAIIvZAVbPggJkWlI6/T9MTbK0CWetrEs19L
 PchyUKMtGKiXb++kWI6viuk0uQ==
X-Google-Smtp-Source: APXvYqzIwQ+5myiKhr1G9wWq8c2PBlfeuHux2i0D/z7S7/79vfbDXw1uO8xmudCwqPkEVdMx//a5Jw==
X-Received: by 2002:adf:ea89:: with SMTP id s9mr6357549wrm.76.1566575846953;
 Fri, 23 Aug 2019 08:57:26 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z2sm2369567wmi.2.2019.08.23.08.57.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 08:57:26 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
 <7da8aa89-2119-21d1-0e29-8894a8d40bf0@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <37be6b6d-7e7f-2cd6-f9e9-f0cac48791ad@linaro.org>
Date: Fri, 23 Aug 2019 16:57:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7da8aa89-2119-21d1-0e29-8894a8d40bf0@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
 slave bindings
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

CgpPbiAyMy8wOC8yMDE5IDE2OjQxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiA4LzIyLzE5IDY6MzcgUE0sIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4+IFRoaXMg
cGF0Y2ggYWRkcyBiaW5kaW5ncyBmb3IgU291bmR3aXJlIFNsYXZlIGRldmljZXMgdGhhdCBpbmNs
dWRlcyBob3cKPj4gU291bmRXaXJlIGVudW1lcmF0aW9uIGFkZHJlc3MgYW5kIExpbmsgSUQgYXJl
IHVzZWQgdG8gcmVwcmVzZW50ZWQgaW4KPj4gU291bmRXaXJlIHNsYXZlIGRldmljZSB0cmVlIG5v
ZGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5r
YW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiDCoCAuLi4vc291bmR3aXJlL3NvdW5kd2ly
ZS1jb250cm9sbGVyLnlhbWzCoMKgwqDCoMKgwqAgfCA3NSArKysrKysrKysrKysrKysrKysrCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCAKPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kd2lyZS9zb3Vu
ZHdpcmUtY29udHJvbGxlci55YW1sCj4+Cj4+IGRpZmYgLS1naXQgCj4+IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kd2lyZS9zb3VuZHdpcmUtY29udHJvbGxlci55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kd2lyZS9zb3VuZHdpcmUt
Y29udHJvbGxlci55YW1sIAo+Pgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjkxYWE2YzZkNjI2Ngo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyAKPj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmR3aXJlL3NvdW5kd2lyZS1jb250cm9s
bGVyLnlhbWwKPj4gQEAgLTAsMCArMSw3NSBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvc291bmR3aXJlL3NvdW5kd2lyZS1jb250cm9sbGVyLnlhbWwjCj4+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4g
Kwo+PiArdGl0bGU6IFNvdW5kV2lyZSBDb250cm9sbGVyIEdlbmVyaWMgQmluZGluZwo+PiArCj4+
ICttYWludGFpbmVyczoKPj4gK8KgIC0gU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2Fu
ZGFnYXRsYUBsaW5hcm8ub3JnPgo+PiArCj4+ICtkZXNjcmlwdGlvbjogfAo+PiArwqAgU291bmRX
aXJlIGJ1c3NlcyBjYW4gYmUgZGVzY3JpYmVkIHdpdGggYSBub2RlIGZvciB0aGUgU291bmRXaXJl
IAo+PiBjb250cm9sbGVyCj4+ICvCoCBkZXZpY2UgYW5kIGEgc2V0IG9mIGNoaWxkIG5vZGVzIGZv
ciBlYWNoIFNvdW5kV2lyZSBzbGF2ZSBvbiB0aGUgYnVzLgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+
PiArwqAgJG5vZGVuYW1lOgo+PiArwqDCoMKgIHBhdHRlcm46ICJec291bmR3aXJlKEAuKnwtWzAt
OWEtZl0pKiQiCj4+ICsKPj4gK8KgICIjYWRkcmVzcy1jZWxscyI6Cj4+ICvCoMKgwqAgY29uc3Q6
IDIKPj4gKwo+PiArwqAgIiNzaXplLWNlbGxzIjoKPj4gK8KgwqDCoCBjb25zdDogMAo+PiArCj4+
ICtwYXR0ZXJuUHJvcGVydGllczoKPj4gK8KgICJeLipAWzAtOWEtZl0rJCI6Cj4+ICvCoMKgwqAg
dHlwZTogb2JqZWN0Cj4+ICsKPj4gK8KgwqDCoCBwcm9wZXJ0aWVzOgo+PiArwqDCoMKgwqDCoCBj
b21wYXRpYmxlOgo+PiArwqDCoMKgwqDCoCBwYXR0ZXJuOiAiXnNkd1swLTldWzAtOWEtZl17NH1b
MC05YS1mXXs0fVswLTlhLWZdezJ9JCIKPiAKPiBTbyBpcyB0aGlzIGEgNjQtYml0IHZhbHVlLCBh
cyBpbiB0aGUgTUlQSSBzcGVjLCBvciBpcyB0aGlzIHBhcnQgb2YgdGhlIAo+IF9BRFIgZGVzY3Jp
cHRpb24/CgpSb2IgZGlkIG5vdCBsaWtlIGVuY29kaW5nIGNvbXBhdGlibGUgc3RyaW5nIGV4YWN0
bHkgbGlrZSBfQURSIGVuY29kaW5nLgoKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOC8yMi80
OTAKCj4gSSBhbHNvIGRvbid0IGdldCB3aHkgdGhlIGZpcnN0IGl0ZW0gaW4gaW4gYmFzZTEwPwo+
IAoKQXMgdGhpcyBjb3JyZXNwb25kcyB0byBTb3VuZHdpcmUgVmVyc2lvbiwgYW5kIEkgaGF2ZSBu
byB2aXNpYmlsaXR5IG9mIAp2ZXJzaW9uIG51bWJlciBlbmNvZGluZyBhZnRlciByZWFjaGluZyBu
dW1iZXIgOSBpbiB0aGlzIGZpZWxkLgoKVGhpcyBjYW4gYmUgdXBkYXRlZCBvbmNlIHdlIGhhdmUg
bW9yZSBpbmZvIG9uIGhvdyB0aGUgVmVyc2lvbiBlbmNvZGluZyAKd2lsbCBsb29rIGxpa2UgaW4g
ZnV0dXJlLgoKSWRlYSBvZiBsaW1pdGluZyByZWdleCB0byBbMC05XSBmb3IgdmVyc2lvbiBpcyB0
byBlbmZvcmNlIHNvbWUgY2hlY2tpbmchCgotLXNyaW5pCgo+IAo+PiArwqDCoMKgwqDCoCBkZXNj
cmlwdGlvbjoKPj4gK8KgwqDCoMKgwqAgSXMgdGhlIHRleHR1YWwgcmVwcmVzZW50YXRpb24gb2Yg
U291bmRXaXJlIEVudW1lcmF0aW9uCj4+ICvCoMKgwqDCoMKgIGFkZHJlc3MuIGNvbXBhdGlibGUg
c3RyaW5nIHNob3VsZCBjb250YWluIFNvdW5kV2lyZSBWZXJzaW9uIElELAo+PiArwqDCoMKgwqDC
oCBNYW51ZmFjdHVyZXIgSUQsIFBhcnQgSUQgYW5kIENsYXNzIElEIGluIG9yZGVyIGFuZCBzaGFs
bCBiZSBpbgo+PiArwqDCoMKgwqDCoCBsb3dlci1jYXNlIGhleGFkZWNpbWFsIHdpdGggbGVhZGlu
ZyB6ZXJvZXMuCj4+ICvCoMKgwqDCoMKgIFZhbGlkIHNpemVzIG9mIHRoZXNlIGZpZWxkcyBhcmUK
Pj4gK8KgwqDCoMKgwqAgVmVyc2lvbiBJRCBpcyAxIG5pYmJsZSwgbnVtYmVyICcweDEnIHJlcHJl
c2VudHMgU291bmRXaXJlIDEuMAo+PiArwqDCoMKgwqDCoCBhbmQgJzB4MicgcmVwcmVzZW50cyBT
b3VuZFdpcmUgMS4xIGFuZCBzbyBvbi4KPj4gK8KgwqDCoMKgwqAgTUZEIGlzIDQgbmliYmxlcwo+
PiArwqDCoMKgwqDCoCBQSUQgaXMgNCBuaWJibGVzCj4+ICvCoMKgwqDCoMKgIENJRCBpcyAyIG5p
YmJsZXMKPj4gK8KgwqDCoMKgwqAgTW9yZSBJbmZvcm1hdGlvbiBvbiBkZXRhaWwgb2YgZW5jb2Rp
bmcgb2YgdGhlc2UgZmllbGRzIGNhbiBiZQo+PiArwqDCoMKgwqDCoCBmb3VuZCBpbiBNSVBJIEFs
bGlhbmNlIERpc0NvICYgU291bmRXaXJlIDEuMCBTcGVjaWZpY2F0aW9ucy4KPj4gKwo+PiArwqDC
oMKgwqDCoCByZWc6Cj4+ICvCoMKgwqDCoMKgwqDCoCBtYXhJdGVtczogMQo+PiArwqDCoMKgwqDC
oMKgwqAgZGVzY3JpcHRpb246Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgSW5zdGFuY2UgSUQgYW5k
IExpbmsgSUQgb2YgU291bmRXaXJlIERldmljZSBBZGRyZXNzLgo+PiArCj4+ICvCoMKgwqAgcmVx
dWlyZWQ6Cj4+ICvCoMKgwqDCoMKgIC0gY29tcGF0aWJsZQo+PiArwqDCoMKgwqDCoCAtIHJlZwo+
PiArCj4+ICtleGFtcGxlczoKPj4gK8KgIC0gfAo+PiArwqDCoMKgIHNvdW5kd2lyZUBjMmQwMDAw
IHsKPj4gK8KgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+PiArwqDCoMKgwqDC
oMKgwqAgI3NpemUtY2VsbHMgPSA8MD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InFjb20sc291bmR3aXJlLXYxLjUuMCI7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwYzJk
MDAwMCAweDIwMDA+Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBzcGVha2VyQDEgewo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNkdzEwMjE3MjAxMDAwIjsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDEgMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+
PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBzcGVha2VyQDIgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gInNkdzEwMjE3MjAxMDAwIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDIgMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIH07Cj4+
ICsKPj4gKy4uLgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
