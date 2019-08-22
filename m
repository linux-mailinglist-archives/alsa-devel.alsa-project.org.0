Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4389A161
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 22:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 532DB1657;
	Thu, 22 Aug 2019 22:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 532DB1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566506785;
	bh=AQ56AngtreQ97mnoSlUkTeU18USY3e3PJMqw6zUT2T4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZQyNfpiCNNiab7YAij2ZIDyO9vooQx83iEzpmTrGPDZaKOLFZvXaGDY0G6FpESmk
	 o6ah/XROKK4M3ZvZOKdzJlRNS+A6pa8AwaRzd5YolijrOJfwqugVGfnl1SVBmZzmlL
	 Ie9Sn3BalOmx2d0xpew3UPmf+upY9fQOdm+6fNzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 171B1F8036E;
	Thu, 22 Aug 2019 22:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38BB3F8036E; Thu, 22 Aug 2019 22:44:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 385CFF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 22:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385CFF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 13:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,418,1559545200"; d="scan'208";a="169910240"
Received: from pbossart-mobl3.an.intel.com (HELO [10.122.138.229])
 ([10.122.138.229])
 by orsmga007.jf.intel.com with ESMTP; 22 Aug 2019 13:44:32 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
 <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
 <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
 <3ff82f6b-647f-5f9c-09c7-be42a00c8bd4@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4722ef7e-0fc7-4ec5-c37c-a0e58961345d@linux.intel.com>
Date: Thu, 22 Aug 2019 15:44:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ff82f6b-647f-5f9c-09c7-be42a00c8bd4@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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

