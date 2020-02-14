Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562F15D4C0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 10:30:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07BE1672;
	Fri, 14 Feb 2020 10:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07BE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581672620;
	bh=F6nOwtTdW6OJXvL8nL9RAG4Nh9ohC0czaLMfAa+Jhvo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJkFJwWU5yzCOTD320w+YXc06rM1IzIbj68mDRwXULiJFdNpcWcBcV4VknrMISlHo
	 Ba3LvGamt5eZOJyzSBGQGZ6hVodCBX3NmdYgi3Qbf/ArniM29DjCFLm29h/7YOSFoT
	 fv7aRJrnfxUYVEtXOMNNmNiNxuAsmDz5MC5GBl3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9835F80157;
	Fri, 14 Feb 2020 10:28:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF15DF8014F; Fri, 14 Feb 2020 10:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A0EDF800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 10:28:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0EDF800F0
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01E9SK8A005263,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01E9SK8A005263
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 17:28:20 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 14 Feb 2020 17:28:20 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 14 Feb 2020 17:28:20 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Fri, 14 Feb 2020 17:28:20 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: rt1015: fix typo for bypass boost control
Thread-Index: AdXhSBpc2VWHw78+SwuR/buCFp33zABJfbUAACpNaUA=
Date: Fri, 14 Feb 2020 09:28:19 +0000
Message-ID: <7a6ad579cc9044778d8d515d24a2b448@realtek.com>
References: <2fe07b2c200f43bc81de61f4e6c780ac@realtek.com>
 <20200213210404.GM4333@sirena.org.uk>
In-Reply-To: <20200213210404.GM4333@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: multipart/mixed;
 boundary="_002_7a6ad579cc9044778d8d515d24a2b448realtekcom_"
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?big5?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFuzr6vYp7td?= <kent_chen@realtek.com>,
 =?big5?B?s6/O66fT?= <kenny_chen@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
 =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
 Mingjane Hsieh <mingjane_hsieh@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1015: fix typo for bypass boost
	control
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_7a6ad579cc9044778d8d515d24a2b448realtekcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgTWFyaywNCg0KSSd2ZSBnZW5lcmF0ZWQgdGhlIHBhdGNoIGFnYWluIGZyb20gbGF0ZXN0ICJm
b3ItbmV4dCIgYnJhbmNoIGJ1dCBzdGlsbCBnZXQgdGhlIHNhbWUgcGF0Y2ggbGlrZSBhdHRhY2hl
ZCBmaWxlLA0Kbm90IHN1cmUgd2hhdCdzIHdyb25nIHdpdGggdGhpcyBwYXRjaD8gQ291bGQgeW91
IHBsZWFzZSBoZWxwIHNwZWNpZnkgd2hhdCdzIHdyb25nIHdpdGggdGhpcyBwYXRjaD8NClRoYW5r
IHlvdSB2ZXJ5IG11Y2ghDQoNClJlZ2FyZHMsDQpKYWNrDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmsgQnJvd24gW21haWx0bzpicm9vbmllQGtlcm5lbC5v
cmddDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTQsIDIwMjAgNTowNCBBTQ0KPiBUbzogSmFj
ayBZdQ0KPiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnOyBsYXJzQG1ldGFmb28uZGU7DQo+IEZsb3ZlKEhzaW5GdSk7ILOvzuun0zsga2VudF9jaGVu
QHJlYWx0ZWsuY29tIFuzr6vYp7tdOyBNaW5namFuZSBIc2llaDsNCj4gT2RlciBDaGlvdTsgU2h1
bWluZyBbrVOu0bvKXTsgRGVyZWsgW6TovHe4cV0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVNv
QzogcnQxMDE1OiBmaXggdHlwbyBmb3IgYnlwYXNzIGJvb3N0IGNvbnRyb2wNCj4gDQo+IE9uIFdl
ZCwgRmViIDEyLCAyMDIwIGF0IDAxOjU5OjQ5QU0gKzAwMDAsIEphY2sgWXUgd3JvdGU6DQo+ID4g
Rml4IHR5cG8gZm9yICJCeXBhc3MgQm9vc3QiIGNvbnRyb2wuDQo+IA0KPiBUaGlzIGRvZXNuJ3Qg
YXBwbHkgYWdhaW5zdCBjdXJyZW50IGNvZGUsIHBsZWFzZSBjaGVjayBhbmQgcmVzZW5kLiAgQWxz
bw0KPiB0aGlzIGlzIG1vcmUgb2YgYSBjdXQnbidwYXN0ZSBlcnJvciB0aGFuIGEgdHlwby4NCj4g
DQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5n
IHRoaXMgZS1tYWlsLg0K

