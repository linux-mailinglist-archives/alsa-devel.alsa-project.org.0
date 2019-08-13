Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B68BFFA
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 19:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CAC7166B;
	Tue, 13 Aug 2019 19:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CAC7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565718805;
	bh=w8qr/SJCH96ZX156xXTUU6Pecrx6kJP1DadVYUqXAdk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nObiT8tIZK6L9c6uNqGRPW/Q5D7m4U7T9FNdDhWMkMB0nqALjI+XmAW3vM45k97AD
	 ZTgLRIww4XWMHfSrIR6+pZTxBDkAdeakcRtwsYGFSQZQne1u9eQB0MHsZm2S6K1hbv
	 cJi9zqG/FqJjEdZQvwE5+OTRCvebT8tS1eygZ8xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDFCF80290;
	Tue, 13 Aug 2019 19:51:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E04CF80273; Tue, 13 Aug 2019 19:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35139F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 19:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35139F80120
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 10:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="167124255"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 10:51:32 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id 77D37580372;
 Tue, 13 Aug 2019 10:51:31 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
Date: Tue, 13 Aug 2019 12:51:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

T24gOC8xMy8xOSAxMTo1MCBBTSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsCj4gCj4gT24gMTMvMDgvMjAxOSAxNTo0NCwgUGllcnJlLUxvdWlzIEJv
c3NhcnQgd3JvdGU6Cj4+IE9uIDgvMTMvMTkgMzozNSBBTSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3
cm90ZToKPj4+IE9uIHBsYXRmb3JtcyB3aGljaCBoYXZlIHNtYXJ0IHNwZWFrZXIgYW1wbGlmaWVy
cyBjb25uZWN0ZWQgdmlhCj4+PiBzb3VuZHdpcmUgYW5kIG1vZGVsZWQgYXMgYXV4IGRldmljZXMg
aW4gQVNvQywgaW4gc3VjaCB1c2VjYXNlcyBtYWNoaW5lCj4+PiBkcml2ZXIgc2hvdWxkIGJlIGFi
bGUgdG8gZ2V0IHNkdyBtYXN0ZXIgc3RyZWFtIGZyb20gZGFpIHNvIHRoYXQgaXQgY2FuCj4+PiB1
c2UgdGhlIHJ1bnRpbWUgc3RyZWFtIHRvIHNldHVwIHNsYXZlIHN0cmVhbXMuCj4+Cj4+IHVzaW5n
IHRoZSBfc2V0X3Nkd19zdHJlYW0/IEkgZG9uJ3QgZnVsbHkgZ2V0IHRoZSBzZXF1ZW5jZSB3aXRo
IHRoZSAKPj4gd29yZGluZyBhYm92ZS4KPiAKPiBZZXMsIHVzaW5nIHNldF9zZHdfc3RyZWFtKCku
CgpNYXliZSBJIGFtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUsIGJ1dCBJIGRvbid0IHNlZSB3aGVy
ZSB0aGUgCnNldF9zZHdfc3RyZWFtKCkgaXMgY2FsbGVkLgoKQWxzbyBJIGRvbid0IGZ1bGx5IGdl
dCB0aGUgcnVsZS4gc2V0X3Nkd19zdHJlYW0oKSBsb29rcyByZXF1aXJlZCwgCmdldF9zZHdfc3Ry
ZWFtKCkgaXMgb3B0aW9uYWwsIGlzIHRoaXMgd2hhdCB5b3UgYXJlIHN1Z2dlc3Rpbmc/Cgo+Pgo+
Pj4KPj4+IHNvdW5kd2lyZSBhbHJlYWR5IGFzIGEgc2V0IGZ1bmN0aW9uLCBnZXQgZnVuY3Rpb24g
d291bGQgcHJvdmlkZSBtb3JlCj4+PiBmbGV4aWJpbGl0eSB0byBhYm92ZSBjb25maWd1cmF0aW9u
cy4KPj4KPj4gSSBhbSBub3QgY2xlYXIgaWYgeW91IGFyZSBhc2tpbmcgZm9yIGJvdGggdG8gYmUg
dXNlZCwgb3IgZ2V0IG9ubHkgb3IgCj4+IHNldCBvbmx5Pwo+IAo+IEl0IGRlcGVuZHMgb24gdGhl
IHVzZWNhc2UsIGluIGRiODQ1YyB1c2VjYXNlwqAgWzFdIGFzIEF1eCBkZXZpY2UgaXMgZGFpIAo+
IGxlc3MsIG1hY2hpbmUgZHJpdmVyIGlzIHVzaW5nIGdldCBmdW5jdGlvbiB0byBnZXQgaG9sZCBv
ZiBtYXN0ZXIgc3RyZWFtIAo+IHNvIHRoYXQgaXQgY2FuIHNldHVwIHNsYXZlIHBvcnQgY29uZmln
Lgo+IAo+IAo+IExvb2tzIGxpa2UgdGhlcmUgaXMgYSB0eXBvIGluIGFib3ZlIGxpa2UKPiAKPiBU
aGlzIHdhcyBzdXBwb3NlZCB0byBiZSAic291bmR3aXJlIGFscmVhZHkgaGFzIGEgc2V0IGZ1bmN0
aW9uLCBnZXQgCj4gZnVuY3Rpb24gd291bGQgcHJvdmlkZSBtb3JlIGZsZXhpYmlsaXR5IHRvIGFi
b3ZlIGNvbmZpZ3VyYXRpb25zIgo+IAo+IFsxXSAKPiBodHRwczovL2dpdC5saW5hcm8ub3JnL2xh
bmRpbmctdGVhbXMvd29ya2luZy9xdWFsY29tbS9rZXJuZWwuZ2l0L3RyZWUvc291bmQvc29jL3Fj
b20vZGI4NDVjLmM/aD1pbnRlZ3JhdGlvbi1saW51eC1xY29tbHQgCj4gCj4gCj4gdGhhbmtzLAo+
IHNyaW5pCj4gCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiDCoCBpbmNsdWRlL3Nv
dW5kL3NvYy1kYWkuaCB8IDEwICsrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvc29jLWRhaS5o
IGIvaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmgKPj4+IGluZGV4IGRjNDhmZTA4MWEyMC4uMWUwMWY0
YTMwMmUwIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmgKPj4+ICsrKyBi
L2luY2x1ZGUvc291bmQvc29jLWRhaS5oCj4+PiBAQCAtMjAyLDYgKzIwMiw3IEBAIHN0cnVjdCBz
bmRfc29jX2RhaV9vcHMgewo+Pj4gwqDCoMKgwqDCoCBpbnQgKCpzZXRfc2R3X3N0cmVhbSkoc3Ry
dWN0IHNuZF9zb2NfZGFpICpkYWksCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lk
ICpzdHJlYW0sIGludCBkaXJlY3Rpb24pOwo+Pj4gK8KgwqDCoCB2b2lkICooKmdldF9zZHdfc3Ry
ZWFtKShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwgaW50IGRpcmVjdGlvbik7Cj4+PiDCoMKgwqDC
oMKgIC8qCj4+PiDCoMKgwqDCoMKgwqAgKiBEQUkgZGlnaXRhbCBtdXRlIC0gb3B0aW9uYWwuCj4+
PiDCoMKgwqDCoMKgwqAgKiBDYWxsZWQgYnkgc29jLWNvcmUgdG8gbWluaW1pc2UgYW55IHBvcHMu
Cj4+PiBAQCAtNDEwLDQgKzQxMSwxMyBAQCBzdGF0aWMgaW5saW5lIGludCAKPj4+IHNuZF9zb2Nf
ZGFpX3NldF9zZHdfc3RyZWFtKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PVFNVUFA7Cj4+PiDCoCB9Cj4+PiArc3RhdGljIGlubGluZSB2
b2lkICpzbmRfc29jX2RhaV9nZXRfc2R3X3N0cmVhbShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludCBkaXJlY3Rpb24pCj4+PiArewo+Pj4gK8KgwqDCoCBpZiAoZGFpLT5kcml2ZXItPm9wcy0+
Z2V0X3Nkd19zdHJlYW0pCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRhaS0+ZHJpdmVyLT5v
cHMtPmdldF9zZHdfc3RyZWFtKGRhaSwgZGlyZWN0aW9uKTsKPj4+ICvCoMKgwqAgZWxzZQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FTk9UU1VQUCk7Cj4+PiArfQo+Pj4gKwo+
Pj4gwqAgI2VuZGlmCj4+Pgo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
