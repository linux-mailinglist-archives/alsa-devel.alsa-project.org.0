Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77451EE682
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 18:46:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD461723;
	Mon,  4 Nov 2019 18:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD461723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572889610;
	bh=sDO/RuttkBjwJSU67sxWGWLQsIk4T102cnk6PfADLso=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXNXEeRGsum4Uydy7z24Ytr14UhYFmpkTL+ZhNaw0vV+B+VfL1k5OnVgSn2YLKiZ8
	 OfgcEQg8Nkne66rdpz6Gxu8WjhM9w8ovJSkGAoxlH6BCHUIQI2hePk8bgISr32LVVx
	 sgaTAnMPE2poyR8OnvrFJzeHrvUb8LrTVCEOh8y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E64F805FE;
	Mon,  4 Nov 2019 18:44:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DC5DF803F4; Mon,  4 Nov 2019 15:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78964F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78964F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="A1hxQoxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572877693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXs+LDxO88IFopCBCdlf8Wk3p0+58YbIqWF2eEqPtpk=;
 b=A1hxQoxU1npiKEWAH6CAvAiH5tYCTMLi20WH7n5UwRDIR49lRden/F7MEsY8A9hjpRELC+
 bIIpZ7Yw3vcYrW/yp2T4G0v2P5ClRarO5wM42YEdluzvdf2ryYBMA5X0EjegXbma6okgWT
 lH1hkWRNYPydpy6KzrH4sIJnfET55Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-t_2Xk-g9NVCNSG-XGMKtLA-1; Mon, 04 Nov 2019 09:28:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85AC48017DD;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D2E5D6C5;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13CBF4BB5B;
 Mon,  4 Nov 2019 14:28:11 +0000 (UTC)
Date: Mon, 4 Nov 2019 09:28:10 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104135135.GA2162401@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: Kx4pHL9z3NzPO+lMPvoi41zdd+kemg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: t_2Xk-g9NVCNSG-XGMKtLA-1
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQg
MDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gLS0tLS0g
T3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiAKPiA+ID4gSGVsbG8sCj4gPiA+IAo+ID4gPiBX
ZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVs
IHRyZWU6Cj4gPiA+IAo+ID4gPiAgICAgICAgS2VybmVsIHJlcG86Cj4gPiA+ICAgICAgICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0
YWJsZS1yYy5naXQKPiA+ID4gICAgICAgICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51
eCA1LjMuOS1yYzEKPiA+ID4gCj4gPiA+IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0
ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4gPiA+IAo+ID4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6
IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4gPiA+ICAgICAgICAgICAgICBNZXJnZTogT0sK
PiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiAgICAgICAgICAgICAgVGVzdHM6IEZB
SUxFRAo+ID4gPiAKPiA+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQg
bG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZAo+ID4gPiBoZXJlOgo+ID4gPiAKPiA+ID4g
ICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzI2MjM4MAo+ID4g
PiAKPiA+ID4gT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gCj4gPiA+ICAg
ICB4ODZfNjQ6Cj4gPiA+ICAgICAg4p2MIExUUCBsaXRlCj4gPiA+Cj4gPiAKPiA+IE5vdCBhIDUu
MyAtc3RhYmxlIHJlZ3Jlc3Npb24uCj4gPiAKPiA+IEZhaWx1cmUgY29tZXMgZnJvbSB0ZXN0IHRo
YXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2MgZmlsZXMgYnkgZG9pbmcKPiA+IDFrIHJlYWQgZnJv
bSBlYWNoLiBUaGVyZSBhcmUgY291cGxlIGlzc3VlcyBpdCBoaXRzIHdydC4gc25kX2hkYV8qLgo+
ID4gCj4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4gPiAgIGRkIGlmPS9zeXMva2VybmVsL2RlYnVn
L3JlZ21hcC9oZGF1ZGlvQzBEMy1oZGF1ZGlvL2FjY2VzcyBvZj1vdXQudHh0Cj4gPiAgIGNvdW50
PTEgYnM9MTAyNCBpZmxhZz1ub25ibG9jawo+IAo+IFRoYXQncyBub3QgYSBwcm9jIGZpbGUgOikK
ClJpZ2h0LiBJdCdzIHNhbWUgdGVzdCB0aGF0J3MgdXNlZCBmb3IgL3Byb2MgdG9vLgoKPiAKPiA+
IEl0J3Mgc2xvdyBhbmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVx
dWlyZXMgbG90Cj4gPiBvZiBtZW1vcnksIHRyaWdnZXJpbmcgT09NcyBvbiBzbWFsbGVyIFZNczoK
PiA+IDB4MDAwMDAwMDAyNGYwNDM3Yi0weDAwMDAwMDAwMWEzMmIxYzggMTA3Mzc0NTkyMCBzZXFf
cmVhZCsweDEzMS8weDQwMAo+ID4gcGFnZXM9MjYyMTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0
NAo+ID4gCj4gPiBJJ20gbGVhbmluZyB0b3dhcmRzIHNraXBwaW5nIGFsbCByZWdtYXAgZW50cmll
cyBpbiB0aGlzIHRlc3QuCj4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gCj4gUmFuZG9tbHkg
cG9raW5nIGFyb3VuZCBpbiBkZWJ1Z2ZzIGlzIGEgc3VyZSB3YXkgdG8gY2F1c2UgY3Jhc2hlcyBh
bmQKPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmlsZXMgYXJlIE5PVCBzdGFibGUg
YW5kIG9ubHkgZm9yCj4gZGVidWdnaW5nIGFuZCBzaG91bGQgbmV2ZXIgYmUgZW5hYmxlZCBvbiAi
cmVhbCIgc3lzdGVtcy4KPiAKPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRlc3QgdHJ5aW5nIHRv
IGRvIGhlcmU/CgpJdCdzICh1bnByaXZpbGVnZWQpIHVzZXIgdHJ5aW5nIHRvIG9wZW4vcmVhZCBh
bnl0aGluZyBpdCBjYW4gKC9wcm9jLCAvc3lzKQp0byBzZWUgaWYgdGhhdCB0cmlnZ2VycyBhbnl0
aGluZyBiYWQuCgpJdCBjYW4gcnVuIGFzIHByaXZpbGVnZWQgdXNlciB0b28sIHdoaWNoIHdhcyB0
aGUgY2FzZSBhYm92ZS4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0
L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL2ZzL3JlYWRfYWxsL3JlYWRfYWxsLmMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
