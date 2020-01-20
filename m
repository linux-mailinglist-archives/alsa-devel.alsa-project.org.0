Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D391143049
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8EA166D;
	Mon, 20 Jan 2020 17:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8EA166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579539111;
	bh=rqbKsiGVRqqH6ixtxblk1jYZ2hEg5hExbbbyEagOibM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdEAgHhEUE+QzqtQboanr/VPaExM/8RmIF5yHfufJkm0CYJNSiXuTb7V2Y1x+PiXg
	 0WwGFVmY0UNesJ5ssL9CwaVBsHD2fOLQIooIsVR9/fThhceVYk3XbSNha/FrI/8xEZ
	 +D0z1d5hubLfHHWL8bCKYOioZhlFNldW8Xpa3PLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C04F80217;
	Mon, 20 Jan 2020 17:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9686F80217; Mon, 20 Jan 2020 17:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9D3F801D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:50:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9D3F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RwZ2EhmD"
Received: by mail-lf1-x144.google.com with SMTP id 9so24621812lfq.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S823y5r0qE/kszJj6OhQ0qMGICpBQxRhKLmmHJUihXw=;
 b=RwZ2EhmDdKrA8tPlHI0wEr/PD8GFiZ7JISFdS17uHCCjLP1OQLBsfL+p6mkX7aHmpP
 1QQB3rZ8jiWaxlb6ktitqAhmxz+3kfi778SfRenlRGkEABezKPAxONJprnlHn47PIzJ/
 Nel/BP7kiXTbPVQ2+t42PC1cu3qckWO4PT5znrSRLWRqt3PgadpjmzCxjqP1hTL3OnEG
 i0O4amxFTUmbH7/KcF2xg1MVFN0XR/zJusUUws8Zv3ho1kRQ0P0uYkWG1epL9JWuN+2E
 ww79hl2qauVi0VSLpHcjXk0x/RfHN69OTFKs5yairPbYpmoEFtgdb3YhgrolOeEdN5Wz
 FWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S823y5r0qE/kszJj6OhQ0qMGICpBQxRhKLmmHJUihXw=;
 b=gkYM1bfjBqxaoCLOFRa5RQ+M+b773ZXOTNHq3pfcdoVy75zNql5PyUiN0nhTcU3mC2
 ojEE7JJDOqcE46cddzUMLxh2ul9QK5BY3yZQAQJQ4DZOjcXK5bldgo530P7n6SchP3mc
 1HVIGsA/bR4I9OEtin7RnPZCvEvAxbReWOb4iVXArpUwiuQiy0c3Fv3NTd7YniK6YPyq
 hJS6MI7kDivSsTwBrbiigBptQ6W4oUsmd/YRa5fIYn0I3iiJhLL+UQpRfTGuJ59i7dqi
 D+aHnr5pKdGX50I9vFDme6VLE3y3S7sTIq2EO4ibjzLrALCLMiDJsgchHVFJbMZbxcMv
 A7qw==
X-Gm-Message-State: APjAAAUh+UKOIMxaR1AZwe6rPCJ+VFj2Q+lM75RCLLUAEeK5ZpAQdGOh
 fZ4U2JC2Yti9kQnxrZ9bcgA=
X-Google-Smtp-Source: APXvYqz+ox3NGUI8TmFKpuaDg2tsFWOZdN8RF6KJqH4RVeJ/uGqyfYXwBTeDcU9suhnDMMdXpH+7ig==
X-Received: by 2002:ac2:4909:: with SMTP id n9mr109581lfi.21.1579539028234;
 Mon, 20 Jan 2020 08:50:28 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id n30sm20256815lfi.54.2020.01.20.08.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 08:50:27 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
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
 <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ebfaa0d3-1236-cac4-4bd8-4456a171d773@gmail.com>
Date: Mon, 20 Jan 2020 19:50:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <07cd66dc-1a6c-6b49-55a9-1420fe235161@nvidia.com>
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

MDguMDEuMjAyMCAxNDozNywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDA3LzAxLzIw
MjAgMDE6MzksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDYuMDEuMjAyMCAyMjowMCwgQmVu
IERvb2tzINC/0LjRiNC10YI6Cj4+PiBPbiAwNS8wMS8yMDIwIDEwOjUzLCBCZW4gRG9va3Mgd3Jv
dGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+Pj4gMDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+
PiBbc25pcF0KPj4+Pj4+Cj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+
Pj4+Pgo+Pj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRzIHdv
cmsuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBpdCBs
b29rcyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIg
Yml0IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4+PiBkbyAy
NCBiaXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBz
dXBwb3J0Cj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Cj4+Pj4+PiBNeSBwcmVmZXJl
bmNlIGlzIHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBp
bi4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNl
IGNvbmZpcm0gdGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+Pj4gdXNhYmxlIG9uIFQzMD8KPj4+
Pgo+Pj4+IElmIHRoZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJ
IHRoaW5rIHRoYXQgd291bGQgd29yay4KPj4+Pgo+Pj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQg
d2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4+Pgo+Pj4gSSBuZWVkIHRvIGNoZWNrIHNvbWUgdGhp
bmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBpdCBsb29rcwo+Pj4gbGlrZSB0
aGUgZGVmYXVsdCBpcyAyNCBpbiAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4gSG93ZXZlciBJIG5l
ZWQgdG8KPj4+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJp
dHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4+Pgo+Pj4gSSdsbCBmb2xsb3cgdXAgbGF0ZXIsCj4+
Cj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4g
bXkgY2FzZS4gSSBicmllZmx5Cj4+IGxvb2tlZCB0aHJvdWdoIHRoZSBUUk0gZG9jIGFuZCBnb3Qg
aW1wcmVzc2lvbiB0aGF0IEFIVUIgY291bGQgcmUtcGFjawo+PiBkYXRhIHN0cmVhbSBpbnRvIHNv
bWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4+IGlt
cHJlc3Npb24uCj4gCj4gSSBjaGF0dGVkIHdpdGggU2FtZWVyIGFib3V0IHRoaXMsIHNvIHllcyB0
aGUgQUhVQiBjYW4gcmVwYWNrLCBidXQgdGhlcmUKPiBpcyBhIHByb2JsZW0gd2l0aCBTMjRfTEUg
d2hlcmUgaWYgd2UgdHJ5IHRvIGV4dHJhY3QgMjQtYml0cyB3ZSBhY3R1YWxseQo+IGdldCB0aGUg
dXBwZXIgMjQtYml0cyBhbmQgbm90IHRoZSBsb3dlciBMU0JzIGluIHRoZSAzMi1iaXQgZGF0YSBl
bGVtZW50Lgo+IFNvIGFjdHVhbGx5IHdlIGRvbid0IHN1cHBvcnQgUzI0X0xFLgo+IAo+IEJlbiBk
byB5b3UgbmVlZCAyNC1iaXQgc3VwcG9ydCBvciAzMi1iaXQgb3IgYm90aD8KCkFueSB1cGRhdGVz
PyBTaG91bGQgd2UgcmV2ZXJ0IGFsbCB0aGUgYXBwbGllZCBwYXRjaGVzIGZvciBub3c/Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
