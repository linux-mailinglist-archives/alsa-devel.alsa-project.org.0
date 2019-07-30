Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F37A5EA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 12:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BF9717F7;
	Tue, 30 Jul 2019 12:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BF9717F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564482283;
	bh=WVmowaix8UzgIeNj12/F0As/iZAecfzuYUrSQ/9lD6g=;
	h=References:To:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EIVwXthwO93rQe5jbLqspVr+aXbK+4aeWU0amDet4hGCvXU8YlROGnuPAm2IoOWvf
	 CEdtMGnhVU4M2eG+EGy9DCWkjPXLF0hLz9QbfWUYOCDWGs8xrs6eGI1jW7Xy7L3R8Q
	 hAId0dZ1PIwEZWnazflq17VeqOmQl7VX87rPKozY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA641F80506;
	Tue, 30 Jul 2019 12:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA1AF804FD; Tue, 30 Jul 2019 12:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04618F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 12:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04618F800AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 03:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="370903133"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.237.142.227])
 ([10.237.142.227])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2019 03:22:37 -0700
References: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
To: alsa-devel@alsa-project.org, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 marcin.rajwa@intel.com, kai.vehmanen@linux.intel.com
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
X-Forwarded-Message-Id: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
Message-ID: <a1387cbf-9e1b-9d13-52ad-25985dd84a7a@linux.intel.com>
Date: Tue, 30 Jul 2019 12:22:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
Content-Language: en-US
Subject: [alsa-devel] [PATCH v4 2/2] ASoC: SOF: Intel: fix reset of
	host_period_bytes
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

RnJvbTogTWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgoKVGhpcyBw
YXRjaCBwcmV2ZW50cyB0aGUgcmVzZXQgb2YgaG9zdCBwZXJpb2QgYnl0ZXMKYW5kIHVzZXMgbm9f
c3RyZWFtX3Bvc2l0aW9uIHRvIHJlY29yZCByZXF1ZXN0cwpmb3Igc3RyZWFtIHBvc2l0aW9uLgoK
U2lnbmVkLW9mZi1ieTogTWFyY2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IFJhbmphbmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51eC5pbnRl
bC5jb20+Ci0tLQogwqBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1wY20uYyB8IDQgKystLQogwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLXBjbS5jIGIvc291bmQvc29jL3NvZi9pbnRlbC9o
ZGEtcGNtLmMKaW5kZXggOWI3MzBmMTgzNTI5Li45NTY0MDdjZjU5ZWEgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy9zb2YvaW50ZWwvaGRhLXBjbS5jCisrKyBiL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRh
LXBjbS5jCkBAIC0xMTYsOSArMTE2LDkgQEAgaW50IGhkYV9kc3BfcGNtX2h3X3BhcmFtcyhzdHJ1
Y3Qgc25kX3NvZl9kZXYgKnNkZXYsCiDCoMKgwqAgwqAvKiBkaXNhYmxlIFNQSUIsIHRvIGVuYWJs
ZSBidWZmZXIgd3JhcCBmb3Igc3RyZWFtICovCiDCoMKgwqAgwqBoZGFfZHNwX3N0cmVhbV9zcGli
X2NvbmZpZyhzZGV2LCBzdHJlYW0sIEhEQV9EU1BfU1BJQl9ESVNBQkxFLCAwKTsKCi3CoMKgIMKg
Lyogc2V0IGhvc3RfcGVyaW9kX2J5dGVzIHRvIDAgaWYgbm8gSVBDIHBvc2l0aW9uICovCivCoMKg
IMKgLyogdXBkYXRlIG5vX3N0cmVhbV9wb3NpdGlvbiBmbGFnIGZvciBpcGMgcGFyYW1zICovCiDC
oMKgwqAgwqBpZiAoaGRhICYmIGhkYS0+bm9faXBjX3Bvc2l0aW9uKQotwqDCoCDCoMKgwqAgwqBp
cGNfcGFyYW1zLT5ob3N0X3BlcmlvZF9ieXRlcyA9IDA7CivCoMKgIMKgwqDCoCDCoGlwY19wYXJh
bXMtPm5vX3N0cmVhbV9wb3NpdGlvbiA9IDE7CgogwqDCoMKgIMKgaXBjX3BhcmFtcy0+c3RyZWFt
X3RhZyA9IGhzdHJlYW0tPnN0cmVhbV90YWc7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
