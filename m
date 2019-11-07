Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F1F2D70
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 12:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD4D169B;
	Thu,  7 Nov 2019 12:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD4D169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573126121;
	bh=kIO3TYfrz2S5m7YocpmuOup3h/a9M8WX+gISFl4tJ3w=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hf3CQabqqfbJw4D+1I4etCfPWh9d8bY7ythu6sIYWefS+nXkdLlzQ5/bOY84FkjkY
	 UexE9dvlsK8cJOAlVm2U40ew7/4tT+u2sSa1NI4sg8Pw2KABpf+iWidYpOxoqOoBqg
	 hcBtlduNVbXauwqZ3mnf0Ym43Cl/czkoHj0K0ctU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189BBF80636;
	Thu,  7 Nov 2019 12:24:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E485F8049B; Thu,  7 Nov 2019 12:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39396F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 12:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39396F800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D259B3F3;
 Thu,  7 Nov 2019 11:05:51 +0000 (UTC)
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
 <20191104163033.GB2253150@kroah.com>
 <1766459302.10389172.1572886973921.JavaMail.zimbra@redhat.com>
 <20191104203239.GA2293927@kroah.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20191104203239.GA2293927@kroah.com>
Date: Thu, 07 Nov 2019 12:05:51 +0100
Message-ID: <87k18cdjzk.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Nov 2019 12:24:22 +0100
Cc: alsa-devel@alsa-project.org, Memory Management <mm-qe@redhat.com>,
 Jaroslav Kysela <jkysela@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, Jan Stancek <jstancek@redhat.com>
Subject: Re: [alsa-devel]
 =?utf-8?b?W0xUUF0g4p2MIEZBSUw6IFRlc3QgcmVwb3J0IGZv?=
 =?utf-8?q?r_kernel_5=2E3=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CkdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cml0ZXM6Cgo+IE9uIE1vbiwg
