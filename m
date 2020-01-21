Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFD143650
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 05:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3CB167E;
	Tue, 21 Jan 2020 05:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3CB167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579581801;
	bh=yoXz1XtTIovU6ZGy4XL6rLOXD4Rm4m3H1x4B7cPG11I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tmul3tAfqjbY+InZGoSN40yIs91Tbaxhz3ayZA8bNW182loRjM8v2tZpbhs2fOWgZ
	 5E6MvoTKfbG/0bjkFQa+828GvdkmgN5434xzE2bo+HarCHLDY3zqmSynZpsLTjJLOB
	 0Qx1l5+fMRpwSSH8DoTC11Ir7TK5zR1AJKk3qVgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BE0F801D9;
	Tue, 21 Jan 2020 05:41:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 048A7F800E7; Tue, 21 Jan 2020 05:41:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA0D0F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 05:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA0D0F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="EnKysQf2"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2680e50000>; Mon, 20 Jan 2020 20:41:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 20 Jan 2020 20:41:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 20 Jan 2020 20:41:24 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jan
 2020 04:41:19 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
 <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
Date: Tue, 21 Jan 2020 10:11:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579581669; bh=GRt9U4PodCr86yU5eOb42L+DV/cuxomWCgBuTVfGcsY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=EnKysQf2VsOESTATJ6csnBbQLyGt6UD8fN0ZDiNDa5pHNJZPSq756z+cvYTNkkbUR
 UJFZvBvLGpXkRtSCG6VeBOwje4GuJ/bIGrtWbWabJb0ytEuAMf6OEmXj9QY1+i7Eij
 wY3N0EifVoSVE7jDcRa9T6gakYcJnbOGb/VyUmy/kYDYFVL/KDJo0Tj7LpzUecg/G4
 m4FUDbKigHjs669jxNj15+GX06SaH0850lcGpK38nDe6IjhcTKbqFbvm4D3L1wwk2R
 cgEfj67npqikvcgyjnrnyOpigqYZ37U+8rY75ZlUoykyl7mmLnBsNDuOc931gti59l
 QbwzC5wDwFsQQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
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

Ck9uIDEvMjAvMjAyMCA5OjI4IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gRXh0ZXJuYWwg
ZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPgo+Cj4gSGVs
bG8gU2FtZWVyLAo+Cj4gMjAuMDEuMjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6
Cj4KPiBbc25pcF0KPgo+PiBUZWdyYTMwIGFuZCBUZWdyYTEyNCBoYXZlIGFuIGlkZW50aWNhbCBD
SUYgcHJvZ3JhbW1pbmcgaGVscGVyIGZ1bmN0aW9uLgo+IFtzbmlwXQo+Cj4+IC0jZGVmaW5lIFRF
R1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERfU0hJRlQgIDI0Cj4+IC0jZGVmaW5l
IFRFR1JBMTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERfTUFTS19VUyAgICAgICAgMHgz
Zgo+PiAtI2RlZmluZSBURUdSQTEyNF9BVURJT0NJRl9DVFJMX0ZJRk9fVEhSRVNIT0xEX01BU0sg
ICAoVEVHUkExMjRfQVVESU9DSUZfQ1RSTF9GSUZPX1RIUkVTSE9MRF9NQVNLX1VTIDw8IFRFR1JB
MTI0X0FVRElPQ0lGX0NUUkxfRklGT19USFJFU0hPTERfU0hJRlQpCj4+IC0KPj4gLS8qIENoYW5u
ZWwgY291bnQgbWludXMgMSAqLwo+PiAtI2RlZmluZSBURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVE
SU9fQ0hBTk5FTFNfU0hJRlQgICAyNAo+PiAtI2RlZmluZSBURUdSQTMwX0FVRElPQ0lGX0NUUkxf
QVVESU9fQ0hBTk5FTFNfTUFTS19VUyA3Cj4+IC0jZGVmaW5lIFRFR1JBMzBfQVVESU9DSUZfQ1RS
TF9BVURJT19DSEFOTkVMU19NQVNLICAgIChURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hB
Tk5FTFNfTUFTS19VUyA8PCBURUdSQTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfU0hJ
RlQpCj4gVGhlIEFVRElPQ0lGX0NUUkwgYml0ZmllbGRzIGFyZSBub3QgdGhlIHNhbWUgb24gVDMw
IGFuZCBUMTI0LCB3aHkgYXJlCj4geW91IGNsYWltaW5nIHRoYXQgcHJvZ3JhbW1pbmcgaXMgaWRl
bnRpY2FsPyBIYXZlIHlvdSBhY3R1YWxseSB0cmllZCB0bwo+IHRlc3QgdGhlc2UgcGF0Y2hlcyBv
biBUMzA/CgpPaCB5ZXMhIHNlZW1zIGxpa2UgSSBvdmVybG9va2VkIHRoZSBtYWNybyB2YWx1ZXMu
IFRoYW5rcyBmb3IgcG9pbnRpbmcgCnRoaXMuIEkgd2lsbCByZXRhaW4gc2VwYXJhdGUgQ0lGIGZ1
bmN0aW9uIGZvciBUZWdyYTMwLgpJIGRvIG5vdCBoYXZlIGEgVGVncmEzMCBib2FyZCB3aXRoIG1l
IGFuZCBoZW5jZSBjb3VsZCBub3QgdGVzdCBhbnl0aGluZyAKc3BlY2lmaWMgdG8gaXQgYXBhcnQg
ZnJvbSBidWlsZCBzYW5pdHkuCklmIHNvbWVvbmUgY2FuIGhlbHAgbWUgdGVzdCBJIHdvdWxkIHJl
YWxseSBhcHByZWNpYXRlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
