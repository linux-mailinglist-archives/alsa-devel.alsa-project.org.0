Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B37FFD1
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1C816E5;
	Fri,  2 Aug 2019 19:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1C816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564767863;
	bh=VuyEpS4+rtFCIwxlQtV1a5TV/gcCA+KGeykpOYTBKsQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQo2ejDIyt5rKwzdx+WPy5alz8FRdV2DRt7mi3cLrUoQ/f6ZDPo2Mwwd1URgq2iQM
	 wxtI7uyKEcUtHB5qW41CC8ylZWLJXb2Ma1nVwQaSWMSjywPSi8OPXdSoRws93HtwPp
	 WxVmcdUn6gerkiLsABHtBVp4twqpsg9zPXvNe1tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B226DF8049B;
	Fri,  2 Aug 2019 19:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD20F8048F; Fri,  2 Aug 2019 19:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC6DF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC6DF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 10:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,339,1559545200"; d="scan'208";a="181076587"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2019 10:42:31 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id 852B958046F;
 Fri,  2 Aug 2019 10:42:30 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
 <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
 <20190802172843.GC12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f189bd38-32ec-ee7d-e0fa-4de108a18ea2@linux.intel.com>
Date: Fri, 2 Aug 2019 12:42:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802172843.GC12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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

T24gOC8yLzE5IDEyOjI4IFBNLCBWaW5vZCBLb3VsIHdyb3RlOgo+IE9uIDI2LTA3LTE5LCAwOTo0
NiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDcvMjYvMTkgNTozOCBB
TSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gT24gMjAxOS0wNy0yNiAwMTo0MCwgUGllcnJl
LUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4gK3ZvaWQgaW50ZWxfc2h1dGRvd24oc3RydWN0IHNu
ZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0cnVjdCBzZHdf
Y2Ruc19kbWFfZGF0YSAqZG1hOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGRtYSA9IHNuZF9zb2NfZGFp
X2dldF9kbWFfZGF0YShkYWksIHN1YnN0cmVhbSk7Cj4+Pj4gK8KgwqDCoCBpZiAoIWRtYSkKPj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHNuZF9zb2NfZGFp
X3NldF9kbWFfZGF0YShkYWksIHN1YnN0cmVhbSwgTlVMTCk7Cj4+Pj4gK8KgwqDCoCBrZnJlZShk
bWEpOwo+Pj4+ICt9Cj4+Pgo+Pj4gQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBkbyB3ZSBy
ZWFsbHkgbmVlZCB0byBfZ2V0X2RtYV8gaGVyZT8KPj4+IF9zZXRfZG1hXyBzZWVtcyBidWxsZXRw
cm9vZiwgc2FtZSBmb3Iga2ZyZWUuCj4+Cj4+IEkgbXVzdCBhZG1pdCBJIGhhdmUgbm8gaWRlYSB3
aHkgd2UgaGF2ZSBhIHJlZmVyZW5jZSB0byBETUFzIGhlcmUsIHRoaXMgbG9va3MKPj4gbGlrZSBh
biBhYnVzZSB0byBzdG9yZSBhIGRhaS1zcGVjaWZpYyBjb250ZXh0LCBhbmQgdGhlIGluaXRpYWwg
dGVzdCBsb29rcwo+PiBsaWtlIGNvcHktcGFzdGUgdG8gZGV0ZWN0IGludmFsaWQgY29uZmlncywg
YXMgZG9uZSBpbiBvdGhlciBjYWxsYmFja3MuIFZpbm9kCj4+IGFuZCBTYW55b2cgbWlnaHQgaGF2
ZSBtb3JlIGhpc3RvcnkgdGhhbiBtZSBoZXJlLgo+IAo+IEkgZG9udCBzZWUgc25kX3NvY19kYWlf
c2V0X2RtYV9kYXRhKCkgY2FsbCBmb3IKPiBzZHdfY2Ruc19kbWFfZGF0YSBzbyBzb210aGluZyBp
cyBtaXNzaW5nIChhdCBsZWFzdCBpbiB1cHN0cmVhbSBjb2RlKQo+IAo+IElJUkMgd2Ugc2hvdWxk
IGhhdmUgYSBzbmRfc29jX2RhaV9zZXRfZG1hX2RhdGEoKSBpbiBhbGxvYyBvciBzb21lCj4gaW5p
dGlhbGl6YXRpb24gcm91dGluZSBhbmQgd2UgZnJlZSBpdCBoZXJlLi4gU2FueW9nPwoKdGhlIGNv
ZGUgZG9lcyBhIGJ1bmNoIG9mIGdldF9kbWFfZGF0YSgpIGFuZCB0aGlzIHNlZW1zIHRvIHdvcmss
IGJ1dCAKaW5kZWVkIEkgZG9uJ3Qgc2VlIHdoZXJlIHRoZSBfc2V0X2RtYV9kYXRhKCkgaXMgZG9u
ZS4gbWFnaWMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
