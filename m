Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFA5DB21
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 03:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0073D1670;
	Wed,  3 Jul 2019 03:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0073D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562118553;
	bh=nv4PAcMIFHbqf3xPeqv7ZrVsUxlSQ48fLuLDfs0Gtsg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gteQTRwce+Cs2iZE2EgJYy9BugSY/zBWO1ThOTJAVhFA3mxOAJPXxU/5oXfNyEFr0
	 M/DdUMFDIVedSbZebV9hhEtQ6bJLwWY3hIiFr7UFSbD6by/c89p5Ur3r35zbbr5+o4
	 xv366U6Ot9vqNwCkJgoxEDVSKG2YFHqu5n5Cul/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D0EF800F1;
	Wed,  3 Jul 2019 03:47:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C79EBF800EA; Wed,  3 Jul 2019 03:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C59EF800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 03:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C59EF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 18:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; d="scan'208";a="165836971"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2019 18:47:18 -0700
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190702121144.7809-1-yang.jie@linux.intel.com>
 <a233dfdbb973251d439197d13b69c867667d3f76.camel@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <8e81bbac-8b5a-9bc0-60ed-115429b07e82@linux.intel.com>
Date: Wed, 3 Jul 2019 09:52:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a233dfdbb973251d439197d13b69c867667d3f76.camel@linux.intel.com>
Content-Language: en-US
Cc: marcin.rajwa@intel.com, "Lin, Mengdong" <mengdong.lin@intel.com>,
 pierre-louis.bossart@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: SOF: ipc: update
 sof_ipc_stream_params
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

CgpPbiAyMDE5LzcvMyDkuIrljYg3OjI5LCBSYW5qYW5pIFNyaWRoYXJhbiB3cm90ZToKPiBPbiBU
dWUsIDIwMTktMDctMDIgYXQgMjA6MTEgKzA4MDAsIEtleW9uIEppZSB3cm90ZToKPj4gRnJvbTog
TWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgo+Pgo+PiBUaGUgaG9z
dCBwZXJpb2QgYnl0ZXMgbmVlZHMgdG8gYmUgcGFzc2VkIHRvIGZpcm13YXJlLgo+PiBDdXJyZW50
bHkgdGhpcyBmaWVsZCBpcyB1c2VkIGFzIG5vdGlmaWNhdGlvbiBmb3IgaG9zdAo+PiBhYm91dCBw
ZXJpb2QgY29weSBjb21wbGV0aW9uLiBUaGVyZWZvcmUgd2UgbmVlZCB0byBzcGxpdCB0aGVzZQo+
PiB0d28gaW5mb3JtYXRpb25zLgo+IEtleW9uL01hcmNpbiwKPiAKPiBDb3VsZCB5b3UgcGxlYXNl
IGFkZCBhIGJpdCBtb3JlIGNvbnRleHQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9uIHRoZQo+IG5l
ZWQgdG8gc3BsaXQgdGhlc2UgdHdvIGZpZWxkcyBpZS4uIHdoYXQgdXNlY2FzZXMgbmVlZCB0aGlz
PwoKU3VyZSwgcHJldmlvdXNseSBJIHdyb3RlIHRoZSBjb21taXQgbWVzc2FnZSBsaWtlIHRoaXM6
CgpBU29DOiBTT0Y6IGFkZCBmbGFnIGZvciBwb3NpdGlvbiB1cGRhdGUgaXBjCgpJbiBzb21lIGNh
c2VzLCBGVyBtaWdodCBuZWVkIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZXZlbiBubyBwb3Np
dGlvbgp1cGRhdGUgaXBjIHJlcWl1cmVkIGZyb20gZHJpdmVyLCBoZXJlIGFkZCBhbm90aGVyIGZs
YWcgZm9yIHBvc2l0aW9uIHVwZGF0ZSwKYW5kIHByZXNlcnZlIGhvc3RfcGVyaW9kX2J5dGVzIGZv
ciBGVyB0byB1c2UuCgpUaGlzIG1pZ2h0IHJlcXVpcmUgY29ycmVzcG9uZGluZyBGVyBjaGFuZ2Ug
YW5kIEFCSSBhbGlnbm1lbnQuCgpUaGFua3MsCn5LZXlvbgoKPiAKPiBUaGFua3MsCj4gUmFuamFu
aQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJjaW4gUmFqd2EgPG1hcmNpbi5yYWp3YUBsaW51eC5p
bnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEtleW9uIEppZSA8eWFuZy5qaWVAbGludXguaW50
ZWwuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaCB8IDQgKystLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaCBiL2luY2x1ZGUvc291bmQv
c29mL3N0cmVhbS5oCj4+IGluZGV4IDY0M2YxNzVjYjQ3OS4uNDRhY2ZhNjJmYTY5IDEwMDY0NAo+
PiAtLS0gYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaAo+PiArKysgYi9pbmNsdWRlL3NvdW5k
L3NvZi9zdHJlYW0uaAo+PiBAQCAtODMsMTAgKzgzLDEwIEBAIHN0cnVjdCBzb2ZfaXBjX3N0cmVh
bV9wYXJhbXMgewo+PiAgIAl1aW50MTZfdCBzYW1wbGVfdmFsaWRfYnl0ZXM7Cj4+ICAgCXVpbnQx
Nl90IHNhbXBsZV9jb250YWluZXJfYnl0ZXM7Cj4+ICAgCj4+IC0JLyogZm9yIG5vdGlmeWluZyBo
b3N0IHBlcmlvZCBoYXMgY29tcGxldGVkIC0gMCBtZWFucyBubyBwZXJpb2QKPj4gSVJRICovCj4+
ICAgCXVpbnQzMl90IGhvc3RfcGVyaW9kX2J5dGVzOwo+PiArCXVpbnQxNl90IG5vX3BlcmlvZF9p
cnE7IC8qIDEgbWVhbnMgcGVyaW9kIElSUSBtb2RlIE9GRiAqLwo+PiAgIAo+PiAtCXVpbnQzMl90
IHJlc2VydmVkWzJdOwo+PiArCXVpbnQxNl90IHJlc2VydmVkWzNdOwo+PiAgIAl1aW50MTZfdCBj
aG1hcFtTT0ZfSVBDX01BWF9DSEFOTkVMU107CS8qKjwgY2hhbm5lbCBtYXAgLQo+PiBTT0ZfQ0hN
QVBfICovCj4+ICAgfSBfX3BhY2tlZDsKPj4gICAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
