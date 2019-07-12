Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577476683D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 10:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0526166A;
	Fri, 12 Jul 2019 10:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0526166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562918901;
	bh=HXx7M9xEmncjzNsIsaPge1ePy4wTDvZ1Yjb+kN+KadU=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akZgb5ZU2Q3cWmXhiPojap79w5DJFtb73m7LXT6socYF5LpcB+6QorZeIPnqr/HN8
	 6s7Kso9hV/qYRrcrSQ8v80eiIymgfH+aiRzLmoPqfU03MrfClmiHX3Krhs3t7AzqIR
	 tQ+2U26so3zzjsK6j2p9hCimaJE89IAPLYt/ugew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBF0F802A2;
	Fri, 12 Jul 2019 10:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3EF4F802A0; Fri, 12 Jul 2019 10:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7A7F800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 10:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7A7F800D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 01:06:29 -0700
X-IronPort-AV: E=Sophos;i="5.63,481,1557212400"; 
 d="scan'208,217";a="157075924"
Received: from mwasko-mobl.ger.corp.intel.com (HELO [172.28.180.84])
 ([172.28.180.84])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 12 Jul 2019 01:06:26 -0700
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Allison Randal <allison@lohutok.net>, Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20190711171726.GA4356@hari-Inspiron-1545>
From: "Wasko, Michal" <michal.wasko@linux.intel.com>
Message-ID: <d92d60c5-2a59-0d1f-05fa-a8ab13f6bdd0@linux.intel.com>
Date: Fri, 12 Jul 2019 10:06:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711171726.GA4356@hari-Inspiron-1545>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] [PATCH] sound: pci: emu10k1: Remove unneeded
 variable "change"
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

T24gNy8xMS8yMDE5IDc6MTcgUE0sIEhhcmlwcmFzYWQgS2VsYW0gd3JvdGU6Cj4gZml4IGJlbG93
IGlzc3VlIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKPiBzb3VuZC9wY2kvZW11MTBrMS9lbXUxMGsx
eC5jOjEwNzc6NS0xMTogVW5uZWVkZWQgdmFyaWFibGU6ICJjaGFuZ2UiLgo+IFJldHVybiAiMCIg
b24gbGluZSAxMDkyCj4KPiBTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJh
c2FkLmtlbGFtQGdtYWlsLmNvbT4KU2luY2UgdGhlwqAgZnVuY3Rpb24gYWx3YXlzIHJldHVybiAw
IGFuZCB5b3UgcGVyZm9ybSBjb2RlIGNsZWFuLXVwIHRoZW4KbWF5YmUgaXQgd291bGQgYmUgYSBn
b29kIGlkZWEgdG8ganVzdCBjaGFuZ2UgZnVuY3Rpb24gdG8gdm9pZCBpbnN0ZWFkCm9mIHJldHVy
bmluZyBpbnQgdmFsdWUgd2hpY2ggZG9lcyBub3Qgc2VlbSB0byBoYXZlIHVzZS4KCk1pY2hhbCBX
Lgo+IC0tLQo+ICAgc291bmQvcGNpL2VtdTEwazEvZW11MTBrMXguYyB8IDMgKy0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2VtdTEwazEvZW11MTBrMXguYyBiL3NvdW5kL3BjaS9lbXUxMGsxL2VtdTEw
azF4LmMKPiBpbmRleCA2N2Q2NDczLi45Y2Y4MTgzIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3BjaS9l
bXUxMGsxL2VtdTEwazF4LmMKPiArKysgYi9zb3VuZC9wY2kvZW11MTBrMS9lbXUxMGsxeC5jCj4g
QEAgLTEwNzQsNyArMTA3NCw2IEBAIHN0YXRpYyBpbnQgc25kX2VtdTEwazF4X3NoYXJlZF9zcGRp
Zl9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gICB7Cj4gICAJc3RydWN0IGVt
dTEwazF4ICplbXUgPSBzbmRfa2NvbnRyb2xfY2hpcChrY29udHJvbCk7Cj4gICAJdW5zaWduZWQg
aW50IHZhbDsKPiAtCWludCBjaGFuZ2UgPSAwOwo+ICAgCj4gICAJdmFsID0gdWNvbnRyb2wtPnZh
bHVlLmludGVnZXIudmFsdWVbMF0gOwo+ICAgCj4gQEAgLTEwODksNyArMTA4OCw3IEBAIHN0YXRp
YyBpbnQgc25kX2VtdTEwazF4X3NoYXJlZF9zcGRpZl9wdXQoc3RydWN0IHNuZF9rY29udHJvbCAq
a2NvbnRyb2wsCj4gICAJCXNuZF9lbXUxMGsxeF9wdHJfd3JpdGUoZW11LCBST1VUSU5HLCAwLCAw
eDEwMDNGKTsKPiAgIAkJc25kX2VtdTEwazF4X2dwaW9fd3JpdGUoZW11LCAweDEwODApOwo+ICAg
CX0KPiAtCXJldHVybiBjaGFuZ2U7Cj4gKwlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHNuZF9lbXUxMGsxeF9zaGFyZWRfc3BkaWYg
PQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
