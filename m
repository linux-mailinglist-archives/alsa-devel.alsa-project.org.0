Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CCEC828
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF8FC239D;
	Fri,  1 Nov 2019 18:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF8FC239D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572630887;
	bh=9U2VP1l77jt6FJahx7gynP+JnFTk/19scYIn8awNnHg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TFvkk/qxfkD5IxlJN20yPRhHHKJ0IcPVugtFSSZwrFwpt+nCPrxFn3zKuIo8wYWwj
	 1h5OaVmnSdA5Z3ZNQGhlJH/Xmwd9Xz9eRDyGJ33b5lsBXL60UDbtImUr42lIUgQGeA
	 3Wq7PwOG+qgG2mdO4LLG5rR98nYElNi23ycuBiLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1199DF803D6;
	Fri,  1 Nov 2019 18:53:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA7CF803D6; Fri,  1 Nov 2019 18:53:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F4DF800C9
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F4DF800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="199876576"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO [10.255.92.243])
 ([10.255.92.243])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2019 10:52:41 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh@kernel.org,
 vkoul@kernel.org
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
 <20191030153150.18303-3-srinivas.kandagatla@linaro.org>
 <af29ec6e-d89e-7fa4-a8cd-29ab944ecd5c@linux.intel.com>
 <926bd15f-e230-8f5e-378d-355bfeeecf27@linaro.org>
 <3d17a2a2-3033-e740-a466-e6cf7919adb2@linux.intel.com>
 <7ea278b4-ecd4-bd17-4550-3f6f9136260e@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3aa6695d-c9b6-b517-ff2f-8eb5a269f020@linux.intel.com>
Date: Fri, 1 Nov 2019 12:52:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <7ea278b4-ecd4-bd17-4550-3f6f9136260e@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 2/2] soundwire: qcom: add support for
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

