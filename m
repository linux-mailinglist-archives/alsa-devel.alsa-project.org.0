Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4657157E0D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 16:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7461685;
	Mon, 10 Feb 2020 16:01:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7461685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581346939;
	bh=xZFvdMhHUVpzpSMXHqU48CGohtxct0gbksKpPsi/e6U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFShfZIQJX4UqtCdjMCtMuz95uAcLVn9hEISO4VbIUBrRyTBf82WNox4RMMcL+LiN
	 R1dY/dYGyid6p3Gbtkh26Vk1Qm96dO+0m6+bQqF6jEUFg9lgSpK2Pxdt8Batl+rQLI
	 KNFPJ9fiZ0zxU9PZayoNuSEiS2M5xuQLrpjw48Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E4AF800FD;
	Mon, 10 Feb 2020 16:01:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A010F8019B; Mon, 10 Feb 2020 16:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910CEF8014F
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 16:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910CEF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nnYvyvNu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AF1JlZ009377;
 Mon, 10 Feb 2020 09:01:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581346879;
 bh=B/nOBT8Nq5yZ+RzogfXRvk5kf/L+erqu046VxjWWtjE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nnYvyvNudOMx7abul3CF1ecAWg13wKMSvZna3blAdDgGRYcgXYaFd/cQBMkkN7RBT
 ewfZjHv4+pP0P6CurzatKtza+2oFLxNVkK1gCJN+X2HqnLDEKdYCF4+IDgU1tyPJVF
 C31O1HpGm8HX2yXsmO2fYvaGEb+0RHvtxDrlRujA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AF1JBU048306
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 09:01:19 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 09:01:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 09:01:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AF1G2T128816;
 Mon, 10 Feb 2020 09:01:17 -0600
To: Takashi Iwai <tiwai@suse.de>
References: <20200210140423.10232-1-peter.ujfalusi@ti.com>
 <s5hmu9qfrq7.wl-tiwai@suse.de> <15c7df10-cf9f-109c-3cbf-e73af7f4f66a@ti.com>
 <s5hk14ufqx9.wl-tiwai@suse.de>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <084c2d48-96dd-4d57-84f9-f02204cfbece@ti.com>
Date: Mon, 10 Feb 2020 17:01:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5hk14ufqx9.wl-tiwai@suse.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, vkoul@kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: dmaengine_pcm: Consider DMA cache
 caused delay in pointer callback
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

