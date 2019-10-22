Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF2E087B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB3A1662;
	Tue, 22 Oct 2019 18:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB3A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571760980;
	bh=xMVoX7SWDMMFrh0oC+YpasBTWA/hPzcKPraBrBwClWs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGUke5vjpoutN8fEJjSeCd040YU63PftAT3cKt++kP/0OKkF45oLYFzkExQiZiNIZ
	 SP4HZoYWH8gldNxXRaT1hHJem3Cym8VMOQ9Z0Q2F0MBTx8L4lVu20o55nIafeQ8HwO
	 y6f56tRnUWo8963DYz2OR0R3+YfOAIWhLHkyiAVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A97F8058C;
	Tue, 22 Oct 2019 18:14:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C7AF80390; Tue, 22 Oct 2019 18:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFAF8F80367
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFAF8F80367
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QDKDwh7R"
Received: by mail-wm1-x334.google.com with SMTP id 3so16747245wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J5ZbBR+CoEfy9i66VMnsOWE4R6SgXAww+/Mqq26bf1E=;
 b=QDKDwh7RdGvxnnNk6yOxWTySKbSLtrfbHIf2uMpTW0ObDGD80NtGnfmzk/rYwE2cO7
 +DpI2RFGU9hvxVKQH8vr9ISKfax6KfALzQPGbC9ONvaG7wQd5oqslY2u+0883eF8ya2H
 f/oi3ZoJI4ngw12oClJ/SFQxIoM/rZAdUkQY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J5ZbBR+CoEfy9i66VMnsOWE4R6SgXAww+/Mqq26bf1E=;
 b=sgOIgi8xUl0STGhhsLvfhXj/caeP/4iZlP08FuTKElpZk5fCSnBT/oW/bZXTe0GqxY
 QAhxlaRDYukTM02ClGlD9sPI1l7/XIpuCS+3Np8hcW90jBY84dHeRKjxweucdpkQk9aN
 umnRUIw+0zOk3T67Q9TIl1LNQzoaqqOtCC5wJqQJnBlPlv5NE3uLwWhX2J8VGfR4VP5f
 JLaYMjwxnMR1hd89gsd+xthzG1HOCAfIO6UFinhfequsWWXYp5geUaw4QaiYNMQxdafY
 S+o/hyE2fKJBjFenZ8gvX6A11n0DO4zwS+tcSKFq6QX6R0U9oSZvCV+GJTLFiMief7AO
 GPVQ==
X-Gm-Message-State: APjAAAXivzvRZPZ66Zz2nLCiIPR2oD0kieWmh/iBT3zYiazMXj0zlKkD
 XDxcRpv1FDAowbgZbmrL3FVSh9oq7yaHhh1hRfxUgrwbT9c=
X-Google-Smtp-Source: APXvYqxQaZ3foy2JkQdUpXrCAN8j+Fi7bNsH2ho1O0/ttzy+uNR7XtofV+V3uXfl3lua72m9rMMW9OmbzcIoxT18HL4=
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr3882439wmg.109.1571760849064; 
 Tue, 22 Oct 2019 09:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
 <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
 <43747502.7351282.1571666231987@mail.yahoo.com>
 <CAGvk5PoYYikRL90Vn2GxGWngwaaYzZwe6UX_hcjfAnLeBwvy=w@mail.gmail.com>
 <925340775.7968852.1571737181376@mail.yahoo.com>
In-Reply-To: <925340775.7968852.1571737181376@mail.yahoo.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 23 Oct 2019 00:13:56 +0800
Message-ID: <CAGvk5PpUjn0r_sCD-1mpbaKQs_BmvjXnZV--bpRLCbdHRVDShw@mail.gmail.com>
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

