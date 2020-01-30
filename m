Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9914DA5B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 13:05:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4D61677;
	Thu, 30 Jan 2020 13:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4D61677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580385919;
	bh=kn8BeThXjkAQthNSWDHZnV/qx2V+6mOTM0ABdGd8zEg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cOTV1ZDxEyGXYFbfLVqp+FjX3kDNc6ZRJ52cfHb8eOnePD8lrqWBOUFCoF7OL2Vv6
	 owCZrMFwQ3QDTxTGD5gQa7IZTtEQfQuPaz95JuwMgSgP6aKNuQUSE75Im8rMzsNvv4
	 jh1QmgVOIXQPHLlYJHQ19llUQIC2wd5pUVudDse0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FBEF80123;
	Thu, 30 Jan 2020 13:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 447C1F80150; Thu, 30 Jan 2020 13:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AC4EF800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 13:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC4EF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="omKyHQUi"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00UC3ReX044818;
 Thu, 30 Jan 2020 06:03:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580385807;
 bh=6FNhWAsKrCu3ooWjnac1UY9926XUWnguUyvN/VK3OrI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=omKyHQUiadfjbxBxQlx+7g4LmVPUt18rrHGXbgMXvO4vchsqdbztZ0sBFfpJPDzj6
 fCol0gSW3SBVvBosDcWgbKiJ6wc/RvZzv/0CMS7i/TqPgOSnZ1rfrLURuJLFQWQWDj
 bpVGxZZ8Y+qdhXEUM++baBDS2HTsqqvK5eyJb/QM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00UC3RPq037293;
 Thu, 30 Jan 2020 06:03:27 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 06:03:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 06:03:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00UC3OXA052757;
 Thu, 30 Jan 2020 06:03:25 -0600
To: Daniel Baluta <daniel.baluta@gmail.com>
References: <CAEnQRZC=9_fnqEuBJsjc1QpCsXtV0NbAT0o_Yh58uMYGfHxz_A@mail.gmail.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <eb665210-eecf-6ad2-caaf-a90c0e7d139b@ti.com>
Date: Thu, 30 Jan 2020 14:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEnQRZC=9_fnqEuBJsjc1QpCsXtV0NbAT0o_Yh58uMYGfHxz_A@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] Managing resources of DSP from arm core side
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgRGFuaWVsLAoKT24gMjgvMDEvMjAyMCAxNy4xNCwgRGFuaWVsIEJhbHV0YSB3cm90ZToKPiBI
aSBQZXRlciwKPiAKPiBMaWFtIG1lbnRpb25lZCB0aGF0IGF0IHNvbWUgcG9pbnQgKHdoZW4gd29y
a2luZyBmb3IgT01BUCkKPiB5b3UgbWlnaHQgaGF2ZSBoYWQgdGhlIHNhbWUgY2hhbGxlbmdlIEkn
bSBmYWNpbmcgbm93LgoKU29ycnkgZm9yIHRoZSBkZWxheS4uLgoKPiBJJ20gdHJ5aW5nIHRvIGZp
Z3VyZSBvdXQgaG93IHRvIHByb3Blcmx5IG1hbmFnZSByZXNvdXJjZXMgbmVlZGVkIGJ5Cj4gdGhl
IElQcyBjb25maWd1cmVkCj4gYnkgRFNQLgo+IAo+IE9uIGkuTVg4IHdlIHRoZSBmb2xsb3dpbmcg
c2NlbmFyaW86Cj4gCj4gLSBBcHBsaWNhdGlvbiBwcm9jZXNzb3IgKGFybTY0KSBleHBvc2VzIGFu
IEFMU0Egc291bmQgY2FyZCB0byBhcHBsaWNhdGlvbnMKPiAtIERTUCAoSGlmaTQpIGRvZXMgdGhl
IHByb2Nlc3NpbmcKPiAKPiBEU1AgaGFzIGRpcmVjdCBhY2Nlc3MgdG8gIERBSSByZWdpc3RlcnMg
YnV0IGl0IGRvZXNuJ3QgaGF2ZSAoZWFzaWx5KQo+IGFjY2VzcyB0byBvdGhlciByZXNvdXJjZXMK
PiBsaWtlOiBwaW5jdHJsLCBwb3dlci1kb21haW4sIGNsb2NrcywgZXRjLgo+IAo+IEkgd2FzIHdv
bmRlcmluZyBob3cgZGlkIHlvdSB0YWNrbGVkIHRoaXMgZm9yIE9NQVA/CgpJdCBpcyAod2FzLCBh
cyB0aGUgQUVTUy9BQkUgc3VwcG9ydCBpcyBub3QgdXBzdHJlYW0pIGJpdCBkaWZmZXJlbnQuCkZy
b20gdGhlIGF1ZGlvIGJhY2tlbmQgd2UgZG8gbm90IHRvdWNoIHRoZSBEQUkgcmVnaXN0ZXJzLCBh
bGwgc2V0dXAgaXMKZG9uZSBvbiB0aGUgTGludXggc2lkZSBhbmQgdGhlIEFFU1MgJ29ubHknIG1h
bmFnaW5nIHRoZSBkYXRhIGZsb3cuCgpTbyB0aGUgYmFjay1lbmRzIGFyZSB0aGUgREFJcyBhbmQg
dGhleSBhcmUgbWFuYWdlZCBieSBMaW51eCwgdGhlCmZyb250LWVuZCBpcyBBRVNTLiBEQUlzIGFy
ZSBjb25maWd1cmVkIGJ5IGZpeGluZyB1cCB0aGUgaHdfcGFyYW1zIGZvcgp0aGVtIGluIHRoZSBB
RVNTIChmcm9udC1lbmQpIHN0YWNrLCBzbyB0aGV5IGFyZSBjb25maWd1cmVkIGNvcnJlY3RseSBm
b3IKdGhlIHVzZSBjYXNlLgoKSXQgd2FzIHByZSBEUENNLCBidXQgdGhlIGZvdW5kYXRpb24gd2Fz
IHRoZSBzYW1lLgoKPiBJIGhhdmUgYWxyZWFkeSBjcmVhdGVkIGEgZHVtbXkgQ1BVIERBSSBvbiBM
aW51eCB0aGF0IGl0IHdpbGwgdGFrZSBjYXJlCj4gb2YgdGhpcyBbMV0uCj4gCj4gSXQgaXMgYSBw
YXJ0IG9mIGEgQmFjayBFbmQgbGluayBsaWtlIHRoaXMgKHNpbXBsaWZpZWQgdmlldyk6Cj4gCj4g
bGlua3NbaV0uY3B1cy0+bmFtZSA9ICJkdW1teV9kYWkiOwo+IGxpbmtzW2ldLnBsYXRmb3Jtcy0+
bmFtZSA9ICJkc3AiOwo+IGxpbmtzW2ldLmNvZGVjcy0+bmFtZSA9ICJjczQyODg4IjsKPiBsaW5r
c1tpXS5ub19wY20gPSAxOwo+IAo+IEl0IHdvcmtzIHByZXR0eSB3ZWxsIGZvciBiYXNpYyBwbGF5
YmFjayAvIGNhcHR1cmUuCj4gCj4gdGhhbmtzLAo+IERhbmllbC4KPiAKPiBbMV0gaHR0cHM6Ly9t
YXJjLmluZm8vP2w9YWxzYS1kZXZlbCZtPTE1ODAyMjI5NjUxOTU5NyZ3PTIKPiAKCi0gUMOpdGVy
CgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBI
ZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21p
Y2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
