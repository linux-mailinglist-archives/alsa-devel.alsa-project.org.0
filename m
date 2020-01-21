Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E9144172
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 17:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED2C1654;
	Tue, 21 Jan 2020 17:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED2C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579622709;
	bh=id/3ZDTHrHqgiq9jET12JzRDv4DN6ZKkgKmEdv7TlZM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ubn7B8Jq/3bxR521+VEGliNubowpTu3c12GKf9DFBDWEhPvSvApdGt2ifjICXN+Xw
	 KH2D3E01ds7NvMz4oMS18JiYmgars0ELOPVz8q2kU0jYLwdGO2B1ophK3BRgE1D9/0
	 ukGVPu5fcI8siR1ZAQtz/8IuDfSXu3X6cLaMJo9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76EEBF8015B;
	Tue, 21 Jan 2020 17:03:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52AA6F801D9; Tue, 21 Jan 2020 17:03:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BECAF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 17:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BECAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oSkJmsMP"
Received: by mail-lf1-x143.google.com with SMTP id i23so2715162lfo.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 08:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qjcDJDT5ZhsuJU+cktfSQ3R47ar0BoE5LFZ4QYOhvk4=;
 b=oSkJmsMPFvlrGrBgt/E7oyZ7wGMURN57NLfvXkRGUfFsMcqdMQxLpm2Bz38hClF7Ln
 ShLcsQB78iaEi+nE1RjpRnLjH6+ka2Y4If1K8tbkLYtT5lV1/3zFNNRLyAGrURJlyE8W
 mMWg/hkKqaT3aoM++ZzTwhHFPcyy2/ecRP8Pv0g+7JIPrbDTLEheR0JiAzwV+e/Ur0dr
 pNYHzfUgFTYMjXWYop3hoUUsMJaPNO2kbYZsDkzP0HxdYKy4xccXnf2fuvYcjwD6enz3
 e12I1oL1VSsvUHi56JrA6kwd0pTVkYNmlVysL/n3hJ8Hn0w/lswn6moIte9zZJRUJxrc
 U39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qjcDJDT5ZhsuJU+cktfSQ3R47ar0BoE5LFZ4QYOhvk4=;
 b=AKxe2x/7FkV6HAAqSwAl7uUc02PPKkqw9owUDo+T9ADHHI3krLC4DLtRB9excvKcxM
 VNvIA+FXRmV9i9ATMVkvY/FKqGRlGhNkxmz9X6hGyPwLAPARqyahG+5IR/n2Mp6NVmdP
 bh9vGC4rmGcXZxrh92pPwVbS4I7hDSPbtSclKDEJ2hVlpk4IsYrf0ZCNFcugPltCOV+/
 aINM9ZI/LJPwWf7f4ywlOam24E7vWQ5NYpEMXBZgISUB+ZVhrR0oUpw3iGokoOtbT50m
 lfzFgTGsxkyQLkaWmHEnDLbr/HDaoOgztl4richulr3x6K5BKrgGErC/rjk+5UikPeQR
 wLaw==
X-Gm-Message-State: APjAAAVBsaPrnMHsFO3ytDQEJ/i/ffvz3GyxCktrz4eqJO9CEBdw1rCy
 3xANVVUSSEm9jkn+3CmrXiM=
X-Google-Smtp-Source: APXvYqzclMF2A4gK1qZbpXyXqercR78rGBMYz+1kp1LUvr0QDXRGPs35zL7ilE/pQbIxRvtkvvNXRA==
X-Received: by 2002:ac2:515b:: with SMTP id q27mr2939168lfd.119.1579622599111; 
 Tue, 21 Jan 2020 08:03:19 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id w16sm19566502lfc.1.2020.01.21.08.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:03:18 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
Date: Tue, 21 Jan 2020 19:03:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

