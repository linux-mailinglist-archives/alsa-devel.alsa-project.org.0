Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A3EE684
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 18:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BA41720;
	Mon,  4 Nov 2019 18:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BA41720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572889656;
	bh=k89EEXQ8v0/Rw6Iz3g7z/Y+qiohC46eHWgrhHhjWf88=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrJmpimViNpWHQmApcOuWqrXUc9EjLZ1BzGLvEzWtn+YmMeja7/qEtTC5JBYf7TG1
	 z9B9BsRBIgg9KgDzTP/Lr9W0r+yTh7VnyuZUY+JYeXbo1SK/vFt02nL9L+RRpOxwW6
	 CsV7rkk5ZN5bW+ZAz5/En0EJxBikhmqavZNWKfMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC5E6F8060F;
	Mon,  4 Nov 2019 18:44:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F6BCF803F4; Mon,  4 Nov 2019 16:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58542F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 16:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58542F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KUYl5ppA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572881127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QZRirfuUhsdXG9rrswqF3RwKnBGY5m5ab7OcFpaYpA=;
 b=KUYl5ppAE6Yfhs9RkFRB2I2vQVv8cRzWXz5uQldKEmvUHF8Kpw2oWXSIcYcsXGQmycgz9z
 EEsHKql/05IC/b0lmAK8OU8Blt7GpVR2/CjuNFtaDPrtkgQc660UmvNp5QNI0SyP/GDGZa
 C3t72HCwxVNxTUOoof5MBVf1Z/kvm6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-0Ejf54GUMYmPnVTUBPnmdw-1; Mon, 04 Nov 2019 10:25:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CA971800D53;
 Mon,  4 Nov 2019 15:25:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D27A100164D;
 Mon,  4 Nov 2019 15:25:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4193C18095FF;
 Mon,  4 Nov 2019 15:25:21 +0000 (UTC)
