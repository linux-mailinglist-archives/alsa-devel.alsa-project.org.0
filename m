Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB995CAF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 12:56:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF1E166F;
	Tue, 20 Aug 2019 12:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF1E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566298579;
	bh=E8KLn9tOWHZV9FjpfqfztZ5Ab4zsg5Vydvywj12zQV4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVBXeroWA+vIsjVmYqGBZDqnH1MVxNgdKvejjRlfqnxhpFZX8AniAvJhtlayRAqke
	 2tIEnC9HpoNMbxCgoMt3P3fDA/FgqkwXUMVlGi8UAdi4r9k+VK8ZygJ79aR1eeubkq
	 nxzGAR8NTK/12BylywSK5vAaFS9Dowp9BcJyeV2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89DDF803D5;
	Tue, 20 Aug 2019 12:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E06F8036E; Tue, 20 Aug 2019 12:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E65F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 12:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E65F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rR94uEkQ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KAsPxD060128;
 Tue, 20 Aug 2019 05:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566298465;
 bh=bpcY5wifZty9jijmJU2k4dWWpDJaZNKUQLEAWp7YByQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rR94uEkQPE+7AALBFWAn0eGFJA9a44v/MqfcieqW673uIk1GEpQLsu2MrzMckN35V
 m4SsX5eaNEoixsxdDh+Gd2ES31N2PIWGvz+6MFb3YLttqjBmVY3SoOdicqoCO+3qBh
 d/iCZzTs1YzciJo9SqA3iwdXYSj5uikjuJ0hdRQg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KAsPt9042225
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Aug 2019 05:54:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 05:54:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 05:54:24 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KAsMrx083814;
 Tue, 20 Aug 2019 05:54:23 -0500
To: Rong Chen <rong.a.chen@intel.com>
References: <alpine.DEB.2.21.1908091229140.2946@hadrien>
 <20190809123112.GC3963@sirena.co.uk>
 <88ac4c79-5ce3-3f1a-5f6e-3928a30a1ef5@ti.com>
 <alpine.DEB.2.21.1908091519400.2946@hadrien>
 <297e44a8-e08d-ddf2-e5e8-b532965b4a8d@intel.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <c3779fa2-3aab-3ba2-518d-9675591787af@ti.com>
Date: Tue, 20 Aug 2019 13:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <297e44a8-e08d-ddf2-e5e8-b532965b4a8d@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [kbuild-all] [PATCH] fix odd_ptr_err.cocci warnings
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

SGkgQ2hlbiwKCk9uIDIwLzA4LzIwMTkgMTEuNDEsIFJvbmcgQ2hlbiB3cm90ZToKPiBIaSBQZXRl
ciwKPiAKPiBXZSBoYXZlIHVwZGF0ZWQgdG8gb25seSBzZW5kIHRoZSByZXBvcnRzIHRvIHlvdSwg
cGxlYXNlIHNlZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvYmxvYi9tYXN0
ZXIvcmVwby9saW51eC9vbWFwLWF1ZGlvCgpUaGFuayB5b3UgdmVyeSBtdWNoIQoKPiAKPiBCZXN0
IFJlZ2FyZHMsCj4gUm9uZyBDaGVuCj4gCj4gT24gOC85LzE5IDk6MjEgUE0sIEp1bGlhIExhd2Fs
bCB3cm90ZToKPj4KPj4gT24gRnJpLCA5IEF1ZyAyMDE5LCBQZXRlciBVamZhbHVzaSB3cm90ZToK
Pj4KPj4+Cj4+PiBPbiAwOS8wOC8yMDE5IDE1LjMxLCBNYXJrIEJyb3duIHdyb3RlOgo+Pj4+IE9u
IEZyaSwgQXVnIDA5LCAyMDE5IGF0IDEyOjMwOjQ2UE0gKzAyMDAsIEp1bGlhIExhd2FsbCB3cm90
ZToKPj4+Pgo+Pj4+PiB0cmVlOsKgwqAgaHR0cHM6Ly9naXRodWIuY29tL29tYXAtYXVkaW8vbGlu
dXgtYXVkaW8KPj4+Pj4gcGV0ZXIvdGktbGludXgtNC4xOS55L3dpcAo+Pj4+PiBoZWFkOsKgwqAg
NjJjOWMxNDQyYzhmNjFjYTkzZTYyZTFhOWQ4MzE4YmUwYWJkOWQ5YQo+Pj4+PiBjb21taXQ6IDYy
YzljMTQ0MmM4ZjYxY2E5M2U2MmUxYTlkODMxOGJlMGFiZDlkOWEgWzM0LzM0XSBqNzIxZSBuZXcK
Pj4+Pj4gbWFjaGluZSBkcml2ZXIgd2lwCj4+Pj4+IDo6Ojo6OiBicmFuY2ggZGF0ZTogMjAgaG91
cnMgYWdvCj4+Pj4+IDo6Ojo6OiBjb21taXQgZGF0ZTogMjAgaG91cnMgYWdvCj4+Pj4+Cj4+Pj4+
IMKgIGo3MjFlLWV2bS5jIHzCoMKgwqAgNCArKy0tCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IC0tLSBhL3NvdW5kL3Nv
Yy90aS9qNzIxZS1ldm0uYwo+Pj4+PiArKysgYi9zb3VuZC9zb2MvdGkvajcyMWUtZXZtLmMKPj4+
Pj4gQEAgLTI4Myw3ICsyODMsNyBAQCBzdGF0aWMgaW50IGo3MjFlX2dldF9jbG9ja3Moc3RydWN0
IHBsYXRmCj4+Pj4gVGhpcyBmaWxlIGlzbid0IHVwc3RyZWFtLCBpdCdzIG9ubHkgaW4gdGhlIFRJ
IEJTUC4KPj4+IFllcywgaXQgaXMgbm90IHVwc3RyZWFtLCBidXQgdGhlIGZpeCBpcyB2YWxpZC4K
Pj4+Cj4+PiBKdWxpYTogaXMgaXQgcG9zc2libGUgdG8gZGlyZWN0IHRoZXNlIG5vdGlmaWNhdGlv
bnMgb25seSB0byBtZSBmcm9tCj4+PiBodHRwczovL2dpdGh1Yi5jb20vb21hcC1hdWRpby9saW51
eC1hdWRpby5naXQgPwo+Pj4KPj4+IEl0IG1vc3RseSBjYXJyaWVzIFRJIEJTUCBzdHVmZiBhbmQg
bXkgdmFyaW91cyBmb3IgdXBzdHJlYW0gYnJhbmNoZXMKPj4+IG5vd2RheXMuCj4+IFBsZWFzZSBk
aXNjdXNzIGl0IHdpdGggdGhlIGtidWlsZCBwZW9wbGUuwqAgVGhleSBzaG91bGQgYmUgYWJsZSB0
byBzZXQgaXQKPj4gdXAgYXMgeW91IHdhbnQuCj4+Cj4+IFlvdSBjYW4gdHJ5IGxrcEBpbnRlbC5j
b20KPj4KPj4ganVsaWEKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4ga2J1aWxkLWFsbCBtYWlsaW5nIGxpc3QKPj4ga2J1aWxkLWFsbEBsaXN0cy4w
MS5vcmcKPj4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9rYnVpbGQtYWxs
Cj4gCgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0
dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtv
dGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