SGkgSGluLVRhaywKCkdvb2QgY2F0Y2ggYWdhaW4uIEkgaGF2ZSBmaXhlZCBpdCBpbiB0aGUgc2Ft
ZSBDTC4gVGhhbmtzIQoKQmVzdCwKWXUtSHN1YW4KCkhpbi1UYWsgTGV1bmcgPGh0bDEwQHVzZXJz
LnNvdXJjZWZvcmdlLm5ldD4g5pa8IDIwMTnlubQxMOaciDIy5pelIOmAseS6jCDkuIvljYg1OjM5
5a+r6YGT77yaCj4KPgo+Cj4gT24gVHVlc2RheSwgMjIgT2N0b2JlciAyMDE5LCAwNDoxMjoxMiBC
U1QsIFl1LUhzdWFuIEhzdSA8eXVoc3VhbkBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4KPiA+IEhp
IEhpbi1UYWssCj4KPiA+IEkgZmluYWxseSBmb3VuZCBvdXQgdGhlIHJlYXNvbiEgSXQgaXMgYmVj
YXVzZSB0aGVyZSBpcyBhIGxlbmd0aCBsaW1pdAo+ID4gb2YgUENNIG5hbWUgaW4gQUxTQSBjb25m
b3JtYW5jZSB0ZXN0Lgo+ID4gSSBoYXZlIGluY3JlYXNlZCBpdCBvbgo+ID4gaHR0cHM6Ly9jaHJv
bWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvcGxhdGZvcm0vYXVkaW90
ZXN0LysvMTg3MTc5Mi4KPiA+IFdhaXRpbmcgZm9yIHRoZSByZXZpZXcgYW5kIG1lcmdlLgo+ID4g
VGhhbmtzIGEgbG90IGZvciB5b3VyIGNhdGNoIQo+Cj4gPiBCZXN0LAo+ID4gWXUtSHN1YW4KPgo+
IERlYXIgWXUtSHN1YW4sCj4KPiBZZXMsIEkgaGFuZC1hcHBsaWVkIHRoZSBvbmUtbGluZSBjaGFu
Z2UsIGFuZCBpdCBub3cgd29ya3MuIEkgZG8gd29uZGVyIGlmIHlvdSBzaG91bGQgY2hhbmdlIHRo
ZSBhcmdzX3NldF9jYXB0dXJlX2Rldl9uYW1lKCkgYWxzbz8KPiBBdCB0aGUgbW9tZW50LCBNQVhf
REVWSUNFX05BTUVfTEVOR1RIIGlzIG9ubHkgdXNlZCBpbiBleGFjdGx5IG9uZSBwbGFjZSwgZm9y
IHRoZSBwbGF5YmFjayBkZXZpY2UgbmFtZS4gSGVuY2UgdGhlIHN1cnByaXNlIHRoYXQKPiBjYXB0
dXJlIHdvcmtzIGJ1dCBwbGF5YmFjayBkb2VzIG5vdDoKPgo+IHNyYy9hbHNhX2NvbmZvcm1hbmNl
X2FyZ3MuYy0xMTktdm9pZCBhcmdzX3NldF9wbGF5YmFja19kZXZfbmFtZShzdHJ1Y3QgYWxzYV9j
b25mb3JtYW5jZV9hcmdzICphcmdzLAo+IHNyYy9hbHNhX2NvbmZvcm1hbmNlX2FyZ3MuYy0xMjAt
IGNvbnN0IGNoYXIgKm5hbWUpCj4gc3JjL2Fsc2FfY29uZm9ybWFuY2VfYXJncy5jLTEyMS17Cj4g
c3JjL2Fsc2FfY29uZm9ybWFuY2VfYXJncy5jLTEyMi0gZnJlZShhcmdzLT5wbGF5YmFja19kZXZf
bmFtZSk7Cj4gc3JjL2Fsc2FfY29uZm9ybWFuY2VfYXJncy5jOjEyMzogYXJncy0+cGxheWJhY2tf
ZGV2X25hbWUgPSBzdHJuZHVwKG5hbWUsIE1BWF9ERVZJQ0VfTkFNRV9MRU5HVEgpOwo+IHNyYy9h
bHNhX2NvbmZvcm1hbmNlX2FyZ3MuYy0xMjQtfQo+IHNyYy9hbHNhX2NvbmZvcm1hbmNlX2FyZ3Mu
Yy0xMjUtCj4gc3JjL2Fsc2FfY29uZm9ybWFuY2VfYXJncy5jLTEyNi12b2lkIGFyZ3Nfc2V0X2Nh
cHR1cmVfZGV2X25hbWUoc3RydWN0IGFsc2FfY29uZm9ybWFuY2VfYXJncyAqYXJncywKPiBzcmMv
YWxzYV9jb25mb3JtYW5jZV9hcmdzLmMtMTI3LSBjb25zdCBjaGFyICpuYW1lKQo+IHNyYy9hbHNh
X2NvbmZvcm1hbmNlX2FyZ3MuYy0xMjgtewo+IHNyYy9hbHNhX2NvbmZvcm1hbmNlX2FyZ3MuYy0x
MjktIGZyZWUoYXJncy0+Y2FwdHVyZV9kZXZfbmFtZSk7Cj4gc3JjL2Fsc2FfY29uZm9ybWFuY2Vf
YXJncy5jLTEzMC0gYXJncy0+Y2FwdHVyZV9kZXZfbmFtZSA9IHN0cmR1cChuYW1lKTsKPiBzcmMv
YWxzYV9jb25mb3JtYW5jZV9hcmdzLmMtMTMxLX0KPiBzcmMvYWxzYV9jb25mb3JtYW5jZV9hcmdz
LmMtMTMyLQo+Cj4gUmVnYXJkcywKPiBIaW4tVGFrCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
