Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F4E4F15
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAD431823;
	Fri, 25 Oct 2019 16:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAD431823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572013754;
	bh=xZiog0LwoSEEuo2bdjJQNktv0p6pg61b9ke8Q/+SMOU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+6muqZjQqiHVqsnrkd4JbguEdEcacm7uHEMrX0Yv/qh8TZvRKzRgUY+R/1njIR2g
	 1Cp/wzS9oxIfNiVdyUwkx/WRetqQ/c+QUGKB4zcSlkd6Fg0KWx26pidBBswd3Bpzq7
	 QAQj16692lM9kNjzWpKqnrw/mwETEdBuzm/JPIcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C8EF80368;
	Fri, 25 Oct 2019 16:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B9DDF8036F; Fri, 25 Oct 2019 16:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E3FAF80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E3FAF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 07:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="223935991"
Received: from bnail-mobl.amr.corp.intel.com (HELO [10.252.140.167])
 ([10.252.140.167])
 by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2019 07:27:21 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
 <36d84c86-50d0-487b-181a-9238e11d7fce@linux.intel.com>
 <20191025094516.GG2620@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b91d233b-5fa7-2402-d2f7-27e957212ca1@linux.intel.com>
Date: Fri, 25 Oct 2019 09:27:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025094516.GG2620@vkoul-mobl>
Content-Language: en-US
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

