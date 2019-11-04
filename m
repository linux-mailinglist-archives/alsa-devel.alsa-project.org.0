Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A715AEE301
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 16:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BE41744;
	Mon,  4 Nov 2019 16:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BE41744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572879703;
	bh=5cjlLdaDCGTaxO4qV8b7VCcy1qmlqMIKwVcmzO1m+Lc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0MzJSOdb2uxzRlyvoNa4kCvcbsCkicIjxmunL4nJbcqKoaJ5QRlJE5q41vAJPIY7
	 ywcmOHNCpqjmknSu1fWFd8dY2O1MkRsHDugOJXbn4pCdFzYGaPknOqNlD05PxbCLSa
	 aaMTEAV09Ld7hT6EyFx7JVrgS674afExFQ0XgGMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EF6F8048D;
	Mon,  4 Nov 2019 15:59:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDB9CF803F4; Mon,  4 Nov 2019 15:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE955F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE955F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="izAGyOFk"
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AF6E21D7F;
 Mon,  4 Nov 2019 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572879591;
 bh=4DM6PsVNusVwUXpvzXvmTrY1JRmZq07AfglvQsNWuDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=izAGyOFkCY9FsTpZBGaRHf0qnEd7WX44JLuBknCFkhnUGbHwpnrCz7mSNciXMvPRy
 83GSqSmyoIF+MN78AEJvMOsyEpDkP2u6hWCXbaTYnHqBXZespraAz3S9RA1c7MOBqA
 Kqm8avdiINBAZ2gcfb+NcUmznvPESeNtiEJe7wFE=
