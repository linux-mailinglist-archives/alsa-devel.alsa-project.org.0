Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CABDBD7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 12:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732A31678;
	Wed, 25 Sep 2019 12:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732A31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569406005;
	bh=iAEflWHbf3y3GbSqNIMj7HNe3yba2rMCUyRKobrpRos=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXfjEeVRUtYVOJTCnhWXJ/7gHz8cWt29+e8STgzu+O4pijt0P8z1L4uZtG19/sOX0
	 wvdHoVufVg36RNCraPQerkWFD9SWic3SlhHOetMbxzLfpfmoGyGxqAaSaKmZu4s/Dk
	 iYiq2Z+ujyVWzRtRYpRFr0XOWek76lTUyedDrvUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32C4F8049C;
	Wed, 25 Sep 2019 12:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E40F80508; Wed, 25 Sep 2019 12:04:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 383B3F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 12:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 383B3F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZAynBvl6"
Received: by mail-pg1-x529.google.com with SMTP id u17so2923699pgi.6
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=ucLMZNiTr3md7huHOKymFlsP4IesAeypq4Spg2tlE6E=;
 b=ZAynBvl6F6RQtHEGeMaf0LzuT0QbBEN3eeHK4+AJhveydGZnGTjUFbb40KZHQcJNKJ
 isbfShrolTKeDI3jlWWGvVEEv1bE+pJO6NZzgvWaw/LTmWY73e/DlSH4dEgMSXqf1sU9
 nvSqNd2HwBn+PiGz+1tEuIWNDxkuraz7bYvd9b4B4HsJivmfqCHJDZJPItfzozxETWO5
 9cYxNjK8kBV9s+L7Ss3GpfPP90TCl7YsZlJbPcrbHTuPcHnV+ACkgurWwTOvrFkvKVCX
 dOZMdn0juIw9agHYh+oPz2068V7EUY8/jyNVbo+NSMQn8DNRikGbv455uDFiqSdB1oCB
 0phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=ucLMZNiTr3md7huHOKymFlsP4IesAeypq4Spg2tlE6E=;
 b=ls0cBK0MwkHLhKLuHWuGpRWzdjX0zoT58mwi0Cx3P9Hd4ELGpY8lJDIst/xC1eZNct
 Ht+efCFHEx3IZSIvhPZh51/UigabvMbZlqLd6M0E/ZAXmxnA3U7Vy6Db7MVoeQo6+nmy
 DXiCt1w/9tlRDZo9yNWIjGXGlPaoX7IIg38g28tIbL+3DFUcfs5E7ahuKAXePkbHxKV+
 4lnPsxe7o6/CNbGP8PSTnWzEYzCyxTC8M9RTa68jcniMVxUiqXCOj6IaZ0H5MXYPsis1
 iNksY9tbsS9PRPOTLdsjeXrWSvprEYDa97NxKkwknAiXkj812HOy1WEbbkCqT+3aOwiD
 xDFg==
X-Gm-Message-State: APjAAAUeNqMAkmkLb9DUGVLahh+12Q1gPLkOdCmt+935tmYv9BHymWmT
 aODyhII04uHEXswH4NPOq3I=
X-Google-Smtp-Source: APXvYqysz8OPwlUHfuZrBJaOQyCtdwJjGiIdyyytZO8tpimwDjPqVYCO2+k7mjloG1ZhSthg/bHw8w==
X-Received: by 2002:a62:8209:: with SMTP id w9mr9020507pfd.112.1569405867690; 
 Wed, 25 Sep 2019 03:04:27 -0700 (PDT)
Received: from [192.168.43.124] ([101.12.51.228])
 by smtp.gmail.com with ESMTPSA id s1sm3462311pjs.31.2019.09.25.03.04.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 03:04:27 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20190903163829.GB7916@sirena.co.uk>
 <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
 <20190904115630.GA4348@sirena.co.uk>
From: Richtek Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <3a9f66b3-bdb7-9bec-a9c4-ac58d3efa543@gmail.com>
Date: Wed, 25 Sep 2019 18:04:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904115630.GA4348@sirena.co.uk>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] [MT6660] Mediatek Smart Amplifier Driver
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

