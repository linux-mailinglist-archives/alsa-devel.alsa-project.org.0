Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D79DC14A3C7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 13:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECCA15E5;
	Mon, 27 Jan 2020 13:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECCA15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580127931;
	bh=h121Jh6gZC8+nVfZLCETAda3TnT6iDImJTO4lnVWwcc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1yNSvoOT3yfKh7cysY8zmiQ9uRhM9F2ReKW2qzEBneiD4mnaA0DRSoI365rNWXTB
	 AQvuVIkU+DjJUEBoThN5A63ku5pduL5O8UO2zdJRWUCHl1P6zOIwvMgShdy7Z+smSX
	 dqI7ToQDWDYUKwwr/Xf5MpmPu8ztdoXsdp8WRRqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C3CCF80218;
	Mon, 27 Jan 2020 13:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8A3F8021E; Mon, 27 Jan 2020 13:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 341E0F80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 13:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341E0F80085
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 04:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="223228636"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 04:23:40 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-9-cezary.rojewski@intel.com>
 <88fbdc86-01ce-eb44-5523-fc989c0556fe@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <bc602684-8f6c-27a5-52dc-a54ad671c51f@intel.com>
Date: Mon, 27 Jan 2020 13:23:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <88fbdc86-01ce-eb44-5523-fc989c0556fe@linux.intel.com>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 08/12] ASoC: SOF: Generic probe compress
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

T24gMjAyMC0wMS0yNCAyMDo0MSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+ICtj
b25maWcgU05EX1NPQ19TT0ZfREVCVUdfUFJPQkVTCj4+ICvCoMKgwqAgYm9vbCAiU09GIGVuYWJs
ZSBkYXRhIHByb2JpbmciCj4+ICvCoMKgwqAgc2VsZWN0IFNORF9TT0NfQ09NUFJFU1MKPj4gK8Kg
wqDCoCBoZWxwCj4+ICvCoMKgwqDCoMKgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIGRhdGEgcHJv
YmluZyBmZWF0dXJlIHRoYXQgY2FuIGJlIHVzZWQgdG8KPj4gK8KgwqDCoMKgwqAgZ2F0aGVyIGRh
dGEgZGlyZWN0bHkgZnJvbSBzcGVjaWZpYyBwb2ludHMgb2YgdGhlIGF1ZGlvIHBpcGVsaW5lLgo+
PiArwqDCoMKgwqDCoCBTYXkgWSBpZiB5b3Ugd2FudCB0byBlbmFibGUgcHJvYmVzLgo+PiArwqDC
oMKgwqDCoCBJZiB1bnN1cmUsIHNlbGVjdCAiTiIuCj4+ICsKPj4gwqAgZW5kaWYgIyMgU05EX1NP
Q19TT0ZfREVCVUcKPj4gwqAgZW5kaWYgIyMgU05EX1NPQ19TT0ZfREVWRUxPUEVSX1NVUFBPUlQK
PiAKPiBUaGlzIG9uZSBpcyBpbnRlcmVzdGluZy4KPiAKPiBEbyB3ZSB3YW50IHRvIGxpbWl0IHRo
ZSBQUk9CRVMgdG8gZGV2ZWxvcGVycz8gT3IgZG8gd2Ugd2FudCB0byBlbmFibGUgCj4gcHJvYmVz
IG9uIHByb2R1Y3Rpb24gZmlybXdhcmUgYXMgd2VsbCAtIHdoaWNoIGNvdWxkIGJlIHJlYWxseSB1
c2VmdWwgZm9yIAo+IHBlb3BsZSB0dW5pbmcgc3R1ZmYgb24gcGxhdGZvcm0gdXNpbmcgcHJvZHVj
dGlvbiBrZXlzLCBpLmUuIHdpdGhvdXQgdGhlIAo+IGFiaWxpdHkgdG8gcmUtZ2VuZXJhdGUgdGhl
IGZpcm13YXJlIG9uIHRoZWlyIG93bi4KPiAKPiBBbmQgaWYgdGhlIGZpcm13YXJlIGRvZXMgbm90
IGluY2x1ZGUgc3VwcG9ydCBmb3IgcHJvYmVzLCB3ZSBzaG91bGQgCj4gZGV0ZWN0IGl0IGFuZCBJ
IGRpZG4ndCBzZWUgYW55dGhpbmcgaW4gdGhpcyBzZXJpZXMgdGhhdCBjaGVja3MgdGhpcyAKPiBj
YXBhYmlsaXR5PyBBbmQgaWYgdGhlIGZpcm13YXJlIGRvZXMgbm90IHJlcG9ydCBpdCB0aGVuIGl0
J3MgYSBtaXNzIGluIAo+IHRoZSBkZXNpZ24uCgpUaGUgb25seSBjb25maWcgSSBjYXJlZCBhYm91
dCBpczogX0RFQlVHIGFzIHByb2JlcyBhcmUgYSBkZWJ1ZyBmZWF0dXJlLiAKU2luY2UgdGhlIF9E
RVZFTE9QRVJfU1VQUE9SVCBpcyBhIHN1cGVyc2V0IG9mIGRlYnVnIGFuZCBzZXZlcmFsIG90aGVy
IApmZWF0dXJlcywgaXQncyBvYnZpb3VzIGl0IGVuZGVkIHVwIGFzIGEgcmVxdWlyZW1lbnQuCgpD
emFyZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