CgpPbiAxMC8yNS8xOSA0OjQ1IEFNLCBWaW5vZCBLb3VsIHdyb3RlOgo+IE9uIDI0LTEwLTE5LCAw
OTozMSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+IE9uIDEwLzI0LzE5IDk6MjAgQU0s
IFBhdHJpY2sgTGFpIHdyb3RlOgo+Pj4gT24gMTAvMjIvMTkgMTE6NTkgQU0sIE1hcmsgQnJvd24g
d3JvdGU6Cj4+Pj4gSGksCj4+Pgo+Pj4+Cj4+Pj4gQXMgd2l0aCBwcmV2aW91cyB5ZWFycyBsZXQn
cyBwdWxsIHRvZ2V0aGVyIGFuIGFnZW5kYSB0aHJvdWdoIGEgbWFpbGluZwo+Pj4+IGxpc3QgZGlz
Y3Vzc2lvbiAtIGlmIHBlb3BsZSBjb3VsZCByZXBseSB0byB0aGlzIG1haWwgd2l0aCBhbnkgdG9w
aWNzCj4+Pj4gdGhleSdkIGxpa2UgdG8gZGlzY3VzcyB3ZSBjYW4gdGFrZSBpdCBmcm9tIHRoZXJl
LsKgIE9mIGNvdXJzZSBpZiB3ZSBjYW4KPj4+PiBzb3J0IHRoaW5ncyBvdXQgbW9yZSBxdWlja2x5
IHZpYSB0aGUgbWFpbGluZyBsaXN0IHRoYXQncyBldmVuIGJldHRlciEKPj4+Cj4+PiAxLiBHYXBs
ZXNzIHBsYXliYWNrIGhhbmRsaW5nIGJldHdlZW4gdHdvIHBsYXliYWNrcyB3aXRoIGRpZmZlcmVu
dCBmb3JtYXQKPj4KPj4gZGlkIHlvdSBtZWFuIGNvbXByZXNzZWQgZm9ybWF0cz8KPiAKPiBZZXMg
dGhpcyBpcyBmb3IgY29tcHJlc3NlZCBmb3JtYXRzLiBTbywgd2UgZG8gbm90IGFsbG93IHVzZXJz
IHRvIHNldAo+IHBhcmFtZXRlcnMgZm9yIGdhcGxlc3MgcGxheWJhY2sgYXMgdGhlIGFzc3VtcHRp
b24gaXMgdGhhdCB3ZSBhcmUgaW4KPiBhbGJ1bSB3aXRoIHNhbWUgcGFyYW1ldGVycyBmb3IgdGhl
IHN1YnNlcXVlbnQgdHJhY2tzIHRvIGJlIHBsYXllZC4KPiAKPiBCdXQgaW4gY2FzZSBvZiBzb21l
IGNvZGVjcyBsaWtlIHdtYSAoYW5kIGZsYWMgaWlyYykgdGhlcmUgY2FuIGJlIGNoYW5nZXMKPiB0
byBuZXh0IHRyYWNrIHVzaW5nIGRpZmZlcmVudCB3bWEgZm9ybWF0cyB3aGljaCB3YXJyYW50cyBj
aGFuZ2UgaW4KPiBwYXJhbXMuCj4gCj4gUXVlc3Rpb24gaXMgaWYgdGhpcyBzaG91bGQgYmUgYWxs
b3dlZCBhbmQgaWYgc28gd2UgbmVlZCB0byBwcm9wb3NlIGEKPiBjaGFuZ2UgaW4gQVBJIGZvciB0
aGlzCgpHYXBsZXNzIHBsYXliYWNrIGJldHdlZW4gY29tcHJlc3NlZCB0cmFja3MgbmVlZHMgdG8g
dGFrZSB0aGUgZmlsdGVyIApoaXN0b3J5L2RlbGF5IGludG8gYWNjb3VudC4gVGhlIGVuY29kaW5n
L2RlY29kaW5nIHByb2Nlc3MgcmVzdWx0cyBpbiAKemVyby12YWx1ZXMgc2FtcGxlcyBhdCB0aGUg
YmVnaW5uaW5nIG9mIHRoZSBmaWxlLCBhbmQgeW91IG5lZWQgdG8gZmx1c2ggCnRoZSBvdXRwdXQg
bGlrZXdpc2UgaWYgeW91IHdhbnQgYWxsIHRoZSBzYW1wbGVzLiBJSVJDIHRoZXJlIGlzIGFuIEkz
RCAKdGFnIHRoYXQgdGVsbHMgeW91IGhvdyBtYW55IHNhbXBsZXMgbmVlZCB0byBiZSBza2lwcGVk
IHdoZW4geW91IGRlY29kZSBhIApuZXcgdHJhY2ssIGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgd291
bGQgd29yayBpZiB0aGUgcHJlY2VkaW5nIHRyYWNrIGhhcyAKYSBkaWZmZXJlbnQgZm9ybWF0IGFu
ZCBoZW5jZSBmaWx0ZXIgZGVsYXkvaGlzdG9yeS4KCkUuZy4gaWYgeW91IGFzc3VtZSB0aGUgcHJl
Y2VkaW5nIHRyYWNrIGhhcyBhIDI1NiBzYW1wbGUgZmlsdGVyIGRlbGF5LCAKYW5kIGlmIHlvdSBz
d2l0Y2ggdG8gYSB0cmFjayB3aGVyZSB0aGUgSTNEIHRhZyB0ZWxscyB5b3UgdG8gcmVtb3ZlIHRo
ZSAKZmlyc3QgMTAyNCBzYW1wbGVzLCBjbGVhcmx5IHNvbWV0aGluZyB3aWxsIGdvIHdyb25nLiBZ
b3UnZCBuZWVkIGV4dHJhIAp3b3JrIGluIHlvdXIgZmlybXdhcmUgeW91IGhhdmUgdGhlIHR3byBk
ZWNvZGVycyBjby1leGlzdCBmb3Igc29tZSB0aW1lIAp3aGlsZSB5b3UgZmx1c2ggdGhlIHByZXZp
b3VzIGhpc3RvcnkgYnVmZmVyIGFuZCBzdGl0Y2ggaXQgd2l0aCB0aGUgbmV3IApzYW1wbGVzLiBU
aGlzIGxlYWRzIHRvIGV4dHJhIGlzc3VlcyBpbiB0ZXJtcyBvZiBEU1AgcmVzb3VyY2VzLgoKQW5k
IG5vdyB0aGF0IEkgdGhpbmsgb2YgaXQsIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBhIG1lYW5zIHRv
IGluc3RhbnRpYXRlIAphIHNlY29uZCBkZWNvZGVyIG9uIHRoZSBzYW1lIHN0cmVhbSB3aGlsZSBp
dCdzIHJ1bm5pbmcsIHlvdSdkIGxpa2VseSAKbmVlZCB0d28gc3RyZWFtcyBhbmQgYSBmYW5jeSBz
dGl0Y2hpbmcgaW4geW91ciBmaXJtd2FyZS4KCkFuZCBpZiB5b3Ugd2FudCB0aGlzIHRvIHdvcmsg
aW4gQW5kcm9pZCwgeW91J2QgYWxzbyBuZWVkIGV4dHJhIHN0cmVhbXMgCmluIHRoZSBIQUwsIGFu
ZCBsaWtlbHkgc29tZSBjaGFuZ2VzIGluIHRoZSBtZWRpYSBwYXJ0cy4KCj4gCj4+PiAyLiBQYXNz
aW5nIHRpbWVzdGFtcCBhbG9uZyB3aXRoIGJ1ZmZlciBmb3IgYm90aCBwbGF5YmFjayBhbmQgY2Fw
dHVyZQo+Pj4gMy4gUENNIGRldmljZSB2b2x1bWUgY29udHJvbAo+Pj4gNC4gVW5pZmllZCBhdWRp
byBncmFwaCBidWlsZGluZyBhY3Jvc3MgbXVsdGlwbGUgc3Vic3lzdGVtcwo+Pj4KPj4+IFRoYW5r
cwo+Pj4gUGF0cmljawo+Pj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
