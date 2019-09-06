Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694FAB981
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 15:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047F3165E;
	Fri,  6 Sep 2019 15:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047F3165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567777392;
	bh=esaCsGEVEDM1PFFmL8m0gD5sSNr5k91zaHQLU0QFwV0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHdbkJ22R5Bc5JaPpvgbMJjGTsKuy1A/LY8oh1sEsnDD5GnitJwp+MgaEL23f7bqP
	 YuI6S27JFhI7u88KFVAwub/xXOGOU8jUAaRWhGAbBDgckgDW22Rar6KoEnNRGsyFse
	 nhk+BCzpJ0Dkmgod1LLAFbH+bKyJU6kKavYnpMIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 792A0F80390;
	Fri,  6 Sep 2019 15:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35882F80394; Fri,  6 Sep 2019 15:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25DCAF802DF;
 Fri,  6 Sep 2019 15:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DCAF802DF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 06:41:18 -0700
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
 d="scan'208,217";a="183141800"
Received: from pharlozi-mobl.ger.corp.intel.com (HELO [10.237.140.91])
 ([10.237.140.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 06 Sep 2019 06:41:16 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
 <s5hblvzguqb.wl-tiwai@suse.de>
From: "Harlozinski, Pawel" <pawel.harlozinski@linux.intel.com>
Message-ID: <f2ce89c3-f28f-091a-70a0-01da18ce25f3@linux.intel.com>
Date: Fri, 6 Sep 2019 15:41:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hblvzguqb.wl-tiwai@suse.de>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: cezary.rojewski@intel.com, patch@alsa-project.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 1/3] ALSA:hda: Simplify and clear
 calculating SDxFMT
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

VGhhbmtzIGZvciBub3RpY2luZyAhCgpJbmRlZWTCoCBzbmRfaGRhY19xdWVyeV9zdXBwb3J0ZWRf
cGNtKCkgYWxzbyBzaG91bGQgYmUgYWxpZ25lZC4KQ291bGQgeW91IGhlbHAgYSBiaXQgdGhlcmUg
d2l0aCBleHBsYWluaW5nIGJhY2tncm91bmQgb2YgY3VycmVudCAKaW1wbGVtZW50YXRpb24gPwpJ
J20gd29uZGVyaW5nwqAgd2h5IFNORFJWX1BDTV9GTVRCSVRfSUVDOTU4X1NVQkZSQU1FX0xFwqAg
aXMgc2V0IGluc3RlYWQgCm9mwqAgU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgaW4gY2FzZSBvZiB1
c2luZyAzMiBiaXRzIGFuZCBBQ19XQ0FQX0RJR0lUQUwuCgpXaGF0cyBtb3JlLCBicHMgbG9va3Mg
bGlrZSByZWR1bmRhbnQgaW5mb3JtYXRpb24gdGhlcmUsIGFzIHBjbSBmb3JtYXRzIApoYXZlIHdp
ZHRoIGRlZmluZWQgaW4gc291bmQvY29yZS9wY20tbWlzYy5jLgoKSSB3b3VsZCBsZWF2ZSAyMCBh
bmQgMjQgYml0cyBwZXIgc2FtcGxlIHRoZXJlLCBhcyB0aG9zZSBhcmUgCnN1cHBvcnRlZGZvcm1h
dHMgZm9yIHN0cmVhbSBETUEuCgpSZWdhcmRzLApQYXdlxYIKCk9uIDkvNS8yMDE5IDc6NDcgQU0s
IFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBUaHUsIDA1IFNlcCAyMDE5IDA3OjMyOjU5ICswMjAw
LAo+IFBhd2VsIEhhcmxvemluc2tpIHdyb3RlOgo+PiBTZXQgU0R4Rk1UIGJhc2VkIG9ubHkgb24g
Z2l2ZW4gZm9ybWF0LCBkdWUgdG8gbWF4YnBzIG5vdCBhbHdheXMgYmVpbmcgc2V0Lgo+PiBTcGxp
dCBjYXNlcyBmb3IgZm9ybWF0cyAyMCwyNCwzMiBiaXRzLgo+PiBGb3IgZm9ybWF0IFNORFJWX1BD
TV9GT1JNQVRfRkxPQVRfTEUgd2lkdGggaXMgZXF1YWwgMzIgc28gaXQgd2lsbCBlbmQgdXAKPj4g
d2l0aCBzYW1lIG1hc2suCj4gVGhpcyBmdW5jdGlvbiBjb3JyZXNwb25kcyB0byBzbmRfaGRhY19x
dWVyeV9zdXBwb3J0ZWRfcGNtKCksIHNvIHRoaXMKPiBwYXRjaCBicmVha3MuCj4KPiBCYXNpY2Fs
bHkgdGhlIGNhc2VzIG9mIDIwIGFuZCAyNCBhcmUgc3VwZXJmbHVvdXMgYW5kIGNhbiBiZSBkcm9w
cGVkLgo+IEl0J3MgdGhlcmUganVzdCB0byBiZSBzdXJlLgo+Cj4KPiBUYWthc2hpCj4KPj4gU2ln
bmVkLW9mZi1ieTogUGF3ZWwgSGFybG96aW5za2kgPHBhd2VsLmhhcmxvemluc2tpQGxpbnV4Lmlu
dGVsLmNvbT4KPj4gLS0tCj4+ICAgc291bmQvaGRhL2hkYWNfZGV2aWNlLmMgfCAxMSArKysrKy0t
LS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9oZGEvaGRhY19kZXZpY2UuYyBiL3NvdW5kL2hkYS9o
ZGFjX2RldmljZS5jCj4+IGluZGV4IGIyNmNjOTNlN2UxMC4uYWRkNzU4ZTExYjg1IDEwMDY0NAo+
PiAtLS0gYS9zb3VuZC9oZGEvaGRhY19kZXZpY2UuYwo+PiArKysgYi9zb3VuZC9oZGEvaGRhY19k
ZXZpY2UuYwo+PiBAQCAtNzU5LDE0ICs3NTksMTMgQEAgdW5zaWduZWQgaW50IHNuZF9oZGFjX2Nh
bGNfc3RyZWFtX2Zvcm1hdCh1bnNpZ25lZCBpbnQgcmF0ZSwKPj4gICAJCXZhbCB8PSBBQ19GTVRf
QklUU18xNjsKPj4gICAJCWJyZWFrOwo+PiAgIAljYXNlIDIwOgo+PiArCQl2YWwgfD0gQUNfRk1U
X0JJVFNfMjA7Cj4+ICsJCWJyZWFrOwo+PiAgIAljYXNlIDI0Ogo+PiArCQl2YWwgfD0gQUNfRk1U
X0JJVFNfMjQ7Cj4+ICsJCWJyZWFrOwo+PiAgIAljYXNlIDMyOgo+PiAtCQlpZiAobWF4YnBzID49
IDMyIHx8IGZvcm1hdCA9PSBTTkRSVl9QQ01fRk9STUFUX0ZMT0FUX0xFKQo+PiAtCQkJdmFsIHw9
IEFDX0ZNVF9CSVRTXzMyOwo+PiAtCQllbHNlIGlmIChtYXhicHMgPj0gMjQpCj4+IC0JCQl2YWwg
fD0gQUNfRk1UX0JJVFNfMjQ7Cj4+IC0JCWVsc2UKPj4gLQkJCXZhbCB8PSBBQ19GTVRfQklUU18y
MDsKPj4gKwkJdmFsIHw9IEFDX0ZNVF9CSVRTXzMyOwo+PiAgIAkJYnJlYWs7Cj4+ICAgCWRlZmF1
bHQ6Cj4+ICAgCQlyZXR1cm4gMDsKPj4gLS0gCj4+IDIuMTcuMQo+Pgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
