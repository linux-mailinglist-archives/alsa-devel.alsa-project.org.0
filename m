Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC1146C76
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 16:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5B01696;
	Thu, 23 Jan 2020 16:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5B01696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579792674;
	bh=2X/UGlYmPA8SgDdxlPyMR0YJkRjhAmzl6NmrB0fANMI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UraVKdtHsgYnFp1eFsi927ll0DwSlLQ5clUkYSCDyta5RmSb5De7cbnrZf7YcQfKj
	 eeYg5mMM5FSHHmfdJXRF6IAmu5nAB5yaLYvnag+onkx2xW6EWFLWWFZEfWUTPbX5QP
	 s8JykSqjHro3JkM55qzkTk8F4HKgdH7g6joaB9Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F1BCF800E7;
	Thu, 23 Jan 2020 16:16:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8374BF801D9; Thu, 23 Jan 2020 16:16:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFE74F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 16:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFE74F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b1DKaRxv"
Received: by mail-lj1-x244.google.com with SMTP id m26so3798834ljc.13
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yfgpWVliAB55UTtNyKcSVyCqGSUJiB1fMDMcAEJZeJ4=;
 b=b1DKaRxvy5UqCTHxcEUKFSXo97Y9/2RMbOwH/t4jG/2WcuRn8uTUVfwF9C38fjjQEw
 dpOeDm+b4Qi/j/byQlHDO/4JcxfyxZUP6sjF/GnQDjkxPj60QcZfD8RrGM0qZ3aiYK4P
 goke2QqnkMRogN/2mvILn8YYOV5ZciFxPAH+BQg9Qs5YVpuck8R1lEJOWBsxxFZ/xlTW
 5Q31csM3tqvc/kDLg9ElOCZCBAkiQW8tVHOneHo2bRH/XkqMaY+47wRzWoyJo+/4+L+U
 mNVUrLUpg2e2+SGfj3dBSrfbOh6RzXtRTTaSlgx6hV0W4irRTlT5rAa/7HaxWL5TNsUS
 F8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfgpWVliAB55UTtNyKcSVyCqGSUJiB1fMDMcAEJZeJ4=;
 b=ky+IO65kyNqMBf+Gq8Vk4riVIMvBPJQscGtVwHYVKAUbDldDy5HfO3E8UavBPHZQqT
 XZZEh2m77A8lWMSbOWyzVT3bn3XR2+wNikp0QeAhluiuoK05FBeCjeZeSMv/MPgLr/Q6
 AKL7v64p/FCp1Vo2jAiPyDDkfbN0gw+4VPuQVXlyh6x2oKdQX8DnRJahgB/qpvsMsN5Y
 oucH6e4e9AT/D3/u+O5n7fW+9fpFeQg5f31bvZD7I6G9g+WxHuEamevo9fsZJH5vYrnk
 X/FQpiaiWUR+83sBD9ca5T6v/2+NLs73ni/hc9nBbTv6tabZd6pAhrSTYcVGFAg3zPK2
 diZQ==
X-Gm-Message-State: APjAAAWEsohSOzArq/eIdeNh9gEdW0zLPGBzymiYxNx4wbeNTU8KrYLS
 MWFt0WRIo30NEyvy43mRgmQ=
X-Google-Smtp-Source: APXvYqwmxF98dYl23Cu+/uDH5g3hUS8mq5X/ld/eN62rkh6ei3M1OAGSxl9nV/npy89xEb/8gjTeVg==
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23929879ljc.39.1579792563481; 
 Thu, 23 Jan 2020 07:16:03 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id r10sm484836ljk.99.2020.01.23.07.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 07:16:02 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
Date: Thu, 23 Jan 2020 18:16:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, tiwai@suse.com, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sharadg@nvidia.com, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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

