Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800CE28F5A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 05:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0551683;
	Fri, 24 May 2019 05:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0551683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558666890;
	bh=PvviZEgBE6lLGybdOM9EY6MSuKtl+MbBNaQtYMzG31k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EpBEl7MAIVvb0gWG4dZKMt3sT7D4TXw7rVVTkJex8O8E33bvlHoAbv5YE557SjzMe
	 mz4a6Ho7euIZ7ZpXJYwSj5SPaz0Bwvxl5NMZBG+EbH9G+VznEEucI8F9e06iPIojEc
	 p1PEoK863aZnGN3TbGSmIY9wal9XnToB6KxHSvs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B12F80C0F;
	Fri, 24 May 2019 04:59:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306E6F8962F; Fri, 24 May 2019 04:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B94F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 04:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B94F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="RW35XySV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ReDohYM/VMtr1ygEVpafs5ADrPqoTmnqqTt7tUizZ4=; b=RW35XySVF4hvxpb9dr376bXusL
 ySj1jxNLHAaTvwzjVtxXr0qSApXWjsWEJ1y3IkQnpe4Bfywf2OUiaOeges9y3rTbFn2b2Pnjdc9Q3
 XEtQoGyF5638qdkRRJ+rDkap42NykEh7AAb6ucWC25g/SMr7SKseUJclLffDq30q/kn5HKkrt3QpS
 9jCPfOKqopqcP9TaBKm00uJMD02uJCVUS4GV6wzo8hPvVyW1TLxxLYYcuBJAbxbHLlDd5DRzCX/OU
 jnDF4AGT0mexUPyIqFhrm0q88oBoYE79ol6XZwN5osX8okOL8cw53pwT7kiKF0YVPC9u2JlCaQGWP
 Yl66VaBg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU0QV-0002dg-L1; Fri, 24 May 2019 02:59:23 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <9019c87f-cf1a-b59f-d87e-8169b247cf88@infradead.org>
 <6b89e370-90e3-6962-c71a-80919b7c6154@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4cedd724-7c2e-10c2-a328-61f7af3ab9ed@infradead.org>
Date: Thu, 23 May 2019 19:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6b89e370-90e3-6962-c71a-80919b7c6154@linux.intel.com>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoc: fix
 sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64
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

