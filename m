Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B68679C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 19:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2101665;
	Thu,  8 Aug 2019 19:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2101665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565283816;
	bh=gDwO003cFeRJ4FIwMSnVE2AlpKuOslOs+sz9ivYHhGU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0dxN4wtJ8oSnBHfph8IPpij59y3VDH/i3khrp4OacRDR2WWX01IIo0x+AqX/hvVD
	 GeUFyVipqi4CEjVwuI7OUGalbEKNIlGhNNXB0sZZWtfUSH+cqs7+PHkXHT6QM79pKv
	 VNG0DuCA0UOW2gsOUkk82v8s3FzXJsfvPt+0xN3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E366BF804FF;
	Thu,  8 Aug 2019 19:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2FA2F80534; Thu,  8 Aug 2019 19:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E60BBF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 19:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60BBF803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 10:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="199113739"
Received: from jmikitka-mobl2.amr.corp.intel.com (HELO [10.252.204.174])
 ([10.252.204.174])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 10:01:43 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190808102447.16639-1-cezary.rojewski@intel.com>
 <17f3b2a4-35c1-3763-4d7d-7eec09230bfc@linux.intel.com>
 <1c4c546d-e451-7484-1dfe-adb575cfe46f@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0b46e718-6bf1-b003-3eea-d8c46c10f39f@linux.intel.com>
Date: Thu, 8 Aug 2019 12:01:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1c4c546d-e451-7484-1dfe-adb575cfe46f@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v4 2/2] ASoC: Intel: Skylake:
 large_config_get overhaul
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

