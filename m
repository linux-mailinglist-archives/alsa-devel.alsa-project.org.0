Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A1FFEB2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 07:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C07168D;
	Mon, 18 Nov 2019 07:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C07168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574059849;
	bh=ggHbnrP54P2JI1ZtkvgFLnissxFrx7e4tRnQV9k5Lqc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JiZxdooiqgRIfZ6turdHsJ2bu7jsloQGHmiAWIrM5UEGr3NRagJLY1gRbvUhwPi6u
	 QlQsKza8mDKOcBjJ0vjNP/l/pPt/kxHxWPDXR9T2PE+Nu5hJ7RNMbLPdmwVN+3CgXr
	 2/7yYeszF/KpnW7XXZ4478Ejcx+hiEgY5E2nYlwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10271F800F6;
	Mon, 18 Nov 2019 07:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 928D8F8013B; Mon, 18 Nov 2019 07:49:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 574CCF800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 07:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574CCF800F6
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iWao9-0001Cc-FT; Mon, 18 Nov 2019 07:46:45 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1iWao6-0003un-9S; Mon, 18 Nov 2019 07:46:42 +0100
Date: Mon, 18 Nov 2019 07:46:42 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: AS50 KCHsu0 <KCHSU0@nuvoton.com>
Message-ID: <20191118064642.r7bs7bpsd4glcluj@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
 <55560429-3504-d2f3-2ce5-c8644fbeb333@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55560429-3504-d2f3-2ce5-c8644fbeb333@nuvoton.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:45:43 up 2 days, 22:04, 18 users, load average: 0.00, 0.00, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 AS50 WTLi <WTLI@nuvoton.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, AS50 CTLin0 <CTLIN0@nuvoton.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "thomas.fehrenbacher@siedle.de" <thomas.fehrenbacher@siedle.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: nau8810: add aux input control,
 available on NAU8812
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

