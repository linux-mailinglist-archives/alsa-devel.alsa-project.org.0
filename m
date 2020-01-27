Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75D149E98
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 06:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2692F1670;
	Mon, 27 Jan 2020 06:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2692F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580101854;
	bh=WWw7YBIiVqBubGfqk089k9d8SX1TPufRXIR/baz4m8s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2h3N5HUp5IUDV0uAgff1eTJzi7lZJYtdNPK9sGsdDY9AHwLUkcoqZR+HNYHzlMln
	 uk/Kj7RjiKizNK2Q1ZmQEtM5TrShHSiuYhEQV25D55boO/zJOEPt6/32B0ww7ZIesc
	 K2dNGihQx1q1n4/ZnUzo5TMMmgx0oENfEr8jk50Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC1B1F8021E;
	Mon, 27 Jan 2020 06:09:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20FE4F8021E; Mon, 27 Jan 2020 06:09:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CFCCF800C8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 06:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CFCCF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="r7zqGfrH"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2e70310000>; Sun, 26 Jan 2020 21:08:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 26 Jan 2020 21:08:50 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 26 Jan 2020 21:08:50 -0800
Received: from [10.25.73.144] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 05:08:43 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
 <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
 <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
 <8a3259b7-6875-236a-b16c-cd8e023cc8b2@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <208e3f8b-75ca-9bb0-ad43-7489709fcae0@nvidia.com>
Date: Mon, 27 Jan 2020 10:38:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8a3259b7-6875-236a-b16c-cd8e023cc8b2@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580101682; bh=LUht9Gcr7wFh+xPtTMEK2tJj/GlzVeLgVO2GrvXpTH4=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=r7zqGfrHqTIn5gRQgSMV5IVO6t8pSqTq+WbiKenqxJleVMdN9fyya9NRYRtTKyHxG
 MjhGVw8KTHShviWDQuvIHw7kj7ITLqH0Ccoz1XSSBZWj7hyJiskkKbshIES6xRtaFF
 0KooO1eM4pJ7+6xk5oe1vMe8sdaN82o/HUJ/Nn5bSjWqDMoCHltLpdosFCatZYqykc
 IESo6RZUY82fH8gMbywez8Tik4Ncpd47t62SsOPI3mmKAQNLWFxQsqqU7ptPscSJ+5
 tgvh8/OsOa1nRy2vPdMMAMKyDb/OtKlA2cATOPEDzgRU9bu+FrSiPNvn5+kMK1aMxl
 PDbr1F5GVIHhA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxLzI0LzIwMjAgOTo1NSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDI0
