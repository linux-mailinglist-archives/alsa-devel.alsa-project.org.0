Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC76150427
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 11:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB06168D;
	Mon,  3 Feb 2020 11:24:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB06168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580725509;
	bh=mlEgdvhJklOsx+3Uz+Q6ofw2nVu4JVUIU9IJ8Et2AlU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sc/Oqy1rLgfHSqDWk/JMPfK3xgiTZHSmPimxh+1DcOhIUmr8FT47kxVZ0pCglp4v4
	 2fgQ1zlLvwDE3LjZL78UJ4nyHu7y0FNFlZ4L3qAeQLT+j/hb+G/iwRw+UbW6uUbNbt
	 tqGeLGQ0wD2VZAFUW69HVmFN7+4TfkXhxjDiqYug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78BE2F80142;
	Mon,  3 Feb 2020 11:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A770CF80148; Mon,  3 Feb 2020 11:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic306-19.consmr.mail.ir2.yahoo.com
 (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92648F8011D
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 11:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92648F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="k2bR/ifL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1580725401; bh=QDa5ThEOjMLGEBnbJNLEBtWf68FG/1tbRgVUs9mbo3s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=k2bR/ifLZb+DRdX6L6C8/BY95cN6ynRj2SDE8K5avNAXDV67ECofpEGgVoqAE0HdBwrkYuztL1ZR/nD0JDsKGKWppnPVt0dNPhuRVdW0jr2xeUOt7JanRy6Wt19rBxsHvzwc+rlnS+3WeOVGKYhavC/clUi0yK6pd4+lCRr8UNUT8Z/oUVmT/hqWesEWCp38e7LnfchJ7APW3YUBWacIbr98nTmIQVUsjBtvVUGad98E4jks9ZGvvESPy+V07BxWKcU0n0XmqaaLkVZZUi+D8UiMj3vcFAFjEIPn8oPaPtQbp32SafMRudSxZ1rDSwjxMtCP0fgimbNp6wK86fES3Q==
X-YMail-OSG: Vgj2rfgVM1kY5EEedoyAkWebQg.WWFsoKpmjUwPTzELOW30kOYbSVyfkwWkcLxn
 Dusf9KCzvn7Bb6L63xyr.2U.6WHr3pxxAmXqLIbqh6TSW8kTOzQHUWwcKqLOl7DbFL0.24qgqhcI
 Pf9yAG2CYBIm0OopFgGG_bUoh5aNJSU5rlh5sBXC30SdqP4lwyW4Zb5KLSL7auzsixIHT_1xdMdk
 _0QweXvgSLSNW_lE45Hk_xjSlToTsZOYCzzm8dQqz7oAlLRlTuOyECoonxz6Ks7nsYbtYoaf2FJm
 Ki4qVCWa12Nj4AC7aoHy4WbR0nMkttXmd9tDW40TrFnofDjtjYjyq2LbaXlYgLYRPCTbWOKoSIAV
 td_5657MNHKA.TtsIrAWw6m0fKJMn.WGbAzi8J2FTZb0QhuP4XW_Frho_UE5nIZjunDFi2ATEeow
 kGmXtZEAMEhHrQV4gfDkTOFZzrDpv_XwiIszXGav0pkKWjxrVtDCWxBmVkPMqApuuMzlKSpgjBEN
 eyQ_bNOLkBb2HYpwv1SrckBCwE2svufDH1GLGXNZDBdrdYG9T1wAXKBCBCkmOKEQKM5Ruind4mjQ
 oJKE30Z2tyoWysOf6jywUd14Fd2_CN1ceDD6MRcVuU.31j3uvQSZk1.iXwiP1qf43yVoA_tCbwXg
 fL4.dBAQQA5MIv8NlgJBi3DKPNKcmbFOUfP5KtJuzAzk25HNFhOmGXGrxFSuApJmPpRFWmxVp3bm
 8Uc0V1UZ5gYRqxnM9Dxi9yAj5tS8qW4.vmB189si9ChKqu_2Ns4dbCCd3rOB1kYZasPZFv9JOWdS
 Yxf0aDqGoDXIh3gI2a4qE1X79jtYbb2KF2uPoQStYeAb.AFGWaiWGshXhGMv2v44LJ7X.il8.Hhj
 dGKsvsUh7mB8xPIsBFHHk__KbJTI5hl.Gk7reIDuuGYFyQMcYWrpIvsOxzx.TfEr4vZB9ZSSY13l
 uwmRH5j3U37d0CAmZHpyn.GOjvmMN6bxUJqxTb4TyC6X3kTyf8XpS3xo6B3je7UV53nHKC6.BpWZ
 qyvx_sILI4r_WjTHbyXzU2bJ6QR02gWp.cCIlHBFpUM31KF2OmprAapYtQdVXXf29.pOU6Swn3UH
 8DhPrZkb8cHx__OWgOwU1xA.0dYVbqwy.IG_L.IS8JJKhyYkPpddzqhVbL_W4ecd3RXe3uPzpCCU
 BdeKb3tAyIfXh6aaA6KTNpsazEL533L5lNYijqtrIfjWu1Bafa7Q94zBNeZDEWAQyUf3OR2fQK.Q
 LsuqnolArt_aXNPXe3ap6zaMO2UTfDU3e2aE5LxlYTRSKl7I7xaGd8ldkLiCGsyy5c8Os00LGUNe
 xsWMT7zDSJhyy7uLWS9.cvhpENjpULUs20HGmlj5KDvaMaav_VQE_LZpvaXK2hEdIr1WSoIOgv1l
 xxY8PYwq3OUV1208KwBI-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Mon, 3 Feb 2020 10:23:21 +0000
Received: by smtp415.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 8f048ac4e40ba03a31a5a5d1c7ee9bcd; 
 Mon, 03 Feb 2020 10:23:19 +0000 (UTC)
To: "alexander@tsoy.me" <alexander@tsoy.me>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
 <1697977016.25666627.1579681629054@mail.yahoo.com>
From: Tobias <toszlanyi@yahoo.de>
Message-ID: <d9cdf599-6e53-29bc-e42f-a2a8acee85be@yahoo.de>
Date: Mon, 3 Feb 2020 11:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1697977016.25666627.1579681629054@mail.yahoo.com>
Content-Language: en-US
X-Mailer: WebService/1.1.15149 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
 controller
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

RGVhciBBbGV4YW5kZXIgLSB1bmZvcnR1bmF0ZWx5IEkgZGlkIGhvdCBoZWFyIGJhY2sgZnJvbSB5
b3UuIEkgZ3Vlc3MgCnRoaXMgbWF5IG5vdCBiZSB5b3VyIGhpZ2hlc3QgcHJpb3JpdHkgYnV0IHN0
aWxsIC0gZG8geW91IGhhdmUgYW55IG90aGVyIAppZGVhIHRvIG1ha2UgdGhlIE1DNzAwMCBzb3Vu
ZCBkZXZpY2Ugd29ya2luZz8gVGhhbmtzIGEgbG90LgoKCkFtIDIyLjAxLjIwIHVtIDA5OjI3IHNj
aHJpZWIgT3N6bGFueWkgVG9iaWFzOgo+IEhlbGxvIEFsZXhhbmRlci7CoEkgY29tcGlsZWQgdGhl
IGtlcm5lbCB3aXRoIHlvdXIgcGF0Y2ggYnV0IHRoZSByZXN1bHQgdW5mb3J0dW5hdGVseSBpdCdz
IHRoZSBzYW1lLiBUaGUgYXVkaW8gZGV2aWNlIGlzIHN0aWxsIG5vdCB3b3JraW5nLCBkbWVzZyBz
aG93cyB0aGUgc2FtZSBtZXNzYWdlIHRoYXQgY2xvY2sgc291cmNlIGlzIG5vdCB2YWxpZC4gQW55
IG90aGVyIGlkZWE/Cj4gVGhhbmtzIGEgbG90VG9iaWFzCj4KPiBHZXNlbmRldCB2b24gWWFob28g
TWFpbCBhdWYgQW5kcm9pZAo+ICAgCj4gICAgQW0gRGkuLCBKYW4uIDIxLCAyMDIwIGF0IDEyOjAw
IHNjaHJpZWIgQWxleGFuZGVyIFRzb3k8YWxleGFuZGVyQHRzb3kubWU+OiAgIFBsZWFzZSB0cnkg
dGhlIHBhdGNoIGJlbG93LiBNYWtlIHN1cmUgdGhhdCBubyBvdGhlciBwYXRjaGVzIGFyZSBhcHBs
aWVkLgo+Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWly
a3MuYwo+IGluZGV4IDgyMTg0MDM2NDM3Yi4uNzI2NGY1N2QzMTg4IDEwMDY0NAo+IC0tLSBhL3Nv
dW5kL3VzYi9xdWlya3MuYwo+ICsrKyBiL3NvdW5kL3VzYi9xdWlya3MuYwo+IEBAIC0xNTUzLDYg
KzE1NTMsMTMgQEAgdm9pZCBzbmRfdXNiX2N0bF9tc2dfcXVpcmsoc3RydWN0IHVzYl9kZXZpY2Ug
KmRldiwgdW5zaWduZWQgaW50IHBpcGUsCj4gICDCoMKgwqAgwqAgwqAgJiYgKHJlcXVlc3R0eXBl
ICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfQ0xBU1MpCj4gICDCoMKgwqAgwqDCoMKgIG1z
bGVlcCgyMCk7Cj4gICAKPiArwqDCoMKgIC8qCj4gK8KgwqDCoCAqIERlbm9uIE1DNzAwMAo+ICvC
oMKgwqAgKi8KPiArwqDCoMKgIGlmIChjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MTVlNCwgMHg4
MDA0KSAmJgo+ICvCoMKgwqAgwqAgwqAgKHJlcXVlc3R0eXBlICYgVVNCX1RZUEVfTUFTSykgPT0g
VVNCX1RZUEVfQ0xBU1MpCj4gK8KgwqDCoCDCoMKgwqAgbXNsZWVwKDIwKTsKPiArCj4gICDCoMKg
wqAgLyogWm9vbSBSMTYvMjQsIExvZ2l0ZWNoIEg2NTBlLCBKYWJyYSA1NTBhIG5lZWRzIGEgdGlu
eSBkZWxheSBoZXJlLAo+ICAgwqDCoMKgICogb3RoZXJ3aXNlIHJlcXVlc3RzIGxpa2UgZ2V0L3Nl
dCBmcmVxdWVuY3kgcmV0dXJuIGFzIGZhaWxlZCBkZXNwaXRlCj4gICDCoMKgwqAgKiBhY3R1YWxs
eSBzdWNjZWVkaW5nLgo+Cj4KPiDQkiDQktGCLCAyMS8wMS8yMDIwINCyIDA5OjE3ICswMTAwLCBU
b2JpYXMg0L/QuNGI0LXRgjoKPj4gVGhhbmtzIGEgbG90IGZvciB0aGUgaGludCBBbGV4YW5kZXIu
IEFueWhvdywgSSBhbSBub3Qgc3VyZSB3aGVyZSB0byBwdXQKPj4gdGhhdC4KPj4gQWxzbyBUYWth
c2hpIEl3YWkgd2FzIGludm9sdmVkIGFscmVhZHkgYW5kIEkgd291bGQgbGlrZSB0byBwcmV2ZW50
Cj4+IG1peGluZyB1cCB0aGluZ3Mgb3IgZG91YmxlIHdvcmsuCj4+Cj4+IFBsZWFzZSBhZHZpc2Ug
aW4gZGV0YWlsIHdoYXQgSSB3b3VsZCBuZWVkIHRvIGRvIGFzIEkgYW0gbm90IGEgcHJvZ3JhbW1l
ci4KPj4KPj4gVGhhbmtzIGEgbG90Lgo+PiBUb2JpYXMKPj4KPj4gQW0gMjAuMDEuMjAgdW0gMDk6
MjIgc2NocmllYiBBbGV4YW5kZXIgVHNveToKPj4+INCSINCh0LEsIDE0LzEyLzIwMTkg0LIgMDk6
MjQgKzAxMDAsIFRvYmlhcyDQv9C40YjQtdGCOgo+Pj4+IEhlbGxvIGRlYXIgQUxTQSBkZXZlbG9w
ZXJzLgo+Pj4+Cj4+Pj4gSSBoYXZlIHB1cmNoYXNlZCBhIE1DNzAwMCBjb250cm9sbGVyIGluIG9y
ZGVyIHRvIGNvbnRyb2wgTUlYWFggb24KPj4+PiBVYnVudHUKPj4+PiAxNi4wNC4gQWNjb3JkaW5n
IHRvIHRoZSBEZW5vbiBzcGVjaWZpY2F0aW9uIHRoZSBjb250cm9sbGVyIHNob3VsZAo+Pj4+IGhh
dmUKPj4+PiBiZWVuIGNsYXNzIGNvbXBsaWFudCBidXQgdGhlcmUgaXMgYW4gaXNzdWUgd2l0aCB0
aGUgQXVkaW8gaW50ZXJmYWNlCj4+Pj4gdG8KPj4+PiB3b3JrIHByb3Blcmx5IGdpdmluZyBmb2xs
b3dpbmcgbWVzc2FnZSAuLi4KPj4+Pgo+Pj4+ICQgZG1lc2cKPj4+PiAuLi4KPj4+Pj4gW8KgIDc0
LjUyMjgzMV0gdXNiIDEtMS4zOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVz
aW5nCj4+Pj4+IHhoY2lfaGNkCj4+Pj4gW8KgIDc0LjYyMzc4NF0gdXNiIDEtMS4zOiBOZXcgVVNC
IGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MTVlNCwKPj4+PiBpZFByb2R1Y3Q9ODAwNAo+Pj4+IFvC
oCA3NC42MjM3ODldIHVzYiAxLTEuMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFBy
b2R1Y3Q9MiwKPj4+PiBTZXJpYWxOdW1iZXI9Mwo+Pj4+IFvCoCA3NC42MjM3OTNdIHVzYiAxLTEu
MzogUHJvZHVjdDogREVOT04gREogTUM3MDAwCj4+Pj4gW8KgIDc0LjYyMzc5Nl0gdXNiIDEtMS4z
OiBNYW51ZmFjdHVyZXI6IERFTk9OIERKCj4+Pj4gW8KgIDc0LjYyMzc5OF0gdXNiIDEtMS4zOiBT
ZXJpYWxOdW1iZXI6IDIwMTYwMwo+Pj4+IFvCoCA3NC42MjUxMzRdIHVzYiAxLTEuMzogY2xvY2sg
c291cmNlIDY1IGlzIG5vdCB2YWxpZCwgY2Fubm90IHVzZQo+Pj4+Cj4+Pj4gInx8fGNsb2NrIHNv
dXJjZSA2NSBpcyBub3QgdmFsaWQsIGNhbm5vdCB1c2UiIGlzIHJlcGVhdGVkCj4+Pj4gdW5jb3Vu
dGFibGUKPj4+PiB0aW1lcyB0aGVuCj4+Pj4KPj4+IFBsZWFzZSB0cnkgdG8gYWRkIGRlbGF5IGFm
dGVyIGVhY2ggY2xhc3MgY29udHJvbCByZXF1ZXN0IGluCj4+PiBzbmRfdXNiX2N0bF9tc2dfcXVp
cmsoKToKPj4+Cj4+PiAgwqAgwqAgwqAgaWYgKGNoaXAtPnVzYl9pZCA9PSBVU0JfSUQoMHgxNWU0
LCAweDgwMDQpICYmCj4+PiAgwqAgwqAgwqAgwqAgwqAgKHJlcXVlc3R0eXBlICYgVVNCX1RZUEVf
TUFTSykgPT0gVVNCX1RZUEVfQ0xBU1MpCj4+PiAgwqAgwqAgwqAgwqAgwqAgbXNsZWVwKDIwKTsK
Pj4+Cj4gICAgCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
