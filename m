Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6A14FFEC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 00:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44151168F;
	Mon,  3 Feb 2020 00:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44151168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580684534;
	bh=kr/0sIIIAVIRDTX8g+090uyy1P+Ta/s7rhJGYITz68M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwDRQB2IEp8vxy0hnh25OlWVbqxZqu7K05NUY3rsk6S8ScYuOitUbgeJE0AyADVcN
	 H7mp0+kh+kAgMwyu4pAYH8KQFP9jJ+g9TvOKbfEZ4OybB8Cka4WYrMrYHoBykh1Ugz
	 hDQdodVgaWTeQnSq4sJNrbN0WMcpaSNMEIyzxrJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF68F801DB;
	Mon,  3 Feb 2020 00:00:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F410AF80162; Mon,  3 Feb 2020 00:00:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E841BF8011D
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 00:00:20 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DE094A0040;
 Mon,  3 Feb 2020 00:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DE094A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1580684416; bh=A3kU8Wbi9W/f+Pye+x3VZK8ILFYXxj46C00GV86lxHA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VvSBbOIU6w408JtfhbWv2elrMD40DjosAf/rcIsKIPZn2xP37JPPLes9shLUWzQn0
 UrMRKqM7VX7iWc4ZJoNRw+jM9lpnQW1CcQICzP4uDZb8ACFgcq3y3T3AqtG7ETp/33
 CCA1mokVYpyzwYq11ufyKSD0Ub4lRrUBrM3mHLJk=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Feb 2020 00:00:10 +0100 (CET)
To: Martin Regner <martin@larkos.de>, Takashi Iwai <tiwai@suse.de>
References: <20191119084710.29267-5-nmahale@nvidia.com>
 <0b827293-cc8b-3c3e-9160-565037ff172b@larkos.de>
 <s5hmua18jvr.wl-tiwai@suse.de>
 <3a15996e-1b8f-b5f0-77da-2fcfa8334bcb@larkos.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cbf24d05-9bff-4aba-0f7a-601a949e98a5@perex.cz>
Date: Mon, 3 Feb 2020 00:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a15996e-1b8f-b5f0-77da-2fcfa8334bcb@larkos.de>
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