LjAxLjIwMjAgMDY6MjcsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Pgo+PiBPbiAxLzI0LzIw
MjAgNjo1OCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4+Cj4+Pgo+Pj4gMjAuMDEu
MjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+PiBbc25pcF0KPj4+PiArc3Rh
dGljIGJvb2wgdGVncmFfYWRtYWlmX3dyX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCByZWcpCj4+Pj4gK3sKPj4+PiArICAgICBzdHJ1Y3QgdGVncmFfYWRtYWlmICphZG1haWYg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+PiArICAgICB1bnNpZ25lZCBpbnQgY2hfc3RyaWRl
ID0gVEVHUkFfQURNQUlGX0NIQU5ORUxfUkVHX1NUUklERTsKPj4+PiArICAgICB1bnNpZ25lZCBp
bnQgbnVtX2NoID0gYWRtYWlmLT5zb2NfZGF0YS0+bnVtX2NoOwo+Pj4+ICsgICAgIHVuc2lnbmVk
IGludCByeF9iYXNlID0gYWRtYWlmLT5zb2NfZGF0YS0+cnhfYmFzZTsKPj4+PiArICAgICB1bnNp
Z25lZCBpbnQgdHhfYmFzZSA9IGFkbWFpZi0+c29jX2RhdGEtPnR4X2Jhc2U7Cj4+Pj4gKyAgICAg
dW5zaWduZWQgaW50IGdsb2JhbF9iYXNlID0gYWRtYWlmLT5zb2NfZGF0YS0+Z2xvYmFsX2Jhc2U7
Cj4+Pj4gKyAgICAgdW5zaWduZWQgaW50IHJlZ19tYXggPQo+Pj4+IGFkbWFpZi0+c29jX2RhdGEt
PnJlZ21hcF9jb25mLT5tYXhfcmVnaXN0ZXI7Cj4+Pj4gKyAgICAgdW5zaWduZWQgaW50IHJ4X21h
eCA9IHJ4X2Jhc2UgKyAobnVtX2NoICogY2hfc3RyaWRlKTsKPj4+PiArICAgICB1bnNpZ25lZCBp
bnQgdHhfbWF4ID0gdHhfYmFzZSArIChudW1fY2ggKiBjaF9zdHJpZGUpOwo+Pj4+ICsKPj4+PiAr
ICAgICBpZiAoKHJlZyA+PSByeF9iYXNlKSAmJiAocmVnIDwgcnhfbWF4KSkgewo+Pj4gVGhlIGJy
YWNlcyBhcmUgbm90IG5lZWRlZCBhcm91bmQgdGhlIGNvbXBhcmlzb25zIGJlY2F1c2UgdGhleSBw
cmVjZWRlCj4+PiB0aGUgQU5ELiBTYW1lIGZvciBhbGwgb3RoZXIgc2ltaWxhciBvY2N1cnJlbmNl
cyBpbiB0aGUgY29kZS4KPj4gV2hpbGUgdGhhdCBpcyB0cnVlLCBzb21lIHByZWZlciB0byB1c2Ug
ZXhwbGljaXQgYnJhY2VzIHRvIG1ha2UgaXQgbW9yZQo+PiByZWFkYWJsZS4KPj4gSW4gdGhlIHBh
c3QgSSB3YXMgdG9sZCB0byB1c2UgZXhwbGljaXRseSBpbiBzdWNoIGNhc2VzLgo+IEF0IGxlYXN0
IG1vc3Qgb2YgY29kZSBpbiBrZXJuZWwgKEkndmUgc2VlbikgZG9lc24ndCBoYXZlIHN1cGVyZmx1
b3VzCj4gcGFyZW5zICh0aGUgY3VydnkgdGhpbmdpZXMgYWN0dWFsbHkgc2hvdWxkIGJlIHRoZSBi
cmFjZXMpLiBSZWFkYWJpbGl0eQo+IGlzIGFyZ3VhYmxlIGluIHRoaXMgY2FzZSwgSSdtIGZpbmRp
bmcgc3VjaCBjb2RlIGEgYml0IG1vcmUgZGlmZmljdWx0IHRvCj4gcmVhZCwgYWx0aG91Z2ggaW4g
c29tZSBjYXNlcyBwYXJlbnMgYW5kIHNwYWNpbmcgbWF5IGhlbHAgdG8gcmVhZCBtb3JlCj4gY29t
cGxleCBjb25zdHJ1Y3Rpb25zLgoKWWVzIHRoaXMgaXMgc3ViamVjdGl2ZSBhbmQgZGVwZW5kcyBv
biB0aGUgaW5kaXZpZHVhbCByZWFkaW5nIHRoZSBjb2RlLiBJdCBpcwpjb25mdXNpbmcgZXZlcnkg
dGltZSwgZm9yIHRoZSBzZW5kZXIsIGFib3V0IHdoaWNoIGd1aWRlbGluZSB0byBmb2xsb3cuIApS
ZXNlbmRpbmcKdGhlIHBhdGNoL3NlcmllcyBmb3Igb25seSB0aGlzIHJlYXNvbiBtYXkgbm90IGJl
IHJlYWxseSBuZWNlc3NhcnkuIFNpbmNlIApJIG5lZWQKdG8gZml4IGNvdXBsZSBvZiBpc3N1ZXMg
aW4gdGhpcyBzZXJpZXMgSSBtYXkgY29uc2lkZXIgcmVtb3ZpbmcgdGhlIApleHBsaWNpdCBicmFj
ZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
