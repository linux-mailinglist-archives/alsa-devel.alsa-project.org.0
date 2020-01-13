Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2513AA6C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:14:53 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01E51853;
	Mon, 13 Jan 2020 14:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01E51853
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A026DF801F8;
	Mon, 13 Jan 2020 14:59:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE44F801EB; Mon, 13 Jan 2020 14:59:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6C9BF800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 14:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C9BF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.de header.i=@yahoo.de
 header.b="iGY/ViGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1578923936; bh=N4wShNSwIN3DZVGJ1flJkDKgr5ceee1qifaGqxIzro8=;
 h=Subject:From:To:References:Date:In-Reply-To:From:Subject;
 b=iGY/ViGh0Gj8RZZDUGjodC5/x+eYuTc6tQENsiaITK6P031eJWNk0OKFKw4O6X9xyTyN02NNx9E47iz5/RkkXRYm3ST7e7ykCibQ9wI8Jbj6SJgaLCPlumsouowoRSR2iFhNWOZbZ/ELR2sQ9IAh1kJ4uTe/4H5Dk84VZ+6qr3+dMvVIJ0EvSAhZZYFk6vAmy+lhllCdIyLizdLgr31zpqyIET9JI6TK1okFjZ102nE28hBy9T4aeOtjYKYmTW3/psbsxtS1AL1u1vbS0eiNIb7zMNpz0uX65xRDwIMaFcqeRVi8srd1flXR8pPOnMSh/pXSVjdABcVg2p1eZb3ROg==
X-YMail-OSG: F3tWKb4VM1k9Er6J_hPtkH0OYadxV.P8wRWMegepMjx7aIFtfRThGY6EjfHgfo2
 0PsNeVKlmNYQ92.Upu4WqaBdDIU6f6.uV_3ur5frOLR4CSlAfBMTO_zXTF44ZtXL3DS7BG2vT3XR
 o4HjOjMWJPuYYN16mm2u4JvbOGsYKTm7NtdMFBUd_MDcMn7ZbndksyIWKAGKWdFqyjfb9wU1JTtj
 hDicUvAseaOWY5_JUC8jx3ZVXLXqgjSkaY2SZK9cBFerhsmVYNgJD1kjlCs2LG9sW6wpe8Jo7Yvd
 Zieh89LMX6gtf9A_HxfIGx9ZGeEzYaCmOTbk1lmX6UDm0Hf.i5UcPj4VJVt38Zf8KlVOVr.1J5yO
 KdmBQyTNkHfeKcP_EppXucrIzvZ4vUMm6PnDaDzT44aN0Yy1oLCWcNfsHhkdq40SuleFBlbyAc.S
 EQt.T6OdbEyJEHCtSETeVv0f4DuioedroggVmzXbtmW3_K1AFnzC9bTP7wyCIQrEt0Dtqcn6a_Zc
 dCXPuJq2NGTfMw1rZ2kztFD1UE865lVCE45OUHybj3PVAAemsM8Cb92fBu2du7bCvVGaU.35Hq4R
 25k_ey1G7YYJ5J4ZqhjAVQvqpF3.d1PPYVUlwk.a0o.5KBT.og6PQjNbKWLmrIDnpD.94oO2aC67
 fPO1dD488Oz.4Hyer.TzmHkFO5htFhEZN.lj3hBGspoLNqA5YixtTWUmoD1ujMEOLdFi.v0oeMmf
 O2iV43xAwoBy2apL98OHee1trMe6GbdWM.Y3afKgjPQJHpQUNK2NMfImAG8Yu_zplDRsiDeE5y0x
 5fLjmqYM506sanfFRWuPSRyY0goPswF9EeOzIXuF7jAbf8oXNz426RZJCsvkPHHEQhpwFkS3twan
 hhw5VRvPNs72gOeeqHE5j6Zap3YKZKOjtcBMchhZU6O7WsbUWwPN0xL03dwBT48oGX.sSmd59HRB
 0dOKGWfusjqGKZGsY6MLXAG5DqjYWPvrJiJXAKw3AJ883DuL50OfcAJBNQqyCargK9mJWlOQmQup
 IFcazBjudiy1dRptKywh1aVBxO84cFl7ZWpXmqsu1hpYr2tq8FoNsVvgg46yB7zM1AHE0IzRN2Cg
 lxEtPYvXtSi3E1.xLiRnU4CyosnfgN5XDSXpfOKDsSctCRvybJpNHLgsMrJbF4slW6jBrIv1T4yz
 qCy15QG.SWNDedRdZXfobMcuEFcx1Ljakc17RMA_QSDulPIaXLzHNlX_2mqj1sumpcvHvYD_43Xe
 I6e1JFsX76tYpD09SOJN_opIIU1ZU9ZXwGXrRmFDakAZOzMrChUETJD8sEpPXJBJZfzR.LQ2PVm9
 2niSFQq1GmsJ5ofwVnRnyhYegiH4DiT25hapxTz6gjSv7qeRyl274_Q19QGGVwnOubqUwbaPJM3Q
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Mon, 13 Jan 2020 13:58:56 +0000
Received: by smtp413.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 7f2295bad415329f1eee64ebe26b55bf; 
 Mon, 13 Jan 2020 13:58:53 +0000 (UTC)
