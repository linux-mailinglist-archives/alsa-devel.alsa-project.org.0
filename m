Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2B1556B0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 12:28:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7192C1673;
	Fri,  7 Feb 2020 12:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7192C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581074934;
	bh=RQLd29BaRd4uuFaA5U+pnXZCxaXXomsRig4HhcJNPv4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iz9yFJIXcrZ5wtsQVlOObWUY23WU9/XBfh2a++1GJ2VzEPkMb5q1SHjLtklk4lfdQ
	 o/etf1KZszQjT1zvLVh/Oo6AH1oTTLW8TgYPJi2FiVTM7Iuil9PLJCaj1BC2UiDEdn
	 n25kny9XrhbZIijCuPHTPMInkcWqiV75sGS+tBqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C6B6F800AB;
	Fri,  7 Feb 2020 12:27:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25985F80148; Fri,  7 Feb 2020 12:27:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76D8EF8012F
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 12:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D8EF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="adEPHWCQ"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3d494c0000>; Fri, 07 Feb 2020 03:26:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 03:27:03 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Feb 2020 03:27:03 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:26:58 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
Date: Fri, 7 Feb 2020 16:56:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581074764; bh=sPdWryWKJk0iFeTBRAv4usVTECIW90wGdKR2dRVs5Ls=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=adEPHWCQLjLn5KSgN4/Lhk8p/Xa5qi569C1pqz+YoOhsWkbsy01TkBWj1VWVL9FWs
 plAhgjkZ6TRYoVek+188rx05XSwg2AID/MH5ZUR+cJ9rGDm6FMTNB4+R6foQgW7TkR
 MUu4wpv3R1j+y3piXG3or9cAh7dm4qHZ6mhNDi7GhHGb+jBo9YZW2R/0wPT7zQInB8
 XqZT6HHFDdUhIWlDZC1qLXRrSgmKKP4rwhoJDvZjIlqbhOBUdptvf2xKseffbIiuow
 aitnPI2TE7t7xMV31w73COu7X4Tt3kpVobbs/Ox1EMI4fQ+eO4XrTiSdQBQOdXaq+K
 1cb3FhT9DQlRw==
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

CgpPbiAyLzYvMjAyMCAxMDo0NSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDMw
LjAxLjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIHRlZ3JhMTg2X2RzcGtfcG1fb3BzID0gewo+PiArICAgICBTRVRf
UlVOVElNRV9QTV9PUFModGVncmExODZfZHNwa19ydW50aW1lX3N1c3BlbmQsCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICB0ZWdyYTE4Nl9kc3BrX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQo+PiAr
ICAgICBTRVRfTEFURV9TWVNURU1fU0xFRVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVu
ZCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmNl
X3Jlc3VtZSkKPj4gK307Cj4gQ291bGQgeW91IHBsZWFzZSBleHBsYWluIHdoeSBkcml2ZXJzIG5l
ZWQgdGhlICJsYXRlIiBzeXN0ZW0gc2xlZXA/CgpJdCB3YXMgZG9uZSB0byBlbnN1cmUgY29yZSBk
cml2ZXJzIGFyZSBzdXNwZW5kZWQgZmlyc3QgYW5kIGRlZmVyIHRoZSAKY29kZWMgZHJpdmVyIHN1
c3BlbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
