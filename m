Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF100150206
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 08:39:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DDE168D;
	Mon,  3 Feb 2020 08:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DDE168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580715585;
	bh=Y6IG4hNFm7E4grLhmhQWiDkFlsJinHn60Aa7xTeEMYQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d11G8WnEHwx5x2894AxjEHpdK6XSFnPXtIiGNxHSKNAj+dJELbCgQ7DNRbQ2tw8Yz
	 8D/NrPuXF7YaMBYJR4r5w/hENUwXsKtY2hRxFfEw0h8UyFbTxlzq0BUmhsjoZCX+Te
	 zfIo/wdJJA4C6RItWBcureX7PX2zn3ky56U9go8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17228F8014C;
	Mon,  3 Feb 2020 08:38:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E889F80148; Mon,  3 Feb 2020 08:37:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E7BBF80051
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 08:37:54 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8ADDCA003F;
 Mon,  3 Feb 2020 08:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8ADDCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1580715471; bh=KMW02TmLmGCnQmxTzbix2q89cVI3wfxIMRxPe+L0DyM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ywYM9AuRSVdu80yVxeXm6LvN0v3zhmN+mPbEM2ulLkdMFIFp1eoJe5CpLvjhvCVwd
 huLCwPV4vl5QK60u4IwiJFiXW4BqXLtJhxAZM8tDH7c8avFEMRFdqKCFz7WpwBv6Sl
 wMyA7sZyvzeW/FXKLuVDpRsJSWZWNMaitpKCHfcM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Feb 2020 08:37:45 +0100 (CET)
To: Martin Regner <martin@larkos.de>, Takashi Iwai <tiwai@suse.de>
References: <20191119084710.29267-5-nmahale@nvidia.com>
 <0b827293-cc8b-3c3e-9160-565037ff172b@larkos.de>
 <s5hmua18jvr.wl-tiwai@suse.de>
 <3a15996e-1b8f-b5f0-77da-2fcfa8334bcb@larkos.de>
 <cbf24d05-9bff-4aba-0f7a-601a949e98a5@perex.cz>
 <1ba208d8-4a65-c7ab-283e-ba9850edd94f@larkos.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <dd1124fb-e3cd-3f8a-a231-f6a0597b4b51@perex.cz>
