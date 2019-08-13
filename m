Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C598B459
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 11:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 905B41661;
	Tue, 13 Aug 2019 11:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 905B41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565689166;
	bh=wYnqWgKXkrrheMvk+k221s2BGrrfonRczq33Zm+eCJo=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8zeANS3AYWbHPjOO7TRh63O5LKSGt7vXCjKEBtRem4sDV5iOsCiUBgZhD6yyTv+W
	 GYa+fYUeKusCsoKVr7MJ6AYYSUF9MzYgWNdrnKLfz4ghOFnOKj+aROFBSbdIPy70Fu
	 KTWVQDl38Q0a6anzv1dzl4eqgVUHxAocYANp5dGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 067B1F80273;
	Tue, 13 Aug 2019 11:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D865F8026A; Tue, 13 Aug 2019 11:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B04FAF80273
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 11:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B04FAF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aLIR1UYB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D9Z06h059610;
 Tue, 13 Aug 2019 04:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565688900;
 bh=z5SehQ6Yf5BT5rg3RPDWJ4hLrJF6X7OEw5KQmH3sPbE=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=aLIR1UYBliStSX5k3OHl42m26KLHXoP0AkC9ZWWPZMx1oGzA02fKNuMZSzX9nzeui
 1BaoruULQXBuSGCg+GK/edlb1RqEmyPBz0gG90TBgrXvle4g0z2eHMLh3LtdVdQD3/
 0QPXsIyhG4QVW1ELFUnfXsMFqb1iGlZj+2Q84K6s=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D9Z0VS014160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 04:35:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 04:34:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 04:34:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D9YvUf054466;
 Tue, 13 Aug 2019 04:34:58 -0500
To: Masanari Iida <standby24x7@gmail.com>, <linux-kernel@vger.kernel.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <perex@perex.cz>, <alsa-devel@alsa-project.org>
References: <20190813034235.30673-1-standby24x7@gmail.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <9674e996-ef05-5da3-9d20-1ad5c44a6176@ti.com>
Date: Tue, 13 Aug 2019 12:35:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813034235.30673-1-standby24x7@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Fix typos in ti/Kconfig
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

CgpPbiAxMy8wOC8yMDE5IDYuNDIsIE1hc2FuYXJpIElpZGEgd3JvdGU6Cj4gVGhpcyBwYXRjaCBm
aXhlcyBzb21lIHNwZWxsaW5nIHR5cG8gaW4gS2NvbmZpZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
YXNhbmFyaSBJaWRhIDxzdGFuZGJ5MjR4N0BnbWFpbC5jb20+CgpBY2tlZC1ieTogUGV0ZXIgVWpm
YWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KCj4gLS0tCj4gIHNvdW5kL3NvYy90aS9LY29u
ZmlnIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9LY29uZmlnIGIvc291bmQvc29j
L3RpL0tjb25maWcKPiBpbmRleCAyMTk3ZjNlMWVhZWQuLjg3YTliOWRkNGU5OCAxMDA2NDQKPiAt
LS0gYS9zb3VuZC9zb2MvdGkvS2NvbmZpZwo+ICsrKyBiL3NvdW5kL3NvYy90aS9LY29uZmlnCj4g
QEAgLTEyLDcgKzEyLDcgQEAgY29uZmlnIFNORF9TT0NfVElfU0RNQV9QQ00KPiAgCj4gIGNvbW1l
bnQgIlRleGFzIEluc3RydW1lbnRzIERBSSBzdXBwb3J0IGZvcjoiCj4gIGNvbmZpZyBTTkRfU09D
X0RBVklOQ0lfQVNQCj4gLQl0cmlzdGF0ZSAiZGFWaW5jaSBBdWRpbyBTZXJpYWwgUG9ydCAoQVNQ
KSBvciBNY0JTUCBzdXBvcnQiCj4gKwl0cmlzdGF0ZSAiZGFWaW5jaSBBdWRpbyBTZXJpYWwgUG9y
dCAoQVNQKSBvciBNY0JTUCBzdXBwb3J0Igo+ICAJZGVwZW5kcyBvbiBBUkNIX0RBVklOQ0kgfHwg
Q09NUElMRV9URVNUCj4gIAlzZWxlY3QgU05EX1NPQ19USV9FRE1BX1BDTQo+ICAJaGVscAo+IEBA
IC0zMyw3ICszMyw3IEBAIGNvbmZpZyBTTkRfU09DX0RBVklOQ0lfTUNBU1AKPiAgCSAgLSBLZXlz
dG9uZSBkZXZpY2VzCj4gIAo+ICBjb25maWcgU05EX1NPQ19EQVZJTkNJX1ZDSUYKPiAtCXRyaXN0
YXRlICJkYVZpbmNpIFZvaWNlIEludGVyZmFjZSAoVkNJRikgc3Vwb3J0Igo+ICsJdHJpc3RhdGUg
ImRhVmluY2kgVm9pY2UgSW50ZXJmYWNlIChWQ0lGKSBzdXBwb3J0Igo+ICAJZGVwZW5kcyBvbiBB
UkNIX0RBVklOQ0kgfHwgQ09NUElMRV9URVNUCj4gIAlzZWxlY3QgU05EX1NPQ19USV9FRE1BX1BD
TQo+ICAJaGVscAo+IAoKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
