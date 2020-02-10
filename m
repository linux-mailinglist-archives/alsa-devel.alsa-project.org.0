Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50B15734F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 12:17:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5E8166F;
	Mon, 10 Feb 2020 12:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5E8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581333427;
	bh=oizMH2WwK0qCV+UVBUfLRWg8TI7NJGsVE5lDHCa2YXc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDKLeF0WgMGwELKunKXXThU1CcOwj+o2hg4TMxmefUhe7e2cWKLNIhYrU5pbD7rWO
	 SNhQXAAgFT8D1iTallWfh6lIjyUK7uBN4tAUPFpOgybmYEAYsb2g2ZEGFkb6pxWfCo
	 nY9pKkz5xG0Y15bzzmnTAQUtC0q534IgJA2akZV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7301FF80118;
	Mon, 10 Feb 2020 12:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F51F80157; Mon, 10 Feb 2020 12:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C4BBF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 12:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C4BBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="bg+TX0Nv"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e413b030000>; Mon, 10 Feb 2020 03:14:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 03:15:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 03:15:14 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 11:15:08 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
Date: Mon, 10 Feb 2020 16:45:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581333251; bh=WuJ/yXuI1Dh+KZQlZCVWcQ74+5I0SnMra5tYUj5mEvo=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=bg+TX0NvBS/rnU/L9+9F0whahwkuD+eMLwfwyayTBaN9q1wi0PEeOTdUyF/B82lNn
 vRu66mZnWVm6HOu1uhchVBqVgz54ANkhaIkyXOECSAxcqtlFc57Sh34oPRnhH1o0Ka
 5j7xN1ivogH8DuQFTD1SN6lcLQ+UpHgCvZQG8ED1lISyv7xVS4njeVlVAllUf0h4cN
 8A1NrMkDvadFZQEexIu58GqRAvjYyV2nwUivJA1/CK3ZoDvZMOWlib7xM0hWnEPjc7
 kZ5KF2a8uIHthYW7zYBe49dYFx5I3iMfFojAwmlGfNsLRb8I9sjtThMHVIcMXqhKpj
 8zI6jS0qpGuew==
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 6/9] ASoC: tegra: add Tegra186 based
	DSPK driver
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

CgpPbiAyLzcvMjAyMCAxMTo1MiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDA3
LjAyLjIwMjAgMTQ6MjYsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Pgo+PiBPbiAyLzYvMjAy
MCAxMDo0NSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4+Cj4+Pgo+Pj4gMzAuMDEu
MjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+Pj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZGV2X3BtX29wcyB0ZWdyYTE4Nl9kc3BrX3BtX29wcyA9IHsKPj4+PiArICAgICBTRVRf
UlVOVElNRV9QTV9PUFModGVncmExODZfZHNwa19ydW50aW1lX3N1c3BlbmQsCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHRlZ3JhMTg2X2RzcGtfcnVudGltZV9yZXN1bWUsIE5VTEwpCj4+
Pj4gKyAgICAgU0VUX0xBVEVfU1lTVEVNX1NMRUVQX1BNX09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1
c3BlbmQsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1l
X2ZvcmNlX3Jlc3VtZSkKPj4+PiArfTsKPj4+IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aHkg
ZHJpdmVycyBuZWVkIHRoZSAibGF0ZSIgc3lzdGVtIHNsZWVwPwo+PiBJdCB3YXMgZG9uZSB0byBl
bnN1cmUgY29yZSBkcml2ZXJzIGFyZSBzdXNwZW5kZWQgZmlyc3QgYW5kIGRlZmVyIHRoZQo+PiBj
b2RlYyBkcml2ZXIgc3VzcGVuZAo+IFN1c3BlbmQgb3JkZXIgaXMgb3Bwb3NpdGUgdG8gdGhlIGRy
aXZlcnMgcmVnaXN0cmF0aW9uIG9yZGVyLiBJZiB0aGVyZSBpcwo+IG5vIHJlYWwgcHJvYmxlbSB3
aXRoIHRoYXQsIHRoZW4geW91IHNob3VsZCB1c2UgdGhlIGRlZmF1bHQgc3VzcGVuZAoKPiBsZXZl
bC4gUGxlYXNlIGRvbid0IHRyeSB0byBmaXggYSBub24tZXhpc3RlbnQgcHJvYmxlbXMuCgpOby4g
VGhpcyB3YXMgZG9uZSBzcGVjaWZpY2FsbHkgdG8gYWxsb3cgc291bmQgY29yZSB0byBmaXJzdCBz
dG9wIGFueSAKb25nb2luZyBhdWRpbyBhY3Rpdml0eSBkdXJpbmcgbm9ybWFsIHN1c3BlbmQgYW5k
IGVuc3VyZSBhIHNhZmUgc3VzcGVuZCAKb2YgQUhVQiBkZXZpY2VzIGJ5IGRvaW5nIGEgTEFURSBz
dXNwZW5kLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