From: Tobias <toszlanyi@yahoo.de>
To: alsa-devel@alsa-project.org
References: <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
Message-ID: <8653a13c-ef08-4e0f-8375-baa6a3b4faa8@yahoo.de>
Date: Mon, 13 Jan 2020 14:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9457db14-4084-c0dd-5c89-821b35c3db66@yahoo.de>
Content-Language: en-US
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
Subject: Re: [alsa-devel] USB Audio Interface / Denon MC7000 and MC8000
	controller
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGVsbG8gZGVhciBBTFNBIGRldmVsb3BlcnMgLSBpcyB0aGVyZSBhbnkgY2hhbmNlIHRvIGdldCB0
aGUgRGVub24gTUM3MDAwIAphbmQgTUM4MDAwIFVTQiBBdWRpbyBkZXZpY2VzIHN1cHBvcnRlZD8g
U2VlIHByZXZpb3VzIG1lc3NhZ2UgZm9yIGRldGFpbHMuCgpUaGFua3MgYSBsb3QKVG9iaWFzCgoK
CkFtIDE0LjEyLjE5IHVtIDA5OjI0IHNjaHJpZWIgVG9iaWFzOgo+IEhlbGxvIGRlYXIgQUxTQSBk
ZXZlbG9wZXJzLgo+Cj4gSSBoYXZlIHB1cmNoYXNlZCBhIE1DNzAwMCBjb250cm9sbGVyIGluIG9y
ZGVyIHRvIGNvbnRyb2wgTUlYWFggb24gCj4gVWJ1bnR1IDE2LjA0LiBBY2NvcmRpbmcgdG8gdGhl
IERlbm9uIHNwZWNpZmljYXRpb24gdGhlIGNvbnRyb2xsZXIgCj4gc2hvdWxkIGhhdmUgYmVlbiBj
bGFzcyBjb21wbGlhbnQgYnV0IHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggdGhlIEF1ZGlvIAo+IGlu
dGVyZmFjZSB0byB3b3JrIHByb3Blcmx5IGdpdmluZyBmb2xsb3dpbmcgbWVzc2FnZSAuLi4KPgo+
ICQgZG1lc2cKPiAuLi4KPiB8W8KgIMKgNzQuNTIyODMxXSB1c2IgMS0xLjM6IG5ldyBoaWdoLXNw
ZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDYgdXNpbmcgCj4geGhjaV9oY2QKPiBbwqAgwqA3NC42MjM3
ODRdIHVzYiAxLTEuMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTE1ZTQsIAo+IGlk
UHJvZHVjdD04MDA0Cj4gW8KgIMKgNzQuNjIzNzg5XSB1c2IgMS0xLjM6IE5ldyBVU0IgZGV2aWNl
IHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIAo+IFNlcmlhbE51bWJlcj0zCj4gW8KgIMKgNzQu
NjIzNzkzXSB1c2IgMS0xLjM6IFByb2R1Y3Q6IERFTk9OIERKIE1DNzAwMAo+IFvCoCDCoDc0LjYy
Mzc5Nl0gdXNiIDEtMS4zOiBNYW51ZmFjdHVyZXI6IERFTk9OIERKCj4gW8KgIMKgNzQuNjIzNzk4
XSB1c2IgMS0xLjM6IFNlcmlhbE51bWJlcjogMjAxNjAzCj4gW8KgIMKgNzQuNjI1MTM0XSB1c2Ig
MS0xLjM6IGNsb2NrIHNvdXJjZSA2NSBpcyBub3QgdmFsaWQsIGNhbm5vdCB1c2UKPgo+ICJ8fHxj
bG9jayBzb3VyY2UgNjUgaXMgbm90IHZhbGlkLCBjYW5ub3QgdXNlIiBpcyByZXBlYXRlZCB1bmNv
dW50YWJsZSAKPiB0aW1lcyB0aGVuCj4KPgo+IHxJIGZvdW5kIGEgZGlzY3Vzc2lvbiBoZXJlIGZv
ciB0aGUgTUM4MDAwIEF1ZGlvIGludGVyZmFjZSB3aGljaCB3YXMgCj4gbm90IHdvcmtpbmcgYW5k
IHNob3dpbmcgdGhlIHNhbWUgZXJyb3IgbWVzc2FnZToKPgo+IGh0dHBzOi8vYWxzYS11c2VyLm5h
cmtpdmUuY29tLzJ0REFPODdmL3Ryb3VibGVzaG9vdGluZy1uZXctdXNiLWF1ZGlvLWRldmljZSNw
b3N0OCAKPgo+Cj4gVGhlIHNvbHV0aW9uIHdhcyB0byBjaGFuZ2Ugc291bmQvdXNiL2Nsb2NrLmMg
YW5kIHJlY29tcGlsZSB0aGUga2VybmVsLgo+IFRoaXMgaXMgbm90IHByYWN0aWNhbCBmb3IgZGFp
bHkgdXNlIGNhc2Ugc28gSSB3b3VsZCBsaWtlIHRvIGFzayBpZiB0aGUgCj4gQUxTQSB0ZWFtIGNv
dWxkIHBvc3NpYmx5IGZpbmQgYSBwZXJtYW5lbnQgZml4IGZvciBvcmRpbmFyeSB1c2Vycy4KPgo+
IFRvIGdldCBteSBvdXRwdXRzIGZvcgo+Cj4gYXBsYXkgLWwKPiBhcGxheSAtTAo+IHx8fGFwbGF5
IC1EIHBsdWdodzpDQVJEPU1DNzAwMCxERVY9MCBHcmltbWFsZGlrYS1NYWtlQmVsaWV2ZS53YXYK
PiB8bHN1c2IgLXYKPiBtaXh4eCAtLWNvbnRyb2xsZXJEZWJ1Z3x8Cj4gSmFja1NlcnZlciBlcnJv
ciBtZXNzYWdlfAo+Cj4geW91IG1heSBoYXZlIGEgbG9vayBhdCB0aGUgTWl4eHggQ29tbXVuaXR5
IEZvcnVtcyBoZXJlKGp1c3Qgb24gcGFnZSwgCj4geW91IGRvbid0IG5lZWQgdG8gZmluZCBhbmQg
cmVhZCBvbiBtdWx0aXBsZSBwYWdlcykKPgo+IGh0dHBzOi8vd3d3Lm1peHh4Lm9yZy9mb3J1bXMv
dmlld3RvcGljLnBocD9mPTcmdD0xMjk2MiZzdGFydD0xMAo+Cj4gSWYgeW91IG5lZWQgYW55IG1v
cmUgaW5mb3JtYXRpb24gdGhlbiBwbGVhc2UgbGV0IG1lIGtub3cuCj4KPiBUaGFua3MgYSBsb3Qg
Zm9yIHlvdXIgc3VwcG9ydCBvbiB0aGlzIG1hdHRlci4KPgo+IENoZWVycyEKPiBPc1oKPiB8fAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
