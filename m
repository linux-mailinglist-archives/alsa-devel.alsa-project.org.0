Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548A15085
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79ADA16A9;
	Mon,  6 May 2019 17:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79ADA16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157372;
	bh=01sXgpI2xDYdU1r8+C8e357nz031PqYxnB+BaDQcN4M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LVphDRFRX6bQBnE/jaU0zUQphliYGiz4CSE/8UAR+IQktXMloCKLIpRQYmv39VV+z
	 2b2clGw3yzXKrkR1YBzD/hlaBUeL2Iz3DGVGE3ml0NUwejIvsL6ZVPI8imbm2NSEnS
	 5t7qv7td1QlgOkGRZOZX0J9z+NDwBrqLcvNrIIx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38334F89723;
	Mon,  6 May 2019 17:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B489F89705; Mon,  6 May 2019 17:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7630FF896FD
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7630FF896FD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="229980313"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 06 May 2019 08:40:49 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 04EF158010A;
 Mon,  6 May 2019 08:40:48 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20190506150224.1394-1-tiwai@suse.de>
 <20190506150224.1394-3-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ea78fa2e-5cc3-2639-4b73-4b9e4f3e1963@linux.intel.com>
Date: Mon, 6 May 2019 10:40:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506150224.1394-3-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Fix a compile warning with
 CONFIG_PCI=n
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

T24gNS82LzE5IDEwOjAyIEFNLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gQSB0cml2aWFsIGZpeCBm
b3IgdGhlIHJhbmRjb25maWcgYnVpbGQgZXJyb3I6Cj4gICAgc291bmQvc29jL3NvZi9vcHMuYzoy
MDo2OiB3YXJuaW5nOiDigJhyZXTigJkgaXMgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVu
Y3Rpb24gWy1XdW5pbml0aWFsaXplZF0KPiAKPiBGaXhlczogZDFkOTVmY2I2M2UzICgiQVNvQzog
U09GOiBBZGQgRFNQIEhXIGFic3RyYWN0aW9uIG9wZXJhdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6
IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KCkkgcmVtZW1iZXIgZml4aW5nIHRoaXMsIHBy
b2JhYmx5IG5ldmVyIGFwcGxpZWQgaXQgdG8gdGhlIHJpZ2h0IGJyYW5jaCAKOi0oIFRoYW5rcyBU
YWthc2hpLgoKQWNrZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9z
c2FydEBsaW51eC5pbnRlbC5jb20+CgoKPiAtLS0KPiAgIHNvdW5kL3NvYy9zb2Yvb3BzLmMgfCAy
ICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9vcHMuYyBiL3NvdW5kL3NvYy9zb2Yvb3BzLmMK
PiBpbmRleCA4MGY5MDc3NDBiODIuLjdhMjdjM2I3MTllNyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9z
b2Mvc29mL29wcy5jCj4gKysrIGIvc291bmQvc29jL3NvZi9vcHMuYwo+IEBAIC0xNyw3ICsxNyw3
IEBAIGJvb2wgc25kX3NvZl9wY2lfdXBkYXRlX2JpdHNfdW5sb2NrZWQoc3RydWN0IHNuZF9zb2Zf
ZGV2ICpzZGV2LCB1MzIgb2Zmc2V0LAo+ICAgewo+ICAgCXN0cnVjdCBwY2lfZGV2ICpwY2kgPSB0
b19wY2lfZGV2KHNkZXYtPmRldik7Cj4gICAJdW5zaWduZWQgaW50IG9sZCwgbmV3Owo+IC0JdTMy
IHJldDsKPiArCXUzMiByZXQgPSAwOwo+ICAgCj4gICAJcGNpX3JlYWRfY29uZmlnX2R3b3JkKHBj
aSwgb2Zmc2V0LCAmcmV0KTsKPiAgIAlvbGQgPSByZXQ7Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
