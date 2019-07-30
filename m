Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE07A905
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C07917D5;
	Tue, 30 Jul 2019 14:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C07917D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564491217;
	bh=6D88cFVTsXmPTsMeLmiiQJmpx3H5UFkMQHC0lql2GRE=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6QMR6x3WM00kJVP2HmyvVr0nVYyUtaXN6Hjzij/Fr3xLa74R2OS08uFbkQ84MSxU
	 CFJCNfop78w+FkyNSeschziMfDm4gwaaZkYNcw7vaF/MFvdGhzh50Fn8qHMpYVHSrR
	 cc6nk5IDfVGoB49q6VXJ1zimZebBdTzVp0HBI7Mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EAFFF804CC;
	Tue, 30 Jul 2019 14:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 390D3F804CA; Tue, 30 Jul 2019 14:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 532CAF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 532CAF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 05:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="183121489"
Received: from chingkai-mobl.amr.corp.intel.com (HELO [10.252.137.193])
 ([10.252.137.193])
 by orsmga002.jf.intel.com with ESMTP; 30 Jul 2019 05:51:44 -0700
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>, marcin.rajwa@intel.com,
 Keyon Jie <yang.jie@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org
References: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0b20cfe6-064b-a4ce-ce9d-2634f3f23d7c@linux.intel.com>
Date: Tue, 30 Jul 2019 07:51:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
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

CgpPbiA3LzMwLzE5IDU6MTYgQU0sIFJhandhLCBNYXJjaW4gd3JvdGU6Cj4gRnJvbTogTWFyY2lu
IFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgo+IAo+IENoYW5nZSB0aGUgdXNl
IG9mIGhvc3RfcGVyaW9kX2J5dGVzLiBTbyBmYXIgdGhpcyBmaWVsZCB3YXMgdXNlZAo+IGFzIGFu
IGJvb2wgdmFsdWUgaW5kaWNhdGluZyB3aGV0aGVyIEZXIHNob3VsZCBzZW5kIHN0cmVhbSBwb3Np
dGlvbgo+IHVwZGF0ZS4gV2l0aCB0aGlzIHBhdGNoIHdlIHVzZSBob3N0X3BlcmlvZF9ieXRlcyB0
byBwcm92aWRlIGZpcm13YXJlCj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIGZyZXF1ZW5jeSBvZiBo
b3N0IGludGVycnVwdHMgYWltZWQgdG8gcmVhZAo+IGl0cyBpbnB1dCBidWZmZXIuIFRoaXMgaXMg
YWNjb3JpbmcgdG8gQUxTQSBkZWZpbml0aW9uIG9mICdGcmFtZVBlcmlvZCcuCgphY2NvcmRpbmcg
dG8gdGhlCgo+IEtub3dpbmcgdGhpcyBmaXJtd2FyZSBjYW4gc2FmZWx5IGNvcHkgbGFyZ2UvaXJy
ZWd1bGFyIGNodW5rcyBvZiBkYXRhCgp3aHkgaXJyZWd1bGFyPyBBTFNBIHBlcmlvZHMgYXJlIHBy
ZXR0eSByZWd1bGFyIGFuZCBwcmVkaWN0YWJsZS4KCj4gKGxpa2UgZGF0YSBjb21taW5nIGZyb20g
aS5lIGRyYWluaW5nIHRhc2spIHdpdGhvdXQgdGhlIHJpc2sgb2YgYnVmZmVyCgpjb21pbmcKClBs
ZWFzZSBwcm9vZi1yZWFkIHlvdXIgY29tbWl0IG1lc3NhZ2VzIChhbmQgdXNlIGFuIGVkaXRvciB3
aGljaCAKc3BlbGwtY2hlY2tzIGZvciB5b3UpLCB0eXBvcyBhbmQgbWlzbGVhZGluZyBpbmZvcm1h
dGlvbiBkb24ndCBleGFjdGx5IApib29zdCB0cnVzdCBpbiB0aGUgc3VnZ2VzdGVkIHBhdGNoLCBy
ZWdhcmRsZXNzIG9mIGl0cyBtZXJpdHMuCgo+IG92ZXJmbG93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1hcmNpbiBSYWp3YSA8bWFyY2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTog
UmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4KPiAK
PiAtLS0KPiAgwqBpbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaCB8IDQgKystLQo+ICDCoDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc291bmQvc29mL3N0cmVhbS5oIGIvaW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFt
LmgKPiBpbmRleCA2NDNmMTc1Y2I0NzkuLjA2YWY0ZWNiMjU4NCAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3NvdW5kL3NvZi9zdHJlYW0uaAo+ICsrKyBiL2luY2x1ZGUvc291bmQvc29mL3N0cmVhbS5o
Cj4gQEAgLTgzLDEwICs4MywxMCBAQCBzdHJ1Y3Qgc29mX2lwY19zdHJlYW1fcGFyYW1zIHsKPiAg
wqDCoMKgwqAgdWludDE2X3Qgc2FtcGxlX3ZhbGlkX2J5dGVzOwo+ICDCoMKgwqDCoCB1aW50MTZf
dCBzYW1wbGVfY29udGFpbmVyX2J5dGVzOwo+IAo+IC3CoMKgwqAgLyogZm9yIG5vdGlmeWluZyBo
b3N0IHBlcmlvZCBoYXMgY29tcGxldGVkIC0gMCBtZWFucyBubyBwZXJpb2QgSVJRICovCj4gIMKg
wqDCoMKgIHVpbnQzMl90IGhvc3RfcGVyaW9kX2J5dGVzOwo+ICvCoMKgwqAgdWludDE2X3Qgbm9f
c3RyZWFtX3Bvc2l0aW9uOyAvKiAxIG1lYW5zIG5vIElQQyBmb3IgcG9zaXRpb24gdXBkYXRlICov
Cj4gCj4gLcKgwqDCoCB1aW50MzJfdCByZXNlcnZlZFsyXTsKPiArwqDCoMKgIHVpbnQxNl90IHJl
c2VydmVkWzNdOwo+ICDCoMKgwqDCoCB1aW50MTZfdCBjaG1hcFtTT0ZfSVBDX01BWF9DSEFOTkVM
U107wqDCoMKgIC8qKjwgY2hhbm5lbCBtYXAgLSAKPiBTT0ZfQ0hNQVBfICovCj4gIMKgfSBfX3Bh
Y2tlZDsKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
