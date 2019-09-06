Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7CAAC25A
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 00:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001BC1658;
	Sat,  7 Sep 2019 00:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001BC1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567808100;
	bh=iKPoQ9I8wCh7R5BEl6vpbXFYsO0uYHT0l1XmCM8cep4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEj2ysLNtglLhwgC+9CQQul4kc+HK2rFs1oiyuaZZYdxKR91OaURxQOPPst3zZPhO
	 Wh6eFrqRHWbxsXmf6uh4bdnQVwY6MmjRaKUmqJkd6JFEv6fw6Q02Pgh0jXK+vBnmAT
	 p8FW1BNZuHRfjgpqXVRcesPNEoKc6cSWgJ0F8ax0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F98F802DF;
	Sat,  7 Sep 2019 00:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4ACBF80394; Sat,  7 Sep 2019 00:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 342D3F80171
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 00:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 342D3F80171
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 15:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,474,1559545200"; d="scan'208";a="177767097"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 06 Sep 2019 15:13:04 -0700
Received: from ravisha1-mobl1.amr.corp.intel.com (unknown [10.255.36.89])
 by linux.intel.com (Postfix) with ESMTP id 49DC3580878;
 Fri,  6 Sep 2019 15:13:04 -0700 (PDT)
To: Curtis Malainey <cujomalainey@google.com>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <b96e35fb-09d7-6cf7-8880-2cb8f377cca8@linux.intel.com>
 <CAOReqxgJQaW=XAsD4o9hq_iU1faJBK3d9Rg8FCp_4Mrx3UX-oQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b1de1190-d809-9cb3-3560-97595df895d3@linux.intel.com>
Date: Fri, 6 Sep 2019 17:13:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxgJQaW=XAsD4o9hq_iU1faJBK3d9Rg8FCp_4Mrx3UX-oQ@mail.gmail.com>
Content-Language: en-US
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [RFC 00/15] Add Samus Hotwording for RT5677
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

