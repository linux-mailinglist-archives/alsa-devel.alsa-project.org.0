Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DD15031E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 10:16:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552FE168B;
	Mon,  3 Feb 2020 10:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552FE168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580721385;
	bh=KvM0RX9F0KPjFi7CkFDzoWe8AmmDIsh9K2JD1+7Vx44=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fKqhN2+9f19PVdxyKyt31Toz+UdBHvzf010koT3fihSJEoZGak9mIzOdMWj3irHwn
	 VWtNByUv53H6cQhmsgpse3n1Cj2gRlX0x4iRhX8y9usdy/kEPqjVVk4/S3GIvVD9iN
	 3B9gM5XTB3ENwYIlHycbxieJqnbtjnH1E9bIT9M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D6C6F80051;
	Mon,  3 Feb 2020 10:14:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089FFF80148; Mon,  3 Feb 2020 10:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BC3DF800B8
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 10:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BC3DF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="oSMIV5u0"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e37e46b0000>; Mon, 03 Feb 2020 01:14:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 01:14:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 01:14:33 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Feb
 2020 09:14:31 +0000
To: Jaroslav Kysela <perex@perex.cz>, Martin Regner <martin@larkos.de>,
 Takashi Iwai <tiwai@suse.de>
References: <20191119084710.29267-5-nmahale@nvidia.com>
 <0b827293-cc8b-3c3e-9160-565037ff172b@larkos.de>
 <s5hmua18jvr.wl-tiwai@suse.de>
 <3a15996e-1b8f-b5f0-77da-2fcfa8334bcb@larkos.de>
 <cbf24d05-9bff-4aba-0f7a-601a949e98a5@perex.cz>
 <1ba208d8-4a65-c7ab-283e-ba9850edd94f@larkos.de>
 <dd1124fb-e3cd-3f8a-a231-f6a0597b4b51@perex.cz>
X-Nvconfidentiality: Public
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <7a374408-27cb-aa33-b4bc-ee7d9e54baa2@nvidia.com>
Date: Mon, 3 Feb 2020 14:44:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <dd1124fb-e3cd-3f8a-a231-f6a0597b4b51@perex.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580721259; bh=tVSiiGeqSGyiz4mXgZrw5IDqnjstZZrOya5qJtuK4Jk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=oSMIV5u0KU7CJwff2xH2A2Q/49Tyan7G/Q0DT3MGNjS41tCFA5PmjxJ9yvNW2utL0
 TMpEOhsZQECMUjNY4+PgvL08Sqi8NBCYs7EJzjULQUfHgzlYWgqNmjz73/xM0mV8ac
 Z3+I2rDtBeoibNSiH0P3Uw72t1TC/edUO1cXRvirj7WxilCRPJ/OGoapReLl75Cmr2
 gcDVm03VXepRI7cRnF2f7sPy4HgRbwNb+hu9jtnLLYi+9cEFXGZUP5eLGJt110jBzr
 B3tU9Tqa5k8xxJeLezzQJrDD5LT7NtN+PsDL9VQPMHOApknhyBcoh4tNEDduXSpeIo
 u84n9EMSpPlgg==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v3 4/4] ALSA: hda - Add DP-MST support for
 NVIDIA codecs
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

