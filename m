Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BE14C166
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 21:07:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A23B1671;
	Tue, 28 Jan 2020 21:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A23B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580242023;
	bh=BFH4bP0Ue2SzdNs02/El+uvhgPd2ThWS89pBLP4MVXQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvmDfw/qj9IFf9/YfKMLR+pzfpDrV//x1HSNNwH2BnbXRKRrc99ZBlPX8nAKa70hU
	 xP5qNWOJe0UzQ46AJJsBuuX2PgBctY4eODcqGgBnDhSVL0M+mScOoUfYppXqD3ml+h
	 6JHi+QtWpx9PfdF2V6oF907ZAUkKjVAVc/CRDQ+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86784F800FF;
	Tue, 28 Jan 2020 21:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35C52F80150; Tue, 28 Jan 2020 21:05:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 698E6F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 21:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 698E6F80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 11:40:07 -0800
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; d="scan'208";a="222212463"
Received: from mwasko-mobl1.ger.corp.intel.com (HELO [10.252.50.227])
 ([10.252.50.227])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 28 Jan 2020 11:40:04 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
 <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
 <013c7d4b-c08f-f476-50fe-70ae22580277@linux.intel.com>
 <5516562e-9f0c-55c8-a193-b1a80a341392@linux.intel.com>
 <1b8a4612-338e-0d75-57bb-6deb4055f45e@linux.intel.com>
 <803a0824-ed50-7b7c-ef15-c98cafef77e2@linux.intel.com>
From: "Wasko, Michal" <michal.wasko@linux.intel.com>
Message-ID: <b28853ed-f51b-a5a1-9ec7-d34bb6eea12e@linux.intel.com>
Date: Tue, 28 Jan 2020 20:40:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <803a0824-ed50-7b7c-ef15-c98cafef77e2@linux.intel.com>
Content-Language: en-US
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

