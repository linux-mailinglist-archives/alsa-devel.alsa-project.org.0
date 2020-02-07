Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B7155650
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 12:05:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98AD1683;
	Fri,  7 Feb 2020 12:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98AD1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581073502;
	bh=/agv3IIt9mB0OCz4RdnUuFJ3LfN3QivCCYJoq4AJcXs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXuzjOMFGeKH0DQzfSQgkW9b6ojw2UZjougEu6B7mTKLXNKp4RjOFKlC8SzFNh2Ir
	 HWytamLqSVCc5fq5nYm+14qNJRft/0AIyURtFmSYeyZoYgGwP9Avw8o3ngLTwMSPgW
	 vm0HHrmJvgsV1yvd6gbEijjN3/njs4mJ7tATmDA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0426DF80142;
	Fri,  7 Feb 2020 12:03:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F000F80148; Fri,  7 Feb 2020 12:03:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,PRX_BODY_72,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 542C8F800B2
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 12:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 542C8F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mnxEeVCj"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3d43e20000>; Fri, 07 Feb 2020 03:02:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 03:03:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:03:13 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:03:08 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
 <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
 <1305a6db-a492-eec2-111e-ddc801d58d86@nvidia.com>
 <fb0a96bd-ac3c-0916-0337-0c86de196527@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <bb2ab8e1-a42c-6a03-1ffa-495565c8e914@nvidia.com>
Date: Fri, 7 Feb 2020 16:33:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fb0a96bd-ac3c-0916-0337-0c86de196527@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581073379; bh=DroXT/1lQUGa+TG9wgFQbKxKmkZF3WHBeukmNqYO5pI=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=mnxEeVCjfYHbbS/VgYjYRqCVpptFPlXV9vjGSSEzPW75dvpSXTDLVO0HLTFXbKudJ
 GSOUAsM1S42wvnlakqKfn0vNJcb+fNU4KvCxV+h+hcWb4GWrYnd2yLlzS44qW2hHvj
 n00Ci9VULOf2ihAUFk9lk0pjdH6qa/i9bKHYqlnMOpGhI49tIWlzmK+uKKCovHJSKX
 jhP2/WrONzqdFCBG3CwSQYRPley3yH4JHVts8WRoVYaZ8h1+TrDSmnLMIKCmOAZonQ
 iw8MEEZzaQ7HfjvzQy01/ZEfbTrnWwB171z1y4aFlFPbG7dCWhT5ZIXZTp30NCcY32
 kFRvWv0zENgCg==
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 2/9] ASoC: tegra: add support for CIF
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

