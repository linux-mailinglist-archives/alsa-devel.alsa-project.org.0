Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79393161242
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 13:43:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0370F1677;
	Mon, 17 Feb 2020 13:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0370F1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581943394;
	bh=pvHWASK059smUQjwzuXPdcEMfgW/RdQbXw4k029uF4k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlpO0u1vRjk7ym9H/nyQc1ukQbtZTlz0NoJWvJIy5DIsxer77iVoh/BWO2hqOHtal
	 MXCmTLSumVLti+948rQB7B8FhIw3H28NvGsxSOmWqP2ymV/5dp3W42q0hFZmk6yMCk
	 X2G5QK5FE11sVTqOw5ZU6nK8tshtuGpGT1KJvDZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03B62F80172;
	Mon, 17 Feb 2020 13:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AE68F80096; Mon, 17 Feb 2020 13:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7214F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 13:41:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 92142A003F;
 Mon, 17 Feb 2020 13:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 92142A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581943285; bh=q44d5lWEaRzbYYqlC+9R5XR1liScE0RbmzJQ1dnNfSo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XibUzzoMbE7XsvfXunJZSpXkyT8Vw9IqQk6jIjAOGM1qpT+vgrxnZEJZM7aPD/6U2
 5uWJM6s4RcbON2w9HaZOgmzihneD3uFJPDx6HrcCgB7hy78puGjMSzUE2HaQ8AzZL1
 endgvvfSOycJEYoRzv84kpkesObgd21b7gFAU9aY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 17 Feb 2020 13:41:21 +0100 (CET)
To: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
 <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
 <20200217113540.GB108283@ediswmail.ad.cirrus.com>
 <4fafa55a-acd0-8a64-2ebe-0ed38b306678@ti.com>
 <ce896073-df9e-7504-6c37-c611dd750936@metafoo.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1ba08788-7def-30ff-7232-699d2f40dc27@perex.cz>
Date: Mon, 17 Feb 2020 13:41:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ce896073-df9e-7504-6c37-c611dd750936@metafoo.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] DMARC & gmail & cirrus.com
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

