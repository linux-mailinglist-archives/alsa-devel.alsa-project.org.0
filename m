Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2ED76B7F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 516332085;
	Fri, 26 Jul 2019 16:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 516332085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564151055;
	bh=GEht3SXS5HoVoGtx3XvG8nyqDvOSzPrlmY4uNjlAAhE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k82iO6PgSRnnwzgPPfjFJXOocZyhUgN+jd5n+ikcVx/xWrEZRrQ/9E793qy+cjmWi
	 NrNnlU2PE87yHUWOURvOSSb23Jx8sst1VeA6QMd6BUrc6ujLV+MPquznzdacre5RiN
	 IAVbbxKPctbpFu+UyWTIW2gGohu7/ms4THx3Lcls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0E9F80393;
	Fri, 26 Jul 2019 16:22:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190CCF80393; Fri, 26 Jul 2019 16:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 638E3F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638E3F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322051732"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:22:21 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-25-pierre-louis.bossart@linux.intel.com>
 <7dbe6483-673f-f415-9ebc-700c090d9520@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3d1f1667-f165-024f-8a93-bb15500cd7ad@linux.intel.com>
Date: Fri, 26 Jul 2019 09:22:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7dbe6483-673f-f415-9ebc-700c090d9520@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 24/40] soundwire: cadence_master: use
 BIOS defaults for frame shape
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

CgpPbiA3LzI2LzE5IDU6MjAgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gK3N0YXRpYyB1MzIgY2Ru
c19zZXRfZGVmYXVsdF9mcmFtZV9zaGFwZShpbnQgbl9yb3dzLCBpbnQgbl9jb2xzKQo+PiArewo+
PiArwqDCoMKgIHUzMiB2YWw7Cj4+ICvCoMKgwqAgaW50IGM7Cj4+ICvCoMKgwqAgaW50IHI7Cj4+
ICsKPj4gK8KgwqDCoCByID0gc2R3X2ZpbmRfcm93X2luZGV4KG5fcm93cyk7Cj4+ICvCoMKgwqAg
YyA9IHNkd19maW5kX2NvbF9pbmRleChuX2NvbHMpOwo+PiArCj4+ICvCoMKgwqAgdmFsID0gKHIg
PDwgMykgfCBjOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHZhbDsKPj4gK30KPj4gKwo+PiDCoCAv
KioKPj4gwqDCoCAqIHNkd19jZG5zX2luaXQoKSAtIENhZGVuY2UgaW5pdGlhbGl6YXRpb24KPj4g
wqDCoCAqIEBjZG5zOiBDYWRlbmNlIGluc3RhbmNlCj4+IEBAIC05NzcsNyArOTkwLDkgQEAgaW50
IHNkd19jZG5zX2luaXQoc3RydWN0IHNkd19jZG5zICpjZG5zKQo+PiDCoMKgwqDCoMKgIGNkbnNf
d3JpdGVsKGNkbnMsIENETlNfTUNQX0NMS19DVFJMMCwgdmFsKTsKPj4gwqDCoMKgwqDCoCAvKiBT
ZXQgdGhlIGRlZmF1bHQgZnJhbWUgc2hhcGUgKi8KPj4gLcKgwqDCoCBjZG5zX3dyaXRlbChjZG5z
LCBDRE5TX01DUF9GUkFNRV9TSEFQRV9JTklULCAKPj4gQ0ROU19ERUZBVUxUX0ZSQU1FX1NIQVBF
KTsKPj4gK8KgwqDCoCB2YWwgPSBjZG5zX3NldF9kZWZhdWx0X2ZyYW1lX3NoYXBlKHByb3AtPmRl
ZmF1bHRfcm93LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJvcC0+ZGVmYXVsdF9jb2wpOwo+PiArwqDCoMKgIGNkbnNfd3JpdGVsKGNkbnMsIENETlNf
TUNQX0ZSQU1FX1NIQVBFX0lOSVQsIHZhbCk7Cj4+IMKgwqDCoMKgwqAgLyogU2V0IFNTUCBpbnRl
cnZhbCB0byBkZWZhdWx0IHZhbHVlICovCj4+IMKgwqDCoMKgwqAgY2Ruc193cml0ZWwoY2Rucywg
Q0ROU19NQ1BfU1NQX0NUUkwwLCBDRE5TX0RFRkFVTFRfU1NQX0lOVEVSVkFMKTsKPj4KPiAKPiBT
dWdnZXN0aW9uOgo+IGRlY2xhcmUgImdlbmVyaWMiIF9nZXRfZnJhbWVfZnJhbWUocm93cywgY29s
cykgaW5zdGVhZCBhbmQgbGV0IGl0IGRvIHRoZSAKPiBiaXR3aXNlIG9wZXJhdGlvbnMgZm9yIHlv
dS4gUHJldHR5IHN1cmUgdGhpcyB3b24ndCBiZSB0aGUgb25seSBwbGFjZSBpbiAKPiBjb2RlIHdo
ZXJlIHJlZyB2YWx1ZSBmb3IgZnJhbWVfc2hhcGUgbmVlZHMgdG8gYmUgcHJlcGFyZWQuCj4gCj4g
U2FpZCBmdW5jdGlvbiBjb3VsZCBiZSBhcyBzaW1wbGUgYXM6Cj4gcmV0dXJuIChyb3cgPDwgMykg
fCBjb2xzOwo+ICtpbmxpbmUgZmxhZwo+IAo+IGkuZS4gY291bGQgYmUgZXZlbiBhIG1hY3JvLi4K
PiAKPiBPdGhlcndpc2UgbW9kaWZ5IF9zZXRfZGVmYXVsdF9mcmFtZV9zaGFwZSB0byBzaW1wbHk6
Cj4gcmV0dXJuIChyIDw8IDMpIHwgYwo+IAo+IHdpdGhvdXQgaW52b2x2aW5nIGFkZGl0aW9uYWwg
bG9jYWwgdmFsIHZhcmlhYmxlIChJIGRvbid0IHJlYWxseSBzZWUgdGhlIAo+IHBvaW50IGZvciBh
bnkgbG9jYWxzIHRoZXJlIHRob3VnaCkuCgp3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcyBpcyB0YWtl
IHRoZSBzdGFuZGFyZC1kZWZpbmVkIG9mZnNldHMgZm9yIHJvdyBhbmQgCmNvbHVtbiBhbmQgc3Rv
cmVzIHRoZW0gaW4gYSBDYWRlbmNlLWRlZmluZWQgcmVnaXN0ZXIuIEkgdGhpbmsgd2UgY2FuIApw
cm9iYWJseSB1c2UgYSBtYWNybyB0byByZW1vdmUgdGhlIG1hZ2ljICczJyB2YWx1ZSwgYnV0IHRo
ZXJlIGFyZSBsaW1pdHMgCnRvIHdoYXQgd2UgY2FuIHNpbXBsaWZ5LiBJIHNob3VsZCBwcm9iYWJs
eSBhZGQgY29tbWVudHMgc28gdGhhdCBwZW9wbGUgCmZpZ3VyZSBpdCBvdXQuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
