Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41A128189
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 18:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FFB6852;
	Fri, 20 Dec 2019 18:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FFB6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576863609;
	bh=9eCa4jmglCVll8AssVlFpV5G8HzyFacLPd8Bc3C34fY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFfxfhSzUHi1IGgeph/8LfSw4pSdHkls1/y6Wv5wAME71PJBiujULI+xAr1t2T8Nk
	 yJW/Exi8/BUJQ9QVBlUZtRR4Me5YUhuAVtUbrOtnNiTt5wvwbvcVhhiD9BPwSPEAGa
	 v3W32ZkrmFIqCXuS7DNRzmyzMEJyksxszexbt6rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00781F8014F;
	Fri, 20 Dec 2019 18:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E149AF8015A; Fri, 20 Dec 2019 18:38:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA30F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 18:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA30F8014C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 09:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; d="scan'208";a="248757290"
Received: from jpsavari-mobl1.amr.corp.intel.com (HELO [10.251.148.209])
 ([10.251.148.209])
 by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2019 09:38:16 -0800
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
 <20191220115629.8293-3-srinivas.kandagatla@linaro.org>
 <052d527b-77a5-172e-2b18-ca635242b440@linux.intel.com>
 <30c40a3b-2d70-b1a2-117b-63f0ece65cef@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5205e403-f4ec-0850-b813-d5250d121377@linux.intel.com>
Date: Fri, 20 Dec 2019 11:38:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <30c40a3b-2d70-b1a2-117b-63f0ece65cef@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH v10 2/2] ASoC: codecs: add wsa881x
 amplifier support
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

