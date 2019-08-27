Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E9A1CAD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333011669;
	Thu, 29 Aug 2019 16:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333011669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088878;
	bh=/1aHlYmhxg56yp7+Tli/Jcd8gIDnq5nnuvuvdT8MLHE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+zK1nosE1kR27w+B+Sk0f0Gk4ylxzvNhD8Zf6cOMlU4bt9Y3alG8iPYo/CXYOnKJ
	 uGxuhq7B9OK/O4F5BjE8Ucg2s9FEgis2dbHSjrtzuQ0Swjpun91CKj5OWFCQgGJT0c
	 0FIAqa9IOv3135pJL1xSxAFowAtCm97N9/fGEIOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210D2F8060F;
	Tue, 27 Aug 2019 21:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA95F8060E; Tue, 27 Aug 2019 21:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B34F805FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B34F805FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 12:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="171296979"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.27.63])
 ([10.252.27.63])
 by orsmga007.jf.intel.com with ESMTP; 27 Aug 2019 12:18:38 -0700
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
 <20190827141712.21015-3-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a1ce2e69-d93a-93e8-8bbf-07c27e52124f@intel.com>
Date: Tue, 27 Aug 2019 21:18:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827141712.21015-3-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/6] ASoC: Intel: Fix use of potentially
 uninitialized variable
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

T24gMjAxOS0wOC0yNyAxNjoxNywgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4gRnJvbTog
QW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29tPgo+IAo+
IElmIGlwYy0+b3BzLnJlcGx5X21zZ19tYXRjaCBpcyBOVUxMLCB3ZSBtYXkgZW5kIHVwIHVzaW5n
IHVuaW5pdGlhbGl6ZWQKPiBtYXNrIHZhbHVlLgo+IAo+IHJlcG9ydGVkIGJ5IHNtYXRjaDoKPiBz
b3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuYzoyNjYgc3N0X2lwY19yZXBseV9maW5kX21z
ZygpIGVycm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAnbWFzaycuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29tPgo+
IC0tLQo+ICAgc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMgfCAyICsrCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc3N0LWlwYy5jIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMK
PiBpbmRleCAxMTg2YTAzYTg4ZDYuLjYwNjhiYjY5N2UyMiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9z
b2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuYwo+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24v
c3N0LWlwYy5jCj4gQEAgLTIyMyw2ICsyMjMsOCBAQCBzdHJ1Y3QgaXBjX21lc3NhZ2UgKnNzdF9p
cGNfcmVwbHlfZmluZF9tc2coc3RydWN0IHNzdF9nZW5lcmljX2lwYyAqaXBjLAo+ICAgCj4gICAJ
aWYgKGlwYy0+b3BzLnJlcGx5X21zZ19tYXRjaCAhPSBOVUxMKQo+ICAgCQloZWFkZXIgPSBpcGMt
Pm9wcy5yZXBseV9tc2dfbWF0Y2goaGVhZGVyLCAmbWFzayk7Cj4gKwllbHNlCj4gKwkJbWFzayA9
ICh1NjQpLTE7CgpQbGVhc2Ugc2VlIGxpbnV4L2xpbWl0cy5oIGFuZCBjaGVjayBpZiB0aGlzIGNh
bid0IGJlIHJlcGxhY2VkIGJ5IGFuIAplcXVpdmFsZW50IGZvdW5kIHRoZXJlLgoKPiAgIAo+ICAg
CWlmIChsaXN0X2VtcHR5KCZpcGMtPnJ4X2xpc3QpKSB7Cj4gICAJCWRldl9lcnIoaXBjLT5kZXYs
ICJlcnJvcjogcnggbGlzdCBlbXB0eSBidXQgcmVjZWl2ZWQgMHglbGx4XG4iLAo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
