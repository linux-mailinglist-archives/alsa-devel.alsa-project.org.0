Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16431473A0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 23:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2F51686;
	Thu, 23 Jan 2020 23:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2F51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579817598;
	bh=MyGv2zi52qRqHlg3+0YN5RqjZQXaCrafweso6vEOwAQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smpuT71z609wTMGRz6dH8H/0YMjkx95lc07eCBT/GED22220QKLDDJK7HA0SNpCJC
	 9xwcRwPmD7sSFyy74N6NaqjTo79oVthkM+rWCgTJ6VW/KTz2KF2eZS6eX0pg8gmZdF
	 UC7ucuOrSy9lAYZGbb/C9NtzcVgtLqvx3NjnbURc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08674F801D9;
	Thu, 23 Jan 2020 23:11:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD78F801D9; Thu, 23 Jan 2020 23:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A9E7F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 23:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A9E7F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GmTHdjCl"
Received: by mail-lj1-x242.google.com with SMTP id h23so64867ljc.8
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 14:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zjmZtvOgkvKBuDTt3joPH6ZcmElnBsy3zuHQ/wP6n2Q=;
 b=GmTHdjClz6z7b69UAUkhQB3AwaRVe+pe8MVXYnbOuOZaoc5fpZPTmSMb5ZogCz2hOq
 8yT1jLtTX1yQ0QPWPUvivdA6ruPD4RWxI/5CCq+YWsn2Lb3KJJe+K1Dvr9hmGCUyc9C4
 K4pXLpzHC1s/JP5KSROgi/ltNsN77VQaTbNhA0BTuDFLiBXfobPWwvUTspH0GW9rtsjJ
 CaEU7Yzot98lgyHYhdC1RqE7VkObCTDvjtAslTLKA/2FE+OB/cPoGFXwmh/XWevA0tR3
 776K6piDzDuP3mCggDW3afequ2AhhVkTuwdDp73F4zh5kb5ClES9IiT3lzCll2dJW04w
 NNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zjmZtvOgkvKBuDTt3joPH6ZcmElnBsy3zuHQ/wP6n2Q=;
 b=M+mf19AlPl0bPMqNJfc+Dll2KzSkrd06/dZHnjhgzAvIEkCogRx+tZj9RBb3hkBa1q
 A70f5bc36KDJsfylZ+Nt0bQqsSC9rnoHx5PJ+WM0hU5jabOBxK/wUNRcnC7Ktc8f6HcP
 UcwFRMRKqsmfBZkqfpiXTF23BYqRtI8Q9apUmn1o9vZmGxkD4kSx8qOY6UO8n6NXpsJK
 0nPboF4hwDQ78bpBDZ2k982JF0h3W76zyjlwQV/r1KYTVmV5cSx0Sgckukx7sW7um8qd
 Bprl5q2YLCAaCEgXKu9wGo0LvWVwr/bu6/sbQXbZYuHYdbsVm62pLaxVe2wHfgsVISx8
 njIg==
X-Gm-Message-State: APjAAAVk5v4qoB/HoZ/5kqOZc+yzv7DsIPj1KsVJpOnw4eRVQBlLnQLT
 kjPW9IWQ1p83jnUsaOnWVtI=
X-Google-Smtp-Source: APXvYqwiMhYmcG7kJ7U8cnnOvArZznL/qAzz10MEqnNry3LzeOiSqFU1I9PZ2WYSQi0hQzQkcmoCvQ==
X-Received: by 2002:a2e:9f17:: with SMTP id u23mr343144ljk.112.1579817486378; 
 Thu, 23 Jan 2020 14:11:26 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id t10sm1957932lji.61.2020.01.23.14.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 14:11:25 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
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
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <76a6a818-ab60-45eb-a85e-fa3090266d6f@gmail.com>
Date: Fri, 24 Jan 2020 01:11:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
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

