Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90786F06E1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 21:29:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B72B16DB;
	Tue,  5 Nov 2019 21:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B72B16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572985777;
	bh=pSGyOzfiNKL+wmemdBTY9mTLj2ATOfe27HBlmEpK5lk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUhq/ZDJ3ooz8cl7D0pPlTcLra05tIuVCDSn8yti37OWueCLuTO4CF/mBHb//pJWQ
	 yQBlgzzgG/wSH9FOT7YCCAbzhvrvjdhxEoQ8UzpQd7jL+F+jOPHXVkYsOFD/8092gW
	 mQxF8hbJvdiAhGPUxcgGTzEi7imrtItKafcMoJxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AE5F8049B;
	Tue,  5 Nov 2019 21:27:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B341F8049B; Tue,  5 Nov 2019 21:27:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BD9F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 21:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BD9F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 12:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="192225359"
Received: from asraut-mobl1.amr.corp.intel.com (HELO [10.251.136.18])
 ([10.251.136.18])
 by orsmga007.jf.intel.com with ESMTP; 05 Nov 2019 12:27:39 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <2598c6a8-ce64-ad7e-ee34-8ea930b3cf7d@linux.intel.com>
 <f16e60b0-dd72-d84f-a01c-886e48a86bbc@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <973af048-7adf-a999-12a7-cd477008ad07@linux.intel.com>
Date: Tue, 5 Nov 2019 14:27:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <f16e60b0-dd72-d84f-a01c-886e48a86bbc@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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

