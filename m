Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B378F7B546
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 23:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB0317AF;
	Tue, 30 Jul 2019 23:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB0317AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564523554;
	bh=WyrYDq0NOwy7DOY9zpV0IRE6aByzpjLtYtko1+4tJME=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SG2lcmirfz2fxKx50LSdKzWlpBgT3Do8puF3ab4pHfkjvl3Byc1FEYXaArVlOURQk
	 a3PruUtt5QLqw1a0u43S8bZXeBOdACyV3IOI4shwNbFcdfSkmRVdNqcLFIjs0HbotC
	 toVB74wANTHK+gt6SsSRtY7vWKDPfvPu0GKUw3fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B48AF804CA;
	Tue, 30 Jul 2019 23:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D44FF804CA; Tue, 30 Jul 2019 23:50:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A3E7F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 23:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A3E7F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 14:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="191041308"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.249.144.144])
 ([10.249.144.144])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2019 14:50:40 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 marcin.rajwa@intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org
References: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
 <0b20cfe6-064b-a4ce-ce9d-2634f3f23d7c@linux.intel.com>
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Message-ID: <5fda90f9-c387-440a-9ea8-648b22dda9b0@linux.intel.com>
Date: Tue, 30 Jul 2019 23:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0b20cfe6-064b-a4ce-ce9d-2634f3f23d7c@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: SOF: introduce
 no_stream_position so host_period_bytes preserves its data
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