Cj4+IEVuYWJsaW5nIHRoZSBzdHJlYW0gd2lsbCBjYXVzZSBhIGJhbmsgc3dpdGNoIGFuZCAoemVy
bz8pIGRhdGEgdG8gYmUgCj4+IHRyYW5zbWl0dGVkLCBpcyB0aGlzIGludGVudGlvbmFsPwo+Pgo+
IEkgZ3Vlc3MgWWVzIQo+IE15c2VsZiBhbmQgVmlub2Qgc3BlbnQgZmV3IHdlZWtzIHVuZGVyc3Rh
bmRpbmcgdGhlIGF1ZGlvIGdsaXRjaGVzIGlmIHdlIAo+IGVuYWJsZSBQQSBiZWZvcmUgc291bmR3
aXJlIHBvcnRzLCBhbmQgZmluYWxseSBodyBndXlzIGNhbWUgaW4gd2l0aCB0aGlzIAo+IGluZm9y
bWF0aW9uLCB0aGF0IFBBIGhhcyB0byBiZSBkaXNhYmxlZCBiZWZvcmUgc291bmR3aXJlIHBvcnRz
IGFyZSBlbmFibGVkLgo+IAo+PiBJZiB0aGlzIGlzIGR1ZSB0byB0aGUgb3JkZXIgd2l0aCB0aGUg
UEEsIHRoZW4gd2hlcmUgaXMgdGhlIFBBIGhhbmRsZWQ/Cj4+Cj4gCj4gUEEgZW5hYmxlL211dGUg
YXJlIGhhbmRsZWQgYXMgcGFydCBvZiBEQVBNIGFuZCBkaWdpdGFsIG11dGUuCgphZGRpbmcgYSBj
b21tZW50IHdvdWxkIGJlIG5pY2UgdGhlbi4KCldlIGNhbiBleHBlY3QgYWRkaXRpb25hbCBkZXZp
YXRpb25zIGZyb20gdGhlIGluaXRpYWwgQUxTQS0+U291bmRXaXJlIAptYXBwaW5nLCBpdCBzZWVt
cyB0aGF0IHRoZSBub3Rpb24gb2YgJ3ByZXBhcmUnIHdhcyBpbnRlcnByZXRlZCBpbiAKZGlmZmVy
ZW50IHdheXMgYW5kIHNvbWUgZGV2aWNlcyBuZWVkIHRvIGNvbWJpbmUgcHJlcGFyZS9lbmFibGUg
YW5kIApkaXNhYmxlL2RlcHJlcGFyZSBpbiB0aGUgLnRyaWdnZXIgY2FsbGJhY2ssIGkuZS4gcHJl
cGFyZSBpcyB1c2VkIHRvIAoncHJlcGFyZSBzdHJlYW1pbmcnLiBPdGhlcnMgdGFrZSBhIGxvdCBv
ZiB0aW1lIGFuZCBhbmQgdGhlICdwcmVwYXJlJyBpcyAKcmVhbGx5ICdwcmVwYXJlIGFuYWxvZy9w
b3dlciByZXNvdXJjZXMnLCB3aGljaCBhbmQgcmVxdWlyZSB0aGUgdHdvIHBhcnRzIAp0byBiZSBz
cGxpdC4gVGhlIHN0YW5kYXJkIGlzIGFtYmlndW91cyBvbiB0aGlzLCBzbyBib3RoIGludGVycHJl
dGF0aW9ucyAKYXJlIGxlZ2l0LCBzbyB3ZSdsbCBwcm9iYWJseSBoYXZlIHRvIGFkanVzdCBpbiB0
aGUgU291bmRXaXJlIGNvcmUgYXQgCnNvbWUgcG9pbnQuCgo+Pj4gK3N0YXRpYyBpbnQgd3NhODgx
eF9od19mcmVlKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4+PiArewo+
Pj4gK8KgwqDCoCBzdHJ1Y3Qgd3NhODgxeF9wcml2ICp3c2E4ODF4ID0gZGV2X2dldF9kcnZkYXRh
KGRhaS0+ZGV2KTsKPj4+ICsKPj4+ICvCoMKgwqAgc2R3X2Rpc2FibGVfc3RyZWFtKHdzYTg4MXgt
PnNydW50aW1lKTsKPj4+ICvCoMKgwqAgc2R3X2RlcHJlcGFyZV9zdHJlYW0od3NhODgxeC0+c3J1
bnRpbWUpOwo+Pgo+PiBUaGlzIHdvcmtzIGlmIHlvdSBkbyBhIGh3X3BhcmFtcy0+cHJlcGFyZS0+
aHdfZnJlZSB0cmFuc2l0aW9uLCBidXQgCj4+IGlzbid0IGl0IHBvc3NpYmxlIHRvIGhhdmUgaHdf
cGFyYW1zLT5od19mcmVlIGFzIHdlbGw/IEluIHRoYXQgY2FzZSB0aGUgCj4+IHN0cmVhbSB3b3Vs
ZCBub3QgZW5hYmxlZC9wcmVwYXJlZCwgc28gc2hvdWxkbid0IHlvdSBoYXZlIHRoZSBzYW1lIHRl
c3QgCj4+IGFzIGluIHByZXBhcmU/Cj4gCj4gQW0gbm90IDEwMCUgc3VyZSBpZiB3ZSB3b3VsZCBq
dXN0IGhhdmUgaHdfcGFyYW1zLT5od19mcmVlLCBJZiB0aGF0IGlzIAo+IHRydWUsIHRoZW4geWVz
IHdlIG5lZWQgdGhlIHNhbWUgY2hlY2sgaGVyZSB0b28uIEhvd2V2ZXIgc291bmR3aXJlIGNvcmUg
Cj4gc2hvdWxkIHRocm93IGludmFsaWQgc3RhdGUgZXJyb3IgaW4gc3VjaCBjYXNlcyB0b28uCgpJ
dCdzIHByb2JhYmx5IGJldHRlciBpZiB5b3UgcHJvYWN0aXZlbHkgY2hlY2ssIHdlJ3ZlIHNlZW4g
Y2FzZXMgd2hlcmUgCndoZW4gdGhlIEZFIGh3X3BhcmFtcyBmYWlsZWQsIHRoZSBCRSBod19mcmVl
IHdhcyBjYWxsZWQgd2l0aG91dCB0aGUgQkUgCmh3X3BhcmFtcyBiZWluZyBpbnZva2VkLCBzbyB5
b3Ugc2hvdWxkIHJlYWxseSB0ZXN0IHRoYXQgZXZlcnl0aGluZyB3YXMgCnByb3Blcmx5IGFsbG9j
YXRlZCBhbmQgbm90IHJlbHkgb24gYW5vdGhlciBzdGF0ZSBtYWNoaW5lL2ZyYW1ld29yay4KCldp
dGggdGhhdCBmZWVsIGZyZWUgdG8gYWRkIG15IHRhZyBiZWxvdyBmb3IgdGhlIG5leHQgcmV2aXNp
b24KClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3Nh
cnRAbGludXguaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
