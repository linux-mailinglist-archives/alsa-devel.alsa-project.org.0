Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B870935FFE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 17:15:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B99B1695;
	Wed,  5 Jun 2019 17:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B99B1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559747727;
	bh=4rNTVw0/Uhk3yqQWDGg/hvc26w4cDY7drZT2p/WuVNQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=urteaqh+DENSJJ84I0y+LVx3PBX0Wdl+HmiQPFjjExAo6RpF4ceItjWU3/AI1/6ij
	 ToTKsK9kmplI8n5puk56aYP4NrekoJ8gc9YPNPESPp15EAIKvYgOZHf/CqtO0SRx93
	 tsj8So2z7UK13b8Kj8pLTZSnIYBTin7Pg0WFJRXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2311F896DD;
	Wed,  5 Jun 2019 17:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE45F896DD; Wed,  5 Jun 2019 17:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8408F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 17:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8408F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 08:13:34 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2019 08:13:34 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 3C2B75800BD;
 Wed,  5 Jun 2019 08:13:33 -0700 (PDT)
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
 <20190605134556.10322-4-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a171f010-6901-d256-4cfe-201cbed58970@linux.intel.com>
Date: Wed, 5 Jun 2019 10:13:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605134556.10322-4-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: Re: [alsa-devel] [PATCH 03/14] ALSA: hdac: Fix codec name after
 machine driver is unloaded and reloaded
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

T24gNi81LzE5IDg6NDUgQU0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOgo+IEZyb206IEFt
YWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGludGVsLmNvbT4KPiAKPiBU
aGlzIHJlc2V0cyBpbnRlcm5hbCBpbmRleCB1c2VkIGZvciBlbnVtYXJhdGluZyBjb2RlY3MuIFRo
aXMgd2lsbCBvbmx5Cj4gd29yayBvbiBhc3N1bXB0aW9uIHRoYXQgcGxhdGZvcm0gaGFzIG9uZSBj
b2RlYy4gQW55d2F5IGlmIHRoZXJlIGlzIG1vcmUsCj4gaXQgd29uJ3Qgd29yayB3aXRoIGN1cnJl
bnQgbWFjaGluZSBkcml2ZXJzLCBiZWNhdXNlIHdlIGNhbid0IGd1YXJhbnRlZQo+IG9yZGVyIGlu
IHdoaWNoIHRoZXkgYXJlIGVudW1lcmF0ZWQuIFRoaXMgd29ya2Fyb3VuZHMgdGhlIGZhY3QgdGhh
dCBtb3N0Cj4gaW50ZWwgbWFjaGluZSBkcml2ZXJzIGhhdmUgdGhlIGZvbGxvd2luZyBkZWZpbmVk
Ogo+IC5jb2RlY19uYW1lID0gImVoZGF1ZGlvMEQyIiwKPiBIb3dldmVyIHdoZW4gd2UgdW5sb2Fk
IGFuZCByZWxvYWQgbWFjaGluZSBkcml2ZXIgaWR4IGdldHMgaW5jcmVtZW50ZWQsCj4gc28gLmNv
ZGVjX25hbWUgd291bGQndmUgbmVlZGVkIHRvIGJlIHNldCB0byBlaGRhdWRpbzFEMiBvbiBmaXJz
dCByZWxvYWQKPiBhbmQgc28gb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdp
xYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29tPgo+IC0tLQo+ICAgc291bmQvaGRh
L2V4dC9oZGFjX2V4dF9idXMuYyB8IDExICsrKysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9o
ZGEvZXh0L2hkYWNfZXh0X2J1cy5jIGIvc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYwo+IGlu
ZGV4IGYzM2JhNThiNzUzYy4uYzg0ZDY5YzJlYmE0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL2hkYS9l
eHQvaGRhY19leHRfYnVzLmMKPiArKysgYi9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCj4g
QEAgLTc3LDYgKzc3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFjX2lvX29wcyBoZGFjX2V4
dF9kZWZhdWx0X2lvID0gewo+ICAgCS5kbWFfZnJlZV9wYWdlcyA9IGhkYWNfZXh0X2RtYV9mcmVl
X3BhZ2VzLAo+ICAgfTsKPiAgIAo+ICtzdGF0aWMgaW50IGlkeDsKPiArCj4gICAvKioKPiAgICAq
IHNuZF9oZGFjX2V4dF9idXNfaW5pdCAtIGluaXRpYWxpemUgYSBIRC1hdWRpbyBleHRlbmRlZCBi
dXMKPiAgICAqIEBlYnVzOiB0aGUgcG9pbnRlciB0byBleHRlbmRlZCBidXMgb2JqZWN0Cj4gQEAg
LTkzLDcgKzk1LDYgQEAgaW50IHNuZF9oZGFjX2V4dF9idXNfaW5pdChzdHJ1Y3QgaGRhY19idXMg
KmJ1cywgc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQkJY29uc3Qgc3RydWN0IGhkYWNfZXh0X2J1
c19vcHMgKmV4dF9vcHMpCj4gICB7Cj4gICAJaW50IHJldDsKPiAtCXN0YXRpYyBpbnQgaWR4Owo+
ICAgCj4gICAJLyogY2hlY2sgaWYgaW8gb3BzIGFyZSBwcm92aWRlZCwgaWYgbm90IGxvYWQgdGhl
IGRlZmF1bHRzICovCj4gICAJaWYgKGlvX29wcyA9PSBOVUxMKQo+IEBAIC0xMTgsNiArMTE5LDE0
IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHNuZF9oZGFjX2V4dF9idXNfaW5pdCk7Cj4gICB2b2lkIHNu
ZF9oZGFjX2V4dF9idXNfZXhpdChzdHJ1Y3QgaGRhY19idXMgKmJ1cykKPiAgIHsKPiAgIAlzbmRf
aGRhY19idXNfZXhpdChidXMpOwo+ICsJLyogRklYTUU6IHRoaXMgaXMgd29ya2Fyb3VuZAo+ICsJ
ICogcmVzZXQgaW5kZXggdXNlZCBmb3IgYnVzLT5pZHgsIGJlY2F1c2UgbWFjaGluZSBkcml2ZXJz
IGV4cGVjdAo+ICsJICogdGhlIGNvZGVjIG5hbWUgdG8gYmUgZWhkYXVkaW8wRDIsIHdoZXJlIDAg
aXMgYnVzLT5pZHgKPiArCSAqIHdlIG9ubHkgcGVyZm9ybSByZXNldCBpZiB0aGVyZSBpcyBvbmUg
dXNlZCBkZXZpY2UsIGlmIHRoZXJlIGlzIG1vcmUKPiArCSAqIGFsbCBiZXRzIGFyZSBvZmYKPiAr
CSAqLwo+ICsJaWYgKGlkeCA9PSAxKQo+ICsJCWlkeCA9IDA7CgpUaGUgcmVhbCBmaXggd291bGQg
YmUgdG8gc3RvcCBpbmNyZW1lbnRpbmcgaWR4IGluIHNuZF9oZGFjX2V4dF9idXNfaW5pdCwgCndo
aWNoIHdvdWxkIG1ha2Ugc2Vuc2Ugb25seSBpZiB3ZSBoYWQgbXVsdGlwbGUgY29udHJvbGxlcnMu
IFNPRiBwZWdnZWQgCmJ1cy0+aWR4IHRvIHplcm8uCgoKPiAgIAlXQVJOX09OKCFsaXN0X2VtcHR5
KCZidXMtPmhsaW5rX2xpc3QpKTsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKHNuZF9oZGFj
X2V4dF9idXNfZXhpdCk7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