Date: Mon, 3 Feb 2020 08:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1ba208d8-4a65-c7ab-283e-ba9850edd94f@larkos.de>
Content-Language: en-US
Cc: nmahale@nvidia.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 aplattner@nvidia.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RG5lIDAzLiAwMi4gMjAgdiAwOjUwIE1hcnRpbiBSZWduZXIgbmFwc2FsKGEpOgo+IEhpIEphcm9z
bGF2LAo+IAo+IHRoYW5rcyBmb3IgdGhlIHRpcC4gSSB0cmllZCB0aGlzIChpbiBteSBjYXNlIGVj
aG8gb27CoCA+Cj4gL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDlcOjAwLjEvcG93ZXIvY29u
dHJvbCkgYnV0IHRoYXQgZGlkbid0IGhlbHAuCj4gCj4gSWYgaSBjb21tZW50IG91dCB0aGUgbGlu
ZQo+IAo+IHNwZWMtPmR5bl9wY21fYXNzaWduID0gdHJ1ZTsKPiAKPiBpbiBwYXRjaF9udmhkbWkg
c291bmQgaXMgd29ya2luZyBhZ2Fpbi4KCkNvdWxkIHlvdSBzaG93IHVzICh1cGxvYWQgaXQgdG8g
dGhlIGFsc2Egc2VydmVyIGFuZCBwb3N0IG9ubHkgVVJMcykgdGhlIG91dHB1dCAKZnJvbSBhbHNh
LWluZm8uc2ggZm9yIGJvdGggdmFyaWFudHMgKHNwZWMtPmR5bl9wY21fYXNzaWduID0gdHJ1ZSBh
bmQgZmFsc2UpID8KCgkJCQkJVGhhbmtzLAoJCQkJCQlKYXJvc2xhdgoKPiAKPiBDdXJpb3VzbHkg
bm9ib2R5IGVsc2Ugc2VlbXMgdG8gaGF2ZSB0aGlzIHByb2JsZW0uIFRoaXMgbWFrZXMgbWUgdGhp
bmsKPiB0aGUgcHJvYmxlbSBsaWVzIGVsc2V3aGVyZSBidXQgaSBoYXZlIG5vIG1vcmUgaWRlYXMg
YXQgdGhlIG1vbWVudC4KPiAKPiBPbiAwMy4wMi4yMCAwMDowMCwgSmFyb3NsYXYgS3lzZWxhIHdy
b3RlOgo+PiBEbmUgMDIuIDAyLiAyMCB2IDE1OjE4IE1hcnRpbiBSZWduZXIgbmFwc2FsKGEpOgo+
Pj4gSGkgVGFrYXNoaSwKPj4+Cj4+PiB0aGFua3MgZm9yIHlvdXIgcmVwbHkuIEkgdHJpZWQgdGhh
dCB3aXRoCj4+Pgo+Pj4gY2F0IC9wcm9jL2Fzb3VuZC9jYXJkMC9jb2RlYyMwCj4+Pgo+Pj4gYnV0
IHRoYXQgZG9lc24ndCBoZWxwLiBJJ20gZGlnZ2luZyBtZSB0aHJvdWdoIHRoZSBrZXJuZWwgY29u
ZmlnIHJpZ2h0Cj4+PiBub3cuIE1heSBoYXZlIHRvIGNoYW5nZSBzb21ldGhpbmcgZWxzZS4KPj4+
Cj4+PiBJIHNpbXBseSBjb3VsZCBjcmVhdGUgYSBwYXRjaCBvbiBteSBnZW50b28gc3lzdGVtIHN3
aXRjaGluZyBmcm9tCj4+PiBwYXRjaF9udmhkbWkgdG8gcGF0Y2hfbnZoZG1pX2xlZ2FjeSBmb3Ig
ZXZlcnkgbmV3IGtlcm5lbCwgYnV0IHRoYXQgd29uJ3QKPj4+IHdvcmsgZm9yZXZlci4KPj4+Cj4+
PiBJZiB5b3UgaGF2ZSBvdGhlciB0aGlua3MgaSBjb3VsZCB0cnkgaSdkIGFwcHJlY2lhdGUgdG8g
aGVhciB0aGVtLgo+Pgo+PiBZb3UgbWF5IHRyeSB0byBkaXNhYmxlIFBNOgo+Pgo+PiBlY2hvIG9u
ID4gL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDFcOjAwLjEvcG93ZXIvY29udHJvbAo+Pgo+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEphcm9zbGF2Cj4+Cj4+Cj4+Pgo+Pj4g
a2luZCByZWdhcmRzCj4+PiBNYXJ0aW4KPj4+Cj4+PiBPbiAwMi4wMi4yMCAwOTozNywgVGFrYXNo
aSBJd2FpIHdyb3RlOgo+Pj4+IE9uIFNhdCwgMDEgRmViIDIwMjAgMTY6Mjg6MDggKzAxMDAsCj4+
Pj4gTWFydGluIFJlZ25lciB3cm90ZToKPj4+Pj4gSGkgdGhlcmUsCj4+Pj4+Cj4+Pj4+IHNpbmNl
IGkgdXBkYXRlZCB0byBrZXJuZWwgNS41IGkgaGF2ZSBubyBzb3VuZCBvdmVyIGhkbWkgYW55bW9y
ZQo+Pj4+PiAoR2VGb3JjZSBSVFgKPj4+Pj4gMjA3MCkuCj4+Pj4+Cj4+Pj4+IFdpdGggdGhlIHBy
ZXZpb3VzIGtlcm5lbCA1LjQuMTQgZXZlcnl0aGluZyBpcyBmaW5lLgo+Pj4+Pgo+Pj4+PiBBbHRo
b3VnaCBpIGdvdCBzb3VuZCB3aXRoIHNwZWFrZXItdGVzdCAtRCBoZG1pOkNBUkQ9TlZpZGlhLERF
Vj0yIC1jCj4+Pj4+IDIgLXIKPj4+Pj4gNDQxMDAsIHBhdnVjb250cm9sIHNob3dzIGFsbCBoZG1p
IHNvdW5kIGRldmljZXMgYXMgdW5wbHVnZ2VkLgo+Pj4+Pgo+Pj4+PiBJIGJpc2VjdGVkIGl0IGRv
d24gdG8gdGhpcyBjb21taXQKPj4+Pj4gKDUzOThlOTRmYjc1M2QwMjIzMDE4MjVlYmZhNWY3Y2Y4
YTY2MGQ4ZWIpCj4+Pj4+IGFuZCBjaGFuZ2VkIHRoZSBsaW5lCj4+Pj4+Cj4+Pj4+IEhEQV9DT0RF
Q19FTlRSWSgweDEwZGUwMDkzLCAiR1BVIDkzIEhETUkvRFAiLMKgIHBhdGNoX252aGRtaSkKPj4+
Pj4KPj4+Pj4gdG8KPj4+Pj4KPj4+Pj4gSERBX0NPREVDX0VOVFJZKDB4MTBkZTAwOTMsICJHUFUg
OTMgSERNSS9EUCIsIHBhdGNoX252aGRtaV9sZWdhY3kpCj4+Pj4+Cj4+Pj4+IE5vdyBpdCdzIHdv
cmtpbmcgYWdhaW4uIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSB3aXRoCj4+Pj4+
IHB1bHNlYXVkaW8gb3IKPj4+Pj4gaWYgdGhlIFJUWCAyMDcwIGRvZXMgbm90IHN1cHBvcnQgdGhl
IG1lbnRpb25lZCBjb2RlYy4KPj4+PiBUaGUgcnVudGltZSBQTSB0dXJucyBvZmYgdGhlIGxpbmss
IHNvIHRoZSBob3RwbHVnIG5vdGlmaWNhdGlvbiB3b24ndAo+Pj4+IGJlIGRlbGl2ZXJlZCBhcyBk
ZWZhdWx0LsKgIFBsZWFzZSB0cnkgcmVhZGluZyB0aGUgY29ycmVzcG9uZGluZyBwcm9jCj4+Pj4g
ZmlsZSwgL3Byb2MvYXNvdW5kL2NhcmQqL2NvZGVjKiBmaWxlLsKgIFRoaXMgbWF5IHBvd2VyIHVw
IHRoZSBjb2RlYyBhbmQKPj4+PiB0cmlnZ2VyIHRoZSBob3RwbHVnIGRldGVjdGlvbiBpZiB0aGF0
J3MgdGhlIGNhdXNlLgo+Pj4+Cj4+Pj4KPj4+PiBUYWthc2hpCj4+Pgo+Pj4KPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdAo+Pj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4+PiBodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPj4+Cj4+
Cj4+Cj4gCgoKLS0gCkphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+CkxpbnV4IFNvdW5k
IE1haW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5jLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
