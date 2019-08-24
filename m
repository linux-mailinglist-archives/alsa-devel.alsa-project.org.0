Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FC9BCE4
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 12:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61BF1677;
	Sat, 24 Aug 2019 11:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61BF1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566640823;
	bh=Unvowc5THD+zeJfB1AF/zKETVbevaAft3cMeo71jsp4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0CrHiN3vuU0SJyy5Kyt21pjDni360Z06vZMlt4oX+9+gDMqCOWlatBl922NRLivI
	 SLug07x+lJcynnA6NFgu+IH43G4qz1JRzSafeTusx4DfC2JwRCzSSd5WFnOH8y8Zx6
	 1PQgLPTVhlB1x5paGApTcZAVofCL9zH/7sQ8FzJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C98F803D5;
	Sat, 24 Aug 2019 11:58:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5843EF803D5; Sat, 24 Aug 2019 11:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADFC7F80391
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 11:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADFC7F80391
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 02:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,424,1559545200"; d="scan'208";a="180906216"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 02:58:33 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-22-cezary.rojewski@intel.com>
 <30929d7b-787d-3b6e-d806-02487b85ab8d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c9c7b4a2-b50a-697e-e4f3-8c5426a7f2d7@intel.com>
Date: Sat, 24 Aug 2019 11:58:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30929d7b-787d-3b6e-d806-02487b85ab8d@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 21/35] ASoC: Intel: Expose ACPI loading
 members
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

T24gMjAxOS0wOC0yMyAyMTozMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1kc3AuaCAKPj4gYi9zb3VuZC9z
b2MvaW50ZWwvY29tbW9uL3NzdC1kc3AuaAo+PiBpbmRleCA2M2MyOWJiNDVjZjEuLmEyYWM3OTk4
ZmJkYiAxMDA2NDQKPj4gLS0tIGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtZHNwLmgKPj4g
KysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtZHNwLmgKPj4gQEAgLTE2Niw2ICsxNjYs
MjcgQEAKPj4gwqAgI2RlZmluZSBTU1RfUE1DU19QU19NQVNLwqDCoMKgIDB4Mwo+PiDCoCBzdHJ1
Y3Qgc3N0X2RzcDsKPj4gK3N0cnVjdCBwbGF0Zm9ybV9kZXZpY2U7Cj4gCj4gdGhhdCBzaG91bGQg
YmUgaGFuZGxlZCB3aXRoIGFuIGluY2x1ZGUsIG5vdCByZWRlZmluaW5nIGEgdHlwZSBoZXJlLgo+
IAoKQWNrLgoKPj4gKwo+PiArLyogRGVzY3JpcHRvciBmb3Igc2V0dGluZyB1cCBTU1QgcGxhdGZv
cm0gZGF0YSAqLwo+PiArc3RydWN0IHNzdF9hY3BpX2Rlc2Mgewo+PiArwqDCoMKgIGNvbnN0IGNo
YXIgKmRydl9uYW1lOwo+PiArwqDCoMKgIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCAqbWFjaGlu
ZXM7Cj4+ICvCoMKgwqAgLyogUGxhdGZvcm0gcmVzb3VyY2UgaW5kZXhlcy4gTXVzdCBzZXQgdG8g
LTEgaWYgbm90IHVzZWQgKi8KPj4gK8KgwqDCoCBpbnQgcmVzaW5kZXhfbHBlX2Jhc2U7Cj4+ICvC
oMKgwqAgaW50IHJlc2luZGV4X3BjaWNmZ19iYXNlOwo+PiArwqDCoMKgIGludCByZXNpbmRleF9m
d19iYXNlOwo+PiArwqDCoMKgIGludCBpcnFpbmRleF9ob3N0X2lwYzsKPj4gK8KgwqDCoCBpbnQg
cmVzaW5kZXhfZG1hX2Jhc2U7Cj4+ICvCoMKgwqAgLyogVW5pcXVlIG51bWJlciBpZGVudGlmeWlu
ZyB0aGUgU1NUIGNvcmUgb24gcGxhdGZvcm0gKi8KPj4gK8KgwqDCoCBpbnQgc3N0X2lkOwo+PiAr
wqDCoMKgIC8qIERNQSBvbmx5IHZhbGlkIHdoZW4gcmVzaW5kZXhfZG1hX2Jhc2UgIT0gLTEqLwo+
PiArwqDCoMKgIGludCBkbWFfZW5naW5lOwo+PiArwqDCoMKgIGludCBkbWFfc2l6ZTsKPj4gK307
Cj4+ICsKPj4gK2ludCBzc3RfYWNwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KTsKPj4gK2ludCBzc3RfYWNwaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldik7
Cj4+IMKgIC8qCj4+IMKgwqAgKiBTU1QgUGxhdGZvcm0gRGF0YS4KPj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
