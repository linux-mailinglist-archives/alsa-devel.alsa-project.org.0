Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B161459E7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 17:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8350216B0;
	Wed, 22 Jan 2020 17:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8350216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579710543;
	bh=XwhdINSupsmvcFrUyaWAsH7CbB3kEM8BOChfbbu13xI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3D1C8NGa+cyXnb3mLSF20DqjkyTR7Ikm7Cb8Icb+4YJxNBrfZWFRzuJ7wphGYJif
	 uCzYzyKswvdxFN93rZu5Kp++8DGL9F8zfcuVTdvMXG9nXapNZW8dT80kdV3v2t30bC
	 GiGtzShOLbRztoCRLLOKltS91LKUfPJ11f7L512g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E69FBF800E7;
	Wed, 22 Jan 2020 17:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A58ECF80229; Wed, 22 Jan 2020 17:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12330F80229
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 17:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12330F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uEtDzy3t"
Received: by mail-lj1-x243.google.com with SMTP id z22so7539093ljg.1
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 08:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gyeCH9xGtCulfFDHcJD6zCd/sMhVJQbBdrtw8jLxavk=;
 b=uEtDzy3tbP7MsHzt2WKoG6BRGtVK2Z09+1dHcrHzh7vZ/n9aqi1sVDPUD3jFHn/Fak
 F04w2Be300xT1Wx9qQWla58A82e78mL8ujsvwUrQq+oj4K6OunfdG9EtvpK8NYBJh/L0
 XOr/kW9OKoX6OmBudv8C7Mh0sOCUmprEq3fAaq3d+SiTbM6c1ZyVYhQzrM7VkJ5/odPb
 8Rj/S+FEGevAfVKwXP01EgXi479QiOacmP4NlP07jWCULhAGUX8DQaH4y5qGVMIlEq9v
 k2Oi6GXjQM/KI6+j5t+opM27PQ7WBcmP36lECVtZ+5iF5NiPpzqWtgjrUjlPIT/TZCXg
 /QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyeCH9xGtCulfFDHcJD6zCd/sMhVJQbBdrtw8jLxavk=;
 b=JXoVe7Y80A4fV8QZwDjuvcGWPldtM/oQ/VmaZiLSixTG+lNt0fwfDuufNNY8lgW7ny
 evZ48FospVF9owHZhWlxl2AV6QkG8RblDwRChbCeS9gETO2bdCkG/zT7uSp+wvhLZ/GY
 K5RqenEI1UheyOzEUKihVWEne1FrTdpCh351P0XriOs9v0+kCZck7j4OQmAf8ZpNM8Eo
 vCA1umeOsfXMH24eYJ8v6jxnxYrHxjK728JuW/sIjX6wLJ9l/mwYPP7AYEoarGPOyflp
 chRdhnFidg3be6oijm2wX50xKJaOpA1FjI7U/EpxvQ4eazDvGV8T5iF04YC5e/vp41fw
 LQTA==
X-Gm-Message-State: APjAAAUFnRdp1AJ6V1C0oBDda+3GuZLLSppuRPQllA6OgrJ60RU6/czt
 Z5esDMAjooetdcjPGRSazMg=
X-Google-Smtp-Source: APXvYqz5ssAEa2D0DdqYDAcXynfwpquZa/aDNsc8yYqMDTfyH5s04Mr37yYctq1LnUWYEdjtXu0fDQ==
X-Received: by 2002:a05:651c:2046:: with SMTP id
 t6mr20273717ljo.180.1579710433017; 
 Wed, 22 Jan 2020 08:27:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d20sm20510706ljg.95.2020.01.22.08.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 08:27:12 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
Date: Wed, 22 Jan 2020 19:27:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, atalambedu@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

