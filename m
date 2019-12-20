Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD021280B5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 17:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB79A1614;
	Fri, 20 Dec 2019 17:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB79A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576859630;
	bh=/as5nRaZcS4m5phjD8/OQSN48/SQqy83F7BdZT1UV5A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TT7xZHjp9jZ/IUM0bag5GjGIcCybqiug1wnBbdJocJrpnomc2mYHqGwTGKHgrKBpB
	 kB0AdaOnW3vjP9XVRIaE+X7CNptF/eVXD+adgnvCHzl9p2S4KEe4/M00Z/vtcfNEEz
	 NaejJiSPE3bpMOXimNO1XD6m01476vLEuuCpDZSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B2B8F8015A;
	Fri, 20 Dec 2019 17:32:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FAEBF8015A; Fri, 20 Dec 2019 17:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB25F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 17:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB25F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TA54U0TU"
Received: by mail-wm1-x343.google.com with SMTP id q9so9560326wmj.5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nfBhFheOJSQ2cTI/H0nGh5vkSteGa8LTLNcVuXEK4PI=;
 b=TA54U0TUcLZhNqTVTC4ns5+IuNPNR+pigzv4VAqT2xDpiIfD6N3yWjJ/c3SxPEYkKb
 fsayTb8frdzIawWlyv5v6KYwu/harHiUd67DrC5GjpNIWVSl8rer/jqkZwZUzthTEkm2
 /WyXXcVpTpx7hvPk3eAn7NOd9dd7qDIgKgJ66bpXed/2HljWsKSVchUy/uK12NvTZAPr
 I5Xy1Bv7j63G4jj1GT9PwRmzF2PdEuJNjx/UMe/iV902jHs+Eu3i320E/J5YmW2vj3YS
 eaqbYtZz/BVr5gFDmWTMmAtJNrxc4AgOzt+w1T8V7w5lZSqLrmRZhWP3+RgLFPBYKWE4
 wReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nfBhFheOJSQ2cTI/H0nGh5vkSteGa8LTLNcVuXEK4PI=;
 b=tbkhSN9c2YudL2w6/s7XRlaCQmMGvPCMQ6VDXsCNtPppymXDIKa3UlFcWsCOHPj4Cg
 2g2q0cgqPtoutYOpMMCj9/QsLkpp5pf1bu8m9e9NSAWrWIsfXa/JSGDWu3PCRnQPBeM4
 tvN8DiTIT0exst3j3tiGr1IYuU0fmFOVp2v4R2X/ZI8FamZPpqsO6YK+0tcwPVpxrV+a
 WD+0aBGLhwzqDgMIn1QXmzaH6zP0xFjpRyx/DAKsuVTIrjLnUYSc+CKJ1Cq8jdHnQIAt
 3wE9Pl8yqax0ad6fczDMFrEIB50IB9tVIlmVRB6McmBf+19tH9iWfxQqdyv4lFhsZf3i
 +ffg==
X-Gm-Message-State: APjAAAUPAODu0j15cglGNMlfWvnVfTM6RF4RE6gMEoEJSh+mmehbR1QS
 eQIJFl937msa/8uFbLgq9NJFEg==
X-Google-Smtp-Source: APXvYqzkHMIPaKuD2qM6OT1H0PWscV4s2ktb7j22FXGxeUpvG7pw2cssyMQE1xBJBPGfC3iE3YJ63Q==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr17619006wmo.13.1576859519364; 
 Fri, 20 Dec 2019 08:31:59 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o15sm10597008wra.83.2019.12.20.08.31.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Dec 2019 08:31:57 -0800 (PST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
 <20191220115629.8293-3-srinivas.kandagatla@linaro.org>
 <052d527b-77a5-172e-2b18-ca635242b440@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <30c40a3b-2d70-b1a2-117b-63f0ece65cef@linaro.org>
Date: Fri, 20 Dec 2019 16:31:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <052d527b-77a5-172e-2b18-ca635242b440@linux.intel.com>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH v10 2/2] ASoC: codecs: add wsa881x
 amplifier support
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