aGRtaV9wcmVzZW50X3NlbnNlKCkKICB8LT4gaGRtaV9wcmVzZW50X3NlbnNlX3ZpYV92ZXJicygp
CmNvZGUgcGF0aCBuZWVkIHRvIHF1ZXJ5IFBDTSBqYWNrIHVzaW5nIHBpbl9pZHhfdG9famFjaygp
IGZ1bmN0aW9uIGFuZCB1cGRhdGUKaXRzIHN0YXR1cywganVzdCBsaWtlIHN5bmNfZWxkX3ZpYV9h
Y29tcCgpLgoKU2VuZGluZyBwYXRjaCB0byBnZXQgaXQgZml4ZWQuCgpUaGFua3MsCk5pa2hpbCBN
YWhhbGUKCk9uIDIvMy8yMCAxOjA3IFBNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4gRXh0ZXJu
YWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPiAKPiAK
PiBEbmUgMDMuIDAyLiAyMCB2IDA6NTAgTWFydGluIFJlZ25lciBuYXBzYWwoYSk6Cj4+IEhpIEph
cm9zbGF2LAo+Pgo+PiB0aGFua3MgZm9yIHRoZSB0aXAuIEkgdHJpZWQgdGhpcyAoaW4gbXkgY2Fz
ZSBlY2hvIG9uwqAgPgo+PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowOVw6MDAuMS9wb3dl
ci9jb250cm9sKSBidXQgdGhhdCBkaWRuJ3QgaGVscC4KPj4KPj4gSWYgaSBjb21tZW50IG91dCB0
aGUgbGluZQo+Pgo+PiBzcGVjLT5keW5fcGNtX2Fzc2lnbiA9IHRydWU7Cj4+Cj4+IGluIHBhdGNo
X252aGRtaSBzb3VuZCBpcyB3b3JraW5nIGFnYWluLgo+IAo+IENvdWxkIHlvdSBzaG93IHVzICh1
cGxvYWQgaXQgdG8gdGhlIGFsc2Egc2VydmVyIGFuZCBwb3N0IG9ubHkgVVJMcykgdGhlIG91dHB1
dAo+IGZyb20gYWxzYS1pbmZvLnNoIGZvciBib3RoIHZhcmlhbnRzIChzcGVjLT5keW5fcGNtX2Fz
c2lnbiA9IHRydWUgYW5kIGZhbHNlKSA/Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGFua3Ms
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSmFyb3NsYXYKPiAKPj4KPj4g
Q3VyaW91c2x5IG5vYm9keSBlbHNlIHNlZW1zIHRvIGhhdmUgdGhpcyBwcm9ibGVtLiBUaGlzIG1h
a2VzIG1lIHRoaW5rCj4+IHRoZSBwcm9ibGVtIGxpZXMgZWxzZXdoZXJlIGJ1dCBpIGhhdmUgbm8g
bW9yZSBpZGVhcyBhdCB0aGUgbW9tZW50Lgo+Pgo+PiBPbiAwMy4wMi4yMCAwMDowMCwgSmFyb3Ns
YXYgS3lzZWxhIHdyb3RlOgo+Pj4gRG5lIDAyLiAwMi4gMjAgdiAxNToxOCBNYXJ0aW4gUmVnbmVy
IG5hcHNhbChhKToKPj4+PiBIaSBUYWthc2hpLAo+Pj4+Cj4+Pj4gdGhhbmtzIGZvciB5b3VyIHJl
cGx5LiBJIHRyaWVkIHRoYXQgd2l0aAo+Pj4+Cj4+Pj4gY2F0IC9wcm9jL2Fzb3VuZC9jYXJkMC9j
b2RlYyMwCj4+Pj4KPj4+PiBidXQgdGhhdCBkb2Vzbid0IGhlbHAuIEknbSBkaWdnaW5nIG1lIHRo
cm91Z2ggdGhlIGtlcm5lbCBjb25maWcgcmlnaHQKPj4+PiBub3cuIE1heSBoYXZlIHRvIGNoYW5n
ZSBzb21ldGhpbmcgZWxzZS4KPj4+Pgo+Pj4+IEkgc2ltcGx5IGNvdWxkIGNyZWF0ZSBhIHBhdGNo
IG9uIG15IGdlbnRvbyBzeXN0ZW0gc3dpdGNoaW5nIGZyb20KPj4+PiBwYXRjaF9udmhkbWkgdG8g
cGF0Y2hfbnZoZG1pX2xlZ2FjeSBmb3IgZXZlcnkgbmV3IGtlcm5lbCwgYnV0IHRoYXQgd29uJ3QK
Pj4+PiB3b3JrIGZvcmV2ZXIuCj4+Pj4KPj4+PiBJZiB5b3UgaGF2ZSBvdGhlciB0aGlua3MgaSBj
b3VsZCB0cnkgaSdkIGFwcHJlY2lhdGUgdG8gaGVhciB0aGVtLgo+Pj4KPj4+IFlvdSBtYXkgdHJ5
IHRvIGRpc2FibGUgUE06Cj4+Pgo+Pj4gZWNobyBvbiA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAw
MDBcOjAxXDowMC4xL3Bvd2VyL2NvbnRyb2wKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBKYXJvc2xhdgo+Pj4KPj4+Cj4+Pj4KPj4+PiBraW5kIHJlZ2FyZHMKPj4+PiBN
YXJ0aW4KPj4+Pgo+Pj4+IE9uIDAyLjAyLjIwIDA5OjM3LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+
Pj4+IE9uIFNhdCwgMDEgRmViIDIwMjAgMTY6Mjg6MDggKzAxMDAsCj4+Pj4+IE1hcnRpbiBSZWdu
ZXIgd3JvdGU6Cj4+Pj4+PiBIaSB0aGVyZSwKPj4+Pj4+Cj4+Pj4+PiBzaW5jZSBpIHVwZGF0ZWQg
dG8ga2VybmVsIDUuNSBpIGhhdmUgbm8gc291bmQgb3ZlciBoZG1pIGFueW1vcmUKPj4+Pj4+IChH
ZUZvcmNlIFJUWAo+Pj4+Pj4gMjA3MCkuCj4+Pj4+Pgo+Pj4+Pj4gV2l0aCB0aGUgcHJldmlvdXMg
a2VybmVsIDUuNC4xNCBldmVyeXRoaW5nIGlzIGZpbmUuCj4+Pj4+Pgo+Pj4+Pj4gQWx0aG91Z2gg
aSBnb3Qgc291bmQgd2l0aCBzcGVha2VyLXRlc3QgLUQgaGRtaTpDQVJEPU5WaWRpYSxERVY9MiAt
Ywo+Pj4+Pj4gMiAtcgo+Pj4+Pj4gNDQxMDAsIHBhdnVjb250cm9sIHNob3dzIGFsbCBoZG1pIHNv
dW5kIGRldmljZXMgYXMgdW5wbHVnZ2VkLgo+Pj4+Pj4KPj4+Pj4+IEkgYmlzZWN0ZWQgaXQgZG93
biB0byB0aGlzIGNvbW1pdAo+Pj4+Pj4gKDUzOThlOTRmYjc1M2QwMjIzMDE4MjVlYmZhNWY3Y2Y4
YTY2MGQ4ZWIpCj4+Pj4+PiBhbmQgY2hhbmdlZCB0aGUgbGluZQo+Pj4+Pj4KPj4+Pj4+IEhEQV9D
T0RFQ19FTlRSWSgweDEwZGUwMDkzLCAiR1BVIDkzIEhETUkvRFAiLMKgIHBhdGNoX252aGRtaSkK
Pj4+Pj4+Cj4+Pj4+PiB0bwo+Pj4+Pj4KPj4+Pj4+IEhEQV9DT0RFQ19FTlRSWSgweDEwZGUwMDkz
LCAiR1BVIDkzIEhETUkvRFAiLCBwYXRjaF9udmhkbWlfbGVnYWN5KQo+Pj4+Pj4KPj4+Pj4+IE5v
dyBpdCdzIHdvcmtpbmcgYWdhaW4uIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSB3
aXRoCj4+Pj4+PiBwdWxzZWF1ZGlvIG9yCj4+Pj4+PiBpZiB0aGUgUlRYIDIwNzAgZG9lcyBub3Qg
c3VwcG9ydCB0aGUgbWVudGlvbmVkIGNvZGVjLgo+Pj4+PiBUaGUgcnVudGltZSBQTSB0dXJucyBv
ZmYgdGhlIGxpbmssIHNvIHRoZSBob3RwbHVnIG5vdGlmaWNhdGlvbiB3b24ndAo+Pj4+PiBiZSBk
ZWxpdmVyZWQgYXMgZGVmYXVsdC7CoCBQbGVhc2UgdHJ5IHJlYWRpbmcgdGhlIGNvcnJlc3BvbmRp
bmcgcHJvYwo+Pj4+PiBmaWxlLCAvcHJvYy9hc291bmQvY2FyZCovY29kZWMqIGZpbGUuwqAgVGhp
cyBtYXkgcG93ZXIgdXAgdGhlIGNvZGVjIGFuZAo+Pj4+PiB0cmlnZ2VyIHRoZSBob3RwbHVnIGRl
dGVjdGlvbiBpZiB0aGF0J3MgdGhlIGNhdXNlLgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUYWthc2hpCj4+
Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+Pj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKPj4+PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwKPj4+Pgo+Pj4KPj4+Cj4+Cj4gCj4gCj4gLS0gCj4gSmFyb3NsYXYg
S3lzZWxhIDxwZXJleEBwZXJleC5jej4KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFBy
b2plY3Q7IFJlZCBIYXQsIEluYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
