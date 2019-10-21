Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09FDEE8C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 15:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0AA1165F;
	Mon, 21 Oct 2019 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0AA1165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571666346;
	bh=670rtFM1hMCXsl7D8DdpuNx/cVJECu8NRCG1yWaPQZg=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=kMoWXOWKOdME+Qg7CsTsCzRuC9shP93iKCk9x7slZ2sdjqJ2IObuGFqZ5FneYPZtB
	 xxSOc14Awt4rGjptQMk96QGUABvbo5/v9izp9MRtn3zNY81xCb+XEFtRJm4NwgYFvk
	 nSIJN17MdgxsoydkUZ0w+gpqFA7o2hB2RZ9HmYBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0898AF80393;
	Mon, 21 Oct 2019 15:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DD09F80368; Mon, 21 Oct 2019 15:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic314-19.consmr.mail.ir2.yahoo.com
 (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A794FF800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 15:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A794FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="HTeMcXhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571666236; bh=u/PrNqm/NQDOUmyCEHox9WFE19qXMbD8N8LETnSRN3c=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=HTeMcXhuRyivp4mIB6vxNVqzNKaPdm2OECBYfw83y70bywdi23HktrTt3pJcX/m84jR+jMCxeovq+qWvDGphEwpK9kGlAmQBgqqGTr3UeGfOb/kGDxTk5dqzKiis5yDNnFtXayAII0IgXGGA+fAPTo+MmOl876uAUmWvZVucsElpLdIKo3ZLrkscB+uMxs9F09iByOSm25D7mtUKANQC03DYKbFVVYuOhw6LfegiNkBlsWOrlT1ASLVyFh8Wxx4xolz7bWGVYN7vjGci4O68OCZu/6KMM80m/5TRUrtzEx9O617VYdG9Gumfpbr+pC/blVc3M4TsCGSd1KKyhKpB7Q==
X-YMail-OSG: llPNg.MVM1nAVXdxcJ7l4cKMk6RtZmRchuwropRCGj5TUY7N06YKHBx6LtTAsG2
 9Nkg.6Fxrbta2Z1a3pbjAmZmYAYzHN8EJNpJPIyDbH3jLXxjYt0Of_QBUA3i9vSwHc7QKRv5nFLR
 OSh8AsVB_K91zj8lgJEjjkdl3WUje7ICq9iGvIlCDvhPlrvCjclA.5_VYuCUjzPDN71KEbvHVDCC
 CxeUMvv0VD.1G3kKsUHDI3hrO75XwUBVRjRfV1vrQCMYnEjIk8Gxpf0WS.duRa6zO_Cdop7jlrqO
 QwOrRjtR.Gxyc50Cja5AfADvFTW83riDWNVrlTPWuTh_iEFt4zFqsAEq3vAJ1PT3a1MrFJsQsxtv
 7t1wnSA3kHkpMGBE7zUhzYSMqms7JpRyu.f3bW6gNumtk3g8PTm1HoSpYmCXCnO.xO5CdApoCNPZ
 Szq0p1s5We0cunUGp7.fJkphF5ylKbJ.M2tkr3vH5VHzi.aX38sJTQaKT71UwgPNF0eEgn5QXKWU
 we4Om5.2W05dshtmWTc0y0Qc3K3f_AL2F.gmLeW_J_PirsgQWs35682Wb3dadYk299fuJyzBjYdM
 KOtcvYB40mv7TVhr4C7KfuqT1niivnR9ppYIvmelQcqqKFbdtqGirxiLZvIsHSec3hpBHV5QClcH
 _BTSMQw_kcrhZk7n49qyBYUroo2aPaK4TU6sAjuCM04Kq2H5cZ7thaS_FbkkNdHkaGdZKTFvOfl8
 WFzz1hJ5ljkK0a7.l2pH8Grl4horiiTdWvHKcoGIPMaySnI7t3VAt3LmPmouAWbDYx_BqhHUUIuR
 iWXMSTzy4uDMnN7FhhkYewZRz8RurlHkOU.HlF5ZYT9j5_knW6OvWtrGiHPG2ruA4zgGSK8.0aF4
 tv9AHfNMiyqcWU96VtAHBjh0W8vzrrfGcu.6hxoQsmaUMod0TqyUdDru20y_bFfoBcCaTfJ6CJpM
 d5NJLbuA2wkpigBHoT69PAp2w6jTIjGpOeQgguRjOQy4pRaWAnW4W25GfWkJu6JB4X5rI2CM4LVc
 xfi5YliAFQiuZliTY0ieB2RbVHI2lmsBwHN3cqvAAx_JLx.SzbGms_Z8uEzVqsHwLkaENeBVKSNn
 0N2ptP_rU8yyxowuylh.HXGd4RYi.G4Fn617kLovIm3PsO7rdzXPuDVgDV465Z3uuFOKG1mhgtGq
 PaB9klIpR3GFnCZmtVtBvPsRbVfp9h2aDlHIxvR8NvvbeDAbENDqKikdf6x6ZER6LRVUMUbLWOat
 .WFqZ4Ld8qaNRaB6ptXVQAHIAA8HvvuvwbQ3piC0VcwpDdAjxmEKoIIbOqjq1EdfPQfrJXgZDIK8
 iD1YZm7T5rxsfDZfBS5CK_Ulu8GwjuTOejh3Wauw-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Mon, 21 Oct 2019 13:57:16 +0000
Date: Mon, 21 Oct 2019 13:57:11 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <43747502.7351282.1571666231987@mail.yahoo.com>
In-Reply-To: <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
 <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
 (and works for capture)
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

IE9uIFN1bmRheSwgMjAgT2N0b2JlciAyMDE5LCAxMTo1MTo0MiBCU1QsIFl1LUhzdWFuIEhzdSA8
eXVoc3VhbkBjaHJvbWl1bS5vcmc+IHdyb3RlOgoKCj4gSGkgSGluLVRhaywKPiBNYXliZSBpdCBp
cyBub3QgdGhlIGNvcnJlY3QgcGNtIG5hbWUuwqAgSSBndWVzcyB0aGUgY29ycmVjdCBvbmUgaXMK
PiAiaHc6c2VlZWQ4bWljdm9pY2VjLDAiLiBDb3VsZCB5b3UgdHJ5IGl0Pwo+IEJ5IHRoZSB3YXks
IHlvdSBjYW4gYWxzbyB1c2UgYXBsYXkgLUQge2RldmljZV9uYW1lfSB0byBtYWtlIHN1cmUKPiB3
aGV0aGVyIHRoZSBuYW1lIGlzIGNvcnJlY3Qgb3Igbm90LgoKPiBCZXN0LAo+IFl1LUhzdWFuCgpE
ZWFyIFl1LUhzdWFuLAoKTm8gImh3OnNlZWVkOG1pY3ZvaWNlYywwIiBkaWQgbm90IHdvcmsgYXMg
aW5wdXQgdG8gdGhlIGNvbmZvcm1hbmNlIHRlc3QuIEFzIGlucHV0IHRvICdhcGxheSAtRCcsIGJv
dGggdGhlICwwIGFuZCB3aXRob3V0IGl0IHNvcnQgb2Ygd29ya3MuCihpdCB3YWl0cyBmb3IgaW5w
dXQgZnJvbSBzdGRpbikuCgpXaGVuIEkgYWN0dWFsbHkgZ2F2ZSBpdCBhbiBjaGFubmVsIGZpbGUg
dG8gcGxheSwgYm90aCBmb3JtcyAoJ2FwbGF5IC1EIGh3OkNBUkQ9c2VlZWQ4bWljdm9pY2VjIC4u
LicgYW5kICdhcGxheSAtRCBodzpDQVJEPXNlZWVkOG1pY3ZvaWNlYywwIC4uLicpIHN0b3BwZWQg
d2l0aDoKClBsYXlpbmcgV0FWRSAnVW50aXRsZWQgcmVjb3JkaW5nIDIwMTktMTAtMTEgMTkuMTUu
MTEud2F2JyA6IFNpZ25lZCAxNiBiaXQgTGl0dGxlIEVuZGlhbiwgUmF0ZSAxNjAwMCBIeiwgQ2hh
bm5lbHMgNgphcGxheTogc2V0X3BhcmFtczoxMzM5OiBTYW1wbGUgZm9ybWF0IG5vbiBhdmFpbGFi
bGUKQXZhaWxhYmxlIGZvcm1hdHM6Ci0gUzMyX0xFCgpUaGUgaW50ZXJlc3RpbmcgcGFydCBvZiAn
YXBsYXkgLUwnIGlzICh0aGVyZSBpcyBhbm90aGVyIGRldmljZSk6CgpzeXNkZWZhdWx0OkNBUkQ9
c2VlZWQ4bWljdm9pY2VjCiBzZWVlZC04bWljLXZvaWNlY2FyZCwgCiBEZWZhdWx0IEF1ZGlvIERl
dmljZQpkbWl4OkNBUkQ9c2VlZWQ4bWljdm9pY2VjLERFVj0wCiBzZWVlZC04bWljLXZvaWNlY2Fy
ZCwgCiBEaXJlY3Qgc2FtcGxlIG1peGluZyBkZXZpY2UKZHNub29wOkNBUkQ9c2VlZWQ4bWljdm9p
Y2VjLERFVj0wCiBzZWVlZC04bWljLXZvaWNlY2FyZCwgCiBEaXJlY3Qgc2FtcGxlIHNub29waW5n
IGRldmljZQpodzpDQVJEPXNlZWVkOG1pY3ZvaWNlYyxERVY9MAogc2VlZWQtOG1pYy12b2ljZWNh
cmQsIAogRGlyZWN0IGhhcmR3YXJlIGRldmljZSB3aXRob3V0IGFueSBjb252ZXJzaW9ucwpwbHVn
aHc6Q0FSRD1zZWVlZDhtaWN2b2ljZWMsREVWPTAKIHNlZWVkLThtaWMtdm9pY2VjYXJkLCAKIEhh
cmR3YXJlIGRldmljZSB3aXRoIGFsbCBzb2Z0d2FyZSBjb252ZXJzaW9ucwp1c2JzdHJlYW06Q0FS
RD1zZWVlZDhtaWN2b2ljZWMKIHNlZWVkLThtaWMtdm9pY2VjYXJkCiBVU0IgU3RyZWFtIE91dHB1
dAoKQXMgSSBtZW50aW9uZWQgYXQgdGhlIGJlZ2lubmluZywgJ2FyZWNvcmQgLUwnIGFuZCBydW5u
aW5nIHRoZSBjb25mb3JtYW5jZSB0ZXN0IGluIENBUFRVUkUgbW9kZSB1c2luZyAnaHc6Q0FSRD1z
ZWVlZDhtaWN2b2ljZWMnIHdvcmtzLiBJdCBpcyBQTEFZQkFDSyB3aGljaCBkb2VzIG5vdC4KClJl
Z2FyZHMsCkhpbi1UYWsKCgoKCiAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
