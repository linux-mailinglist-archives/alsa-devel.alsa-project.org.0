Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF4146B05
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 15:19:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234591698;
	Thu, 23 Jan 2020 15:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234591698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579789172;
	bh=GSCXPrlWUZaHY9C5TDW45F5zrR9fRO20BS4OeY/1Gvg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kB99ajldIRzQtUo7dS9MHqtO1rDROfRlWume7WAsih0G7vWmheNM+uHqYapYvJlYs
	 VD6yDPR1L8q07rgJS8jIopmTzNf7jWPT5l6P10LZ7u62jbeN++8XqIbUG/bhI/GK8o
	 L/uJGSKobSccYKW7R9nEIjKZ8fCb1R25PSSexZkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A365F801ED;
	Thu, 23 Jan 2020 15:17:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8D3F801D9; Thu, 23 Jan 2020 15:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 472BDF800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 15:17:42 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5387CA0048;
 Thu, 23 Jan 2020 15:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5387CA0048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1579789062; bh=v/tyiAv0ajPU97UHyCAKHwzudD+TMUke4Pfdas4c/vY=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=4CpZOqTJC4L8uY/VDeOqvH4GPpmYKWd5JFckgSi71QHzmkBsNguaamBYTaCw2MXHr
 EpSHYZGWcAZ7usVNC5xz6LRy/NfGAUdMLz/eoRykieD8Ulhy4H3AYVQrGE9sppulEO
 8fM3jRcKNN8yeijMX2yY8tRFB/y1pBbxTKcKMmpw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 23 Jan 2020 15:17:39 +0100 (CET)
To: alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e45892ff-d142-33ef-ee3c-1ce2cc64a0ce@perex.cz>
Date: Thu, 23 Jan 2020 15:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
Content-Language: en-US
Cc: Michal Feix <michal@feix.family>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] ASUS T100TAM UCM
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