--_002_7a6ad579cc9044778d8d515d24a2b448realtekcom_
Content-Type: application/octet-stream;
	name="0001-ASoC-rt1015-fix-typo-for-bypass-boost-control.patch"
Content-Description: 0001-ASoC-rt1015-fix-typo-for-bypass-boost-control.patch
Content-Disposition: attachment;
	filename="0001-ASoC-rt1015-fix-typo-for-bypass-boost-control.patch";
	size=1638; creation-date="Fri, 14 Feb 2020 09:16:49 GMT";
	modification-date="Fri, 14 Feb 2020 09:06:38 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2OWQ2NmNkMDk4YmVmNjllMTJmZmMzOTY2OWZkMWM4MDY4MzgxNjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPgpEYXRlOiBG
cmksIDE0IEZlYiAyMDIwIDE3OjA0OjQwICswODAwClN1YmplY3Q6IFtQQVRDSCB2Ml0gQVNvQzog
cnQxMDE1OiBmaXggdHlwbyBmb3IgYnlwYXNzIGJvb3N0IGNvbnRyb2wKCkZpeCB0eXBvIGZvciAi
QnlwYXNzIEJvb3N0IiBjb250cm9sLgoKU2lnbmVkLW9mZi1ieTogSmFjayBZdSA8amFjay55dUBy
ZWFsdGVrLmNvbT4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL3J0MTAxNS5jIHwgNiArKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2NvZGVjcy9ydDEwMTUuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQxMDE1LmMK
aW5kZXggNmQ0OTBlMmRiYzI1Li5kMzAwYjQxN2RkNTAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9j
b2RlY3MvcnQxMDE1LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDEwMTUuYwpAQCAtNDQ0LDcg
KzQ0NCw3IEBAIHN0YXRpYyBpbnQgcnQxMDE1X2Jvb3N0X21vZGVfcHV0KHN0cnVjdCBzbmRfa2Nv
bnRyb2wgKmtjb250cm9sLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHJ0NTUxOF9ieXBh
c3NfYm9vc3RfZ2V0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAorc3RhdGljIGludCBy
dDEwMTVfYnlwYXNzX2Jvb3N0X2dldChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKIAkJ
c3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpCiB7CiAJc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpjb21wb25lbnQgPQpAQCAtNDU3LDcgKzQ1Nyw3IEBAIHN0YXRpYyBpbnQgcnQ1
NTE4X2J5cGFzc19ib29zdF9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCiAJcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgcnQ1NTE4X2J5cGFzc19ib29zdF9wdXQoc3RydWN0IHNu
ZF9rY29udHJvbCAqa2NvbnRyb2wsCitzdGF0aWMgaW50IHJ0MTAxNV9ieXBhc3NfYm9vc3RfcHV0
KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCQlzdHJ1Y3Qgc25kX2N0bF9lbGVtX3Zh
bHVlICp1Y29udHJvbCkKIHsKIAlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9
CkBAIC00OTcsNyArNDk3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3
IHJ0MTAxNV9zbmRfY29udHJvbHNbXSA9IHsKIAkJcnQxMDE1X2Jvb3N0X21vZGVfZ2V0LCBydDEw
MTVfYm9vc3RfbW9kZV9wdXQpLAogCVNPQ19FTlVNKCJNb25vIExSIFNlbGVjdCIsIHJ0MTAxNV9t
b25vX2xyX3NlbCksCiAJU09DX1NJTkdMRV9FWFQoIkJ5cGFzcyBCb29zdCIsIFNORF9TT0NfTk9Q
TSwgMCwgMSwgMCwKLQkJcnQ1NTE4X2J5cGFzc19ib29zdF9nZXQsIHJ0NTUxOF9ieXBhc3NfYm9v
c3RfcHV0KSwKKwkJcnQxMDE1X2J5cGFzc19ib29zdF9nZXQsIHJ0MTAxNV9ieXBhc3NfYm9vc3Rf
cHV0KSwKIH07CiAKIHN0YXRpYyBpbnQgcnQxMDE1X2lzX3N5c19jbGtfZnJvbV9wbGwoc3RydWN0
IHNuZF9zb2NfZGFwbV93aWRnZXQgKnNvdXJjZSwKLS0gCjIuMjUuMAoK

--_002_7a6ad579cc9044778d8d515d24a2b448realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_7a6ad579cc9044778d8d515d24a2b448realtekcom_--
