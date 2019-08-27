Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EBD9EBC0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 17:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780FF166F;
	Tue, 27 Aug 2019 16:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780FF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566918047;
	bh=2uTRhh4Ucp1yubWugLaPl8Jm1MRX5+cBSsOdnc8O+hE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRF2X6ZfhGIGSSDqkN+v+6mqPncHpcCaf/ka5900sdxuWNrVZqaa4guATSnpQocqT
	 kJKFc2MJShDoP1kEJR82PtngxfpI7cItPzj6rxt6BDCzIY3l4/z4gl8g/IZYsJ0JnD
	 6/oZC5K8bH3KakwDDcJ4DfZv7PdZwspAPxNn1hV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5461BF80142;
	Tue, 27 Aug 2019 16:58:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22633F80444; Tue, 27 Aug 2019 16:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E5FAF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E5FAF80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="380944372"
Received: from rileyrox-mobl.amr.corp.intel.com (HELO [10.254.31.52])
 ([10.254.31.52])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2019 07:58:38 -0700
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d7dae124-eaef-4cc7-50a9-ea66521775b4@linux.intel.com>
Date: Tue, 27 Aug 2019 09:58:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/6] Small fixes
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

CgpPbiA4LzI3LzE5IDk6MTcgQU0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOgo+IFNlcmll
cyBvZiBzbWFsbCBmaXhlczoKPiAqIGZpeGVzIGZldyBpc3N1ZXMgZm91bmQgZHVyaW5nIGNoZWNr
aW5nIGNvZGUgd2l0aCBzdGF0aWMgY2hlY2tlcnMKPiAqIGZpeCBmZXcgcHJpbnRzCj4gKiBkZWZp
bmUgZnVuY3Rpb24gaW4gaGVhZGVyLCBsaWtlIGl0IHNob3VsZCBiZQo+ICogcmVsZWFzZSB0b3Bv
bG9neSB3aGVuIGRvbmUgd2l0aCBpdAo+IAo+IEFtYWRldXN6IFPFgmF3acWEc2tpICg2KToKPiAg
ICBBU29DOiBJbnRlbDogU2t5bGFrZTogVXNlIGNvcnJlY3QgZnVuY3Rpb24gdG8gYWNjZXNzIGlv
bWVtIHNwYWNlCj4gICAgQVNvQzogSW50ZWw6IEZpeCB1c2Ugb2YgcG90ZW50aWFsbHkgdW5pbml0
aWFsaXplZCB2YXJpYWJsZQo+ICAgIEFTb0M6IGRhcG06IEV4cG9zZSBzbmRfc29jX2RhcG1fbmV3
X2NvbnRyb2xfdW5sb2NrZWQgcHJvcGVybHkKPiAgICBBU29DOiBJbnRlbDogU2t5bGFrZTogUHJp
bnQgbW9kdWxlIHR5cGUgaW5zdGVhZCBvZiBpZAo+ICAgIEFTb0M6IEludGVsOiBTa3lsYWtlOiBS
ZWxlYXNlIHRvcG9sb2d5IHdoZW4gd2UgYXJlIGRvbmUgd2l0aCBpdAo+ICAgIEFTb0M6IEludGVs
OiBOSExUOiBGaXggZGVidWcgcHJpbnQgZm9ybWF0CgpMR1RNCgpSZXZpZXdlZC1ieTogUGllcnJl
LUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KCj4g
Cj4gICBpbmNsdWRlL3NvdW5kL3NvYy1kYXBtLmggICAgICAgICAgICAgICB8ICAzICsrKwo+ICAg
c291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMgICAgICAgfCAgMiArKwo+ICAgc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMgICAgfCAgMiArLQo+ICAgc291bmQvc29jL2lu
dGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMgfCAgNSArKystLQo+ICAgc291bmQvc29jL2ludGVs
L3NreWxha2Uvc2tsLW5obHQuYyAgICAgfCAgMiArLQo+ICAgc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXRvcG9sb2d5LmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ICAgc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLmggICAgICAgICAgfCAgMSAtCj4gICBzb3VuZC9zb2Mvc29jLXRv
cG9sb2d5LmMgICAgICAgICAgICAgICB8ICA2IC0tLS0tLQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
