Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F629C010B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 10:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB1A0166C;
	Fri, 27 Sep 2019 10:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB1A0166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569572606;
	bh=ykN2kyUXPsrRUqJqU1YtP14NQrnf35N49PgMxG2Sy5k=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfgnCtJFpnbyPLSgh+O9e477967SWx3mx7zVVCFezIgjKwOubgEcqPsUtDOU122dM
	 bnRquwwB9LO5YEAA0djbWYf2AkE41re8qrw0lYI1z7RD5MRTCjAq6p0QYAKF1hljP+
	 1tBowKQBrfHjoqG9xPlVf8UBlRFAlNkqK++PbAb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB2AF8049A;
	Fri, 27 Sep 2019 10:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A57F8049A; Fri, 27 Sep 2019 10:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D540F80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 10:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D540F80140
Received: from [114.253.240.25] (helo=[192.168.1.108])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iDlVP-0001YW-Iv; Fri, 27 Sep 2019 08:21:35 +0000
To: Mark Pearson <mpearson@lenovo.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
 <153ba191eb3c4849b6e65db5fc8e8760@lenovo.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <4cb6bec8-1dac-9114-c230-c9196763e58d@canonical.com>
Date: Fri, 27 Sep 2019 16:21:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <153ba191eb3c4849b6e65db5fc8e8760@lenovo.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

U28gZmFyLCB0aGUgYWxzYS1saWIgc3RpbGwgZGVwZW5kcyBvbiB0aGUgY2FyZC0+bmFtZS9sb25n
LW5hbWUgdG8gZmluZCAKdGhlIG5lZWRlZCBVQ00sIEkga25vdyBzb21lIERlbGwgbWFjaGluZXMg
YWxzbyB1c2VzIHNvZiBkcml2ZXIgKHNvIHRoZSAKY2FyZC0+bmFtZS9sb25nLW5hbWUgaXMgYWxz
byBzb2Ytc2tsX2hkYV9jYXJkKSwgc28gaWYgdGhpcyBVQ00gaXMgCm1lcmdlZCwgaXQgd2lsbCBi
ZSBzaGFyZWQgd2l0aCBEZWxsIG1hY2hpbmVzLiBCdXQgb24gdGhvc2UgRGVsbCAKbWFjaGluZXMs
IHRoZXJlIGlzIG5vIEJBU1MgU3BlYWtlciwgYW5kIERlbGwgbWFjaGluZXMgaGF2ZSBzdGggdGhh
dCAKTGVub3ZvIG1hY2hpbmVzIGRvbid0IGhhdmUsIGxpa2UgaGVhZHNldC1taWMgYW5kIGhlYWRw
aG9uZS1taWMuIEhvdyB0byAKbWFrZSB0aGlzIFVDTSB3b3JrIG9uIGJvdGggTGVub3ZvIGFuZCBE
ZWxsIG1hY2hpbmVzPwoKUmVnYXJkcywKCkh1aS4KCgpPbiAyMDE5LzkvMjQg5LiL5Y2IODowNiwg
TWFyayBQZWFyc29uIHdyb3RlOgo+Pj4gSSB0aGluayB0aGUgZmlyc3Qgb3JkZXIgd291bGQgYmUg
dG8gaGF2ZSB0aGUgZmlsZSBjbGVhbmVkLXVwLCB3aXRoIGl0cwo+Pj4gSW50ZWwgb3JpZ2luIGNs
ZWFybHkgc3RhdGVkIHdpdGggYSBzaWduZWQtb2ZmLWJ5IHRhZy4KPj4+Cj4+PiBUaGVuIG9uY2Ug
dGhpcyBpcyBkb25lLCB0aGUgRGViaWFuIHBhY2thZ2UgY3JlYXRpb24gbmVlZHMgdG8gYmUKPj4+
IGhhbmRsZWQgKHVzaW5nIGVpdGhlciB0aGUgQUxTQSByZXBvIG9yIHRoZSBjbG9uZWQgdmVyc2lv
biBvbiBTT0YKPj4+IEdpdEh1YikuIEkgZG9uJ3QgaGF2ZSBhbnkgZXhwZXJpZW5jZSB3aXRoIERl
YmlhbiBwYWNrYWdlcyBzbyBjYW4ndAo+Pj4gcmVhbGx5IGNvbW1lbnQgb24gdGhlIGVmZm9ydCBp
dCB3b3VsZCB0YWtlLgo+PiBJIGRpZCBzb21lIGNsZWFudXBzIGhlcmU6Cj4+Cj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tCj4+IGNvbmYvY29tbWl0L2Y3OTZmMDg1
MmEwOTdlMjM4ZmE5ZjVlZmIxNzRlOTViNWVlNmM4YjcKPj4KPj4gUGllcnJlLCBjb3VsZCB5b3Ug
Y29uZmlybSB0aGUgb3JpZ2luYWwgc291cmNlIGFuZCBhcmUgeW91IG9rIHdpdGggdGhhdD8KPj4K
PiBJIGdvdCBjb25maXJtYXRpb24gZnJvbSBJbnRlbCB0aGF0IHRoZXkgYXJlIHRoZSBvcmlnaW5h
bCBzb3VyY2UgLSB0aGV5IHByb3ZpZGVkIG1lIHdpdGggdGhlIGZpbGVzIChhcyBhbiBhc2lkZSBp
biBjYXNlIGl0IGlzIGltcG9ydGFudCwgb3JpZ2luYWxseSB0aGV5IHdlcmUgd29ya2luZyB3aXRo
IENhbm9uaWNhbCBvbiBnZXR0aW5nIFVidW50dSB3b3JraW5nIG9uIG9uZSBvZiBvdXIgKExlbm92
bykgcGxhdGZvcm1zKS4gSSB3YXMgZm9sbG93aW5nIHVwIHdpdGggQ2Fub25pY2FsIHRvIGp1c3Qg
Y2hlY2sgd2hhdCB0aGV5IGhhZCBkb25lIGJ1dCBoYXZlbid0IGhlYXJkIGJhY2sgeWV0Lgo+Cj4g
U2luY2UgSW50ZWwgaGFzIHByb3ZpZGVkIHRoZSBmaWxlcyB0byBtZSBkaXJlY3RseSAtIGNhbiBJ
IGFjdCBhcyBhbiBvcmlnaW5hbCBzb3VyY2UgY29uZmlybWF0aW9uPwo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