CgpPbiA4LzIyLzE5IDI6MDIgUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTIyIDIwOjQ0LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4KPj4gT24gOC8yMi8x
OSAxMjoxNCBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gT24gMjAxOS0wOC0yMiAxODo0
MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDgvMjIvMTkg
MTE6MDUgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4gT24gMjAxOS0wOC0yMiAxNzo1
OCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE9uIDgv
MjIvMTkgNjozNiBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4+Pj4+IEFwYXJ0IGZyb20g
SGFzd2VsbCBtYWNoaW5lcywgYWxsIG90aGVyIGRldmljZXMgaGF2ZSB0aGVpciBwcml2YXRlIAo+
Pj4+Pj4+IGRhdGEKPj4+Pj4+PiBzZXQgdG8gc25kX3NvY19hY3BpX21hY2ggaW5zdGFuY2UuCj4+
Pj4+Pj4KPj4+Pj4+PiBDaGFuZ2VzIGZvciBIU1cvIEJEVyBib2FyZHMgaW50cm9kdWNlZCB3aXRo
IHNlcmllczoKPj4+Pj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEwNzgy
MDM1Lwo+Pj4+Pj4+Cj4+Pj4+Pj4gYWRkZWQgc3VwcG9ydCBmb3IgZGFpX2xpbmsgcGxhdGZvcm1f
bmFtZSBhZGp1c3RtZW50cyB3aXRoaW4gY2FyZCAKPj4+Pj4+PiBwcm9iZQo+Pj4+Pj4+IHJvdXRp
bmVzLiBUaGVzZSB0YWtlIGZvciBncmFudGVkIHByaXZhdGVfZGF0YSBwb2ludHMgdG8KPj4+Pj4+
PiBzbmRfc29jX2FjcGlfbWFjaCB3aGVyZWFzIGZvciBIYXN3ZWxsLCBpdCdzIHNzdF9wZGF0YSBp
bnN0ZWFkLiAKPj4+Pj4+PiBDaGFuZ2UKPj4+Pj4+PiBwcml2YXRlIGNvbnRleHQgb2YgcGxhdGZv
cm1fZGV2aWNlIC0gcmVwcmVzZW50aW5nIG1hY2hpbmUgYm9hcmQgLSB0bwo+Pj4+Pj4+IGFkZHJl
c3MgdGhpcy4KPj4+Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiBlODcwNTVkNzMyZTMgKCJBU29DOiBJbnRl
bDogaGFzd2VsbDogcGxhdGZvcm0gbmFtZSBmaXh1cCAKPj4+Pj4+PiBzdXBwb3J0IikKPj4+Pj4+
PiBGaXhlczogN2U0MGRkY2Y5NzRhICgiQVNvQzogSW50ZWw6IGJkdy1ydDU2Nzc6IHBsYXRmb3Jt
IG5hbWUgCj4+Pj4+Pj4gZml4dXAgc3VwcG9ydCIpCj4+Pj4+Pj4gRml4ZXM6IDJkMDY3YjI4MDdm
OSAoIkFTb0M6IEludGVsOiBicm9hZHdlbGw6IHBsYXRmb3JtIG5hbWUgZml4dXAgCj4+Pj4+Pj4g
c3VwcG9ydCIpCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2V6YXJ5IFJvamV3c2tpIDxjZXphcnku
cm9qZXdza2lAaW50ZWwuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IMKgIHNvdW5kL3NvYy9pbnRl
bC9jb21tb24vc3N0LWFjcGkuYyB8IDMgKystCj4+Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFjcGkuYyAKPj4+Pj4+PiBiL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc3N0LWFjcGkuYwo+Pj4+Pj4+IGluZGV4IDE1ZjJiMjdlNjQzZi4uYzM0ZjYy
OGM3OTg3IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFj
cGkuYwo+Pj4+Pj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFjcGkuYwo+Pj4+
Pj4+IEBAIC0xMDksMTEgKzEwOSwxMiBAQCBpbnQgc3N0X2FjcGlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAKPj4+Pj4+PiAqcGRldikKPj4+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4+PiDC
oMKgwqDCoMKgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHNzdF9hY3BpKTsKPj4+Pj4+PiAr
wqDCoMKgIG1hY2gtPnBkYXRhID0gc3N0X3BkYXRhOwo+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogcmVn
aXN0ZXIgbWFjaGluZSBkcml2ZXIgKi8KPj4+Pj4+PiDCoMKgwqDCoMKgIHNzdF9hY3BpLT5wZGV2
X21hY2ggPQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0
ZXJfZGF0YShkZXYsIG1hY2gtPmRydl9uYW1lLCAtMSwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3N0X3BkYXRhLCBzaXplb2YoKnNz
dF9wZGF0YSkpOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtYWNoLCBzaXplb2YoKm1hY2gpKTsKPj4+Pj4+Cj4+Pj4+PiBJIG5vdyBh
Z3JlZSB0aGF0IHRoZSBjb2RlIEkgYWRkZWQgaXMgaW5jb3JyZWN0IGFuZCBwcm9iYWJseSAKPj4+
Pj4+IGFjY2Vzc2VzIG1lbW9yeSBvZmZzZXRzIHRoYXQgYXJlbid0IHJpZ2h0LiBJIGhhdmUgYWJz
b2x1dGVseSBubyAKPj4+Pj4+IGlkZWEgd2h5IEkgYWRkZWQgdGhpcyBjb21tZW50IHRoYXQgJ2xl
Z2FjeSBkb2VzIG5vdCBwYXNzIAo+Pj4+Pj4gcGFyYW1ldGVycycgd2hlbiBpdCBtb3N0IGRlZmlu
aXRpdmVseSBkb2VzLiBHb29kIGNhdGNoIG9uIHlvdXIgc2lkZS4KPj4+Pj4+Cj4+Pj4+PiBUaGF0
IHNhaWQsIGRvZXNuJ3QgdGhlIHByb3Bvc2VkIGZpeCBpbnRyb2R1Y2UgYW5vdGhlciBpc3N1ZT8K
Pj4+Pj4+Cj4+Pj4+PiBJbiB0aGUgbWFjaGluZSBkcml2ZXJzLCB5b3Ugc3RpbGwgZ2V0IHBkYXRh
IGRpcmVjdGx5LCBzbyBhcmVuJ3QgCj4+Pj4+PiB5b3UgbWlzc2luZyBhbiBpbmRpcmVjdGlvbiB0
byBnZXQgYmFjayB0byBwZGF0YSBmcm9tIG1hY2g/Cj4+Pj4+Pgo+Pj4+Pj4gc3RhdGljIGludCBi
ZHdfcnQ1Njc3X3J0ZF9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpCj4+Pj4+
PiB7Cj4+Pj4+PiDCoMKgwqDCoMKgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQg
PSAKPj4+Pj4+IHNuZF9zb2NfcnRkY29tX2xvb2t1cChydGQsIERSVl9OQU1FKTsKPj4+Pj4+IMKg
wqDCoMKgwqBzdHJ1Y3Qgc3N0X3BkYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoY29tcG9u
ZW50LT5kZXYpOwo+Pj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBzc3RfaHN3ICpicm9hZHdlbGwgPSBw
ZGF0YS0+ZHNwOwo+Pj4+Pj4KPj4+Pj4+IDw8PCBzbyBoZXJlIHlvdSB0b29rIHRoZSB3cm9uZyBw
b2ludGVyLCBubz8KPj4+Pj4KPj4+Pj4gQm90aCBCYXl0cmFpbCBhbmQgSGFzd2VsbCBhcmUgZW51
bWVyYXRlZCBpbiBhIGJpdCBkaWZmZXJlbnQgZmFzaGlvbiAKPj4+Pj4gdGhhbiBTS0wgZXF1aXZh
bGVudHMuCj4+Pj4+Cj4+Pj4+IFRoZXJlIGlzIGFuIGluLXBsYWNlIHJlZ2lzdHJhdGlvbiBmb3Ig
bWFjaGluZSBkZXZpY2UgLSB3aG9zZSAKPj4+Pj4gcHJpdmF0ZV9kYXRhIGdldHMgdXNlZCBpbiBt
YWNoaW5lIHByb2JlIC0gYW5kIHBjbSBkZXZpY2Ugd2hpY2ggCj4+Pj4+IGhhcHBlbnMgb24gZmly
bXdhcmUgbG9hZCBjYWxsYmFjayAKPj4+Pj4gKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1h
Y3BpOjYzKS4gX3J0ZF9pbml0IG1ha2VzIHVzZSBvZiB0aGUgCj4+Pj4+IGxhdHRlciBvZiB0d28u
Cj4+Pj4KPj4+PiBJIGRvbid0IGdldCB5b3VyIGV4cGxhbmF0aW9ucy4gY2FuIHlvdSBlbGFib3Jh
dGUgb24gd2hhdCB0aGlzIGRvZXMgCj4+Pj4gbm93IHRoYXQgcGRhdGEgaXMgbm8gbG9uZ2VyIHBh
c3NlZCBhcyBhbiBhcmd1bWVudCB0byB0aGUgbWFjaGluZSAKPj4+PiBkcml2ZXI6Cj4+Pj4KPj4+
PiBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9IHNuZF9zb2NfcnRkY29tX2xv
b2t1cChydGQsIAo+Pj4+IERSVl9OQU1FKTsKPj4+PiBzdHJ1Y3Qgc3N0X3BkYXRhICpwZGF0YSA9
IGRldl9nZXRfcGxhdGRhdGEoY29tcG9uZW50LT5kZXYpOwo+Pj4+Cj4+Pj4gdGhlICdjb21wb25l
bnQnIGhlcmUgaXMgbm90IHRoZSBQQ00gb25lLCBpcyBpdD8KPj4+Pgo+Pj4+Cj4+Pgo+Pj4gU3Vy
ZSB0aGluZy4KPj4+Cj4+PiBDb2RlOgo+Pj4gwqDCoMKgwqDCoC8qIHJlZ2lzdGVyIG1hY2hpbmUg
ZHJpdmVyICovCj4+PiDCoMKgwqDCoMKgc3N0X2FjcGktPnBkZXZfbWFjaCA9Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwgbWFjaC0+ZHJ2X25h
bWUsIC0xLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3BkYXRhKSk7Cj4+Pgo+Pj4gRm91bmQgaW4g
c3N0X2FjcGlfcHJvYmUgKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpLmM6MTQ1KSAK
Pj4+IGdlbmVyYXRlcyBuZXcgcGxhdGZvcm1fZGV2aWNlIC0gd2hpY2ggcmVwcmVzZW50cyBtYWNo
aW5lIGJvYXJkIC0gd2l0aCAKPj4+IGl0cyBwcml2YXRlIGRhdGEgc2V0IHRvIHBvaW50ZXIgdG8g
aW5zdGFuY2Ugb2Ygc3RydWN0IHNzdF9wZGF0YSB0eXBlLiAKPj4+IFRoaXMgZGF0YSBnZXRzIHVz
ZWQgb24gbWFjaGluZSBib2FyZCBwcm9iZSwgZS5nLjogCj4+PiBicm9hZHdlbGxfYXVkaW9fcHJv
YmUgKC9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2Jyb2Fkd2VsbC5jOjI3MCkuCj4+PiBJbnZvbHZl
ZCBwbGF0Zm9ybSBpcyBjYWxsZWQ6IGJyb2Fkd2VsbC1hdWRpby4gUmVxdWVzdGVkIHByaXZhdGUg
ZGF0YSAKPj4+IHR5cGUgYnkgYnJvYWR3ZWxsX2F1ZGlvX3Byb2JlOiBzdHJ1Y3Qgc25kX3NvY19h
Y3BpX21hY2ggKi4gTUlTTUFUQ0guCj4+Pgo+Pj4KPj4+IENvZGU6Cj4+Pgo+Pj4gwqDCoMKgwqDC
oC8qIHJlZ2lzdGVyIFBDTSBhbmQgREFJIGRyaXZlciAqLwo+Pj4gwqDCoMKgwqDCoHNzdF9hY3Bp
LT5wZGV2X3BjbSA9Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rl
cl9kYXRhKGRldiwgZGVzYy0+ZHJ2X25hbWUsIC0xLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3Bk
YXRhKSk7Cj4+Pgo+Pj4gRm91bmQgaW4gc3N0X2FjcGlfZndfY2IgKC9zb3VuZC9zb2MvaW50ZWwv
Y29tbW9uL3NzdF9hY3BpX2Z3X2NiOjQ3KSAKPj4+IGdlbmVyYXRlcyBuZXcgcGxhdGZvcm1fZGV2
aWNlIC0gd2hpY2ggcmVwcmVzZW50cyBIYXN3ZWxsIFBDTSwgeW91IG1heSAKPj4+IHRyZWF0IGl0
IGFzIFNreWxha2UgZXF1aXZhbGVudCAtIHdpdGggaXRzIHByaXZhdGUgZGF0YSBzZXQgdG8gcG9p
bnRlciAKPj4+IHRvIGluc3RhbmNlIG9mIHN0cnVjdCBzc3RfcGRhdGEgdHlwZS4gVGhpcyBkYXRh
IGdldHMgdXNlZCBvbiBkYWkgCj4+PiAuaW5pdCAtIGJyb2Fkd2VsbF9ydGRfaW5pdCAtIGludm9j
YXRpb24gd2hlbiBjYXJkIGlzIGluc3RhbnRpYXRlZCBieSAKPj4+IEFTb0MgY29kZS4gQXMgeW91
IGNhbiBzZWUgb24gCj4+PiAoL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYnJvYWR3ZWxsLmM6MTYy
KSwgcGxhdGZvcm0gdGllZCB3aXRoIGl0IGlzOiAKPj4+IGhhc3dlbGwtcGNtLWF1ZGlvLiBSZXF1
ZXN0ZWQgcHJpdmF0ZSBkYXRhIHR5cGUgYnkgYnJvYWR3ZWxsX3J0ZF9pbml0IAo+Pj4gLSBzdHJ1
Y3Qgc3N0X3BkYXRhICouIE1BVENILgo+Pgo+Pgo+PiB0aGUgbWFjaGluZSBkcml2ZXJzIHVzZXMg
c25kX3NvY19ydGRjb21fbG9va3VwKHJ0ZCwgRFJWX05BTUUpOwo+Pgo+PiBIb3cgaXMgRFJWX05B
TUUgY29ubmVjdGVkIHRvIGhhc3dlbGwtcGNtLWF1ZGlvPwo+Pgo+PiBJIG11c3QgYmUgbWlzc2lu
ZyBzb21ldGhpbmcgaW4geW91ciBsb2dpYy4KPj4KPiAKPiBQbGVhc2UgY2hlY2tvdXQgc3N0LWFj
cGkuYyBmaWxlIGFuZCBzZWUgZGVjbGFyYXRpb24gb2YgbGVnYWN5IHBsYXRmb3JtIAo+IGRlc2Ny
aXB0b3JzLiBTZWUgdGhlIG5hbWVzIG9mIFBDTSBkZXZpY2VzIChwbGF0Zm9ybSBkZXZpY2VzKSBi
ZWluZyAKPiBkZWNsYXJlZC4KCndoYXQgaGFwcGVucyBpbiBzc3QtYWNwaS5jIHN0YXlzIGluIHNz
dC1hY3BpLmMKSSBkb24ndCBnZXQgaG93IHlvdSByZXRyaWV2ZSB0aGUgcGRhdGEgaW4gdGhlIG1h
Y2hpbmUgZHJpdmVyIGZyb20gCiphbm90aGVyKiBkcml2ZXIuIERpZmZlcmVudCBkZXZpY2VzLCBk
aWZmZXJlbnQgcGxhdGZvcm0gZGF0YS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