MjQuMDEuMjAyMCAwMDo1OSwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gT24gMjMvMDEvMjAyMCAx
OTozOCwgQmVuIERvb2tzIHdyb3RlOgo+PiBPbiAwNy8wMS8yMDIwIDAxOjM5LCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+PiAwNi4wMS4yMDIwIDIyOjAwLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoK
Pj4+PiBPbiAwNS8wMS8yMDIwIDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+IDA1
LjAxLjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+IFtzbmlwXQo+Pj4+
Pj4+Cj4+Pj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+Pj4+Pj4+Cj4+Pj4+
Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRzIHdvcmsuCj4+Pj4+
Pj4KPj4+Pj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxvb2tzIGxp
a2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIgYml0IHdv
cmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4+Pj4gZG8gMjQgYml0
IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3VwcG9y
dAo+Pj4+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Pj4+Cj4+Pj4+Pj4gTXkgcHJlZmVyZW5j
ZSBpcyB0byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQKPj4+
Pj4+PiBpbi4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5
b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+Pj4+IHVzYWJsZSBv
biBUMzA/Cj4+Pj4+Cj4+Pj4+IElmIHRoZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50
byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQKPj4+Pj4gd29yay4KPj4+Pj4KPj4+Pj4gSSBj
YW4gdHJ5IHRlc3RpbmcgdGhhdCB3aXRoIHJhdyBkYXRhIG9uIE1vbmRheS4KPj4+Pgo+Pj4+IEkg
bmVlZCB0byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0IHdhcyAyNCBwYWNrZWQgYml0
cywgaXQgbG9va3MKPj4+PiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2Ug
bWF5IGJlIG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+Pj4+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3
aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4+Pj4KPj4+
PiBJJ2xsIGZvbGxvdyB1cCBsYXRlciwKPj4+Cj4+PiBPa2F5LCB0aGUgUzI0XzNMRSBpc24ndCBz
dXBwb3J0ZWQgYnkgUlQ1NjQwIGNvZGVjIGluIG15IGNhc2UuIEkgYnJpZWZseQo+Pj4gbG9va2Vk
IHRocm91Z2ggdGhlIFRSTSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBjb3VsZCBy
ZS1wYWNrCj4+PiBkYXRhIHN0cmVhbSBpbnRvIHNvbWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRz
LCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4+PiBpbXByZXNzaW9uLgo+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Cj4+IEkgZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBm
b2xsb3dpbmc6Cj4+Cj4+IMKgwqBzb3ggLW4gLWIgMTYgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53
YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+IMKgwqBzb3ggLW4gLWIgMjQgLWMgMiAtciA0
NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+IMKgwqBzb3ggLW4g
LWIgMzIgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41
Cj4+Cj4+IFRoZSAxNiBhbmQgMzIgd29yayBmaW5lLCB0aGUgMjQgaXMgc2hvd2luZyBhIHBsYXli
YWNrIG91dHB1dCBmcmVxCj4+IG9mIDQ0MEh6IGluc3RlYWQgb2YgNTAwSHouLi4gdGhpcyBzdWdn
ZXN0cyB0aGUgY2xvY2sgaXMgb2ZmLCBvciB0aGVyZQo+PiBpcyBzb21ldGhpbmcgZWxzZSB3ZWly
ZCBnb2luZyBvbi4uLgo+Pgo+IAo+IEkgc2hvdWxkIGhhdmUgY2hlY2tlZCBwbGxfYV9vdXQwIHJh
dGUsIGZvciAyNGJpdCAyY2gsIEkgZ2V0Cj4gcGxsX2Ffb3V0IGF0IHdoaWNoIG1ha2VzOgo+IAo+
IDExMjg5NjAwLygyNCoyKjQ0MTAwKSA9IDUuMzMzMzMzMzMzMwo+IAo+IEZvciBzb21lIHJlYXNv
biB0aGUgUExMIGNhbid0IGdldCBhIGRlY2VudCBkaXZpc29yIGZvciB0aGlzLgoKSGF2ZSB5b3Ug
dHJpZWQgdG8gYWRqdXN0IHRoZSBwcmVkZWZpbmVkIFBMTEEgcmF0ZT8gUGxlYXNlIHNlZQp0ZWdy
YV9jbGtfaW5pdF90YWJsZSBpbiBkcml2ZXJzL2Nsay90ZWdyYS9jbGstdGVncmEzMC5jLiBXaWxs
IGJlCmludGVyZXN0aW5nIGlmIGl0IHdvcmtzIHdpdGggdGhhdC4KClNvd2phbnlhIHNhaWQgdGhh
dCB0aGUgUExMQSByYXRlIHNldHVwIGlzIGdvaW5nIHRvIGJlIG1vdmVkIHRvIHRoZSBhdWRpbwpk
cml2ZXIgWzFdLCBtYXliZSB0aGF0J3Mgd2hhdCB3ZSBhbHJlYWR5IG5lZWQgZm9yIDI0Yml0LgoK
WzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzEvMjEvNzQ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
