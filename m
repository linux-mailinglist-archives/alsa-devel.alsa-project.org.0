Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA754FAF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 15:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B64F1607;
	Tue, 25 Jun 2019 15:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B64F1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561467849;
	bh=3UoiZG59w13VbwiJQxh63Ajyro76knXRJ5er2gFi6Qg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wvv7q6lu/d3u/1+n0bIhw2SPWST8FUKT3KoJaYQNWqJwbyPwh11MO+Gdn4bz9zxlD
	 XconClHLsYB6LmUnyqfo8cVJOimRFv2zty3TzB4Xe7sWq2GsqFFcuNJFo0UtTS1XLv
	 4dQQTeWRBwXbSpaGnCohPLHmqPj3ugU19L2oAkHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59752F896F9;
	Tue, 25 Jun 2019 15:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09E3FF896F9; Tue, 25 Jun 2019 15:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D93F8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 15:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D93F8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 06:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; d="scan'208";a="184480030"
Received: from pbossart-mobl3.igk.intel.com (HELO [10.237.142.180])
 ([10.237.142.180])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jun 2019 06:02:11 -0700
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190625120450.GR5316@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f50433de-279a-cbc8-d91f-4e3a04bae450@linux.intel.com>
Date: Tue, 25 Jun 2019 08:02:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625120450.GR5316@sirena.org.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH v2 00/11] Fix driver reload issues
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

CgpPbiA2LzI1LzE5IDc6MDQgQU0sIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTcs
IDIwMTkgYXQgMDE6MzY6MzNQTSArMDIwMCwgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGludHJvZHVjZXMgZml4ZXMgdG8gdmFy
aW91cyBpc3N1ZXMgZm91bmQgd2hpbGUKPj4gdHJ5aW5nIHRvIHVubG9hZCBhbGwgc25kKiBtb2R1
bGVzIGFuZCB0aGVuIGxvYWRpbmcgdGhlbSBhZ2Fpbi4gVGhpcwo+PiBhbGxvd3MgZm9yIG1vZHVs
ZXMgdG8gYmUgcmVhbGx5IF9tb2R1bGVzXyBhbmQgYmUgdW5sb2FkZWQgYW5kIGxvYWRlZCBvbgo+
PiBkZW1hbmQsIG1ha2luZyBpdCBlYXNpZXIgdG8gZGV2ZWxvcCBhbmQgdGVzdCB0aGVtIHdpdGhv
dXQgY29uc3RhbnQKPj4gc3lzdGVtIHJlYm9vdHMuCj4gCj4gUGllcnJlPyAgWW91IGRpZCBjb21t
ZW50IG9uIHRoZSBnZW5lcmFsIGNvbmNlcHQgaW4gb25lIG9mIHRoZSBwYXRjaGVzCj4gYnV0IG5v
dCBvbiBhbnkgb2YgdGhlIHBhdGNoZXMgZGlyZWN0bHkuCgpJIGRpZCByZXZpZXcgdGhlIHBhdGNo
ZXMgaW50ZXJuYWxseSBhbmQgdGhlIHYxLiBGb3IgdGhlIHYyIEkgY291bGQgb25seSAKZG8gYW4g
YWlycG9ydCBsb3VuZ2UgcmV2aWV3IGFuZCBkaWRuJ3Qgc2VlIGFueSBibGF0YW50IGlzc3Vlcywg
c28gZmVlbCAKZnJlZSB0byB0YWtlIHRoZSBmb2xsb3dpbmcgdGFnIGZvciB0aGUgc2VyaWVzLgoK
UmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBs
aW51eC5pbnRlbC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