SGksCgpPbiAxOS0xMS0xNiAwMTo0MywgQVM1MCBLQ0hzdTAgd3JvdGU6Cj4gCj4gTWFyY28gRmVs
c2NoIOaWvCAyMDE5LzExLzE2IOS4iuWNiCAxMjowOCDlr6vpgZM6Cj4gPiBGcm9tOiBUaG9tYXMg
RmVocmVuYmFjaGVyIDx0aG9tYXMuZmVocmVuYmFjaGVyQHNpZWRsZS5kZT4KPiA+Cj4gPiBUaGlz
IGNvbW1pdCBhZGRzIHRoZSBzdXBwb3J0IHRvIGNvbnRyb2wgdGhlIGF1eC1wb3J0IG9uIHRoZSBu
YXU4ODEyCj4gPiBkZXZpY2VzLiBXZSBkb24ndCBuZWVkIHRvIGRpZmZlcmVudGlhdGUgdGhlIGF1
eC1wb3J0IHJlZ2lzdGVycyBzaW5jZQo+ID4gdGhvc2UgYml0ZmllbGRzIGFyZSBzZXQgdG8gJzAn
IG9uIHRoZSBuYXU4ODEwIGRldmljZXMgWzEsMl0uCj4gPgo+ID4gWzFdIGh0dHA6Ly93d3cubnV2
b3Rvbi5jb20vcmVzb3VyY2UtZmlsZXMvTkFVODgxMF9EYXRhc2hlZXRfUmV2XzIuOC5wZGYKPiA+
IFsyXSBodHRwOi8vd3d3Lm51dm90b24uY29tL3Jlc291cmNlLWZpbGVzL05BVTg4MTJEYXRhc2hl
ZXRSZXYyLjcucGRmCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEZlaHJlbmJhY2hlciA8
dGhvbWFzLmZlaHJlbmJhY2hlckBzaWVkbGUuZGU+Cj4gPiBbbS5mZWxzY2hAcGVuZ3V0cm9uaXgu
ZGU6IGFkZCBjb21taXQgbWVzc2FnZV0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNvIEZlbHNjaCA8
bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiAtLS0KPiA+ICAgc291bmQvc29jL2NvZGVjcy9u
YXU4ODEwLmMgfCA3ICsrKysrKysKPiA+ICAgc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmggfCAy
ICsrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvbmF1ODgxMC5jIGIvc291bmQvc29jL2NvZGVjcy9uYXU4
ODEwLmMKPiA+IGluZGV4IGEzMmE0YThkNWY1MC4uYjEwMjRkMjRkNDEzIDEwMDY0NAo+ID4gLS0t
IGEvc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmMKPiA+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3Mv
bmF1ODgxMC5jCj4gPiBAQCAtMzUxLDYgKzM1MSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25k
X2tjb250cm9sX25ldyBuYXU4ODEwX3NuZF9jb250cm9sc1tdID0gewo+ID4gICBOQVU4ODEwX0RB
Q09TX1NGVCwgMSwgMCksCj4gPiAgIFNPQ19TSU5HTEUoIkFEQyBPdmVyc2FtcGxpbmcgUmF0ZSgx
Mjh4KSBTd2l0Y2giLCBOQVU4ODEwX1JFR19BREMsCj4gPiAgIE5BVTg4MTBfQURDT1NfU0ZULCAx
LCAwKSwKPiA+ICsKPiA+ICtTT0NfU0lOR0xFKCJBVVggSW5wdXQgRW5hYmxlIFN3aXRjaCIsIE5B
VTg4MTBfUkVHX1BPV0VSMSwKPiA+ICtOQVU4ODEwX0FVWF9FTl9TRlQsIDEsIDApLAo+ID4gICB9
Owo+ID4KPiAKPiAKPiBUaGUgcG93ZXIgY29udHJvbCBoYXMgdG8gbW92ZSB0byB0aGUgbmF1ODgx
MF9kYXBtX3dpZGdldHMuCj4gCj4gVGhlIERBUE0gY2FuIGp1c3QgY29udHJvbCB0aGUgcG93ZXIg
c3dpdGNoIG9mIEFVWEkgZHluYW1pY2FsbHkuCgpPa2F5LCB0aGFua3MgZm9yIGNvdmVyaW5nIHRo
YXQuIEkgd2lsbCBwcmVwYXJlIGEgdjIgd2l0aCB5b3VyIGFuZCBNYXJrJ3MKZmVlZGJhY2suCgpS
ZWdhcmRzLAogIE1hcmNvCgo+ID4gICAvKiBTcGVha2VyIE91dHB1dCBNaXhlciAqLwo+ID4gQEAg
LTM4Myw2ICszODYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgbmF1
ODgxMF9pbnBnYVtdID0gewo+ID4gICBOQVU4ODEwX05NSUNQR0FfU0ZULCAxLCAwKSwKPiA+ICAg
U09DX0RBUE1fU0lOR0xFKCJNaWNQIFN3aXRjaCIsIE5BVTg4MTBfUkVHX0lOUFVUX1NJR05BTCwK
PiA+ICAgTkFVODgxMF9QTUlDUEdBX1NGVCwgMSwgMCksCj4gPiArU09DX0RBUE1fU0lOR0xFKCJB
VVggU3dpdGNoIiwgTkFVODgxMF9SRUdfSU5QVVRfU0lHTkFMLAo+ID4gK05BVTg4MTBfQVVYUEdB
X1NGVCwgMSwgMCksCj4gPiAgIH07Cj4gPgo+ID4gICAvKiBMb29wYmFjayBTd2l0Y2ggKi8KPiA+
IEBAIC00MzYsNiArNDQxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lk
Z2V0IG5hdTg4MTBfZGFwbV93aWRnZXRzW10gPSB7Cj4gPgo+ID4gICBTTkRfU09DX0RBUE1fSU5Q
VVQoIk1JQ04iKSwKPiA+ICAgU05EX1NPQ19EQVBNX0lOUFVUKCJNSUNQIiksCj4gPiArU05EX1NP
Q19EQVBNX0lOUFVUKCJBVVgiKSwKPiA+ICAgU05EX1NPQ19EQVBNX09VVFBVVCgiTU9OT09VVCIp
LAo+ID4gICBTTkRfU09DX0RBUE1fT1VUUFVUKCJTUEtPVVRQIiksCj4gPiAgIFNORF9TT0NfREFQ
TV9PVVRQVVQoIlNQS09VVE4iKSwKPiA+IEBAIC00NzAsNiArNDc2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUgbmF1ODgxMF9kYXBtX3JvdXRlc1tdID0gewo+ID4g
ICB7IklucHV0IFBHQSIsIE5VTEwsICJNaWMgQmlhcyJ9LAo+ID4gICB7IklucHV0IFBHQSIsICJN
aWNOIFN3aXRjaCIsICJNSUNOIn0sCj4gPiAgIHsiSW5wdXQgUEdBIiwgIk1pY1AgU3dpdGNoIiwg
Ik1JQ1AifSwKPiA+ICt7IklucHV0IFBHQSIsICJBVVggU3dpdGNoIiwgIkFVWCJ9LAo+ID4KPiA+
ICAgLyogRGlnaXRhbCBMb29wdGFjayAqLwo+ID4gICB7IkRpZ2l0YWwgTG9vcGJhY2siLCAiU3dp
dGNoIiwgIkFEQyJ9LAo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvbmF1ODgxMC5o
IGIvc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmgKPiA+IGluZGV4IDFhZGEzMTg4M2RjNi4uN2I1
ZWNhZDE3M2QzIDEwMDY0NAo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmgKPiA+
ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbmF1ODgxMC5oCj4gPiBAQCAtNjksNiArNjksNyBAQAo+
ID4KPiA+ICAgLyogTkFVODgxMF9SRUdfUE9XRVIxICgweDEpICovCj4gPiAgICNkZWZpbmUgTkFV
ODgxMF9EQ0JVRl9FTigweDEgPDwgOCkKPiA+ICsjZGVmaW5lIE5BVTg4MTBfQVVYX0VOX1NGVDYK
PiA+ICAgI2RlZmluZSBOQVU4ODEwX1BMTF9FTl9TRlQ1Cj4gPiAgICNkZWZpbmUgTkFVODgxMF9N
SUNCSUFTX0VOX1NGVDQKPiA+ICAgI2RlZmluZSBOQVU4ODEwX0FCSUFTX0VOKDB4MSA8PCAzKQo+
ID4gQEAgLTIyOSw2ICsyMzAsNyBAQAo+ID4gICAvKiBOQVU4ODEwX1JFR19JTlBVVF9TSUdOQUwg
KDB4MkMpICovCj4gPiAgICNkZWZpbmUgTkFVODgxMF9QTUlDUEdBX1NGVDAKPiA+ICAgI2RlZmlu
ZSBOQVU4ODEwX05NSUNQR0FfU0ZUMQo+ID4gKyNkZWZpbmUgTkFVODgxMF9BVVhQR0FfU0ZUMgo+
ID4KPiA+ICAgLyogTkFVODgxMF9SRUdfUEdBR0FJTiAoMHgyRCkgKi8KPiA+ICAgI2RlZmluZSBO
QVU4ODEwX1BHQUdBSU5fU0ZUMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgVGhlIHByaXZpbGVnZWQgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZv
ciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFs
IHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGlj
YXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9m
IHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBz
ZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZy
b20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29v
cGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVu
YXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMg
c3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGly
cmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVl
bWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uCgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