Date: Mon, 4 Nov 2019 10:25:21 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104145947.GA2211991@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.18]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: h70YfNCWRy5RPDBYtaoKLKwlyBv/kg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 0Ejf54GUMYmPnVTUBPnmdw-1
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAw
OToyODoxMEFNIC0wNTAwLCBKYW4gU3RhbmNlayB3cm90ZToKPiA+IAo+ID4gCj4gPiAtLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDA4OjM1
OjUxQU0gLTA1MDAsIEphbiBTdGFuY2VrIHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+
IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSGVsbG8s
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQg
Y29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgICAg
IEtlcm5lbCByZXBvOgo+ID4gPiA+ID4gICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gPiA+ID4g
ICAgICAgICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBw
cm92aWRlZCBiZWxvdy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgIE92ZXJhbGwgcmVzdWx0OiBG
QUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+ID4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBP
Swo+ID4gPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiA+ID4gICAgICAgICAgICAg
IFRlc3RzOiBGQUlMRUQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywg
Y29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvcgo+ID4gPiA+ID4gZG93bmxv
YWQKPiA+ID4gPiA+IGhlcmU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgaHR0cHM6Ly9hcnRpZmFj
dHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
T25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAg
IHg4Nl82NDoKPiA+ID4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+ID4gPgo+ID4gPiA+IAo+
ID4gPiA+IE5vdCBhIDUuMyAtc3RhYmxlIHJlZ3Jlc3Npb24uCj4gPiA+ID4gCj4gPiA+ID4gRmFp
bHVyZSBjb21lcyBmcm9tIHRlc3QgdGhhdCBzYW5pdHkgY2hlY2tzIGFsbCAvcHJvYyBmaWxlcyBi
eSBkb2luZwo+ID4gPiA+IDFrIHJlYWQgZnJvbSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3Vl
cyBpdCBoaXRzIHdydC4gc25kX2hkYV8qLgo+ID4gPiA+IAo+ID4gPiA+IEV4YW1wbGUgcmVwcm9k
dWNlcjoKPiA+ID4gPiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9oZGF1ZGlvQzBE
My1oZGF1ZGlvL2FjY2VzcyBvZj1vdXQudHh0Cj4gPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZs
YWc9bm9uYmxvY2sKPiA+ID4gCj4gPiA+IFRoYXQncyBub3QgYSBwcm9jIGZpbGUgOikKPiA+IAo+
ID4gUmlnaHQuIEl0J3Mgc2FtZSB0ZXN0IHRoYXQncyB1c2VkIGZvciAvcHJvYyB0b28uCj4gPiAK
PiA+ID4gCj4gPiA+ID4gSXQncyBzbG93IGFuZCB0cmlnZ2VycyBzb2Z0IGxvY2t1cHMgWzFdLiBB
bmQgaXQgYWxzbyByZXF1aXJlcyBsb3QKPiA+ID4gPiBvZiBtZW1vcnksIHRyaWdnZXJpbmcgT09N
cyBvbiBzbWFsbGVyIFZNczoKPiA+ID4gPiAweDAwMDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFh
MzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgxMzEvMHg0MDAKPiA+ID4gPiBwYWdlcz0yNjIx
NDQgdm1hbGxvYyB2cGFnZXMgTjA9MjYyMTQ0Cj4gPiA+ID4gCj4gPiA+ID4gSSdtIGxlYW5pbmcg
dG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMgaW4gdGhpcyB0ZXN0Lgo+ID4gPiA+
IENvbW1lbnRzIGFyZSB3ZWxjb21lZC4KPiA+ID4gCj4gPiA+IFJhbmRvbWx5IHBva2luZyBhcm91
bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNoZXMgYW5kCj4gPiA+IG1h
am9yIHByb2JsZW1zLiAgQWxzbywgZGVidWdmcyBmaWxlcyBhcmUgTk9UIHN0YWJsZSBhbmQgb25s
eSBmb3IKPiA+ID4gZGVidWdnaW5nIGFuZCBzaG91bGQgbmV2ZXIgYmUgZW5hYmxlZCBvbiAicmVh
bCIgc3lzdGVtcy4KPiA+ID4gCj4gPiA+IFNvIHdoYXQgZXhhY3RseSBpcyB0aGUgdGVzdCB0cnlp
bmcgdG8gZG8gaGVyZT8KPiA+IAo+ID4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWluZyB0
byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJvYywgL3N5cykKPiA+IHRvIHNlZSBpZiB0
aGF0IHRyaWdnZXJzIGFueXRoaW5nIGJhZC4KPiA+IAo+ID4gSXQgY2FuIHJ1biBhcyBwcml2aWxl
Z2VkIHVzZXIgdG9vLCB3aGljaCB3YXMgdGhlIGNhc2UgYWJvdmUuCj4gCj4gU3VyZSwgeW91IGNh
biBkbyB0b25zIG9mIGJhZCB0aGluZ3MgYXMgcm9vdCBwb2tpbmcgYXJvdW5kIGluIHN5c2ZzLAo+
IGRlYnVnZnMsIGFuZCBwcm9jZnMuICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8s
IGJyZWFrIHRoZQo+IHN5c3RlbT8KCldlIGFyZSB0YWxraW5nIGFib3V0IHJlYWQtb25seSBoZXJl
LiBJcyBpdCB1bnJlYXNvbmFibGUgdG8gZXhwZWN0CnRoYXQgcm9vdCBjYW4gcmVhZCBhbGwgL3By
b2MgZW50cmllcyB3aXRob3V0IGNyYXNoaW5nIHRoZSBzeXN0ZW0/CgpTb21lIGVudHJpZXMgYXJl
IHJlYWRhYmxlIG9ubHkgYnkgcm9vdC4gU28gYW4gdW5wcml2aWxlZ2VkIHVzZXIKd2lsbCBza2lw
IGNvbnNpZGVyYWJsZSBudW1iZXIgb2YgZW50cmllczoKLXItLS0tLS0tLS4gMSByb290IHJvb3Qg
MCBOb3YgIDQgMTY6MTMgL3Byb2Mvc2xhYmluZm8KCj4gVGhhdCBzb3VuZHMgbGlrZSBhIGhvcnJp
YmxlIHRlc3QgdGhhdCBpcyBqdXN0IHNldHRpbmcgaXRzZWxmIHVwIHRvIGxvY2sKPiB0aGUgc3lz
dGVtIHVwLCB5b3Ugc2hvdWxkIHJldmlzaXQgaXQuLi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
