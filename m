Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4A14CEFF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:02:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E701674;
	Wed, 29 Jan 2020 18:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E701674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580317370;
	bh=Lyikqh5XiJBdsZ3+dvCDK7GrSGm3Mth/ypxzpGltNmo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ay/bzeKhUPebpA5A+IgrHqv+1F123y9ptQSTXavHxyA6hFrT8RV3qMSJVVJgtdWE8
	 X5YG3IzuZUc+Z69SxnUinJt6bZ2Hznd8SLcHb39J8oGYyjFtNVaaXgROyrTa7WO8Df
	 nCryzr8ezeZFCyTfuOfgrAsO/taOTZOsdajVVeH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A02CF80229;
	Wed, 29 Jan 2020 18:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FB5F8021E; Wed, 29 Jan 2020 18:01:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3797F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3797F80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 09:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,378,1574150400"; d="scan'208";a="222507714"
Received: from rnoffsin-mobl.amr.corp.intel.com (HELO [10.252.139.181])
 ([10.252.139.181])
 by orsmga008.jf.intel.com with ESMTP; 29 Jan 2020 09:01:00 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <CAFQqKeW5b5BEU1cXRzxqmmSNCQ8Qnifn3mivx4yVnrtk7Ho0Tg@mail.gmail.com>
 <s5hsgjyn1ci.wl-tiwai@suse.de>
 <aff5f7fd-13d2-b523-b3c6-a4529c4cf26e@linux.intel.com>
 <s5htv4edxf5.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d143aa71-92c7-5ba7-4866-68eef82b99b0@linux.intel.com>
Date: Wed, 29 Jan 2020 11:01:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5htv4edxf5.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: [alsa-devel] Question about the right fix for a sparse warning
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

Cgo+Pj4+IFdlJ3JlIHNlZWluZyB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nIGluIHRoZSBT
T0YgY29kZToKPj4+Pgo+Pj4+IHNvdW5kL3NvYy9zb2Yvc29mLWF1ZGlvLmM6ODY6MzE6IHdhcm5p
bmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQo+
Pj4+IHNvdW5kL3NvYy9zb2Yvc29mLWF1ZGlvLmM6ODY6MzE6ICAgIGV4cGVjdGVkIHJlc3RyaWN0
ZWQgc25kX3BjbV9zdGF0ZV90IFt1c2VydHlwZV0gc3RhdGUKPj4+PiBzb3VuZC9zb2Mvc29mL3Nv
Zi1hdWRpby5jOjg2OjMxOiAgICBnb3Qgc2lnbmVkIGludCBbc2lnbmVkXSBbdXNlcnR5cGVdIFtl
eHBsaWNpdGx5LXNpZ25lZF0gc3RhdGUKPj4+Pgo+Pj4+IFRoZSBsaW5lIHVuZGVyIHNjcnV0aW55
IHdoZXJlIHdlIGFzc2lnbiAic3RhdGUiIGlzIGFzIGZvbGxvd3M6Cj4+Pj4KPj4+PiBzdGF0ZSA9
IHN1YnN0cmVhbS0+cnVudGltZS0+c3RhdHVzLT5zdGF0ZTsKPj4+Pgo+Pj4+IGFuZCBpdCBpcyBk
ZWZpbmVkIGFzCj4+Pj4gc25kX3BjbV9zdGF0ZV90IHN0YXRlOwo+Pj4+Cj4+Pj4gVGhlcmUgYXJl
IG90aGVyIHBsYWNlcyAoZXggcGNtX29zcy5jKSB3aGVyZSBhIHNpbWlsYXIgYXNzaWdubWVudCBo
YXMgYmVlbiB1c2VkCj4+Pj4gYXMgd2VsbC4KPj4+Pgo+Pj4+IFdoYXQgZml4ZXMgdGhlIGlzc3Vl
IGlzIGEgZm9yY2VkIGNhc3QgdG8gc25kX3BjbV9zdGF0ZV90IGFzIGJlbG93IGJlZm9yZQo+Pj4+
IGFzc2lnbmluZzoKPj4+PiAgIMKgc3RhdGUgPSAoX19mb3JjZSBzbmRfcGNtX3N0YXRlX3Qpc3Vi
c3RyZWFtLT5ydW50aW1lLT5zdGF0dXMtPnN0YXRlOwo+Pj4+Cj4+Pj4gRG8geW91IHRoaW5rIHRo
aXMgaXMgYWNjZXB0YWJsZT8gSWYgbm90LCBjb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYW4KPj4+
PiBhbHRlcm5hdGl2ZT8KPj4+Cj4+PiBIbSwgSSBkb24ndCBzZWUgdGhlIHdhcm5pbmcgaW4gbXkg
Y29kZS4gIERpZCB5b3UgbWVyZ2UgYWxsIHVwc3RyZWFtCj4+PiBzdHVmZiBhbmQgc3RpbGwgZ2V0
IGl0Pwo+Pgo+PiBJdCdzIGJlZW4gbWVyZ2VkIGluIHRoZSBTT0YgdHJlZSAodG9waWMvc29mLWRl
dikgYW5kIGl0J2xsIGJlIGluIHRoZQo+PiBuZXh0IGJhdGNoIEkgc2VuZC4gSXQncyBub3QgdXBz
dHJlYW0ganVzdCB5ZXQgYmVjYXVzZSB3ZSB3YW50IHRvCj4+IHJlbW92ZSB0aGUgd2FybmluZyB0
byBtYWtlIHRoZSBwYXRjaCBuaWNlIGFuZCBzaGlueSA6LSkKPiAKPiBJIHN0aWxsIHdvbmRlciB3
aHkgSSBjb3VsZG4ndCBnZXQgaXQgb24gbXkgdHJlZS4gIEkgZ3Vlc3MgdGhlIGNvZGUKPiBhcm91
bmQgdGhhdCBoYXNuJ3QgY2hhbmdlZCwgcmlnaHQ/Cj4gCj4gV2FpdC4uLiAgSXMgaXQgYSB0ZXN0
IG9uIDMyYml0IGFyY2g/ICBJZiBzbywgaXQgbWlnaHQgYmUgYSBuZXcgdGhpbmcKPiBmb3IgeTIw
Mzggc3VwcG9ydC4gIFRoZW4gd2UgbWF5IGZpeCB0aGUgdWFwaSBkZWZpbml0aW9uIGluc3RlYWQu
CgpJdCdzIGFjdHVhbGx5IGluIHlvdXIgdHJlZSBhbHJlYWR5LCBteSBtaXN0YWtlLCBzZWU6Cgpl
ZTFlNzliNzJlM2NmICgiQVNvQzogU09GOiBwYXJ0aXRpb24gYXVkaW8tcmVsYXRlZCBwYXJ0cyBm
cm9tIFNPRiBjb3JlIikKCkl0J3Mgd2l0aCBwbGFpbi12YW5pbGxhIHg4Nl82NCwgSSBjYW4gc2hh
cmUgdGhlIGNvbmZpZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
