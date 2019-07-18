Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D56C504
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 04:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8659D167F;
	Thu, 18 Jul 2019 04:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8659D167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563417865;
	bh=Rw3mFmu41GOS3deJ+Zt84bBh33DQO5evVgu7i54dR5M=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyPPXukk+LrYpT8c5LdumC0lDxnYJrw6ke/KM5SomBYqeE/od0716tX41kSD5bZ+d
	 SdbwNZ1P85QMLVnOhz8fE9jH2AuNlv1Fq9r+1IEVPYZSh9d24aNZpieMc1AQ5N4LfZ
	 cZdYF42i3NU4r+CyUidd207UJDKEy0X7pxUE6gJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3B8BF800C4;
	Thu, 18 Jul 2019 04:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA6FF80362; Thu, 18 Jul 2019 04:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5DFFF800C4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 04:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5DFFF800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 19:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169725395"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:42:28 -0700
To: alsa-devel@alsa-project.org
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
 <323bbf08-c6dd-a95c-761d-c464ddf7275f@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <4e5e5e16-a452-9a86-823b-22471e72f770@linux.intel.com>
Date: Thu, 18 Jul 2019 10:47:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <323bbf08-c6dd-a95c-761d-c464ddf7275f@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position
 update ipc
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

CgpPbiAyMDE5LzcvMTcg5LiL5Y2IMTE6NDgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+
IAo+IAo+IE9uIDcvMy8xOSAxMDoxMCBBTSwgS2V5b24gSmllIHdyb3RlOgo+PiBGcm9tOiBNYXJj
aW4gUmFqd2EgPG1hcmNpbi5yYWp3YUBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IEluIHNvbWUgY2Fz
ZXMsIEZXIG1pZ2h0IG5lZWQgdXNlIHRoZSBob3N0X3BlcmlvZF9ieXRlcyBldmVuIG5vIHBvc2l0
aW9uCj4+IHVwZGF0ZSBpcGMgcmVxaXVyZWQgZnJvbSBkcml2ZXIsIGhlcmUgYWRkIGFub3RoZXIg
ZmxhZyBmb3IgcG9zaXRpb24gCj4+IHVwZGF0ZSwKPj4gYW5kIHByZXNlcnZlIGhvc3RfcGVyaW9k
X2J5dGVzIGZvciBGVyB0byB1c2UuCj4gCj4gcGxlYXNlIGZpeCB0aGUgY29tbWl0IG1lc3NhZ2Us
IGUuZy4gd2l0aCB0aGUgc3VnZ2VzdGVkIGVkaXQgYmVsb3cKPiAKPiBJbiBzb21lIGNhc2VzLCBG
VyBtaWdodCBuZWVkIHRvIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgdG8gZmV0Y2gg
Cj4gZGF0YSBvdmVyIERNQSBidXQgdGhlIGRyaXZlciBkb2VzIG5vdCBuZWVkIGFueSBwb3NpdGlv
biBpbmZvcm1hdGlvbiAKPiByZXR1cm5lZCBvdmVyIHRoZSBJUEMgY2hhbm5lbCBieSB0aGUgZmly
bXdhcmUuIFRoZSBjdXJyZW50IElQQyAKPiBkZWZpbml0aW9uIHByZXZlbnRzIHRoaXMgY2FwYWJp
bGl0eSwgc28gYWRkIG5ldyBmaWVsZC4KCkdvb2QsIHRoYW5rcyBmb3IgdGhlIGRldGFpbCBzdWdn
ZXN0aW9uLgoKPiAKPj4KPj4gVGhpcyBtaWdodCByZXF1aXJlIGNvcnJlc3BvbmRpbmcgRlcgY2hh
bmdlIGFuZCBBQkkgYWxpZ25tZW50Lgo+IAo+IHJlbW92ZSB0aGlzIHN0YXRlbWVudCwgdGhpcyBp
cyBhbHJlYWR5IGhhbmRsZWQgaW4gYmFja3dhcmRzIGNvbXBhdGlibGUgCj4gbW9kZS4KCk9LLgoK
PiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXgu
aW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4Lmlu
dGVsLmNvbT4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvc291bmQvc29mL3N0cmVhbS5oIHwgNCArKy0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaCBiL2luY2x1ZGUvc291
bmQvc29mL3N0cmVhbS5oCj4+IGluZGV4IDY0M2YxNzVjYjQ3OS4uNDRhY2ZhNjJmYTY5IDEwMDY0
NAo+PiAtLS0gYS9pbmNsdWRlL3NvdW5kL3NvZi9zdHJlYW0uaAo+PiArKysgYi9pbmNsdWRlL3Nv
dW5kL3NvZi9zdHJlYW0uaAo+PiBAQCAtODMsMTAgKzgzLDEwIEBAIHN0cnVjdCBzb2ZfaXBjX3N0
cmVhbV9wYXJhbXMgewo+PiDCoMKgwqDCoMKgIHVpbnQxNl90IHNhbXBsZV92YWxpZF9ieXRlczsK
Pj4gwqDCoMKgwqDCoCB1aW50MTZfdCBzYW1wbGVfY29udGFpbmVyX2J5dGVzOwo+PiAtwqDCoMKg
IC8qIGZvciBub3RpZnlpbmcgaG9zdCBwZXJpb2QgaGFzIGNvbXBsZXRlZCAtIDAgbWVhbnMgbm8g
cGVyaW9kIAo+PiBJUlEgKi8KPj4gwqDCoMKgwqDCoCB1aW50MzJfdCBob3N0X3BlcmlvZF9ieXRl
czsKPj4gK8KgwqDCoCB1aW50MTZfdCBub19wZXJpb2RfaXJxOyAvKiAxIG1lYW5zIHBlcmlvZCBJ
UlEgbW9kZSBPRkYgKi8KPiAKPiBJJ2QgbGlrZSB0aGlzIGZpZWxkIHRvIGJlIHJlbmFtZWQgYXMg
J25vX3Bvc2l0aW9uX3VwZGF0ZScuIFRoaXMgcmVhbGx5IAo+IGhhcyBub3RoaW5nIHRvIGRvIHdp
dGggbm8gcGVyaW9kX2lycSBpbiBnZW5lcmFsLCBldmVuIHdoZW4geW91IGRvIHVzZSAKPiB0aGUg
bm9faXJxIG1vZGUgeW91IGNhbiBzdGlsbCByZXRyaWV2ZSB0aGUgcG9zaXRpb24gaW5mb3JtYXRp
b24gZnJvbSB0aGUgCj4gSERhdWRpbyBETUEgcmVnaXN0ZXJzLgoKQWdyZWUsIHRoYXQncyBhY3R1
YWxseSBteSBvcmlnaW5hbCB2ZXJzaW9uLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24sIAp0
aGFua3MuCgpUaGFua3MsCn5LZXlvbgoKPiAKPj4gLcKgwqDCoCB1aW50MzJfdCByZXNlcnZlZFsy
XTsKPj4gK8KgwqDCoCB1aW50MTZfdCByZXNlcnZlZFszXTsKPj4gwqDCoMKgwqDCoCB1aW50MTZf
dCBjaG1hcFtTT0ZfSVBDX01BWF9DSEFOTkVMU107wqDCoMKgIC8qKjwgY2hhbm5lbCBtYXAgLSAK
Pj4gU09GX0NITUFQXyAqLwo+PiDCoCB9IF9fcGFja2VkOwo+Pgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
