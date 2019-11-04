Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B387EDC7A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 11:26:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB121797;
	Mon,  4 Nov 2019 11:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB121797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572863206;
	bh=34rZmhqjyuUEoS+XUUsecFTxcAEsE/5opVZKDZs1d+w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boDTppF7S8KDJC1R1mWVicARqkxfZMLNniBDdFW2GXgLrl5FW8DNl5ZEr1RNi85NC
	 wWByfEE/BDrIzajDSbmH98E/gXnZelh9luUDBHOSmL73PBes1K3N7flEyWfXJUBKyE
	 GkIXHpuJfwW81SH5ziU0HZ5gS3tm33C71ZAgSG0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EA8F8048D;
	Mon,  4 Nov 2019 11:24:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79760F804FE; Mon,  4 Nov 2019 11:24:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C25F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 11:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C25F8015B
Received: from sslproxy01.your-server.de ([88.198.220.130])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1iRZXK-0008L4-R2; Mon, 04 Nov 2019 11:24:38 +0100
Received: from [93.104.100.36] (helo=[192.168.178.20])
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <lars@metafoo.de>)
 id 1iRZXK-00059k-6a; Mon, 04 Nov 2019 11:24:38 +0100
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 broonie@kernel.org, lgirdwood@gmail.com
References: <20191031134713.241157-1-maxime@cerno.tech>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <14c37030-2da6-5fb1-8eea-02c3bb94257a@metafoo.de>
Date: Mon, 4 Nov 2019 11:24:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031134713.241157-1-maxime@cerno.tech>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25622/Sun Nov  3 10:13:19 2019)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
Subject: Re: [alsa-devel] [PATCH] dt-bindings: sound: adau7118: Fix example
 warning
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

T24gMTAvMzEvMTkgMjo0NyBQTSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBUaGUgQURBVTcxMTgg
aGFzIGFuIGV4YW1wbGUgd2hlcmUgdGhlIGNvZGVjIGhhcyBhbiBpMmMgYWRkcmVzcyBvZiAxNCwg
YW5kCj4gdGhlIHVuaXQgYWRkcmVzcyBzZXQgdG8gMTQgYXMgd2VsbD4KPiBIb3dldmVyLCB3aGls
ZSB0aGUgYWRkcmVzcyBpcyBleHByZXNzZWQgaW4gZGVjaW1hbCwgdGhlIHVuaXQtYWRkcmVzcyBp
cwo+IHN1cHBvc2VkIHRvIGJlIGluIGhleGFkZWNpbWFsLCB3aGljaCBlbmRzIHVwIHdpdGggdHdv
IGRpZmZlcmVudCBhZGRyZXNzZXMKPiB0aGF0IHRyaWdnZXIgYSBEVEMgd2FybmluZy4gRml4IHRo
aXMgYnkgc2V0dGluZyB0aGUgdW5pdCBhZGRyZXNzIHRvICgweCllLgo+IAoKVGhlIG1pc3Rha2Ug
aXMgaW4gdGhlIEkyQyBhZGRyZXNzLCBzaG91bGQgYmUgMHgxNC4KCj4gQ2M6IE51bm8gU8OhIDxu
dW5vLnNhQGFuYWxvZy5jb20+Cj4gRml4ZXM6IDk2OWQ0OWIyY2RjOCAoImR0LWJpbmRpbmdzOiBh
c29jOiBBZGQgQURBVTcxMTggZG9jdW1lbnRhdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1l
IFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbCB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFt
bAo+IGluZGV4IGMzZjEwYWZiZGQ2Zi4uNjVmNjg0NGEwYzZkIDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgu
eWFtbAo+IEBAIC02NSw3ICs2NSw3IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgIC8qIGV4YW1wbGUg
d2l0aCBpMmMgc3VwcG9ydCAqLwo+ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+IC0gICAgICAgIGFkYXU3MTE4X2NvZGVjOiBhdWRp
by1jb2RlY0AxNCB7Cj4gKyAgICAgICAgYWRhdTcxMThfY29kZWM6IGF1ZGlvLWNvZGVjQGUgewo+
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksYWRhdTcxMTgiOwo+ICAgICAgICAg
ICAgICAgICAgcmVnID0gPDE0PjsKPiAgICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMg
PSA8MD47Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
