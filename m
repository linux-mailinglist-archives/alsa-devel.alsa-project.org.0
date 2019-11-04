Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F3EE9AE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 21:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6F5171E;
	Mon,  4 Nov 2019 21:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6F5171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572899673;
	bh=mYUf1TGiaL4ZlzJwtrXrXx+bhrIxUmCTmLWZzGrjUvc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jeVRbqcEvLufrUYD1Efw0oXKO6xLoJH+npnE/pFNgEjuZtcN2g4boSvoLvh2OZCCX
	 NnvYS/DHD9kwauplN7nRV/eoo1vqgX4gtdCYjw1E6AvGa2uuGZh4yANgVcRxu6YEOM
	 WyzTKpqmTP3FEBdUIByOykRsdvqVjlJwvfiBt9Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3330FF8045F;
	Mon,  4 Nov 2019 21:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E23DEF803F4; Mon,  4 Nov 2019 21:32:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19FEDF800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 21:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19FEDF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IlrlvPyA"
Received: from localhost (6.204-14-84.ripe.coltfrance.com [84.14.204.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC8FA2089C;
 Mon,  4 Nov 2019 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572899561;
 bh=gJg9du3gjb3yRrD36ucqOZhq4Hvnau21qbVjEX3W5Rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlrlvPyAzNrFN73j7o2mAGRReO5yfNutJF5qTrfHki+BnlxgnUfQRL+szZ3SvByu2
 u3GJrcrIiA7KZ8AntBYlPovam/zz5CcumWok1G5dS06nYy6UBxsopEst/64+uGvHAE
 Nx7+EQsUIkGAnwd0DFd1UpDo2sr1r8XarE9XLnuE=
Date: Mon, 4 Nov 2019 21:32:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104203239.GA2293927@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
 <20191104145947.GA2211991@kroah.com>
 <251943262.10356408.1572881121044.JavaMail.zimbra@redhat.com>
 <20191104163033.GB2253150@kroah.com>
 <1766459302.10389172.1572886973921.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1766459302.10389172.1572886973921.JavaMail.zimbra@redhat.com>
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTI6MDI6NTNQTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gT24gTW9uLCBOb3YgMDQs
IDIwMTkgYXQgMTA6MjU6MjFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+IAo+ID4g
PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4gT24gTW9uLCBOb3YgMDQsIDIw
MTkgYXQgMDk6Mjg6MTBBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+ID4g
PiBPbiBNb24sIE5vdiAwNCwgMjAxOSBhdCAwODozNTo1MUFNIC0wNTAwLCBKYW4gU3RhbmNlayB3
cm90ZToKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAtLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEhl
bGxvLAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBXZSByYW4gYXV0b21hdGVkIHRl
c3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4gPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoKPiA+ID4gPiA+ID4gPiA+
ICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3Rh
YmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgIENvbW1p
dDogZGZlMjgzZTlmZGFjIC0gTGludXggNS4zLjktcmMxCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlk
ZWQgYmVsb3cuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICAgICBPdmVyYWxsIHJl
c3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICBNZXJnZTogT0sKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4gPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxv
Z3MgYXJlIGF2YWlsYWJsZSBmb3IKPiA+ID4gPiA+ID4gPiA+IGRvd25sb2FkCj4gPiA+ID4gPiA+
ID4gPiBoZXJlOgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiAgIGh0dHBzOi8vYXJ0
aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvMjYyMzgwCj4gPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICAgICB4ODZfNjQ6Cj4gPiA+ID4gPiA+ID4gPiAgICAg
IOKdjCBMVFAgbGl0ZQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiBOb3QgYSA1LjMgLXN0YWJsZSByZWdyZXNzaW9uLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiA+IEZhaWx1cmUgY29tZXMgZnJvbSB0ZXN0IHRoYXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2Mg
ZmlsZXMgYnkgZG9pbmcKPiA+ID4gPiA+ID4gPiAxayByZWFkIGZyb20gZWFjaC4gVGhlcmUgYXJl
IGNvdXBsZSBpc3N1ZXMgaXQgaGl0cyB3cnQuIHNuZF9oZGFfKi4KPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4gPiA+ID4gPiA+ID4gICBkZCBpZj0vc3lz
L2tlcm5lbC9kZWJ1Zy9yZWdtYXAvaGRhdWRpb0MwRDMtaGRhdWRpby9hY2Nlc3MKPiA+ID4gPiA+
ID4gPiAgIG9mPW91dC50eHQKPiA+ID4gPiA+ID4gPiAgIGNvdW50PTEgYnM9MTAyNCBpZmxhZz1u
b25ibG9jawo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhhdCdzIG5vdCBhIHByb2MgZmlsZSA6
KQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBSaWdodC4gSXQncyBzYW1lIHRlc3QgdGhhdCdzIHVzZWQg
Zm9yIC9wcm9jIHRvby4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBJdCdz
IHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3VwcyBbMV0uIEFuZCBpdCBhbHNvIHJlcXVpcmVz
IGxvdAo+ID4gPiA+ID4gPiA+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIg
Vk1zOgo+ID4gPiA+ID4gPiA+IDB4MDAwMDAwMDAyNGYwNDM3Yi0weDAwMDAwMDAwMWEzMmIxYzgg
MTA3Mzc0NTkyMAo+ID4gPiA+ID4gPiA+IHNlcV9yZWFkKzB4MTMxLzB4NDAwCj4gPiA+ID4gPiA+
ID4gcGFnZXM9MjYyMTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0NAo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IEknbSBsZWFuaW5nIHRvd2FyZHMgc2tpcHBpbmcgYWxsIHJlZ21hcCBlbnRy
aWVzIGluIHRoaXMgdGVzdC4KPiA+ID4gPiA+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBSYW5kb21seSBwb2tpbmcgYXJvdW5kIGluIGRlYnVnZnMg
aXMgYSBzdXJlIHdheSB0byBjYXVzZSBjcmFzaGVzIGFuZAo+ID4gPiA+ID4gPiBtYWpvciBwcm9i
bGVtcy4gIEFsc28sIGRlYnVnZnMgZmlsZXMgYXJlIE5PVCBzdGFibGUgYW5kIG9ubHkgZm9yCj4g
PiA+ID4gPiA+IGRlYnVnZ2luZyBhbmQgc2hvdWxkIG5ldmVyIGJlIGVuYWJsZWQgb24gInJlYWwi
IHN5c3RlbXMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhl
IHRlc3QgdHJ5aW5nIHRvIGRvIGhlcmU/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEl0J3MgKHVucHJp
dmlsZWdlZCkgdXNlciB0cnlpbmcgdG8gb3Blbi9yZWFkIGFueXRoaW5nIGl0IGNhbiAoL3Byb2Ms
Cj4gPiA+ID4gPiAvc3lzKQo+ID4gPiA+ID4gdG8gc2VlIGlmIHRoYXQgdHJpZ2dlcnMgYW55dGhp
bmcgYmFkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCBjYW4gcnVuIGFzIHByaXZpbGVnZWQgdXNl
ciB0b28sIHdoaWNoIHdhcyB0aGUgY2FzZSBhYm92ZS4KPiA+ID4gPiAKPiA+ID4gPiBTdXJlLCB5
b3UgY2FuIGRvIHRvbnMgb2YgYmFkIHRoaW5ncyBhcyByb290IHBva2luZyBhcm91bmQgaW4gc3lz
ZnMsCj4gPiA+ID4gZGVidWdmcywgYW5kIHByb2Nmcy4gIFdoYXQgZXhhY3RseSBhcmUgeW91IHRy
eWluZyB0byBkbywgYnJlYWsgdGhlCj4gPiA+ID4gc3lzdGVtPwo+ID4gPiAKPiA+ID4gV2UgYXJl
IHRhbGtpbmcgYWJvdXQgcmVhZC1vbmx5IGhlcmUuIElzIGl0IHVucmVhc29uYWJsZSB0byBleHBl
Y3QKPiA+ID4gdGhhdCByb290IGNhbiByZWFkIGFsbCAvcHJvYyBlbnRyaWVzIHdpdGhvdXQgY3Jh
c2hpbmcgdGhlIHN5c3RlbT8KPiA+IAo+ID4gWW91IGFyZSBOT1QgcmVhZGluZyAvcHJvYy8gaGVy
ZS4KPiAKPiBOby4gVGhhdCB3YXMgYSBnZW5lcmFsIHF1ZXN0aW9uIHRvIHVzZWZ1bG5lc3Mgb2Yg
cHJpdmlsZWdlZCByZWFkLAo+IHVzaW5nIC9wcm9jIGFzIGV4YW1wbGUgd2hlcmUgaXQgY29tbW9u
bHkgaGFwcGVucy4KPiAKPiA+IFlvdSBhcmUgcmVhZGluZyBkZWJ1Z2ZzIHdoaWNoIHlvdQo+ID4g
cmVhbGx5IGhhdmUgTk9UIGlkZWEgd2hhdCBpcyBpbiB0aGVyZS4gIEFzIHlvdSBzYXcsIHlvdSBh
cmUgcmVhZGluZyBmcm9tCj4gPiBoYXJkd2FyZSB0aGF0IGlzIHNsb3cgYW5kIGRvaW5nIG9kZCB0
aGluZ3Mgd2hlbiB5b3UgcmVhZCBmcm9tIGl0Lgo+IAo+IEFncmVlZCwgSSBhbHJlYWR5IHNlbnQg
YSBwYXRjaCB0byBMVFAgdG8gYmxhY2tsaXN0IGl0LgoKSG9wZWZ1bGx5IHlvdSBhcmUgYmxhY2ts
aXN0aW5nIGFsbCBvZiBkZWJ1Z2ZzLiAgYW5kIHN5c2ZzLiAgQW5kIHByb2Nmcy4KQWRkaW5nIHNw
ZWNpZmljIGZpbGVzIGJhY2sgaXMgZmluZSwgYXMgbG9uZyBhcyB5b3UgImtub3ciIHRoZXkgYXJl
IG9rCmFuZCB5b3UgYXJlIGFjdHVhbGx5IHRlc3Rpbmcgc29tZXRoaW5nIHZhbGlkIHRoZXJlLgoK
dGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
