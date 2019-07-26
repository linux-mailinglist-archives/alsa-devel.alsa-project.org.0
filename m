Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7D76BD7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0ED2089;
	Fri, 26 Jul 2019 16:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0ED2089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564152177;
	bh=2wS0rd5Bm8VEAMBzaibphKW6bYtJKBL/vHn2hYVL8L0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGLFh9NynmLDLd17y19klDKEVsWrRl4fqP0cYYbFenvK77h52xTyEhYrbpZECPgnx
	 +BeUHttVfRALeDUVm6swGDsiJjsd3Arso1LyspyaYPMtkbP6VSGrd0RaBmy8y/Qvak
	 O6D2zY49LxaP5dsLv+/WX75n2V8WHFXHh0Ye8SqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40FB1F800E8;
	Fri, 26 Jul 2019 16:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10973F80393; Fri, 26 Jul 2019 16:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1687EF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1687EF800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322055350"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:41:02 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
 <869edbf2-1fdd-6b21-818f-20c39c013c11@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a1da9937-0e20-d83d-ec90-c3fd9f3fbeca@linux.intel.com>
Date: Fri, 26 Jul 2019 09:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <869edbf2-1fdd-6b21-818f-20c39c013c11@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 27/40] soundwire: Add Intel resource
 management algorithm
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

