Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F27144DBD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 09:29:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8FB166D;
	Wed, 22 Jan 2020 09:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8FB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579681744;
	bh=g1wkxqh299lW/vWIaloc229Y1Yk5UXDAxIaH1S25aiA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=DVnQLk12IsbKJmrydkNbMsW1Dx0wK+RMq+nP0HkNgHx9fskOIAoELwvCUFJv8zPTG
	 eIFjjAE6A4Jix5KluOhN3+rfoytZz1Z93VgObNDKQGcgvA6l5h5moNEVRD8eg7eFHF
	 fNg/FYY9ERmF3aVBUcWo2zLEqGD/kuyx7+BDxgGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBC4F8020C;
	Wed, 22 Jan 2020 09:27:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FC3F800E7; Wed, 22 Jan 2020 09:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL, 
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic305-19.consmr.mail.ir2.yahoo.com
 (sonic305-19.consmr.mail.ir2.yahoo.com [77.238.177.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 410AAF800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 09:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410AAF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="QfUNklZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1579681632; bh=RBICrVo4a3VaimDVBsNCq87/WAk0LC584rH7s75dIdc=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=QfUNklZpVzWlLHg2F/rG9rvCIKPHyLyHMZYN8s54hChoLCjvikDjYGEVKOOOVlfNcWHXsT2uR6daVvbPULmryWAyzG6nXylDHJcAE7CCdcjZJ2ndtVzOfIH/Wxv3mSS14BGGr56gCA/mYf2ed48AT/HKRqIrmjsABzKFYPy4vZbLZ9391T80brdinbU9H8r0WTtRPbLAvSo8xxjiEsmiz6cot0JA9tFVgCV0yEusHLLbRHc05mUWG+wDJ8ASEaXu9l+MpjeBuvGGLmeDoizh3rK5yaX94yfPZdyp4K+nM6boAP4Y//3Lt5PTZGDKTvWXg74vy9bswA4dQsWA2qWQZg==
X-YMail-OSG: OVNF1PcVM1nuqx8oEn7qNZH2rTHZWJuklp9H_5nxoa_bwkHh.CvLHqxpEhIFeiD
 F_QdPiIvTc1AU0iZT4uKLvi2j3zaNIAxZgHnS_MjkMj_eArzsLQpHX.17e80g7aeIf3AB.F9JJjp
 L46gfH.kePBHPBdyyM5pC2laoal1xCrY2c4Z6FyH6vQRsrTbC21yJcbITfpTDmIoOQX1u9tA1VB4
 HNEne07u5iTNw_pvkC0UYtbpTWLdiaielg_DtzAi9Q3x77LTd.DX1dCbAQpiWqMbWTxhUsn4YFXQ
 Bcx0w4rrTXaobVMLJtcEyoxCvjU4PUjiphHyFKxEy3Wo2PP_jB6LgC_9QuspSoDGv19E_tTkVG_t
 0nhl_VkbAj.f9GWlcYjUJ74bynNH2sLTtrd1LvGrDA4BFbIalHJNlGROGoKfSp3lNSU3K_Pb5sWJ
 eQ6OwB6fXDoqdD_hA3.G1eKZpzt7NNqbq5crzFN6DhXOo5GP3K3618rhflHzFHzAB2ZwiN2p8u.k
 TaSGa9oiZxXIsy2aYplP0RVGRLlWjxto2fOc59SolvE_8foTRuwVrRYX.jSzPWBzZyQrw2tfvCS8
 vVpBF6cJngR0VYgKSe38pE_62y3WFuP3j8bKYO.cVEpSKkuEyz35XIoIR7vErVnnKOhxV5_GZlvu
 _K.rI76LB4.uTi1XsW8wDiVZDjSgXF6wXGjvWBA2gur7mKIn36NZIh0BYW4YdfRpvqPFw5DpUFae
 QAcsygMoyu9h2rhqVVDySNC8oMxWvVwQqYKH3Az5gZb9bTECdsjyvw4cZltxgr2T2zvdqoVRU4ex
 Dt2QZk.DfPGPr1Sv8I0NmP7KYXBZz.._bMAcdp6CUCyquv.DDFuUziZCRwtZAi_vTmsYNheTmBdA
 FKVAYKrTSKP4rkxRFqHemNvJ0gAaebU4sGJj2Y.AG5rugZEcKmErd3NXgkyg1e8UaPVf6lJs1MaU
 RPhb_l8PX1zziAezJo2AcDkDwcIxvs.FMQe0wzMjO6N2bfkw49GbY4HHZ4ddsoYTSFEvaPfab4Ut
 o8xRSXAmhlVrry87SkJZ5SMqHWIULsamtiww7XJMkR2Yn0uYoN7ULnmU5cZoEcY7sxpLqR9wGd0t
 _llBDn43HbgR_c5ZEteW2OTcXKuRZoyuM_.zl4ExuTGR9bBWioF6L0rQXVLY7DzEjB48JsXk918g
 TpV6O0BPvdAjid4A11d.xdUREqINm6qUCzTr.ypZ2T7va1g9MLIoB9JOBwLOzdzYTnBMS6BW9XqR
 qk6Fph4WTUMR1kPmagUN.N1_wJnVAykOMDzfmpFWksa8abYNUZRRuhzmAKVnid9NepBmN7kViWEp
 L4OWPXxsRY7wPVSkyguYqXgIk6iWFLeCmemNt9h2ZdyjZRr3DvQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Wed, 22 Jan 2020 08:27:12 +0000
Date: Wed, 22 Jan 2020 08:27:09 +0000 (UTC)
From: Oszlanyi Tobias <toszlanyi@yahoo.de>
To: "alexander@tsoy.me" <alexander@tsoy.me>, 
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <1697977016.25666627.1579681629054@mail.yahoo.com>
In-Reply-To: <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
References: <9457db14-4084-c0dd-5c89-821b35c3db66.ref@yahoo.de>
 <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
 <697208e751dcbcc70cf00af7b625a4109b9c66cb.camel@tsoy.me>
 <a0e87326-839d-76df-dfd1-6d571017fc27@yahoo.de>
 <6a0079e3343a6bc860b495d9258fada061bf83ba.camel@tsoy.me>
MIME-Version: 1.0
X-Mailer: WebService/1.1.14873 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.3.0; Android/8.0.0; OPPS27.91-176-11-7;
 nora_8917; motorola; moto e5; 5.46; 1358x720; )
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: "toszlanyi@yahoo.de" <toszlanyi@yahoo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGVsbG8gQWxleGFuZGVyLsKgSSBjb21waWxlZCB0aGUga2VybmVsIHdpdGggeW91ciBwYXRjaCBi
dXQgdGhlIHJlc3VsdCB1bmZvcnR1bmF0ZWx5IGl0J3MgdGhlIHNhbWUuIFRoZSBhdWRpbyBkZXZp
Y2UgaXMgc3RpbGwgbm90IHdvcmtpbmcsIGRtZXNnIHNob3dzIHRoZSBzYW1lIG1lc3NhZ2UgdGhh
dCBjbG9jayBzb3VyY2UgaXMgbm90IHZhbGlkLiBBbnkgb3RoZXIgaWRlYT8KVGhhbmtzIGEgbG90
VG9iaWFzCgpHZXNlbmRldCB2b24gWWFob28gTWFpbCBhdWYgQW5kcm9pZCAKIAogIEFtIERpLiwg
SmFuLiAyMSwgMjAyMCBhdCAxMjowMCBzY2hyaWViIEFsZXhhbmRlciBUc295PGFsZXhhbmRlckB0
c295Lm1lPjogICBQbGVhc2UgdHJ5IHRoZSBwYXRjaCBiZWxvdy4gTWFrZSBzdXJlIHRoYXQgbm8g
b3RoZXIgcGF0Y2hlcyBhcmUgYXBwbGllZC4KCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVpcmtz
LmMgYi9zb3VuZC91c2IvcXVpcmtzLmMKaW5kZXggODIxODQwMzY0MzdiLi43MjY0ZjU3ZDMxODgg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYworKysgYi9zb3VuZC91c2IvcXVpcmtzLmMK
QEAgLTE1NTMsNiArMTU1MywxMyBAQCB2b2lkIHNuZF91c2JfY3RsX21zZ19xdWlyayhzdHJ1Y3Qg
dXNiX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlwZSwKIMKgwqDCoCDCoCDCoCAmJiAocmVx
dWVzdHR5cGUgJiBVU0JfVFlQRV9NQVNLKSA9PSBVU0JfVFlQRV9DTEFTUykKIMKgwqDCoCDCoMKg
wqAgbXNsZWVwKDIwKTsKIAorwqDCoMKgIC8qCivCoMKgwqAgKiBEZW5vbiBNQzcwMDAKK8KgwqDC
oCAqLworwqDCoMKgIGlmIChjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MTVlNCwgMHg4MDA0KSAm
JgorwqDCoMKgIMKgIMKgIChyZXF1ZXN0dHlwZSAmIFVTQl9UWVBFX01BU0spID09IFVTQl9UWVBF
X0NMQVNTKQorwqDCoMKgIMKgwqDCoCBtc2xlZXAoMjApOworCiDCoMKgwqAgLyogWm9vbSBSMTYv
MjQsIExvZ2l0ZWNoIEg2NTBlLCBKYWJyYSA1NTBhIG5lZWRzIGEgdGlueSBkZWxheSBoZXJlLAog
wqDCoMKgICogb3RoZXJ3aXNlIHJlcXVlc3RzIGxpa2UgZ2V0L3NldCBmcmVxdWVuY3kgcmV0dXJu
IGFzIGZhaWxlZCBkZXNwaXRlCiDCoMKgwqAgKiBhY3R1YWxseSBzdWNjZWVkaW5nLgoKCtCSINCS
0YIsIDIxLzAxLzIwMjAg0LIgMDk6MTcgKzAxMDAsIFRvYmlhcyDQv9C40YjQtdGCOgo+IFRoYW5r
cyBhIGxvdCBmb3IgdGhlIGhpbnQgQWxleGFuZGVyLiBBbnlob3csIEkgYW0gbm90IHN1cmUgd2hl
cmUgdG8gcHV0IAo+IHRoYXQuCj4gQWxzbyBUYWthc2hpIEl3YWkgd2FzIGludm9sdmVkIGFscmVh
ZHkgYW5kIEkgd291bGQgbGlrZSB0byBwcmV2ZW50IAo+IG1peGluZyB1cCB0aGluZ3Mgb3IgZG91
YmxlIHdvcmsuCj4gCj4gUGxlYXNlIGFkdmlzZSBpbiBkZXRhaWwgd2hhdCBJIHdvdWxkIG5lZWQg
dG8gZG8gYXMgSSBhbSBub3QgYSBwcm9ncmFtbWVyLgo+IAo+IFRoYW5rcyBhIGxvdC4KPiBUb2Jp
YXMKPiAKPiBBbSAyMC4wMS4yMCB1bSAwOToyMiBzY2hyaWViIEFsZXhhbmRlciBUc295Ogo+ID4g
0JIg0KHQsSwgMTQvMTIvMjAxOSDQsiAwOToyNCArMDEwMCwgVG9iaWFzINC/0LjRiNC10YI6Cj4g
PiA+IEhlbGxvIGRlYXIgQUxTQSBkZXZlbG9wZXJzLgo+ID4gPiAKPiA+ID4gSSBoYXZlIHB1cmNo
YXNlZCBhIE1DNzAwMCBjb250cm9sbGVyIGluIG9yZGVyIHRvIGNvbnRyb2wgTUlYWFggb24KPiA+
ID4gVWJ1bnR1Cj4gPiA+IDE2LjA0LiBBY2NvcmRpbmcgdG8gdGhlIERlbm9uIHNwZWNpZmljYXRp
b24gdGhlIGNvbnRyb2xsZXIgc2hvdWxkCj4gPiA+IGhhdmUKPiA+ID4gYmVlbiBjbGFzcyBjb21w
bGlhbnQgYnV0IHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggdGhlIEF1ZGlvIGludGVyZmFjZQo+ID4g
PiB0bwo+ID4gPiB3b3JrIHByb3Blcmx5IGdpdmluZyBmb2xsb3dpbmcgbWVzc2FnZSAuLi4KPiA+
ID4gCj4gPiA+ICQgZG1lc2cKPiA+ID4gLi4uCj4gPiA+ID4gW8KgIDc0LjUyMjgzMV0gdXNiIDEt
MS4zOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVzaW5nCj4gPiA+ID4geGhj
aV9oY2QKPiA+ID4gW8KgIDc0LjYyMzc4NF0gdXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBmb3Vu
ZCwgaWRWZW5kb3I9MTVlNCwKPiA+ID4gaWRQcm9kdWN0PTgwMDQKPiA+ID4gW8KgIDc0LjYyMzc4
OV0gdXNiIDEtMS4zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLAo+
ID4gPiBTZXJpYWxOdW1iZXI9Mwo+ID4gPiBbwqAgNzQuNjIzNzkzXSB1c2IgMS0xLjM6IFByb2R1
Y3Q6IERFTk9OIERKIE1DNzAwMAo+ID4gPiBbwqAgNzQuNjIzNzk2XSB1c2IgMS0xLjM6IE1hbnVm
YWN0dXJlcjogREVOT04gREoKPiA+ID4gW8KgIDc0LjYyMzc5OF0gdXNiIDEtMS4zOiBTZXJpYWxO
dW1iZXI6IDIwMTYwMwo+ID4gPiBbwqAgNzQuNjI1MTM0XSB1c2IgMS0xLjM6IGNsb2NrIHNvdXJj
ZSA2NSBpcyBub3QgdmFsaWQsIGNhbm5vdCB1c2UKPiA+ID4gCj4gPiA+ICJ8fHxjbG9jayBzb3Vy
Y2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlIiBpcyByZXBlYXRlZAo+ID4gPiB1bmNvdW50
YWJsZQo+ID4gPiB0aW1lcyB0aGVuCj4gPiA+IAo+ID4gUGxlYXNlIHRyeSB0byBhZGQgZGVsYXkg
YWZ0ZXIgZWFjaCBjbGFzcyBjb250cm9sIHJlcXVlc3QgaW4KPiA+IHNuZF91c2JfY3RsX21zZ19x
dWlyaygpOgo+ID4gCj4gPsKgIMKgIMKgIGlmIChjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MTVl
NCwgMHg4MDA0KSAmJgo+ID7CoCDCoCDCoCDCoCDCoCAocmVxdWVzdHR5cGUgJiBVU0JfVFlQRV9N
QVNLKSA9PSBVU0JfVFlQRV9DTEFTUykKPiA+wqAgwqAgwqAgwqAgwqAgbXNsZWVwKDIwKTsKPiA+
IAoKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
