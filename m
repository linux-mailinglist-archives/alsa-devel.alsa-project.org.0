Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B2147737
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 04:41:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D4D1686;
	Fri, 24 Jan 2020 04:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D4D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579837268;
	bh=rpM/rm2/megdoHgDJloza1pzkoegbclg/uYPFEIOKNc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUQAVKhkk+iTEdtZmija9TRUXg5vpd7OdhPNSbCgvgck6qa6bQp/9rlwh6ottHPGT
	 zopoRGPUCxUJ6FPOl09oMZxWLbI6gx1IB6a8AAy9pUcQzzJXq5pURfGWpKFjnBuI5K
	 SnLJ0LqRVRNQLVWUMzjcm/iWJ4kk+1Jwh0azaEiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E280AF80229;
	Fri, 24 Jan 2020 04:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E98F8020C; Fri, 24 Jan 2020 04:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946EEF800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 04:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946EEF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="lsVorQu1"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2a66d60000>; Thu, 23 Jan 2020 19:39:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jan 2020 19:39:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jan 2020 19:39:17 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 03:39:12 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
 <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <d160fa01-27d0-6290-cb16-07d159d6fbb2@nvidia.com>
Date: Fri, 24 Jan 2020 09:09:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579837143; bh=dwNhjKvOnSDAczFsSdVJn+pMv7d1FeCSRweCtsZHiEk=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=lsVorQu1QfVVzW1W+cWsKDSidbRRqkEOkjjo0tcNH4auM8OAaxv7VFfnOxpDFT8tc
 t5fXBqNsXyYpSGSvq2gZMG2x2fwBuwEHY/Slsn64XzDBb88g63T2d434jbbwFkZLZw
 ebpOC/x6jYR4dyIEhNmyK1a2ubIR68Zt5zhPFDyd+vzLyGBbapdxZrNM/twk5WfI9w
 FRZnrpySgcYfEoRktNkz/DKv8yEpzUYA5ALJucf3SOTSUS5IZuJyKuz7sUXccczZiS
 MbwmdEAkFCuYHz+fxwHm6QKuNChtPvUr7J5XcMwcbJfF4+W3bBHmVgE+LrtjrJDPRU
 AtFzNuXWec5ag==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: tegra: add Tegra210 based AHUB
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

