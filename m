Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9330161182
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 12:58:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DB5166F;
	Mon, 17 Feb 2020 12:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DB5166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581940697;
	bh=wwarqRUf5+beWXmWMmdVF/jr/431rsHNZNN4p8/TsT8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsCEnwciPFMla9SZhEBvad6F2r7wPV0K8bgEHs0PVbrQcHyu6hGiedg/Pnp7Lrf/e
	 N2Ld8zB+K+758t2lvw4IDO+KvgLI8lc5VTgW0eOtORAiEVONVsKqd1wLUEfyw9ALDI
	 9/PWC83KJU0f8eL0EZox6Ud2oXIu6wC9Aak78QWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 357F6F801F4;
	Mon, 17 Feb 2020 12:56:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A96D5F80172; Mon, 17 Feb 2020 12:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05606F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 12:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05606F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KLXMnILj"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HBuQ9J005182;
 Mon, 17 Feb 2020 05:56:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581940586;
 bh=RI7mE+N/HAZybBiKUVhd5j+3Zldv4+UsgBiC4lYq0Uc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KLXMnILjlCgxor3LjU/hWgymBdprbCjgr3QsojLsvK/jF0xF2ck7lSf1dFppl8Ldn
 UCgoRzKRRlZQQ9BWm+3OGcP3WrcBDSN+Oa0v6hLnM824jtKfO7lp8IYbaBQn+lu9Kg
 2QYYTj564tegr0BalGZW+Nm17fq3lt/0HO44SxFs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01HBuQBK091651
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Feb 2020 05:56:26 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 05:56:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 05:56:25 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HBuO39102068;
 Mon, 17 Feb 2020 05:56:25 -0600
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Lars-Peter Clausen
 <lars@metafoo.de>
References: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
 <d1d0be54-5bdb-0405-320a-d7e542fdbcde@metafoo.de>
 <20200217113540.GB108283@ediswmail.ad.cirrus.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <4fafa55a-acd0-8a64-2ebe-0ed38b306678@ti.com>
Date: Mon, 17 Feb 2020 13:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217113540.GB108283@ediswmail.ad.cirrus.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] DMARC & gmail & cirrus.com
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

SGksCgpPbiAxNy8wMi8yMDIwIDEzLjM1LCBDaGFybGVzIEtlZXBheCB3cm90ZToKPiBPbiBNb24s
IEZlYiAxNywgMjAyMCBhdCAxMDozMzo1NUFNICswMTAwLCBMYXJzLVBldGVyIENsYXVzZW4gd3Jv
dGU6Cj4+IE9uIDIvMTcvMjAgOTo0NiBBTSwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+Pj4gwqDC
oMKgwqBJIGNhbiBlbmFibGUgdGhlICJSZXBsYWNlIHRoZSBGcm9tOiBoZWFkZXIgYWRkcmVzcyIg
aW4gdGhlCj4+PiBtYWlsbWFuIGNvbmZpZyB0byAiTXVuZ2UgRnJvbSIgbGlrZSBpbiB0aGUgYWJv
dmUgZXhhbXBsZSwgYnV0IGl0Cj4+PiB3aWxsIG1lYW4gdGhhdCBGcm9tOiB3aWxsIGJlIGFsdGVy
ZWQgKHNlZSB0aGUgZXhwbGFuYXRpb24pLgo+Pgo+PiBUaGUgd2F5IEkgdW5kZXJzdGFuZCB0aGUg
b3B0aW9uIHRvIHJlcGxhY2UgdGhlIEZyb206IGhlYWRlciBpcyB0aGF0Cj4+IGl0IHdpbGwgb25s
eSBoYXBwZW4gZm9yIHRob3NlIHRoYXQgaGF2ZSBhIHJlamVjdCBwb2xpY3ksIGZvcgo+PiBldmVy
eWJvZHkgZWxzZSBub3RoaW5nIGNoYW5nZXMuIFNvIGlmIHRoZSBtYWlsaW5nbGlzdCBpcyBzdXBw
b3NlZCB0bwo+PiBzdGF5IHVzZWZ1bCBmb3IgdGhvc2Ugd2l0aCBhIHJlamVjdCBwb2xpY3kgdGhl
IG9ubHkgb3B0aW9uIGlzIHRvCj4+IHJld3JpdGUgdGhlIGZyb20gaGVhZGVyIGZvciB0aGVtLgo+
Pgo+IAo+IFJld3JpdGluZyBzZWVtcyBsaWtlIHRoZSBiZXN0IG9wdGlvbiByZWFsbHksIEkgZG91
YnQgdGhlcmUKPiBpcyBtdWNoIGNoYW5jZSBvZiBtZSBtYW5hZ2luZyB0byBnZXQgdGhlIElTIGd1
eXMgdG8gY2hhbmdlCj4gY2lycnVzLmNvbSdzIERNQVJDIHBvbGljeSBhbmQgSSBndWVzcyB3ZSBt
aWdodCBub3QgYmUgdGhlIG9ubHkKPiBwZW9wbGUgd2hvIGNhdXNlIHRyb3VibGUgb24gdGhpcyBm
cm9udC4KCnRpLmNvbSBhbHNvIGhhZCBpc3N1ZXMgY2F1c2VkIGJ5IERNQVJDIHBvbGljeS4gV2Ug
aGF2ZSBleHRlbnNpdmVseQpuYWdnZWQgb3VyIElUIGRlcGFydG1lbnQgb3ZlciB0aGlzIGFuZCBp
dCBnb3QgcmVzb2x2ZWQ/ClByb2JhYmx5LiBOb3Qgc3VyZSwgYnV0IEkgaGF2ZSBub3QgYmVlbiB1
bnN1YnNjcmliZWQgbGF0ZWx5IGZyb20gbGlzdHMKYW5kIG5vIGNvbXBsYWludHMgb24gcGVvcGxl
IG5vdCByZWNlaXZpbmcgbXkgbWFpbHMuLi4gaXQgY291bGQgYmUgdGhhdAp0aGV5IGRvIG5vdCBp
bmRlZWQgcmVjZWl2ZSB0aGUgbWFpbHMgd2hpY2ggbWFrZXMgdGhlbSBoYXBweSA7KQoKPiAKPiBU
aGFua3MsCj4gQ2hhcmxlcwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwKPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