CgpPbiA3LzI2LzE5IDY6MDcgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gVGhpcyBhbGdvcml0aG0g
Y29tcHV0ZXMgYnVzIHBhcmFtZXRlcnMgbGlrZSBjbG9jayBmcmVxdWVuY3ksIGZyYW1lCj4+IHNo
YXBlIGFuZCBwb3J0IHRyYW5zcG9ydCBwYXJhbWV0ZXJzIGJhc2VkIG9uIGFjdGl2ZSBzdHJlYW0o
cykgcnVubmluZwo+PiBvbiB0aGUgYnVzLgo+Pgo+PiBUaGlzIGltcGxlbWVudGF0aW9uIGlzIG9w
dGltYWwgZm9yIEludGVsIHBsYXRmb3Jtcy4gRGV2ZWxvcGVycyBjYW4KPj4gYWxzbyBpbXBsZW1l
bnQgdGhlaXIgb3duIC5jb21wdXRlX3BhcmFtcygpIGNhbGxiYWNrIGZvciBzcGVjaWZpYwo+PiBy
ZXNvdXJjZSBtYW5hZ2VtZW50IGFsZ29yaXRobS4KPj4KPj4gQ3JlZGl0czogdGhpcyBwYXRjaCBp
cyBiYXNlZCBvbiBhbiBlYXJsaWVyIGludGVybmFsIGNvbnRyaWJ1dGlvbiBieQo+PiBWaW5vZCBL
b3VsLCBTYW55b2cgS2FsZSwgU2hyZXlhcyBOYyBhbmQgSGFyZGlrIFNoYWguIEFsbCBoYXJkLWNv
ZGVkCj4+IHZhbHVlcyB3ZXJlIHJlbW92ZWQgZnJvbSB0aGUgaW5pdGlhbCBjb250cmlidXRpb24g
dG8gdXNlIEJJT1MKPj4gaW5mb3JtYXRpb24gaW5zdGVhZC4KPj4KPj4gRklYTUU6IHJlbW92ZSBj
aGVja3BhdGNoIHJlcG9ydAo+PiBXQVJOSU5HOiBSZXVzaW5nIHRoZSBrcmVhbGxvYyBhcmcgaXMg
YWxtb3N0IGFsd2F5cyBhIGJ1Zwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncm91cC0+cmF0
ZXMgPSBrcmVhbGxvYyhncm91cC0+cmF0ZXMsCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1M
b3VpcyBCb3NzYXJ0IAo+PiA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+
IAo+IENvdWxkIHlvdSBzcGVjaWZ5IHRoZSByZXF1aXJlbWVudHMgYW5kIGxpbWl0YXRpb25zIGZv
ciB0aGlzIGFsZ29yaXRobT8gCj4gTGFzdCB5ZWFyIEkgd3JpdHRlbiBjYWxjIGZvciBMaW51eCBi
YXNlZCBvbiBXaW5kb3dzIChwbGVhc2UgZG9uJ3QgYnVybiAKPiBtZSBoZXJlKSBlcXVpdmFsZW50
IHRob3VnaCBzYWlkIHJlcXVpcmVtZW50cy8gbGltaXRpYXRpb25zIG1pZ2h0IGhhdmUgCj4gY2hh
bmdlZCBhbmQgbm90aGluZyBpcyB2YWxpZCBhbnkgbG9uZ2VyLgoKVGhlIGZyYW1lIHNoYXBlIHR5
cGljYWxseSBvbmx5IGNoYW5nZXMgYnkgZG91YmxpbmcgdGhlIG51bWJlciBvZiAKY29sdW1ucywg
YW5kIHRoZSBwcmlvcml0eSBpcyBnaXZlbiB0byBQRE0gc3RyZWFtcyB3aGljaCB1c2UgY29sdW1u
cy4gCkl0J3MgaGFyZCB0byBkb2N1bWVudCB0aGlzIG9uIGEgcHVibGljIG1haWxpbmcgbGlzdCwg
aXQnZCByZXF1aXJlIG1ha2luZyAKcmVmZXJlbmNlcyB0byBhIHNwZWMgdGhhdCdzIG9ubHkgYXZh
aWxhYmxlIHRvIE1JUEkgbWVtYmVycy4KCj4gCj4gSSByZW1lbWJlciB0aGF0IHNvbWUgcGFydHMg
b2Ygc3BlY2lmaWNhdGlvbiBvdmVyY29tcGxpY2F0ZWQgdGhlIAo+IGNhbGN1bGF0b3IgYW5kIGR1
ZSB0byBhY3R1YWwsIHJlYWx0aW1lIHVzZWNhc2VzIGl0IGNvdWxkIGJlIGdyZWF0bHkgCj4gc2lt
cGxpZmllZCAodGhhdCdzIHdoeSBJIG1lbnRpb24gdGhhdCBteSB3b3JrIGlzIHByb2JhYmx5IG5v
IGxvbmdlciAKPiB2YWxpZCkuIEhvd2V2ZXIsIHRoZXNlIGRldGFpbHMgd291bGQgaGVscCBtZSBp
biByZXZpZXdpbmcgeW91ciAKPiBpbXBsZW1lbnRhdGlvbiBhbmQgcHJvdmlkaW5nIHN1Z2dlc3Rp
b25zLgoKVG8gdGhlIGJlc3Qgb2YgbXkga25vd2xlZGdlLCB0aGUgYWxnb3JpdGhtIGZvbGxvd3Mg
YSBzY3JpcHQgdGhhdCBpcyB1c2VkIApmb3IgYm90aCBXaW5kb3dzIGFuZCBMaW51eC4gVGhlIGNv
ZGUgd2FzIGluaXRpYWxseSB3cml0dGVuIGJ5IFZpbm9kIGFuZCAKdGVhbSwgYW5kIEkgYW0gbm90
IGF3YXJlIG9mIHNpbXBsaWZpY2F0aW9ucy4KVGhlcmUgYSBzaW1wbGlmaWNhdGlvbnMgdGhhdCBh
cmUgcG9zc2libGUsIGUuZy4gd2UgZG9uJ3Qgc3VwcG9ydCBQRE0gZm9yIApub3cgYW5kIHRoZSBu
b3Rpb24gb2YgZ3JvdXBpbmcgaXMgbm90IG5lZWRlZCwgYnV0IHdlIGhhdmUgdG8gY2FyZWZ1bGx5
IApiYWxhbmNlICdvcHRpbWl6YXRpb24nIHdpdGggJ2ludHJvZHVjaW5nIGJ1Z3MnLiBpZiB0aGlz
IGFsZ29yaXRobSBjcmFwcyAKb3V0IHRoZW4gdGhlIGVudGlyZSBidXMgb3BlcmF0aW9uIGlzIGlu
IHRoZSB3ZWVkcy4KCklmIHdlIHJlYWxseSB3YW50IHBlb3BsZSB0byBleHBlcmltZW50IGFuZCBn
ZXQgYSBmZWVsIGZvciB0aGUgCnBlcmZvcm1hbmNlIG9mIHRoZSBhbGdvcml0aG0sIHdlIHNob3Vs
ZCByZWFsbHkgcHJvdmlkZSBhIFVJIHdoZXJlIHRoZSAKc3RyZWFtIHBhcmFtZXRlcnMgY2FuIGJl
IGVudGVyZWQgYW5kIHZpc3VhbGx5IGNoZWNrIHdoYXQgdGhlIGFsZ29yaXRobSAKaXMgZG9pbmcu
IEkgaGF2ZSBhIHNvbHV0aW9uIHRoYXQgc2hvd3MgdGhlIGJpdHMgYmFzZWQgb24gdGhlIHN0cmVh
bSAKcGFyYW1ldGVycyAobmVlZCB0byBtYWtlIGl0IGF2YWlsYWJsZSBlLmcuIGluIFB5dGhvbiks
IGlmIHdlIGNvbm5lY3RlZCAKaXQgd2l0aCB0aGUgYXV0b21hdGljIGJpdCBhbGxvY2F0aW9uIGl0
J2QgYmUgdmVyeSB1c2VmdWwuCgo+IEFuZCB5ZXMsICJGcmFtZSBzaGFwZSBjYWxjdWxhdG9yIiBw
cm9iYWJseSBzdWl0cyB0aGlzIGJldHRlci4KPiBUaG91Z2ggdGhpcyBtaWdodCBiZSBqdXN0IGEg
cHJlZmVyZW5jZSB0aGluZ3kgOiApCgpSZXNvdXJjZSBtYW5hZ2VtZW50IGlzIGluZGVlZCBhIGJp
dCB2YWd1ZS4gQnV0IGZyYW1lIHNoYXBlIGNhbGN1bGF0b3IgaXMgCm5vdCBxdWl0ZSByaWdodC4g
VGhlIGFsZ29yaXRobSB3aWxsIGZpbmQgdGhlIGZyYW1lIHNoYXBlIHRoYXQgaXMgCnJlcXVpcmVk
IGZvciB0aGUgY3VycmVudCBiYW5kd2lkdGgsIGJ1dCB3aWxsIGFsc28gYWxsb2NhdGUgdGhlIGJp
dFNsb3RzIAppbiB0aGF0IGZyYW1lLiBJbiBNSVBJIGNpcmNsZXMgd2UgdGFsayBhYm91dCBiaXRT
bG90IGFsbG9jYXRpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