MjMuMDEuMjAyMCAxMjoyMiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMS8y
Mi8yMDIwIDk6NTcgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6
IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gMjIuMDEu
MjAyMCAxNDo1MiwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pj4gT24gMjIvMDEvMjAyMCAwNzox
NiwgU2FtZWVyIFB1amFyIHdyb3RlOgo+Pj4KPj4+IC4uLgo+Pj4KPj4+Pj4+Pj4+PiArc3RhdGlj
IGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+
Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+PiArwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2
LT5kZXYpOwo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3Bl
bmRlZCgmcGRldi0+ZGV2KSkKPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRl
Z3JhMjEwX2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pj4+Pj4+PiBUaGlzIGJy
ZWFrcyBkZXZpY2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluIHRoZQo+
Pj4+Pj4+Pj4gYWN0aXZlCj4+Pj4+Pj4+PiBzdGF0ZS4gVGhpcyBjb2RlIHNob3VsZCBiZSByZW1v
dmVkLiBBdCBtb3N0IHlvdSBjb3VsZCB3YXJuCj4+Pj4+Pj4+PiBhYm91dCB0aGUKPj4+Pj4+Pj4+
IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3VsZG4ndCBiZSBuZWNlc3Nhcnku
Cj4+Pj4+Pj4+IEkgZ3Vlc3MgdGhpcyB3YXMgYWRkZWQgZm9yIHNhZmV0eSBhbmQgZXhwbGljaXQg
c3VzcGVuZCBrZWVwcyBjbG9jawo+Pj4+Pj4+PiBkaXNhYmxlZC4KPj4+Pj4+Pj4gTm90IHN1cmUg
aWYgcmVmLWNvdW50aW5nIG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3aGVuIHJ1bnRpbWUgUE0gaXMK
Pj4+Pj4+Pj4gZGlzYWJsZWQgYW5kIGRldmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+PiBJIHNlZSBm
ZXcgZHJpdmVycyB1c2luZyB0aGlzIHdheS4KPj4+Pj4+PiBJdCBzaG91bGQgbWF0dGVyIChpZiBJ
J20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBiZWNhdXNlIFJQTSBzaG91bGQKPj4+Pj4+PiBiZSBp
bgo+Pj4+Pj4+IGEgd3JlY2tlZCBzdGF0ZSBvbmNlIHlvdSdsbCB0cnkgdG8gcmUtbG9hZCB0aGUg
ZHJpdmVyJ3MgbW9kdWxlLgo+Pj4+Pj4+IExpa2VseQo+Pj4+Pj4+IHRoYXQgdGhvc2UgZmV3IG90
aGVyIGRyaXZlcnMgYXJlIHdyb25nLgo+Pj4+Pj4+Cj4+Pj4+Pj4gW3NuaXBdCj4+Pj4+PiBPbmNl
IHRoZSBkcml2ZXIgaXMgcmUtbG9hZGVkIGFuZCBSUE0gaXMgZW5hYmxlZCwgSSBkb24ndCB0aGlu
ayBpdAo+Pj4+Pj4gd291bGQgdXNlCj4+Pj4+PiB0aGUgc2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJl
c3BvbmRpbmcgcmVmIGNvdW50LiBEb2Vzbid0IGl0IHVzZSB0aGUKPj4+Pj4+IG5ldwo+Pj4+Pj4g
Y291bnRlcnM/Cj4+Pj4+PiBJZiBSUE0gaXMgbm90IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uLCBt
b3N0IGxpa2VseSBpdCB3b3VsZCBiZSB0aGUKPj4+Pj4+IGNhc2UKPj4+Pj4+IGZvciBvdGhlcgo+
Pj4+Pj4gZGV2aWNlcy4gV2hhdCBiZXN0IGRyaXZlciBjYW4gZG8gaXMgcHJvYmFibHkgZG8gYSBm
b3JjZSBzdXNwZW5kCj4+Pj4+PiBkdXJpbmcKPj4+Pj4+IHJlbW92YWwgaWYKPj4+Pj4+IGFscmVh
ZHkgbm90IGRvbmUuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAsIHNpbmNlIG11bHRpcGxlIGRyaXZl
cnMKPj4+Pj4+IHN0aWxsCj4+Pj4+PiBoYXZlIGl0LAo+Pj4+Pj4gdW5sZXNzIHRoZXJlIGlzIGEg
cmVhbCBoYXJtIGluIGRvaW5nIHNvLgo+Pj4+PiBJIHRvb2sgYSBjbG9zZXIgbG9vayBhbmQgbG9v
a3MgbGlrZSB0aGUgY291bnRlciBhY3R1YWxseSBzaG91bGQgYmUKPj4+Pj4gcmVzZXQuIFN0aWxs
IEkgZG9uJ3QgdGhpbmsgdGhhdCBpdCdzIGEgZ29vZCBwcmFjdGljZSB0byBtYWtlIGNoYW5nZXMK
Pj4+Pj4gdW5kZXJuZWF0aCBvZiBSUE0sIGl0IG1heSBzdHJpa2UgYmFjay4KPj4+PiBJZiBSUE0g
aXMgYnJva2VuLCBpdCBwcm9iYWJseSB3b3VsZCBoYXZlIGJlZW4gY2F1Z2h0IGR1cmluZyBkZXZp
Y2UKPj4+PiB1c2FnZS4KPj4+PiBJIHdpbGwgcmVtb3ZlIGV4cGxpY2l0IHN1c3BlbmQgaGVyZSBp
ZiBubyBhbnkgY29uY2VybnMgZnJvbSBvdGhlcgo+Pj4+IGZvbGtzLgo+Pj4+IFRoYW5rcy4KPj4+
IEkgcmVjYWxsIHRoYXQgdGhpcyB3YXMgdGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcgdGhpcyBm
cm9tIHRoZSBSUE0KPj4+IGZvbGtzLiBUZWdyYTMwIEkyUyBkcml2ZXIgZG9lcyB0aGUgc2FtZSBh
bmQgU3RlcGhlbiBoYWQgcG9pbnRlZCBtZSB0bwo+Pj4gdGhpcyBhcyBhIHJlZmVyZW5jZS4KPj4+
IEkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgbWVhbnQgdG8gZW5zdXJlIHRoYXQgdGhlCj4+PiBkZXZp
Y2UgaXMgYWx3YXlzIHBvd2VyZWQtb2ZmIHJlZ2FyZGxlc3Mgb2YgaXQgUlBNIGlzIGVuYWJsZWQg
b3Igbm90IGFuZAo+Pj4gd2hhdCB0aGUgY3VycmVudCBzdGF0ZSBpcy4KPj4gWWVzLCBpdCB3YXMg
a2luZGEgYWN0dWFsIGZvciB0aGUgY2FzZSBvZiB1bmF2YWlsYWJsZSBSUE0uCj4gCj4+IEFueXdh
eXMsIC9JIHRoaW5rLyB2YXJpYW50IGxpa2UgdGhpcyBzaG91bGQgaGF2ZSBiZWVuIG1vcmUgcHJl
ZmVycmVkOgo+Pgo+PiBpZiAoIXBtX3J1bnRpbWVfZW5hYmxlZCgmcGRldi0+ZGV2KSkKPj4gwqDC
oMKgwqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+
PiBlbHNlCj4+IMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYp
Owo+IAo+IEkgdGhpbmsgaXQgbG9va3MgdG8gYmUgc2ltaWxhciB0byB3aGF0IGlzIHRoZXJlIGFs
cmVhZHkuCj4gCj4gcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOyAvLyBpdCB3b3VsZCB0
dXJuIG91dCB0byBiZSBhIGR1bW15IGNhbGwKPiBpZiAhUlBNCj4gaWYgKCFwbV9ydW50aW1lX3N0
YXR1c19zdXNwZW5kZWQoJnBkZXYtPmRldikpIC8vIGl0IGlzIHRydWUgYWx3YXlzIGlmICFSUE0K
PiDCoMKgwqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYp
OwoKTWF5YmUgdGhpcyBpcyBmaW5lIGZvciAhUlBNLCBidXQgbm90IHJlYWxseSBmaW5lIGluIGEg
Y2FzZSBvZiBlbmFibGVkClJQTS4gRGV2aWNlIGNvdWxkIGJlIGluIHJlc3VtZWQgc3RhdGUgYWZ0
ZXIgcG1fcnVudGltZV9kaXNhYmxlKCkgaWYgaXQKd2Fzbid0IHN1c3BlbmRlZCBiZWZvcmUgdGhl
IGRpc2FibGluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
