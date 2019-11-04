Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4FEE4B1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 17:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8C61727;
	Mon,  4 Nov 2019 17:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8C61727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572885148;
	bh=NbV0lu9EapCmQpeqrI8+z0hBYUI0rLnCxZT25y3pazk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvXKJQKIle62Tq9aYIFY6oGt8PoNSD2bB3XnvnalZ1VUQYJp40Q+p+vx7LvaR03U1
	 uWPOnLgiAdqZwjSRASbOHsRdfAdW5L/lo5cM+PWlfVGazuZ8sgr9+6SOX+/yhs1suh
	 g9P+3ETxNFAw7fgfIlRRG/fX4+2Z1nB8MrRWAlbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B4B8F80321;
	Mon,  4 Nov 2019 17:30:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E39F2F803F4; Mon,  4 Nov 2019 17:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFF47F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 17:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF47F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bLRmcQta"
Received: from localhost (host6-102.lan-isdn.imaginet.fr [195.68.6.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8D4420848;
 Mon,  4 Nov 2019 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572885036;
 bh=LAgGrLgKpPDH4JoKlSYbiJE2P0LnY+YWKSFwGFoyof4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLRmcQtayL0Ww8WXWF4NtrWd+fnrVdGADzIgSXa/r38+ParsPH7oMtF/EK/4dtV+G
 j6jnDur3TtCmoDLb3MrA1PjLeMEcONgnS1RR5lALo2HJC1ihUqNz6GpxiT/XUvn1uX
 doyvn5mudQR7Z4l2pSnYkvUAQ6G4sSJyaiNHP+Mo=
Date: Mon, 4 Nov 2019 17:30:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104163033.GB2253150@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Jaroslav Kysela <jkysela@redhat.com>, CKI Project <cki-project@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>
Subject: Re: [alsa-devel]
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5?=
 =?utf-8?q?=2E3=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTA6MjU6MjFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gT24gTW9uLCBOb3YgMDQs
IDIwMTkgYXQgMDk6Mjg6MTBBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+IAo+ID4g
PiAKPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+IE9uIE1vbiwgTm92
IDA0LCAyMDE5IGF0IDA4OjM1OjUxQU0gLTA1MDAsIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEhlbGxvLAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2Ug
cmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0
cmVlOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAgICAgIEtlcm5lbCByZXBvOgo+ID4gPiA+
ID4gPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgIENvbW1p
dDogZGZlMjgzZTlmZGFjIC0gTGludXggNS4zLjktcmMxCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93
Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNl
ZSBkZXRhaWxzIGJlbG93KQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgTWVyZ2U6IE9LCj4gPiA+
ID4gPiA+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIFRl
c3RzOiBGQUlMRUQKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMs
IGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IKPiA+ID4gPiA+ID4gZG93
bmxvYWQKPiA+ID4gPiA+ID4gaGVyZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICAgaHR0cHM6
Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiAgICAgeDg2XzY0Ogo+ID4gPiA+ID4gPiAgICAgIOKdjCBMVFAgbGl0ZQo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBOb3QgYSA1LjMgLXN0YWJsZSByZWdyZXNz
aW9uLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGYWlsdXJlIGNvbWVzIGZyb20gdGVzdCB0aGF0IHNh
bml0eSBjaGVja3MgYWxsIC9wcm9jIGZpbGVzIGJ5IGRvaW5nCj4gPiA+ID4gPiAxayByZWFkIGZy
b20gZWFjaC4gVGhlcmUgYXJlIGNvdXBsZSBpc3N1ZXMgaXQgaGl0cyB3cnQuIHNuZF9oZGFfKi4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gRXhhbXBsZSByZXByb2R1Y2VyOgo+ID4gPiA+ID4gICBkZCBp
Zj0vc3lzL2tlcm5lbC9kZWJ1Zy9yZWdtYXAvaGRhdWRpb0MwRDMtaGRhdWRpby9hY2Nlc3Mgb2Y9
b3V0LnR4dAo+ID4gPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZsYWc9bm9uYmxvY2sKPiA+ID4g
PiAKPiA+ID4gPiBUaGF0J3Mgbm90IGEgcHJvYyBmaWxlIDopCj4gPiA+IAo+ID4gPiBSaWdodC4g
SXQncyBzYW1lIHRlc3QgdGhhdCdzIHVzZWQgZm9yIC9wcm9jIHRvby4KPiA+ID4gCj4gPiA+ID4g
Cj4gPiA+ID4gPiBJdCdzIHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3VwcyBbMV0uIEFuZCBp
dCBhbHNvIHJlcXVpcmVzIGxvdAo+ID4gPiA+ID4gb2YgbWVtb3J5LCB0cmlnZ2VyaW5nIE9PTXMg
b24gc21hbGxlciBWTXM6Cj4gPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFh
MzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiA+IHBhZ2VzPTI2
MjE0NCB2bWFsbG9jIHZwYWdlcyBOMD0yNjIxNDQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSdtIGxl
YW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+
ID4gPiA+ID4gQ29tbWVudHMgYXJlIHdlbGNvbWVkLgo+ID4gPiA+IAo+ID4gPiA+IFJhbmRvbWx5
IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNoZXMg
YW5kCj4gPiA+ID4gbWFqb3IgcHJvYmxlbXMuICBBbHNvLCBkZWJ1Z2ZzIGZpbGVzIGFyZSBOT1Qg
c3RhYmxlIGFuZCBvbmx5IGZvcgo+ID4gPiA+IGRlYnVnZ2luZyBhbmQgc2hvdWxkIG5ldmVyIGJl
IGVuYWJsZWQgb24gInJlYWwiIHN5c3RlbXMuCj4gPiA+ID4gCj4gPiA+ID4gU28gd2hhdCBleGFj
dGx5IGlzIHRoZSB0ZXN0IHRyeWluZyB0byBkbyBoZXJlPwo+ID4gPiAKPiA+ID4gSXQncyAodW5w
cml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJv
YywgL3N5cykKPiA+ID4gdG8gc2VlIGlmIHRoYXQgdHJpZ2dlcnMgYW55dGhpbmcgYmFkLgo+ID4g
PiAKPiA+ID4gSXQgY2FuIHJ1biBhcyBwcml2aWxlZ2VkIHVzZXIgdG9vLCB3aGljaCB3YXMgdGhl
IGNhc2UgYWJvdmUuCj4gPiAKPiA+IFN1cmUsIHlvdSBjYW4gZG8gdG9ucyBvZiBiYWQgdGhpbmdz
IGFzIHJvb3QgcG9raW5nIGFyb3VuZCBpbiBzeXNmcywKPiA+IGRlYnVnZnMsIGFuZCBwcm9jZnMu
ICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8sIGJyZWFrIHRoZQo+ID4gc3lzdGVt
Pwo+IAo+IFdlIGFyZSB0YWxraW5nIGFib3V0IHJlYWQtb25seSBoZXJlLiBJcyBpdCB1bnJlYXNv
bmFibGUgdG8gZXhwZWN0Cj4gdGhhdCByb290IGNhbiByZWFkIGFsbCAvcHJvYyBlbnRyaWVzIHdp
dGhvdXQgY3Jhc2hpbmcgdGhlIHN5c3RlbT8KCllvdSBhcmUgTk9UIHJlYWRpbmcgL3Byb2MvIGhl
cmUuICBZb3UgYXJlIHJlYWRpbmcgZGVidWdmcyB3aGljaCB5b3UKcmVhbGx5IGhhdmUgTk9UIGlk
ZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBhcmUgcmVhZGluZyBmcm9tCmhh
cmR3YXJlIHRoYXQgaXMgc2xvdyBhbmQgZG9pbmcgb2RkIHRoaW5ncyB3aGVuIHlvdSByZWFkIGZy
b20gaXQuCgpBbmQgeWVzLCB0aGVyZSBhcmUgc29tZSAvcHJvYy8gZmlsZXMgdGhhdCB5b3Ugc2hv
dWxkIG5vdCByZWFkIGZyb20gYXMKcm9vdCBhbmQgZXhwZWN0IHRoaW5ncyB0byBhbHdheXMgd29y
ay4gIFBDSSBkZXZpY2VzIGFyZSBub3RvcmlvdXMgZm9yCnRoaXMsIGFuZCBpZiB5b3UgYXJlIHJl
YWRpbmcgdGhvc2UgZmlsZXMgYXMgcm9vdCwgeW91ICJrbm93IiB5b3Uga25vdwp3aGF0IHlvdSBh
cmUgZG9pbmcgYW5kIGNhbiBhY2NlcHQgdGhlIHJpc2sgZm9yIHdoZW4gdGhpbmdzIGdvIHdyb25n
LgoKSXQgaXMgZmluZSB0byB3cml0ZSB0ZXN0cyB0byByZWFkIHNwZWNpZmljIC9wcm9jLyBmaWxl
cyB0aGF0IHlvdSBrbm93CndoYXQgaXMgaGFwcGVuaW5nIGluIHRoZW0uICBUbyBwaWNrIHJhbmRv
bSBvbmVzIGlzIG5ldmVyIGEgZ29vZCBpZGVhLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