CgpPbiAxMS8xLzE5IDEyOjIyIFBNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IAo+IAo+
IE9uIDAxLzExLzIwMTkgMTY6MzksIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pgo+Pj4+
PiArc3RhdGljIGludCBxY29tX3N3cm1fcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBzbmRfc29jX2RhaSAqZGFpKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIHN0cnVjdCBxY29tX3N3
cm1fY3RybCAqY3RybCA9IGRldl9nZXRfZHJ2ZGF0YShkYWktPmRldik7Cj4+Pj4+ICsKPj4+Pj4g
K8KgwqDCoCBpZiAoIWN0cmwtPnNydW50aW1lW2RhaS0+aWRdKQo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCByZXR1cm4gc2R3X2VuYWJs
ZV9zdHJlYW0oY3RybC0+c3J1bnRpbWVbZGFpLT5pZF0pOwo+Pj4+Cj4+Pj4gU28gaW4gaHdfcGFy
YW1zIHlvdSBjYWxsIHNkd19wcmVwYXJlX3N0cmVhbSgpIGFuZCBpbiBfcHJlcGFyZSB5b3UgCj4+
Pj4gY2FsbCBzZHdfZW5hYmxlX3N0cmVhbSgpPwo+Pj4+Cj4+Pj4gU2hvdWxkbid0IHRoaXMgYmUg
aGFuZGxlZCBpbiBhIC50cmlnZ2VyIG9wZXJhdGlvbiBhcyBwZXIgdGhlIAo+Pj4+IGRvY3VtZW50
YXRpb24gIkZyb20gQVNvQyBEUENNIGZyYW1ld29yaywgdGhpcyBzdHJlYW0gc3RhdGUgaXMgbGlu
a2VkIHRvCj4+Pj4gLnRyaWdnZXIoKSBzdGFydCBvcGVyYXRpb24uIgo+Pj4KPj4+IElmIEkgbW92
ZSBzZHdfZW5hYmxlL2Rpc2FibGVfc3RyZWFtKCkgdG8gdHJpZ2dlciBJIGdldCBhIGJpZyBjbGlj
ayAKPj4+IG5vaXNlIG9uIG15IHNwZWFrZXJzIGF0IHN0YXJ0IGFuZCBlbmQgb2YgZXZlcnkgcGxh
eWJhY2suIFRyaWVkIAo+Pj4gZGlmZmVyZW50IHRoaW5ncyBidXQgbm90aGluZyBoZWxwZWQgc28g
ZmFyIS4gRW5hYmxpbmcgU3BlYWtlciBEQUNzIAo+Pj4gb25seSBhZnRlciBTb3VuZFdpcmUgcG9y
dHMgYXJlIGVuYWJsZWQgaXMgd29ya2luZyBmb3IgbWUhCj4+PiBUaGVyZSBpcyBub3RoaW5nIGNv
bXBsaWNhdGVkIG9uIFdTQTg4MXggY29kZWMgc2lkZSBhbGwgdGhlIERBQ3MgYXJlIAo+Pj4gZW5h
YmxlZC9kaXNhYmxlZCBhcyBwYXJ0IG9mIERBUE0uCj4+Cj4+IHRoYXQgbG9va3MgbGlrZSBhIHdv
cmstYXJvdW5kIHRvIG1lPyBJZiB5b3UgZG8gYSBiYW5rIHN3aXRjaCB3aXRob3V0IAo+PiBhbnl0
aGluZyB0cmlnZ2VyZWQsIHlvdSBhcmUgbW9zdCBsaWtlbHkgc2VuZGluZyBhIGJ1bmNoIG9mIHpl
cm9lcyB0byAKPj4geW91ciBhbXBsaWZpZXIgYW5kIGVuYWJsaW5nIGNsaWNrL3BvcCByZW1vdmFs
cyBzb21laG93Lgo+Pgo+PiBJdCdkIGJlIHdvcnRoIGxvb2tpbmcgaW50byB0aGlzLCBtYXliZSB0
aGVyZSdzIGEgbWlzc2luZyBkaWdpdGFsIAo+PiBtdXRlL3VubXV0ZSB0aGF0J3Mgbm90IGRvbmUg
aW4gdGhlIHJpZ2h0IG9yZGVyPwo+IAo+IERpZ2l0YWwgbXV0ZSBkb2VzIG5vdCBoZWxwIHRvbywg
YXMgdGhleSBnZXQgdW5tdXRlZCBiZWZvcmUgCj4gc2R3X2VuYWJsZV9zdHJlYW0oKSBjYWxsIGlu
IHRyaWdnZXIsIEkgaGl0IHNhbWUgY2xpY2sgc291bmQuCj4gCj4gU2FtZSBpbiB0aGUgZGlzYWJs
ZSBwYXRoIHRvbyEKPiAKPiBBbHNvIEkgbm90aWNlZCB0aGF0IHRoZXJlIGFyZSBtb3JlIHRoYW4g
MjArIHJlZ2lzdGVyIHJlYWQvd3JpdGVzIGluIHRoZSAKPiBzZHdfZW5hYmxlX3N0cmVhbSgpIHBh
dGggd2hpY2ggdG9vayBhdGxlYXN0IDMwIHRvIDQwIG1pbGxpc2Vjb25kcy4KCndvdywgdGhhdCdz
IGEgdmVyeSBzbG93IGNvbW1hbmQgYmFuZHdpdGgsIGlzIHRoaXMgYmVjYXVzZSBvZiBhIGxvdyBm
cmFtZSAKcmF0ZSBvciB0aGUgU0xJTWJ1cyB0cmFuc3BvcnQgaW4gdGhlIG1pZGRsZT8KCkF0IGFu
eSByYXRlLCB3ZSd2ZSBnb3QgdG8gaW1wcm92ZSB0aGUgYmFuayBzd2l0Y2guIFRoZSBpbnRlbnQg
b2YgdGhlIAphbHRlcm5hdGUgYmFua3MgaXMgdGhhdCBzb2Z0d2FyZSBtaXJyb3JzIHRoZSByZWdp
c3RlciBzZXR0aW5ncyBpbiB0aGUgCmJhY2tncm91bmQgYW5kIG9ubHkgdXBkYXRlcyB3aGF0IG5l
ZWRzIHRvIGJlIGNoYW5nZWQgZHVyaW5nIHRoZSAKZW5hYmxlL2Rpc2FibGUgcGFydC4gd2hlbiB5
b3Ugb3BlcmF0ZSB3aXRoIGEgZml4ZWQgY2xvY2sgZnJlcXVlbmN5IAp1c3VhbGx5IGl0J3Mgb25s
eSB0aGUgY2hhbm5lbCBlbmFibGUgdGhhdCBjaGFuZ2VzIHNvIGl0IGNvdWxkIGJlIHZlcnkgCmZh
c3QgKDEgd3JpdGUgZGVmZXJyZWQgdG8gdGhlIFNTUCBwb2ludCkuCgpPbiB0aGUgaW50ZWwgc2lk
ZSBvdXIgY29tbWFuZCBiYW5kd2lkdGggaXMgY29tcGFyYWJsZSB3aXRoIHRoZSB1c3VhbCAKSTJD
L0hEYXVkaW8gY29kZWNzLCBidXQgc3RpbGwgdGhpbmdzIGNvbXBsaWNhdGVkIGFuZCBzbG93ZXIg
dGhhbiB0aGV5IApzaG91bGQgYmUuIEkgaGF2ZSBiZWVuIGNoYXNpbmcgYSBidWcgaGFwcGVuaW5n
IG9uIGJhbmsgc3dpdGNoZXMgaW4gCm11bHRpLXN0cmVhbSBjb25maWd1cmF0aW9ucyBmb3IgMTAr
IGRheXMgYW5kIGl0J3MgcXVpdGUgaGFyZCB0byBkZWJ1ZyBhdCAKdGhlIG1vbWVudC4KCk9uZSBw
b3NzaWJpbGl0eSBpcyB0byB1c2UgcmVnbWFwIGZvciB0aGUgYmFua2VkIHJlZ2lzdGVycywgYW5k
IGEgbWFudWFsIAptaXJyb3JpbmcgYWZ0ZXIgZWFjaCBiYW5rIHN3aXRjaC4gT3IgbWF5YmUgd2Ug
Y291bGQgZXZlbiBoYXZlIGFuIApleHRlbnNpb24gb2YgcmVnbWFwIHRvIGRvIHRoaXMgZm9yIHVz
LgoKPiBJIHdpbGwgdHJ5IG15IGx1Y2sgY2hlY2tpbmcgdGhlIGRvY3MgdG8gc2VlIGlmIEkgY2Fu
IGZpbmQgc29tZXRoaW5nIAo+IHdoaWNoIHRhbGtzIGFib3V0IHRoaXMuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
