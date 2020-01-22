Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914041459D0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 17:28:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D41168E;
	Wed, 22 Jan 2020 17:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D41168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579710496;
	bh=3/8D0wnRHhle3skCePHVv29+nRph5OYFACdeGv/+V6A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWM1IGpvy6v7g+xX8nt9akuc60oJhGGDqebTaqDchLKEVr9L+ExiduvhLM/DpZiXx
	 pEtFJA2E95TVBt1jNf25y6vmF7xv7Y2fHRFJGm/Vx34ml+PhOxOS1ePnsyB1+0x7b2
	 80L6md8NSGF/a+8QWoLS9504z+d2EDzJPwROO5Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B766DF8020C;
	Wed, 22 Jan 2020 17:26:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF212F8020C; Wed, 22 Jan 2020 17:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26FC7F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 17:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26FC7F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yu3i+yiQ"
Received: by mail-lj1-x242.google.com with SMTP id m26so7455291ljc.13
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 08:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5gZN3N4/NDeK/FuVtrS+9B6ytLAp8OABue4zfrSjD8=;
 b=Yu3i+yiQMP9w88lkf2iOgYfcP8beEJqfQ5FEwLhhmaKgQHd5NF/SzL29hTDxBRJbuT
 sSGSyeRp9/mx9GUWSnYJEV74TKW/VrFip4CrOnefOCzizKmtKARKsaNgR/CcLT2YNKTc
 UooEUlPQFbGihC5WvA9De7mSi/GOILvhXM9FujA0vCr9wgqSwVmNHNGfSu6PMQcoTFqH
 MW/Zd/cJHcwRvoERZTVOl47cCupwcRZxM6dcz4+aRb1uFwSBpqkua+Y2hgCfqmm9HkoS
 zlLtR0V6GmwcRYWkDbMFoBI5K80XqpN1IKtkE2WB78G+No0og2fK+G37H0WE5WPu6ODL
 lndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5gZN3N4/NDeK/FuVtrS+9B6ytLAp8OABue4zfrSjD8=;
 b=HG4N6Nh14M9ECRwur2s9hg+CS9Xm3HgkgNKExMRumICcIz2FN5GsBEtCKcCHTgZNmh
 yXLVaqmVa0GuEBNhviMhtLr5czR3H1J2OWcznCixxO550BE4xSPCGe7rgH7Ha1GyY4Fg
 +nVm0/cAYkhTqiide6+gDSMl6mS03jThXzCFuavappdp+CWcFLW+PyPyq1J930yrPOxT
 z/TlSwhR9TBqSrhmY6jnX81SzsoqLHQ+XD+RVi9nAJk8GNhGlOz0mmd887JZtuuWzsQw
 yJ0BSMiiELLKZWH9j2qR/HFUb+9CvPueHXTvnGv08hod56zKzUUYqqpB2R+qm3ApcGdA
 v4Ig==
X-Gm-Message-State: APjAAAWiExM+vHY0SjrPY55OSQcfqucKUyWn9lRxWEHcd76JwVKesM/v
 QQHSqmsxgb9iiCxQ3QXPSB8=
X-Google-Smtp-Source: APXvYqzB+dXyRK4ry9eYU9FeFVw9x6A4rswfjLmMI1UMQt6DodIyLJkMZCdUmxZ3TGyMOEI4onDtgg==
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr20026126ljk.201.1579710384616; 
 Wed, 22 Jan 2020 08:26:24 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id j19sm24605799lfb.90.2020.01.22.08.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 08:26:23 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3bf50205-efe1-7b2f-9837-0152131e4e85@gmail.com>
Date: Wed, 22 Jan 2020 19:26:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