CgpPbiAxMS81LzE5IDI6MTkgUE0sIEphcm9zbGF2IEt5c2VsYSB3cm90ZToKPiBEbmUgMDUuIDEx
LiAxOSB2IDIwOjUyIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IG5hcHNhbChhKToKPj4KPj4KPj4gT24g
MTEvNS8xOSAxOjM2IFBNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+
Pj4gwqAgwqDCoMKgwqBJIG1ha2Ugc29tZSBpbnRlcm5hbCB1Y20gY29kZSBjbGVhbnVwcyBpbiBh
bHNhLWxpYiBhbmQgYWRkZWQgdGhyZWUKPj4+IG1ham9yIGV4dGVuc2lvbnMgdG8gYWxsb3cgbW9y
ZSBjb21wbGV4IGNvbmZpZ3VyYXRpb25zIHdoaWNoIHdlIHJlcXVpcmUKPj4+IGZvciB0aGUgU09G
IGtlcm5lbCBkcml2ZXIuCj4+Cj4+IEdyZWF0LCB0aGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyEK
Pj4KPj4+Cj4+PiDCoCDCoMKgwqDCoFRoZSBmaXJzdCB0aGluZyBpcyB0aGUgYWRkZWQgc3Vic3Rp
dHV0aW9uIGZvciB0aGUgdmFsdWUgc3RyaW5nczoKPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20v
YWxzYS1wcm9qZWN0L2Fsc2EtbGliL2NvbW1pdC9mMWU2MzdiMjg1ZThlMDRlNjc2MTI0OGEwNzBm
NThmM2E4ZmRlNmZjIAo+Pj4KPj4+Cj4+Pgo+Pj4gwqAgwqDCoMKgwqBUaGUgc2Vjb25kIHRoaW5n
IGlzIHRoZSBJZiBibG9jazoKPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0
L2Fsc2EtbGliL2NvbW1pdC85ODU3MTVjZTgxNDhkYzdlZjYyYzhlM2Q4Y2U1YTBjMmFjNTFmOGRm
IAo+Pj4KPj4KPj4gaXMgaXQgcG9zc2libGUgZm9yIHRoZSBDb25kaXRpb24gdG8gY2hlY2sgaWYg
dGhlIGNhcmQgY29udGFpbnMgdGhlIFNPRgo+PiBwcmVmaXg/Cj4+Cj4+IEZvciBCYXl0cmFpbC9D
aGVycnl0cmFpbCBzdXBwb3J0LCB3ZSBoYXZlIGEgdG9uIG9mIGV4aXN0aW5nIFVDTSBmaWxlcywK
Pj4gYW5kIHRoZSBvbmx5IHRoaW5nIG5lZWRlZCBpcyBlLmcuCj4+IC0gdG8gY2hhbmdlIGZyb20g
aHc6Ynl0Y3JydDU2NDAgdG8gaHc6c29mYnl0Y3J0NTY0MAo+IAo+IEl0IGlzIGVhc3kgd2l0aCB0
aGUgcHJvcG9zZWQgc3Vic3RpdHV0aW9uLCBqdXN0IHVzZSBodzoke0NhcmRJZH0gaGVyZS4gCj4g
SXQgY2FuIGZvciBhbnkgdmFsdWVzIChsaWtlIFBDTSBkZXZpY2UgbmFtZXMgZXRjLikuCgp0aGFu
a3MgZm9yIGNvbmZpcm1pbmcsIEkgdGhvdWdodCBpdCdkIGJlIGZpbmUgaW5kZWVkLgoKPiAKPj4g
LSBtYWtlIHRoZSBjb250cm9scyBmb3IgdGhlIGxlZ2FjeSBkcml2ZXIgY29uZGl0aW9uYWwKPj4K
Pj4gU2VjdGlvblZlcmIgewo+PiDCoMKgwqDCoEVuYWJsZVNlcXVlbmNlIFsKPj4KPj4gwqDCoMKg
wqDCoMKgwqAgaWYgKGNhcmQgbmFtZSBkb2VzIG5vdCBjb250YWluIFNPRikKPj4gwqDCoMKgwqDC
oMKgwqAgPHBsYXRmb3Jtcy9ieXRjci9QbGF0Zm9ybUVuYWJsZVNlcS5jb25mPgo+PiDCoMKgwqDC
oMKgwqDCoCBlbmRpZgo+PiDCoMKgwqDCoMKgwqDCoCA8Y29kZWNzL3J0NTY0MC9FbmFibGVTZXEu
Y29uZj4KPj4gwqDCoMKgwqBdCj4gCj4gVGhlIElmIGJsb2NrcyBjYW5ub3QgYmUgdXNlZCBpbiBz
ZXF1ZW5jZXMsIGJ1dCB5b3UgY2FuIGRvIGJhc2ljYWxseSB0aGlzIAo+IHdpdGggdGhlIHByb3Bv
c2VkIElmIGV4dGVuc2lvbjoKPiAKPiBTZWN0aW9uVmVyYiB7Cj4gIMKgwqDCoMKgSWYuMSB7Cj4g
IMKgwqDCoMKgwqDCoMKgIENvbmRpdGlvbiB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVHlw
ZSBTdHJpbmdFcXVhbAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFN0cmluZzEgIiR7Q2FyZE5h
bWV9Igo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFN0cmluZzIgImJ5dGNydDU2NDAiCj4gIMKg
wqDCoMKgwqDCoMKgIH0KPiAgwqDCoMKgwqDCoMKgwqAgVHJ1ZSB7Cj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRW5hYmxlU2VxdWVuY2UgWwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPHBsYXRmb3Jtcy9ieXRjci9QbGF0Zm9ybUVuYWJsZVNlcS5jb25mPgo+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPGNvZGVjcy9ydDU2NDAvRW5hYmxlU2VxLmNvbmY+Cj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXQo+ICDCoMKgwqDCoMKgwqDCoCB9Cj4gIMKgwqDCoMKgwqDC
oMKgIEZhbHNlIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFbmFibGVTZXF1ZW5jZSBbCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8Y29kZWNzL3J0NTY0MC9FbmFibGVTZXEu
Y29uZj4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4gIMKgwqDCoMKgwqDCoMKgIH0KPiAg
wqDCoMKgwqB9Cj4gfQo+IAo+IFRoZSBjb25kaXRpb24gd2l0aCAiVHlwZSBTdHJpbmdFcXVhbCIg
aXMgbm90IGltcGxlbWVudGVkIHlldCwgYnV0IGl0J3MgCj4gZWFzeSB0byBhZGQgbmV3IGNvbmRp
dGlvbnMgdG8gbXkgcHJvcG9zZWQgY29kZS4gSWYgeW91IHNlZSBzb21ldGhpbmcgCj4gZWxzZSB0
byBiZSBjb21wYXJlZCwganVzdCBsZXQgbWUga25vdyB0byBhZGQgdGhvc2UgY29uZGl0aW9ucyBp
biB0aGUgCj4gZmlyc3QgcGhhc2UuCm9rLCB0aGF0J3MgZ3JlYXQuCgpNYXliZSBTdHJpbmdDb250
YWlucyB3b3VsZCBoZWxwLCBzbyB0aGF0IHdlIGNhbiB1c2UgU3RyaW5nMiAic29mIiBpbiAKbW9z
dCBjYXNlcy4KCgo+IAo+PiBNb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB0aGF0IG1hdHRlcnMgZm9y
IHRob3NlIFVDTSBmaWxlcyBpcyB0aGUgdHlwZSBvZgo+PiBwZXJpcGhlcmFscyBhbmQgdGhlIG1h
dGNoaW5nIG1peGVyIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBjb2RlYyBkcml2ZXIsCj4+IGFuZCB3
ZSBzaG91bGQgcmV1c2UgdGhpcyBpbmZvcm1hdGlvbiBiZXR3ZWVuIGxlZ2FjeSBhbmQgU09GLgo+
IAo+IFllcywgSSBzZWUgdGhlIGRlbWFuZCB0byBtYWtlIHRoZSBkZXNjcmlwdGlvbiBtb3JlIHVu
aXZlcnNhbCBhbmQgZWFzeSB0byAKPiByZWFkLgo+IAo+IE5vdGUgdGhhdCBjZGV2IGlzIGFscmVh
ZHkgaW5pdGlhbGl6ZWQgZnJvbSB0aGUgVmFsdWVEZWZhdWx0cyB7fSBzZWN0aW9uIAo+IFBsYXli
YWNrQ1RML0NhcHR1cmVDVEwgdmFsdWVzIGV2ZW4gaW4gdGhlIG9sZCBjb2RlLCBzbyB0aGUgbW9z
dCBvZiBjZGV2IAo+IGRlY2xhcmF0aW9ucyBhcmUgbm90IG5lY2Vzc2FyeSBpbiB0aGUgY3VycmVu
dCBVQ00gY29uZmlncyB0b28uIFdoZW4gdGhlIAo+IHVzZS1jYXNlIGNvbmZpZ3VyYXRpb24gaXMg
dGllZCB0byB0aGUgb25lIGNhcmQsIEkgYWRkZWQgdGhlIGNvZGUgdG8gdXNlIAo+IGl0IGltcGxp
Y2l0bHksIHNvIGNkZXYgY2FuIGJlIHJlYWxseSBvbWl0dGVkLiBXaXRoIHRoZSBwcm9wb3NlZCBj
b2RlLCAKPiB0aGUgUGxheWJhY2tDVEwvQ2FwdHVyZUNUTCBhcmUgYWx3YXlzIGF2YWlsYWJsZSBm
b3IgdGhlIG9uZSBjYXJkIGNvbmZpZ3M6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJv
amVjdC9hbHNhLWxpYi9jb21taXQvYzA5OTMyOWNlNmZmZGIyNmZjN2E0YTZmZmI2ZmJiMTY2YTFl
ODU2YiAKClllcywgdGhhdCdzIGEgZ29vZCBjaGFuZ2UsIGl0J2xsIG1ha2UgaXQgZWFzaWVyIHRv
IG1hbmFnZSBjb25maWd1cmF0aW9ucy4KCi1QaWVycmUKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
