Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B0D4EA6
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2019 11:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 327CC1663;
	Sat, 12 Oct 2019 11:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 327CC1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570872872;
	bh=j4yrKixfJ97ChoQGYysKiD+38D1dQ+xM1tP5IMAk3dg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLWQ+dFTDoMyTr82w3BKr/QO5+9OY3pSPOVpJqADT62zqKajbi0xN3OWgCVvDnipU
	 9E29uzWJyiXYePYGttXSxojLoxpnG0002P133JCK+nMp0aUP4wIVnER4KHBExKj5a3
	 Pm+HTUBUtJ+JcI3M+5KrGZ+SA6VDil8+rDtKm6GU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CFE2F8045E;
	Sat, 12 Oct 2019 11:32:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDEF5F8038F; Sat, 12 Oct 2019 11:31:14 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C44F800DA
 for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2019 11:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C44F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L6MMDfB5"
Received: by mail-wr1-x444.google.com with SMTP id y18so4866809wrn.5
 for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2019 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AcTXCNHS6FvPkGjGv4LizSm+4C6wrpe7UW0p0LKLEdc=;
 b=L6MMDfB5FnBkL6lU/SyKP8oNyUy2cZC1rCdm2fXY74atxb+BThqwJcvzHX46wK8Voe
 JjhdJzaxcmDe6NHU8cv0lJc/waVJK9p6Gij90QwivutWeoU+97En8CV0eqDfEy0k3xSM
 sZ14+YGi/VH7APF9iPYmMekvstqtrmHrdis4YRQ4veTnPPF+oy5unxTnw8kv4da9Oy7N
 vZd0BOI6yfsm95B9MTEGo9PxDVHMahFXXK3EfSFCib8FwrCS1wQ2YC52Tur6KUzAzKGQ
 fDDvPH+9ge6tv0jKXPpR5lyCfOTBBmdsOO0vGAZfvhX4HARAG754CzPC3HLTbHqGKmD6
 yG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AcTXCNHS6FvPkGjGv4LizSm+4C6wrpe7UW0p0LKLEdc=;
 b=p9zf8dBaTddDar69xP18oM1/PRO+6UeEfxe+eijWh1Q/4f4wagrVF4wDDG7KWXqyT+
 LO7h1D4ez0PU3pFpFknuoN7zNshcwrMJE/1AXtBsQgsEn8UM0Vmau3WaHGXQeSasC3aY
 HStzkQFYEFpQsX/0bdt59Y2MiwDksrXtcVsJLix1h/eJUVmNdDODn6juDL5c1ayRwCev
 tG1QCyR131Kno07Cx6rvTssSpW+biNfNXde1ephgEJV14y518ELbIGA+SS5UOFG1ewQS
 4P1fT88V23XC3XVHGqw0Ollh6WTa5eSPKcghRRdMFuc1pLvq/yv1ShQQCcqxlr7/Y2Ac
 EpZw==
X-Gm-Message-State: APjAAAWaZ5sMCVp18hJ2+mFLI7/xLjWh4Bv+HW/m7R9+YwcHl+KUbFvD
 3NFGP+b/ANaDZhCSJeZ/Ar5ROW5ge1eMotbChNo=
X-Google-Smtp-Source: APXvYqyJlfXLsjaxaC1F0VwVaFNjqtC/FdrvIH9YKqxQ923yZQUj9VxwHrkvxR1ZEv6xc7DB+js7IcX+nlIz7ATVfs0=
X-Received: by 2002:adf:f452:: with SMTP id f18mr16322764wrp.187.1570872065702; 
 Sat, 12 Oct 2019 02:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZAen_Aa7SMdnPY4ezzbYtUypShto7ENGV_FhnsNhnxmBQ@mail.gmail.com>
 <CAFQqKeV+Q0vrHZDMniteEratq09p50CpQHHygJJLvCe+zSHA3Q@mail.gmail.com>
