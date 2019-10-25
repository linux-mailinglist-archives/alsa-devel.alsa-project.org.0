Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB652E4EA2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45DC01809;
	Fri, 25 Oct 2019 16:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45DC01809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572012746;
	bh=5jMs1BUUYugFq98m33xEXKJf59kDEXcs6WhA3IlURLw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GON2xKqkrrf7i61281bWmAZjCVCCOSOh1w2pabxqUwLUCCqhgIv5wHexHXcCvb8GM
	 WFX6JOueVWpVnj61QUj+26h6UBHWO3oS9CIveUApMCyorCCBAKSlORJuu/t+iLYcZZ
	 p2dUSUoafvpXp+kvEGEIeTMR9ZiwfXhCdzTVdC2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC1BBF80393;
	Fri, 25 Oct 2019 16:10:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C314EF8036F; Fri, 25 Oct 2019 16:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CC5F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CC5F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 07:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="223931913"
Received: from bnail-mobl.amr.corp.intel.com (HELO [10.252.140.167])
 ([10.252.140.167])
 by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2019 07:10:32 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191022174313.29087-1-perex@perex.cz>
 <6d4e41fe-ba1e-3c89-582c-f8dc0964cf18@linux.intel.com>
 <0036ad81-c383-ec91-5acb-fccf681b538c@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <69a9c838-24dc-f101-359f-4778dc102f9e@linux.intel.com>
Date: Fri, 25 Oct 2019 09:10:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0036ad81-c383-ec91-5acb-fccf681b538c@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v5 1/2] ALSA: hda: add Intel DSP
 configuration / probe code
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

Cj4+IEphcm9zbGF2LCBJIGZvdW5kIGEgY2FzZSB3aGVyZSB0aGUgbG9naWMgZG9lc24ndCBzZWVt
IHRvIHdvcmsgYXMgCj4+IGludGVuZGVkLgo+Pgo+PiB0aGUgY29kZSBjdXJyZW50bHkgc2NhbnMg
dGhyb3VnaCB0aGUgdGFibGUgbG9va2luZyBmb3IgYSBQQ0kgSUQgbWF0Y2gsCj4+IGFuZCBhIERN
SSBtYXRjaCBmb3IgcXVpcmtzLgo+Pgo+PiBPbiBhIEtCTCBOVUMgZGV2aWNlIHdpdGggdGhlIERT
UCBlbmFibGVkLCB3ZSBnbyB0aHJvdWdoIHRoZSBlbnRpcmUgbGlzdAo+PiB3aXRob3V0IGZpbmRp
bmcgYSBtYXRjaCwgd2hpY2ggbWVhbnMgd2UgcmV0dXJuIHRoZSBfQU5ZIGZsYWcuIHNvIGlmIHdl
Cj4+IHRyeSB0byBwcm9iZSB0aGUgc25kLXNvYy1za2wgZHJpdmVyLCB0aGUgY2hlY2tzIHdpbGwg
YWxsb3cgdGhlIGRyaXZlciB0bwo+PiBjb250aW51ZSwgZGVzcGl0ZSB0aGlzIGNvbmZpZ3VyYXRp
b24gbm90IGJlaW5nIHN1cHBvcnRlZC4KPj4KPj4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhh
dCB3ZSB3b3VsZCBhbHdheXMgbG9hZCB0aGUgbGVnYWN5IGRyaXZlcgo+PiAqdW5sZXNzKiB0aGVy
ZSBpcyBhIG1hdGNoIGluIHRoZSB0YWJsZT8gSWYgeWVzLCB0aGVyZSB3ZSBjYW4gY2hhbmdlIHRo
ZQo+PiBkZWZhdWx0IHRoaXMgd2F5Ogo+Pgo+PiBAQCAtMzMzLDcgKzM1NSw3IEBAIGludCBzbmRf
aW50ZWxfZHNwX2RyaXZlcl9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLyogZmluZCB0aGUgY29uZmlndXJhdGlvbiBmb3IgdGhlIHNwZWNpZmljIGRldmlj
ZSAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2ZnID0gc25kX2ludGVsX2RzcF9maW5kX2NvbmZp
ZyhwY2ksIGNvbmZpZ190YWJsZSwKPj4gQVJSQVlfU0laRShjb25maWdfdGFibGUpKTsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghY2ZnKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gU05EX0lOVEVMX0RTUF9EUklWRVJfQU5ZOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gU05EX0lOVEVMX0RTUF9EUklWRVJfTEVHQUNZOwo+Pgo+PiBPciB3
ZSBuZWVkIHRvIGFkZCBhIGNhc2Ugd2hlcmUgd2UgZm9yY2UgdGhlIGxlZ2FjeSBpbiB0aGUgdGFi
bGUgZm9yIGVhY2gKPj4gcGxhdGZvcm0uCj4gCj4gSSB3b3VsZCBwcmVmZXIgdG8gYWRkIGFub3Ro
ZXIgZW50cnkgdG8gdGhlIGNvbmZpZ3VyYXRpb24gdGFibGUgd2l0aG91dCAKPiAuZmxhZ3MgKG9y
IC5mbGFncyA9IDApIHdpdGggYSBjb21tZW50LCB3aHkgdGhlIGxlZ2FjeSBkcml2ZXIgaXMgc2Vs
ZWN0ZWQgCj4gYnkgZGVmYXVsdCBldmVuIGlmIHRoZSBEU1AgaXMgcHJlc2VudC4KCkFoIHllcywg
ZmxhZ3MgPT0gMCB3b3VsZCBtZWFuIGxlZ2FjeSBpbmRlZWQuIFdpbGwgc2VuZCBhIHBhdGNoLCB0
aGFua3MgCmZvciB0aGUgaWRlYS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
