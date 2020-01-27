Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5314AA6D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 20:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24812846;
	Mon, 27 Jan 2020 20:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24812846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580153148;
	bh=0hU3RXGBcjfTBXqJ0OuwbyZ1ek26JkYAbeLBu6SWQl4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U8vPJbDIIFC+YQGYuDHveYSDMnrPmhpOv1Vr2K1PzTT/4yqfDhJIiwts0GuoGcAR0
	 kiH45ACoIr011ZZPmlumiVVPDHx+eyQVKIYoo0KFqovF0+wyGtkZpC2l0uVjVxPcEE
	 jkTFX1wVZkTqUNiMma2xpWLlGAR2kjuS3qVdPZDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C76F80234;
	Mon, 27 Jan 2020 20:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06474F8021E; Mon, 27 Jan 2020 20:24:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1FA2F80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 20:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FA2F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iCbhUQAM"
Received: by mail-lj1-x243.google.com with SMTP id j26so12060306ljc.12
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 11:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OST5SeT3IPtWRL/o8QAYnXMGBOyNWd1HSmdaFnyReAg=;
 b=iCbhUQAMR3apgLO8W8JIWLIrvRCbwx8fy49iKVnrggSc9lkooNK/EtTiNl8UjFdRN2
 SUHM9fgXyDjQsOPPZMJ/EhLmaliu1OnH29BIX0YwKleWRnaCegpSK8qH2z0xWBl6J4VY
 E7Rdfv+j2uRKmCFu9/5F/M44BxW5BCyWwh1k2g+bHE9J8ppvYglpIQZD6gW0Aby7F+/H
 mWBXEqpJuG2OqTOMg2rU6gLVucrWWdcIEbV/bkFiQGGIvAxGRAHf7dzBbLESvnjgWw/7
 a2s6BOI5/0glhD0JUmJ1O+Zuq4m5tBQel8oZMsnG92+58uuSDKs/UYiwWTPN1trbuNnu
 6jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OST5SeT3IPtWRL/o8QAYnXMGBOyNWd1HSmdaFnyReAg=;
 b=faRqhWZo9z5QX29ptsKGesQep/I4q6tmt6OWyXiFXXk/WJOWzpHTSYvw0rRAuoQtxc
 NQv33t5yZoee9Jq4/6EiSTwc3/sMFRf9mc1LAM6ELzzuR3/cZq9wfmk4HMkcLbW6oNbJ
 1X3ZYbCTsGlzZMGKsrULzvOaAufY4y67x48lDjAFB4kS/XnRY24zrnIjFgA0gE1gXZ39
 DxB9QPAuEPYzQnGAyZsjIK3xfw0KxgO9OwAEgQweuX7la63DlOGywdcHbv2xCRwBT4rp
 PtjioeC7AKyn6AbKOtaU1PZ1PJWtmBnp77eOxSe9DTEA4l/O0C/YNSFbK0GLC1qS/6LZ
 sftw==
X-Gm-Message-State: APjAAAU0R+l5vZuWiV0AHq3Oi2z/h1NTC54T6bTc/TEv8xlbZiw8oEgx
 7DEO0Q3LbjSxRLetqj31eIM=
X-Google-Smtp-Source: APXvYqzA6c9tI9Fe5lCNgTp76JDpXt88HJyn1Rk8L1p7wlLeP3SVW6mSDvD46XFrvYOY7OS2QtFa7g==
X-Received: by 2002:a2e:9d0f:: with SMTP id t15mr11029474lji.171.1580153038548; 
 Mon, 27 Jan 2020 11:23:58 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id q10sm8665447ljj.60.2020.01.27.11.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 11:23:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
Message-ID: <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
Date: Mon, 27 Jan 2020 22:23:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

