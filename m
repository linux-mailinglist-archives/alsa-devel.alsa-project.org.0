Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05DB2A7B
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2019 10:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23531673;
	Sat, 14 Sep 2019 10:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23531673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568450166;
	bh=UDFfX7Bw8c1iA4Vv75OSVph2OBfjycoo7k39VFLCk5E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stsRMGAS7NPcr9O9F8bMJGntNI6zzwjZAkAajkcn+VLH5NeKq8NvQ1qRgboM0/cvV
	 bWgwzgTppCChfhERMO1+pLohbzYH2rVE/u+pEYQpvCNa7B6kxLqGuElPMpoBk+33be
	 vI/x4YxQvhAY0ydmIMUcEJ+SY5Nj78Ay32YeJztA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F27D6F80368;
	Sat, 14 Sep 2019 10:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 877DBF80368; Sat, 14 Sep 2019 10:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFAFEF80149
 for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2019 10:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFAFEF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SbUR5RPO"
Received: by mail-wm1-x342.google.com with SMTP id y135so3444602wmc.1
 for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2019 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XR6myC8ho3Zej/eH269mFAfC2Y8Rr1vm2wEQ0SW3QIM=;
 b=SbUR5RPOuUNyQeNzfYfeB6OeQLcLvmimHMbQ0lfCgI9OkPbhxzuW48hZRnG0VMKekZ
 NoZASYUY0uodnwMYgczuvv8Tae/KJ5HdAtwKSk/FNJTCgbaMZ0qAF+pC8cQR+mO/yImw
 QSIfR22Q7QzuliXF3Ek2+SSJRhF1Y2R8U3Ff0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XR6myC8ho3Zej/eH269mFAfC2Y8Rr1vm2wEQ0SW3QIM=;
 b=Xvgo23Qxj5JRThEnj/9fUf/rXNgCngYmMeCDPaeRUJJTjC5tjscMgJDJ0iRFdl+jth
 9tusY98beQSBZUAW0tyisZNwglBR/XixLa+nDsgVcqXYozjUwqGwDdjEHaDD6h59vMbE
 VHSGCU6zAqcem/FenNmGrFn/T+A+VveaT6xgtDsFNrWIeEaEUsAf5lc3AD4x+4V4CeXh
 JowW4BmsoMTl/JqWK+dVGA6fDW93dU+Avn8tcjWes7VDOAOAluPwqY68HQ7ImOsqQV8t
 Fo28aNXoCejUMBPBdEJQug+nySaoKeRJw3DU1J4F/08hZ5pl7hW3SGIcO8WOROnmuJiR
 tQ9A==
X-Gm-Message-State: APjAAAWWJZoboGD3I6dLtZtMtSMlp8HAKaEA7wAkc2bDd5By6RZtemPc
 /6vnXkvl6U9u60Dfq+zFGt2QUwQImYKGTPmhFSIJPQ==
X-Google-Smtp-Source: APXvYqyFGOghYBtS/OOI3emUQG5Xe6OdZI24dVnaEB1q2J6IBDsVyIBIPl1/zYZxsBLy5kLeU4e51R7yO0A8vLtaNrI=
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr5975406wmg.30.1568450055796; 
 Sat, 14 Sep 2019 01:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190912022740.161798-1-yuhsuan@chromium.org>
 <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
 <CAGvk5PpCOG0Jii_vksrewZ_Dfmc+OVM9C6pkCYLY=n+ac-wVaA@mail.gmail.com>
 <bd442561-8fd9-0814-66c6-e08a21bb1a97@linux.intel.com>
In-Reply-To: <bd442561-8fd9-0814-66c6-e08a21bb1a97@linux.intel.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 14 Sep 2019 16:34:04 +0800
Message-ID: <CAGvk5Ppg-dnfO-hHWps+MeWEYhqZmehEUXNn3MvL5VJwKmM5JQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927:
 Add dmic format constraint
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

UGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNv
bT4g5pa8CjIwMTnlubQ55pyIMTTml6Ug6YCx5YWtIOS4iuWNiDE6Mjjlr6vpgZPvvJoKPgo+IHBs
ZWFzZSBkb24ndCB0b3AtcG9zdCBvbiBwdWJsaWMgbWFpbGluZyBsaXN0cywgdGhhbmtzLgo+Cj4g
T24gOS8xMy8xOSA5OjQ1IEFNLCBZdS1Ic3VhbiBIc3Ugd3JvdGU6Cj4gPiBUaGFua3MgZm9yIHRo
ZSByZXZpZXchIElmIEknbSBub3QgbWlzdGFrZW4sIHRoZSBtaWNyb3Bob25lIGlzIGF0dGFjaGVk
Cj4gPiB0byBleHRlcm5hbCBjb2RlYyhydDU1MTQpIGluc3RlYWQgb2YgUENIIG9uIEthYnlsYWtl
IHBsYXRmb3JtLiBTbyB0aGVyZQo+ID4gc2hvdWxkIGJlIGEgVERNIGJldHdlZW4gRE1JQ3MgYW5k
IFBDSC4gV2UgY2FuIHNlZSBpbiB0aGUKPiA+IGthYnlsYWtlX3NzcDBfaHdfcGFyYW1zIGZ1bmN0
aW9uLCB0aGVyZSBhcmUgc29tZSBvcGVyYXRpb25zIGFib3V0Cj4gPiBzZXR0aW5nIHRkbSBzbG90
X3dpZHRoIHRvIDE2IGJpdHMuIFRoZXJlZm9yZSwgSSB0aGluayBpdCBvbmx5IHN1cHBvcnRzCj4g
PiBTMTZfTEUgZm9ybWF0IGZvciBETUlDcy4gSXMgaXQgY29ycmVjdD8KPgo+IEFoIHllcywgb2su
IHdlIGhhdmUgb3RoZXIgbWFjaGluZSBkcml2ZXJzIHdoZXJlIGRtaWMgcmVmZXJzIHRvIHRoZSBQ
Q0gKPiBhdHRhY2hlZCBjYXNlLCB0aGFua3MgZm9yIHRoZSBwcmVjaXNpb24uCj4KPiBJIGFtIHN0
aWxsIG5vdCBjbGVhciBvbiB0aGUgcHJvYmxlbSwgeW91IGFyZSBhZGRpbmcgdGhpcyBjb25zdHJh
aW50IHRvIGEKPiBmcm9udC1lbmQsIHNvIGluIHRoZW9yeSB0aGUgY29waWVyIGVsZW1lbnQgaW4g
dGhlIGZpcm13YXJlIHNob3VsZCB0YWtlCj4gY2FyZSBvZiBjb252ZXJ0aW5nIGZyb20gMTYtYml0
cyByZWNvcmRlZCBvbiB0aGUgVERNIGxpbmsgdG8gdGhlIDI0IGJpdHMKPiB1c2VkIGJ5IHRoZSBh
cHBsaWNhdGlvbi4gSXMgdGhpcyBub3QgdGhlIGNhc2U/IGlzIHRoaXMgcGF0Y2ggYmFzZWQgb24g
YW4KPiBhY3R1YWwgZXJyb3IgYW5kIGlmIHllcyBjYW4geW91IHNoYXJlIG1vcmUgaW5mb3JtYXRp
b24gdG8gaGVscCBjaGVjawo+IHdoZXJlIHRoZSBwcm9ibGVtIGhhcHBlbnMsIHRvcG9sb2d5IG1h
eWJlPwoKSWYgd2UgdXNlIDI0IGJpdHMgZm9ybWF0IG9uIHRoYXQgZGV2aWNlIHRvIHJlY29yZCwg
dGhlIGF1ZGlvIHNhbXBsZXMKaXQgcmV0dXJucyBhcmUgc3RpbGwgaW4gMTYgYml0cy4gU28gdGhl
IHJhdGUgd2UgbWVhc3VyZWQgaXMgb25seSB0aGUKaGFsZiBvZiB0aGUgZXhwZWN0ZWQgcmF0ZS4g
SXQncyBhIHJlYWwgcHJvYmxlbS4gQXBhcnQgZnJvbSB0aGUgcmF0ZSwKdGhlIGF1ZGlvIHNhbXBs
ZXMgYXJlIGFsc28gd3JvbmcgaWYgd2Ugc3RpbGwgZGVjb2RlIHRoZW0gd2l0aCAyNCBiaXRzCmZv
cm1hdC4gVGhlcmVmb3JlLCB0aGUgYmV0dGVyIGZpeCBpcyB0byBhZGQgYSBjb25zdHJhaW50IHRv
IHJlbW92ZQoyNGJpdHMgc3VwcG9ydC4KCkJ5IHRoZSB3YXksIHdlIGZvdW5kIHRoaXMgaXNzdWUg
YnkgIkFMU0EgY29uZm9ybWFuY2UgdGVzdCIsIHdoaWNoIGlzIGEKbmV3IHRvb2wgdG8gdmVyaWZ5
IGF1ZGlvIGRyaXZlcnMuCihodHRwczovL2Nocm9taXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21p
dW1vcy9wbGF0Zm9ybS9hdWRpb3Rlc3QvKy9tYXN0ZXIvYWxzYV9jb25mb3JtYW5jZV90ZXN0Lm1k
KQoKPgo+ID4KPiA+IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBs
aW51eC5pbnRlbC5jb20KPiA+IDxtYWlsdG86cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tPj4g5pa8IDIwMTnlubQ55pyIMTLml6Ug6YCx5ZubIOS4iwo+ID4g5Y2IOTowMuWvq+mB
k++8mgo+ID4KPiA+ICAgICBPbiA5LzExLzE5IDk6MjcgUE0sIFl1LUhzdWFuIEhzdSB3cm90ZToK
PiA+ICAgICAgPiAyNCBiaXRzIHJlY29yZGluZyBmcm9tIERNSUMgaXMgbm90IHN1cHBvcnRlZCBm
b3IgS0JMIHBsYXRmb3JtIGJlY2F1c2UKPiA+ICAgICAgPiB0aGUgVERNIHNsb3QgYmV0d2VlbiBQ
Q0ggYW5kIGNvZGVjIGlzIDE2IGJpdHMgb25seS4gV2Ugc2hvdWxkIGFkZCBhCj4gPiAgICAgID4g
Y29uc3RyYWludCB0byByZW1vdmUgdGhhdCB1bnN1cHBvcnRlZCBmb3JtYXQuCj4gPgo+ID4gICAg
IEh1bW0sIHdoZW4geW91IHVzZSBETUlDcyB0aGV5IGFyZSBkaXJlY3RseSBjb25uZWN0ZWQgdG8g
dGhlIFBDSCB3aXRoIGEKPiA+ICAgICBzdGFuZGFyZCAxLWJpdCBQRE0uIFRoZXJlIGlzIG5vIG5v
dGlvbiBvZiBURE0gb3Igc2xvdC4KPiA+Cj4gPiAgICAgSXQgY291bGQgdmVyeSB3ZWxsIGJlIHRo
YXQgdGhlIGZpcm13YXJlL3RvcG9sb2d5IG9ubHkgc3VwcG9ydCAxNiBiaXQgKEkKPiA+ICAgICB2
YWd1ZWx5IHJlY2FsbCBhbm90aGVyIGNhc2Ugd2hlcmUgMjQgYml0cyB3YXMgYWRkZWQpLCBidXQg
dGhlCj4gPiAgICAgZGVzY3JpcHRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxkIG5lZWQg
dG8gYmUgbW9kaWZpZWQgdG8gbWFrZSB0aGUKPiA+ICAgICByZWFzb24gZm9yIHRoaXMgY2hhbmdl
IGNsZWFyZXIuCj4gPgo+ID4gICAgICA+Cj4gPiAgICAgID4gU2lnbmVkLW9mZi1ieTogWXUtSHN1
YW4gSHN1IDx5dWhzdWFuQGNocm9taXVtLm9yZwo+ID4gICAgIDxtYWlsdG86eXVoc3VhbkBjaHJv
bWl1bS5vcmc+Pgo+ID4gICAgICA+IC0tLQo+ID4gICAgICA+ICAgc291bmQvc29jL2ludGVsL2Jv
YXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jIHwgMyArKysKPiA+ICAgICAgPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ICAgICAgPgo+ID4gICAgICA+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2NjNfcnQ1NTE0X21heDk4OTI3
LmMKPiA+ICAgICBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4
OTg5MjcuYwo+ID4gICAgICA+IGluZGV4IDc0ZGRhODc4NGYxYTAxLi42N2IyNzZhNjVhOGQyZCAx
MDA2NDQKPiA+ICAgICAgPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2NjNf
cnQ1NTE0X21heDk4OTI3LmMKPiA+ICAgICAgPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYm9hcmRz
L2tibF9ydDU2NjNfcnQ1NTE0X21heDk4OTI3LmMKPiA+ICAgICAgPiBAQCAtNDAwLDYgKzQwMCw5
IEBAIHN0YXRpYyBpbnQga2FieWxha2VfZG1pY19zdGFydHVwKHN0cnVjdAo+ID4gICAgIHNuZF9w
Y21fc3Vic3RyZWFtICpzdWJzdHJlYW0pCj4gPiAgICAgID4gICAgICAgc25kX3BjbV9od19jb25z
dHJhaW50X2xpc3QocnVudGltZSwgMCwKPiA+ICAgICBTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5F
TFMsCj4gPiAgICAgID4gICAgICAgICAgICAgICAgICAgICAgIGRtaWNfY29uc3RyYWludHMpOwo+
ID4gICAgICA+Cj4gPiAgICAgID4gKyAgICAgcnVudGltZS0+aHcuZm9ybWF0cyA9IFNORFJWX1BD
TV9GTVRCSVRfUzE2X0xFOwo+ID4gICAgICA+ICsgICAgIHNuZF9wY21faHdfY29uc3RyYWludF9t
c2JpdHMocnVudGltZSwgMCwgMTYsIDE2KTsKPiA+ICAgICAgPiArCj4gPiAgICAgID4gICAgICAg
cmV0dXJuIHNuZF9wY21faHdfY29uc3RyYWludF9saXN0KHN1YnN0cmVhbS0+cnVudGltZSwgMCwK
PiA+ICAgICAgPiAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0hXX1BBUkFNX1JBVEUs
ICZjb25zdHJhaW50c19yYXRlcyk7Cj4gPiAgICAgID4gICB9Cj4gPiAgICAgID4KPiA+Cj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
