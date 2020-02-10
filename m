Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F7157367
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 12:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0BF1676;
	Mon, 10 Feb 2020 12:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0BF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581333876;
	bh=lcPEJkSTwiT3Dfgz5oNHesYeiiKeQN3WLB1udkCBjfs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBosTxrbnGbGajdxVI44Fx9ozbuP7qPhCGPN/WV/e/7ouEQBTYQzj1V2jCri5TQZK
	 YgaDxtZuQGlT3UoILpz6rRcsiQsl7TeS/RPbSKKlhJX/lTKgjywCFeYrF368NEXm9G
	 H2tshy+7uB7S0/NyLCtIiSt48qIyN+Vs80/42btQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BD9F800FD;
	Mon, 10 Feb 2020 12:22:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF454F80157; Mon, 10 Feb 2020 12:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD0EF800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 12:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD0EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Dv5g3JHf"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e413cfa0000>; Mon, 10 Feb 2020 03:22:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 03:22:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 10 Feb 2020 03:22:48 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 11:22:43 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
 <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
 <40a4d544-7c33-3f28-0b9c-384bc9fe3b53@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3cb0642f-46be-26e0-4090-f82981538a09@nvidia.com>
Date: Mon, 10 Feb 2020 16:52:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <40a4d544-7c33-3f28-0b9c-384bc9fe3b53@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581333754; bh=D0y6xeonACafAuD+vXIgDjhVKU1a9PB64HFqz8+HmFs=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Dv5g3JHfPme0U1x/ORxA4oCce9xyttHVQXD0j5xoFs+aLm48ch9H+pAjWSuWdcWdk
 r+LsPCy2yiXMjnSbVTtZdri/kh/o9509s3MHd1nLsC2olV9tqPuEOdK0KAHXuVbDOD
 4DI0YEtWXgk+uYbREBCO1po1FmGp+cfovfajz6aPAxA0o5LNKBHfdvJ3Kl+2k9Es9g
 fGtQQ6ClCV6GH93GFDfbGY930t+a/g3rS3D1Acn6ihQMIXxopsWYt6rOSAgOqPUIpp
 vFd2r/5OeHfK7TzehQm1ISfC0xPBmXVyt/AiAYtg2YJz1c5vyk1ULhmxQXAKD0oxT5
 d2y7DBi8tyk2w==
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 0/9] add ASoC components for AHUB
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

CgpPbiAyLzcvMjAyMCAxMTo1NSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDA3
LjAyLjIwMjAgMTQ6MzAsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Pgo+PiBPbiAyLzYvMjAy
MCAxMTowNiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4+Cj4+Pgo+Pj4gMzAuMDEu
MjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+PiAuLi4KPj4+PiAgICBzb3Vu
ZC9zb2MvdGVncmEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8wqAgNTYgKysK
Pj4+IFByb2JhYmx5IHdvbid0IGh1cnQgdG8gZW5hYmxlIHRoZSBuZXcgZHJpdmVycyBpbiB0aGUK
Pj4+IGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWc/Cj4+IERvIHlvdSBtZWFuLCBpZiBkcml2
ZXJzIGNhbiBiZSBlbmFibGVkPwo+IFllcywgSSBtZWFuIHRvIGVuYWJsZSB0aGVtIGluIHRoZSBk
ZWZhdWx0IGtlcm5lbCBjb25maWd1cmF0aW9uLgoKWWVzIHRoZXNlIGNhbiBiZSBlbmFibGVkIGJ5
IGRlZmF1bHQuIEkgY2FuIHB1c2ggYSBkZWZjb25maWcgcGF0Y2gsIGlmIAp0aGF0IGlzIHdoYXQg
eW91IHdlcmUgcmVmZXJyaW5nIGluIHRoZSBiZWdpbm5pbmcuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