RG5lIDAyLiAwMi4gMjAgdiAxNToxOCBNYXJ0aW4gUmVnbmVyIG5hcHNhbChhKToKPiBIaSBUYWth
c2hpLAo+IAo+IHRoYW5rcyBmb3IgeW91ciByZXBseS4gSSB0cmllZCB0aGF0IHdpdGgKPiAKPiBj
YXQgL3Byb2MvYXNvdW5kL2NhcmQwL2NvZGVjIzAKPiAKPiBidXQgdGhhdCBkb2Vzbid0IGhlbHAu
IEknbSBkaWdnaW5nIG1lIHRocm91Z2ggdGhlIGtlcm5lbCBjb25maWcgcmlnaHQKPiBub3cuIE1h
eSBoYXZlIHRvIGNoYW5nZSBzb21ldGhpbmcgZWxzZS4KPiAKPiBJIHNpbXBseSBjb3VsZCBjcmVh
dGUgYSBwYXRjaCBvbiBteSBnZW50b28gc3lzdGVtIHN3aXRjaGluZyBmcm9tCj4gcGF0Y2hfbnZo
ZG1pIHRvIHBhdGNoX252aGRtaV9sZWdhY3kgZm9yIGV2ZXJ5IG5ldyBrZXJuZWwsIGJ1dCB0aGF0
IHdvbid0Cj4gd29yayBmb3JldmVyLgo+IAo+IElmIHlvdSBoYXZlIG90aGVyIHRoaW5rcyBpIGNv
dWxkIHRyeSBpJ2QgYXBwcmVjaWF0ZSB0byBoZWFyIHRoZW0uCgpZb3UgbWF5IHRyeSB0byBkaXNh
YmxlIFBNOgoKZWNobyBvbiA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAxXDowMC4xL3Bv
d2VyL2NvbnRyb2wKCgkJCQlKYXJvc2xhdgoKCj4gCj4ga2luZCByZWdhcmRzCj4gTWFydGluCj4g
Cj4gT24gMDIuMDIuMjAgMDk6MzcsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4gT24gU2F0LCAwMSBG
ZWIgMjAyMCAxNjoyODowOCArMDEwMCwKPj4gTWFydGluIFJlZ25lciB3cm90ZToKPj4+IEhpIHRo
ZXJlLAo+Pj4KPj4+IHNpbmNlIGkgdXBkYXRlZCB0byBrZXJuZWwgNS41IGkgaGF2ZSBubyBzb3Vu
ZCBvdmVyIGhkbWkgYW55bW9yZSAoR2VGb3JjZSBSVFgKPj4+IDIwNzApLgo+Pj4KPj4+IFdpdGgg
dGhlIHByZXZpb3VzIGtlcm5lbCA1LjQuMTQgZXZlcnl0aGluZyBpcyBmaW5lLgo+Pj4KPj4+IEFs
dGhvdWdoIGkgZ290IHNvdW5kIHdpdGggc3BlYWtlci10ZXN0IC1EIGhkbWk6Q0FSRD1OVmlkaWEs
REVWPTIgLWMgMiAtcgo+Pj4gNDQxMDAsIHBhdnVjb250cm9sIHNob3dzIGFsbCBoZG1pIHNvdW5k
IGRldmljZXMgYXMgdW5wbHVnZ2VkLgo+Pj4KPj4+IEkgYmlzZWN0ZWQgaXQgZG93biB0byB0aGlz
IGNvbW1pdCAoNTM5OGU5NGZiNzUzZDAyMjMwMTgyNWViZmE1ZjdjZjhhNjYwZDhlYikKPj4+IGFu
ZCBjaGFuZ2VkIHRoZSBsaW5lCj4+Pgo+Pj4gSERBX0NPREVDX0VOVFJZKDB4MTBkZTAwOTMsICJH
UFUgOTMgSERNSS9EUCIswqAgcGF0Y2hfbnZoZG1pKQo+Pj4KPj4+IHRvCj4+Pgo+Pj4gSERBX0NP
REVDX0VOVFJZKDB4MTBkZTAwOTMsICJHUFUgOTMgSERNSS9EUCIswqAgcGF0Y2hfbnZoZG1pX2xl
Z2FjeSkKPj4+Cj4+PiBOb3cgaXQncyB3b3JraW5nIGFnYWluLiBJJ20gbm90IHN1cmUgaWYgdGhp
cyBpcyBhIHByb2JsZW0gd2l0aCBwdWxzZWF1ZGlvIG9yCj4+PiBpZiB0aGUgUlRYIDIwNzAgZG9l
cyBub3Qgc3VwcG9ydCB0aGUgbWVudGlvbmVkIGNvZGVjLgo+PiBUaGUgcnVudGltZSBQTSB0dXJu
cyBvZmYgdGhlIGxpbmssIHNvIHRoZSBob3RwbHVnIG5vdGlmaWNhdGlvbiB3b24ndAo+PiBiZSBk
ZWxpdmVyZWQgYXMgZGVmYXVsdC4gIFBsZWFzZSB0cnkgcmVhZGluZyB0aGUgY29ycmVzcG9uZGlu
ZyBwcm9jCj4+IGZpbGUsIC9wcm9jL2Fzb3VuZC9jYXJkKi9jb2RlYyogZmlsZS4gIFRoaXMgbWF5
IHBvd2VyIHVwIHRoZSBjb2RlYyBhbmQKPj4gdHJpZ2dlciB0aGUgaG90cGx1ZyBkZXRlY3Rpb24g
aWYgdGhhdCdzIHRoZSBjYXVzZS4KPj4KPj4KPj4gVGFrYXNoaQo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKPiAKCgotLSAKSmFyb3Ns
YXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KTGludXggU291bmQgTWFpbnRhaW5lcjsgQUxTQSBQ
cm9qZWN0OyBSZWQgSGF0LCBJbmMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
