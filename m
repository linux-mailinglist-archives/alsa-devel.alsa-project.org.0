Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB967B249F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 19:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5C7166D;
	Fri, 13 Sep 2019 19:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5C7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568395815;
	bh=Bi0c4YMiFRe9JmaR8tqxX8blbTASb50QCvj2AdAchkU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TeQfEPdo4gZg50oL9/Pn2Wl2fd3iLVN1+AEJNqpSDrLt16Ad8KZ7CV2qQJRAy6qNc
	 cktt77Qdc4y+bnvmsilR01mYmpKOP9G/TopdTlBeghpDled0EVTo+oVdV1mGCX+KDn
	 aZWtp2PJbjlebCToyxvPYtxMUj5ZOGJgXL+pqfnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AC1F8036A;
	Fri, 13 Sep 2019 19:28:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAAFBF8036A; Fri, 13 Sep 2019 19:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC27AF80143
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 19:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC27AF80143
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 10:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="179742919"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 13 Sep 2019 10:28:13 -0700
Received: from vjyoung-mobl.amr.corp.intel.com (unknown [10.251.12.73])
 by linux.intel.com (Postfix) with ESMTP id ADFD55803FA;
 Fri, 13 Sep 2019 10:28:12 -0700 (PDT)
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
References: <20190912022740.161798-1-yuhsuan@chromium.org>
 <f2d9e339-ef96-8bb4-7360-422d317a470f@linux.intel.com>
 <CAGvk5PpCOG0Jii_vksrewZ_Dfmc+OVM9C6pkCYLY=n+ac-wVaA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bd442561-8fd9-0814-66c6-e08a21bb1a97@linux.intel.com>
Date: Fri, 13 Sep 2019 12:27:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAGvk5PpCOG0Jii_vksrewZ_Dfmc+OVM9C6pkCYLY=n+ac-wVaA@mail.gmail.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927:
 Add dmic format constraint
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

