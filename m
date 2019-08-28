Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928AA1E4B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB81516EE;
	Thu, 29 Aug 2019 17:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB81516EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091102;
	bh=Eq9NSrB3vSc2Jj81WbWcw+bICkannrs8TswlB912cHA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TEJUP+/HpDNrC5sjGzEqGw/qEY/6vAQz4yx3hC8+h5sWdlh+fsq6FSFmJMQanK8tv
	 9uHF9CmfeMczKpiKHpdLoRHyNKCVS3GQogCtCLFx3oVMb0tZooUZrMyuNwWNLbp9Kn
	 1HHEhJrYbiVJTYEvePXxUaT5hUyuXppt8/teJPEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED1CF8973E;
	Wed, 28 Aug 2019 11:45:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FAE2F8973E; Wed, 28 Aug 2019 11:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E4AAF8973B
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 11:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E4AAF8973B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 02:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="210108022"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.142.163])
 ([10.237.142.163])
 by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2019 02:45:02 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822120135.13515-1-cezary.rojewski@intel.com>
 <ed82f3b9-92da-dced-2fef-dee92ca67f10@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c9156b17-7e48-cf5b-55f8-ff0fad591e8b@intel.com>
Date: Wed, 28 Aug 2019 11:45:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ed82f3b9-92da-dced-2fef-dee92ca67f10@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Baytrail: Fix implicit
	fallthrough warning
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

T24gMjAxOS0wOC0yMiAxNjowOCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gT24gOC8y
Mi8xOSA3OjAxIEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IFNlcGFyYXRlIF9TVVNQRU5E
IGZyb20gX1BBVVNFX1BVU0ggdG8gZW5zdXJlIGNvZGUgaXMgaGFuZGxlZCBjb3JyZWN0bHkKPj4g
d2hpbGUgZml4aW5nIHdhcm5pbmcgcmVwb3J0ZWQgZHVyaW5nIGNvbXBpbGF0aW9uLgo+Pgo+PiBG
aXhlczogYjgwZDE5YzE2NmM0ICgiQVNvQzogSW50ZWw6IFJlc3RvcmUgQmF5dHJhaWwgQURTUCBz
dHJlYW1zIG9ubHkgCj4+IHdoZW4gQURTUCB3YXMgaW4gcmVzZXQiKQo+PiBTaWduZWQtb2ZmLWJ5
OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Cj4+IC0tLQo+PiDC
oCBzb3VuZC9zb2MvaW50ZWwvYmF5dHJhaWwvc3N0LWJheXRyYWlsLXBjbS5jIHwgMiArKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvaW50ZWwvYmF5dHJhaWwvc3N0LWJheXRyYWlsLXBjbS5jIAo+PiBiL3NvdW5kL3NvYy9p
bnRlbC9iYXl0cmFpbC9zc3QtYmF5dHJhaWwtcGNtLmMKPj4gaW5kZXggOWNiYzk4MmQ0NmE5Li5l
ZGRiMjRhYjgwNzIgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9iYXl0cmFpbC9zc3Qt
YmF5dHJhaWwtcGNtLmMKPj4gKysrIGIvc291bmQvc29jL2ludGVsL2JheXRyYWlsL3NzdC1iYXl0
cmFpbC1wY20uYwo+PiBAQCAtMTkzLDYgKzE5Myw4IEBAIHN0YXRpYyBpbnQgc3N0X2J5dF9wY21f
dHJpZ2dlcihzdHJ1Y3QgCj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sIGludCBjbWQp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BD
TV9UUklHR0VSX1NVU1BFTkQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwZGF0YS0+cmVzdG9yZV9z
dHJlYW0gPSBmYWxzZTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNzdF9ieXRfc3RyZWFtX3BhdXNlKGJ5
dCwgcGNtX2RhdGEtPnN0cmVhbSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPiAKPiB3aHkg
bm90IGp1c3QgYSAvKiBmYWxsdGhyb3VnaCAqLyBzdGF0ZW1lbnQ/Cj4gCgpKdXN0IGEgbWF0dGVy
IG9mIHRhc3RlLiBTZW5kaW5nIHYyIHdpdGggdXBkYXRlLgoKPj4gwqDCoMKgwqDCoCBjYXNlIFNO
RFJWX1BDTV9UUklHR0VSX1BBVVNFX1BVU0g6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzc3RfYnl0
X3N0cmVhbV9wYXVzZShieXQsIHBjbV9kYXRhLT5zdHJlYW0pOwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
