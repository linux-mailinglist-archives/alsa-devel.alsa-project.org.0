Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72054149E9C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 06:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1544C1697;
	Mon, 27 Jan 2020 06:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1544C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580101991;
	bh=Y3WJzuCBvpBcMvSZe9QfHI/3P3449nZXOn1y7nD3/YY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWLfVy6OfKFtuT/bbb76YL3AB+5vRGTTcQ0TR2mr1bnrUHqEPRnzI4idbk9/eZJ9Z
	 cvmo2z9rCbMPvorcGarOOuAZXKwbb+RM1di3KKxZNWdJalM9Klup6OuakcBQTD29DS
	 LEzJqCBov/Tm+15KOVmEavpI/aIPyUE7HC/4+pZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B1BF80218;
	Mon, 27 Jan 2020 06:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6536F8021E; Mon, 27 Jan 2020 06:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AEA8F80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 06:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AEA8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="jHsIWxV5"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2e70c70003>; Sun, 26 Jan 2020 21:10:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 26 Jan 2020 21:11:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 26 Jan 2020 21:11:20 -0800
Received: from [10.25.73.144] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 05:11:14 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
 <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
 <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
 <229def08-6bd4-30d7-056b-92329e48c699@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <34917b2d-064f-44a9-4548-ae857e8ea29b@nvidia.com>
Date: Mon, 27 Jan 2020 10:41:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <229def08-6bd4-30d7-056b-92329e48c699@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580101831; bh=Q6yUaoXxJTOevCAJlps/t9pGjtxUfiVFCmE5POJYbT4=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=jHsIWxV51Rg6/b623cEPoy26Vm8xWFiUQDAOvxeuSq0UCOhAe6PEBL0bCHQb0d73g
 uT3PA/BHZtSli0qMdvvE/uN9dyxC97OXRuX9mAiEYi3+FpdNjq7WvwEaedohEuVEkU
 qZujM95qxrcRNpWQRYDscPYbTQkKuwUuofqHwsB5gGYJJeHj6ghhxAABCjHsGLwrGS
 /FMULN6HvwJnHSmozQ8vGQptHa4QscOyYnNvTAPWS/N0aTZ1d+egtatAMIOq6CYhyv
 wx5oWvjIH3s+uLTqcEJpwPnHT/ZspU0oA7RMuwnNg4OT/P1YsH4GOfOFtD5DsZqt/j
 F3CxkfWecvivw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
 programming
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

CgpPbiAxLzIxLzIwMjAgOTozNCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDIx
LjAxLjIwMjAgMDc6NDEsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+PiBPbiAxLzIwLzIwMjAg
OToyOCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRXh0ZXJuYWwgZW1haWw6IFVzZSBj
YXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4+Cj4+Pgo+Pj4gSGVsbG8gU2Ft
ZWVyLAo+Pj4KPj4+IDIwLjAxLjIwMjAgMTc6MjMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+
Pj4KPj4+IFtzbmlwXQo+Pj4KPj4+PiBUZWdyYTMwIGFuZCBUZWdyYTEyNCBoYXZlIGFuIGlkZW50
aWNhbCBDSUYgcHJvZ3JhbW1pbmcgaGVscGVyIGZ1bmN0aW9uLgo+Pj4gW3NuaXBdCj4+Pgo+Pj4+
IC0jZGVmaW5lIFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERfU0hJRlQgIDI0
Cj4+Pj4gLSNkZWZpbmUgVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZPX1RIUkVTSE9MRF9NQVNL
X1VTICAgICAgICAweDNmCj4+Pj4gLSNkZWZpbmUgVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZP
X1RIUkVTSE9MRF9NQVNLCj4+Pj4gKFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hP
TERfTUFTS19VUyA8PAo+Pj4+IFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERf
U0hJRlQpCj4+Pj4gLQo+Pj4+IC0vKiBDaGFubmVsIGNvdW50IG1pbnVzIDEgKi8KPj4+PiAtI2Rl
ZmluZSBURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfU0hJRlQgICAyNAo+Pj4+
IC0jZGVmaW5lIFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19NQVNLX1VTIDcK
Pj4+PiAtI2RlZmluZSBURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfTUFTSwo+
Pj4+IChURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfTUFTS19VUyA8PAo+Pj4+
IFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19TSElGVCkKPj4+IFRoZSBBVURJ
T0NJRl9DVFJMIGJpdGZpZWxkcyBhcmUgbm90IHRoZSBzYW1lIG9uIFQzMCBhbmQgVDEyNCwgd2h5
IGFyZQo+Pj4geW91IGNsYWltaW5nIHRoYXQgcHJvZ3JhbW1pbmcgaXMgaWRlbnRpY2FsPyBIYXZl
IHlvdSBhY3R1YWxseSB0cmllZCB0bwo+Pj4gdGVzdCB0aGVzZSBwYXRjaGVzIG9uIFQzMD8KPj4g
T2ggeWVzISBzZWVtcyBsaWtlIEkgb3Zlcmxvb2tlZCB0aGUgbWFjcm8gdmFsdWVzLiBUaGFua3Mg
Zm9yIHBvaW50aW5nCj4+IHRoaXMuIEkgd2lsbCByZXRhaW4gc2VwYXJhdGUgQ0lGIGZ1bmN0aW9u
IGZvciBUZWdyYTMwLgo+PiBJIGRvIG5vdCBoYXZlIGEgVGVncmEzMCBib2FyZCB3aXRoIG1lIGFu
ZCBoZW5jZSBjb3VsZCBub3QgdGVzdCBhbnl0aGluZwo+PiBzcGVjaWZpYyB0byBpdCBhcGFydCBm
cm9tIGJ1aWxkIHNhbml0eS4KPj4gSWYgc29tZW9uZSBjYW4gaGVscCBtZSB0ZXN0IEkgd291bGQg
cmVhbGx5IGFwcHJlY2lhdGUuCj4+Cj4gSSdsbCBoZWxwIHdpdGggdGhlIHRlc3Rpbmcgb25jZSBh
bGwgb2J2aW91cyBwcm9ibGVtcyB3aWxsIGJlIGZpeGVkLgoKVGhhbmtzIERtaXRyeS4gSG93ZXZl
ciBJIHBsYW4gdG8gc2VuZCBUZWdyYTMwIHJlbGF0ZWQgcGF0Y2ggc2VwYXJhdGVseS4KSW4gdGhp
cyBzZXJpZXMgSSB3aWxsIGZvY3VzIG9uIFRlZ3JhMjEwIGFuZCBsYXRlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