Tm92IDA0LCAyMDE5IGF0IDEyOjAyOjUzUE0gLTA1MDAsIEphbiBTdGFuY2VrIHdyb3RlOgo+Pgo+
PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+ID4gT24gTW9uLCBOb3YgMDQsIDIwMTkg
YXQgMTA6MjU6MjFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4+ID4gPgo+PiA+ID4gLS0t
LS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+PiA+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBh
dCAwOToyODoxMEFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPj4gPiA+ID4gPgo+PiA+ID4g
PiA+Cj4+ID4gPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+PiA+ID4gPiA+ID4g
T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+IC0tLS0tIE9y
aWdpbmFsIE1lc3NhZ2UgLS0tLS0KPj4gPiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gPiA+IEhl
bGxvLAo+PiA+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+ID4gV2UgcmFuIGF1dG9tYXRlZCB0
ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+PiA+ID4gPiA+
ID4gPiA+Cj4+ID4gPiA+ID4gPiA+ID4gICAgICAgIEtlcm5lbCByZXBvOgo+PiA+ID4gPiA+ID4g
PiA+ICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICBD
b21taXQ6IGRmZTI4M2U5ZmRhYyAtIExpbnV4IDUuMy45LXJjMQo+PiA+ID4gPiA+ID4gPiA+Cj4+
ID4gPiA+ID4gPiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBw
cm92aWRlZCBiZWxvdy4KPj4gPiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gPiA+ICAgICBPdmVy
YWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPj4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgTWVyZ2U6IE9LCj4+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICBDb21waWxl
OiBPSwo+PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4+ID4gPiA+
ID4gPiA+ID4KPj4gPiA+ID4gPiA+ID4gPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmls
ZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yCj4+ID4gPiA+ID4gPiA+ID4gZG93bmxvYWQK
Pj4gPiA+ID4gPiA+ID4gPiBoZXJlOgo+PiA+ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+ID4g
ICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzI2MjM4MAo+PiA+
ID4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiA+ID4gT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZh
aWxlZDoKPj4gPiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gPiA+ICAgICB4ODZfNjQ6Cj4+ID4g
PiA+ID4gPiA+ID4gICAgICDinYwgTFRQIGxpdGUKPj4gPiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+
ID4gPgo+PiA+ID4gPiA+ID4gPiBOb3QgYSA1LjMgLXN0YWJsZSByZWdyZXNzaW9uLgo+PiA+ID4g
PiA+ID4gPgo+PiA+ID4gPiA+ID4gPiBGYWlsdXJlIGNvbWVzIGZyb20gdGVzdCB0aGF0IHNhbml0
eSBjaGVja3MgYWxsIC9wcm9jIGZpbGVzIGJ5IGRvaW5nCj4+ID4gPiA+ID4gPiA+IDFrIHJlYWQg
ZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25kX2hkYV8q
Lgo+PiA+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4+ID4g
PiA+ID4gPiA+ICAgZGQgaWY9L3N5cy9rZXJuZWwvZGVidWcvcmVnbWFwL2hkYXVkaW9DMEQzLWhk
YXVkaW8vYWNjZXNzCj4+ID4gPiA+ID4gPiA+ICAgb2Y9b3V0LnR4dAo+PiA+ID4gPiA+ID4gPiAg
IGNvdW50PTEgYnM9MTAyNCBpZmxhZz1ub25ibG9jawo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+
IFRoYXQncyBub3QgYSBwcm9jIGZpbGUgOikKPj4gPiA+ID4gPgo+PiA+ID4gPiA+IFJpZ2h0LiBJ
dCdzIHNhbWUgdGVzdCB0aGF0J3MgdXNlZCBmb3IgL3Byb2MgdG9vLgo+PiA+ID4gPiA+Cj4+ID4g
PiA+ID4gPgo+PiA+ID4gPiA+ID4gPiBJdCdzIHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3Vw
cyBbMV0uIEFuZCBpdCBhbHNvIHJlcXVpcmVzIGxvdAo+PiA+ID4gPiA+ID4gPiBvZiBtZW1vcnks
IHRyaWdnZXJpbmcgT09NcyBvbiBzbWFsbGVyIFZNczoKPj4gPiA+ID4gPiA+ID4gMHgwMDAwMDAw
MDI0ZjA0MzdiLTB4MDAwMDAwMDAxYTMyYjFjOCAxMDczNzQ1OTIwCj4+ID4gPiA+ID4gPiA+IHNl
cV9yZWFkKzB4MTMxLzB4NDAwCj4+ID4gPiA+ID4gPiA+IHBhZ2VzPTI2MjE0NCB2bWFsbG9jIHZw
YWdlcyBOMD0yNjIxNDQKPj4gPiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+ID4gSSdtIGxlYW5pbmcg
dG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+PiA+ID4g
PiA+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4g
UmFuZG9tbHkgcG9raW5nIGFyb3VuZCBpbiBkZWJ1Z2ZzIGlzIGEgc3VyZSB3YXkgdG8gY2F1c2Ug
Y3Jhc2hlcyBhbmQKPj4gPiA+ID4gPiA+IG1ham9yIHByb2JsZW1zLiAgQWxzbywgZGVidWdmcyBm
aWxlcyBhcmUgTk9UIHN0YWJsZSBhbmQgb25seSBmb3IKPj4gPiA+ID4gPiA+IGRlYnVnZ2luZyBh
bmQgc2hvdWxkIG5ldmVyIGJlIGVuYWJsZWQgb24gInJlYWwiIHN5c3RlbXMuCj4+ID4gPiA+ID4g
Pgo+PiA+ID4gPiA+ID4gU28gd2hhdCBleGFjdGx5IGlzIHRoZSB0ZXN0IHRyeWluZyB0byBkbyBo
ZXJlPwo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWlu
ZyB0byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJvYywKPj4gPiA+ID4gPiAvc3lzKQo+
PiA+ID4gPiA+IHRvIHNlZSBpZiB0aGF0IHRyaWdnZXJzIGFueXRoaW5nIGJhZC4KPj4gPiA+ID4g
Pgo+PiA+ID4gPiA+IEl0IGNhbiBydW4gYXMgcHJpdmlsZWdlZCB1c2VyIHRvbywgd2hpY2ggd2Fz
IHRoZSBjYXNlIGFib3ZlLgo+PiA+ID4gPgo+PiA+ID4gPiBTdXJlLCB5b3UgY2FuIGRvIHRvbnMg
b2YgYmFkIHRoaW5ncyBhcyByb290IHBva2luZyBhcm91bmQgaW4gc3lzZnMsCj4+ID4gPiA+IGRl
YnVnZnMsIGFuZCBwcm9jZnMuICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8sIGJy
ZWFrIHRoZQo+PiA+ID4gPiBzeXN0ZW0/Cj4+ID4gPgo+PiA+ID4gV2UgYXJlIHRhbGtpbmcgYWJv
dXQgcmVhZC1vbmx5IGhlcmUuIElzIGl0IHVucmVhc29uYWJsZSB0byBleHBlY3QKPj4gPiA+IHRo
YXQgcm9vdCBjYW4gcmVhZCBhbGwgL3Byb2MgZW50cmllcyB3aXRob3V0IGNyYXNoaW5nIHRoZSBz
eXN0ZW0/Cj4+ID4KPj4gPiBZb3UgYXJlIE5PVCByZWFkaW5nIC9wcm9jLyBoZXJlLgo+Pgo+PiBO
by4gVGhhdCB3YXMgYSBnZW5lcmFsIHF1ZXN0aW9uIHRvIHVzZWZ1bG5lc3Mgb2YgcHJpdmlsZWdl
ZCByZWFkLAo+PiB1c2luZyAvcHJvYyBhcyBleGFtcGxlIHdoZXJlIGl0IGNvbW1vbmx5IGhhcHBl
bnMuCj4+Cj4+ID4gWW91IGFyZSByZWFkaW5nIGRlYnVnZnMgd2hpY2ggeW91Cj4+ID4gcmVhbGx5
IGhhdmUgTk9UIGlkZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBhcmUgcmVh
ZGluZyBmcm9tCj4+ID4gaGFyZHdhcmUgdGhhdCBpcyBzbG93IGFuZCBkb2luZyBvZGQgdGhpbmdz
IHdoZW4geW91IHJlYWQgZnJvbSBpdC4KPj4KPj4gQWdyZWVkLCBJIGFscmVhZHkgc2VudCBhIHBh
dGNoIHRvIExUUCB0byBibGFja2xpc3QgaXQuCj4KPiBIb3BlZnVsbHkgeW91IGFyZSBibGFja2xp
c3RpbmcgYWxsIG9mIGRlYnVnZnMuICBhbmQgc3lzZnMuICBBbmQgcHJvY2ZzLgo+IEFkZGluZyBz
cGVjaWZpYyBmaWxlcyBiYWNrIGlzIGZpbmUsIGFzIGxvbmcgYXMgeW91ICJrbm93IiB0aGV5IGFy
ZSBvawo+IGFuZCB5b3UgYXJlIGFjdHVhbGx5IHRlc3Rpbmcgc29tZXRoaW5nIHZhbGlkIHRoZXJl
Lgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKClRCSCwgbW9zdCBvZiB0aGUgdmFsdWUgb2YgdGhp
cyB0ZXN0IGNvbWVzIGZyb20gYmVpbmcgZHVtYiBhbmQgZG9pbmcKdGhpbmdzIG5vYm9keSB0aG91
Z2h0IHRvIGRvIGJlY2F1c2UgaXQgd291bGQgYmUgc3R1cGlkLiBJdCdzIGFuIGFjY2lkZW50CnRo
YXQgdGhlIHRlc3QgZXhpc3RzIGluIHRoZSBmaXJzdCBwbGFjZSBiZWNhdXNlIEkgZm91bmQgc29t
ZSBidWdzIGluCm9sZGVyIGtlcm5lbHMgbmFpdmVseSB0cnlpbmcgdG8gZHVtcCB0aGUgY29udGVu
dHMgb2YgL3N5cy4KCkl0IGlzIHVzZWZ1bCB0byBvY2Nhc2lvbmFsbHkgcnVuIHRoaXMgdGVzdCBh
cyByb290IGluIGEgVk0gd2hlcmUgaXQKY2FuJ3QgZG8gYW55IGhhcm0sIGV2ZW4gb24gZGVidWdm
cyBhbmQgZGV2LiBXZSBoYXZlIGRldGVjdGVkIG1pc3NpbmcKcGF0Y2hlcyBkb2luZyB0aGluZ3Mg
bGlrZSB0aGF0IHdoaWNoIHdvdWxkIHByb2JhYmx5IGJlIHN0b3BwZWQgYnkgYSBzYW5lCndoaXRl
bGlzdC4KCkhvd2V2ZXIgSSB3b3VsZCBhZ3JlZSB0aGF0IHRoaXMgY3JlYXRlcyB0b28gbXVjaCBu
b2lzZSBmb3IgYSBDSSB1bmRlcgpub3JtYWwgY2lyY3Vtc3RhbmNlcy4gV2UgY291bGQgbWF5YmUg
YWRkIHNvbWUgbWV0YS1kYXRhIHRvIHRoZSB0ZXN0CnNheWluZyBpdCB3aWxsIGNyZWF0ZSBub2lz
ZSBhbmQgZnJlZXplIHRoZSBTVVQgYW5kIGluIHRoZSBmdXR1cmUgdXNlcnMKY2FuIHNwZWNpZnkg
d2hhdCBsZXZlbCBvZiBub2lzZSB0aGV5IGFyZSBwcmVwYXJlZCB0byBhY2NlcHQgd2hlbgpleGVj
dXRpbmcgdGhlIExUUC4KCkluIHRoZSBtZWFudGltZSwgSU1PLCB3ZSBjYW4ganVzdCBmb3JjZSB0
aGUgdGVzdCB0byBzd2l0Y2ggdG8gbm9ib2R5IGJ5CmRlZmF1bHQgd2hpY2ggaXQgYWxyZWFkeSBk
b2VzIHdoZW4gcmVhZGluZyAvZGV2LgoKLS0KVGhhbmsgeW91LApSaWNoYXJkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
