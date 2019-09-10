Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E22AEC0B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 15:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1121675;
	Tue, 10 Sep 2019 15:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1121675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568123345;
	bh=qTmD5OQpSKA3lodA1gDG8iLhnP3l70F5O5oZ2PzUsLY=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIyRXla/jhkQJ0F8c98PjZCikxxBBZuZwEeHu1neU/o5Oj8aVfdhttmWCmhgESjRC
	 N0oDn9oh1ual4JgK2Fkph3t+cBWq8W5f8qpM2KYprbFpPAt1vO9Op9CeUfEJGdy1Yf
	 IX/iaTBO5G9e/zui6Kakyczk7hm/xZY6lzaKfE7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B546F80368;
	Tue, 10 Sep 2019 15:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4152FF80368; Tue, 10 Sep 2019 15:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA59DF800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 15:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA59DF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aCBFXZAk"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADlAGb068851;
 Tue, 10 Sep 2019 08:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568123230;
 bh=KCsuiucHi88CCTXSYu2IpIzdJ7GYk/usdfSwVkf0fN0=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=aCBFXZAkngxsPLJ/RWW99Vqvi5DqIb/9uS/cdfD7nGL+ng9fLYqb/l80gcbyjzpAg
 npotnHguI98tJFqnWongfobRdhcla/VvL9Kq75+dWDSHcYcVFoVjWY2+yneHYw/p8q
 ln/foJwhUp+NiNKabjS9tFqNrF7LOdI5vbxOawaY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADlAVO104167;
 Tue, 10 Sep 2019 08:47:10 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:47:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:47:10 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADlAPC079028;
 Tue, 10 Sep 2019 08:47:10 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <shifu0704@thundersoft.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>
References: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
 <76759c2c-3f5d-5cf6-fc2b-feb1dc8c0e6a@ti.com>
Message-ID: <15483b8f-ffda-eea3-9461-894f43a39a20@ti.com>
Date: Tue, 10 Sep 2019 08:47:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <76759c2c-3f5d-5cf6-fc2b-feb1dc8c0e6a@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: navada@ti.com
Subject: Re: [alsa-devel] [PATCH] tas2770: add tas2770 smart PA dt bindings
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