CgpPbiA4LzgvMTkgMTE6NTIgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTA4IDE2OjUwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gVGhhbmtzIENlemFyeSwg
dGhlIHNwbGl0IG1ha2VzIGl0IG11Y2ggZWFzaWVyIHRvIHJldmlldy4gSSBoYXZlIGEgCj4+IGNv
dXBsZSBvZiBtaW5vciBjb21tZW50cyBiZWxvdywgbG9va3MgZ29vZCBvdGhlcndpc2UuCj4+Cj4+
IE9uIDgvOC8xOSA1OjI0IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+PiBMQVJHRV9DT05G
SUdfR0VUIGlzIG1haW5seSB1c2VkIHRvIHJldHJpZXZlIHJlcXVlc3RlZCBtb2R1bGUgcGFyYW1l
dGVycwo+Pj4gYnV0IGl0IG1heSBhbHNvIGNhcnJ5IFRYIHBheWxvYWQgd2l0aCB0aGVtLiBVcGRh
dGUgaXRzIGltcGxlbWVudGF0aW9uIHRvCj4+PiBhY2NvdW50IGZvciBib3RoIFRYIGFuZCBSWCBk
YXRhLgo+Pj4gRmlyc3QgcmVwbHkuaGVhZGVyIGNhcnJpZXMgdG90YWwgcGF5bG9hZCBzaXplIHdp
dGhpbiBkYXRhX29mZl9zaXplZmllbGQuCj4+PiBNYWtlIHVzZSBvZiByZXBseS5oZWFkZXIgdG8g
cmVhbGxvYyByZXR1cm5lZCBidWZmZXIgd2l0aCBjb3JyZWN0IHNpemUuCj4+Pgo+Pj4gRmFpbHVy
ZSBvZiBJUEMgcmVxdWVzdCBpcyBwZXJtaXNzaXZlIC0gZXJyb3ItcGF5bG9hZCBtYXkgYmUgcmV0
dXJuZWQsIGFuCj4+PiBpbmZvcm1hdGl2ZSBkYXRhIHdoeSBHRVQgZm9yIGdpdmVuIHBhcmFtIGZh
aWxlZCAtIGFuZCB0aHVzIGZ1bmN0aW9uCj4+PiBzaG91bGQgbm90IGNvbGxhcHNlIGJlZm9yZSBl
bnRpcmUgcHJvY2Vzc2luZyBpcyBmaW5pc2hlZC4gQ2FsbGVyIGlzCj4+PiByZXNwb25zaWJsZSBm
b3IgY2hlY2tpbmcgcmV0dXJuZWQgcGF5bG9hZCBhbmQgYnl0ZXMgcGFyYW1ldGVycy4KPj4KPj4g
YnV0IHRoYXQgaXMgdGhlIHNhbWUgYXMgYmVmb3JlLCB5ZXM/IHRoaXMgcGF0Y2ggZG9lcyBub3Qg
Y2hhbmdlIHRoZSAKPj4gYmVoYXZpb3Igb24gZXJyb3JzPwo+IAo+IFRvIGV2YWx1YXRlIHRoaXMg
c3RhdGVtZW50IHlvdSBoYXZlIHRvIHRha2UgYSBsb29rIGF0IG9sZCBjb2RlIChiZWZvcmUgCj4g
YWRkaXRpb24gb2YgcmVwbHkgc2F2aW5nKToKPiAKPiByZXQgPSBzc3RfaXBjX3R4X21lc3NhZ2Vf
d2FpdChpcGMsICppcGNfaGVhZGVyLCBOVUxMLCAwLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoKGNoYXIgKilwYXJhbSkgKyBkYXRhX29mZnNldCwKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbXNnLT5wYXJhbV9kYXRhX3NpemUpOwo+IGlmIChyZXQgPCAwKSB7Cj4gIMKgwqDC
oMKgZGV2X2VycihpcGMtPmRldiwKPiAgwqDCoMKgwqDCoMKgwqAgImlwYzogZ2V0IGxhcmdlIGNv
bmZpZyBmYWlsLCBlcnI6ICVkXG4iLCByZXQpOwo+ICDCoMKgwqDCoHJldHVybiByZXQ7Cj4gfQo+
IAo+IFRoaXJkIGFuZCBmb3VyIHBhcmFtZXRlciBmb3Igc3N0X2lwY190eF9tZXNzYWdlX3dhaXQg
ZGVub3RlZCB0eF9kYXRhIGFuZCAKPiB0eF9zaXplIGluIG9sZGVyIHZlcnNpb24uIEFzIHlvdSBj
YW4gc2VlLCB0aGVzZSBhcmUgZW1wdHkgLSBubyBwYXlsb2FkIAo+IGlzIGNhcnJpZWQsIF9nZXRf
IG9ubHkgYXdhaXRzIHJlcGx5IGFuZCBjb3BpZWQgZGF0YSByZXRyaWV2ZWQgKGJyZWFrcyAKPiB2
ZW5kb3IgY2FzZSBhcyBkZXNjcmliZWQgZWFybGllcikuCj4gCj4gSW1tZWRpYXRlbHkgYWZ0ZXIg
ZmFpbHVyZSwgZnVuY3Rpb24gd2FzIGNvbGxhcHNpbmcuIFNvbWUgZGF0YSBtaWdodCBoYXZlIAo+
IGJlZW4gYXBwZW5kZWQgdG8gInBhcmFtIiBidXQgc2l6ZSBpcyB1bmtub3duLiBIb3dldmVyLCBk
dWUgdG8gbGFjayBvZiAKPiByZXRyaWV2YWwgb2Ygc2FpZCBzaXplLCBpbmRlZWQgb25lIG1heSBz
YXkgdGhlIGJlaGF2aW9yIG9uIGVycm9ycyBkaWQgCj4gbm90IHJlYWxseSBjaGFuZ2UuIEl0J3Mg
dml0YWwgdG8gaGlnaGxpZ2h0IHRoYXQgY2hhbmdlcyBhZGRlZCBoZXJlICgyLzIgCj4gcGF0Y2gp
IGRvIG5vdCBtYWtlIGZ1bmN0aW9uIHJldHVybiByaWdodCBhZnRlciByZWNlaXZpbmcgZXJyb3Ig
dGhvdWdoIC0gCj4gYnVmZmVyIGFuZCBzaXplIGFyZSB1cGRhdGVkIGZvciB0aGUgY2FsbGVyIGJl
Zm9yZSBsZWF2aW5nIHRoZSBzY29wZS4KCm9rLCBnb3QgaXQuIFRoZSBjaGFuZ2UgYWN0dWFsbHkg
aGFwcGVuZWQgaW4gcGF0Y2gxLCBJIGNvdWxkbid0IHNlZSB0aGUgCmNoYW5nZSBpbiB0aGF0IHNw
ZWNpZmljIHBhdGNoLgpUaGFua3MgZm9yIHRoZSBwcmVjaXNpb25zLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