MjIuMDEuMjAyMCAxMDoxNiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMS8y
Mi8yMDIwIDExOjUzIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEV4dGVybmFsIGVtYWls
OiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4+Cj4+Cj4+IDIyLjAx
LjIwMjAgMDc6MzIsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+PiBbc25pcF0KPj4+Pj4+PiAr
c3RhdGljIGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2
LT5kZXYpOwo+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRl
ZCgmcGRldi0+ZGV2KSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlZ3JhMjEw
X2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7Cj4+Pj4+PiBUaGlzIGJyZWFrcyBkZXZp
Y2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluIHRoZSBhY3RpdmUKPj4+
Pj4+IHN0YXRlLiBUaGlzIGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxk
IHdhcm4gYWJvdXQgdGhlCj4+Pj4+PiB1bnhwZWN0ZWQgUlBNIHN0YXRlIGhlcmUsIGJ1dCBpdCBz
aG91bGRuJ3QgYmUgbmVjZXNzYXJ5Lgo+Pj4+PiBJIGd1ZXNzIHRoaXMgd2FzIGFkZGVkIGZvciBz
YWZldHkgYW5kIGV4cGxpY2l0IHN1c3BlbmQga2VlcHMgY2xvY2sKPj4+Pj4gZGlzYWJsZWQuCj4+
Pj4+IE5vdCBzdXJlIGlmIHJlZi1jb3VudGluZyBvZiB0aGUgZGV2aWNlIG1hdHRlcnMgd2hlbiBy
dW50aW1lIFBNIGlzCj4+Pj4+IGRpc2FibGVkIGFuZCBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+Pj4g
SSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3YXkuCj4+Pj4gSXQgc2hvdWxkIG1hdHRlciAo
aWYgSSdtIG5vdCBtaXNzaW5nIHNvbWV0aGluZykgYmVjYXVzZSBSUE0gc2hvdWxkCj4+Pj4gYmUg
aW4KPj4+PiBhIHdyZWNrZWQgc3RhdGUgb25jZSB5b3UnbGwgdHJ5IHRvIHJlLWxvYWQgdGhlIGRy
aXZlcidzIG1vZHVsZS4gTGlrZWx5Cj4+Pj4gdGhhdCB0aG9zZSBmZXcgb3RoZXIgZHJpdmVycyBh
cmUgd3JvbmcuCj4+Pj4KPj4+PiBbc25pcF0KPj4+IE9uY2UgdGhlIGRyaXZlciBpcyByZS1sb2Fk
ZWQgYW5kIFJQTSBpcyBlbmFibGVkLCBJIGRvbid0IHRoaW5rIGl0Cj4+PiB3b3VsZCB1c2UKPj4+
IHRoZSBzYW1lICdkZXYnIGFuZCB0aGUgY29ycmVzcG9uZGluZyByZWYgY291bnQuIERvZXNuJ3Qg
aXQgdXNlIHRoZSBuZXcKPj4+IGNvdW50ZXJzPwo+Pj4gSWYgUlBNIGlzIG5vdCB3b3JraW5nIGZv
ciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUgdGhlIGNhc2UKPj4+IGZvciBv
dGhlcgo+Pj4gZGV2aWNlcy4gV2hhdCBiZXN0IGRyaXZlciBjYW4gZG8gaXMgcHJvYmFibHkgZG8g
YSBmb3JjZSBzdXNwZW5kIGR1cmluZwo+Pj4gcmVtb3ZhbCBpZgo+Pj4gYWxyZWFkeSBub3QgZG9u
ZS4gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCwgc2luY2UgbXVsdGlwbGUgZHJpdmVycyBzdGlsbAo+
Pj4gaGF2ZSBpdCwKPj4+IHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBzby4K
Pj4gSSB0b29rIGEgY2xvc2VyIGxvb2sgYW5kIGxvb2tzIGxpa2UgdGhlIGNvdW50ZXIgYWN0dWFs
bHkgc2hvdWxkIGJlCj4+IHJlc2V0LiBTdGlsbCBJIGRvbid0IHRoaW5rIHRoYXQgaXQncyBhIGdv
b2QgcHJhY3RpY2UgdG8gbWFrZSBjaGFuZ2VzCj4+IHVuZGVybmVhdGggb2YgUlBNLCBpdCBtYXkg
c3RyaWtlIGJhY2suCj4gCj4gSWYgUlBNIGlzIGJyb2tlbiwgaXQgcHJvYmFibHkgd291bGQgaGF2
ZSBiZWVuIGNhdWdodCBkdXJpbmcgZGV2aWNlIHVzYWdlLgo+IEkgd2lsbCByZW1vdmUgZXhwbGlj
aXQgc3VzcGVuZCBoZXJlIGlmIG5vIGFueSBjb25jZXJucyBmcm9tIG90aGVyIGZvbGtzLgo+IFRo
YW5rcy4KPj4KPj4+Pj4+PiArwqDCoMKgwqAgaW50IHJ4X2ZpZm9fdGg7Cj4+Pj4+PiBDb3VsZCBy
eF9maWZvX3RoIGJlIG5lZ2F0aXZlPwo+Pj4+PiByeF9maWZvX3RoIGl0c2VsZiBkb2VzIG5vdCB0
YWtlIG5lZ2F0aXZlIHZhbHVlcywgZXhwbGljaXQKPj4+Pj4gdHlwZWNhc3Rpbmc+IGlzIGF2b2lk
ZWQgaW4gImlmIiBjb25kaXRpb24gYnkgZGVjbGFyaW5nIHRoaXMgYXMgImludCIKPj4+PiBFeHBs
aWNpdCB0eXBlY2FzdGluZyBpc24ndCBuZWVkZWQgZm9yIGludGVnZXJzLgo+Pj4gV2hhdCBJIG1l
YW50IHdhcywgcnhfZmlmb190aCBpcyBjaGVja2VkIGFnYWluc3QgYSAnaW50JyB2YXJpYWJsZSBp
biBhbgo+Pj4gImlmIiBjb25kaXRpb24uCj4+IFdoYXQncyB0aGUgcHJvYmxlbSB3aXRoIGNvbXBh
cmluZyBvZiB1bnNpZ25lZCB3aXRoIHNpZ25lZD8KPiAKPiBjb25zaWRlciB0aGlzIGV4YW1wbGUs
Cj4gLS0tLQo+IHVuc2lnbmVkIGludCB4ID0gNTsKPiBpbnQgeSA9IC0xOwo+IAo+ICh4ID4geSkg
aXMgZmFsc2UuCgpSaWdodAoKPiAtLS0tCj4gSGVuY2Ugc2hvdWxkIGJlIGNhcmVmdWwgd2hpbGUg
dXNpbmcgc2lnbmVkIGFuZCB1bnNpZ25lZCBjb21wYXJpc29ucy4KPj4KPj4gQmVzaWRlcywgY2lm
X2NvbmYuYXVkaW9fY2ggPiBJMlNfUlhfRklGT19ERVBUSCBjYW4ndCBiZSBldmVyIHRydWUsIGlz
bid0Cj4+IGl0PyBJMlNfUlhfRklGT19ERVBUSD02NCwgY2hhbm5lbHNfbWF4PTE2Cj4gCj4gWWVz
IHRydWUuCj4+IExhc3RseSwgbm90aGluZyBzdG9wcyB5b3UgdG8gbWFrZSBtYXhfdGggdW5zaWdu
ZWQuCj4gCj4gd2lsbCB1cGRhdGUuCj4gCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
