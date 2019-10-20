Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D4DDE28
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 12:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46C31655;
	Sun, 20 Oct 2019 12:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46C31655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571568802;
	bh=v+18+xyZbOB/2FC6nHTk2efM3zkCZ5bzQd4W1jxFbFo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dn6lC8dOmwV55CsiJxlyAghyNkao9svr0R9UcelW3vSTOvQKZRGLCnKSHbSkA2Ws0
	 VmfZmOPTOyOFU9JdyCSVYGpM8nggonLPrcM8iKqTlnLjDuqplPyeREnBOxc4aCSQxw
	 AJsBct+M6On0OZi6K09tBuJWVePKnpWPSky2FUts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 747D9F80377;
	Sun, 20 Oct 2019 12:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79AF9F80322; Sun, 20 Oct 2019 12:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F24F80112
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 12:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F24F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mw1chBbb"
Received: by mail-wr1-x42b.google.com with SMTP id o15so10231283wru.5
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oUuf43YoxvTtOwV1beGoW4wTIofejC1qztkBg16dIHQ=;
 b=mw1chBbbCQO3rL6EgmY00keeY2SaJen3/h7FD0nrM/weg9xaQooy1/mBX7XkUJy4TM
 ZUbGS1QVAPXT/h3wEOjI1IJOhwzA+1ndrqHw7HAjXVl7Nvy0jHBLNPz0ez9AvlsY1d1O
 sMF6g4n6EqYp8M6HQ9OmTncnwfefxgVDNo5B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oUuf43YoxvTtOwV1beGoW4wTIofejC1qztkBg16dIHQ=;
 b=o7elinh2RtqVV27pPRsWRVpwzFEv8EOIFz27qIeqU+236zmC9ZrPIe7qWyJwr/z7Wb
 S2G6Fku/CRzBCGDbJ5whjdFgD+4lgXwSZvZWGL44MdEMT6uSDF/0ZYGfGaMdHgyJzUh3
 gTT31u3YBRSzTpocq008+H0ZAVKon57NkeQLV3DXNj7EQNEZhGTdkUPKBIO4SW6eyhDY
 rUc+8eR5qX/NuSr9GVoC+R+mtOawQEk44DtCKMFBPtZwVlW4TPUHIWDvrcfw1D6yL2nt
 HufaLxYnAtOPsqM2eLmPZxRPlBE/ZkMCTivBBHPB0Ar6lXsqnjMsCiTYh3LrL0+fC+ae
 QTyg==
X-Gm-Message-State: APjAAAWWpLCBt1Ng2x5rrfcpV723LBqtucdwMmq5Y/q8PW12q/Z++u/z
 gkdPnvsWqC0B/SdIiEtkamyoaFs6RVjG1hCPXhcH2g==
X-Google-Smtp-Source: APXvYqy0+2o1FEvVHqZJot2mjE7wVQ4ewGm0b+/veuhn2rdkBTBFtbPn6zRyBzK8pacYVmOGZyxej1KKzdtbzcInVyU=
X-Received: by 2002:adf:f7c6:: with SMTP id a6mr14598704wrq.272.1571568692157; 
 Sun, 20 Oct 2019 03:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
