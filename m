Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4D1514F2
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 05:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F021F168D;
	Tue,  4 Feb 2020 05:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F021F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580790401;
	bh=O8gbT31gGSmBk8oAvBTnDqff/ePaDqYsRr1rvOCmFuo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ds18pWC5KCF1wNdkJuDqbbx9mef29DdAGBZLIlR3wyp7HIvcoCC9CmQXHJLEY9HZg
	 ybt4hNaYrgdIaDQDmh0Ib6QyQPKR3fOfw2V7Xbjk1hMv9S6LvNe1LSOWwkuZD/bTFB
	 wqqhE2o6SvF80eEo0d9tnuM7BtqZisHQ2+EZyXqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFDFF8015B;
	Tue,  4 Feb 2020 05:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33768F80162; Tue,  4 Feb 2020 05:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24E4AF800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 05:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24E4AF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qVsWiJP3"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e38f1f30000>; Mon, 03 Feb 2020 20:24:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 20:24:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:24:42 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:24:37 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
 <32d6c62d-0ac4-54e0-2efb-9f9a8cf2d271@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <62ea74fe-1f3c-e56c-669f-9a2dd9c02412@nvidia.com>
Date: Tue, 4 Feb 2020 09:54:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <32d6c62d-0ac4-54e0-2efb-9f9a8cf2d271@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580790259; bh=c7jWe5+LZRdJDnKDrOesDfCG5Wq2kGvI3fJo43SYT+M=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=qVsWiJP3Pc+CUUL/ZLo8d9Y0iCzJUjSU5/EdA5r9EnEKfftMA2EOxLnsAuA/KVsMF
 KUVPkCBC+gpmBumUOq5rvGGCD9kQDM+aQ6+d+O8Kmy1zxU0jVDZn8KMwf9sdGgxET0
 RtIdAQyLHLTaV9seQLYkwjk4o1uouRPZknEjGMkncgyBxKnywLnqq7LMQS3m/8mEPl
 wIUYM19jnqVYOEkv9OQTg8mL8TRHDZew6WUTQCGPUHu2f0pSy+r3C/LmWJgu+EY60B
 Qev/FCnAeNogiid+Ng8YZ3Niq+V7vo32L85/Nfx8v4givaZzJ4AGdXw30otGm0KhXq
 u4bbs1zQ/qN4w==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 1/9] dt-bindings: sound: tegra: add DT
	binding for AHUB
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

CgpPbiAyLzQvMjAyMCAxOjQ5IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gRXh0ZXJuYWwg
ZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPgo+Cj4gMzAu
MDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gLi4uCj4+ICtwcm9wZXJ0
aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIG9uZU9mOgo+PiArICAgICAgLSBpdGVtczoK
Pj4gKyAgICAgICAgICBjb25zdDogbnZpZGlhLHRlZ3JhMjEwLWkycwo+PiArICAgICAgLSBpdGVt
czoKPj4gKyAgICAgICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gbnZpZGlhLHRlZ3Jh
MTk0LWkycwo+PiArICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTE4Ni1pMnMKPj4gKyAgICAg
ICAgICAtIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gbnZpZGlhLHRlZ3JhMjEwLWkycwo+IENv
dWxkbid0IHRoaXMgYmUgc29tZXRoaW5nIGxpa2UgdGhpczoKPgo+IHByb3BlcnRpZXM6Cj4gICAg
Y29tcGF0aWJsZToKPiAgICAgIC0gZW51bToKPiAgICAgICAgLSBudmlkaWEsdGVncmEyMTAtaTJz
Cj4gICAgICAgIC0gbnZpZGlhLHRlZ3JhMTg2LWkycwo+ICAgICAgICAtIG52aWRpYSx0ZWdyYTE5
NC1pMnMKCkkgdXNlZCB0aGF0IHdheSBiZWNhdXNlLApGb3IgVGVncmEyMTA6IGNvbXBhdGlibGUg
PSAibnZpZGlhLHRlZ3JhMjEwLWkycyI7CkZvciBUZWdyYTE4NjogY29tcGF0aWJsZSA9ICJudmlk
aWEsdGVncmExODYtaTJzIiwgIm52aWRpYSx0ZWdyYTIxMC1pMnMiOyAKKGZ1dHVyZSBwcm9vZikK
Rm9yIFRlZ3JhMTk0OiBjb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTE5NC1pMnMiLCAibnZpZGlh
LHRlZ3JhMjEwLWkycyI7IAooZnV0dXJlIHByb29mKQoKQ3VycmVudGx5IGRyaXZlciB1c2VzICJu
dmlkaWEsdGVncmEyMTAtaTJzIiBhbG9uZS4KCllBTUwgYmluZGluZyBjaGVjayBmYWlscyBvdGhl
cndpc2UgYXMgaXQgZG9lcyBub3QgbGV0IG1lIGhhdmUgZnV0dXJlIApwcm9vZiBiaW5kaW5ncy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
