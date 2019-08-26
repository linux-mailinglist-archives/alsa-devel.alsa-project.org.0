Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA639D616
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9CCE16D0;
	Mon, 26 Aug 2019 20:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9CCE16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566845887;
	bh=cVs8tXDFAEfLa4KuIAnU+8nsO5L8QgpwNnGlBFO6yUg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EcUb0co/aScupkinUL+cGXjRe+Bml3BMhE4IJZkPOSwo0mzomwI2vbd8Aib5TRhOY
	 atOR0UmC9V0iVPgknmxpIChvB6upJYcnPC3LKoTH/FjIeCIJ8pfeTZF5cuGux25FaF
	 9bm/YTB7XDWAJXVXzLAy2nB0me64zEPgYc1ROgMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF08F805E2;
	Mon, 26 Aug 2019 20:55:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ADAEF80390; Mon, 26 Aug 2019 20:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B82F80377
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B82F80377
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 11:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="185044421"
Received: from dmitra-mobl.amr.corp.intel.com (HELO [10.252.138.53])
 ([10.252.138.53])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 11:55:22 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-5-cezary.rojewski@intel.com>
 <90bbda82-3988-d02d-0d5d-e63890db81dc@linux.intel.com>
 <20fea187-8a0c-c293-bbcb-e8561193bc2f@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d51a0703-4a1d-e667-e29b-a4017de0a38e@linux.intel.com>
Date: Mon, 26 Aug 2019 11:31:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20fea187-8a0c-c293-bbcb-e8561193bc2f@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 04/35] ASoC: Intel: Skylake: Unify firmware
 loading mechanism
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

