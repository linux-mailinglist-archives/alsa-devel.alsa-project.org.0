Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE8AADE4
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 23:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9520166A;
	Thu,  5 Sep 2019 23:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9520166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567719425;
	bh=gtMeK6xgTRg+x0HwzmCVbejozbfKNXxD5ioiDud0kLM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/9knknhaAzJ3rQQvT2uFC8f9paj9fnU7WPTiVD7hmdJH2wgRGDK8ui3Da5ws8yPF
	 LBEcvrdlhyLkXf0FR00yRm4i1pECQBlv0ECfH9yF4ATHkZOWtQ/Qj2Lbg5aVlxIZ5v
	 heZ5JqpzdeU8utCJAUfRP4zfzB+Zvd11hgB5gemc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD09CF804A9;
	Thu,  5 Sep 2019 23:35:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF50F80448; Thu,  5 Sep 2019 23:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E51A5F802DF
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 23:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51A5F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZO6/FWDA"
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1536F206BB;
 Thu,  5 Sep 2019 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567719311;
 bh=v2fQCvGYm46BeRXfxC+1ZlpNLHHP4uol+ATDKOQNCzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZO6/FWDAr38eGqj49jBGMpzmVP61WBxI+2QqvGqfd1IZqmcbyuuPO3gsILOUyU/DE
 FOxbRK9SK/QY4HLGrd8IXExDR0WGslMq8R9/1Vi9Cuk1loxrhC5qznfOTeBk1D6tSe
 229BNm14HnaqpvX2AAkpQQyWPHbMEcG5zkSQmfTg=
