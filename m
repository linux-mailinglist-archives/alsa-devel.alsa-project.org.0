Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3504E9EC3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 16:21:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E084232E;
	Wed, 30 Oct 2019 16:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E084232E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572448872;
	bh=dN2pstG3FVCrr+55xB+LB7iEDBdjT3ej3RSZBA6hFho=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YxMQXRjZC+ia66aOFdaM8V/IQvFqN01G0YD9yj2LLNOSlDDMMmF9UzEMxzFRg4ZA7
	 wiFrq4ud0XH98FTcaHhehX/nr+xFOknTR3JQYeVPXC5pzZ2mwpSxVfH6cWB1/eSIT8
	 uBj3obFw39nH8ShfwC1cVeTNt+ag0lfY36DnwzQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD09F80361;
	Wed, 30 Oct 2019 16:19:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A32F80361; Wed, 30 Oct 2019 16:18:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8AD1F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 16:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8AD1F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 08:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; d="scan'208";a="374918242"
Received: from kmbarley-mobl.amr.corp.intel.com (HELO [10.252.135.193])
 ([10.252.135.193])
 by orsmga005.jf.intel.com with ESMTP; 30 Oct 2019 08:18:35 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-3-srinivas.kandagatla@linaro.org>
 <20191021044405.GB2654@vkoul-mobl>
 <17cb6d3f-2317-9667-8642-566a8a88bd4c@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e9b63796-4af2-452c-53de-aab2e7c85866@linux.intel.com>
Date: Wed, 30 Oct 2019 10:18:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <17cb6d3f-2317-9667-8642-566a8a88bd4c@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/2] soundwire: qcom: add support for
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