T24gOS82LzE5IDQ6MDkgUE0sIEN1cnRpcyBNYWxhaW5leSB3cm90ZToKPiAKPiAKPiBDdXJ0aXMg
TWFsYWluZXkgfCBTb2Z0d2FyZSBFbmdpbmVlciB8IGN1am9tYWxhaW5leUBnb29nbGUuY29tIAo+
IDxtYWlsdG86Y3Vqb21hbGFpbmV5QGdvb2dsZS5jb20+IHwgNjUwLTg5OC0zODQ5Cj4gCj4gCj4g
T24gRnJpLCBTZXAgNiwgMjAxOSBhdCAxOjQxIFBNIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IAo+IDxw
aWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20gCj4gPG1haWx0bzpwaWVycmUtbG91
aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+PiB3cm90ZToKPiAgPgo+ICA+IE9uIDkvNi8xOSAy
OjQ2IFBNLCBDdXJ0aXMgTWFsYWluZXkgd3JvdGU6Cj4gID4gPiBUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIHRoZSBob3R3b3JkaW5nIGltcGxlbWVudGF0aW9uIHVzZWQgaW4gdGhlCj4gID4gPiBQaXhl
bGJvb2sgb24gdGhlIFJUNTY3NyBkcml2ZXIuCj4gID4gPgo+ICA+ID4gS25vd24gSXNzdWVzOgo+
ICA+ID4gVGhlcmUgaXMgYSBrbm93biBpc3N1ZSB3aGVyZSB0aGUgc3lzdGVtIHdpbGwgZmFpbCB0
byBkZXRlY3QgYSAKPiBob3R3b3JkIGlmCj4gID4gPiBzdXNwZW5kZWQgd2hpbGUgdGhlIHN0cmVh
bSBpcyBvcGVuLiBUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZQo+ICA+ID4gaGFzd2Vs
bC1kc3Agc3VzcGVuZHMgaXRzIEkyUyBNQ0xLIGJlZm9yZSB0aGUgUlQ1Njc3IHN1c3BlbmRzIHdo
aWNoCj4gID4gPiBjYXVzZXMgdGhlIHdyaXRlcyBhbmQgcmVhZHMgdG8gYmVjb21lIGNvcnJ1cHRl
ZCBhcyBhIHJlc3VsdC4gQW55Cj4gID4gPiByZWNvbW1lbmRhdGlvbnMgdG8gY29ycmVjdCB0aGlz
IGJlaGF2aW91ciB3b3VsZCBiZSBhcHByZWNpYXRlZC4KPiAgPgo+ICA+IEkgZG9uJ3QgZ2V0IHdo
YXQgJ3N1c3BlbmQnIGFuZCAnc3RyZWFtJyByZWZlciB0by4gaXMgdGhpcyBwbV9ydW50aW1lLAo+
ICA+IHMyaWRsZSwgc3lzdGVtIGNhcHR1cmUsIFNQSSBjYXB0dXJlPwo+ICA+Cj4gID4gQ2FuIHlv
dSBlbGFib3JhdGUgb24gdGhlIHNlcXVlbmNlPwo+IERlZmluaXRlbHkgY2FuLAo+IAo+ICAxLiBv
cGVuIGhvdHdvcmRpbmcgcGNtIHdpdGggYXJlY29yZCBpbiBub24tYmxvY2tpbmcgbW9kZQo+ICAg
ICAgICogQ29kZWMgd29uJ3Qgc2VuZCBhbnkgZGF0YSBvdmVyIFNQSSB1bnRpbCB0aGUgaG90d29y
ZCBpcyBkZXRlY3RlZAo+ICAyLiBwdXQgc3lzdGVtIGludG8gUzMgKHNlZSBvcmRlciBvZiBjYWxs
YmFja3MgYXMgZm9sbG93cykKCkJlZm9yZSB3ZSBzdGFydCBkaWdnaW5nIGludG8gZGVwZW5kZW5j
aWVzIGJlbG93LCBpcyBpdCByZWFsbHkgcG9zc2libGUgCnRvIGVudGVyIFMzIHdpdGggdGhlIGhv
dHdvcmRpbmcgb3Blbj8gSSB2YWd1ZWx5IHJlbWVtYmVyIGJlaW5nIHRvbGQgdGhhdCAKc3VjaCBj
YXNlcyB3b3VsZCBiZSB0cmFwcGVkIGJ5IHRoZSBDaHJvbWUgdXNlcnNwYWNlIGFuZCB0aGUgUENN
IHdvdWxkIGJlIApjbG9zZWQuIEkgZG9uJ3QgdGhpbmsgYW55b25lIG9uIHRoZSBTT0YgdGVhbSB0
ZXN0aW5nIHRoaXMgY2FzZSBmb3IgbmV3ZXIgCnBsYXRmb3JtLCBzbyB0aGF0IGNhc2Ugb24gYW4g
b2xkIHBsYXRmb3JtIG1ha2VzIG1lIG5lcnZvdXMuCgo+ICAgICAgMS4gSFNXIERTUCBzdXNwZW5k
ZWQgd2hpY2ggc3VzcGVuZHMgc3RvcHMgSTJTIE1DTEsKPiAgICAgIDIuIFJUNTY3NyBzdXNwZW5k
ZWQsIGFsbCBwbSB3cml0ZXMgYXJlIGxvc3QgZHVlIHRvIHRoZSBmYWN0IHRoYXQKPiAgICAgICAg
IHRoZSBjb2RlYyBpcyBzdGlsbCBpbiBEU1AgbW9kZSBidXQgaGFzIG5vIGNsb2NrCgp0aGVyZSdz
IG5vIHJlYWwgZGVwZW5kZW5jeSBvciBwYXJlbnQtY2hpbGQgcmVsYXRpb25zaGlwIGJldHdlZW4g
dGhlIHR3byAKZHJpdmVycywgaXMgdGhlcmU/IHNvIEkgYW0gd29uZGVyaW5nIGlmIHRoaXMgb3Jk
ZXIgaXMgaW50ZW50aW9uYWwgb3IgCmp1c3QgYWNjaWRlbnRhbC4KVGhlIG9ubHkgdGhpbmcgSSBj
YW4gdGhpbmsgb2YgaXMgdGhhdCB0aGVyZSBhcmUgbXVsdGlwbGUgc3RlcHMgZHVyaW5nIAp0aGUg
c3lzdGVtIHN1c3BlbmQgYW5kIG1heWJlIHdlIGNhbiBwbGF5IHdpdGggLnN1c3BlbmRfbGF0ZSBp
bnN0ZWFkIG9mIAouc3VzcGVuZD8KCj4gIDMuIFN5c3RlbSByZXN1bWVzIGFuZCBmYWlscyB0byBy
ZXN0b3JlIHRoZSBSVDU2NzcgZHVlIHRvIHRoZSBmYWN0IHRoYXQKPiAgICAgdGhlIHJlZ21hcCBp
cyBub3cgb3V0IG9mIHN5bmMKPiAKPiBUaGUgcnQ1Njc3IG5lZWRzIHRvIHN1c3BlbmQgYmVmb3Jl
IHRoZSBoYXN3ZWxsIGRzcCBidXQgSSBhbSBub3Qgc3VyZSBob3cgCj4gdG8gc2NoZWR1bGUgdGhh
dCBhcHByb3ByaWF0ZWx5LiBUaGUgcmVhc29uIHRoaXMgd29ya2VkIGluIFNhbXVzIGlzIAo+IGJl
Y2F1c2UgaXQgbGF1bmNoZWQgd2l0aCBhIDMuMTQga2VybmVsIHdoaWNoIGRpZCBub3QgCj4gaGF2
ZcKgMGQyMTM1ZWNhZGIwYjJlZWM1MzM4YTc1ODdiYTI5NzI0ZGRmNjEyYiAoIkFTb0M6IEludGVs
OiBXb3JrIGFyb3VuZCAKPiB0byBmaXggSFcgRDMgcG90ZW50aWFsIGNyYXNoIGlzc3VlIikgd2hp
Y2ggcG93ZXJzIGRvd24gdGhlIE1DTEsgd2hlbiB0aGUgCj4gaGFzd2VsbCBEU1AgaXMgbm90IGlu
IHVzZS4KPiAKPiBIb3BlIHRoYXQgY2xlYXJzIHRoaW5ncyB1cC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