T24gNS8yMy8xOSA0OjI4IEFNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAKPiBP
biA1LzIyLzE5IDEwOjU4IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IEZyb206IFJhbmR5IER1
bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+Pgo+PiBza2wtc3NwLWNsay5jIGRvZXMgbm90
IGJ1aWxkIG9uIElBNjQgYmVjYXVzZSB0aGUgZHJpdmVyCj4+IHVzZXMgdGhlIGNvbW1vbiBjbG9j
ayBpbnRlcmZhY2UsIHNvIG1ha2UgdGhlIGRyaXZlciBkZXBlbmQKPj4gb24gQ09NTU9OX0NMSy4K
Pj4KPj4gRml4ZXMgdGhpcyBidWlsZCBlcnJvcjoKPj4gLi4vc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXNzcC1jbGsuYzoyNjoxNjogZXJyb3I6IGZpZWxkICdodycgaGFzIGluY29tcGxldGUg
dHlwZQo+PiDCoMKgIHN0cnVjdCBjbGtfaHcgaHc7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF5+Cj4+Cj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVh
ZC5vcmc+Cj4+IENjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4+IENjOiBQaWVy
cmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+
PiBDYzogTGlhbSBHaXJkd29vZCA8bGlhbS5yLmdpcmR3b29kQGxpbnV4LmludGVsLmNvbT4KPj4g
Q2M6IEppZSBZYW5nIDx5YW5nLmppZUBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBhbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKPj4gLS0tCj4+IMKgIHNvdW5kL3NvYy9pbnRlbC9LY29uZmlnwqDC
oMKgwqDCoMKgwqAgfMKgwqDCoCAzICsrLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL0tj
b25maWcgfMKgwqDCoCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiAtLS0gbG54LTUyLXJjMS5vcmlnL3NvdW5kL3NvYy9pbnRl
bC9LY29uZmlnCj4+ICsrKyBsbngtNTItcmMxL3NvdW5kL3NvYy9pbnRlbC9LY29uZmlnCj4+IEBA
IC0xMDQsNyArMTA0LDcgQEAgY29uZmlnIFNORF9TU1RfQVRPTV9ISUZJMl9QTEFURk9STV9BQ1BJ
Cj4+IMKgIGNvbmZpZyBTTkRfU09DX0lOVEVMX1NLWUxBS0UKPj4gwqDCoMKgwqDCoCB0cmlzdGF0
ZSAiQWxsIFNreWxha2UvU1NUIFBsYXRmb3JtcyIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFBD
SSAmJiBBQ1BJCj4+IC3CoMKgwqAgc2VsZWN0IFNORF9TT0NfSU5URUxfU0tMCj4+ICvCoMKgwqAg
c2VsZWN0IFNORF9TT0NfSU5URUxfU0tMIGlmIENPTU1PTl9DTEsKPiAKPiBJcyB0aGlzIHJlYWxs
eSBuZWNlc3Nhcnk/IFRoZSBDT01NT05fQ0xLIGlzIG9ubHkgbmVlZGVkIGZvciB0aGUgU05EX1NP
Q19JTlRFTF9TS1lMQUtFX1NTUF9DTEsgb3B0aW9uLCBpc24ndCBpdD8KCkl0IHByZXZlbnRzIHRo
aXMgS2NvbmZpZyB3YXJuaW5nOgoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBk
ZXRlY3RlZCBmb3IgU05EX1NPQ19JTlRFTF9TS0wKICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz15
XSAmJiAhVU1MICYmIFNORCBbPXldICYmIFNORF9TT0MgWz15XSAmJiBTTkRfU09DX0lOVEVMX1NT
VF9UT1BMRVZFTCBbPXldICYmIFBDSSBbPXldICYmIEFDUEkgWz15XSAmJiBDT01NT05fQ0xLIFs9
bl0KICBTZWxlY3RlZCBieSBbeV06CiAgLSBTTkRfU09DX0lOVEVMX1NLWUxBS0UgWz15XSAmJiBT
T1VORCBbPXldICYmICFVTUwgJiYgU05EIFs9eV0gJiYgU05EX1NPQyBbPXldICYmIFNORF9TT0Nf
SU5URUxfU1NUX1RPUExFVkVMIFs9eV0gJiYgUENJIFs9eV0gJiYgQUNQSSBbPXldCgoKPj4gwqDC
oMKgwqDCoCBzZWxlY3QgU05EX1NPQ19JTlRFTF9BUEwKPj4gwqDCoMKgwqDCoCBzZWxlY3QgU05E
X1NPQ19JTlRFTF9LQkwKPj4gwqDCoMKgwqDCoCBzZWxlY3QgU05EX1NPQ19JTlRFTF9HTEsKPj4g
QEAgLTEyMCw2ICsxMjAsNyBAQCBjb25maWcgU05EX1NPQ19JTlRFTF9TS1lMQUtFCj4+IMKgIGNv
bmZpZyBTTkRfU09DX0lOVEVMX1NLTAo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJTa3lsYWtlIFBs
YXRmb3JtcyIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFBDSSAmJiBBQ1BJCj4+ICvCoMKgwqAg
ZGVwZW5kcyBvbiBDT01NT05fQ0xLCj4+IMKgwqDCoMKgwqAgc2VsZWN0IFNORF9TT0NfSU5URUxf
U0tZTEFLRV9GQU1JTFkKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIElmIHlv
dSBoYXZlIGEgSW50ZWwgU2t5bGFrZSBwbGF0Zm9ybSB3aXRoIHRoZSBEU1AgZW5hYmxlZAo+PiAt
LS0gbG54LTUyLXJjMS5vcmlnL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvS2NvbmZpZwo+PiArKysg
bG54LTUyLXJjMS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL0tjb25maWcKPj4gQEAgLTI4Niw3ICsy
ODYsNyBAQCBjb25maWcgU05EX1NPQ19JTlRFTF9LQkxfUlQ1NjYzX01BWDk4OTI3Cj4+IMKgwqDC
oMKgwqAgc2VsZWN0IFNORF9TT0NfTUFYOTg5MjcKPj4gwqDCoMKgwqDCoCBzZWxlY3QgU05EX1NP
Q19ETUlDCj4+IMKgwqDCoMKgwqAgc2VsZWN0IFNORF9TT0NfSERBQ19IRE1JCj4+IC3CoMKgwqAg
c2VsZWN0IFNORF9TT0NfSU5URUxfU0tZTEFLRV9TU1BfQ0xLCj4+ICvCoMKgwqAgc2VsZWN0IFNO
RF9TT0NfSU5URUxfU0tZTEFLRV9TU1BfQ0xLIGlmIENPTU1PTl9DTEsKPiAKPiBhbmQgaGVyZSBJ
IHdvdWxkIG1ha2UgaXQgYSBkZXBlbmQuIEkgZ3Vlc3MgeW91ciBzb2x1dGlvbiBzb2x2ZXMgdGhl
IGNvbXBpbGF0aW9uIGJ1dCBkb2Vzbid0IGZ1bGx5IHJlcHJlc2VudCB0aGUgZmFjdCB0aGF0IHRo
aXMgbWFjaGluZSBkcml2ZXIgaXMgbm90IGZ1bmN0aW9uYWwgd2l0aG91dCBDT01NT05fQ0xLK1NL
WUxBS0VfU1NQX0NMSy4KCk5vdCBmdW5jdGlvbmFsIG9uIGlhNjQgYW55d2F5LiAgOikKCj4gCj4+
IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBUaGlzIGFkZHMgc3VwcG9ydCBmb3Ig
QVNvQyBPbmJvYXJkIENvZGVjIEkyUyBtYWNoaW5lIGRyaXZlci4gVGhpcyB3aWxsCj4+IMKgwqDC
oMKgwqDCoMKgIGNyZWF0ZSBhbiBhbHNhIHNvdW5kIGNhcmQgZm9yIFJUNTY2MyArIE1BWDk4OTI3
LgoKClRoYW5rcy4KLS0gCn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