In-Reply-To: <572375501.5493214.1571396197926@mail.yahoo.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sun, 20 Oct 2019 18:51:21 +0800
Message-ID: <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
To: htl10@users.sourceforge.net
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgSGluLVRhaywKTWF5YmUgaXQgaXMgbm90IHRoZSBjb3JyZWN0IHBjbSBuYW1lLiAgSSBndWVz
cyB0aGUgY29ycmVjdCBvbmUgaXMKImh3OnNlZWVkOG1pY3ZvaWNlYywwIi4gQ291bGQgeW91IHRy
eSBpdD8KQnkgdGhlIHdheSwgeW91IGNhbiBhbHNvIHVzZSBhcGxheSAtRCB7ZGV2aWNlX25hbWV9
IHRvIG1ha2Ugc3VyZQp3aGV0aGVyIHRoZSBuYW1lIGlzIGNvcnJlY3Qgb3Igbm90LgoKQmVzdCwK
WXUtSHN1YW4KCkhpbi1UYWsgTGV1bmcgPGh0bDEwQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4g5pa8
IDIwMTnlubQxMOaciDE45pelIOmAseS6lCDkuIvljYg2OjU25a+r6YGT77yaCj4KPiA+IE9uIEZy
aWRheSwgMTggT2N0b2JlciAyMDE5LCAwNDoyNzoyOSBCU1QsIFl1LWhzdWFuIEhzdSA8eXVoc3Vh
bkBnb29nbGUuY29tPiB3cm90ZToKPgo+ID4gSG93IGFib3V0IHVzaW5nIGluZGV4IGluc3RlYWQ/
IFlvdSBzaG91bGQgZmluZCB0aGUgY2FyZCBpbmRleCBhbmQgZGV2aWNlIGluZGV4IGJ5IHJ1bm5p
bmcgImFwbGF5IC1sIiBjb21tYW5kLiBUaGUgcGNtIGZvcm1hdCBpcyBodzp7Q0FSRF9JTkRFWH0s
e0RFVklDRV9JTkRFWH0uCj4gPiBTZWUgZXhhbXBsZSBwYXJ0IGluIGh0dHBzOi8vY2hyb21pdW0u
Z29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3BsYXRmb3JtL2F1ZGlvdGVzdC8rL3JlZnMvaGVh
ZHMvbWFzdGVyL2Fsc2FfY29uZm9ybWFuY2VfdGVzdC5tZCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4K
Pgo+IERlYXIgWXUtSHN1YW4sCj4KPiBZZXMsIHVzaW5nIGNhcmQgaW5kZXggYW5kIGRldmljZSBp
bmRleCB3b3Jrcy4gSGVyZSBpcyB0aGUgb3V0cHV0Ogo+Cj4gJCBhcGxheSAtbAo+ICoqKiogTGlz
dCBvZiBQTEFZQkFDSyBIYXJkd2FyZSBEZXZpY2VzICoqKioKPiBjYXJkIDA6IEFMU0EgW2JjbTI4
MzUgQUxTQV0sIGRldmljZSAwOiBiY20yODM1IEFMU0EgW2JjbTI4MzUgQUxTQV0KPiBTdWJkZXZp
Y2VzOiA3LzcKPiBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMAo+IFN1YmRldmljZSAjMTogc3Vi
ZGV2aWNlICMxCj4gU3ViZGV2aWNlICMyOiBzdWJkZXZpY2UgIzIKPiBTdWJkZXZpY2UgIzM6IHN1
YmRldmljZSAjMwo+IFN1YmRldmljZSAjNDogc3ViZGV2aWNlICM0Cj4gU3ViZGV2aWNlICM1OiBz
dWJkZXZpY2UgIzUKPiBTdWJkZXZpY2UgIzY6IHN1YmRldmljZSAjNgo+IGNhcmQgMDogQUxTQSBb
YmNtMjgzNSBBTFNBXSwgZGV2aWNlIDE6IGJjbTI4MzUgSUVDOTU4L0hETUkgW2JjbTI4MzUgSUVD
OTU4L0hETUldCj4gU3ViZGV2aWNlczogMS8xCj4gU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAK
PiBjYXJkIDA6IEFMU0EgW2JjbTI4MzUgQUxTQV0sIGRldmljZSAyOiBiY20yODM1IElFQzk1OC9I
RE1JMSBbYmNtMjgzNSBJRUM5NTgvSERNSTFdCj4gU3ViZGV2aWNlczogMS8xCj4gU3ViZGV2aWNl
ICMwOiBzdWJkZXZpY2UgIzAKPiBjYXJkIDE6IHNlZWVkOG1pY3ZvaWNlYyBbc2VlZWQtOG1pYy12
b2ljZWNhcmRdLCBkZXZpY2UgMDogYmNtMjgzNS1pMnMtYWMxMHgtY29kZWMwIGFjMTB4LWNvZGVj
LjEtMDAzNS0wIFtdCj4gU3ViZGV2aWNlczogMS8xCj4gU3ViZGV2aWNlICMwOiBzdWJkZXZpY2Ug
IzAKPgo+IEFzIEkgbWVudGlvbmVkIGVhcmxpZXIgSSBhbSBpbnRlcmVzdGVkIGluIGNhcmQgMSwg
dGhlIHNlZWVkOG1pY3ZvaWNlYyBlbnRyeS4gSGVyZSBpdCBpcyB0aGUgY29uZm9ybWFuY2UgdGVz
dCBvdXRwdXQ6Cj4KPgo+IDIwIHBhc3NlZCwgMCBmYWlsZWQKPiBEZXZpY2UgSW5mb3JtYXRpb24K
PiBOYW1lOiBodzpDQVJEPTEsMAo+IFN0cmVhbTogUExBWUJBQ0sKPiBGb3JtYXQ6IFsnUzMyX0xF
J10KPiBDaGFubmVsczogWzhdCj4gUmF0ZTogWzgwMDAsIDExMDI1LCAxNjAwMCwgMjIwNTAsIDQ0
MTAwLCA0ODAwMF0KPiBQZXJpb2Rfc2l6ZSByYW5nZTogWzgsIDgxOTJdCj4gQnVmZmVyX3NpemUg
cmFuZ2U6IFsxNiwgMTYzODRdCj4gVGVzdCBQYXJhbXMKPiBTZXQgY2hhbm5lbHMgODogcGFzcwo+
IFNldCBmb3JtYXQgUzMyX0xFOiBwYXNzCj4gU2V0IHJhdGUgODAwMDogcGFzcwo+IFNldCByYXRl
IDExMDI1OiBwYXNzCj4gU2V0IHJhdGUgMTYwMDA6IHBhc3MKPiBTZXQgcmF0ZSAyMjA1MDogcGFz
cwo+IFNldCByYXRlIDQ0MTAwOiBwYXNzCj4gU2V0IHJhdGUgNDgwMDA6IHBhc3MKPiBUZXN0IFJh
dGVzCj4gU2V0IHJhdGUgODAwMDogcGFzcwo+IFNldCByYXRlIDExMDI1OiBwYXNzCj4gU2V0IHJh
dGUgMTYwMDA6IHBhc3MKPiBTZXQgcmF0ZSAyMjA1MDogcGFzcwo+IFNldCByYXRlIDQ0MTAwOiBw
YXNzCj4gU2V0IHJhdGUgNDgwMDA6IHBhc3MKPiBUZXN0IEFsbCBQYWlycwo+IFNldCBjaGFubmVs
cyA4LCBmb3JtYXQgUzMyX0xFLCByYXRlIDgwMDA6IHBhc3MKPiBTZXQgY2hhbm5lbHMgOCwgZm9y
bWF0IFMzMl9MRSwgcmF0ZSAxMTAyNTogcGFzcwo+IFNldCBjaGFubmVscyA4LCBmb3JtYXQgUzMy
X0xFLCByYXRlIDE2MDAwOiBwYXNzCj4gU2V0IGNoYW5uZWxzIDgsIGZvcm1hdCBTMzJfTEUsIHJh
dGUgMjIwNTA6IHBhc3MKPiBTZXQgY2hhbm5lbHMgOCwgZm9ybWF0IFMzMl9MRSwgcmF0ZSA0NDEw
MDogcGFzcwo+IFNldCBjaGFubmVscyA4LCBmb3JtYXQgUzMyX0xFLCByYXRlIDQ4MDAwOiBwYXNz
Cj4KPiBUaGVyZSBpcyBwcm9iYWJseSBhIGJ1ZyBzb21ld2hlcmUgb24gbm90IGJlaW5nIGFibGUg
dG8gdXNlIHRoZSBjYXJkIG5hbWU/Cj4KPiBSZWdhcmRzLAo+IEhpbi1UYWsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
