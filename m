Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B743D35E31
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0BE166C;
	Wed,  5 Jun 2019 15:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0BE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742252;
	bh=wLdkgbvxruG0F+dGEFCS4gN1KK65E+OLSdfricC4nwQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vGcvR8dsqyVIG9iZGgBFwvHYg7XCLKm3upMhAGpgLJ3yPAWQFp2gTR0J/Jd6gO3yf
	 fLBNyhnHLSHGbS4ioD35NZXOam3e09dDRcYoCiEXHCt0PQmIMK9adBLrfCkgcHr1l7
	 V4wrIt6rly+r1PIKvshXItuzxn3M30+zhyZaL+vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D61F896DD;
	Wed,  5 Jun 2019 15:42:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C81F896ED; Wed,  5 Jun 2019 15:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A91D2F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A91D2F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:17 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:14 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:42 +0200
Message-Id: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/14] Fix driver reload issues
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

SGksCgpUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGludHJvZHVjZXMgZml4ZXMgdG8gdmFyaW91cyBp
c3N1ZXMgZm91bmQgd2hpbGUKdHJ5aW5nIHRvIHVubG9hZCBhbGwgc25kKiBtb2R1bGVzIGFuZCB0
aGVuIGxvYWRpbmcgdGhlbSBhZ2Fpbi4gVGhpcwphbGxvd3MgZm9yIG1vZHVsZXMgdG8gYmUgcmVh
bGx5IF9tb2R1bGVzXyBhbmQgYmUgdW5sb2FkZWQgYW5kIGxvYWRlZCBvbgpkZW1hbmQsIG1ha2lu
ZyBpdCBlYXNpZXIgdG8gZGV2ZWxvcCBhbmQgdGVzdCB0aGVtIHdpdGhvdXQgY29uc3RhbnQKc3lz
dGVtIHJlYm9vdHMuCgpUaGVyZSBhcmUgc29tZSBmaXhlcyBpbiBmbG93LCBlaXRoZXIgd2UgZG9u
J3QgaW5pdGlhbGl6ZSB0aGluZ3MgYmVmb3JlCmNsZWFuaW5nIHRoZW0gdXAsIGNsZWFuIHVwIGlu
IHdyb25nIHBsYWNlcyBvciBkb24ndCBjbGVhbiB1cCBhdCBhbGwuCk90aGVyIHBhdGNoZXMgZml4
IG1lbW9yeSBtYW5hZ2VtZW50IHByb2JsZW1zLCBtb3N0bHkgdGhpbmdzIGFyZSBub3QKYmVpbmcg
ZnJlZWQuIEFuZCBmaW5hbGx5IHRoZXJlIGlzIGZldyBtaXNjZWxsYW5lb3VzIHBhdGNoZXMsIHBs
ZWFzZQpyZWZlciB0byBzcGVjaWZpYyBwYXRjaGVzIHRvIHNlZSB3aGF0IHRoZXkgZG8uCgpUaGlz
IHNlcmllcyB3YXMgdGVzdGVkIG9uIFNLTCwgQlhULCBHTEsgJiBLQkwuCgpTbWFsbCBub3RlOgpQ
YXRjaCAyIGluIHRoaXMgc2VyaWVzIHdhcyBhbHJlYWR5IHNlbmQgdG8gdGhpcyBsaXN0IGFsb25n
IHdpdGggU09GCmNvdW50ZXJwYXJ0LCBob3dldmVyIGl0IHNlZW1zIHRoYXQgdGhlcmUgaXMgc29t
ZSBwcm9ibGVtOgpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9waXBlcm1haWwvYWxz
YS1kZXZlbC8yMDE5LU1heS8xNDk2MzguaHRtbAphbmQgcmVsYXRlZCBwYXRjaCBvbiBTT0Ygc2lk
ZSAod2l0aCBkaXNjdXNzaW9uKToKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlw
ZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOS1NYXkvMTQ5NjQwLmh0bWwKSXQgaXMgaW5jbHVkZWQgaW4g
dGhpcyBwYXRjaHNldCBmb3IgY29tcGxldGVuZXNzLgoKQW1hZGV1c3ogU8WCYXdpxYRza2kgKDE0
KToKICBBU29DOiBJbnRlbDogU2t5bGFrZTogSW5pdGlhbGl6ZSBsaXN0cyBiZWZvcmUgYWNjZXNz
IHNvIHRoZXkgYXJlIHNhZmUKICAgIHRvIHVzZQogIEFMU0E6IGhkYWM6IGZpeCBtZW1vcnkgcmVs
ZWFzZSBmb3IgU1NUIGFuZCBTT0YgZHJpdmVycwogIEFMU0E6IGhkYWM6IEZpeCBjb2RlYyBuYW1l
IGFmdGVyIG1hY2hpbmUgZHJpdmVyIGlzIHVubG9hZGVkIGFuZAogICAgcmVsb2FkZWQKICBBU29D
OiBjb21wcmVzczogRml4IG1lbW9yeSBsZWFrIGZyb20gc25kX3NvY19uZXdfY29tcHJlc3MKICBB
U29DOiBJbnRlbDogU2t5bGFrZTogRG9uJ3QgcmV0dXJuIGZhaWx1cmUgb24gbWFjaGluZSBkcml2
ZXIgcmVsb2FkCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IFJlbW92ZSBzdGF0aWMgdGFibGUgaW5k
ZXggd2hlbiBwYXJzaW5nIHRvcG9sb2d5CiAgQVNvQzogSW50ZWw6IFNreWxha2U6IEFkZCBmdW5j
dGlvbiB0byBjbGVhbnVwIGRlYnVnZnMgaW50ZXJmYWNlCiAgQVNvQzogSW50ZWw6IFNreWxha2U6
IFByb3Blcmx5IGNsZWFudXAgb24gY29tcG9uZW50IHJlbW92YWwKICBBU29DOiBJbnRlbDogU2t5
bGFrZTogRml4IE5VTEwgcHRyIGRlcmVmZXJlbmNlIHdoZW4gdW5sb2FkaW5nIGNsayBkZXYKICBT
b0M6IHJ0Mjc0OiBGaXggaW50ZXJuYWwgamFjayBhc3NpZ25tZW50IGluIHNldF9qYWNrIGNhbGxi
YWNrCiAgQVNvQzogY29yZTogVGVsbCBjb2RlYyB0aGF0IGphY2sgaXMgYmVpbmcgcmVtb3ZlZAog
IEFTb0M6IEludGVsOiBoZGFjX2hkbWk6IFNldCBvcHMgdG8gTlVMTCBvbiByZW1vdmUKICBBU29D
OiB0b3BvbG9neTogQ29uc29saWRhdGUgaG93IGR0ZXh0cyBhbmQgZHZhbHVlcyBhcmUgZnJlZWQK
ICBBU29DOiB0b3BvbG9neTogQ29uc29saWRhdGUgYW5kIGZpeCBhc29jX3RwbGdfZGFwbV93aWRn
ZXRfKl9jcmVhdGUKICAgIGZsb3cKCiBzb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jICAgICAg
ICAgICB8ICAxMiArKy0KIHNvdW5kL3NvYy9jb2RlY3MvaGRhY19oZG1pLmMgICAgICAgICAgIHwg
ICA2ICsrCiBzb3VuZC9zb2MvY29kZWNzL3J0Mjc0LmMgICAgICAgICAgICAgICB8ICAgMyArLQog
c291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMgICAgfCAgIDkgKysKIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyAgICAgIHwgIDE2ICsrLS0KIHNvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC1zc3AtY2xrLmMgIHwgIDE2ICsrLS0KIHNvdW5kL3NvYy9pbnRlbC9za3ls
YWtlL3NrbC10b3BvbG9neS5jIHwgIDUwICsrKysrKy0tLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtdG9wb2xvZ3kuaCB8ICAgMiArCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wu
YyAgICAgICAgICB8ICAgNyArLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmggICAgICAg
ICAgfCAgIDUgKysKIHNvdW5kL3NvYy9zb2MtY29tcHJlc3MuYyAgICAgICAgICAgICAgIHwgIDE3
ICsrLS0KIHNvdW5kL3NvYy9zb2MtY29yZS5jICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHNv
dW5kL3NvYy9zb2MtdG9wb2xvZ3kuYyAgICAgICAgICAgICAgIHwgMTE0ICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIDEzIGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAxMTUgZGVs
ZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