CgpPbiAyLzYvMjAyMCAxMDoxOSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDA2
LjAyLjIwMjAgMTQ6NTYsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Pgo+PiBPbiAyLzUvMjAy
MCAxMDozMiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4+Cj4+Pgo+Pj4gMzAuMDEu
MjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+PiAuLi4KPj4+PiArI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4+Pj4g
KyNpbmNsdWRlICJ0ZWdyYV9jaWYuaCIKPj4+PiArCj4+Pj4gK3ZvaWQgdGVncmFfc2V0X2NpZihz
dHJ1Y3QgcmVnbWFwICpyZWdtYXAsIHVuc2lnbmVkIGludCByZWcsCj4+Pj4gKyAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdGVncmFfY2lmX2NvbmYgKmNvbmYpCj4+Pj4gK3sKPj4+PiArICAgICB1bnNp
Z25lZCBpbnQgdmFsdWU7Cj4+Pj4gKwo+Pj4+ICsgICAgIHZhbHVlID0gKGNvbmYtPnRocmVzaG9s
ZCA8PCBURUdSQV9BQ0lGX0NUUkxfRklGT19USF9TSElGVCkgfAo+Pj4+ICsgICAgICAgICAgICAg
KChjb25mLT5hdWRpb19jaCAtIDEpIDw8IFRFR1JBX0FDSUZfQ1RSTF9BVURJT19DSF9TSElGVCkg
fAo+Pj4+ICsgICAgICAgICAgICAgKChjb25mLT5jbGllbnRfY2ggLSAxKSA8PAo+Pj4+IFRFR1JB
X0FDSUZfQ1RSTF9DTElFTlRfQ0hfU0hJRlQpIHwKPj4+PiArICAgICAgICAgICAgIChjb25mLT5h
dWRpb19iaXRzIDw8IFRFR1JBX0FDSUZfQ1RSTF9BVURJT19CSVRTX1NISUZUKSB8Cj4+Pj4gKyAg
ICAgICAgICAgICAoY29uZi0+Y2xpZW50X2JpdHMgPDwgVEVHUkFfQUNJRl9DVFJMX0NMSUVOVF9C
SVRTX1NISUZUKSB8Cj4+Pj4gKyAgICAgICAgICAgICAoY29uZi0+ZXhwYW5kIDw8IFRFR1JBX0FD
SUZfQ1RSTF9FWFBBTkRfU0hJRlQpIHwKPj4+PiArICAgICAgICAgICAgIChjb25mLT5zdGVyZW9f
Y29udiA8PCBURUdSQV9BQ0lGX0NUUkxfU1RFUkVPX0NPTlZfU0hJRlQpIHwKPj4+PiArICAgICAg
ICAgICAgIChjb25mLT5yZXBsaWNhdGUgPDwgVEVHUkFfQUNJRl9DVFJMX1JFUExJQ0FURV9TSElG
VCkgfAo+Pj4+ICsgICAgICAgICAgICAgKGNvbmYtPnRydW5jYXRlIDw8IFRFR1JBX0FDSUZfQ1RS
TF9UUlVOQ0FURV9TSElGVCkgfAo+Pj4+ICsgICAgICAgICAgICAgKGNvbmYtPm1vbm9fY29udiA8
PCBURUdSQV9BQ0lGX0NUUkxfTU9OT19DT05WX1NISUZUKTsKPj4+PiArCj4+Pj4gKyAgICAgcmVn
bWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgcmVnLCBURUdSQV9BQ0lGX1VQREFURV9NQVNLLCB2YWx1
ZSk7Cj4+Pj4gK30KPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwodGVncmFfc2V0X2NpZik7Cj4+PiBB
cmUgeW91IGdvaW5nIHRvIGFkZCBtb3JlIHN0dWZmIGludG8gdGhpcyBzb3VyY2UgZmlsZSBsYXRl
ciBvbj8KPj4gWWVzIEkgcGxhbiB0byBhZGQgVGVncmEzMCBhbmQgVGVncmExMjQgQ0lGIGZ1bmN0
aW9ucyBpbiB0aGlzLiBBbnl0aGluZwo+PiByZWxhdGVkIHRvIENJRiBjYW4gYmUgbW92ZWQgaGVy
ZS4KPj4+IElmIG5vdCwgdGhlbiBpdCdzIHRvbyBtdWNoIHRvIGhhdmUgYSBzZXBhcmF0ZSBkcml2
ZXIgbW9kdWxlIGp1c3QgZm9yIGEKPj4+IHNpbmdsZSB0aW55IGZ1bmN0aW9uLCB5b3Ugc2hvdWxk
IG1vdmUgaXQgaW50byB0aGUgaGVhZGVyIGZpbGUgKG1ha2UgaXQKPj4+IGlubGluZSkuCj4gWW91
IHNob3VsZCBjb25zaWRlciB3aGV0aGVyIGl0J3Mgd29ydGggdG8gbW92ZSBhbnl0aGluZyBlbHNl
IHRvIHRoaXMKPiBtb2R1bGUgZmlyc3QsIGJlY2F1c2UgaWYgdGhlIGZ1bmN0aW9ucyBhcmUgbm90
IHJldXNhYmxlIGJ5IHRoZSBkcml2ZXJzLAo+IHRoZW4gdGhlIG1vdmVtZW50IHdvbid0IGJyaW5n
IGFueSBiZW5lZml0cyBhbmQgZmluYWwgcmVzdWx0IGNvdWxkIGJlCj4gbmVnYXRpdmUgaW4gcmVn
YXJkcyB0byB0aGUgY29kZSdzIG9yZ2FuaXphdGlvbi4KPgo+IEkgc3VnZ2VzdCB0byBzdGFydCBj
bGVhbiBhbmQgZWFzeSwgd2l0aG91dCB0aGUgZHJpdmVyIG1vZHVsZS4gWW91IHdpbGwKPiBiZSBh
YmxlIHRvIGZhY3RvciBjb2RlIGludG8gbW9kdWxlIGxhdGVyIG9uLCBvbmNlIHRoZXJlIHdpbGwg
YSByZWFsIG5lZWQKPiB0byBkbyB0aGF0LgoKVGVncmExMjQgY2FuIHJldXNlIGFib3ZlIENJRiBm
dW5jdGlvbi4gVGVncmEzMCB3aWxsIGNvbnRpbnVlIHRvIHVzZSB0aGUgCnNhbWUgZnVuY3Rpb24u
IEZvciBjb25zaXN0ZW5jeSBhbGwgQ0lGIHJlbGF0ZWQgaGVscGVycyBjYW4gYmUgZ3JvdXBlZCBh
dCAKb25lIHBsYWNlLiBCdXQgdGhpcyBpcyBmb3IgbGF0ZXIuIEkgd2lsbCBzdGFydCB3aXRoIGlu
bGluZSBmdW5jdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