CgpPbiAxLzI0LzIwMjAgNjo0OCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDIw
LjAxLjIwMjAgMTc6MjMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IFtzbmlwXQo+PiArc3Rh
dGljIGludCB0ZWdyYV9haHViX2dldF92YWx1ZV9lbnVtKHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtj
dGwsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNuZF9jdGxf
ZWxlbV92YWx1ZSAqdWN0bCkKPj4gK3sKPj4gKyAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjbXBudCA9IHNuZF9zb2NfZGFwbV9rY29udHJvbF9jb21wb25lbnQoa2N0bCk7Cj4+ICsgICAg
IHN0cnVjdCB0ZWdyYV9haHViICphaHViID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEo
Y21wbnQpOwo+PiArICAgICBzdHJ1Y3Qgc29jX2VudW0gKmUgPSAoc3RydWN0IHNvY19lbnVtICop
a2N0bC0+cHJpdmF0ZV92YWx1ZTsKPj4gKyAgICAgdW5zaWduZWQgaW50IHJlZywgaSwgYml0X3Bv
cyA9IDA7Cj4+ICsKPj4gKyAgICAgLyoKPj4gKyAgICAgICogRmluZCB0aGUgYml0IHBvc2l0aW9u
IG9mIGN1cnJlbnQgTVVYIGlucHV0Lgo+PiArICAgICAgKiBJZiBub3RoaW5nIGlzIHNldCwgcG9z
aXRpb24gd291bGQgYmUgMCBhbmQgaXQgY29ycmVzcG9uZHMgdG8gJ05vbmUnLgo+PiArICAgICAg
Ki8KPj4gKyAgICAgZm9yIChpID0gMDsgaSA8IGFodWItPnNvY19kYXRhLT5yZWdfY291bnQ7IGkr
Kykgewo+PiArICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWdfdmFsOwo+PiArCj4+ICsgICAg
ICAgICAgICAgcmVnID0gZS0+cmVnICsgKFRFR1JBMjEwX1hCQVJfUEFSVDFfUlggKiBpKTsKPj4g
KyAgICAgICAgICAgICBzbmRfc29jX2NvbXBvbmVudF9yZWFkKGNtcG50LCByZWcsICZyZWdfdmFs
KTsKPj4gKyAgICAgICAgICAgICByZWdfdmFsICY9IGFodWItPnNvY19kYXRhLT5tYXNrW2ldOwo+
PiArCj4+ICsgICAgICAgICAgICAgaWYgKHJlZ192YWwpIHsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgIGJpdF9wb3MgPSBmZnMocmVnX3ZhbCkgKwo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICg4ICogY21wbnQtPnZhbF9ieXRlcyAqIGkpOwo+IE11bHRpcGxpY2F0aW9uIHRha2Vz
IHByZWNlZGVuY2UsIGJyYWNlcyBhcmUgbm90IG5lZWRlZC4gU2FtZSBmb3IgYWxsCj4gb3RoZXIg
b2NjdXJyZW5jZXMgaW4gdGhlIGNvZGUuCj4KPiBbc25pcF0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+PiArICAgICAgICAgICAgIH0KPj4gKyAgICAgfQo+PiArCj4+ICsgICAgIC8q
IEZpbmQgaW5kZXggcmVsYXRlZCB0byB0aGUgaXRlbSBpbiBhcnJheSAqX2FodWJfbXV4X3RleHRz
W10gKi8KPj4gKyAgICAgZm9yIChpID0gMDsgaSA8IGUtPml0ZW1zOyBpKyspIHsKPj4gKyAgICAg
ICAgICAgICBpZiAoYml0X3BvcyA9PSBlLT52YWx1ZXNbaV0pIHsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgIHVjdGwtPnZhbHVlLmVudW1lcmF0ZWQuaXRlbVswXSA9IGk7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPj4gKyAgICAgICAgICAgICB9Cj4+ICsgICAgIH0KPj4gKwo+PiAr
ICAgICByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCB0ZWdyYV9haHViX3B1dF92
YWx1ZV9lbnVtKHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjdGwsCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWN0bCkKPj4gK3sK
Pj4gKyAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudCA9IHNuZF9zb2NfZGFwbV9r
Y29udHJvbF9jb21wb25lbnQoa2N0bCk7Cj4+ICsgICAgIHN0cnVjdCB0ZWdyYV9haHViICphaHVi
ID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY21wbnQpOwo+PiArICAgICBzdHJ1Y3Qg
c25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0gPSBzbmRfc29jX2RhcG1fa2NvbnRyb2xfZGFwbShr
Y3RsKTsKPj4gKyAgICAgc3RydWN0IHNvY19lbnVtICplID0gKHN0cnVjdCBzb2NfZW51bSAqKWtj
dGwtPnByaXZhdGVfdmFsdWU7Cj4+ICsgICAgIHN0cnVjdCBzbmRfc29jX2RhcG1fdXBkYXRlIHVw
ZGF0ZVtURUdSQV9YQkFSX1VQREFURV9NQVhfUkVHXSA9IHsgfTsKPiBTaG91bGRuJ3QgdGhpcyBi
ZSB7MH0gdG8gbWFrZSBhcnJheSB6ZXJvJ2VkPwoKSXNuJ3QgaXQgdGhlIHNhbWUgd2l0aCBlbXB0
eSBicmFjZXM/Cj4KPiBbc25pcF0KPj4gK3N0YXRpYyBpbnQgdGVncmFfYWh1Yl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+PiArICAgICBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkICptYXRjaDsKPj4gKyAgICAgc3RydWN0IHRlZ3JhX2FodWIgKmFodWI7Cj4+ICsg
ICAgIHN0cnVjdCB0ZWdyYV9haHViX3NvY19kYXRhICpzb2NfZGF0YTsKPj4gKyAgICAgdm9pZCBf
X2lvbWVtICpyZWdzOwo+PiArICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKPj4gKyAgICAgaW50
IHJldDsKPj4gKwo+PiArICAgICBtYXRjaCA9IG9mX21hdGNoX2RldmljZSh0ZWdyYV9haHViX29m
X21hdGNoLCAmcGRldi0+ZGV2KTsKPj4gKyAgICAgaWYgKCFtYXRjaCkgewo+PiArICAgICAgICAg
ICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImVycm9yOiBubyBkZXZpY2UgbWF0Y2ggZm91bmRcbiIp
Owo+PiArICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+PiArICAgICB9Cj4+ICsKPj4gKyAg
ICAgc29jX2RhdGEgPSAoc3RydWN0IHRlZ3JhX2FodWJfc29jX2RhdGEgKiltYXRjaC0+ZGF0YTsK
PiBzb2NfZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKCndpbGwgdXBk
YXRlCj4+ICsgICAgIGFodWIgPSBkZXZtX2tjYWxsb2MoJnBkZXYtPmRldiwgMSwgc2l6ZW9mKCph
aHViKSwgR0ZQX0tFUk5FTCk7Cj4+ICsgICAgIGlmICghYWh1YikKPj4gKyAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArICAgICBhaHViLT5zb2NfZGF0YSA9IHNvY19kYXRhOwo+
PiArCj4+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGFodWIpOwo+PiArCj4+ICsg
ICAgIGFodWItPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiYWh1YiIpOwo+PiArICAg
ICBpZiAoSVNfRVJSKGFodWItPmNsaykpIHsKPj4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2
LT5kZXYsICJjYW4ndCByZXRyaWV2ZSBBSFVCIGNsb2NrXG4iKTsKPj4gKyAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihhaHViLT5jbGspOwo+PiArICAgICB9Cj4+ICsKPj4gKyAgICAgcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPj4gKwo+PiAr
ICAgICByZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7Cj4+ICsg
ICAgIGlmIChJU19FUlIocmVncykpCj4+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVn
cyk7Cj4gcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKCndp
bGwgdXBkYXRlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
