Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A0148688
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 15:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46E51683;
	Fri, 24 Jan 2020 15:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46E51683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579874781;
	bh=CEF/hsG3cblEJKWmAB+aNs27J6Xc8l1Im/IUSrMp4zw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lya+co33ox/tQAFO3rcl7lSC+gmPWjsEqiel/oBqsie9fv9QmXcCrtRXXsB2vphEJ
	 0R4GsOoccL3wb+JmC8tiyhI5xrhkA+YEX1E1o0zbs3G2OyQKYW7V0pLj1sE8XPH7+l
	 bC6oN0LA567nzifyHS+WrcKvcDCcI21AaVAb7GuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44AABF8020C;
	Fri, 24 Jan 2020 15:04:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23697F8020C; Fri, 24 Jan 2020 15:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34B93F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 15:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34B93F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IG1SAK6d"
Received: by mail-lf1-x142.google.com with SMTP id 203so1168942lfa.12
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DWyzbO4741sf0L5+8NtxZfMXKdFgeyMskzc4yQ5LKik=;
 b=IG1SAK6dVJxniffYa8ulrA7AL/YuJg0iC3DrdcKxYWOtAYxaJCUF5ARno/fLnNOKJg
 tjzeaGLlFal2k+c8zm/KilTTuXdsu21giT/0mp87i+hBj9xEQBPNXC6TK/eGQkJbPXQy
 cBKc8ejx71i8Hwvk3/AHxfx57Ro/J4uirB3XgKEqC/gqvw/0X+Nw3f22ifyDdNpidHJB
 q0ma+E0ZMOB0d4w+GS+Az7Y4kgUuaJ2hHow0a6lciSbkNcjnnqtBSwEfq7OhBicL8fMi
 /fG/5jKgM3HuXxQ+oe8Afi9ou3LMdZLxvJwv1mrRxSIgHvpu4KWXZvMNz6vAEjcYYHhl
 FC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DWyzbO4741sf0L5+8NtxZfMXKdFgeyMskzc4yQ5LKik=;
 b=aYQ1ds6w9ANZiC32n20nxXzxsotHPyuK7h7vyejnrcvXtYz31Yk/OFL5BXa8tKYt1z
 GZTnaBn6ZuOh/ZTYIImd1OVW9ACVy0LJC/FMWas+kMYeZ5O6mn3+bxu6HFLhDbkNYOtG
 GxGw8Du8/7IDPtqoZ5mPbCctWygc+ceA8uKP80pjio+2ofJAI/EUSt9htPA00I6U8NEy
 M5+2a1cw5dFvgefzdDQ+rwAAfp+bh3IG/rXjOWHAKXC24yXh01OF6LsUhCU/1Byi5wO3
 XuuNC08Ko39OzKWRwsaUpAm3FCjkp3HfqUbLkSTr8Qya//w93eALICV5EVuNJ6HBq/4S
 RBpg==
X-Gm-Message-State: APjAAAWaTgyb3ufHpizK7jVF61WZa6qrL9Y65B3fB1lS0oblALptJ+O/
 3rEZaLBsl7j6XkNdRxLeksI=
X-Google-Smtp-Source: APXvYqx9x4q/YcfnEp5oOwdHBsbqmMlHPOlXmnQ8lPeXqMgUjWgk8nn69tfRIWWqDpSjdMc+MrAniA==
X-Received: by 2002:a19:c210:: with SMTP id l16mr1495777lfc.35.1579874663409; 
 Fri, 24 Jan 2020 06:04:23 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id i13sm3094490ljg.89.2020.01.24.06.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 06:04:22 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
Date: Fri, 24 Jan 2020 17:04:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, atalambedu@nvidia.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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