U2hpCgpPbmUgb3RoZXIgdGhpbmcKCk9uIDkvMTAvMTkgODoyMSBBTSwgRGFuIE11cnBoeSB3cm90
ZToKPiBTaGkKPgo+IE9uIDkvNi8xOSAyOjA2IEFNLCBzaGlmdTA3MDRAdGh1bmRlcnNvZnQuY29t
IHdyb3RlOgo+PiBGcm9tOiBGcmFuayBTaGkgPHNoaWZ1MDcwNEB0aHVuZGVyc29mdC5jb20+Cj4K
PiBTdWJqZWN0IHNob3VsZCBiZQo+Cj4gZHQtYmluZGluZ3M6IEFTb0M6IEFkZCB0YXMyNzcwIHNt
YXJ0IFBBIGR0IGJpbmRpbmdzCj4KPiBBbHNvIFBsZWFzZSBhZGQgUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz4gZm9yIHJldmlldwo+Cj4+IGFkZCB0YXMyNzcwIHNtYXJ0IFBBIGR0IGJp
bmRpbmdzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFNoaSA8c2hpZnUwNzA0QHRodW5kZXJz
b2Z0LmNvbT4KPj4gLS0tCj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
YXMyNzcwLnR4dCB8IDM4IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90YXMyNzcwLnR4dAo+Pgo+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RhczI3NzAudHh0IAo+PiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90YXMyNzcwLnR4dApUaGlzIGJpbmRp
bmcgYmVsb25ncyBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQKPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMC4uZjcwYjMxMAo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90YXMyNzcw
LnR4dAo+PiBAQCAtMCwwICsxLDM4IEBACj4+ICtUZXhhcyBJbnN0cnVtZW50cyBUQVMyNzcwIFNt
YXJ0IFBBCj4+ICsKPj4gK1RoZSBUQVMyNzcwIGlzIGEgbW9ubywgZGlnaXRhbCBpbnB1dCBDbGFz
cy1EIGF1ZGlvIGFtcGxpZmllciAKPj4gb3B0aW1pemVkIGZvcgo+PiArZWZmaWNpZW50bHkgZHJp
dmluZyBoaWdoIHBlYWsgcG93ZXIgaW50byBzbWFsbCBsb3Vkc3BlYWtlcnMuCj4+ICtJbnRlZ3Jh
dGVkIHNwZWFrZXIgdm9sdGFnZSBhbmQgY3VycmVudCBzZW5zZSBwcm92aWRlcyBmb3IKPj4gK3Jl
YWwgdGltZSBtb25pdG9yaW5nIG9mIGxvdWRzcGVha2VyIGJlaGF2aW9yLgo+PiArCj4+ICtSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+PiArCj4+ICsgLSBjb21wYXRpYmxlOsKgwqDCoMKgwqDCoCAtIFNo
b3VsZCBjb250YWluICJ0aSx0YXMyNzcwIi4KPj4gKyAtIHJlZzrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gVGhlIGkyYyBhZGRyZXNzLiBTaG91bGQgY29udGFpbiA8MHg0Yz4sIAo+PiA8
MHg0ZD4sPDB4NGU+LCBvciA8MHg0Zj4uCj4gcy9zaG91bGQvbWF5Cj4+ICsgLSAjYWRkcmVzcy1j
ZWxsc8KgIC0gU2hvdWxkIGJlIDwxPi4KPj4gKyAtICNzaXplLWNlbGxzwqDCoMKgwqAgLSBTaG91
bGQgYmUgPDA+Lgo+PiArIC0gdGksYXNpLWZvcm1hdDrCoCAtIFNldHMgVERNIFJYIGNhcHR1cmUg
ZWRnZS4gMC0+UmlzaW5nOyAxLT5GYWxsaW5nLgo+PiArIC0gdGksbGVmdC1zbG90OsKgwqAgLSBT
ZXRzIFRETSBSWCBsZWZ0IHRpbWUgc2xvdHMuCj4+ICsgLSB0aSxyaWdodC1zbG90OsKgIC0gU2V0
cyBURE0gUlggcmlnaHQgdGltZSBzbG90cy4KPj4gKyAtIHRpLGltb24tc2xvdC1ubzotIFRETSBU
WCBjdXJyZW50IHNlbnNlIHRpbWUgc2xvdC4KPj4gKyAtIHRpLHZtb24tc2xvdC1ubzotIFRETSBU
WCB2b2x0YWdlIHNlbnNlIHRpbWUgc2xvdC4KPj4gKwo+PiArT3B0aW9uYWwgcHJvcGVydGllczoK
Pj4gKwo+PiArIC0gcmVzZXQtZ3BpbzrCoMKgwqAgUmVzZXQgR1BJTyBudW1iZXIgb2YgbGVmdCBk
ZXZpY2UuCj4+ICsgLSBpcnEtZ3BpbzrCoCBJUlEgR1BJTyBudW1iZXIgb2YgbGVmdCBkZXZpY2Uu
Cj4KPiBZb3UgbWlnaHQgd2FudCB0byB1c2UKPgo+IC0gaW50ZXJydXB0LXBhcmVudDogdGhlIHBo
YW5kbGUgdG8gdGhlIGludGVycnVwdCBjb250cm9sbGVyIHdoaWNoIAo+IHByb3ZpZGVzCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGhlIGludGVycnVwdC4KPiAtIGlu
dGVycnVwdHM6IGludGVycnVwdCBzcGVjaWZpY2F0aW9uIGZvciBkYXRhLXJlYWR5Lgo+Cj4gSW5z
dGVhZCBvZiBpcnEtZ3Bpbwo+Cj4+ICsKPj4gK0V4YW1wbGVzOgo+PiArCj4+ICvCoMKgwqAgdGFz
Mjc3MEA0YyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJ0aSx0YXMyNzcwIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHg0Yz47Cj4KPiBNaXNzaW5nCj4KPiAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPgo+ICNzaXplLWNl
bGxzID0gPDA+Owo+Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bp
byA9IDwmZ3BpbzE1IDEgR1BJT19BQ1RJVkVfTE9XPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpcnEtZ3BpbyA9IDwmZ3BpbzE2IDEgR1BJT19BQ1RJVkVfTE9XPjsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aSxhc2ktZm9ybWF0ID0gPDA+Owo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpLGxlZnQtc2xvdCA9IDwwPjsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aSxyaWdodC1zbG90ID0gPDE+Owo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpLGltb24tc2xvdC1ubyA9IDwwPjsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aSx2bW9uLXNsb3Qtbm8gPSA8Mj47Cj4+ICvCoMKg
wqDCoMKgwqDCoCB9Owo+PiArCj4KPiBTdWdnZXN0aW9uIHRvIHByb3ZpZGUgdGhlIFVSTCB0byB0
aGUgZGF0YSBzaGVldC4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
