Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94203B0A07
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 10:18:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E45C171F;
	Thu, 12 Sep 2019 10:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E45C171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568276284;
	bh=rOaGqlM53BekfoI1FR1UmGS1lceyLvUqHsbgw0490O0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5eUzQ+LjjCLL3e0w/2s+3BX6/y1fsKlnBZbA8fgXsW/4C4dqCyjWCVleO4TXuX41
	 BcMYGpaFhVHN5GIFB6hFp+fRacelHkMSw9iKO8Uz1z+0xPTnzCo8MNDDsC7NwuBu6v
	 J5mwDv4Xugvdi+zR0Cfy2Zqv9tD1WaWooEqzck7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE19F80321;
	Thu, 12 Sep 2019 10:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51BD4F80321; Thu, 12 Sep 2019 10:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55D9EF80143
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 10:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55D9EF80143
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 01:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="192354549"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2019 01:16:09 -0700
Date: Thu, 12 Sep 2019 11:16:08 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a1b70a79-3bac-95e6-9091-9acee31a0a05@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1909121042450.16459@zeliteleevi>
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
 <20190910182916.29693-3-kai.vehmanen@linux.intel.com>
 <a1b70a79-3bac-95e6-9091-9acee31a0a05@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 02/10] ALSA: hda/hdmi - allow control
 creation without a linked pcm
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGksCgpPbiBUdWUsIDEwIFNlcCAyMDE5LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKCj4g
T24gOS8xMC8xOSAxOjI5IFBNLCBLYWkgVmVobWFuZW4gd3JvdGU6Cj4gPiBGaXggdGhlIGxvZ2lj
IGluIGdlbmVyaWNfaGRtaV9idWlsZF9jb250cm9scygpIHRvIGlkZW50aWZ5Cj4gPiB1bnVzZWQg
aGRhX3BjbSBlbnRyaWVzIGJ5IHNlYXJjaGluZyBmb3IgU05EUlZfUENNX0lOVkFMSURfREVWSUNF
Lgo+ID4gVGhpcyBtYXRjaGVzIHdpdGggbG9naWMgaW4gc25kX2hkYV9jb2RlY19idWlsZF9wY21z
KCkuClsuLi5dCj4gPiAtCQlpZiAoIWdldF9wY21fcmVjKHNwZWMsIHBjbV9pZHgpLT5wY20pIHsK
PiA+ICsJCWhkYV9wY20gPSBnZXRfcGNtX3JlYyhzcGVjLCBwY21faWR4KTsKPiA+ICsJCWlmICho
ZGFfcGNtLT5kZXZpY2UgPT0gU05EUlZfUENNX0lOVkFMSURfREVWSUNFKSB7Cj4gCj4gSSBmaW5k
IGl0IGhhcmQgdG8gZm9sbG93IHRoZSBsb2dpYy4KPiBCZWZvcmUgdGhpcyBwYXRjaCBvbmx5IGRl
dmljZSAwIHdvdWxkIGJlIGNvbnNpZGVyZWQgTk9fUENNCj4gTm90IGl0J3MgLTEsIHNvIHdvbmRl
cmluZyBpZiB0aGlzIGlzIGEgZml4IHVucmVsYXRlZCB0byB0aGlzIHNlcmllcyBvciBpZgo+IHRo
ZXJlIGlzIGEgZGVwZW5kZW5jeSBvbiBmb2xsb3ctdXAgcGF0Y2hlcz8KCnRoZSBpbnRlbnQgd2Fz
IHRvIGFsaWduIHdpdGggbG9naWMgaW4gCmhkYV9jb2RlYy5jOnNuZF9oZGFfY29kZWNfYnVpbGRf
cGNtcygpIHdoaWNoIGlzIHRoZSBjb21tb24gZnVuY3Rpb24gdG8gCmNyZWF0ZSB0aGUgSERBIGRy
aXZlciBQQ00gc3RhdGUuIEluIHRoYXQgZnVuY3Rpb246CgrCuyAgICAgICBsaXN0X2Zvcl9lYWNo
X2VudHJ5KGNwY20sICZjb2RlYy0+cGNtX2xpc3RfaGVhZCwgbGlzdCkgewpbLi4uXQrCuyAgICAg
ICDCuyAgICAgICBkZXYgPSBnZXRfZW1wdHlfcGNtX2RldmljZShidXMsIGNwY20tPnBjbV90eXBl
KTsKwrsgICAgICAgwrsgICAgICAgaWYgKGRldiA8IDApIHsKwrsgICAgICAgwrsgICAgICAgwrsg
ICAgICAgY3BjbS0+ZGV2aWNlID0gU05EUlZfUENNX0lOVkFMSURfREVWSUNFOwrCuyAgICAgICDC
uyAgICAgICDCuyAgICAgICBjb250aW51ZTsgLyogbm8gZmF0YWwgZXJyb3IgKi8KwrsgICAgICAg
wrsgICAgICAgfQoKLi4uIGkuZS4gaWYgbm8gUENNIGlzIGF0dGFjaGVkLCBpdCBpcyBtYXJrZWQg
d2l0aCAKU05EUlZfUENNX0lOVkFMSURfREVWSUNFIHRvIGNwY20tPmRldmljZS4KClRoZSBsb2dp
YyBpbiBwYXRjaF9oZG1pLmMsIHdoaWNoIGRlZHVjZWQgdGhlIHNhbWUgaW5mb3JtYXRpb24gYnkg
Cmxvb2tpbmcgYXQgYW5vdGhlciBmaWVsZCAoY3BjbT4tPnBjbSksIHNlZW1zIHdyb25nIGFuZCB0
aHVzIHRoZSBmaXguCgpOb3csIHRoaXMgdXNlZCB0byBiZSBjcml0aWNhbCBmb3IgdGhpcyBwYXRj
aCBzZXJpZXMgYXMgd2VsbCwgYnV0IHlvdSBhcmUgCnJpZ2h0IHRoYXQgaXMgbm8gbG9uZ2VyIHRo
ZSBjYXNlIChJIGFkZGVkIHBhc3Npbmcgb2YgdGhlIFBDTSBoYW5kbGUgc28Kd2UgY2FuIHJldXNl
IGFsbCB0aGUga2NvbnRyb2wgY29kZSBpbiBwYXRjaF9oZG1pLmMgYW5kIHdpdGggdGhhdCB0aGlz
IApwYXRjaCBpcyBubyBsb25nZXIgbWFuZGF0b3J5IGZvciBTT0YgdXNhZ2UpLgoKSSByZXRlc3Rl
ZCB0aGUgc2VyaWVzIHdpdGhvdXQgdGhlIHBhdGNoIGFuZCBhbGwgc2VlbXMgZmluZSwgc28gbGV0
J3MgCnNpbXBsaWZ5IHRoZSBzZXJpZXMgYnkgZHJvcHBpbmcgdGhpcy4KCkJyLCBLYWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