In-Reply-To: <CAFQqKeV+Q0vrHZDMniteEratq09p50CpQHHygJJLvCe+zSHA3Q@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Sat, 12 Oct 2019 12:20:53 +0300
Message-ID: <CAEnQRZCVdK+xhUuczg-LzUaTywcw5RzX3WbyXkfaJVvjyvSQpw@mail.gmail.com>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] Question about FE & BE DPCM
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

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMTI6NTcgQU0gU3JpZGhhcmFuLCBSYW5qYW5pCjxyYW5q
YW5pLnNyaWRoYXJhbkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIEZyaSwgT2N0IDExLCAy
MDE5IGF0IDI6MDUgUE0gRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiBIaSBNb3JpbW90by1zYW4sCj4+Cj4+IEknbSByZWFsbHkgY29uZnVzZWQgb24g
d2hhdCBleGFjdGx5IGlzIEZyb250IEVuZCBhbmQgQmFjayBFbmQuCj4+Cj4+IElzIEZFIGEgREFJ
IG9yIGEgREFJIGxpbmsgb3IgcGFydCBvZiBhIERBSSBsaW5rPwo+Pgo+PiBJbiBzaW1wbGUtY2Fy
ZC5jIHRoZXJlIGlzIHNpbXBsZV9kYWlfbGlua19vZl9kcGNtIGZ1bmN0aW9uOgo+Pgo+PiBzdHJ1
Y3Qgc25kX3NvY19kYWlfbGlua19jb21wb25lbnQgKmNvZGVjcyA9IGRhaV9saW5rLT5jb2RlY3M7
Cj4+Cj4+IMK7ICAgICAgIC8qIEJFIGlzIGR1bW15ICovCj4+IMK7ICAgICAgIMK7ICAgICAgIGNv
ZGVjcy0+b2Zfbm9kZcK7wrsgICAgICAgPSBOVUxMOwo+PiDCuyAgICAgICDCuyAgICAgICBjb2Rl
Y3MtPmRhaV9uYW1lwrsgICAgICAgPSAic25kLXNvYy1kdW1teS1kYWkiOwo+PiDCuyAgICAgICDC
uyAgICAgICBjb2RlY3MtPm5hbWXCuyAgIMK7ICAgICAgID0gInNuZC1zb2MtZHVtbXkiOwo+Pgo+
PiDCuyAgICAgICDCuyAgICAgICAvKiBGRSBzZXR0aW5ncyAqLwo+PiDCuyAgICAgICDCuyAgICAg
ICBkYWlfbGluay0+ZHluYW1pY8K7ICAgICAgwrsgICAgICAgPSAxOwo+PiDCuyAgICAgICDCuyAg
ICAgICBkYWlfbGluay0+ZHBjbV9tZXJnZWRfZm9ybWF0wrsgICA9IDE7Cj4+Cj4+IFNvLCBmcm9t
IGhlcmUgaXQgbG9va3MgbGlrZSBCRS9GRSBhcmUgY29tcG9uZW50cyBiZWluZyBwYXJ0IG9mIHRo
ZSBzYW1lIGxpbmsuCj4+Cj4+IEFub3RoZXIgdGhpbmcgaXM6Cj4+Cj4+IGFzb2Nfc2ltcGxlX2Nh
bm9uaWNhbGl6ZV9wbGF0Zm9ybSBmdW5jdGlvbiB3aGVyZSBpdCBkb2VzIHNheToKPj4KPj4gwrsg
ICAgICAgICogRFBDTSBCRSBjYW4gYmUgbm8gcGxhdGZvcm0uCj4+IMK7ICAgICAgICAqIEFsbG9j
ZWQgbWVtb3J5IHdpbGwgYmUgd2FzdGUsIGJ1dCBub3QgbGVhay4KPj4gwrsgICAgICAgICovCj4+
IMK7ICAgICAgIGlmICghZGFpX2xpbmstPnBsYXRmb3Jtcy0+b2Zfbm9kZSkKPj4gwrsgICAgICAg
wrsgICAgICAgZGFpX2xpbmstPm51bV9wbGF0Zm9ybXMgPSAwOwo+Pgo+PiBCdXQgSSBkbyB3YW50
IHRvIGNyZWF0ZSBhIEJFIHdpdGggYSBwbGF0Zm9ybS4gU28sIHNob3VsZCBJIHRyeSB0bwo+PiBy
ZXZlcnQgdGhlIGZvbGxvd2luZwo+PiBwYXRjaDoKPj4KPj4gY29tbWl0IDc5NGZjZWU4ZGEzYzBj
OGEwMWIwOGVjYWQxYzE4MWNiMGE2MjI4NjgKPj4gQXV0aG9yOiBLdW5pbm9yaSBNb3JpbW90byA8
a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4+IERhdGU6ICAgV2VkIEp1bCAxMCAx
NzowMToxMiAyMDE5ICswOTAwCj4+Cj4+ICAgICBBU29DOiBzaW1wbGUtY2FyZC11dGlsczogY2Fy
ZSBubyBQbGF0Zm9ybSBmb3IgRFBDTQo+Pgo+PiAgICAgY29tbWl0IDM0NjE0NzM5OTg4YWQgKCJB
U29DOiBzb2MtY29yZTogc3VwcG9ydCBkYWlfbGluayB3aXRoCj4+ICAgICBwbGF0Zm9ybXNfbnVt
ICE9IDEiKSBzdXBwb3J0cyBtdWx0aSBQbGF0Zm9ybSwgYW5kCj4+ICAgICBjb21taXQgOWYzZWI5
MTc1MzQ1MSAoIkFTb0M6IHNpbXBsZS1jYXJkLXV0aWxzOiBjb25zaWRlciBDUFUtUGxhdGZvcm0K
Pj4gICAgIHBvc3NpYmlsaXR5IikgcmVtb3ZlZCBubyBQbGF0Zm9ybSBmcm9tIHNpbXBsZS1jYXJk
Lgo+Pgo+PiAgICAgTXVsdGkgUGxhdGZvcm0gaXMgbm93IGNoZWNraW5nIGJvdGggUGxhdGZvcm0g
bmFtZS9vZl9ub2RlIGFyZSBOVUxMIGNhc2UuCj4+ICAgICBCdXQgaW4gbm9ybWFsIGNhc2UsIERQ
Q00gYmUgZG9lc24ndCBoYXZlIFBsYXRmb3JtLgo+Pgo+Pgo+Pgo+PiBCYXNpY2FsbHksIHdoYXQg
SSB3YW50IHRvIGRvIGlzOiBhZnRlciB0aGUgREFJIGxpbmsgaXMgY3JlYXRlZCB0byBjYWxsOgo+
PiBzbmRfc29jX2ZpeHVwX2RhaV9saW5rc19wbGF0Zm9ybV9uYW1lIGZ1bmN0aW9uIHRvIHNldCBh
IHByb3BlciBuYW1lCj4+IGZvciBCRSBwbGF0Zm9ybS4KPj4KPj4gVGhlIHByb2JsZW0gaXMgdGhh
dCBhYm92ZSBtZW50aW9uZWQgcGF0Y2ggc2V0cyBkYWlfbGluay0+bnVtX3BsYXRmb3JtcyA9IDA7
Cj4+IHNvIGV2ZW4gdGhlIG5hbWUgaXMgc2V0IHRoZSBwbGF0Zm9ybSBjb21wb25lbnQgaXMgbm90
IHByb2JlZC4KPgo+Cj4gSGkgRGFuaWVsLAo+IEhhdmUgeW91IGxvb2tlZCBpbnRvIGhvdyBTT0Yg
ZG9lcyBpdCBhdCB0aGUgdGltZSB0aGUgZGFpX2xpbmsgZWxlbSBpbiB0b3BvbG9neSBpcyBwYXJz
ZWQ/Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvYmxvYi81ZWRjZmRm
MzkwNzM1NGRlN2EyNjBhNDUxYmE2MTFmMjJjNWU2YTA3L3NvdW5kL3NvYy9zb2YvdG9wb2xvZ3ku
YyNMMjkyNgo+Cj4gSXMgdGhpcyB3aGF0IHlvdSBhcmUgYXNraW5nIGFib3V0PwoKSGkgUmFuamFu
aSwKCk5vdCByZWFsbHkuIER1ZSB0byB0aGlzIHBhdGNoOgoKQXV0aG9yOiBLdW5pbm9yaSBNb3Jp
bW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+CkRhdGU6ICAgV2VkIEp1bCAx
MCAxNzowMToxMiAyMDE5ICswOTAwCgogICAgQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6IGNhcmUg
bm8gUGxhdGZvcm0gZm9yIERQQ00KCkkgY2Fubm90IHByb2JlIHBsYXRmb3JtIGNvbXBvbmVudCBj
cmVhdGVkIGJ5IFNPRi4KCkV2ZW4gaWYgSSBzZXQgdGhlIGNvcnJlY3QgbmFtZSBmb3IgQkUncyBw
bGF0Zm9ybSBuYW1lIGJlY2F1c2UgdGhlCmFib3ZlIHBhdGNoIHNldHMKIGRhaV9saW5rLT5udW1f
cGxhdGZvcm1zID0gMCB0aGUgcGxhdGZvcm0gY29tcG9uZW50IHdvbid0IGJlIHByb2JlZC4KU28s
IHRoZSB0b3BvbG9neSB3b24ndCBiZSBsb2FkZWQuCgpJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGZ1
bGwgc3RvcnkgaGVyZS4gVGhlcmUgYXJlIHRoZXNlIDMgcGF0Y2hlczoKCigzKSA3OTRmY2VlOGRh
M2MgQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6IGNhcmUgbm8gUGxhdGZvcm0gZm9yIERQQ00KKDIp
IDlmM2ViOTE3NTM0NSBBU29DOiBzaW1wbGUtY2FyZC11dGlsczogY29uc2lkZXIgQ1BVLVBsYXRm
b3JtIHBvc3NpYmlsaXR5CigxKSA2ZjA0Mzc0NDU3MzUgQVNvQzogc2ltcGxlLWNhcmQtdXRpbHM6
IGRvbid0IHNlbGVjdCB1bm5lY2Vzc2FyeSBQbGF0Zm9ybQoKd2hpY2ggSSB0aGluayB0aGV5IGFy
ZSBkb2luZyBhcyBmb2xsb3dzOgoKKDEpIEFsbG93cyBhIERBSSBsaW5rIHRvIGhhdmUgbm8gcGxh
dGZvcm0gY29tcG9uZW50IGF0dGFjaGVkLgooMikgVGhlcmUgaXMgYW4gdXNlY2FzZSB3aGVyZSBQ
bGF0Zm9ybSBjYW4ndCBiZSBOVUxMLiBTbywgaWYKcGxhdGZvcm0tPm9mX25vZGUgaXMgTlVMTAp0
aGVuIGlzIHNldCB0byBwbGF0Zm9ybXMtPm9mX25vZGUgPSBjcHVzLT5vZl9ub2RlLgooMykgTm93
LCB0aGUgcHJvYmxlbSB3aXRoIHBhdGNoICgyKSBpcyB3aGVuIGFsc28gY3B1cy0+b2Zfbm9kZSBp
cwpOVUxMLiBJbiB0aGlzIGNhc2UKcGxhdGZvcm1zLT5vZl9ub2RlIGJlY29tZXMgTlVMTC4gQW5k
IHRoZSBwbGF0Zm9ybXMgaXMKbGVmdCB1bnNwZWNpZmllZCAoYmVjYXVzZSBwbGF0Zm9ybXMtPm5h
bWUgaXMgYWxzbyBOVUxMKS4gU28sIEkgdGhpbmsKKDMpIGlzIGp1c3QgYW4Kd29ya2Fyb3VuZCBi
eSBzZXR0aW5nIGxpbmstPm51bV9wbGF0Zm9ybXMgdGhlIGZ1bmN0aW9uIHNvY19iaW5kX2RhaV9s
aW5rIHdpbGwKYWN0dWFsbHkgc2tpcCBpdGVyYXRpbmcgb3ZlciBwbGF0Zm9ybXMuCgpNeSBzdWdn
ZXN0aW9uIGlzIHRoYXQgYXNvY19zaW1wbGVfY2Fub25pY2FsaXplX3BsYXRmb3JtIHNob3VsZCBh
bHNvCmNoZWNrIGlmIHBsYXRmb3JtIGhhcyBhIG5hbWUKYW5kIGluIHRoYXQgY2FzZSB0byBza2lw
IHplcm9pbmcgZGFpX2xpbmstPm51bV9wbGF0Zm9ybXMuCgpXaWxsIHNlbmQgYW4gUkZDLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
