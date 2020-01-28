Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF714B321
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC891682;
	Tue, 28 Jan 2020 11:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC891682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580209177;
	bh=LB3zWsvj4nXu3RzKi3OeoNoBlmMmILyvwZ+qwKb8e4I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2wNMruGbT6m9GJ95W3CVqJIQygmCK9z93gLn3TmEcmyzVVW5SmG74fVBSIwf4BPT
	 L096VYO9iP9KHkEgo5jBRKpwTQpbfoBuh1bLiuPDTlfgDbiQ2q81DW3+QPyAgxSfbF
	 OxaOznRrjYj7CMMvYlxLdUzXiVNFgT4LYscYoApA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 879B8F800FF;
	Tue, 28 Jan 2020 11:57:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF8DF80150; Tue, 28 Jan 2020 11:57:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D10A0F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10A0F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="231881381"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 02:57:43 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
 <20200127121243.15813-9-cezary.rojewski@intel.com>
 <bff9507d-c3c3-53b8-3ee2-ce737ebadfee@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f2983031-a0a9-56d2-003b-f751df7224ab@intel.com>
Date: Tue, 28 Jan 2020 11:57:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bff9507d-c3c3-53b8-3ee2-ce737ebadfee@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v2 08/11] ASoC: SOF: Generic probe compress
 operations
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

T24gMjAyMC0wMS0yNyAyMjoxNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL0tjb25maWcgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcK
Pj4gaW5kZXggODI3YjBlYzkyNTIyLi4wZmNhODYxNjQ0NzIgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5k
L3NvYy9zb2YvS2NvbmZpZwo+PiArKysgYi9zb3VuZC9zb2Mvc29mL0tjb25maWcKPj4gQEAgLTE3
MSw2ICsxNzEsMTUgQEAgY29uZmlnIFNORF9TT0NfU09GX0RFQlVHX1JFVEFJTl9EU1BfQ09OVEVY
VAo+PiDCoMKgwqDCoMKgwqDCoCBTYXkgWSBpZiB5b3Ugd2FudCB0byByZXRhaW4gRFNQIGNvbnRl
eHQgZm9yIEZXIGV4Y2VwdGlvbnMuCj4+IMKgwqDCoMKgwqDCoMKgIElmIHVuc3VyZSwgc2VsZWN0
ICJOIi4KPj4gK2NvbmZpZyBTTkRfU09DX1NPRl9ERUJVR19QUk9CRVMKPj4gK8KgwqDCoCBib29s
ICJTT0YgZW5hYmxlIGRhdGEgcHJvYmluZyIKPj4gK8KgwqDCoCBzZWxlY3QgU05EX1NPQ19DT01Q
UkVTUwo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgVGhpcyBvcHRpb24gZW5hYmxlcyB0
aGUgZGF0YSBwcm9iaW5nIGZlYXR1cmUgdGhhdCBjYW4gYmUgdXNlZCB0bwo+PiArwqDCoMKgwqDC
oCBnYXRoZXIgZGF0YSBkaXJlY3RseSBmcm9tIHNwZWNpZmljIHBvaW50cyBvZiB0aGUgYXVkaW8g
cGlwZWxpbmUuCj4+ICvCoMKgwqDCoMKgIFNheSBZIGlmIHlvdSB3YW50IHRvIGVuYWJsZSBwcm9i
ZXMuCj4+ICvCoMKgwqDCoMKgIElmIHVuc3VyZSwgc2VsZWN0ICJOIi4KPj4gKwo+PiDCoCBlbmRp
ZiAjIyBTTkRfU09DX1NPRl9ERUJVRwo+PiDCoCBlbmRpZiAjIyBTTkRfU09DX1NPRl9ERVZFTE9Q
RVJfU1VQUE9SVAo+IAo+IHdlIG5lZWQgdG8gYWdyZWUgd2l0aCBmaXJtd2FyZSBmb2xrcyBvbgo+
IGEpIG1ha2luZyBzdXJlIHRoZSBwcm9iZXMgYXJlIGVuYWJsZWQgb24gYWxsIFNLTCsgZmlybXdh
cmUKPiBiKSB3ZSBoYXZlIGEgbWVhbnMgdG8gZGV0ZWN0IGlmIHByb2JlcyBhcmUgc3VwcG9ydGVk
IGJ5IHRoZSBmaXJtd2FyZS4KPiAKPiBJIHRoaW5rIHRoZSBwcm9iZXMgc2hvdWxkIGJlIGVuYWJs
ZWQgaW4gYWxsIGRpc3RyaWJ1dGlvbnMsIGV2ZW4gd2hlbiAKPiB1c2luZyBmaXJtd2FyZSBzaWdu
ZWQgd2l0aCBhIHByb2R1Y3Rpb24ga2V5LCBpdCBkb2Vzbid0IGltcGFjdCBhbnl0aGluZyAKPiB1
bnRpbCB0aGUgcm9vdCB1c2VyIGV4cGxpY2l0bHkgY29uZmlndXJlcyBwcm9iZSBwb2ludHMuCj4g
Cj4gU2luY2Ugd2UgZXhwbGljaXRseSBhZHZpc2UgZGlzdHJpYnV0aW9ucyBub3QgdG8gaW5jbHVk
ZSBkZXZlbG9wZXIgCj4gb3B0aW9ucywgd2UgcHJvYmFibHkgbmVlZCB0byBtb3ZlIHRoaXMgS2Nv
bmZpZyBvdXRzaWRlLiBvZiB0aGVzZSB0d28gCj4gJ2lmJyBibG9ja3MuCgpJbmRlZWQsIG5vdyBp
dCdzIEZXIGZvbGtzIHRpbWUgdG8gYWN0LgoKTW92ZWQgb3V0c2lkZSBvZiBfREVWRUxPUEVSX1NV
UFBPUlQgYmxvY2sgYXMgcmVxdWVzdGVkLiBMZWZ0IHRoZSBfREVCVUdfIAp0YWcgdG8gbm90aWZ5
IHVzZXIgYWJvdXQgcHJvYmUgYmVpbmcgYSBkZWJ1ZyBmZWF0dXJlLiBPbmNlIHRoZSAKX0RFVkVM
T1BFUl9TVVBQT1JUIC8gX0RFQlVHIGZlYXR1cmVzIGFyZSBzb3J0ZWQgb3V0LCB0aGlzIHdpbGwg
YmUgCnJlbG9jYXRlZCB1bmRlciBfREVCVUcgYmxvY2sgYWdhaW4uCgpBcyBzdGF0ZWQgaW4gcGF0
Y2ggMDcsICdleHRyYWN0b3Jfc3RyZWFtX3RhZycgZGVjbGFyYXRpb24gaGFzIGJlZW4gCnJlbG9j
YXRlZCBpbnRvIHRoaXMgdmVyeSBwYXRjaCBhcyBpdCBzaG91bGQgYmUgZnJvbSB0aGUgZ2V0LWdv
LgoKVGhhbmtzLApDemFyZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
