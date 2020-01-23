Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDF0146C61
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 16:12:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3601686;
	Thu, 23 Jan 2020 16:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3601686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579792342;
	bh=N7TBEjy19XsopHtRsbrpLYLMP4sXy2C55s53N5dgWmI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kaIvQdaWDOTn0szL4Y+T7Gq8DVlE/ei//kzZLGyVQFqBJ6IUO9tw8uqdFXm9YCjk9
	 eSJe+MzaPYegJV2ZLFcly7/yAg+jKvGpzCAytGaiXZRGhkRAlVFIcwzYUCw030C60b
	 Nmj23O7AWi7DtYykxMIInbvBMFqwjfdtzpTtSpoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F64F8015B;
	Thu, 23 Jan 2020 16:10:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C7E6F801D9; Thu, 23 Jan 2020 16:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 081A6F800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 16:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 081A6F800BA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 07:10:28 -0800
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; 
 d="scan'208,217";a="400361457"
Received: from mwasko-mobl1.ger.corp.intel.com (HELO [10.237.137.159])
 ([10.237.137.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 23 Jan 2020 07:10:26 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
 <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
From: "Wasko, Michal" <michal.wasko@linux.intel.com>
Message-ID: <013c7d4b-c08f-f476-50fe-70ae22580277@linux.intel.com>
Date: Thu, 23 Jan 2020 16:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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

Ck9uIDEvMjIvMjAyMCA4OjUyIFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPgo+Cj4g
T24gMS8yMi8yMCAxMjoyNyBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBGb3IgdGhlIGxh
c3QgZmV3IGRheXMgd2UgaGF2ZSBiZWVuIHBsYXlpbmcgd2l0aCAidmFuaWxsYSIgNS41IGtlcm5l
bCAKPj4gLSBvbmUgd2l0aG91dCB0b24gb2YgL3NreWxha2UgcGF0Y2hlcyAtIHRvIGZpbmQgb3V0
IGhvdyBjb3VsZCBoZGEtZHNwIAo+PiBiZSBlbmFibGVkIG9uIHNrbC8ga2JsKyB3aXRoIHRoZSBs
ZWFzdCBhbW91bnQgb2YgY2hhbmdlcyBwdWxsZWQgZnJvbSAKPj4gb3VyIGJyYW5jaCBwb3NzaWJs
ZS4KPj4KPj4gVHVybmVkIG91dCB0aGUgYWRkaXRpb24gb2YgdGhpcyBzaW5nbGUgcGF0Y2ggQU5E
IHRvcG9sb2d5IGJpbmFyeSAKPj4gdXBkYXRlIGdvdCB0aGUgam9iIGRvbmUuCj4+Cj4+IE5vdywg
aG93IGNhbiB3ZSBwcm9jZWVkIHdpdGggc3VjaCBzb2x1dGlvbi4gQ2FuIHNoYXJlIHRoZSB0b3Bv
bG9neSAKPj4gYmluYXJ5LyAuY29uZiBpZiBuZWVkZWQsIHNvIGFueW9uZSBpbnRlcmVzdGVkIGNh
biBjaGVjayBpdCBvdXQuCj4KPiBJIGFtIHBlcnNvbmFsbHkgaW50ZXJlc3RlZCBmb3IgdGVzdHMg
YnV0IEkgZG91YnQgdGhpcyBvcHRpb24gaXMgdXNhYmxlIAo+IGJ5IGFueW9uZSBvdXRzaWRlIG9m
IEludGVsIC0gYWRkaXRpb25hbCBpc3N1ZXMgd2l0aCBwcm9iZSByYWNlIAo+IGNvbmRpdGlvbnMg
d2l0aCBpOTE1LCBlLmcuIG9uIExpbnVzJyBEZWxsIFhQUyA5MzUwLCBubyBETUlDIHN1cHBvcnQg
Cj4gYW5kIG5vdCBzZWxlY3RlZCBhbnl3YXlzIGJ5IEphcm9zbGF2J3MgbmV3IGxvZ2ljLCBubyBV
Q00sIGFuZCBubyBwbGFucyAKPiBmb3IgdGhlIHVzZSBvZiB0aGUgSERNSSBjb21tb24gY29kZWMu
CgpUaGUgTGludXggU2t5bGFrZSBkcml2ZXIgb2ZmaWNpYWxseSBzdXBwb3J0IGF1ZGlvIG92ZXIg
RFNQIG9uIEludGVsIGNBVlMgCjEuNSsgYm9hcmRzLCB0aGF0IGluY2x1ZGUgU2t5bGFrZSBIVyB0
YXJnZXQgd2l0aCBoZGEtZHNwIGNvbmZpZ3VyYXRpb24uIApUaGUgY29uZmlndXJhdGlvbiBpcyBy
ZWd1bGFybHkgdGVzdGVkIGJ5IEludGVsIEF1ZGlvIENJIHRlYW0uCgpBcyBpdCB3YXMgYWdyZWVk
IHdpdGggeW91IFBpZXJyZSB0aGUgU2t5bGFrZSBkcml2ZXIgd2lsbCBiZSBrZXB0IHVuZGVyIApt
YWludGVuYW5jZSBhbmQgdGhlIHByb3Bvc2VkIGNoYW5nZXMgYXJlIGFib3V0IHRvIGtlZXAgaGRh
LWRzcCAKY29uZmlndXJhdGlvbiBmdW5jdGlvbmFsIGZvciBhbnlvbmUgd2hvIHdvdWxkIGxpa2Ug
dG8gdXNlIGl0LiBMaW51cyAKbGFwdG9wIGlzc3VlIGlzIGFjdHVhbGx5IG9uZSBvZiB0aGUgZ29v
ZCByZWFzb25zIHdoeSB3ZSB3b3VsZCBsaWtlIHRvIAprZWVwIGhkYS1kc3AgY29uZmlndXJhdGlv
biBmdW5jdGlvbmFsCgpZb3VyIG90aGVyIHN0YXRlbWVudHMgUGllcnJlIGFyZSBxdWl0ZSBvdXRk
YXRlZDoKCiDCoMKgwqAgLSBQcm9iZSByYWNlIGNvbmRpdGlvbnMgd2l0aCBpOTE1IC0gcmVzb2x2
ZWQgaW4gSERBCiDCoMKgwqAgLSBETUlDIGlzIHN1cHBvcnRlZAogwqDCoMKgIC0gVUNNIGlzIG5v
dCBkaXJlY3RseSBkcml2ZXIgcmVsYXRlZCBhbmQgY2FuIGJlIGVhc2lseSB1cGRhdGVkCiDCoMKg
wqAgLSBJbnRlbCBBdWRpbyBDSSB3YXMgZm9jdXNlZCBvbiBjb21tb24gSEQtQSBjb2RlYyBidXQg
dGhlIEhETUkgCmNvbW1vbiBjb2RlYyBpcyBzdXBwb3J0ZWQgYXMgd2VsbAoKPiBJbiBjYXNlIHlv
dSBkaWRuJ3Qgc2VlIGl0LCB0aGUgU2t5bGFrZSBkcml2ZXIgJ0hEYXVkaW8gY29kZWMnIG9wdGlv
biAKPiBpcyBzdWdnZXN0ZWQgYXMgb25lIG9mIHRoZSAndW5zdXBwb3J0ZWQnIGZlYXR1cmVzIGhl
cmU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC8xNzQyCj4K
PiAtUGllcnJlCgpUaGUgc3VnZ2VzdGlvbiB0byBtYXJrIHRoZSBTa3lsYWtlIGRyaXZlciAnSERh
dWRpbyBjb2RlYycgb3B0aW9uIGFzIAondW5zdXBwb3J0ZWQnIGlzIGNvbWluZyBmcm9tIHlvdSBQ
aWVycmUgKHBhdGNoIGZyb20gdHdvIGRheXNhZ28/KSBhbmQgSSAKYmVsaWV2ZSB0aGF0IHlvdSBz
aG91bGQgY29uc3VsdCBzdWNoIG9waW5pb24gd2l0aCBJbnRlbCBTa3lsYWtlIGRyaXZlciAKbWFp
bnRhaW5lcnMuCgpNaWNoYWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
