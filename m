Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08EEE686
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 18:47:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075031729;
	Mon,  4 Nov 2019 18:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075031729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572889670;
	bh=KmZxLDrvM4L97DYASVGPkBH+sWrXyFPLdlV1FpJRRfI=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRM2x4uPhDrtqrjbN1/XutHMyrG8oBV9p85bZ9RC2+5GDLa3DLsB4CBrVmIbOG5T7
	 aX9jfjklPNK9xOLBZfd9LgtTx9Fbr+X02cqnqd/Ua0Om60pZC2vPdvAfvqWtsMDWxh
	 FjJcAbTmRKz4aNHMWPeeASul0wQI2NvxZT6gOoIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 047AEF800F3;
	Mon,  4 Nov 2019 18:44:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B765EF803F4; Mon,  4 Nov 2019 18:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA7CAF800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 18:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA7CAF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PYwTMf/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572886985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYvQdBFtAql7wjQ/NHJHVT6A7DR8AMu7gQlsuOtUl1w=;
 b=PYwTMf/zxTIlKcbSjdb2ylICtCGDHn715hKngU1phBSvFC39kyzbLtLFKPy6tk+2m0Ffj5
 hm1lI4/sp2n+1hlq3y95R0CCvfuADZE/JH8bG5Yx4q92ZQyg4cZ1eCNGyS4K013v9SOfpz
 6OjAbBQGIwU/MC3jY+IfR2M+omRA+qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-3544PBzdMfCfkWwvvI8HNw-1; Mon, 04 Nov 2019 12:02:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF22E107ACC2;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E131A600C6;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 224BF18095FF;
 Mon,  4 Nov 2019 17:02:54 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:02:53 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1766459302.10389172.1572886973921.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104163033.GB2253150@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
 <20191104163033.GB2253150@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.19]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: efHF9Qv+rDzWei/mHs7JnJR0U0OTsg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3544PBzdMfCfkWwvvI8HNw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Mon, 04 Nov 2019 18:44:18 +0100
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAx
MDoyNToyMUFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+IAo+ID4gLS0tLS0gT3JpZ2lu
YWwgTWVzc2FnZSAtLS0tLQo+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAwOToyODoxMEFN
IC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiAtLS0t
LSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4gPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBh
dCAwODozNTo1MUFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
V2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5l
bCB0cmVlOgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoK
PiA+ID4gPiA+ID4gPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJl
IHByb3ZpZGVkIGJlbG93Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICBPdmVyYWxs
IHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgTWVyZ2U6IE9LCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUg
YXZhaWxhYmxlIGZvcgo+ID4gPiA+ID4gPiA+IGRvd25sb2FkCj4gPiA+ID4gPiA+ID4gaGVyZToK
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAgIGh0dHBzOi8vYXJ0aWZhY3RzLmNraS1wcm9q
ZWN0Lm9yZy9waXBlbGluZXMvMjYyMzgwCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT25l
IG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiAgICAgeDg2XzY0Ogo+ID4gPiA+ID4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE5vdCBhIDUuMyAtc3RhYmxlIHJlZ3Jlc3Npb24u
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBGYWlsdXJlIGNvbWVzIGZyb20gdGVzdCB0aGF0IHNh
bml0eSBjaGVja3MgYWxsIC9wcm9jIGZpbGVzIGJ5IGRvaW5nCj4gPiA+ID4gPiA+IDFrIHJlYWQg
ZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25kX2hkYV8q
Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gRXhhbXBsZSByZXByb2R1Y2VyOgo+ID4gPiA+ID4g
PiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9oZGF1ZGlvQzBEMy1oZGF1ZGlvL2Fj
Y2Vzcwo+ID4gPiA+ID4gPiAgIG9mPW91dC50eHQKPiA+ID4gPiA+ID4gICBjb3VudD0xIGJzPTEw
MjQgaWZsYWc9bm9uYmxvY2sKPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhdCdzIG5vdCBhIHByb2Mg
ZmlsZSA6KQo+ID4gPiA+IAo+ID4gPiA+IFJpZ2h0LiBJdCdzIHNhbWUgdGVzdCB0aGF0J3MgdXNl
ZCBmb3IgL3Byb2MgdG9vLgo+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEl0J3Mgc2xv
dyBhbmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVxdWlyZXMgbG90
Cj4gPiA+ID4gPiA+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIgVk1zOgo+
ID4gPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFhMzJiMWM4IDEwNzM3NDU5
MjAKPiA+ID4gPiA+ID4gc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiA+ID4gcGFnZXM9MjYy
MTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0NAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSdt
IGxlYW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0
Lgo+ID4gPiA+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFJhbmRvbWx5IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNl
IGNyYXNoZXMgYW5kCj4gPiA+ID4gPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmls
ZXMgYXJlIE5PVCBzdGFibGUgYW5kIG9ubHkgZm9yCj4gPiA+ID4gPiBkZWJ1Z2dpbmcgYW5kIHNo
b3VsZCBuZXZlciBiZSBlbmFibGVkIG9uICJyZWFsIiBzeXN0ZW1zLgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRlc3QgdHJ5aW5nIHRvIGRvIGhlcmU/Cj4gPiA+
ID4gCj4gPiA+ID4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0byBvcGVuL3JlYWQg
YW55dGhpbmcgaXQgY2FuICgvcHJvYywKPiA+ID4gPiAvc3lzKQo+ID4gPiA+IHRvIHNlZSBpZiB0
aGF0IHRyaWdnZXJzIGFueXRoaW5nIGJhZC4KPiA+ID4gPiAKPiA+ID4gPiBJdCBjYW4gcnVuIGFz
IHByaXZpbGVnZWQgdXNlciB0b28sIHdoaWNoIHdhcyB0aGUgY2FzZSBhYm92ZS4KPiA+ID4gCj4g
PiA+IFN1cmUsIHlvdSBjYW4gZG8gdG9ucyBvZiBiYWQgdGhpbmdzIGFzIHJvb3QgcG9raW5nIGFy
b3VuZCBpbiBzeXNmcywKPiA+ID4gZGVidWdmcywgYW5kIHByb2Nmcy4gIFdoYXQgZXhhY3RseSBh
cmUgeW91IHRyeWluZyB0byBkbywgYnJlYWsgdGhlCj4gPiA+IHN5c3RlbT8KPiA+IAo+ID4gV2Ug
YXJlIHRhbGtpbmcgYWJvdXQgcmVhZC1vbmx5IGhlcmUuIElzIGl0IHVucmVhc29uYWJsZSB0byBl
eHBlY3QKPiA+IHRoYXQgcm9vdCBjYW4gcmVhZCBhbGwgL3Byb2MgZW50cmllcyB3aXRob3V0IGNy
YXNoaW5nIHRoZSBzeXN0ZW0/Cj4gCj4gWW91IGFyZSBOT1QgcmVhZGluZyAvcHJvYy8gaGVyZS4K
Ck5vLiBUaGF0IHdhcyBhIGdlbmVyYWwgcXVlc3Rpb24gdG8gdXNlZnVsbmVzcyBvZiBwcml2aWxl
Z2VkIHJlYWQsCnVzaW5nIC9wcm9jIGFzIGV4YW1wbGUgd2hlcmUgaXQgY29tbW9ubHkgaGFwcGVu
cy4KCj4gWW91IGFyZSByZWFkaW5nIGRlYnVnZnMgd2hpY2ggeW91Cj4gcmVhbGx5IGhhdmUgTk9U
IGlkZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBhcmUgcmVhZGluZyBmcm9t
Cj4gaGFyZHdhcmUgdGhhdCBpcyBzbG93IGFuZCBkb2luZyBvZGQgdGhpbmdzIHdoZW4geW91IHJl
YWQgZnJvbSBpdC4KCkFncmVlZCwgSSBhbHJlYWR5IHNlbnQgYSBwYXRjaCB0byBMVFAgdG8gYmxh
Y2tsaXN0IGl0LgoKPiBBbmQgeWVzLCB0aGVyZSBhcmUgc29tZSAvcHJvYy8gZmlsZXMgdGhhdCB5
b3Ugc2hvdWxkIG5vdCByZWFkIGZyb20gYXMKPiByb290IGFuZCBleHBlY3QgdGhpbmdzIHRvIGFs
d2F5cyB3b3JrLiAgUENJIGRldmljZXMgYXJlIG5vdG9yaW91cyBmb3IKPiB0aGlzLCBhbmQgaWYg
eW91IGFyZSByZWFkaW5nIHRob3NlIGZpbGVzIGFzIHJvb3QsIHlvdSAia25vdyIgeW91IGtub3cK
PiB3aGF0IHlvdSBhcmUgZG9pbmcgYW5kIGNhbiBhY2NlcHQgdGhlIHJpc2sgZm9yIHdoZW4gdGhp
bmdzIGdvIHdyb25nLgo+IAo+IEl0IGlzIGZpbmUgdG8gd3JpdGUgdGVzdHMgdG8gcmVhZCBzcGVj
aWZpYyAvcHJvYy8gZmlsZXMgdGhhdCB5b3Uga25vdwo+IHdoYXQgaXMgaGFwcGVuaW5nIGluIHRo
ZW0uICBUbyBwaWNrIHJhbmRvbSBvbmVzIGlzIG5ldmVyIGEgZ29vZCBpZGVhLgoKVGhhbmtzIGZv
ciBleGFtcGxlLiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