CgpPbiA4LzI0LzE5IDQ6MzQgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTIzIDIwOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4+IC1pbnQgc2tsX3Nz
dF9pbml0X2Z3KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNrbF9kZXYgKnNrbCkKPj4+ICtp
bnQgc2tsX3NzdF9pbml0X2Z3KHN0cnVjdCBza2xfZGV2ICpza2wpCj4+PiDCoCB7Cj4+PiAtwqDC
oMKgIGludCByZXQ7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBzc3RfZHNwICpzc3QgPSBza2wtPmRz
cDsKPj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gc2tsLT5kZXY7Cj4+PiArwqDCoMKg
IGludCAoKmxwX2NoZWNrKShzdHJ1Y3Qgc3N0X2RzcCAqZHNwLCBib29sIHN0YXRlKTsKPj4+ICvC
oMKgwqAgaW50IHJldDsKPj4+ICsKPj4+ICvCoMKgwqAgbHBfY2hlY2sgPSBza2wtPmlwYy5vcHMu
Y2hlY2tfZHNwX2xwX29uOwo+Pj4gK8KgwqDCoCBza2wtPmVuYWJsZV9taXNjYmRjZ2UoZGV2LCBm
YWxzZSk7Cj4+PiArwqDCoMKgIHNrbC0+Y2xvY2tfcG93ZXJfZ2F0aW5nKGRldiwgZmFsc2UpOwo+
Pj4gwqDCoMKgwqDCoCByZXQgPSBzc3QtPmZ3X29wcy5sb2FkX2Z3KHNzdCk7Cj4+PiDCoMKgwqDC
oMKgIGlmIChyZXQgPCAwKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJM
b2FkIGJhc2UgZncgZmFpbGVkIDogJWRcbiIsIHJldCk7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGV4aXQ7Cj4+PiArwqDCoMKgIH0KPj4+
ICsKPj4+ICvCoMKgwqAgaWYgKCFza2wtPmlzX2ZpcnN0X2Jvb3QpCj4+PiArwqDCoMKgwqDCoMKg
wqAgZ290byBsaWJyYXJ5X2xvYWQ7Cj4+PiArwqDCoMKgIC8qIERpc2FibGUgcG93ZXIgY2hlY2sg
ZHVyaW5nIGNmZyBzZXR1cCAqLwo+Pj4gK8KgwqDCoCBza2wtPmlwYy5vcHMuY2hlY2tfZHNwX2xw
X29uID0gTlVMTDsKPj4KPj4gSXQncyB2ZXJ5IG9kZCB0byBwbGF5IHdpdGggLm9wcyBjYWxsYmFj
ayBkeW5hbWljYWxseS4gVXN1YWxseSBvcHMgYXJlIAo+PiBjb25zdGFudCwgYW5kIGlmIHlvdSB3
YW50IHRvIGRpc2FibGUgdGhlbSB5b3UgYWRkIGEgZmxhZy4KPj4KPiAKPiBZZXllLCBrZWVuIGV5
ZSEgQ2FuJ3QgZG8gZXZlcnl0aGluZyBhdCBvbmNlIHRob3VnaCA6Lwo+IFRoZSBwb3dlciBjaGVj
ayBpcyBBUEwrIHNwZWNpZmljIGFuZCBzaG91bGQgbm90IGJlIHBhcnQgb2YgZ2VuZXJpYyBpcGMg
Cj4gZnJhbWV3b3JrIGF0IGFsbCAoZm91bmQgaW4gL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0
LWlwYy5jKS4gRGlmZmVyZW50IAo+IGZhdGUgYXdhaXRzIHNhaWQgY2hlY2suIEZvciBub3csIGlu
IHRoaXMgc2luZ2xlIGNhc2UgaXQgc2VlbXMgYmVzdCB0byAKPiBzaW1wbHkgZGlzYWJsZSB0aGUg
Y2hlY2sgYW5kIHJlYXBwbHkgaXQgb25jZSBzZXR1cCBpcyBkb25lLgoKV2hhdCdzIHRoZSBkaWZm
ZXJlbmNlIHdpdGggaGF2aW5nIHRoaXMgY2FsbGJhY2sgZG8gbm90aGluZyBmb3IgQVBMLT8KCj4g
Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IHNrbF9pcGNfZndfY2ZnX2dldCgmc2tsLT5pcGMsICZz
a2wtPmZ3X2NmZyk7Cj4+PiArwqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGZ3IGNmZzogJWRcbiIsIHJldCk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgZ290byBleGl0Owo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKg
IHJldCA9IHNrbF9pcGNfaHdfY2ZnX2dldCgmc2tsLT5pcGMsICZza2wtPmh3X2NmZyk7Cj4+PiAr
wqDCoMKgIGlmIChyZXQgPCAwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gZ2V0IGh3IGNmZzogJWRcbiIsIHJldCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZ290
byBleGl0Owo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgIHNrbF9kc3BfaW5pdF9jb3Jl
X3N0YXRlKHNzdCk7Cj4+PiArbGlicmFyeV9sb2FkOgo+Pj4gwqDCoMKgwqDCoCBpZiAoc2tsLT5s
aWJfY291bnQgPiAxKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3N0LT5md19vcHMu
bG9hZF9saWJyYXJ5KHNzdCwgc2tsLT5saWJfaW5mbywKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNrbC0+bGliX2NvdW50KTsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihkZXYsICJMb2FkIExpYnJhcnkgZmFpbGVkIDogJXhcbiIsIHJldCk7Cj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICJMb2FkIGxpYnJhcnkgZmFpbGVkIDogJXhcbiIsIHJldCk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGV4aXQ7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
fQo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDCoMKgIHNrbC0+aXNfZmlyc3RfYm9v
dCA9IGZhbHNlOwo+Pj4gK2V4aXQ6Cj4+PiArwqDCoMKgIHNrbC0+aXBjLm9wcy5jaGVja19kc3Bf
bHBfb24gPSBscF9jaGVjazsKPj4+ICvCoMKgwqAgc2tsLT5lbmFibGVfbWlzY2JkY2dlKGRldiwg
dHJ1ZSk7Cj4+PiArwqDCoMKgIHNrbC0+Y2xvY2tfcG93ZXJfZ2F0aW5nKGRldiwgdHJ1ZSk7Cj4+
PiAtwqDCoMKgIHJldHVybiAwOwo+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqAgfQo+Pj4g
wqAgRVhQT1JUX1NZTUJPTF9HUEwoc2tsX3NzdF9pbml0X2Z3KTsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