MjIuMDEuMjAyMCAxNDo1MiwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDIyLzAxLzIw
MjAgMDc6MTYsIFNhbWVlciBQdWphciB3cm90ZToKPiAKPiAuLi4KPiAKPj4+Pj4+Pj4gK3N0YXRp
YyBpbnQgdGVncmEyMTBfaTJzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5k
ZXYpOwo+Pj4+Pj4+PiArwqDCoMKgwqAgaWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQo
JnBkZXYtPmRldikpCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVncmEyMTBf
aTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+Pj4+PiBUaGlzIGJyZWFrcyBkZXZp
Y2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluIHRoZSBhY3RpdmUKPj4+
Pj4+PiBzdGF0ZS4gVGhpcyBjb2RlIHNob3VsZCBiZSByZW1vdmVkLiBBdCBtb3N0IHlvdSBjb3Vs
ZCB3YXJuIGFib3V0IHRoZQo+Pj4+Pj4+IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0
IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuCj4+Pj4+PiBJIGd1ZXNzIHRoaXMgd2FzIGFkZGVkIGZv
ciBzYWZldHkgYW5kIGV4cGxpY2l0IHN1c3BlbmQga2VlcHMgY2xvY2sKPj4+Pj4+IGRpc2FibGVk
Lgo+Pj4+Pj4gTm90IHN1cmUgaWYgcmVmLWNvdW50aW5nIG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3
aGVuIHJ1bnRpbWUgUE0gaXMKPj4+Pj4+IGRpc2FibGVkIGFuZCBkZXZpY2UgaXMgcmVtb3ZlZC4K
Pj4+Pj4+IEkgc2VlIGZldyBkcml2ZXJzIHVzaW5nIHRoaXMgd2F5Lgo+Pj4+PiBJdCBzaG91bGQg
bWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBiZWNhdXNlIFJQTSBzaG91bGQK
Pj4+Pj4gYmUgaW4KPj4+Pj4gYSB3cmVja2VkIHN0YXRlIG9uY2UgeW91J2xsIHRyeSB0byByZS1s
b2FkIHRoZSBkcml2ZXIncyBtb2R1bGUuIExpa2VseQo+Pj4+PiB0aGF0IHRob3NlIGZldyBvdGhl
ciBkcml2ZXJzIGFyZSB3cm9uZy4KPj4+Pj4KPj4+Pj4gW3NuaXBdCj4+Pj4gT25jZSB0aGUgZHJp
dmVyIGlzIHJlLWxvYWRlZCBhbmQgUlBNIGlzIGVuYWJsZWQsIEkgZG9uJ3QgdGhpbmsgaXQKPj4+
PiB3b3VsZCB1c2UKPj4+PiB0aGUgc2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVm
IGNvdW50LiBEb2Vzbid0IGl0IHVzZSB0aGUgbmV3Cj4+Pj4gY291bnRlcnM/Cj4+Pj4gSWYgUlBN
IGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUg
dGhlIGNhc2UKPj4+PiBmb3Igb3RoZXIKPj4+PiBkZXZpY2VzLiBXaGF0IGJlc3QgZHJpdmVyIGNh
biBkbyBpcyBwcm9iYWJseSBkbyBhIGZvcmNlIHN1c3BlbmQgZHVyaW5nCj4+Pj4gcmVtb3ZhbCBp
Zgo+Pj4+IGFscmVhZHkgbm90IGRvbmUuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAsIHNpbmNlIG11
bHRpcGxlIGRyaXZlcnMgc3RpbGwKPj4+PiBoYXZlIGl0LAo+Pj4+IHVubGVzcyB0aGVyZSBpcyBh
IHJlYWwgaGFybSBpbiBkb2luZyBzby4KPj4+IEkgdG9vayBhIGNsb3NlciBsb29rIGFuZCBsb29r
cyBsaWtlIHRoZSBjb3VudGVyIGFjdHVhbGx5IHNob3VsZCBiZQo+Pj4gcmVzZXQuIFN0aWxsIEkg
ZG9uJ3QgdGhpbmsgdGhhdCBpdCdzIGEgZ29vZCBwcmFjdGljZSB0byBtYWtlIGNoYW5nZXMKPj4+
IHVuZGVybmVhdGggb2YgUlBNLCBpdCBtYXkgc3RyaWtlIGJhY2suCj4+Cj4+IElmIFJQTSBpcyBi
cm9rZW4sIGl0IHByb2JhYmx5IHdvdWxkIGhhdmUgYmVlbiBjYXVnaHQgZHVyaW5nIGRldmljZSB1
c2FnZS4KPj4gSSB3aWxsIHJlbW92ZSBleHBsaWNpdCBzdXNwZW5kIGhlcmUgaWYgbm8gYW55IGNv
bmNlcm5zIGZyb20gb3RoZXIgZm9sa3MuCj4+IFRoYW5rcy4KPiAKPiBJIHJlY2FsbCB0aGF0IHRo
aXMgd2FzIHRoZSBwcmVmZXJyZWQgd2F5IG9mIGRvaW5nIHRoaXMgZnJvbSB0aGUgUlBNCj4gZm9s
a3MuIFRlZ3JhMzAgSTJTIGRyaXZlciBkb2VzIHRoZSBzYW1lIGFuZCBTdGVwaGVuIGhhZCBwb2lu
dGVkIG1lIHRvCj4gdGhpcyBhcyBhIHJlZmVyZW5jZS4KCj4gSSBiZWxpZXZlIHRoYXQgdGhpcyBp
cyBtZWFudCB0byBlbnN1cmUgdGhhdCB0aGUKPiBkZXZpY2UgaXMgYWx3YXlzIHBvd2VyZWQtb2Zm
IHJlZ2FyZGxlc3Mgb2YgaXQgUlBNIGlzIGVuYWJsZWQgb3Igbm90IGFuZAo+IHdoYXQgdGhlIGN1
cnJlbnQgc3RhdGUgaXMuCgpZZXMsIGl0IHdhcyBraW5kYSBhY3R1YWwgZm9yIHRoZSBjYXNlIG9m
IHVuYXZhaWxhYmxlIFJQTS4KCkFueXdheXMsIC9JIHRoaW5rLyB2YXJpYW50IGxpa2UgdGhpcyBz
aG91bGQgaGF2ZSBiZWVuIG1vcmUgcHJlZmVycmVkOgoKaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQo
JnBkZXYtPmRldikpCgl0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwpl
bHNlCglwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cgo+IE5vdyBmb3IgVGVncmEyMTAg
KG9yIGFjdHVhbGx5IDY0LWJpdCBUZWdyYSkgUlBNIGlzIGFsd2F5cyBlbmFibGVkIGFuZCBzbwo+
IHdlIGRvbid0IG5lZWQgdG8gd29ycnkgYWJvdXQgdGhlICFSUE0gY2FzZS4gSG93ZXZlciwgSSBz
dGlsbCBkb24ndCBzZWUKPiB0aGUgaGFybSBpbiB0aGlzLgoKVGhlcmUgaXMgbm8gcmVhbCBoYXJt
IHRvZGF5LCBidXQ6CgoxLiBJJ2QgcHJlZmVyIHRvIGJlIHZlcnkgY2FyZWZ1bCB3aXRoIFJQTSBp
biBnZW5lcmFsLCBiYXNlZCBvbgogICBwcmV2aW91cyBleHBlcmllbmNlLgoKMi4gSXQgc2hvdWxk
IGJlIGEgYnVnIGlmIGRldmljZSBpc24ndCBSUE0tc3VzcGVuZGVkIGR1cmluZwogICBvZiBkcml2
ZXIncyByZW1vdmFsLiBUaHVzIHRoZSByZWFsIHByb2JsZW0gbmVlZHMgdG8gYmUgZml4ZWQKICAg
cmF0aGVyIHRoYW4gd29ya2VkIGFyb3VuZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