CgpPbiAxMC8zMC8xOSA5OjU2IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IAo+IAo+
IE9uIDIxLzEwLzIwMTkgMDU6NDQsIFZpbm9kIEtvdWwgd3JvdGU6Cj4+IE9uIDExLTEwLTE5LCAx
Njo0NCwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPj4KPj4+ICtzdGF0aWMgaXJxcmV0dXJu
X3QgcWNvbV9zd3JtX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPj4+ICt7Cj4+
PiArwqDCoMKgIHN0cnVjdCBxY29tX3N3cm1fY3RybCAqY3RybCA9IGRldl9pZDsKPj4+ICvCoMKg
wqAgdTMyIHN0cywgdmFsdWU7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+PiAr
Cj4+PiArwqDCoMKgIGN0cmwtPnJlZ19yZWFkKGN0cmwsIFNXUk1fSU5URVJSVVBUX1NUQVRVUywg
JnN0cyk7Cj4+PiArCj4+PiArwqDCoMKgIGlmIChzdHMgJiBTV1JNX0lOVEVSUlVQVF9TVEFUVVNf
Q01EX0VSUk9SKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY3RybC0+cmVnX3JlYWQoY3RybCwgU1dS
TV9DTURfRklGT19TVEFUVVMsICZ2YWx1ZSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vycl9y
YXRlbGltaXRlZChjdHJsLT5kZXYsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIkNNRCBlcnJvciwgZmlmbyBzdGF0dXMgMHgleFxuIiwKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVlKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBjdHJsLT5yZWdfd3JpdGUoY3RybCwgU1dSTV9DTURfRklGT19DTUQsIDB4MSk7Cj4+PiArwqDC
oMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgaWYgKChzdHMgJiBTV1JNX0lOVEVSUlVQVF9TVEFUVVNf
TkVXX1NMQVZFX0FUVEFDSEVEKSB8fAo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cyAmIFNXUk1fSU5U
RVJSVVBUX1NUQVRVU19DSEFOR0VfRU5VTV9TTEFWRV9TVEFUVVMpCj4+PiArwqDCoMKgwqDCoMKg
wqAgc2NoZWR1bGVfd29yaygmY3RybC0+c2xhdmVfd29yayk7Cj4+Cj4+IHdlIGFyZSBpbiBpcnEg
dGhyZWFkLCBzbyB3aHkgbm90IGRvIHRoZSB3b3JrIGhlcmUgcmF0aGVyIHRoYW4gc2NoZWR1bGUK
Pj4gaXQ/Cj4gCj4gVGhlIHJlYXNvbiBpcyB0aGF0LCBzZHdfaGFuZGxlX3NsYXZlX3N0YXR1cygp
IHdlIHdpbGwgcmVhZCBkZXZpY2UgaWQgCj4gcmVnaXN0ZXJzLCB3aGljaCBhcmUgZmlmbyBiYXNl
ZCBpbiB0aGlzIGNvbnRyb2xsZXIgYW5kIHRyaWdnZXJzIGFuIAo+IGludGVycnVwdCBmb3IgZWFj
aCByZWFkLgo+IFNvIGFsbCB0aGUgc3VjaCByZWFkcyB3aWxsIHRpbWVvdXQgd2FpdGluZyBmb3Ig
aW50ZXJydXB0IGlmIHdlIGRvIG5vdCBkbyAKPiBpdCBpbiBhIHNlcGFyYXRlIHRocmVhZC4KClll
cywgaXQncyBzaW1pbGFyIGZvciBJbnRlbC4gd2UgZG9uJ3QgcmVhZCBkZXZpY2UgSUQgaW4gdGhl
IGhhbmRsZXIgb3IgCnJlYWRzIHdvdWxkIHRpbWUgb3V0LiBBbmQgaW4gdGhlIGxhdGVzdCBwYXRj
aGVzIHdlIGFsc28gdXNlIGEgd29yayBxdWV1ZSAKZm9yIHRoZSBzbGF2ZSBzdGF0dXMgaGFuZGxp
bmcgKGR1ZSB0byBNU0kgaGFuZGxpbmcgaXNzdWVzKS4KRXZlbiBpZiB0aGlzIHRpbWVvdXQgcHJv
YmxlbSBkaWQgbm90IGV4aXN0cywgdXBkYXRlcyB0byB0aGUgc2xhdmUgc3RhdHVzIAp3aWxsIHR5
cGljYWxseSByZXN1bHQgaW4gYWRkaXRpb25hbCByZWFkL3dyaXRlcywgd2hpY2ggYXJlIGdvaW5n
IHRvIGJlIAp0aHJvdHRsZWQgYnkgdGhlIGNvbW1hbmQgYmFuZHdpZHRoIChmcmFtZSByYXRlKSwg
c28gdGhpcyBzdGF0dXMgdXBkYXRlIApzaG91bGQgcmVhbGx5IG5vdCBiZSBkb25lIGluIGEgaGFu
ZGxlci4gVGhpcyBoYXMgdG8gYmUgZG9uZSBpbiBhIHRocmVhZCAKb3Igd29yayBxdWV1ZS4KCj4g
Cj4gCj4gCj4+Cj4+PiArc3RhdGljIGludCBxY29tX3N3cm1fY29tcHV0ZV9wYXJhbXMoc3RydWN0
IHNkd19idXMgKmJ1cykKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBxY29tX3N3cm1fY3RybCAq
Y3RybCA9IHRvX3Fjb21fc2R3KGJ1cyk7Cj4+PiArwqDCoMKgIHN0cnVjdCBzZHdfbWFzdGVyX3J1
bnRpbWUgKm1fcnQ7Cj4+PiArwqDCoMKgIHN0cnVjdCBzZHdfc2xhdmVfcnVudGltZSAqc19ydDsK
Pj4+ICvCoMKgwqAgc3RydWN0IHNkd19wb3J0X3J1bnRpbWUgKnBfcnQ7Cj4+PiArwqDCoMKgIHN0
cnVjdCBxY29tX3N3cm1fcG9ydF9jb25maWcgKnBjZmc7Cj4+PiArwqDCoMKgIGludCBpID0gMDsK
Pj4+ICsKPj4+ICvCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShtX3J0LCAmYnVzLT5tX3J0X2xp
c3QsIGJ1c19ub2RlKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShw
X3J0LCAmbV9ydC0+cG9ydF9saXN0LCBwb3J0X25vZGUpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBjZmcgPSAmY3RybC0+cGNvbmZpZ1twX3J0LT5udW0gLSAxXTsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBfcnQtPnRyYW5zcG9ydF9wYXJhbXMucG9ydF9udW0gPSBwX3J0LT5u
dW07Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwX3J0LT50cmFuc3BvcnRfcGFyYW1zLnNh
bXBsZV9pbnRlcnZhbCA9IHBjZmctPnNpICsgMTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBfcnQtPnRyYW5zcG9ydF9wYXJhbXMub2Zmc2V0MSA9IHBjZmctPm9mZjE7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwX3J0LT50cmFuc3BvcnRfcGFyYW1zLm9mZnNldDIgPSBwY2ZnLT5v
ZmYyOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBsaXN0
X2Zvcl9lYWNoX2VudHJ5KHNfcnQsICZtX3J0LT5zbGF2ZV9ydF9saXN0LCBtX3J0X25vZGUpIHsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkocF9ydCwgJnNf
cnQtPnBvcnRfbGlzdCwgcG9ydF9ub2RlKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBjZmcgPSAmY3RybC0+cGNvbmZpZ1tpXTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcF9ydC0+dHJhbnNwb3J0X3BhcmFtcy5wb3J0X251bSA9IHBfcnQtPm51bTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcF9ydC0+dHJhbnNwb3J0X3BhcmFt
cy5zYW1wbGVfaW50ZXJ2YWwgPQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBjZmctPnNpICsgMTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cF9ydC0+dHJhbnNwb3J0X3BhcmFtcy5vZmZzZXQxID0gcGNmZy0+b2ZmMTsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcF9ydC0+dHJhbnNwb3J0X3BhcmFtcy5vZmZzZXQyID0g
cGNmZy0+b2ZmMjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSsrOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiBDYW4geW91IGV4cGxhaW4gdGhpcyBvbmUs
IGFtIG5vdCBzdXJlIEkgdW5kZXJzdG9vZCB0aGlzLiBUaGlzIGZuIGlzCj4+IHN1cHBvc2VkIHRv
IGNvbXB1dGUgYW5kIGZpbGwgdXAgdGhlIHBhcmFtcywgYWxsIEkgY2FuIHNlZSBpcyBmaWxsaW5n
IHVwIQo+Pgo+IEJhbmR3aWR0aCBwYXJhbWV0ZXJzIGFyZSBjdXJyZW50bHkgY29taW5nIGZyb20g
Ym9hcmQgc3BlY2lmaWMgRGV2aWNlIAo+IFRyZWUsIHdoaWNoIGFyZSBwcm9ncmFtbWVkIGhlcmUu
CgonY29tcHV0ZScgZG9lcyBub3QgbWVhbiAnZHluYW1pYyBvbi1kZW1hbmQgYmFuZHdpZHRoIGFs
bG9jYXRpb24nLCBpdCdzIApwZXJmZWN0bHkgbGVnYWwgdG8gdXNlIGZpeGVkIHRhYmxlcyBhcyBk
b25lIGhlcmUuCgo+IAo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3BzIHFj
b21fc3dybV9wZG1fZGFpX29wcyA9IHsKPj4+ICvCoMKgwqAgLmh3X3BhcmFtcyA9IHFjb21fc3dy
bV9od19wYXJhbXMsCj4+PiArwqDCoMKgIC5wcmVwYXJlID0gcWNvbV9zd3JtX3ByZXBhcmUsCj4+
PiArwqDCoMKgIC5od19mcmVlID0gcWNvbV9zd3JtX2h3X2ZyZWUsCj4+PiArwqDCoMKgIC5zdGFy
dHVwID0gcWNvbV9zd3JtX3N0YXJ0dXAsCj4+PiArwqDCoMKgIC5zaHV0ZG93biA9IHFjb21fc3dy
bV9zaHV0ZG93biwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuc2V0X3Nkd19zdHJlYW0gPSBxY29tX3N3
cm1fc2V0X3Nkd19zdHJlYW0sCj4+Cj4+IHdoeSBkb2VzIGluZGVudCBsb29rIG9mZiB0byBtZSEK
Pj4KPiBZZXAsIEZpeGVkIGluIG5leHQgdmVyc2lvbi4KPiAKPiAtLXNyaW5pCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxp
bmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
