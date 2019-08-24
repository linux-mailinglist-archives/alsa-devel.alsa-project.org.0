Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA79BD27
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 12:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6771166E;
	Sat, 24 Aug 2019 12:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6771166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566644040;
	bh=kmYd4dUaLx0FYcqmYUVC1X46Me2X5dzEJV5ZOU1+sjI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7G1SifLa6OFRbfEJ7tdWDQ9MF1wFykUmJlFxuw/UeniPN/QIez0nYChAi7P5HyO1
	 FEQVhpF1OmhdNxZN4Q1g6ET3YEF0YnrRMuI/L3Z9vnpxPDrXItoqbOHbZ8HzaNuzyU
	 iU55EM3TB66mxfjHDYXPBQhZV4hiUSrsyn3/vPE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5020F80391;
	Sat, 24 Aug 2019 12:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC560F80391; Sat, 24 Aug 2019 12:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68BF9F8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 12:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68BF9F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 03:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180912236"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 03:52:36 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-12-cezary.rojewski@intel.com>
 <4ecd54e1-a7c1-fec9-3487-9b0ef8442293@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <70b4b3b3-0595-2ead-105b-02da405c64a4@intel.com>
Date: Sat, 24 Aug 2019 12:52:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4ecd54e1-a7c1-fec9-3487-9b0ef8442293@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 11/35] ASoC: Intel: Merge sst_dsp_device
 into sst_pdata
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

T24gMjAxOS0wOC0yMyAyMDo1NCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+IEBA
IC0yMDMsMTMgKzE5MiwxNSBAQCBzdHJ1Y3Qgc3N0X3BkYXRhIHsKPj4gwqDCoMKgwqDCoCAvKiBE
U1AgKi8KPj4gwqDCoMKgwqDCoCB1MzIgaWQ7Cj4+ICvCoMKgwqAgY29uc3QgY2hhciAqZndfbmFt
ZTsKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3N0X29wcyAqb3BzOwo+PiArwqDCoMKgIHN0cnVjdCBzbmRf
c29jX2FjcGlfbWFjaCAqYm9hcmRzOwo+PiDCoMKgwqDCoMKgIHZvaWQgKmRzcDsKPj4gwqAgfTsK
PiAKPiBZb3UgYWxyZWFkeSBoYXZlIHRoZSBmd19uYW1lIGluc2lkZSBvZiBzdHJ1Y3Qgc25kX3Nv
Y19hY3BpX21hY2g6CgpJJ2xsIGNvbWUgYmFjayB0byB0aGF0IGxhdGVyLgpTZWUgUEFUQ0ggMjcv
MzUgYW5kIFVMTCBleGFtcGxlLgoKPiAKPiAvKiBEZXNjcmlwdG9yIGZvciBTU1QgQVNvQyBtYWNo
aW5lIGRyaXZlciAqLwo+IHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCB7Cj4gIMKgwqDCoMKgY29u
c3QgdTggaWRbQUNQSV9JRF9MRU5dOwo+ICDCoMKgwqDCoGNvbnN0IGNoYXIgKmRydl9uYW1lOwo+
ICDCoMKgwqDCoGNvbnN0IGNoYXIgKmZ3X2ZpbGVuYW1lOwo+ICDCoMKgwqDCoGNvbnN0IGNoYXIg
KmJvYXJkOwo+ICDCoMKgwqDCoHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCAqICgqbWFjaGluZV9x
dWlyaykodm9pZCAqYXJnKTsKPiAgwqDCoMKgwqBjb25zdCB2b2lkICpxdWlya19kYXRhOwo+ICDC
oMKgwqDCoHZvaWQgKnBkYXRhOwo+ICDCoMKgwqDCoHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaF9w
YXJhbXMgbWFjaF9wYXJhbXM7Cj4gIMKgwqDCoMKgY29uc3QgY2hhciAqc29mX2Z3X2ZpbGVuYW1l
Owo+ICDCoMKgwqDCoGNvbnN0IGNoYXIgKnNvZl90cGxnX2ZpbGVuYW1lOwo+IH07Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