MjEuMDEuMjAyMCAxNzoyMSwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cgpbc25pcF0KCj4+PiAr
c3RhdGljIGludCB0ZWdyYTIxMF9pMnNfcHV0X2NvbnRyb2woc3RydWN0IHNuZF9rY29udHJvbCAq
a2NvbnRyb2wsCj4+PiArwqDCoMKgwqAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRy
b2wpCj4+IENoZWNrcGF0Y2ggc2hvdWxkIGNvbXBsYWluIGFib3V0IHRoZSB3cm9uZyBpbmRlbnRh
dGlvbiBoZXJlLgo+IAo+IEkgaGFkIHJ1biBjaGVja3BhdGNoIGJlZm9yZSBzZW5kaW5nIHRoZSBw
YXRjaCwgYmVsb3cgaXMgdGhlIHJlc3VsdC4KPiAtLS0tLQo+IFdBUk5JTkc6IGFkZGVkLCBtb3Zl
ZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KPiAj
NzA6Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAKPiB0b3RhbDogMCBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDExMDMgbGluZXMgY2hlY2tlZAo+IAo+IE5PVEU6IEZvciBzb21lIG9mIHRoZSByZXBvcnRl
ZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxlIHRvCj4gwqDCoMKgwqDCoCBtZWNoYW5p
Y2FsbHkgY29udmVydCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2luZyAtLWZpeCBvcgo+IC0tZml4
LWlucGxhY2UuCj4gLS0tLS0KClVzaW5nICdjaGVja3BhdGNoIC0tc3RyaWN0JzoKCkNIRUNLOiBB
bGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKIzI2OTM6IEZJTEU6IHNvdW5k
L3NvYy90ZWdyYS90ZWdyYTIxMF9pMnMuYzozNjI6CitzdGF0aWMgaW50IHRlZ3JhMjEwX2kyc19w
dXRfY29udHJvbChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKKyAgICAgICBzdHJ1Y3Qg
c25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbAoKW3NuaXBdCgo+Pj4gKwo+Pj4gK8KgwqDCoMKg
IH0gZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiUGxheWJhY2sgQXVkaW8gQml0
IEZvcm1hdCIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpMnMtPmF1ZGlvX2ZtdF9v
dmVycmlkZVtJMlNfUlhfUEFUSF0gPSB2YWx1ZTsKPj4+ICvCoMKgwqDCoCBlbHNlIGlmIChzdHJz
dHIoa2NvbnRyb2wtPmlkLm5hbWUsICJDYXB0dXJlIEF1ZGlvIEJpdCBGb3JtYXQiKSkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaTJzLT5hdWRpb19mbXRfb3ZlcnJpZGVbSTJTX1RYX1BB
VEhdID0gdmFsdWU7Cj4+PiArwqDCoMKgwqAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5u
YW1lLCAiQ2xpZW50IEJpdCBGb3JtYXQiKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aTJzLT5jbGllbnRfZm10X292ZXJyaWRlID0gdmFsdWU7Cj4+PiArwqDCoMKgwqAgZWxzZSBpZiAo
c3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiUGxheWJhY2sgQXVkaW8gQ2hhbm5lbHMiKSkKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaTJzLT5hdWRpb19jaF9vdmVycmlkZVtJMlNfUlhf
UEFUSF0gPSB2YWx1ZTsKPj4+ICvCoMKgwqDCoCBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlk
Lm5hbWUsICJDYXB0dXJlIEF1ZGlvIENoYW5uZWxzIikpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGkycy0+YXVkaW9fY2hfb3ZlcnJpZGVbSTJTX1RYX1BBVEhdID0gdmFsdWU7Cj4+PiAr
wqDCoMKgwqAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQ2xpZW50IENoYW5u
ZWxzIikpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkycy0+Y2xpZW50X2NoX292ZXJy
aWRlID0gdmFsdWU7Cj4+PiArwqDCoMKgwqAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5u
YW1lLCAiQ2FwdHVyZSBTdGVyZW8gVG8gTW9ubyIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpMnMtPnN0ZXJlb190b19tb25vW0kyU19UWF9QQVRIXSA9IHZhbHVlOwo+Pj4gK8KgwqDC
oMKgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkNhcHR1cmUgTW9ubyBUbyBT
dGVyZW8iKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaTJzLT5tb25vX3RvX3N0ZXJl
b1tJMlNfVFhfUEFUSF0gPSB2YWx1ZTsKPj4+ICvCoMKgwqDCoCBlbHNlIGlmIChzdHJzdHIoa2Nv
bnRyb2wtPmlkLm5hbWUsICJQbGF5YmFjayBTdGVyZW8gVG8gTW9ubyIpKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpMnMtPnN0ZXJlb190b19tb25vW0kyU19SWF9QQVRIXSA9IHZhbHVl
Owo+Pj4gK8KgwqDCoMKgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIlBsYXli
YWNrIE1vbm8gVG8gU3RlcmVvIikpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkycy0+
bW9ub190b19zdGVyZW9bSTJTX1JYX1BBVEhdID0gdmFsdWU7Cj4+PiArwqDCoMKgwqAgZWxzZSBp
ZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiUGxheWJhY2sgRklGTyBUaHJlc2hvbGQiKSkK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaTJzLT5yeF9maWZvX3RoID0gdmFsdWU7Cj4+
PiArwqDCoMKgwqAgZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQkNMSyBSYXRp
byIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpMnMtPmJjbGtfcmF0aW8gPSB2YWx1
ZTsKPj4gSSdtIHByZXR0eSBzdXJlIHRoYXQgY2hlY2twYXRjaCBzaG91bGQgY29tcGxhaW4gYWJv
dXQgdGhlIG1pc3NpbmcKPj4gYnJhY2tldHMsIHRoZXkgc2hvdWxkIG1ha2UgY29kZSdzIGluZGVu
dGF0aW9uIHVuaWZvcm0gYW5kIHRodXMgZWFzaWVyIHRvCj4+IHJlYWQuIFNhbWUgZm9yIGFsbCBv
dGhlciBvY2N1cnJlbmNlcyBpbiB0aGUgY29kZS4KPiAKPiBzYW1lIGFzIGFib3ZlCgpDSEVDSzog
YnJhY2VzIHt9IHNob3VsZCBiZSB1c2VkIG9uIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMy
Njk5OiBGSUxFOiBzb3VuZC9zb2MvdGVncmEvdGVncmEyMTBfaTJzLmM6MzY4OgorICAgICAgIGlm
IChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJMb29wYmFjayIpKSB7ClsuLi5dCisgICAgICAg
fSBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJTYW1wbGUgUmF0ZSIpKQpbLi4u
XQorICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkZTWU5DIFdpZHRo
IikpIHsKWy4uLl0KKyAgICAgICB9IGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwg
IlBsYXliYWNrIEF1ZGlvIEJpdCBGb3JtYXQiKSkKWy4uLl0KKyAgICAgICBlbHNlIGlmIChzdHJz
dHIoa2NvbnRyb2wtPmlkLm5hbWUsICJDYXB0dXJlIEF1ZGlvIEJpdCBGb3JtYXQiKSkKWy4uLl0K
KyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJDbGllbnQgQml0IEZv
cm1hdCIpKQpbLi4uXQorICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwg
IlBsYXliYWNrIEF1ZGlvIENoYW5uZWxzIikpClsuLi5dCisgICAgICAgZWxzZSBpZiAoc3Ryc3Ry
KGtjb250cm9sLT5pZC5uYW1lLCAiQ2FwdHVyZSBBdWRpbyBDaGFubmVscyIpKQpbLi4uXQorICAg
ICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkNsaWVudCBDaGFubmVscyIp
KQpbLi4uXQorICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29udHJvbC0+aWQubmFtZSwgIkNhcHR1
cmUgU3RlcmVvIFRvIE1vbm8iKSkKWy4uLl0KKyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRy
b2wtPmlkLm5hbWUsICJDYXB0dXJlIE1vbm8gVG8gU3RlcmVvIikpClsuLi5dCisgICAgICAgZWxz
ZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiUGxheWJhY2sgU3RlcmVvIFRvIE1vbm8i
KSkKWy4uLl0KKyAgICAgICBlbHNlIGlmIChzdHJzdHIoa2NvbnRyb2wtPmlkLm5hbWUsICJQbGF5
YmFjayBNb25vIFRvIFN0ZXJlbyIpKQpbLi4uXQorICAgICAgIGVsc2UgaWYgKHN0cnN0cihrY29u
dHJvbC0+aWQubmFtZSwgIlBsYXliYWNrIEZJRk8gVGhyZXNob2xkIikpClsuLi5dCisgICAgICAg
ZWxzZSBpZiAoc3Ryc3RyKGtjb250cm9sLT5pZC5uYW1lLCAiQkNMSyBSYXRpbyIpKQpbLi4uXQoK
W3NuaXBdCgo+Pj4gK8KgwqDCoMKgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7Cj4+IEVycm9yIGNo
ZWNraW5nPwo+IAo+IHJldHVybiB0eXBlIGZvciBhYm92ZSBpcyB2b2lkKCkKCk9rCgo+Pj4gK8Kg
wqDCoMKgIHJldHVybiAwOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW50IHRlZ3JhMjEwX2ky
c19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICt7Cj4+PiArwqDCoMKg
wqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+Pj4gK8KgwqDCoMKgIGlmICghcG1f
cnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+PiBU
aGlzIGJyZWFrcyBkZXZpY2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGlu
IHRoZSBhY3RpdmUKPj4gc3RhdGUuIFRoaXMgY29kZSBzaG91bGQgYmUgcmVtb3ZlZC4gQXQgbW9z
dCB5b3UgY291bGQgd2FybiBhYm91dCB0aGUKPj4gdW54cGVjdGVkIFJQTSBzdGF0ZSBoZXJlLCBi
dXQgaXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4KPiAKPiBJIGd1ZXNzIHRoaXMgd2FzIGFkZGVk
IGZvciBzYWZldHkgYW5kIGV4cGxpY2l0IHN1c3BlbmQga2VlcHMgY2xvY2sKPiBkaXNhYmxlZC4K
PiBOb3Qgc3VyZSBpZiByZWYtY291bnRpbmcgb2YgdGhlIGRldmljZSBtYXR0ZXJzIHdoZW4gcnVu
dGltZSBQTSBpcwo+IGRpc2FibGVkIGFuZCBkZXZpY2UgaXMgcmVtb3ZlZC4KPiBJIHNlZSBmZXcg
ZHJpdmVycyB1c2luZyB0aGlzIHdheS4KCkl0IHNob3VsZCBtYXR0ZXIgKGlmIEknbSBub3QgbWlz
c2luZyBzb21ldGhpbmcpIGJlY2F1c2UgUlBNIHNob3VsZCBiZSBpbgphIHdyZWNrZWQgc3RhdGUg
b25jZSB5b3UnbGwgdHJ5IHRvIHJlLWxvYWQgdGhlIGRyaXZlcidzIG1vZHVsZS4gTGlrZWx5CnRo
YXQgdGhvc2UgZmV3IG90aGVyIGRyaXZlcnMgYXJlIHdyb25nLgoKW3NuaXBdCgo+IAo+Pj4gKyAg
ICAgaW50IHJ4X2ZpZm9fdGg7Cj4+IENvdWxkIHJ4X2ZpZm9fdGggYmUgbmVnYXRpdmU/Cj4gCj4g
cnhfZmlmb190aCBpdHNlbGYgZG9lcyBub3QgdGFrZSBuZWdhdGl2ZSB2YWx1ZXMsIGV4cGxpY2l0
IHR5cGVjYXN0aW5nPiBpcyBhdm9pZGVkIGluICJpZiIgY29uZGl0aW9uIGJ5IGRlY2xhcmluZyB0
aGlzIGFzICJpbnQiCkV4cGxpY2l0IHR5cGVjYXN0aW5nIGlzbid0IG5lZWRlZCBmb3IgaW50ZWdl
cnMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
