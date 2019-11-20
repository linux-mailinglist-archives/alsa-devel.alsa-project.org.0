Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E0104066
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 17:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53E1E171D;
	Wed, 20 Nov 2019 17:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53E1E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574266398;
	bh=ngPLatigPtDo5VkfABz/NA17L4ZiA5bRiWZtBQFhtEs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYKpJ+nNd1v1qEgIAevAF9OqsJq57KLroX4/l/2+dH+Gns0V8EhoeriZV94ANyExw
	 FCpfQcxNv5xurryt9NxuV+x59/NB5cOp1E5nnZgvPLnVtcR2ILtn4MqYFuMbIfWKFh
	 hJHAS7IznGYqr/joyLmqXMvRhdep6XgID9vliT9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97DFCF8013C;
	Wed, 20 Nov 2019 17:10:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51891F800F0; Wed, 20 Nov 2019 17:10:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C716F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 17:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C716F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 08:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="204862318"
Received: from ngoel1-mobl1.amr.corp.intel.com (HELO [10.255.66.61])
 ([10.255.66.61])
 by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2019 08:10:35 -0800
To: vishnu <vravulap@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574155967-1315-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <0c3d3545-b0ee-4bb3-558a-045633a30e46@linux.intel.com>
 <991a1c7a-6f34-caab-132d-5687b1f1bfa0@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9005946f-69b6-1cc6-5a1a-b894d826b960@linux.intel.com>
Date: Wed, 20 Nov 2019 08:48:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <991a1c7a-6f34-caab-132d-5687b1f1bfa0@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v8 2/6] ASoC: amd: Refactoring of DAI from
 DMA driver
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

Cj4+PiArwqDCoMKgIHBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwZGV2LT5kZXYs
IDUwMDApOwo+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2
KTsKPj4+ICvCoMKgwqAgcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7Cj4+Cj4+IHF1ZXN0
aW9uOiBoZXJlIHlvdSB3YW50IHRvIHVzZSBwbV9ydW50aW1lIGZvciB0aGlzIHBsYXRmb3JtIGRl
dmljZS4uLgo+Pgo+Pj4gK8KgwqDCoCByZXR1cm4gMDsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGlj
IGludCBhY3AzeF9kYWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAr
ewo+Pj4gK8KgwqDCoCBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4+PiArwqDCoMKg
IHJldHVybiAwOwo+Pj4gK30KPj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhY3Az
eF9kYWlfZHJpdmVyID0gewo+Pj4gK8KgwqDCoCAucHJvYmUgPSBhY3AzeF9kYWlfcHJvYmUsCj4+
PiArwqDCoMKgIC5yZW1vdmUgPSBhY3AzeF9kYWlfcmVtb3ZlLAo+Pj4gK8KgwqDCoCAuZHJpdmVy
ID0gewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gImFjcDN4X2kyc19wbGF5Y2FwIiwKPj4K
Pj4gLi4uIGJ1dCBoZXJlIHRoZXJlIGlzIG5vIC5wbSBzdHJ1Y3R1cmUgYW5kIEkgZG9uJ3Qgc2Vl
IGFueSAKPj4gc3VzcGVuZC9yZXN1bWUgcm91dGluZXMgZm9yIHRoaXMgZHJpdmVyLi4uCj4+Cj4+
PiArwqDCoMKgIH0sCj4+PiArfTsKPj4KPj4+IEBAIC03NzQsMTMgKzU4NiwxNCBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBhY3AzeF9kbWFfZHJpdmVyID0gewo+Pj4gwqDCoMKgwqDC
oCAucHJvYmUgPSBhY3AzeF9hdWRpb19wcm9iZSwKPj4+IMKgwqDCoMKgwqAgLnJlbW92ZSA9IGFj
cDN4X2F1ZGlvX3JlbW92ZSwKPj4+IMKgwqDCoMKgwqAgLmRyaXZlciA9IHsKPj4+IC3CoMKgwqDC
oMKgwqDCoCAubmFtZSA9ICJhY3AzeF9ydl9pMnMiLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1l
ID0gImFjcDN4X3J2X2kyc19kbWEiLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5wbSA9ICZhY3Az
eF9wbV9vcHMsCj4+PiDCoMKgwqDCoMKgIH0sCj4+Cj4+IC4uLiBidXQgZm9yIHRoaXMgb3RoZXIg
cGxhdGZvcm1fZHJpdmVyIHlvdSBkbyBoYXZlIGEgLnBtIHN0cnVjdHVyZSBhbmQgCj4+IHN1c3Bl
bmQtcmVzdW1lIGltcGxlbWVudGF0aW9ucy4KPj4KPj4gV29uZGVyaW5nIGlmIHRoaXMgaXMgYSBt
aXNzIG9yIGEgZmVhdHVyZT8KPj4KPiAKPiBBcyBwZXIgb3VyIGRlc2lnbiwgQUNQIElQIHNwZWNp
ZmljIGNoYW5nZXMgbGlrZSBBQ1AgcG93ZXIgb24vb2ZmIHdpbGwgYmUgCj4gaGFuZGxlZCBpbiBB
Q1AgcGNpIGRyaXZlcihwYXJlbnQgZGV2aWNlIGZvciBETUEgZGV2aWNlIGFuZCBJMlMgCj4gY29u
dHJvbGxlcihub3RoaW5nIGJ1dCBDUFUgREFJKSkKPiAKPiBXaGVyZSBhcyBJbiBETUEgZHJpdmVy
IGR1cmluZyBydW50aW1lIHN1c3BlbmQvcmVzdW1lIGludGVycnVwdHMgd2lsbCBiZSAKPiBkaXNh
YmxlZCBhbmQgZW5hYmxlZC4KPiAKPiBCdXQgaW4gREFJIGRyaXZlciB0aGVyZSBpcyBub3RoaW5n
IHRvIGJlIGRvbmUgaW4gc3VzcGVuZCBhbmQgcmVzdW1lIGp1c3QgCj4gcmV0dXJuaW5nIHplcm8g
c28gd2UgaGF2ZSBub3QgYWRkZWQgUE0gc3VzcGVuZC9yZXN1bWUgaGVyZSBpbiBEQUkuCj4gCj4g
U28gaXMgaXQgZXhwZWN0ZWQgdG8gYWRkIHRoZSBzdXNwZW5kIHJlc3VtZXMgd2l0aCByZXR1cm5p
bmcgemVyby5PciBpZiAKPiBwbSBydW50aW1lIGlzIG5vdCBuZWVkZWQgaW4gQ1BVIERBSSBzaGFs
bCB3ZSByZW1vdmUgdGhlIGV4aXN0aW5nIFBNIAo+IHJlbGF0ZWQgY2FsbHMgaW4gREFJLgo+IAo+
IFBsZWFzZSBzdWdnZXN0IHVzLgoKSSBhbSBmYXIgZnJvbSBhIHBtX3J1bnRpbWUgZXhwZXJ0IGJ1
dCBJJ2QgcmVtb3ZlIHRoZSBjYWxscyB0bwoKKyAgICBwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVu
ZF9kZWxheSgmcGRldi0+ZGV2LCA1MDAwKTsKKyAgICBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVu
ZCgmcGRldi0+ZGV2KTsKKyAgICBwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsKCmlmIHlv
dSBwbGF0Zm9ybSBkZXZpY2UgZG9lcyBub3QgcHJvdmlkZSBhbnkgc3VzcGVuZC9yZXN1bWUgZnVu
Y3Rpb25zIGFuZCAKdGhlIHBhcmVudCB0YWtlcyBjYXJlIG9mIGV2ZXJ5dGhpbmc/CgpJSVJDIHRo
ZSBzdGF0dXMgZm9yIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugd291bGQgYmUgJ3Vuc3VwcG9ydGVkJyBi
dXQgdGhhdCAKc2hvdWxkbid0IHByZXZlbnQgdGhlIHBhcmVudCBmcm9tIHN1c3BlbmRpbmcvcmVz
dW1pbmcuCgpBIHNlY29uZCBvcGluaW9uIHdvdWxkIGJlIGRlc2lyYWJsZSBoZXJlLi4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