RG5lIDIzLiAwMS4gMjAgdiAxNToxMCBNaWNoYWwgRmVpeCBuYXBzYWwoYSk6Cj4+IE9uIDEvMjMv
MjAgNjo0OSBBTSwgTWljaGFsIEZlaXggd3JvdGU6Cj4+PiBIZWxsbywKPj4+Cj4+PiB0aGVyZSBp
cyBubyBzb3VuZCB3b3JraW5nIHZpYSBzcGVha2VycyBvciBoZWFkcGhvbmVzIGphY2sgb24gQXN1
cyBUMTAwVEFNLiBTb3VuZCB3b3JrcyBjb3JyZWN0bHkgdmlhIEhETUkgb3IgQmx1ZXRvb3RoIGhl
YWRwaG9uZXMuIFRoZSBjaGlwIG9uIHRoaXMgQmF5dHJhaWwgbWFjaGluZSBpcyBjb3JyZWN0bHkg
cmVjb2duaXplZCBhcyBieXRjcl9ydDU2NDAuIMKgRnJvbSBkbWVzZzoKPj4+Cj4+PiBieXRjcl9y
dDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayBETUlDMV9NQVAgZW5hYmxlZAo+Pj4gYnl0Y3JfcnQ1
NjQwIGJ5dGNyX3J0NTY0MDogcXVpcmsgcmVhbHRlayxqYWNrLWRldGVjdC1zb3VyY2UgMwo+Pj4g
Ynl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogcXVpcmsgcmVhbHRlayxvdmVyLWN1cnJlbnQtdGhy
ZXNob2xkLW1pY3JvYW1wIDIwMDAKPj4+IGJ5dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHF1aXJr
IHJlYWx0ZWssb3Zlci1jdXJyZW50LXNjYWxlLWZhY3RvciAxCj4+PiBieXRjcl9ydDU2NDAgYnl0
Y3JfcnQ1NjQwOiBxdWlyayBNQ0xLX0VOIGVuYWJsZWQKPj4+IGJ5dGNyX3J0NTY0MCBieXRjcl9y
dDU2NDA6IHNuZC1zb2MtZHVtbXktZGFpIDwtPiBtZWRpYS1jcHUtZGFpIG1hcHBpbmcgb2sKPj4+
IGJ5dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHNuZC1zb2MtZHVtbXktZGFpIDwtPiBkZWVwYnVm
ZmVyLWNwdS1kYWkgbWFwcGluZyBvawo+Pj4gYnl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogcnQ1
NjQwLWFpZjEgPC0+IHNzcDItcG9ydCBtYXBwaW5nIG9rCj4+PiBpbnB1dDogYnl0Y3ItcnQ1NjQw
IEhlYWRzZXQgYXMgL2RldmljZXMvcGxhdGZvcm0vODA4NjBGMjg6MDAvYnl0Y3JfcnQ1NjQwL3Nv
dW5kL2NhcmQwL2lucHV0MTcKPj4+Cj4+PiBBZnRlciBib290dXAsIGtlcm5lbCBsb2cgaXMgZmls
bGVkIHdpdGg6ICJCYXl0cmFpbCBBdWRpbyBQb3J0OiBBU29DOiBubyBiYWNrZW5kIERBSXMgZW5h
YmxlZCBmb3IgQmF5dHJhaWwgQXVkaW8gUG9ydCIgbWVzc2FnZXMuIEkgZG8gdW5kZXJzdGFuZCB0
aGlzIGlzIGR1ZSB0byB0aGUgbWlzc2luZyBVQ00gcHJvZmlsZSBmb3IgdGhlIG1hY2hpbmUuCj4+
Cj4+IHdoYXQgZG8geW91IG1lYW4gd2l0aCAnbWlzc2luZyBVQ00gcHJvZmlsZSc/IEl0J3MgYmVl
biBhdmFpbGFibGUgZm9yIG1hbnkgbW9vbnMsIGFuZCB3ZSB3b3JrZWQgd2l0aCBKYXJvc2xhdi9I
YW5zIHRvIHVwZGF0ZSBmb3IgVUNNdjIuCj4+Cj4+IFlvdSBzaG91bGQgYmUgYWJsZSB0byB1c2Ug
YWxzYS11Y20gYW5kIGNvbmZpZ3VyZSB0aGluZ3MgbWFudWFsbHksIGUuZy4KPj4KPj4gYWxzYXVj
bSAtYyBieXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgSGVhZHBob25lcwo+
Pgo+PiBhbHNhdWNtIC1jIGJ5dGNyLXJ0NTY0MCBzZXQgX3ZlcmIgSGlGaSBzZXQgX2VuYWRldiBT
cGVha2VyCj4+Cj4gCj4gVGhhbmtzIFBpZXJyZS4gSSdtIGF3YXJlIG9mIHRoZSB3b3JrIGRvbmUg
cHJldmlvdXNseSBvbiBBc3VzIFQxMDAuIE5vdCBzdXJlLCBpZiBBc3VzIFQxMDBUQU0gaXMgYW55
IHNpZ25pZmljYW50bHkgZGlmZmVyZW50LiBKdXN0IHRyaWVkIHlvdXIgc3VnZ2VzdGVkIGNvbW1h
bmRzIGFzIHJvb3QgdXNlcjoKPiAKPiAjIGFsc2F1Y20gLWMgYnl0Y3ItcnQ1NjQwIHNldCBfdmVy
YiBIaUZpIHNldCBfZW5hZGV2IEhlYWRwaG9uZXMKPiBBTFNBIGxpYiB1Y21fc3Vicy5jOjIxNToo
dWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1ZSkgdmFyaWFibGUgJyR7Q2FyZENvbXBvbmVudHN9
JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNvbnRleHQhCj4gQUxTQSBsaWIgbWFpbi5jOjk2MDoo
c25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJvcjogZmFpbGVkIHRvIGltcG9ydCBieXRjci1ydDU2
NDAgdXNlIGNhc2UgY29uZmlndXJhdGlvbiAtMjIKPiBhbHNhdWNtOiBlcnJvciBmYWlsZWQgdG8g
b3BlbiBzb3VuZCBjYXJkIGJ5dGNyLXJ0NTY0MDogSW52YWxpZCBhcmd1bWVudAo+IAo+ICMgYWxz
YXVjbSAtYyBieXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+
IEFMU0EgbGliIHVjbV9zdWJzLmM6MjE1Oih1Y19tZ3JfZ2V0X3N1YnN0aXR1dGVkX3ZhbHVlKSB2
YXJpYWJsZSAnJHtDYXJkQ29tcG9uZW50c30nIGlzIG5vdCBkZWZpbmVkIGluIHRoaXMgY29udGV4
dCEKPiBBTFNBIGxpYiBtYWluLmM6OTYwOihzbmRfdXNlX2Nhc2VfbWdyX29wZW4pIGVycm9yOiBm
YWlsZWQgdG8gaW1wb3J0IGJ5dGNyLXJ0NTY0MCB1c2UgY2FzZSBjb25maWd1cmF0aW9uIC0yMgo+
IGFsc2F1Y206IGVycm9yIGZhaWxlZCB0byBvcGVuIHNvdW5kIGNhcmQgYnl0Y3ItcnQ1NjQwOiBJ
bnZhbGlkIGFyZ3VtZW50CgpUcnkgdGhpczoKCmFsc2F1Y20gLWMgaHc6MCBzZXQgX3ZlcmIgSGlG
aSBzZXQgX2VuYWRldiBTcGVha2VyCgoJCQkJVGhhbmsgeW91LAoJCQkJCUphcm9zbGF2CgotLSAK
SmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KTGludXggU291bmQgTWFpbnRhaW5lcjsg
QUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