cGxlYXNlIGRvbid0IHRvcC1wb3N0IG9uIHB1YmxpYyBtYWlsaW5nIGxpc3RzLCB0aGFua3MuCgpP
biA5LzEzLzE5IDk6NDUgQU0sIFl1LUhzdWFuIEhzdSB3cm90ZToKPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXchIElmIEknbSBub3QgbWlzdGFrZW4sIHRoZSBtaWNyb3Bob25lIGlzIGF0dGFjaGVkIAo+
IHRvIGV4dGVybmFsIGNvZGVjKHJ0NTUxNCkgaW5zdGVhZCBvZiBQQ0ggb24gS2FieWxha2UgcGxh
dGZvcm0uIFNvIHRoZXJlIAo+IHNob3VsZCBiZSBhIFRETSBiZXR3ZWVuIERNSUNzIGFuZCBQQ0gu
IFdlIGNhbiBzZWUgaW4gdGhlIAo+IGthYnlsYWtlX3NzcDBfaHdfcGFyYW1zwqBmdW5jdGlvbiwg
dGhlcmUgYXJlIHNvbWUgb3BlcmF0aW9ucyBhYm91dCAKPiBzZXR0aW5nwqB0ZG0gc2xvdF93aWR0
aCB0byAxNiBiaXRzLiBUaGVyZWZvcmUsIEkgdGhpbmsgaXQgb25seSBzdXBwb3J0cyAKPiBTMTZf
TEUgZm9ybWF0IGZvciBETUlDcy4gSXMgaXQgY29ycmVjdD8KCkFoIHllcywgb2suIHdlIGhhdmUg
b3RoZXIgbWFjaGluZSBkcml2ZXJzIHdoZXJlIGRtaWMgcmVmZXJzIHRvIHRoZSBQQ0ggCmF0dGFj
aGVkIGNhc2UsIHRoYW5rcyBmb3IgdGhlIHByZWNpc2lvbi4KCkkgYW0gc3RpbGwgbm90IGNsZWFy
IG9uIHRoZSBwcm9ibGVtLCB5b3UgYXJlIGFkZGluZyB0aGlzIGNvbnN0cmFpbnQgdG8gYSAKZnJv
bnQtZW5kLCBzbyBpbiB0aGVvcnkgdGhlIGNvcGllciBlbGVtZW50IGluIHRoZSBmaXJtd2FyZSBz
aG91bGQgdGFrZSAKY2FyZSBvZiBjb252ZXJ0aW5nIGZyb20gMTYtYml0cyByZWNvcmRlZCBvbiB0
aGUgVERNIGxpbmsgdG8gdGhlIDI0IGJpdHMgCnVzZWQgYnkgdGhlIGFwcGxpY2F0aW9uLiBJcyB0
aGlzIG5vdCB0aGUgY2FzZT8gaXMgdGhpcyBwYXRjaCBiYXNlZCBvbiBhbiAKYWN0dWFsIGVycm9y
IGFuZCBpZiB5ZXMgY2FuIHlvdSBzaGFyZSBtb3JlIGluZm9ybWF0aW9uIHRvIGhlbHAgY2hlY2sg
CndoZXJlIHRoZSBwcm9ibGVtIGhhcHBlbnMsIHRvcG9sb2d5IG1heWJlPwoKPiAKPiBQaWVycmUt
TG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tIAo+IDxt
YWlsdG86cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPj4g5pa8IDIwMTnlubQ5
5pyIMTLml6Ug6YCx5ZubIOS4iyAKPiDljYg5OjAy5a+r6YGT77yaCj4gCj4gICAgIE9uIDkvMTEv
MTkgOToyNyBQTSwgWXUtSHN1YW4gSHN1IHdyb3RlOgo+ICAgICAgPiAyNCBiaXRzIHJlY29yZGlu
ZyBmcm9tIERNSUMgaXMgbm90IHN1cHBvcnRlZCBmb3IgS0JMIHBsYXRmb3JtIGJlY2F1c2UKPiAg
ICAgID4gdGhlIFRETSBzbG90IGJldHdlZW4gUENIIGFuZCBjb2RlYyBpcyAxNiBiaXRzIG9ubHku
IFdlIHNob3VsZCBhZGQgYQo+ICAgICAgPiBjb25zdHJhaW50IHRvIHJlbW92ZSB0aGF0IHVuc3Vw
cG9ydGVkIGZvcm1hdC4KPiAKPiAgICAgSHVtbSwgd2hlbiB5b3UgdXNlIERNSUNzIHRoZXkgYXJl
IGRpcmVjdGx5IGNvbm5lY3RlZCB0byB0aGUgUENIIHdpdGggYQo+ICAgICBzdGFuZGFyZCAxLWJp
dCBQRE0uIFRoZXJlIGlzIG5vIG5vdGlvbiBvZiBURE0gb3Igc2xvdC4KPiAKPiAgICAgSXQgY291
bGQgdmVyeSB3ZWxsIGJlIHRoYXQgdGhlIGZpcm13YXJlL3RvcG9sb2d5IG9ubHkgc3VwcG9ydCAx
NiBiaXQgKEkKPiAgICAgdmFndWVseSByZWNhbGwgYW5vdGhlciBjYXNlIHdoZXJlIDI0IGJpdHMg
d2FzIGFkZGVkKSwgYnV0IHRoZQo+ICAgICBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWl0IG1lc3Nh
Z2Ugd291bGQgbmVlZCB0byBiZSBtb2RpZmllZCB0byBtYWtlIHRoZQo+ICAgICByZWFzb24gZm9y
IHRoaXMgY2hhbmdlIGNsZWFyZXIuCj4gCj4gICAgICA+Cj4gICAgICA+IFNpZ25lZC1vZmYtYnk6
IFl1LUhzdWFuIEhzdSA8eXVoc3VhbkBjaHJvbWl1bS5vcmcKPiAgICAgPG1haWx0bzp5dWhzdWFu
QGNocm9taXVtLm9yZz4+Cj4gICAgICA+IC0tLQo+ICAgICAgPsKgIMKgc291bmQvc29jL2ludGVs
L2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODkyNy5jIHwgMyArKysKPiAgICAgID7CoCDC
oDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAgICAgID4KPiAgICAgID4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5Mjcu
Ywo+ICAgICBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4OTg5
MjcuYwo+ICAgICAgPiBpbmRleCA3NGRkYTg3ODRmMWEwMS4uNjdiMjc2YTY1YThkMmQgMTAwNjQ0
Cj4gICAgICA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRf
bWF4OTg5MjcuYwo+ICAgICAgPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2
NjNfcnQ1NTE0X21heDk4OTI3LmMKPiAgICAgID4gQEAgLTQwMCw2ICs0MDAsOSBAQCBzdGF0aWMg
aW50IGthYnlsYWtlX2RtaWNfc3RhcnR1cChzdHJ1Y3QKPiAgICAgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSkKPiAgICAgID7CoCDCoCDCoCDCoHNuZF9wY21faHdfY29uc3RyYWludF9saXN0
KHJ1bnRpbWUsIDAsCj4gICAgIFNORFJWX1BDTV9IV19QQVJBTV9DSEFOTkVMUywKPiAgICAgID7C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtaWNfY29uc3RyYWludHMpOwo+ICAg
ICAgPgo+ICAgICAgPiArwqAgwqAgwqBydW50aW1lLT5ody5mb3JtYXRzID0gU05EUlZfUENNX0ZN
VEJJVF9TMTZfTEU7Cj4gICAgICA+ICvCoCDCoCDCoHNuZF9wY21faHdfY29uc3RyYWludF9tc2Jp
dHMocnVudGltZSwgMCwgMTYsIDE2KTsKPiAgICAgID4gKwo+ICAgICAgPsKgIMKgIMKgIMKgcmV0
dXJuIHNuZF9wY21faHdfY29uc3RyYWludF9saXN0KHN1YnN0cmVhbS0+cnVudGltZSwgMCwKPiAg
ICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFNORFJWX1BDTV9IV19QQVJB
TV9SQVRFLCAmY29uc3RyYWludHNfcmF0ZXMpOwo+ICAgICAgPsKgIMKgfQo+ICAgICAgPgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