Date: Mon, 4 Nov 2019 15:59:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191104145947.GA2211991@kroah.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
 <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
 <20191104135135.GA2162401@kroah.com>
 <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1341418315.10342806.1572877690830.JavaMail.zimbra@redhat.com>
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDk6Mjg6MTBBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gT24gTW9uLCBOb3Yg
MDQsIDIwMTkgYXQgMDg6MzU6NTFBTSAtMDUwMCwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4gPiA+IAo+
ID4gPiAKPiA+ID4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+IAo+ID4gPiA+
IEhlbGxvLAo+ID4gPiA+IAo+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNl
bnQgY29tbWl0IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiAKPiA+ID4gPiAgICAgICAg
S2VybmVsIHJlcG86Cj4gPiA+ID4gICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLXJjLmdpdAo+ID4gPiA+ICAgICAg
ICAgICAgIENvbW1pdDogZGZlMjgzZTlmZGFjIC0gTGludXggNS4zLjktcmMxCj4gPiA+ID4gCj4g
PiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBi
ZWxvdy4KPiA+ID4gPiAKPiA+ID4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRl
dGFpbHMgYmVsb3cpCj4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBPSwo+ID4gPiA+ICAgICAg
ICAgICAgQ29tcGlsZTogT0sKPiA+ID4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4g
PiA+IAo+ID4gPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3Mg
YXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQKPiA+ID4gPiBoZXJlOgo+ID4gPiA+IAo+ID4gPiA+
ICAgaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiA+
ID4gPiAKPiA+ID4gPiBPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgo+ID4gPiA+IAo+
ID4gPiA+ICAgICB4ODZfNjQ6Cj4gPiA+ID4gICAgICDinYwgTFRQIGxpdGUKPiA+ID4gPgo+ID4g
PiAKPiA+ID4gTm90IGEgNS4zIC1zdGFibGUgcmVncmVzc2lvbi4KPiA+ID4gCj4gPiA+IEZhaWx1
cmUgY29tZXMgZnJvbSB0ZXN0IHRoYXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2MgZmlsZXMgYnkg
ZG9pbmcKPiA+ID4gMWsgcmVhZCBmcm9tIGVhY2guIFRoZXJlIGFyZSBjb3VwbGUgaXNzdWVzIGl0
IGhpdHMgd3J0LiBzbmRfaGRhXyouCj4gPiA+IAo+ID4gPiBFeGFtcGxlIHJlcHJvZHVjZXI6Cj4g
PiA+ICAgZGQgaWY9L3N5cy9rZXJuZWwvZGVidWcvcmVnbWFwL2hkYXVkaW9DMEQzLWhkYXVkaW8v
YWNjZXNzIG9mPW91dC50eHQKPiA+ID4gICBjb3VudD0xIGJzPTEwMjQgaWZsYWc9bm9uYmxvY2sK
PiA+IAo+ID4gVGhhdCdzIG5vdCBhIHByb2MgZmlsZSA6KQo+IAo+IFJpZ2h0LiBJdCdzIHNhbWUg
dGVzdCB0aGF0J3MgdXNlZCBmb3IgL3Byb2MgdG9vLgo+IAo+ID4gCj4gPiA+IEl0J3Mgc2xvdyBh
bmQgdHJpZ2dlcnMgc29mdCBsb2NrdXBzIFsxXS4gQW5kIGl0IGFsc28gcmVxdWlyZXMgbG90Cj4g
PiA+IG9mIG1lbW9yeSwgdHJpZ2dlcmluZyBPT01zIG9uIHNtYWxsZXIgVk1zOgo+ID4gPiAweDAw
MDAwMDAwMjRmMDQzN2ItMHgwMDAwMDAwMDFhMzJiMWM4IDEwNzM3NDU5MjAgc2VxX3JlYWQrMHgx
MzEvMHg0MDAKPiA+ID4gcGFnZXM9MjYyMTQ0IHZtYWxsb2MgdnBhZ2VzIE4wPTI2MjE0NAo+ID4g
PiAKPiA+ID4gSSdtIGxlYW5pbmcgdG93YXJkcyBza2lwcGluZyBhbGwgcmVnbWFwIGVudHJpZXMg
aW4gdGhpcyB0ZXN0Lgo+ID4gPiBDb21tZW50cyBhcmUgd2VsY29tZWQuCj4gPiAKPiA+IFJhbmRv
bWx5IHBva2luZyBhcm91bmQgaW4gZGVidWdmcyBpcyBhIHN1cmUgd2F5IHRvIGNhdXNlIGNyYXNo
ZXMgYW5kCj4gPiBtYWpvciBwcm9ibGVtcy4gIEFsc28sIGRlYnVnZnMgZmlsZXMgYXJlIE5PVCBz
dGFibGUgYW5kIG9ubHkgZm9yCj4gPiBkZWJ1Z2dpbmcgYW5kIHNob3VsZCBuZXZlciBiZSBlbmFi
bGVkIG9uICJyZWFsIiBzeXN0ZW1zLgo+ID4gCj4gPiBTbyB3aGF0IGV4YWN0bHkgaXMgdGhlIHRl
c3QgdHJ5aW5nIHRvIGRvIGhlcmU/Cj4gCj4gSXQncyAodW5wcml2aWxlZ2VkKSB1c2VyIHRyeWlu
ZyB0byBvcGVuL3JlYWQgYW55dGhpbmcgaXQgY2FuICgvcHJvYywgL3N5cykKPiB0byBzZWUgaWYg
dGhhdCB0cmlnZ2VycyBhbnl0aGluZyBiYWQuCj4gCj4gSXQgY2FuIHJ1biBhcyBwcml2aWxlZ2Vk
IHVzZXIgdG9vLCB3aGljaCB3YXMgdGhlIGNhc2UgYWJvdmUuCgpTdXJlLCB5b3UgY2FuIGRvIHRv
bnMgb2YgYmFkIHRoaW5ncyBhcyByb290IHBva2luZyBhcm91bmQgaW4gc3lzZnMsCmRlYnVnZnMs
IGFuZCBwcm9jZnMuICBXaGF0IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gZG8sIGJyZWFrIHRo
ZQpzeXN0ZW0/CgpUaGF0IHNvdW5kcyBsaWtlIGEgaG9ycmlibGUgdGVzdCB0aGF0IGlzIGp1c3Qg
c2V0dGluZyBpdHNlbGYgdXAgdG8gbG9jawp0aGUgc3lzdGVtIHVwLCB5b3Ugc2hvdWxkIHJldmlz
aXQgaXQuLi4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
