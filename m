Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C514C50A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 04:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 615161670;
	Wed, 29 Jan 2020 04:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 615161670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580269432;
	bh=AymskTp829PnwjfGKj8BXC6HQ4CTlSvTksS2zhn/QO4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ByvT7ulxJUDS778QakDOn+Ga5P7fwMB/OXDp9wMcRBFZ4WWfmQOR8TxkG29M6R1C+
	 BBC6QVR22jRHbjHtvSd+3m93qGuOA5reBmiMWbchwYuwGT2hcQXoigMuGKrhCNROnC
	 0cTKBUP68n3STocVvRpTxQTahq6cMG1Vj+Q1vDqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E2DF80122;
	Wed, 29 Jan 2020 04:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E068F8021E; Wed, 29 Jan 2020 04:42:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D3AAF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 04:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3AAF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ICSLuPM7"
Received: by mail-ed1-x544.google.com with SMTP id c26so17096032eds.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 19:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tcRoYLrQi4SqzH+L20hjDXL3Tb4tgVwmCqHebXVqDrY=;
 b=ICSLuPM7hLBxtdKwuBTZ0n62D8yc+EuKxrioec3WPfWOm9oUT8ve+gw8r3cRk7X8NP
 9cmq0wBdgX0/YM76wZXWB0bsEm9Pm50f+gjVpN7qODrQeqTlJjNmgau3jrsAvdVcOjC3
 u9DiNJeJUBn7cy0cN4rM9IFj5Buuqm/WaaMKqy3DICrhtbo45Ax9RJgiDTJzHe7CBAjj
 47FeXujeVHl2nceCZlyY+LckMIr7qbRuSDkyT4ak4a8CHBYNWfIBF3UDrwbGowVV/aR7
 u9/EYlgdXn8jjExvw2jih+3Fan8jSgm08rsR6HOrG0Lm/2hZErfsrnLO4CgMRSkKyj4S
 nSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tcRoYLrQi4SqzH+L20hjDXL3Tb4tgVwmCqHebXVqDrY=;
 b=DUdB0Otyp55YXNuaLwo9S02QUX6AqJ81XYrektpOrx0q7nhFWfWyV3x6BdJP3qpV+b
 tRgSvC9+DWDd1dK7pBkPa8vv1G9QUmWBWDNM7ZhE65U+sKKlEe+zK/aDxYnjJtHOy/uX
 KC+IPiWmJJdj4WTR2JnH3V8YGLK8TrAKSOBx+rVsxX4nNklNBF3QQKKgmfAnsWNJd3TZ
 R8yJKh9WeppQ0wdvBL+30IBGiNV3IhYw88AJURLl2rvJccphiW/88BBKoLRxf9ZkObMQ
 ffXihoICYi3MUGyTxHHmCwOKjzVy662i6+nfW8wW2Nf9GkLEJEHX50FhgxZIrqZQwZXh
 o4vQ==
X-Gm-Message-State: APjAAAWSFcwue9PZNz32UypIQ6kPPSILprCZjujMbTuzgP9dIpMXoR9l
 hYY2r8MiCfpbRXWk0+zLM3Y=
X-Google-Smtp-Source: APXvYqy1xKcZRhbwfuXwJLwnS98C7kf6ODqzfP8QqiqHImKQDSKq0PiiIRO+KNZ8+l2N0sGC3KsLWA==
X-Received: by 2002:a05:6402:17e4:: with SMTP id
 t4mr6182867edy.83.1580269324269; 
 Tue, 28 Jan 2020 19:42:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id e22sm68770edq.75.2020.01.28.19.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 19:42:03 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
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
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
 <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3b42c858-733b-0d17-f457-8043d97f5058@gmail.com>
Date: Wed, 29 Jan 2020 06:41:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
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

MjcuMDEuMjAyMCAwODoyMiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMS8y
NC8yMDIwIDc6MzQgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6
IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gMjQuMDEu
MjAyMCAxMjo1MSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pj4gT24gMjQvMDEvMjAyMCAwOTow
NywgSm9uIEh1bnRlciB3cm90ZToKPj4+PiBPbiAyMy8wMS8yMDIwIDE1OjE2LCBEbWl0cnkgT3Np
cGVua28gd3JvdGU6Cj4+Pj4+IDIzLjAxLjIwMjAgMTI6MjIsIFNhbWVlciBQdWphciDQv9C40YjQ
tdGCOgo+Pj4+Pj4KPj4+Pj4+IE9uIDEvMjIvMjAyMCA5OjU3IFBNLCBEbWl0cnkgT3NpcGVua28g
d3JvdGU6Cj4+Pj4+Pj4gRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mg
b3IgYXR0YWNobWVudHMKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gMjIuMDEuMjAyMCAxNDo1Miwg
Sm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pj4+Pj4+PiBPbiAyMi8wMS8yMDIwIDA3OjE2LCBTYW1l
ZXIgUHVqYXIgd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC4uLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+Pj4gK3N0YXRpYyBpbnQgdGVncmEyMTBfaTJzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlCj4+Pj4+Pj4+Pj4+Pj4+PiAqcGRldikKPj4+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+
Pj4+PiArwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+Pj4+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoMKgIGlmICghcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5k
ZXYpKQo+Pj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZWdyYTIxMF9p
MnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+Pj4+Pj4+Pj4+Pj4+PiBUaGlzIGJyZWFr
cyBkZXZpY2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluCj4+Pj4+Pj4+
Pj4+Pj4+IHRoZQo+Pj4+Pj4+Pj4+Pj4+PiBhY3RpdmUKPj4+Pj4+Pj4+Pj4+Pj4gc3RhdGUuIFRo
aXMgY29kZSBzaG91bGQgYmUgcmVtb3ZlZC4gQXQgbW9zdCB5b3UgY291bGQgd2Fybgo+Pj4+Pj4+
Pj4+Pj4+PiBhYm91dCB0aGUKPj4+Pj4+Pj4+Pj4+Pj4gdW54cGVjdGVkIFJQTSBzdGF0ZSBoZXJl
LCBidXQgaXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4KPj4+Pj4+Pj4+Pj4+PiBJIGd1ZXNzIHRo
aXMgd2FzIGFkZGVkIGZvciBzYWZldHkgYW5kIGV4cGxpY2l0IHN1c3BlbmQKPj4+Pj4+Pj4+Pj4+
PiBrZWVwcyBjbG9jawo+Pj4+Pj4+Pj4+Pj4+IGRpc2FibGVkLgo+Pj4+Pj4+Pj4+Pj4+IE5vdCBz
dXJlIGlmIHJlZi1jb3VudGluZyBvZiB0aGUgZGV2aWNlIG1hdHRlcnMgd2hlbiBydW50aW1lCj4+
Pj4+Pj4+Pj4+Pj4gUE0gaXMKPj4+Pj4+Pj4+Pj4+PiBkaXNhYmxlZCBhbmQgZGV2aWNlIGlzIHJl
bW92ZWQuCj4+Pj4+Pj4+Pj4+Pj4gSSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3YXkuCj4+
Pj4+Pj4+Pj4+PiBJdCBzaG91bGQgbWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5n
KSBiZWNhdXNlIFJQTQo+Pj4+Pj4+Pj4+Pj4gc2hvdWxkCj4+Pj4+Pj4+Pj4+PiBiZSBpbgo+Pj4+
Pj4+Pj4+Pj4gYSB3cmVja2VkIHN0YXRlIG9uY2UgeW91J2xsIHRyeSB0byByZS1sb2FkIHRoZSBk
cml2ZXIncyBtb2R1bGUuCj4+Pj4+Pj4+Pj4+PiBMaWtlbHkKPj4+Pj4+Pj4+Pj4+IHRoYXQgdGhv
c2UgZmV3IG90aGVyIGRyaXZlcnMgYXJlIHdyb25nLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
IFtzbmlwXQo+Pj4+Pj4+Pj4+PiBPbmNlIHRoZSBkcml2ZXIgaXMgcmUtbG9hZGVkIGFuZCBSUE0g
aXMgZW5hYmxlZCwgSSBkb24ndAo+Pj4+Pj4+Pj4+PiB0aGluayBpdAo+Pj4+Pj4+Pj4+PiB3b3Vs
ZCB1c2UKPj4+Pj4+Pj4+Pj4gdGhlIHNhbWUgJ2RldicgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHJl
ZiBjb3VudC4gRG9lc24ndCBpdAo+Pj4+Pj4+Pj4+PiB1c2UgdGhlCj4+Pj4+Pj4+Pj4+IG5ldwo+
Pj4+Pj4+Pj4+PiBjb3VudGVycz8KPj4+Pj4+Pj4+Pj4gSWYgUlBNIGlzIG5vdCB3b3JraW5nIGZv
ciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQKPj4+Pj4+Pj4+Pj4gYmUgdGhlCj4+
Pj4+Pj4+Pj4+IGNhc2UKPj4+Pj4+Pj4+Pj4gZm9yIG90aGVyCj4+Pj4+Pj4+Pj4+IGRldmljZXMu
IFdoYXQgYmVzdCBkcml2ZXIgY2FuIGRvIGlzIHByb2JhYmx5IGRvIGEgZm9yY2Ugc3VzcGVuZAo+
Pj4+Pj4+Pj4+PiBkdXJpbmcKPj4+Pj4+Pj4+Pj4gcmVtb3ZhbCBpZgo+Pj4+Pj4+Pj4+PiBhbHJl
YWR5IG5vdCBkb25lLiBJIHdvdWxkIHByZWZlciB0byBrZWVwLCBzaW5jZSBtdWx0aXBsZSBkcml2
ZXJzCj4+Pj4+Pj4+Pj4+IHN0aWxsCj4+Pj4+Pj4+Pj4+IGhhdmUgaXQsCj4+Pj4+Pj4+Pj4+IHVu
bGVzcyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBzby4KPj4+Pj4+Pj4+PiBJIHRvb2sg
YSBjbG9zZXIgbG9vayBhbmQgbG9va3MgbGlrZSB0aGUgY291bnRlciBhY3R1YWxseQo+Pj4+Pj4+
Pj4+IHNob3VsZCBiZQo+Pj4+Pj4+Pj4+IHJlc2V0LiBTdGlsbCBJIGRvbid0IHRoaW5rIHRoYXQg
aXQncyBhIGdvb2QgcHJhY3RpY2UgdG8gbWFrZQo+Pj4+Pj4+Pj4+IGNoYW5nZXMKPj4+Pj4+Pj4+
PiB1bmRlcm5lYXRoIG9mIFJQTSwgaXQgbWF5IHN0cmlrZSBiYWNrLgo+Pj4+Pj4+Pj4gSWYgUlBN
IGlzIGJyb2tlbiwgaXQgcHJvYmFibHkgd291bGQgaGF2ZSBiZWVuIGNhdWdodCBkdXJpbmcgZGV2
aWNlCj4+Pj4+Pj4+PiB1c2FnZS4KPj4+Pj4+Pj4+IEkgd2lsbCByZW1vdmUgZXhwbGljaXQgc3Vz
cGVuZCBoZXJlIGlmIG5vIGFueSBjb25jZXJucyBmcm9tIG90aGVyCj4+Pj4+Pj4+PiBmb2xrcy4K
Pj4+Pj4+Pj4+IFRoYW5rcy4KPj4+Pj4+Pj4gSSByZWNhbGwgdGhhdCB0aGlzIHdhcyB0aGUgcHJl
ZmVycmVkIHdheSBvZiBkb2luZyB0aGlzIGZyb20gdGhlIFJQTQo+Pj4+Pj4+PiBmb2xrcy4gVGVn
cmEzMCBJMlMgZHJpdmVyIGRvZXMgdGhlIHNhbWUgYW5kIFN0ZXBoZW4gaGFkIHBvaW50ZWQKPj4+
Pj4+Pj4gbWUgdG8KPj4+Pj4+Pj4gdGhpcyBhcyBhIHJlZmVyZW5jZS4KPj4+Pj4+Pj4gSSBiZWxp
ZXZlIHRoYXQgdGhpcyBpcyBtZWFudCB0byBlbnN1cmUgdGhhdCB0aGUKPj4+Pj4+Pj4gZGV2aWNl
IGlzIGFsd2F5cyBwb3dlcmVkLW9mZiByZWdhcmRsZXNzIG9mIGl0IFJQTSBpcyBlbmFibGVkIG9y
Cj4+Pj4+Pj4+IG5vdCBhbmQKPj4+Pj4+Pj4gd2hhdCB0aGUgY3VycmVudCBzdGF0ZSBpcy4KPj4+
Pj4+PiBZZXMsIGl0IHdhcyBraW5kYSBhY3R1YWwgZm9yIHRoZSBjYXNlIG9mIHVuYXZhaWxhYmxl
IFJQTS4KPj4+Pj4+PiBBbnl3YXlzLCAvSSB0aGluay8gdmFyaWFudCBsaWtlIHRoaXMgc2hvdWxk
IGhhdmUgYmVlbiBtb3JlCj4+Pj4+Pj4gcHJlZmVycmVkOgo+Pj4+Pj4+Cj4+Pj4+Pj4gaWYgKCFw
bV9ydW50aW1lX2VuYWJsZWQoJnBkZXYtPmRldikpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHRlZ3JhMjEwX2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pj4+Pj4gZWxzZQo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7
Cj4+Pj4+PiBJIHRoaW5rIGl0IGxvb2tzIHRvIGJlIHNpbWlsYXIgdG8gd2hhdCBpcyB0aGVyZSBh
bHJlYWR5Lgo+Pj4+Pj4KPj4+Pj4+IHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsgLy8g
aXQgd291bGQgdHVybiBvdXQgdG8gYmUgYSBkdW1teQo+Pj4+Pj4gY2FsbAo+Pj4+Pj4gaWYgIVJQ
TQo+Pj4+Pj4gaWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJnBkZXYtPmRldikpIC8v
IGl0IGlzIHRydWUgYWx3YXlzCj4+Pj4+PiBpZiAhUlBNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
IHRlZ3JhMjEwX2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pj4+IE1heWJlIHRo
aXMgaXMgZmluZSBmb3IgIVJQTSwgYnV0IG5vdCByZWFsbHkgZmluZSBpbiBhIGNhc2Ugb2YgZW5h
YmxlZAo+Pj4+PiBSUE0uIERldmljZSBjb3VsZCBiZSBpbiByZXN1bWVkIHN0YXRlIGFmdGVyIHBt
X3J1bnRpbWVfZGlzYWJsZSgpIGlmIGl0Cj4+Pj4+IHdhc24ndCBzdXNwZW5kZWQgYmVmb3JlIHRo
ZSBkaXNhYmxpbmcuCj4+Pj4gSSBkb24ndCBzZWUgYW55IHByb2JsZW0gd2l0aCB0aGlzIGZvciB0
aGUgIVJQTSBjYXNlLgo+Pj4gU29ycnkgSSBtZWFudCB0aGUgUlBNIGNhc2UuIEluIG90aGVyIHdv
cmRzLCBJIGRvbid0IHNlZSBhIHByb2JsZW0gZm9yCj4+PiBuZWl0aGVyIHRoZSBSUE0gY2FzZSBv
ZiB0aGUgIVJQTSBjYXNlLgo+PiAxLiBEZXZpY2Ugc2hhbGwgYmUgaW4gUlBNLXN1c3BlbmRlZCBz
dGF0ZSBhdCB0aGUgdGltZSBvZiBkcml2ZXIncwo+PiByZW1vdmFsLCB1bmxlc3MgdGhlcmUgaXMg
YSBidWcgaW4gdGhlIHNvdW5kIGRyaXZlci4gSGVuY2Ugd2h5IGRvIHlvdQo+PiBuZWVkIHRoZSBk
ZWFkIGNvZGUgd2hpY2ggZG9lc24ndCBicmluZyBhbnkgcHJhY3RpY2FsIHZhbHVlPwo+Pgo+PiAy
LiBNYWtpbmcgY2hhbmdlcyB1bmRlcm5lYXRoIG9mIFJQTSBpcyBzaW1wbHkgZXJyb3ItcHJvbmUu
IEl0IG1heSBoaXQKPj4gYmFkbHkgaW4gdGhlIGZ1dHVyZSBvbmNlIHNvbWV0aGluZyB3aWxsIGNo
YW5nZSBpbiB0aGUgUlBNIGNvcmUuCj4gCj4gSSB0aGluayB3ZSBhcmUgc3RyZXRjaGluZyBhIGJp
dCBtb3JlIGhlcmUgd2hlbiB0aGVyZSBpcyBubyBhbnkgcmVhbCBoYXJtLgo+IFJpZ2h0IG5vdyBp
dCB3b3JrcyB3ZWxsIGZvciBib3RoIFJQTSBhbmQgIVJQTSBjYXNlIGFuZCBpZiB3ZSByZWFsbHkg
bmVlZCB0bwo+IGZpeCBzb21ldGhpbmcgaW4gZnV0dXJlIHdlIGNhbiBmaXguIFNpbmNlIG15IGlu
aXRpYWwgaW5jbGluYXRpb24gd2FzCj4ga2VlcGluZwo+IHRoZSBjb2RlIGFzIGl0IGlzIGFuZCBK
b24gYWxzbyBoYXMgc2ltaWxhciB0aG91Z2h0cywgSSB3b3VsZCByZXRhaW4gdGhpcwo+IGNvZGUu
Cj4gU29ycnkgRG1pdHJ5LCB3ZSBjYW4gZml4IGlmIHNvbWV0aGluZyBjb21lcyB1cCBhbmQgbWFu
eSBvdGhlciBkcml2ZXJzIHdvdWxkCj4gbmVlZCB0aGlzIGF0IHRoYXQgdGltZS4KClRoZSAhUlBN
IGNhc2UgaXNuJ3Qgc3VwcG9ydGVkIGJ5IFRlZ3JhIGFueW1vcmUgaW4gdXBzdHJlYW0ga2VybmVs
LiBJJ20KdHJ5aW5nIHRvIGhlbHAgdG8gbWFrZSB5b3VycyBkcml2ZXIgYmV0dGVyIGFuZCBnYXZl
IHlvdSByZWFzb25zIHRvCnJlbW92ZSB0aGUgdW5uZWVkZWQgY29kZSwgd2hpbGUgeW91J3JlIGtl
ZXAgc2F5aW5nIHRoYXQgInRoZXJlIGlzIG5vCmhhcm0gdG8gcmV0YWluIGl0Iiwgd2hpY2ggaXMg
bm90IGEgcmVhc29uIHRvIGNsdXR0ZXIgdXAgdGhlIGNvZGUuIEkKZG9uJ3QgZmVlbCB0aGF0IGl0
J3Mgd29ydGh3aGlsZSB0byBjb250aW51ZSBhcmd1aW5nIGhlcmUuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