CgpPbiAxMC8wMi8yMDIwIDE2LjM4LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gTW9uLCAxMCBG
ZWIgMjAyMCAxNToyODo0NCArMDEwMCwKPiBQZXRlciBVamZhbHVzaSB3cm90ZToKPj4KPj4gSGkg
VGFrYXNoaSwKPj4KPj4+PiAtLS0gYS9zb3VuZC9zb2Mvc29jLXBjbS5jCj4+Pj4gKysrIGIvc291
bmQvc29jL3NvYy1wY20uYwo+Pj4+IEBAIC0xMTUxLDcgKzExNTEsNyBAQCBzdGF0aWMgc25kX3Bj
bV91ZnJhbWVzX3Qgc29jX3BjbV9wb2ludGVyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vi
c3RyZWFtKQo+Pj4+ICAJfQo+Pj4+ICAJZGVsYXkgKz0gY29kZWNfZGVsYXk7Cj4+Pj4gIAo+Pj4+
IC0JcnVudGltZS0+ZGVsYXkgPSBkZWxheTsKPj4+PiArCXJ1bnRpbWUtPmRlbGF5ICs9IGRlbGF5
Owo+Pj4KPj4+IElzIGl0IGNvcnJlY3Q/Cj4+PiBkZWxheSBhbHJlYWR5IHRha2VzIHJ1bnRpbWUt
PmRlbGF5IGFzIGl0cyBiYXNpcywgc28gaXQnbGwgcmVzdWx0IGluIGEKPj4+IGRvdWJsZS4KPj4K
Pj4gVGhlIGRlbGF5IGhlcmUgaXMgY29taW5nIGZyb20gdGhlIERBSSBhbmQgdGhlIGNvZGVjLgo+
PiBUaGUgcnVudGltZS0+ZGVsYXkgaG9sZCB0aGUgUENNIChETUEpIGNhdXNlZCBkZWxheS4KPiAK
PiBXZWxsLCBsZXQncyB0YWtlIGEgbG9vayBhdCBzb2NfcGNtX3BvaW50ZXIoKToKPiAKPiAJLyog
Y2xlYXJpbmcgdGhlIHByZXZpb3VzIHRvdGFsIGRlbGF5ICovCj4gCXJ1bnRpbWUtPmRlbGF5ID0g
MDsKPiAKPiAJb2Zmc2V0ID0gc25kX3NvY19wY21fY29tcG9uZW50X3BvaW50ZXIoc3Vic3RyZWFt
KTsKPiAKPiAJLyogYmFzZSBkZWxheSBpZiBhc3NpZ25lZCBpbiBwb2ludGVyIGNhbGxiYWNrICov
Cj4gCWRlbGF5ID0gcnVudGltZS0+ZGVsYXk7Cj4gCj4gCWRlbGF5ICs9IHNuZF9zb2NfZGFpX2Rl
bGF5KGNwdV9kYWksIHN1YnN0cmVhbSk7Cj4gCj4gCWZvcl9lYWNoX3J0ZF9jb2RlY19kYWkocnRk
LCBpLCBjb2RlY19kYWkpIHsKPiAJCWNvZGVjX2RlbGF5ID0gbWF4KGNvZGVjX2RlbGF5LAo+IAkJ
CQkgIHNuZF9zb2NfZGFpX2RlbGF5KGNvZGVjX2RhaSwgc3Vic3RyZWFtKSk7Cj4gCX0KPiAJZGVs
YXkgKz0gY29kZWNfZGVsYXk7Cj4gCj4gCXJ1bnRpbWUtPmRlbGF5ID0gZGVsYXk7Cj4gCj4gU28s
IHRoZSBjb2RlIHJlYWRzIHRoZSBjdXJyZW50IHJ1bnRpbWUtPmRlbGF5IGFuZCBzYXZlcyBpdCBh
cyBkZWxheQo+IHZhcmlhYmxlLiAgVGhlbiBpdCBhZGRzIHRoZSBtYXggZGVsYXkgZnJvbSBjb2Rl
YyBEQUlzLCBhbmQgc3RvcmVzIGJhY2sKPiB0byBydW50aW1lLT5kZWxheS4KPiAKPiBJZiB3ZSBj
aGFuZ2UgdGhlIGxhc3QgbGluZSB0bwo+IAlydW50aW1lLT5kZWxheSArPSBkZWxheTsKPiBpdCds
bCBhZGQgdG8gdGhlIGFscmVhZHkgZXhpc3RpbmcgdmFsdWUgYWdhaW4sIHNvIGl0J2xsIGJlIGRv
dWJseSBpZgo+IHJ1bnRpbWUtPmRlbGF5IHdhcyBub24temVybyBiZWZvcmVoYW5kLgoKWWVzLCB5
b3UgYXJlIHJpZ2h0LgpUaGUgY2hhbmdlIGlzIGFkZGVkIGJ5CjlmYjRjMmJmMTMwYiBBU29DOiBz
b2MtcGNtOiBVc2UgZGVsYXkgc2V0IGluIGNvbXBvbmVudCBwb2ludGVyIGZ1bmN0aW9uCgp3aGlj
aCBJIGhhdmUgbWlzc2VkLCBhcHBhcmVudGx5LgoKPiBUaGF0IHNhaWQsIGp1ZGdpbmcgZnJvbSB0
aGUgY29kZSwgSSBiZWxpZXZlIHRoZSBjdXJyZW50IHNvYy1wY20uYyBjb2RlCj4gbmVlZHMgbm8g
Y2hhbmdlLgoKWWVzLCB0aGVyZSBpcyBubyBuZWVkIHRvIGNoYW5nZSBzb2MtcGNtLgoKPiAKPiAK
PiB0aGFua3MsCj4gCj4gVGFrYXNoaQo+IAoKLSBQw6l0ZXIKClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
