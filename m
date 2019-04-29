Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6965E147
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 13:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8A31664;
	Mon, 29 Apr 2019 13:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8A31664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556537351;
	bh=r2DLL2clLEj5nLJy+Pt84bkL0jttFIcBpA2le53IGik=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJ+7PSUEKRceHzGbPi9YdUJQj0yoe2N39rdnCLIta84l0qmxYGfrlX941UVqy8Do8
	 lZo9h9/1F3FmDV5F9jpMQhbh6MoWsMSgMAe2KdqM51aOPhNcDGd+r0xA7lOwWcs709
	 7DmOqBJwMDqJmwMcNUYV6clgULkWKJb4JAzKcESo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF29F80CAB;
	Mon, 29 Apr 2019 13:27:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D21FF80CAB; Mon, 29 Apr 2019 13:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_78,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D0BEF80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 13:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0BEF80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qyP9cbaI"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TBRIIN117261;
 Mon, 29 Apr 2019 06:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1556537238;
 bh=a+x+/nPRMlKw5EveKCxlbdn8CCxZMXGPNGFgU8VSsWA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=qyP9cbaIP90UdXbkUo96l4vHkj77yrzUhS0DkhQGe3KqUXM1BQH4r+iZjWH+lNn6M
 NnBImA8+D1mJMZ2ITWUJuN9VIbj9pU2DJj5h2ueBAD4rMDHTlfOhftfwgerH+g0nEj
 qDrTjbyIIZTOTQJZ8GcrXXQYYTZZLO8BdQXC95uk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TBRHjo122088
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Apr 2019 06:27:17 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 29
 Apr 2019 06:27:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 29 Apr 2019 06:27:17 -0500
Received: from [192.168.2.10] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TBRFvH073635;
 Mon, 29 Apr 2019 06:27:16 -0500
To: Saravanan Sekar <sravanhome@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
References: <20190427194005.7308-1-sravanhome@gmail.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <507b9ee8-2505-8014-114e-563dc5995e8f@ti.com>
Date: Mon, 29 Apr 2019 14:27:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190427194005.7308-1-sravanhome@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [alsa-devel] [PATCH] ASoC: tlv320aic3x: Add support for high
 power analog output
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

SGksCgpPbiAyNy8wNC8yMDE5IDIyLjQwLCBTYXJhdmFuYW4gU2VrYXIgd3JvdGU6Cj4gQWRkIHN1
cHBvcnQgdG8gcG93ZXIgYW5kIG91dHB1dCBsZXZlbCBjb250cm9sIGZvciB0aGUgYW5hbG9nIGhp
Z2ggcG93ZXIKPiBvdXRwdXQgZHJpdmVycyBIUE9VVCBhbmQgSFBDT00uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2FyYXZhbmFuIFNla2FyIDxzcmF2YW5ob21lQGdtYWlsLmNvbT4KPiAtLS0KPiAgc291
bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzeC5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3RsdjMy
MGFpYzN4LmMgYi9zb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzN4LmMKPiBpbmRleCA1MTZkMTdj
YjIxODIuLmQ0YmFmYWM4MDJlYiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3RsdjMy
MGFpYzN4LmMKPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzN4LmMKPiBAQCAtNDE5
LDYgKzQxOSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgYWljM3hf
c25kX2NvbnRyb2xzW10gPSB7Cj4gIAkvKiBQb3AgcmVkdWN0aW9uICovCj4gIAlTT0NfRU5VTSgi
T3V0cHV0IERyaXZlciBQb3dlci1PbiB0aW1lIiwgYWljM3hfcG93ZXJvbl90aW1lX2VudW0pLAo+
ICAJU09DX0VOVU0oIk91dHB1dCBEcml2ZXIgUmFtcC11cCBzdGVwIiwgYWljM3hfcmFtcHVwX3N0
ZXBfZW51bSksCj4gKwo+ICsJLyogQW5hbG9nIEhQT1VULCBIUENPTSBwb3dlciBhbmQgb3V0cHV0
IGxldmVsIGNvbnRyb2xzICovCj4gKwlTT0NfRE9VQkxFX1IoIkFuYWxvZyBvdXRwdXQgcG93ZXIg
Y29udHJvbCIsIEhQUk9VVF9DVFJMLAo+ICsJCQlIUFJDT01fQ1RSTCwgMCwgMSwgMCksCgpiaXQg
MCBvZiBIUFJPVVRfQ1RSTCBhbmQgSFBSQ09NX0NUUkwgaXMgaGFuZGxlZCBieSBEQVBNOgoiUmln
aHQgSFAgT3V0IgoiUmlnaHQgSFAgQ29tIgoKPiArCVNPQ19ET1VCTEVfUigiQW5hbG9nIG91dHB1
dCBsZXZlbCBjb250cm9sIiwgSFBST1VUX0NUUkwsCj4gKwkJCUhQUkNPTV9DVFJMLCA0LCA5LCAw
KSwKCmFuZCB0aGlzIHdpbGwgbW9kaWZ5IHRoZSBIUFIgYW5kIEhQUkNPTSAocmlnaHQgY2hhbm5l
bHMpIG9ubHkuCgpZb3Ugc2hvdWxkIGFkZCB0d28gY29udHJvbHM6CgovKiBIUC9IUENPTSB2b2x1
bWVzLiBGcm9tIDAgdG8gOSBkQiBpbiAxIGRCIHN0ZXBzICovCnN0YXRpYyBERUNMQVJFX1RMVl9E
Ql9TQ0FMRShocF90bHYsIDAsIDEwMCwgMCk7CgpTT0NfRE9VQkxFX1JfVExWKCJIUCBQbGF5YmFj
ayBWb2x1bWUiLCBIUExPVVRfQ1RSTCwgSFBST1VUX0NUUkwsIDQsIDksCjAsIGhwX3Rsdik7CgpT
T0NfRE9VQkxFX1JfVExWKCJIUENPTSBQbGF5YmFjayBWb2x1bWUiLCBIUExDT01fQ1RSTCwgSFBS
Q09NX0NUUkwsIDQsCjksIDAsIGhwX3Rsdik7CgoKPiAgfTsKPiAgCj4gIC8qIEZvciBvdGhlciB0
aGFuIHRsdjMyMGFpYzMxMDQgKi8KPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
