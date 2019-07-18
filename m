Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5686D110
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 17:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02EDB1689;
	Thu, 18 Jul 2019 17:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02EDB1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563463564;
	bh=onrhd9imCQrw+5YIZcCE7b+ndLjULLOtkDH43BuHbuI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sC18rlukady415J0/zqi8G6MR3zUIZOasB8K9m2eEPxJ14i8ZjE4L/GlgVlJ/re9f
	 OtsEoXija+1J+VLL7fmntQCOvIKBRSHCVcgNr6FsWGlvKC+m1lqyTGKf13H0DO4KxA
	 7sXGnJVNIR+R6CISwpqfYIZ+5xMjHmggvtXGdAvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3511DF802BC;
	Thu, 18 Jul 2019 17:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D11F80362; Thu, 18 Jul 2019 17:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1981FF800C4
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 17:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1981FF800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 08:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="170601524"
Received: from pdangwal-mobl.amr.corp.intel.com (HELO [10.254.190.163])
 ([10.254.190.163])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2019 08:24:10 -0700
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
 <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
 <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
 <e023af8c-0538-6f84-3cfe-9482532b2cec@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7097547d-9784-2d26-f1f0-fd2f803481ec@linux.intel.com>
Date: Thu, 18 Jul 2019 10:24:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e023af8c-0538-6f84-3cfe-9482532b2cec@linux.intel.com>
Content-Language: en-US
Cc: marcin.rajwa@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: add flag for position
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