MjcuMDEuMjAyMCAyMjoyMCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjQuMDEuMjAy
MCAxOTo1MCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pgo+PiBPbiAyMy8wMS8yMDIwIDE5OjM4
LCBCZW4gRG9va3Mgd3JvdGU6Cj4+PiBPbiAwNy8wMS8yMDIwIDAxOjM5LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gMDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+
Pj4+IE9uIDA1LzAxLzIwMjAgMTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4gT24gMjAyMC0wMS0wNSAwMTo0OCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+
IDA1LjAxLjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+PiBbc25pcF0K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBTb21lIHNpbXBsZSBkYXRhIHRlc3RzIHNob3cgMTYgYW5kIDMyLWJpdHMgd29y
ay4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBp
dCBsb29rcyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4+PiAyNCBiaXQgc2FtcGxlcyBp
biAzMiBiaXQgd29yZHMuIEkgY2FuJ3Qgc2VlIGFueSBwYWNraW5nIG9wdGlvbnMgdG8KPj4+Pj4+
Pj4gZG8gMjQgYml0IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBz
YW1wbGUgc3VwcG9ydAo+Pj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVw
IHRoZSAzMiBiaXQgaW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBJbnRlcmVzdGluZy4uIEpv
biwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRiaXQgZm9ybWF0IGlzbid0Cj4+Pj4+
Pj4gdXNhYmxlIG9uIFQzMD8KPj4+Pj4+Cj4+Pj4+PiBJZiB0aGVyZSBpcyBhbiBvcHRpb24gb2Yg
MjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGluayB0aGF0IHdvdWxkCj4+Pj4+PiB3b3JrLgo+
Pj4+Pj4KPj4+Pj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25k
YXkuCj4+Pj4+Cj4+Pj4+IEkgbmVlZCB0byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0
IHdhcyAyNCBwYWNrZWQgYml0cywgaXQgbG9va3MKPj4+Pj4gbGlrZSB0aGUgZGVmYXVsdCBpcyAy
NCBpbiAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4gSG93ZXZlciBJIG5lZWQgdG8KPj4+Pj4gcmUt
d3JpdGUgbXkgdGVzdCBjYXNlIHdoaWNoIGFzc3VtZWQgaXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVz
IChTMjRfM0xFKS4KPj4+Pj4KPj4+Pj4gSSdsbCBmb2xsb3cgdXAgbGF0ZXIsCj4+Pj4KPj4+PiBP
a2F5LCB0aGUgUzI0XzNMRSBpc24ndCBzdXBwb3J0ZWQgYnkgUlQ1NjQwIGNvZGVjIGluIG15IGNh
c2UuIEkgYnJpZWZseQo+Pj4+IGxvb2tlZCB0aHJvdWdoIHRoZSBUUk0gZG9jIGFuZCBnb3QgaW1w
cmVzc2lvbiB0aGF0IEFIVUIgY291bGQgcmUtcGFjawo+Pj4+IGRhdGEgc3RyZWFtIGludG8gc29t
ZXRoaW5nIHRoYXQgY29kZWMgc3VwcG9ydHMsIGJ1dCBtYXliZSBpdCdzIGEgd3JvbmcKPj4+PiBp
bXByZXNzaW9uLgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4KPj4+
IEkgZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dpbmc6Cj4+Pgo+Pj4gwqBzb3ggLW4g
LWIgMTYgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41
Cj4+PiDCoHNveCAtbiAtYiAyNCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNp
bmUgNTAwIHZvbCAwLjUKPj4+IMKgc294IC1uIC1iIDMyIC1jIDIgLXIgNDQxMDAgL3RtcC90bXAu
d2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+Pj4KPj4+IFRoZSAxNiBhbmQgMzIgd29yayBm
aW5lLCB0aGUgMjQgaXMgc2hvd2luZyBhIHBsYXliYWNrIG91dHB1dCBmcmVxCj4+PiBvZiA0NDBI
eiBpbnN0ZWFkIG9mIDUwMEh6Li4uIHRoaXMgc3VnZ2VzdHMgdGhlIGNsb2NrIGlzIG9mZiwgb3Ig
dGhlcmUKPj4+IGlzIHNvbWV0aGluZyBlbHNlIHdlaXJkIGdvaW5nIG9uLi4uCj4+Cj4+IEkgd2Fz
IGxvb2tpbmcgYXQgdXNpbmcgc294IHRvIGNyZWF0ZSBzdWNoIGFzIGZpbGUsIGJ1dCB0aGUgYWJv
dmUgY29tbWFuZAo+PiBnZW5lcmF0ZXMgYSBTMjRfM0xFIGZpbGUgYW5kIG5vdCBTMjRfTEUgZmls
ZS4gVGhlIGNvZGVjIG9uIEpldHNvbi1USzEKPj4gc3VwcG9ydHMgUzI0X0xFIGJ1dCBkb2VzIG5v
dCBzdXBwb3J0IFMyNF8zTEUgYW5kIHNvIEkgY2Fubm90IHRlc3QgdGhpcy4KPj4gQW55d2F5LCB3
ZSByZWFsbHkgbmVlZCB0byB0ZXN0IFMyNF9MRSBhbmQgbm90IFMyNF8zTEUgYmVjYXVzZSB0aGlz
IGlzCj4+IHRoZSBwcm9ibGVtIHRoYXQgRG1pdHJ5IGlzIGhhdmluZy4KPj4KPj4gQmVuIGlzIFMy
NF8zTEUgd2hhdCB5b3UgcmVhbGx5IG5lZWQgdG8gc3VwcG9ydD8KPj4KPj4gRG1pdHJ5LCBkb2Vz
IHRoZSBmb2xsb3dpbmcgZml4IHlvdXIgcHJvYmxlbT8KPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMK
Pj4gaW5kZXggZGJlZDNjNTQwOGU3Li45Mjg0NWM0YjYzZjQgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5k
L3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMw
X2kycy5jCj4+IEBAIC0xNDAsNyArMTQwLDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19w
YXJhbXMoc3RydWN0Cj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+ICAgICAgICAg
ICAgICAgICBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+PiAgICAgICAg
ICAgICAgICAgc2FtcGxlX3NpemUgPSAxNjsKPj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAt
ICAgICAgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+ICsgICAgICAgY2FzZSBTTkRS
Vl9QQ01fRk9STUFUX1MyNF8zTEU6Cj4+ICAgICAgICAgICAgICAgICB2YWwgPSBURUdSQTMwX0ky
U19DVFJMX0JJVF9TSVpFXzI0Owo+PiAgICAgICAgICAgICAgICAgYXVkaW9fYml0cyA9IFRFR1JB
MzBfQVVESU9DSUZfQklUU18yNDsKPj4gICAgICAgICAgICAgICAgIHNhbXBsZV9zaXplID0gMjQ7
Cj4+IEBAIC0zMTgsNyArMzE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9k
cml2ZXIKPj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+PiAgICAgICAgICAgICAgICAg
LmNoYW5uZWxzX21heCA9IDIsCj4+ICAgICAgICAgICAgICAgICAucmF0ZXMgPSBTTkRSVl9QQ01f
UkFURV84MDAwXzk2MDAwLAo+PiAgICAgICAgICAgICAgICAgLmZvcm1hdHMgPSBTTkRSVl9QQ01f
Rk1UQklUX1MzMl9MRSB8Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9G
TVRCSVRfUzI0X0xFIHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZN
VEJJVF9TMjRfM0xFIHwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZN
VEJJVF9TMTZfTEUsCj4+ICAgICAgICAgfSwKPj4gICAgICAgICAuY2FwdHVyZSA9IHsKPj4gQEAg
LTMyNyw3ICszMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+
PiB0ZWdyYTMwX2kyc19kYWlfdGVtcGxhdGUgPSB7Cj4+ICAgICAgICAgICAgICAgICAuY2hhbm5l
bHNfbWF4ID0gMiwKPj4gICAgICAgICAgICAgICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgw
MDBfOTYwMDAsCj4+ICAgICAgICAgICAgICAgICAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRf
UzMyX0xFIHwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUgfAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1My
NF8zTEUgfAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSwKPj4gICAgICAgICB9LAo+PiAgICAgICAgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29w
cywKPj4KPj4gSm9uCj4+Cj4gCj4gSXQgc2hvdWxkIHNvbHZlIHRoZSBwcm9ibGVtIGluIG15IHBh
cnRpY3VsYXIgY2FzZSwgYnV0IEknbSBub3Qgc3VyZSB0aGF0Cj4gdGhlIHNvbHV0aW9uIGlzIGNv
cnJlY3QuCj4gCj4gVGhlIHY1LjUga2VybmVsIGlzIHJlbGVhc2VkIG5vdyB3aXRoIHRoZSBicm9r
ZW4gYXVkaW8gYW5kIGFwcGFyZW50bHkKPiBnZXR0aW5nIDI0Yml0IHRvIHdvcmsgd29uJ3QgYmUg
dHJpdmlhbCAoaWYgcG9zc2libGUgYXQgYWxsKS4gQmVuLCBjb3VsZAo+IHlvdSBwbGVhc2Ugc2Vu
ZCBhIHBhdGNoIHRvIGZpeCB2NS41IGJ5IHJlbW92aW5nIHRoZSBTMjQgc3VwcG9ydAo+IGFkdmVy
dGlzZW1lbnQgZnJvbSB0aGUgZHJpdmVyPwoKSSBhbHNvIHN1c3BlY3QgdGhhdCBzMzIgbWF5IG5l
ZWQgc29tZSBleHRyYSBwYXRjaGVzIGFuZCB0aHVzIGNvdWxkIGJlCndvcnRod2hpbGUgdG8gc3Rv
cCBhZHZlcnRpc2luZyBpdCBhcyB3ZWxsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