CgpPbiAyMC8xMi8yMDE5IDE1OjQ1LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4g
Kwo+PiArwqDCoMKgIC8qKgo+PiArwqDCoMKgwqAgKiBOT1RFOiB0aGVyZSBpcyBhIHN0cmljdCBo
dyByZXF1aXJlbWVudCBhYm91dCB0aGUgb3JkZXJpbmcgb2YgcG9ydAo+PiArwqDCoMKgwqAgKiBl
bmFibGVzIGFuZCBhY3R1YWwgUEEgZW5hYmxlLiBQQSBlbmFibGUgc2hvdWxkIG9ubHkgaGFwcGVu
IGFmdGVyCj4gCj4gUEEgPT0gcG93ZXIgYW1wbGlmaWVycz8KWWVzLgo+IAo+PiArwqDCoMKgwqAg
KiBzb3VuZHdpcmUgcG9ydHMgYXJlIGVuYWJsZWQgaWYgbm90IERDIG9uIHRoZSBsaW5lIGlzIGFj
Y3VtbGF0ZWQKPiAKPiBhY2N1bXVsYXRlZAo+IAo+PiArwqDCoMKgwqAgKiByZXN1bHRpbmcgaW4g
Q2xpY2svUG9wIE5vaXNlCj4+ICvCoMKgwqDCoCAqLwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gc2R3
X2VuYWJsZV9zdHJlYW0od3NhODgxeC0+c3J1bnRpbWUpOwo+IAo+IEkgZ3Vlc3MgdGhpcyBhbnN3
ZXJzIHRvIG15IHF1ZXN0aW9uIGFib3ZlLCB5b3UgYXJlIG5vdCB1c2luZyB0aGUgJ3VzdWFsJyAK
PiBtYXBwaW5nIGJldHdlZW4gQUxTQSBzdGF0ZXMgYW5kIFNvdW5kV2lyZSBzdHJlYW0gc3RhdGVz
LiBFbmFibGluZyB0aGUgCj4gc3RyZWFtIHdpbGwgY2F1c2UgYSBiYW5rIHN3aXRjaCBhbmQgKHpl
cm8/KSBkYXRhIHRvIGJlIHRyYW5zbWl0dGVkLCBpcyAKPiB0aGlzIGludGVudGlvbmFsPwo+IApJ
IGd1ZXNzIFllcyEKTXlzZWxmIGFuZCBWaW5vZCBzcGVudCBmZXcgd2Vla3MgdW5kZXJzdGFuZGlu
ZyB0aGUgYXVkaW8gZ2xpdGNoZXMgaWYgd2UgCmVuYWJsZSBQQSBiZWZvcmUgc291bmR3aXJlIHBv
cnRzLCBhbmQgZmluYWxseSBodyBndXlzIGNhbWUgaW4gd2l0aCB0aGlzIAppbmZvcm1hdGlvbiwg
dGhhdCBQQSBoYXMgdG8gYmUgZGlzYWJsZWQgYmVmb3JlIHNvdW5kd2lyZSBwb3J0cyBhcmUgZW5h
YmxlZC4KCj4gSWYgdGhpcyBpcyBkdWUgdG8gdGhlIG9yZGVyIHdpdGggdGhlIFBBLCB0aGVuIHdo
ZXJlIGlzIHRoZSBQQSBoYW5kbGVkPwo+IAoKUEEgZW5hYmxlL211dGUgYXJlIGhhbmRsZWQgYXMg
cGFydCBvZiBEQVBNIGFuZCBkaWdpdGFsIG11dGUuCgo+IAo+PiArwqDCoMKgIGlmIChyZXQpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHNkd19kZXByZXBhcmVfc3RyZWFtKHdzYTg4MXgtPnNydW50aW1l
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiArwqDCoMKg
IHdzYTg4MXgtPnN0cmVhbV9wcmVwYXJlZCA9IHRydWU7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4g
cmV0Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHdzYTg4MXhfaHdfcGFyYW1zKHN0cnVjdCBz
bmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPj4gK3sKPj4g
K8KgwqDCoCBzdHJ1Y3Qgd3NhODgxeF9wcml2ICp3c2E4ODF4ID0gZGV2X2dldF9kcnZkYXRhKGRh
aS0+ZGV2KTsKPj4gK8KgwqDCoCBpbnQgaTsKPj4gKwo+PiArwqDCoMKgIHdzYTg4MXgtPmFjdGl2
ZV9wb3J0cyA9IDA7Cj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IFdTQTg4MVhfTUFYX1NXUl9Q
T1JUUzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXdzYTg4MXgtPnBvcnRfZW5hYmxl
W2ldKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgd3NhODgxeC0+cG9ydF9jb25maWdbd3NhODgxeC0+YWN0aXZlX3BvcnRzXSA9Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
d3NhODgxeF9wY29uZmlnW2ldOwo+PiArwqDCoMKgwqDCoMKgwqAgd3NhODgxeC0+YWN0aXZlX3Bv
cnRzKys7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHNkd19zdHJlYW1fYWRk
X3NsYXZlKHdzYTg4MXgtPnNsYXZlLCAmd3NhODgxeC0+c2NvbmZpZywKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdzYTg4MXgtPnBvcnRfY29uZmlnLCB3c2E4ODF4
LT5hY3RpdmVfcG9ydHMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB3c2E4ODF4LT5zcnVudGltZSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgd3NhODgxeF9o
d19mcmVlKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPj4gK3sKPj4gK8Kg
wqDCoCBzdHJ1Y3Qgd3NhODgxeF9wcml2ICp3c2E4ODF4ID0gZGV2X2dldF9kcnZkYXRhKGRhaS0+
ZGV2KTsKPj4gKwo+PiArwqDCoMKgIHNkd19kaXNhYmxlX3N0cmVhbSh3c2E4ODF4LT5zcnVudGlt
ZSk7Cj4+ICvCoMKgwqAgc2R3X2RlcHJlcGFyZV9zdHJlYW0od3NhODgxeC0+c3J1bnRpbWUpOwo+
IAo+IFRoaXMgd29ya3MgaWYgeW91IGRvIGEgaHdfcGFyYW1zLT5wcmVwYXJlLT5od19mcmVlIHRy
YW5zaXRpb24sIGJ1dCBpc24ndCAKPiBpdCBwb3NzaWJsZSB0byBoYXZlIGh3X3BhcmFtcy0+aHdf
ZnJlZSBhcyB3ZWxsPyBJbiB0aGF0IGNhc2UgdGhlIHN0cmVhbSAKPiB3b3VsZCBub3QgZW5hYmxl
ZC9wcmVwYXJlZCwgc28gc2hvdWxkbid0IHlvdSBoYXZlIHRoZSBzYW1lIHRlc3QgYXMgaW4gCj4g
cHJlcGFyZT8KCkFtIG5vdCAxMDAlIHN1cmUgaWYgd2Ugd291bGQganVzdCBoYXZlIGh3X3BhcmFt
cy0+aHdfZnJlZSwgSWYgdGhhdCBpcyAKdHJ1ZSwgdGhlbiB5ZXMgd2UgbmVlZCB0aGUgc2FtZSBj
aGVjayBoZXJlIHRvby4gSG93ZXZlciBzb3VuZHdpcmUgY29yZSAKc2hvdWxkIHRocm93IGludmFs
aWQgc3RhdGUgZXJyb3IgaW4gc3VjaCBjYXNlcyB0b28uCgo+IAo+IGlmICh3c2E4ODF4LT5zdHJl
YW1fcHJlcGFyZWQpIHsKPiAgwqDCoMKgwqBzZHdfZGlzYWJsZV9zdHJlYW0od3NhODgxeC0+c3J1
bnRpbWUpOwo+ICDCoMKgwqDCoHNkd19kZXByZXBhcmVfc3RyZWFtKHdzYTg4MXgtPnNydW50aW1l
KTsKPiAgwqDCoMKgwqB3c2E4ODF4LT5zdHJlYW1fcHJlcGFyZWQgPSBmYWxzZTsKPiB9Cj4gCj4+
ICvCoMKgwqAgc2R3X3N0cmVhbV9yZW1vdmVfc2xhdmUod3NhODgxeC0+c2xhdmUsIHdzYTg4MXgt
PnNydW50aW1lKTsKPj4gK8KgwqDCoCB3c2E4ODF4LT5zdHJlYW1fcHJlcGFyZWQgPSBmYWxzZTsK
Pj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4gCj4+ICtzdGF0aWMgc3RydWN0
IHNuZF9zb2NfZGFpX2RyaXZlciB3c2E4ODF4X2RhaXNbXSA9IHsKPj4gK8KgwqDCoCBbMF0gPSB7
Cj4gCj4gaXMgdGhhdCBbMF0gbmVlZGVkPwpOb3QgcmVhbGx5IG5lZWRlZCEKCj4gCj4+ICvCoMKg
wqDCoMKgwqDCoCAubmFtZSA9ICJTUEtSIiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5pZCA9IDAsCj4+
ICvCoMKgwqDCoMKgwqDCoCAucGxheWJhY2sgPSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5zdHJlYW1fbmFtZSA9ICJTUEtSIFBsYXliYWNrIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnJhdGVfbWF4ID0gNDgwMDAsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlX21p
biA9IDQ4MDAwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWluID0gMSwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDEsCj4+ICvCoMKgwqDC
oMKgwqDCoCB9LAo+PiArwqDCoMKgwqDCoMKgwqAgLm9wcyA9ICZ3c2E4ODF4X2RhaV9vcHMsCj4+
ICvCoMKgwqAgfSwKPj4gK307IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