CgpPbiA3LzE4LzE5IDM6NDIgQU0sIFJhandhLCBNYXJjaW4gd3JvdGU6Cj4gCj4gT24gNy8xOC8y
MDE5IDc6MDYgQU0sIEtleW9uIEppZSB3cm90ZToKPj4KPj4KPj4gT24gMjAxOS83LzE4IOS4iuWN
iDExOjM1LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gNy8xNy8x
OSAxMDoxMSBQTSwgS2V5b24gSmllIHdyb3RlOgo+Pj4+IEZyb206IE1hcmNpbiBSYWp3YSA8bWFy
Y2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KPj4+Pgo+Pj4+IEluIHNvbWUgY2FzZXMsIEZXIG1p
Z2h0IG5lZWQgdG8gdXNlIHRoZSBob3N0X3BlcmlvZF9ieXRlcyBmaWVsZCB0bwo+Pj4+IHN5bmNo
cm9uaXplIHRoZSBETUEgY29weWluZyAod2l0aCBob3N0IHNpZGUpIGJ1dCB0aGUgZHJpdmVyIGRv
ZXMgbm90Cj4+Pgo+Pj4gaXQncyB5b3VyIHJpZ2h0IHRvIGVkaXQgbXkgc3VnZ2VzdGVkIHdvcmRp
bmcsIGJ1dCB0aGUgbm90aW9uIG9mIAo+Pj4gJ3N5bmNocm9uaXphdGlvbicgaXMgZmFyIGZyb20g
Y2xlYXIuIGl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSAKPj4+IGhvc3RfcGVyaW9kX2J5
dGVzIGRlZmluZXMgdGhlIERNQSB0cmFuc2ZlciBzaXplIHJlcXVlc3RlZCBieSB0aGUgCj4+PiBm
aXJtd2FyZSwgd2hpY2ggaXNuJ3QgYSB2YWx1ZSB0aGF0IG1hdHRlcnMgdG8gdGhlIGhvc3QgZXhj
ZXB0IGZvciAKPj4+IHJld2luZCB1c2FnZXMuCj4+Cj4+IEhpIFBpZXJyZSwgaGVyZSB0aGUgaG9z
dF9wZXJpb2RfYnl0ZXMgaXMgcmVxdWVzdGVkIGJ5IGhvc3QsIEZXIGhhcyBpdHMgCj4+IG93biBw
ZXJpb2Qgc2l6ZSwgYW5kIERNQSB3aWxsIHRyYW5zZmVyIGRhdGEgaW4gRlcgYnVmZmVyIHBlcmlv
ZCBzaXplLiAKPj4gSXQgd29ya3MgbGlrZSB0aGlzOgo+Pgo+PiBGVyBidWZmZXJbcGVyaW9kIDAs
IHBlcmlvZCAxLCAuLi5dIDw9PT4gRE1BIDw9PT4gaG9zdC9hbHNhIAo+PiBidWZmZXJbaG9zdF9w
ZXJpb2QgMCwgaG9zdF9wcmlvZCAxLCAuLi5dCj4+Cj4+IFdlIG5lZWQgdGhpcyBob3N0X3ByZWlv
ZF9ieXRlcyBpbmZvcm1hdGlvbiBpbiBGVyB0byBkbyBmYXN0IAo+PiBkcmFpbmluZyhlLmcuIHJl
Y29yZCAyIHNlY29uZHMgZGF0YSB3aXRoaW4gMTBtcykgaW4gbW1hcCBjYXB0dXJlLCB3ZSAKPj4g
YXJlIHNsb3dpbmcgZG93biB0aGUgZHJhaW5pbmcgaW4gc21hbGxlciBob3N0X3BlcmlvZF9ieXRl
cyBjYXNlcywgCj4+IG90aGVyd2lzZSwgYXJlY29yZCBjYW4ndCByZWFkIHRoZSBidWZmZXIgaW4g
dGltZSBhbmQgb3ZlcnJ1biB3aWxsIGhhcHBlbi4KPj4KPj4gTWF5YmUgdGhlIHdvcmRpbmcgInN5
bmNocm9uaXplIiBoZXJlIGlzIGluYWNjdXJhdGUsIGhvdyBhYm91dCAKPj4gc29tZXRoaW5nIGxp
a2UgdGhpczoKPj4KPj4gIkZXIG1pZ2h0IG5lZWQgdG8gdXNlIHRoZSBob3N0X3BlcmlvZF9ieXRl
cyBmaWVsZCB0byBjb25maWd1cmUgYW5kIAo+PiBjb250cm9sIHRoZSBETUEgY29weWluZyBzcGVl
ZCBidXQgdGhlIGRyaXZlciBkb2VzIG5vdC4uLiIKPj4KPiAKPiBIaSwKPiAKPiB3ZSBuZWVkICpo
b3N0X3BlcmlvZF9ieXRlcyAqaW4gRlcgdG8gcHJvcGVybHkgZHJhaW4gZGF0YSAtIGJ5IHByb3Bl
cmx5IEkgCj4gbWVhbiB0byBubyBvdmVycmlkZSBob3N0IGJ1ZmZlciBidXQgaW4gdGhlIHNhbWUg
dGltZSB0byBhdm9pZCBzaXR1YXRpb24gCj4gd2hlbiBob3N0IGlzIHdhaXRpbmcgZm9yIGRhdGEg
YW5kIGRvZXNuJ3QgZ2V0IGl0LiBUaGUgZm9ybWVyIGlzIGtub3duIGFzIAo+ICpvdmVycnVuICp3
aGlsZSB0aGUgbGF0ZXIgKnVuZGVycnVuKiouCj4gKgo+IAo+IFNvIHRoYXQncyB3aHkgSSBvcmln
aW5hbGx5IHVzZWQgdGhlIHdvcmQgKiJ0byBzeW5jaHJvbml6ZSIgKmJlY2F1c2UgaXQgCj4gYmVz
dCByZWZsZWN0cyB0aGUgdXNlIG9mIHRoaXMgdmFyaWFibGUgaW4gRlcuCj4gCj4gKlRoZSBwcm9i
bGVtICotIGhvc3QgZXN0YWJsaXNoZXMgdGhlICpwZXJpb2Rfc2l6ZS8qKmhvc3RfcGVyaW9kX2J5
dGVzIAo+ICphbmQgdXNlcyBpdCBhcyBhICJkYXRhIGNvcHkgdGVtcG8gY29udHJvbGxlciIgbWVh
bmluZyBpdCB3aWxsIGNvcHkgZGF0YSAKPiBidWZmZXJlZCBpbiBpdHMgb3duIGJ1ZmZlciAoY29w
aWVkIHRoZXJlIGJ5IEZXKSBpbiAqcGVyaW9kX3NpemUgKnRpbWUgCj4gaW50ZXJ2YWxzLiBOb3cs
IGluIHJlZ3VsYXIgY29weSAocmVhbCB0aW1lIHN0cmVhbSkgZmlybXdhcmUgZG9lc24ndAo+IAo+
IG5lZWQgdG8gY2FyZSBhYm91dCBob3cgZmFzdCBob3N0IGNvcHkgYmVjYXVzZSB0aGUgaG9zdCBi
dWZmZXIgaXMgYmlnIAo+IGVub3VnaCB0byBzdG9yZSBldmVuIHNldmVyYWwgRlcgcGVyaW9kcyAo
ZWFjaCBvbmUgb3IgZmV3IG1pbGxpc2Vjb25kcykgIAo+IHdpdGhvdXQgb3ZlcnJpZGluZyBpdC4g
VGhhdCBpcyB3aHkgd2UgZGlkIG5vdCBuZWVkIHRoaXMgKnBlcmlvZF9zaXplIAo+ICp2YXJpYWJs
ZSBiZWZvcmUuIEhvd2V2ZXIgdGhlIGRyYWluaW5nIHRhc2sgaXMgdmVyeQo+IAo+IGRpZmZlcmVu
dCBiYWxsIGdhbWUgLSBpdCBjb3BpZXMgKjIsMSBzZWNvbmRzKiBvZiBkYXRhIGFzIGZhc3QgYXMg
Cj4gcG9zc2libGUgdG8gdGhlIGhvc3QuIFRoZXJlZm9yZSB3ZSBhcmUgdmVyeSBwcm9uZSB0byAq
WFJVTnMqCj4gCj4gKlRoZSBzb2x1dGlvbiogLSBpbiBGVyB3ZSBuZWVkIHRvIGtub3cgaG93IG9m
dGVuIGhvc3QgY29waWVzIGRhdGEgb3V0IAo+IGZyb20gaXRzIG93biBidWZmZXIgYW5kIHRoaXMg
aW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIAo+ICpob3N0X3BlcmlvZF9ieXRlcywgKmxldHMgc2Vu
ZCB0aGlzIGluZm9ybWF0aW9uIGRvd24gdG8gZmlybXdhcmUuIE5vdywgCj4gdGhlIEZXIGtub3dp
bmcgdGhpcyBjYW4gZmlsbCB0aGUgaG9zdCBidWZmZXIgYW5kIHdhaXQgdGhlIHRpbWUgCj4gY2Fs
Y3VsYXRlZCBieSAqaG9zdF9wZXJpb2RfYnl0ZXMqCj4gCj4gYmVmb3JlIG5leHQgY29weS4gVGhp
cyB3YXkgd2UgY29weSBhcyBtdWNoL2Zhc3QgYXMgd2UgY2FuIGFuZCBpbiB0aGUgCj4gc2FtZSB0
aW1lIHdlIGFyZSBzYWZlIHRoYXQgaG9zdCB3aWxsIGhhbmRsZSB0aGlzIGFuZCBubyBYUlVOIHdp
bGwgZXZlciAKPiBoYXBwZW4uCgoKV2Uga25ldyBmcm9tIERheTEgdGhhdCBkcmFpbmluZyBmYXN0
ZXIgdGhhbiByZWFsLXRpbWUgY291bGQgcG90ZW50aWFsbHkgCmxlYWQgdG8gdGhlIGRyaXZlciBk
ZXRlY3Rpbmcgb3ZlcmZsb3dzIG9yIHRpbWVvdXRzLiBJdCdzIGJlZW4gZG9jdW1lbnRlZCAKbGVm
dCBhbmQgcmlnaHQsIHdpdGggYW4gYXNzdW1wdGlvbiB0aGF0IHRoZSByaW5nIGJ1ZmZlciBpcyBh
Y3R1YWxseSBiaWcgCmVub3VnaCB0byBjb250YWluIGFsbCB0aGUgZGF0YSBzdG9yZWQgaW4gdGhl
IERTUC4KCkJlZm9yZSBJIHByb3ZpZGUgbW9yZSBmZWVkYmFjaywgY2FuIHlvdSBjbGFyaWZ5IGlm
IHRoZSAKJ2hvc3RfcGVyaW9kX2J5dGVzJyBpcyB0aGUgc2FtZSB2YWx1ZSBhcyB0aGUgQUxTQSBw
ZXJpb2Qgc2l6ZSAoaW4gCmJ5dGVzKT8gQW5kIHdoYXQgd291bGQgYmUgdGhlIHZhbHVlIHdoZW4g
dGhlIG5vX2lycSBtb2RlIGlzIHVzZWQ/Cgo+IAo+IAo+IEhvcGUgaXQgaGVscGVkIHRvIHVuZGVy
c3RhbmQgdGhlIG5lZWQgb2YgKmhvc3RfcGVyaW9kX2J5dGVzICppbiB0aGUgCj4gZmlybXdhcmUu
Cj4gKioKPiAKPiBNYXJjaW4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