MjQuMDEuMjAyMCAxMjo1MSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDI0LzAxLzIw
MjAgMDk6MDcsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Cj4+IE9uIDIzLzAxLzIwMjAgMTU6MTYsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDIzLjAxLjIwMjAgMTI6MjIsIFNhbWVlciBQdWphciDQ
v9C40YjQtdGCOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAxLzIyLzIwMjAgOTo1NyBQTSwgRG1pdHJ5IE9z
aXBlbmtvIHdyb3RlOgo+Pj4+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBs
aW5rcyBvciBhdHRhY2htZW50cwo+Pj4+Pgo+Pj4+Pgo+Pj4+PiAyMi4wMS4yMDIwIDE0OjUyLCBK
b24gSHVudGVyINC/0LjRiNC10YI6Cj4+Pj4+PiBPbiAyMi8wMS8yMDIwIDA3OjE2LCBTYW1lZXIg
UHVqYXIgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gLi4uCj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+ICtzdGF0
aWMgaW50IHRlZ3JhMjEwX2kyc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
Pj4+Pj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCBwbV9ydW50aW1lX2Rpc2Fi
bGUoJnBkZXYtPmRldik7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgIGlmICghcG1fcnVudGltZV9z
dGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+
Pj4+Pj4+Pj4+IFRoaXMgYnJlYWtzIGRldmljZSdzIFJQTSByZWZjb3VudGluZyBpZiBpdCB3YXMg
ZGlzYWJsZWQgaW4gdGhlCj4+Pj4+Pj4+Pj4+PiBhY3RpdmUKPj4+Pj4+Pj4+Pj4+IHN0YXRlLiBU
aGlzIGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4KPj4+Pj4+
Pj4+Pj4+IGFib3V0IHRoZQo+Pj4+Pj4+Pj4+Pj4gdW54cGVjdGVkIFJQTSBzdGF0ZSBoZXJlLCBi
dXQgaXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4KPj4+Pj4+Pj4+Pj4gSSBndWVzcyB0aGlzIHdh
cyBhZGRlZCBmb3Igc2FmZXR5IGFuZCBleHBsaWNpdCBzdXNwZW5kIGtlZXBzIGNsb2NrCj4+Pj4+
Pj4+Pj4+IGRpc2FibGVkLgo+Pj4+Pj4+Pj4+PiBOb3Qgc3VyZSBpZiByZWYtY291bnRpbmcgb2Yg
dGhlIGRldmljZSBtYXR0ZXJzIHdoZW4gcnVudGltZSBQTSBpcwo+Pj4+Pj4+Pj4+PiBkaXNhYmxl
ZCBhbmQgZGV2aWNlIGlzIHJlbW92ZWQuCj4+Pj4+Pj4+Pj4+IEkgc2VlIGZldyBkcml2ZXJzIHVz
aW5nIHRoaXMgd2F5Lgo+Pj4+Pj4+Pj4+IEl0IHNob3VsZCBtYXR0ZXIgKGlmIEknbSBub3QgbWlz
c2luZyBzb21ldGhpbmcpIGJlY2F1c2UgUlBNIHNob3VsZAo+Pj4+Pj4+Pj4+IGJlIGluCj4+Pj4+
Pj4+Pj4gYSB3cmVja2VkIHN0YXRlIG9uY2UgeW91J2xsIHRyeSB0byByZS1sb2FkIHRoZSBkcml2
ZXIncyBtb2R1bGUuCj4+Pj4+Pj4+Pj4gTGlrZWx5Cj4+Pj4+Pj4+Pj4gdGhhdCB0aG9zZSBmZXcg
b3RoZXIgZHJpdmVycyBhcmUgd3JvbmcuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBbc25pcF0KPj4+
Pj4+Pj4+IE9uY2UgdGhlIGRyaXZlciBpcyByZS1sb2FkZWQgYW5kIFJQTSBpcyBlbmFibGVkLCBJ
IGRvbid0IHRoaW5rIGl0Cj4+Pj4+Pj4+PiB3b3VsZCB1c2UKPj4+Pj4+Pj4+IHRoZSBzYW1lICdk
ZXYnIGFuZCB0aGUgY29ycmVzcG9uZGluZyByZWYgY291bnQuIERvZXNuJ3QgaXQgdXNlIHRoZQo+
Pj4+Pj4+Pj4gbmV3Cj4+Pj4+Pj4+PiBjb3VudGVycz8KPj4+Pj4+Pj4+IElmIFJQTSBpcyBub3Qg
d29ya2luZyBmb3Igc29tZSByZWFzb24sIG1vc3QgbGlrZWx5IGl0IHdvdWxkIGJlIHRoZQo+Pj4+
Pj4+Pj4gY2FzZQo+Pj4+Pj4+Pj4gZm9yIG90aGVyCj4+Pj4+Pj4+PiBkZXZpY2VzLiBXaGF0IGJl
c3QgZHJpdmVyIGNhbiBkbyBpcyBwcm9iYWJseSBkbyBhIGZvcmNlIHN1c3BlbmQKPj4+Pj4+Pj4+
IGR1cmluZwo+Pj4+Pj4+Pj4gcmVtb3ZhbCBpZgo+Pj4+Pj4+Pj4gYWxyZWFkeSBub3QgZG9uZS4g
SSB3b3VsZCBwcmVmZXIgdG8ga2VlcCwgc2luY2UgbXVsdGlwbGUgZHJpdmVycwo+Pj4+Pj4+Pj4g
c3RpbGwKPj4+Pj4+Pj4+IGhhdmUgaXQsCj4+Pj4+Pj4+PiB1bmxlc3MgdGhlcmUgaXMgYSByZWFs
IGhhcm0gaW4gZG9pbmcgc28uCj4+Pj4+Pj4+IEkgdG9vayBhIGNsb3NlciBsb29rIGFuZCBsb29r
cyBsaWtlIHRoZSBjb3VudGVyIGFjdHVhbGx5IHNob3VsZCBiZQo+Pj4+Pj4+PiByZXNldC4gU3Rp
bGwgSSBkb24ndCB0aGluayB0aGF0IGl0J3MgYSBnb29kIHByYWN0aWNlIHRvIG1ha2UgY2hhbmdl
cwo+Pj4+Pj4+PiB1bmRlcm5lYXRoIG9mIFJQTSwgaXQgbWF5IHN0cmlrZSBiYWNrLgo+Pj4+Pj4+
IElmIFJQTSBpcyBicm9rZW4sIGl0IHByb2JhYmx5IHdvdWxkIGhhdmUgYmVlbiBjYXVnaHQgZHVy
aW5nIGRldmljZQo+Pj4+Pj4+IHVzYWdlLgo+Pj4+Pj4+IEkgd2lsbCByZW1vdmUgZXhwbGljaXQg
c3VzcGVuZCBoZXJlIGlmIG5vIGFueSBjb25jZXJucyBmcm9tIG90aGVyCj4+Pj4+Pj4gZm9sa3Mu
Cj4+Pj4+Pj4gVGhhbmtzLgo+Pj4+Pj4gSSByZWNhbGwgdGhhdCB0aGlzIHdhcyB0aGUgcHJlZmVy
cmVkIHdheSBvZiBkb2luZyB0aGlzIGZyb20gdGhlIFJQTQo+Pj4+Pj4gZm9sa3MuIFRlZ3JhMzAg
STJTIGRyaXZlciBkb2VzIHRoZSBzYW1lIGFuZCBTdGVwaGVuIGhhZCBwb2ludGVkIG1lIHRvCj4+
Pj4+PiB0aGlzIGFzIGEgcmVmZXJlbmNlLgo+Pj4+Pj4gSSBiZWxpZXZlIHRoYXQgdGhpcyBpcyBt
ZWFudCB0byBlbnN1cmUgdGhhdCB0aGUKPj4+Pj4+IGRldmljZSBpcyBhbHdheXMgcG93ZXJlZC1v
ZmYgcmVnYXJkbGVzcyBvZiBpdCBSUE0gaXMgZW5hYmxlZCBvciBub3QgYW5kCj4+Pj4+PiB3aGF0
IHRoZSBjdXJyZW50IHN0YXRlIGlzLgo+Pj4+PiBZZXMsIGl0IHdhcyBraW5kYSBhY3R1YWwgZm9y
IHRoZSBjYXNlIG9mIHVuYXZhaWxhYmxlIFJQTS4KPj4+Pgo+Pj4+PiBBbnl3YXlzLCAvSSB0aGlu
ay8gdmFyaWFudCBsaWtlIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIHByZWZlcnJlZDoKPj4+
Pj4KPj4+Pj4gaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoJnBkZXYtPmRldikpCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+
Pj4gZWxzZQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+
ZGV2KTsKPj4+Pgo+Pj4+IEkgdGhpbmsgaXQgbG9va3MgdG8gYmUgc2ltaWxhciB0byB3aGF0IGlz
IHRoZXJlIGFscmVhZHkuCj4+Pj4KPj4+PiBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7
IC8vIGl0IHdvdWxkIHR1cm4gb3V0IHRvIGJlIGEgZHVtbXkgY2FsbAo+Pj4+IGlmICFSUE0KPj4+
PiBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+ZGV2KSkgLy8gaXQgaXMg
dHJ1ZSBhbHdheXMgaWYgIVJQTQo+Pj4+IMKgwqDCoMKgwqDCoMKgIHRlZ3JhMjEwX2kyc19ydW50
aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pgo+Pj4gTWF5YmUgdGhpcyBpcyBmaW5lIGZvciAh
UlBNLCBidXQgbm90IHJlYWxseSBmaW5lIGluIGEgY2FzZSBvZiBlbmFibGVkCj4+PiBSUE0uIERl
dmljZSBjb3VsZCBiZSBpbiByZXN1bWVkIHN0YXRlIGFmdGVyIHBtX3J1bnRpbWVfZGlzYWJsZSgp
IGlmIGl0Cj4+PiB3YXNuJ3Qgc3VzcGVuZGVkIGJlZm9yZSB0aGUgZGlzYWJsaW5nLgo+Pgo+PiBJ
IGRvbid0IHNlZSBhbnkgcHJvYmxlbSB3aXRoIHRoaXMgZm9yIHRoZSAhUlBNIGNhc2UuCj4gCj4g
U29ycnkgSSBtZWFudCB0aGUgUlBNIGNhc2UuIEluIG90aGVyIHdvcmRzLCBJIGRvbid0IHNlZSBh
IHByb2JsZW0gZm9yCj4gbmVpdGhlciB0aGUgUlBNIGNhc2Ugb2YgdGhlICFSUE0gY2FzZS4KCjEu
IERldmljZSBzaGFsbCBiZSBpbiBSUE0tc3VzcGVuZGVkIHN0YXRlIGF0IHRoZSB0aW1lIG9mIGRy
aXZlcidzCnJlbW92YWwsIHVubGVzcyB0aGVyZSBpcyBhIGJ1ZyBpbiB0aGUgc291bmQgZHJpdmVy
LiBIZW5jZSB3aHkgZG8geW91Cm5lZWQgdGhlIGRlYWQgY29kZSB3aGljaCBkb2Vzbid0IGJyaW5n
IGFueSBwcmFjdGljYWwgdmFsdWU/CgoyLiBNYWtpbmcgY2hhbmdlcyB1bmRlcm5lYXRoIG9mIFJQ
TSBpcyBzaW1wbHkgZXJyb3ItcHJvbmUuIEl0IG1heSBoaXQKYmFkbHkgaW4gdGhlIGZ1dHVyZSBv
bmNlIHNvbWV0aGluZyB3aWxsIGNoYW5nZSBpbiB0aGUgUlBNIGNvcmUuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