Date: Thu, 5 Sep 2019 16:35:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <20190905213509.GI103977@google.com>
References: <20190827134756.10807-2-kai.heng.feng@canonical.com>
 <20190828180128.1732-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828180128.1732-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/2] ALSA: hda: Allow HDA to be runtime
 suspended when dGPU is not bound
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

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDE6MjhBTSArMDgwMCwgS2FpLUhlbmcgRmVuZyB3
cm90ZToKPiBJdCdzIGEgY29tbW9uIHByYWN0aWNlIHRvIGxldCBkR1BVIHVuYm91bmQgYW5kIHVz
ZSBQQ0kgcGxhdGZvcm0gcG93ZXIKPiBtYW5hZ2VtZW50IHRvIGRpc2FibGUgaXRzIHBvd2VyIHRo
cm91Z2ggX09GRiBtZXRob2Qgb2YgcG93ZXIgcmVzb3VyY2UsCj4gd2hpY2ggaXMgbGlzdGVkIGJ5
IF9QUjMuCj4gV2hlbiB0aGUgZEdQVSBjb21lcyB3aXRoIGFuIEhEQSBmdW5jdGlvbiwgdGhlIEhE
QSB3b24ndCBiZSBzdXNwZW5kZWQgaWYKPiB0aGUgZEdQVSBpcyB1bmJvdW5kLCBzbyB0aGUgcG93
ZXIgcmVzb3VyY2UgY2FuJ3QgYmUgdHVybmVkIG9mZi4KCkknbSBub3QgaW52b2x2ZWQgaW4gYXBw
bHlpbmcgdGhpcyBwYXRjaCwgYnV0IGZyb20gdGhlIHBlYW51dCBnYWxsZXJ5OgoKICAtIFRoZSBh
Ym92ZSBsb29rcyBsaWtlIGl0IG1pZ2h0IGJlIHR3byBwYXJhZ3JhcGhzIG1pc3NpbmcgYSBibGFu
awogICAgbGluZSBiZXR3ZWVuPyAgT3IgbWF5YmUgaXQncyBvbmUgcGFyYWdyYXBoIHRoYXQgbmVl
ZHMgdG8gYmUKICAgIHJld3JhcHBlZD8KCiAgLSBJIGNhbid0IHBhcnNlIHRoZSBmaXJzdCBzZW50
ZW5jZS4gIEkgZ3Vlc3MgImRHUFUiIGFuZCAiSERBIiBhcmUKICAgIGhhcmR3YXJlIGRldmljZXMs
IGJ1dCBJIGRvbid0IGtub3cgd2hhdCAidW5ib3VuZCIgbWVhbnMuICBJcyB0aGF0CiAgICBzb21l
dGhpbmcgdG8gZG8gd2l0aCBhIGRyaXZlciBiZWluZyBib3VuZCB0byB0aGUgZEdQVT8gIE9yIGlz
IGl0CiAgICBzb21lIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgZEdQVSBhbmQgdGhlIEhEQT8KCiAg
LSAiUENJIHBsYXRmb3JtIHBvd2VyIG1hbmFnZW1lbnQiIGlzIHN0aWxsIGNvbmZ1c2luZyAtLSBJ
IHRoaW5rIHdlCiAgICBlaXRoZXIgaGF2ZSAiUENJIHBvd2VyIG1hbmFnZW1lbnQiIHRoYXQgdXNl
cyB0aGUgUENJIFBNIENhcGFiaWxpdHkKICAgIChpLmUuLCB3cml0aW5nIFBDSV9QTV9DVFJMIGFz
IGluIHBjaV9yYXdfc2V0X3Bvd2VyX3N0YXRlKCkpIE9SIHdlCiAgICBoYXZlICJwbGF0Zm9ybSBw
b3dlciBtYW5hZ2VtZW50IiB0aGF0IHVzZXMgc29tZSBvdGhlciBtZXRob2QsCiAgICB0eXBpY2Fs
bHkgQUNQSS4gIFNpbmNlIHlvdSByZWZlciB0byBfT0ZGIGFuZCBfUFIzLCBJIGd1ZXNzIHlvdSdy
ZQogICAgcmVmZXJyaW5nIHRvIHBsYXRmb3JtIHBvd2VyIG1hbmFnZW1lbnQgaGVyZS4KCiAgLSAi
SXQncyBjb21tb24gcHJhY3RpY2UgdG8gbGV0IGRHUFUgdW5ib3VuZCIgLS0gZG9lcyB0aGF0IHJl
ZmVyIHRvCiAgICBzb21lIHByb2dyYW1taW5nIHRlY2huaXF1ZSBjb21tb24gaW4gZHJpdmVycywg
b3Igc29tZSB1c2VyLWxldmVsCiAgICB0aGluZyBsaWtlIHVubG9hZGluZyBhIGRyaXZlciwgb3Ig
Li4uPyAgTXkgZ3Vlc3MgaXMgaXQgcHJvYmFibHkKICAgIG1lYW5zICJ1bmJpbmQgdGhlIGRyaXZl
ciBmcm9tIHRoZSBkR1BVIiBidXQgSSBzdGlsbCBkb24ndCBrbm93CiAgICB3aGF0IG1ha2VzIGl0
IGNvbW1vbiBwcmFjdGljZS4KClRoaXMgcHJvYmFibHkgYWxsIG1ha2VzIHBlcmZlY3Qgc2Vuc2Ug
dG8gdGhlIGdyYXBoaWNzIGNvZ25vc2NlbnRpLCBidXQKZm9yIHRoZSByZXN0IG9mIHVzIHRoZXJl
IGFyZSBhIGxvdCBvZiBkb3RzIGhlcmUgdGhhdCBhcmUgbm90CmNvbm5lY3RlZC4KCj4gQ29tbWl0
IDM3YTNhOThlZjYwMSAoIkFMU0E6IGhkYSAtIEVuYWJsZSBydW50aW1lIFBNIG9ubHkgZm9yCj4g
ZGlzY3JldGUgR1BVIikgb25seSBhbGxvd3MgSERBIHRvIGJlIHJ1bnRpbWUtc3VzcGVuZGVkIG9u
Y2UgR1BVIGlzCj4gYm91bmQsIHRvIGtlZXAgQVBVJ3MgSERBIHdvcmtpbmcuCj4gCj4gSG93ZXZl
ciwgSERBIG9uIGRHUFUgaXNuJ3QgdGhhdCB1c2VmdWwgaWYgZEdQVSBpcyB1bmJvdW5kLiBTbyBs
ZXQncwo+IHJlbGF4IHRoZSBydW50aW1lIHN1c3BlbmQgcmVxdWlyZW1lbnQgZm9yIGRHUFUncyBI
REEgZnVuY3Rpb24sIHRvIHNhdmUKPiBsb3RzIG9mIHBvd2VyLgo+IAo+IEJ1Z0xpbms6IGh0dHBz
Oi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTg0MDgzNQo+IEZpeGVzOiBiNTE2ZWE1ODZkNzEg
KCJQQ0k6IEVuYWJsZSBOVklESUEgSERBIGNvbnRyb2xsZXJz4oCdKQo+IFNpZ25lZC1vZmYtYnk6
IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiB2MjoK
PiAtIENoYW5nZSB3b3JkaW5nLgo+IC0gUmViYXNlIHRvIFRpd2FpJ3MgYnJhbmNoLgo+IAo+ICBz
b3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL2hkYV9pbnRlbC5jIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYwo+IGluZGV4IDkxZTcx
YmU0MmZhNC4uYzM2NTRkMjI3OTVhIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3BjaS9oZGEvaGRhX2lu
dGVsLmMKPiArKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jCj4gQEAgLTEyODQsNyArMTI4
NCwxMSBAQCBzdGF0aWMgdm9pZCBpbml0X3ZnYV9zd2l0Y2hlcm9vKHN0cnVjdCBhenggKmNoaXAp
Cj4gIAkJZGV2X2luZm8oY2hpcC0+Y2FyZC0+ZGV2LAo+ICAJCQkgIkhhbmRsZSB2Z2Ffc3dpdGNo
ZXJvbyBhdWRpbyBjbGllbnRcbiIpOwo+ICAJCWhkYS0+dXNlX3ZnYV9zd2l0Y2hlcm9vID0gMTsK
PiAtCQljaGlwLT5idXMua2VlcF9wb3dlciA9IDE7IC8qIGNsZWFyZWQgaW4gZWl0aGVyIGdwdV9i
b3VuZCBvcCBvciBjb2RlYyBwcm9iZSAqLwo+ICsKPiArCQkvKiBjbGVhcmVkIGluIGVpdGhlciBn
cHVfYm91bmQgb3Agb3IgY29kZWMgcHJvYmUsIG9yIHdoZW4gaXRzCj4gKwkJICogcm9vdCBwb3J0
IGhhcyBfUFIzIChpLmUuIGRHUFUpLgo+ICsJCSAqLwo+ICsJCWNoaXAtPmJ1cy5rZWVwX3Bvd2Vy
ID0gIXBjaV9wcjNfcHJlc2VudChwKTsKPiAgCQljaGlwLT5kcml2ZXJfY2FwcyB8PSBBWlhfRENB
UFNfUE1fUlVOVElNRTsKPiAgCQlwY2lfZGV2X3B1dChwKTsKPiAgCX0KPiAtLSAKPiAyLjE3LjEK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