T24gNy8zMC8yMDE5IDI6NTEgUE0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgoKPgo+Cj4g
T24gNy8zMC8xOSA1OjE2IEFNLCBSYWp3YSwgTWFyY2luIHdyb3RlOgo+PiBGcm9tOiBNYXJjaW4g
UmFqd2EgPG1hcmNpbi5yYWp3YUBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IENoYW5nZSB0aGUgdXNl
IG9mIGhvc3RfcGVyaW9kX2J5dGVzLiBTbyBmYXIgdGhpcyBmaWVsZCB3YXMgdXNlZAo+PiBhcyBh
biBib29sIHZhbHVlIGluZGljYXRpbmcgd2hldGhlciBGVyBzaG91bGQgc2VuZCBzdHJlYW0gcG9z
aXRpb24KPj4gdXBkYXRlLiBXaXRoIHRoaXMgcGF0Y2ggd2UgdXNlIGhvc3RfcGVyaW9kX2J5dGVz
IHRvIHByb3ZpZGUgZmlybXdhcmUKPj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIGZyZXF1ZW5jeSBv
ZiBob3N0IGludGVycnVwdHMgYWltZWQgdG8gcmVhZAo+PiBpdHMgaW5wdXQgYnVmZmVyLiBUaGlz
IGlzIGFjY29yaW5nIHRvIEFMU0EgZGVmaW5pdGlvbiBvZiAnRnJhbWVQZXJpb2QnLgo+Cj4gYWNj
b3JkaW5nIHRvIHRoZQo+Cj4+IEtub3dpbmcgdGhpcyBmaXJtd2FyZSBjYW4gc2FmZWx5IGNvcHkg
bGFyZ2UvaXJyZWd1bGFyIGNodW5rcyBvZiBkYXRhCj4KPiB3aHkgaXJyZWd1bGFyPyBBTFNBIHBl
cmlvZHMgYXJlIHByZXR0eSByZWd1bGFyIGFuZCBwcmVkaWN0YWJsZS4KCkkgZGlkIG5vdCBzYXkg
QUxTQSBwZXJpb2RzIGFyZSBpcnJlZ3VsYXIgSSBzYWlkIHRoYXQgc29tZXRpbWVzIChsaWtlIGlu
IApjYXNlIG9mIGRyYWluaW5nKSBmaXJtd2FyZSBuZWVkcyB0byBjb3B5IGlycmVndWxhciBhbW91
bnQgb2YgdGhhdC4KCldoYXQgSSBtZWFuIGJ5ICJpcnJlZ3VsYXIiIGlzIG5vdCBlcXVhbCB0byBB
TFNBIHBlcmlvZCBvciBtdWx0aXBsZSBvZiAKcGVyaW9kcy4KCj4KPj4gKGxpa2UgZGF0YSBjb21t
aW5nIGZyb20gaS5lIGRyYWluaW5nIHRhc2spIHdpdGhvdXQgdGhlIHJpc2sgb2YgYnVmZmVyCj4K
PiBjb21pbmcKPgo+IFBsZWFzZSBwcm9vZi1yZWFkIHlvdXIgY29tbWl0IG1lc3NhZ2VzIChhbmQg
dXNlIGFuIGVkaXRvciB3aGljaCAKPiBzcGVsbC1jaGVja3MgZm9yIHlvdSksIHR5cG9zIGFuZCBt
aXNsZWFkaW5nIGluZm9ybWF0aW9uIGRvbid0IGV4YWN0bHkgCj4gYm9vc3QgdHJ1c3QgaW4gdGhl
IHN1Z2dlc3RlZCBwYXRjaCwgcmVnYXJkbGVzcyBvZiBpdHMgbWVyaXRzLgoKClNvcnJ5IGZvciB0
eXBvcy4gU2hvdWxkIEkgY29ycmVjdCB0aGVtIGFuZCByZXNlbmQgYWdhaW4gb3IgY29ycmVjdCBo
ZXJlIAphcyB3ZSBkaXNjdXNzPwoKPgo+PiBvdmVyZmxvdy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
TWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVsLmNvbT4KPj4gUmV2aWV3ZWQtYnk6
IFJhbmphbmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+Cj4+
Cj4+IC0tLQo+PiDCoMKgaW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFtLmggfCA0ICsrLS0KPj4gwqDC
oDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaCBiL2luY2x1ZGUvc291bmQvc29m
L3N0cmVhbS5oCj4+IGluZGV4IDY0M2YxNzVjYjQ3OS4uMDZhZjRlY2IyNTg0IDEwMDY0NAo+PiAt
LS0gYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaAo+PiArKysgYi9pbmNsdWRlL3NvdW5kL3Nv
Zi9zdHJlYW0uaAo+PiBAQCAtODMsMTAgKzgzLDEwIEBAIHN0cnVjdCBzb2ZfaXBjX3N0cmVhbV9w
YXJhbXMgewo+PiDCoMKgwqDCoMKgIHVpbnQxNl90IHNhbXBsZV92YWxpZF9ieXRlczsKPj4gwqDC
oMKgwqDCoCB1aW50MTZfdCBzYW1wbGVfY29udGFpbmVyX2J5dGVzOwo+Pgo+PiAtwqDCoMKgIC8q
IGZvciBub3RpZnlpbmcgaG9zdCBwZXJpb2QgaGFzIGNvbXBsZXRlZCAtIDAgbWVhbnMgbm8gcGVy
aW9kIAo+PiBJUlEgKi8KPj4gwqDCoMKgwqDCoCB1aW50MzJfdCBob3N0X3BlcmlvZF9ieXRlczsK
Pj4gK8KgwqDCoCB1aW50MTZfdCBub19zdHJlYW1fcG9zaXRpb247IC8qIDEgbWVhbnMgbm8gSVBD
IGZvciBwb3NpdGlvbiAKPj4gdXBkYXRlICovCj4+Cj4+IC3CoMKgwqAgdWludDMyX3QgcmVzZXJ2
ZWRbMl07Cj4+ICvCoMKgwqAgdWludDE2X3QgcmVzZXJ2ZWRbM107Cj4+IMKgwqDCoMKgwqAgdWlu
dDE2X3QgY2htYXBbU09GX0lQQ19NQVhfQ0hBTk5FTFNdO8KgwqDCoCAvKio8IGNoYW5uZWwgbWFw
IC0gCj4+IFNPRl9DSE1BUF8gKi8KPj4gwqDCoH0gX19wYWNrZWQ7Cj4+Cj4+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