Ck9uIDEvMjcvMjAyMCA0OjMwIFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPgo+Pj4+
IEFzIGl0IHdhcyBhZ3JlZWQgd2l0aCB5b3UgUGllcnJlIHRoZSBTa3lsYWtlIGRyaXZlciB3aWxs
IGJlIGtlcHQgCj4+Pj4gdW5kZXIgbWFpbnRlbmFuY2UgYW5kIHRoZSBwcm9wb3NlZCBjaGFuZ2Vz
IGFyZSBhYm91dCB0byBrZWVwIAo+Pj4+IGhkYS1kc3AgY29uZmlndXJhdGlvbiBmdW5jdGlvbmFs
IGZvciBhbnlvbmUgd2hvIHdvdWxkIGxpa2UgdG8gdXNlIAo+Pj4+IGl0LiBMaW51cyBsYXB0b3Ag
aXNzdWUgaXMgYWN0dWFsbHkgb25lIG9mIHRoZSBnb29kIHJlYXNvbnMgd2h5IHdlIAo+Pj4+IHdv
dWxkIGxpa2UgdG8ga2VlcCBoZGEtZHNwIGNvbmZpZ3VyYXRpb24gZnVuY3Rpb25hbAo+Pj4KPj4+
IFdlIGhhdmUgdG8gYWdyZWUgb24gd2hhdCAnbWFpbnRhaW5lZCcgbWVhbnMgdGhlbi4KPj4+Cj4+
PiBJIGRvbid0IG1pbmQgbGVhdmluZyB0aGUgU2t5bGFrZSBkcml2ZXIgaW4gdGhlIGtlcm5lbCBh
bmQgbGV0dGluZyAKPj4+IHBlb3BsZSB3aG8gaGF2ZSBhY2Nlc3MgdG8gSW50ZWwgc3VwcG9ydCB1
c2UgaXQuIENlemFyeSBpcyBsaXN0ZWQgYXMgCj4+PiB0aGUgbWFpbnRhaW5lciBhcyBJIHN1Z2dl
c3RlZCBpdCwgYW5kIHRoaXMgcGF0Y2ggcHJvdmlkZXMgYW4gCj4+PiBuZWNlc3NhcnkgZml4Lgo+
Pj4KPj4+IEJ1dCBkb2VzIHRoaXMgbWVhbiB0aGlzIEhkYXVkaW8gb3B0aW9uIGlzIHVzYWJsZSBi
eSBkaXN0cmlidXRpb25zIAo+Pj4gYW5kIExpbnV4IHVzZXJzIHdobyBkb24ndCBoYXZlIGFjY2Vz
cyB0byBJbnRlbCBzdXBwb3J0Pwo+Pj4KPj4+IEkgd2lsbCBhc3NlcnQgdGhhdCBpdCdzIG5vdCwg
YmFzZWQgb24gbXkgb3duIGV4cGVyaWVuY2Ugb25seSAyIHdlZWtzIAo+Pj4gYWdvLiBJIHRyaWVk
IHRvIG1ha2UgYXVkaW8gd29yayBvbiBhIEtCTCBOVUMgYW5kIGhhZCB0byBjb21tZW50IAo+Pj4g
c3R1ZmYgb3V0IGR1ZSB0byBhbiBvYnNvbGV0ZSB0b3BvbG9neS4gc2VlIAo+Pj4gaHR0cHM6Ly9n
aXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC8xNjY3I2lzc3VlY29tbWVudC01NzIz
MTIxNTcKPj4gVGhhdCBpcyBleGFjdGx5IHRoZSByZWFzb24gd2h5IHdlIHdvdWxkIGxpa2UgdG8g
dXBkYXRlIHRoZSBTa3lsYWtlIAo+PiBkcml2ZXIgdXBzdHJlYW0gY29kZSBhbmQgaXQgY29uZmln
dXJhdGlvbiBmaWxlcyBzbyB0aGF0IGl0IHdpbGwgYmUgCj4+IHVzYWJsZSBieSB0aGUgY29tbXVu
aXR5IGFuZCBub3Qgb25seSBrZWVwIGl0IGZ1bmN0aW9uYWwgaW50ZXJuYWxseS4gCj4+IEFzIGl0
IHdhcyBjbGFyaWZpZWQgYnkgQ2V6YXJ5LCB3ZSB3b3VsZCBsaWtlIHRvIG1ha2UgYSBtaW5pbXVt
IG51bWJlciAKPj4gb2YgY2hhbmdlcyB0aGF0IGFyZSByZXF1aXJlZC4KPj4KPj4gSXMgdGhlcmUg
UGllcnJlIGFueSBub24tdGVjaG5pY2FsIHJlYXNvbiB3aHkgd2Ugc2hvdWxkIG5vdCBmaXggdGhl
IAo+PiBTa3lsYWtlIGRyaXZlciBjb2RlIG9uIHRoZSB1cHN0cmVhbT8KPgo+IE15IGNvbW1lbnQg
d2FzIG9ubHkgcmVnYXJkaW5nIHN1cHBvcnQgb2YgSERhdWRpbyBjb2RlY3Mgdy8gdGhlIFNreWxh
a2UgCj4gZHJpdmVyLiBJIHBlcnNvbmFsbHkgZ2F2ZSB1cCB0cnlpbmcgdG8gc3VwcG9ydCB0aGlz
IG9wdGlvbiBhZnRlciAxLjUgCj4geXJzIG9mIHJlY3VycmluZyBpc3N1ZXMuIEl0IHdpbGwgdGFr
ZSBhIGxvdCBtb3JlIHRoYW4gbWluaW1hbCBwYXRjaGVzIAo+IEkgYW0gYWZyYWlkIGlmIHlvdSB3
YW50IHRoaXMgb3B0aW9uIHRvIHdvcmsgYWNyb3NzIGFsbCBrbm93biAKPiBjb21tZXJjaWFsIGRl
dmljZXMsIHlvdSB3aWxsIGhhdmUgdG8gYWRkcmVzcyByYWNlIGNvbmRpdGlvbnMgc3VjaCBhcyAK
PiB0aGUgcHJvYmUgZmFpbGluZyB3aGVuIERSTSBpcyBidWlsdCBhcyBhIG1vZHVsZSwgb3Igb24g
c3BlY2lmaWMgCj4gU0tML0FQTCBkZXZpY2VzLgo+Cj4gSWYgeW91IGFyZSBzaWduaW5nLXVwIHRv
IGRvIHRoaXMgd29yayBJIGhhdmUgbm8gb2JqZWN0aW9ucywgYW5kIGlmIGluIAo+IGFkZGl0aW9u
IHlvdSBhZGQgc3VwcG9ydCBmb3IgRE1JQ3MgeW91J2Qgc29sdmUgZXhpc3RpbmcgaXNzdWVzIHdp
dGggCj4gS0JML0FtYmVyTGFrZSBmb3Igd2hpY2ggdXNlcnMgYXJlIGxlZnQgd2l0aG91dCBhIHNv
bHV0aW9uLgo+Cj4gSnVzdCBiZSBhd2FyZSBvZiB3aGF0IHlvdSBhcmUgc2lnbmluZyB1cCBmb3Is
IGl0J3Mgbm90IGEgJ21pbmltYWwnIAo+IGVmZm9ydC4KPgpUaGUgcHJvcG9zZWQgcGF0Y2gtc2V0
IGlzIHRvIHJlc3RvcmUgdGhlIFNreWxha2UgZHJpdmVyIGZ1bmN0aW9uYWxpdHkgCmZvciBTa3ls
YWtlIGJhc2UgdGFyZ2V0cy4gSSBjYWxsZWQgaXQg4oCYbWluaW1hbOKAmSBiZWNhdXNlIGxhc3Qg
dGltZSB3aGVuIAp3ZSBoYXZlIHRyaWVkIHRvIHVwc3RyZWFtIHRoZSB3aWRlIHJhbmdlIG9mIHBh
dGNoLXNldHMgd2l0aCBjb2RlIApyZWZhY3RvcnMgaXQgd2FzIHJlamVjdGVkIGJlY2F1c2Ugb2Yg
4oCYbWFpbnRlbmFuY2XigJkgbWFyayBvbiB0aGUgZHJpdmVyLgoKQXMgd2UgZGlzY3Vzc2VkIG9u
IHRoZSBjYWxsIHdlIHdpbGwgdGFrZSBhIGNsb3NlciBsb29rIG9uIHRoZSBIVyBib2FyZHMgCnRo
YXQgY29udGludWUgdG8gcmVwcm9kdWNlIHRoZSByYWNlIGNvbmRpdGlvbiBpc3N1ZS4gSG93ZXZl
ciB0aGUgZml4IG9uIAp0aGF0IHNwZWNpZmljIHByb2JsZW0gd2lsbCBiZSBhZGRyZXNzZWQgYXMg
YSBzZXBhcmF0ZSBwYXRjaC1zZXQuCkFkZGl0aW9uYWxseSB3ZSB3aWxsIHdvcmsgb24gcHJvdmlk
aW5nIHJlZmVyZW5jZSB0b3BvbG9neSBjb25maWd1cmF0aW9uIApmaWxlcyB0aGF0IHN1cHBvcnQg
RE1JQ3MuCgpJIGNhbuKAmXQgY29tbWl0IGFueSB0aW1lZnJhbWUgYnV0IGFzIGxvbmcgYXMgd2Ug
d2lsbCBiZSBtYWludGFpbmVycyBhbmQgCnRoZSBjaGFuZ2VzIHdpbGwgYmUgd2VsY29tZSBvbiB0
aGUgdXBzdHJlYW0gd2Ugd2lsbCB3b3JrIG9uIGltcHJvdmluZyAKdGhlIGZ1bmN0aW9uYWxpdHkg
b2YgdGhlIFNreWxha2UgZHJpdmVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
