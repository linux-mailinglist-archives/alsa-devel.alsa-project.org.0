Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70314A3E9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 13:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE0D83B;
	Mon, 27 Jan 2020 13:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE0D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580128245;
	bh=WbmTwCMLAhIKwpt34kWZc6DPDM1pDy6+DX79fWzS87Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aco+lMce3NT12VUPb8rcEH2lU9yXmmcAcWaHALQQAD7L0xazAW7YOneljJoZY5hUa
	 CPDP0A26gQUPhLW3853dYQ3Sl2v5gHz0Ze+66qp5oIm3orjvly3EUx/A2OPG/l+q+5
	 DhG2O6zhuAWhPGxfb9GvtGH03Ki0kRcU2xDAuoqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C03F80254;
	Mon, 27 Jan 2020 13:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8AFDF80253; Mon, 27 Jan 2020 13:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBD7DF80234
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 13:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD7DF80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 04:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="223229430"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 04:28:41 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-10-cezary.rojewski@intel.com>
 <557cc5d7-60e2-5b4c-be66-09fed556b76e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <275f5129-cb1e-faf0-ae13-9f7039663318@intel.com>
Date: Mon, 27 Jan 2020 13:28:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <557cc5d7-60e2-5b4c-be66-09fed556b76e@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 09/12] ASoC: SOF: Intel: Probe compress
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

T24gMjAyMC0wMS0yNCAyMTowNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2Mvc29mL2ludGVsL0tjb25maWcgYi9zb3VuZC9zb2Mvc29mL2ludGVs
L0tjb25maWcKPj4gaW5kZXggOGMyZGE2YTJjOWRmLi42NTA1OGY1YzgwOGEgMTAwNjQ0Cj4+IC0t
LSBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvS2NvbmZpZwo+PiArKysgYi9zb3VuZC9zb2Mvc29mL2lu
dGVsL0tjb25maWcKPj4gQEAgLTMyOCw2ICszMjgsMTYgQEAgY29uZmlnIFNORF9TT0NfU09GX0hE
QV9BVURJT19DT0RFQwo+PiDCoMKgwqDCoMKgwqDCoCBTYXkgWSBpZiB5b3Ugd2FudCB0byBlbmFi
bGUgSERBdWRpbyBjb2RlY3Mgd2l0aCBTT0YuCj4+IMKgwqDCoMKgwqDCoMKgIElmIHVuc3VyZSBz
ZWxlY3QgIk4iLgo+PiArY29uZmlnIFNORF9TT0NfU09GX0hEQV9QUk9CRVMKPj4gK8KgwqDCoCBi
b29sICJTT0YgZW5hYmxlIHByb2JlcyBvdmVyIEhEQSIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIFNO
RF9TT0NfU09GX0hEQV9MSU5LCj4gCj4gSSB0aGluayB0aGlzIGRlcGVuZGVuY3kgaXMgaW5jb3Jy
ZWN0PyBpZiB3ZSBhcmUgb25seSB1c2luZyB0aGUgCj4gY29udHJvbGxlciBhbmQgaG9zdC1zaWRl
IERNQXMsIGl0J3Mgbm90IG5lZWRlZCBhdCBhbGwuIFRoZXJlIGlzIG5vIAo+IHRlY2huaWNhbCBy
ZWFzb24gd2h5IHdlIGNvdWxkbid0IHVzZSBwcm9iZXMgd2l0aCBqdXN0IEkyUyBjb2RlY3MsIG9y
IAo+IGV2ZW4gaW4gbm9jb2RlYyBtb2RlLgo+IAo+IG1heWJlIHlvdSBtZWFudCBIREFfQ09NTU9O
IHNvIHRoYXQgaXQncyBvbmx5IHVzZWQgb24gU0tMKy4KPiAKCkFkZHJlc3NlZCBpbiB2MiwgdGhh
bmtzLgoKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIFNORF9TT0NfU09GX0RFQlVHX1BST0JFUwo+PiAr
wqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUgZGF0YSBw
cm9iaW5nIGZvciBJbnRlbChSKS4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBIREF1ZGlvIHBsYXRm
b3Jtcy4KPiAKPiBIREF1ZGlvIGlzIG1pc2xlYWRpbmcsIHRoaXMgY291bGQgbWVhbiB0aGUgSERh
dWRpbyBjb250cm9sbGVyIChidXQgCj4gdGhhdCdzIG9ubHkgYWZ0ZXIgU0tMKSBvciBIREF1ZGlv
IGNvZGVjcy4KPiAKPiBUaGlzIHNob3VsZCBiZSAiSW50ZWwoUikgU2t5bGFrZSBhbmQgbmV3ZXIg
cGxhdGZvcm1zIj8KClJld29yZGVkIGluIHYyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