RGVhciBNYXJrOgoKIMKgwqDCoCBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgogwqDCoMKgIEJ1dCBJ
IHN0aWxsIGhhdmUgc29tZSBxdWVzdGlvbnMuIHBsZWFzZSBjaGVjayB0aGUgcmVkIGNvbW1lbnQu
CgpNYXJrIEJyb3duIOaWvCAyMDE5LzkvNCDkuIvljYg3OjU2IOWvq+mBkzoKPiBPbiBXZWQsIFNl
cCAwNCwgMjAxOSBhdCAwMzowNzowNlBNICswODAwLCBSaWNodGVrIEplZmYgQ2hhbmcgd3JvdGU6
Cj4KPj4+PiArc3RhdGljIGludDMyX3QgbXQ2NjYwX2kyY191cGRhdGVfYml0cyhzdHJ1Y3QgbXQ2
NjYwX2NoaXAgKmNoaXAsCj4+Pj4gKwl1aW50MzJfdCBhZGRyLCB1aW50MzJfdCBtYXNrLCB1aW50
MzJfdCBkYXRhKQo+Pj4+ICt7Cj4+PiBJdCB3b3VsZCBiZSBnb29kIHRvIGltcGxlbWVudCBhIHJl
Z21hcCByYXRoZXIgdGhhbiBvcGVuIGNvZGluZwo+Pj4gKmV2ZXJ5dGhpbmcqIC0gaXQnZCBnaXZl
IHlvdSB0aGluZ3MgbGlrZSB0aGlzIHdpdGhvdXQgbmVlZGluZyB0byBvcGVuCj4+PiBjb2RlIHRo
ZW0uICBQcm92aWRpbmcgeW91IGRvbid0IHVzZSB0aGUgY2FjaGUgY29kZSBpdCBzaG91bGQgY29w
ZSBmaW5lCj4+PiB3aXRoIHZhcmlhYmxlIHJlZ2lzdGVyIHNpemVzLgo+PiBEdWUgdG8gb3VyIGhh
cmR3YXJlIGRlc2lnbiwgaXQgaXMgaGFyZCB0byBpbXBsZW1lbnQgcmVnbWFwIGZvciBNVDY2NjAu
Cj4gWW91IGRlZmluaXRlbHkgY2FuJ3QgdXNlIGFsbCB0aGUgZnVuY3Rpb25hbGl0eSBkdWUgdG8g
dGhlIHZhcmlhYmxlCj4gcmVnaXN0ZXIgc2l6ZXMgYnV0IHVzaW5nIHJlZ193cml0ZSgpIGFuZCBy
ZWdfcmVhZCgpIHNob3VsZCBnZXQgeW91IG1vc3QKPiBvZiBpdC4KCgogwqDCoMKgIEhvdyBjYW4g
SSBmaWxsIHRoZSB2YWxfYml0cyBmb3IgdmFyaWFibGUgcmVnaXN0ZXIgc2l6ZT8KCiDCoMKgwqAg
SSB0cnkgdG8gdXNlIGFsbCAzMiBiaXRzIHZhbF9iaXRzLCBidXQgb3VyIGNoaXAgc29tZSByZWdp
c3RlcnMgYXJlIApvdmVybGFwLi4uCgogwqDCoMKgIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9u
IGZvciB0aGlzIGlzc3VlP8KgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgo+Cj4+Pj4gK3N0YXRpYyBp
bnQgbXQ2NjYwX2kyY19pbml0X3NldHRpbmcoc3RydWN0IG10NjY2MF9jaGlwICpjaGlwKQo+Pj4+
ICt7Cj4+Pj4gKwlpbnQgaSwgbGVuLCByZXQ7Cj4+Pj4gKwljb25zdCBzdHJ1Y3QgY29kZWNfcmVn
X3ZhbCAqaW5pdF90YWJsZTsKPj4+PiArCj4+Pj4gKwlpbml0X3RhYmxlID0gZTRfcmVnX2luaXRz
Owo+Pj4+ICsJbGVuID0gQVJSQVlfU0laRShlNF9yZWdfaW5pdHMpOwo+Pj4+ICsKPj4+PiArCWZv
ciAoaSA9IDA7IGkgPCBsZW47IGkrKykgewo+Pj4+ICsJCXJldCA9IG10NjY2MF9pMmNfdXBkYXRl
X2JpdHMoY2hpcCwgaW5pdF90YWJsZVtpXS5hZGRyLAo+Pj4+ICsJCQkJaW5pdF90YWJsZVtpXS5t
YXNrLCBpbml0X3RhYmxlW2ldLmRhdGEpOwo+Pj4+ICsJCWlmIChyZXQgPCAwKQo+Pj4+ICsJCQly
ZXR1cm4gcmV0Owo+Pj4gV2h5IGFyZSB3ZSBub3QgdXNpbmcgdGhlIGNoaXAgZGVmYXVsdHMgaGVy
ZT8KPj4gQmVjYXVzZSBNVDY2NjAgbmVlZHMgdGhpcyBpbml0aWFsIHNldHRpbmcgZm9yIHdvcmtp
bmcgd2VsbC4KPiBXaGF0IGFyZSB0aGVzZSBzZXR0aW5ncz8gIEFyZSB5b3Ugc3VyZSB0aGV5IGFy
ZSBnZW5lcmljIHNldHRpbmdzIGFuZAo+IG5vdCBib2FyZCBzcGVjaWZpYz8KClllcywgdGhleSBh
cmUgZ2VuZXJpYyBzZXR0aW5nLiBJdCBjb21lcyBmcm9tIG91ciBoYXJkd2FyZSBkZXNpZ25lcnMu
CgoKPj4+PiArCWlmIChvbl9vZmYpIHsKPj4+PiArCQlpZiAoY2hpcC0+cHdyX2NudCA9PSAwKSB7
Cj4+Pj4gKwkJCXJldCA9IG10NjY2MF9pMmNfdXBkYXRlX2JpdHMoY2hpcCwKPj4+PiArCQkJCU1U
NjY2MF9SRUdfU1lTVEVNX0NUUkwsIDB4MDEsIDB4MDApOwo+Pj4+ICsJCQl2YWwgPSBtdDY2NjBf
aTJjX3JlYWQoY2hpcCwgTVQ2NjYwX1JFR19JUlFfU1RBVFVTMSk7Cj4+Pj4gKwkJCWRldl9pbmZv
KGNoaXAtPmRldiwKPj4+PiArCQkJCSIlcyByZWcweDA1ID0gMHgleFxuIiwgX19mdW5jX18sIHZh
bCk7Cj4+Pj4gKwkJfQo+Pj4+ICsJCWNoaXAtPnB3cl9jbnQrKzsKPj4+IFRoaXMgbG9va3MgbGlr
ZSB5b3UncmUgb3BlbiBjb2RpbmcgcnVudGltZSBQTSBzdHVmZj8gIEFGQUlDVCB0aGUgaXNzdWUK
Pj4+IGlzIHRoYXQgeW91IG5lZWQgdG8gd3JpdGUgdG8gdGhpcyByZWdpc3RlciB0byBkbyBhbnkg
SS9PLiAgSnVzdAo+Pj4gaW1wbGVtZW50IHRoaXMgdmlhIHRoZSBzdGFuZGFyZCBydW50aW1lIFBN
IGZyYW1ld29yaywgeW91J2xsIG5lZWQgdG8gZG8KPj4+IHNvbWV0aGluZyBhYm91dCB0aGUgcmVn
aXN0ZXIgSS9PIGluIHRoZSBjb250cm9scyAoaWRlYWxseSBpbiB0aGUKPj4+IGZyYW1ld29yaywg
aXQnZCBiZSBhIGxvdCBlYXNpZXIgaWYgeW91IGRpZCBoYXZlIGEgY2FjaGUpIGJ1dCB5b3UgY291
bGQKPj4+IGN1dCBvdXQgdGhpcyBiaXQuCj4+IEluIG91ciBleHBlcmllbmNlLCBzb21lIEN1c3Rv
bWVyIHBsYXRmb3JtIGRvZXNuJ3Qgc3VwcG9ydCBydW50aW1lIFBNLgo+IFRlbGwgeW91ciBjdXN0
b21lcnMgdG8gdHVybiBpdCBvbiwgaXQncyBhIHN0YW5kYXJkIGtlcm5lbCBmcmFtZXdvcmsgYW5k
Cj4gdGhlcmUncyByZWFsbHkgbm8gZXhjdXNlIGZvciBvcGVuIGNvZGluZyBpdC4gIElmIHRoZXJl
J3Mgc29tZSByZWFzb24gd2h5Cj4gcnVudGltZSBQTSBjYW4ndCB3b3JrIGZvciB0aGVtIHRoZW4g
d2Ugc2hvdWxkIGdldCB0aGF0IGZpeGVkIGJ1dCBpdAo+IHJlYWxseSBpcyAqdmVyeSogd2lkZWx5
IGRlcGxveWVkLgoKCldlIGFscmVhZHkgaW1wbGVtZW50IGl0IGluIHJ1bnRpbWUgUE0uCgpGb3Ig
YWxsIHlvdXIgY29tbWVudCwgcmVnbWFwIGlzIGEgaGFyZCB0aGluZyB0byBtb2RpZnkuIEkgYWxz
byBzdXJ2ZXkgCm90aGVycyBkcml2ZXIgYWJvdXQgdmFyaWFibGUgcmVnaXN0ZXIgc2l6ZS4gQnV0
IGl0IHNlZW1zIG5vIG9uZSBsaWtlIG91ciAKTVQ2NjYwIGNoaXAuLi4KClNob3VsZCBJIHNlbmQg
bmV3IHBhdGNoIGZpbGUgdG8geW91IGluIHRoaXMgbWFpbCBsb29wLCBvciBJIHNob3VsZCBzZW5k
IApuZXcgcGF0Y2ggdmlhIG5ldyBFbWFpbCBMb29wPwoKVGhhbmtzIGEgbG90LgoKUmljaHRlayBK
ZWZmIENoYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