RG5lIDE3LiAwMi4gMjAgdiAxMzoxNyBMYXJzLVBldGVyIENsYXVzZW4gbmFwc2FsKGEpOgo+IE9u
IDIvMTcvMjAgMTI6NTYgUE0sIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24g
MTcvMDIvMjAyMCAxMy4zNSwgQ2hhcmxlcyBLZWVwYXggd3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAx
NywgMjAyMCBhdCAxMDozMzo1NUFNICswMTAwLCBMYXJzLVBldGVyIENsYXVzZW4gd3JvdGU6Cj4+
Pj4gT24gMi8xNy8yMCA5OjQ2IEFNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4+Pj4+ICAgwqDC
oMKgwqBJIGNhbiBlbmFibGUgdGhlICJSZXBsYWNlIHRoZSBGcm9tOiBoZWFkZXIgYWRkcmVzcyIg
aW4gdGhlCj4+Pj4+IG1haWxtYW4gY29uZmlnIHRvICJNdW5nZSBGcm9tIiBsaWtlIGluIHRoZSBh
Ym92ZSBleGFtcGxlLCBidXQgaXQKPj4+Pj4gd2lsbCBtZWFuIHRoYXQgRnJvbTogd2lsbCBiZSBh
bHRlcmVkIChzZWUgdGhlIGV4cGxhbmF0aW9uKS4KPj4+Pgo+Pj4+IFRoZSB3YXkgSSB1bmRlcnN0
YW5kIHRoZSBvcHRpb24gdG8gcmVwbGFjZSB0aGUgRnJvbTogaGVhZGVyIGlzIHRoYXQKPj4+PiBp
dCB3aWxsIG9ubHkgaGFwcGVuIGZvciB0aG9zZSB0aGF0IGhhdmUgYSByZWplY3QgcG9saWN5LCBm
b3IKPj4+PiBldmVyeWJvZHkgZWxzZSBub3RoaW5nIGNoYW5nZXMuIFNvIGlmIHRoZSBtYWlsaW5n
bGlzdCBpcyBzdXBwb3NlZCB0bwo+Pj4+IHN0YXkgdXNlZnVsIGZvciB0aG9zZSB3aXRoIGEgcmVq
ZWN0IHBvbGljeSB0aGUgb25seSBvcHRpb24gaXMgdG8KPj4+PiByZXdyaXRlIHRoZSBmcm9tIGhl
YWRlciBmb3IgdGhlbS4KPj4+Pgo+Pj4KPj4+IFJld3JpdGluZyBzZWVtcyBsaWtlIHRoZSBiZXN0
IG9wdGlvbiByZWFsbHksIEkgZG91YnQgdGhlcmUKPj4+IGlzIG11Y2ggY2hhbmNlIG9mIG1lIG1h
bmFnaW5nIHRvIGdldCB0aGUgSVMgZ3V5cyB0byBjaGFuZ2UKPj4+IGNpcnJ1cy5jb20ncyBETUFS
QyBwb2xpY3kgYW5kIEkgZ3Vlc3Mgd2UgbWlnaHQgbm90IGJlIHRoZSBvbmx5Cj4+PiBwZW9wbGUg
d2hvIGNhdXNlIHRyb3VibGUgb24gdGhpcyBmcm9udC4KPj4KPj4gdGkuY29tIGFsc28gaGFkIGlz
c3VlcyBjYXVzZWQgYnkgRE1BUkMgcG9saWN5LiBXZSBoYXZlIGV4dGVuc2l2ZWx5Cj4+IG5hZ2dl
ZCBvdXIgSVQgZGVwYXJ0bWVudCBvdmVyIHRoaXMgYW5kIGl0IGdvdCByZXNvbHZlZD8KPj4gUHJv
YmFibHkuIE5vdCBzdXJlLCBidXQgSSBoYXZlIG5vdCBiZWVuIHVuc3Vic2NyaWJlZCBsYXRlbHkg
ZnJvbSBsaXN0cwo+PiBhbmQgbm8gY29tcGxhaW50cyBvbiBwZW9wbGUgbm90IHJlY2VpdmluZyBt
eSBtYWlscy4uLiBpdCBjb3VsZCBiZSB0aGF0Cj4+IHRoZXkgZG8gbm90IGluZGVlZCByZWNlaXZl
IHRoZSBtYWlscyB3aGljaCBtYWtlcyB0aGVtIGhhcHB5IDspCj4gSXRzIG5vdCB0aGF0IHlvdSBn
ZXQgdW5zdWJzY3JpYmVkLCBidXQgZXZlcnlib2R5IGVsc2Ugd2hvIGlzIHJlamVjdGluZwo+IHlv
dXIgbWFpbHMgOykKPiAKPiBfZG1hcmMudGkuY29tLgkJMzYwMAlJTglUWFQKPiAidj1ETUFSQzE7
cD1xdWFyYW50aW5lO3NwPW5vbmU7cnVhPW1haWx0bzpkbWFyYy1hZ2dyQHRpLmNvbTtydWY9bWFp
bHRvOmRtYXJjLWZvckB0aS5jb207Zm89MCIKPiAKPiBUaGUgcD1xdWFyYW50aW5lIG1lYW5zIHRo
YXQgeW91ciBtZXNzYWdlcyBmb3J3YXJkZWQgYnkgdGhlIEFMU0EKPiBtYWlsaW5nbGlzdCB3aWxs
IHByb2JhYmx5IGdvIHRvIHNwYW0gZm9yIHBlb3BsZSB1c2luZyBnbWFpbC4KPiAKPiBTb21lIG90
aGVyIG1haWxpbmdsaXN0cyBidHcgZG9uJ3QgaGF2ZSB0aGlzIHByb2JsZW0sIHNpbmNlIHRoZXkg
Zm9yd2FyZAo+IHRoZSBzaWduZWQgY29udGVudCBvZiB0aGUgbWFpbCB1bm1vZGlmaWVkLiBCdXQg
c2luY2UgYWxzYSBtb2RpZmllcyB0aGUKPiBzdWJqZWN0IGFzIHdlbGwgYXMgYWRkaW5nIHRoZSBp
bmZvIGZvb3RlciB0aGUgb3JpZ2luYWwgc2lnbmF0dXJlIGlzIG5vCj4gbG9uZ2VyIHZhbGlkLgoK
SSBhZGRlZCBhIGZpbHRlciBmb3IgdGhlIGdtYWlsIERNQVJDIGJvdW5jZXMgKHNvIG1haWxtYW4g
d2lsbCBub3QgcmVjZWl2ZSAKdGhlbSkgYW5kIGluY3JlYXNlZCB0aGUgdW5zdWJzY3JpYmUgdGhy
ZXNob2xkIG5vdy4gQnV0IGFzIHlvdSBub3RlZCwgaXQgZG9lcyAKbm90IHJlc29sdmUgdGhlIGlz
c3VlIHdpdGggdGhlIHVuZGVsaXZlcmVkIGUtbWFpbHMgZnJvbSB0aGUgbWFpbGluZyBsaXN0IApi
ZWNhdXNlIHRoZSBETUFSQyBwb2xpY3kgaXMgdG9vIHN0cm9uZyBvbiB0aGUgc2VuZGVyJ3Mgc2lk
ZS4KCkkgY2FuIHJlbW92ZSB0aGUgc3ViamVjdCBwcmVmaXggYW5kIGZvb3RlciBidXQgYXJlIHlv
dSBhbGwgb2sgd2l0aCB0aGlzPyBJIApvbmx5IGhvcGUgdGhhdCBtYWlsbWFuIHdpbGwgbm90IGRv
IG90aGVyIHRoaW5ncyB3aXRoIG1lc3NhZ2UgYm9keSB0byBicmVhayB0aGUgCnNpZ25hdHVyZS4g
SXQgc2VlbXMgdGhhdCBMS01MIGFsc28gZG9lcyBub3QgYWx0ZXIgdGhlIG1lc3NhZ2UgY29udGVu
dHMuCgoJCQkJCQlKYXJvc2xhdgoKLS0gCkphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+
CkxpbnV4IFNvdW5kIE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5jLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
