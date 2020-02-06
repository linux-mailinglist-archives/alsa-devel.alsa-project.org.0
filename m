Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E715439F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 12:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B3E16A4;
	Thu,  6 Feb 2020 12:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B3E16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580990325;
	bh=92hfVIlKXieGYMfnqSfr8ZFU1sNjqlkbz3qdC51BCbU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iy9jqVd3cq6z52o9ON2qIh/hDsyKmmBEITeks5ULVQa84FRecIMxyh1m+Xq47zRgA
	 HVp3gsAWH9Xsd9/BS/g+oXxJFg+hPV5Jsygb5wQPRM3+DFLHM4hylh/8TuybiOk1MD
	 aeRMYRAn2dsSk7/NaxpjJXk1x2J0gxhjhQkvtq7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99232F80059;
	Thu,  6 Feb 2020 12:57:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04A0F80162; Thu,  6 Feb 2020 12:57:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E916CF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 12:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E916CF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UNGce86v"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3bfecd0002>; Thu, 06 Feb 2020 03:55:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Feb 2020 03:56:55 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Feb 2020 03:56:55 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Feb
 2020 11:56:50 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
 <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <1305a6db-a492-eec2-111e-ddc801d58d86@nvidia.com>
Date: Thu, 6 Feb 2020 17:26:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580990157; bh=iUPSM/V3A6BDAos6dKxs2BKrINIHdwVPZkEK84cY18A=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=UNGce86vrwf7dXG5TzHsshBC2TH6e5MSnJTd0nTqelKJky6+SVbyxdoLrNIywYqJx
 rhXe+cpscMFAV0uoL/m2pt3cOeQvGqlouFD/A01FtR1cKyHHS1HnsNCT0K2Bf5NcqK
 d8x7+/4ERSIGioKxr9qLmuiQ8EFkW49PPQQA4GNTJgiI732PtsthfhGWQVUPlk0tFj
 Y3GhITrPqld7KVF7lt7HYlb9MTIFrHAv2W0VLKb2KeRvTCaaBm7NjfbqdFCO3sAOkR
 ID1mc05uhPU0BNbJBHX+9UFq5aakQ4CvYCKMaLff9YIosSJ1A7Es2QKZlvrXYPsT4f
 KVHvK31ejK+Yg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

CgpPbiAyLzUvMjAyMCAxMDozMiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDMw
LjAxLjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IC4uLgo+PiArI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+PiArI2lu
Y2x1ZGUgInRlZ3JhX2NpZi5oIgo+PiArCj4+ICt2b2lkIHRlZ3JhX3NldF9jaWYoc3RydWN0IHJl
Z21hcCAqcmVnbWFwLCB1bnNpZ25lZCBpbnQgcmVnLAo+PiArICAgICAgICAgICAgICAgIHN0cnVj
dCB0ZWdyYV9jaWZfY29uZiAqY29uZikKPj4gK3sKPj4gKyAgICAgdW5zaWduZWQgaW50IHZhbHVl
Owo+PiArCj4+ICsgICAgIHZhbHVlID0gKGNvbmYtPnRocmVzaG9sZCA8PCBURUdSQV9BQ0lGX0NU
UkxfRklGT19USF9TSElGVCkgfAo+PiArICAgICAgICAgICAgICgoY29uZi0+YXVkaW9fY2ggLSAx
KSA8PCBURUdSQV9BQ0lGX0NUUkxfQVVESU9fQ0hfU0hJRlQpIHwKPj4gKyAgICAgICAgICAgICAo
KGNvbmYtPmNsaWVudF9jaCAtIDEpIDw8IFRFR1JBX0FDSUZfQ1RSTF9DTElFTlRfQ0hfU0hJRlQp
IHwKPj4gKyAgICAgICAgICAgICAoY29uZi0+YXVkaW9fYml0cyA8PCBURUdSQV9BQ0lGX0NUUkxf
QVVESU9fQklUU19TSElGVCkgfAo+PiArICAgICAgICAgICAgIChjb25mLT5jbGllbnRfYml0cyA8
PCBURUdSQV9BQ0lGX0NUUkxfQ0xJRU5UX0JJVFNfU0hJRlQpIHwKPj4gKyAgICAgICAgICAgICAo
Y29uZi0+ZXhwYW5kIDw8IFRFR1JBX0FDSUZfQ1RSTF9FWFBBTkRfU0hJRlQpIHwKPj4gKyAgICAg
ICAgICAgICAoY29uZi0+c3RlcmVvX2NvbnYgPDwgVEVHUkFfQUNJRl9DVFJMX1NURVJFT19DT05W
X1NISUZUKSB8Cj4+ICsgICAgICAgICAgICAgKGNvbmYtPnJlcGxpY2F0ZSA8PCBURUdSQV9BQ0lG
X0NUUkxfUkVQTElDQVRFX1NISUZUKSB8Cj4+ICsgICAgICAgICAgICAgKGNvbmYtPnRydW5jYXRl
IDw8IFRFR1JBX0FDSUZfQ1RSTF9UUlVOQ0FURV9TSElGVCkgfAo+PiArICAgICAgICAgICAgIChj
b25mLT5tb25vX2NvbnYgPDwgVEVHUkFfQUNJRl9DVFJMX01PTk9fQ09OVl9TSElGVCk7Cj4+ICsK
Pj4gKyAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgcmVnLCBURUdSQV9BQ0lGX1VQREFU
RV9NQVNLLCB2YWx1ZSk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTCh0ZWdyYV9zZXRfY2lm
KTsKPiBBcmUgeW91IGdvaW5nIHRvIGFkZCBtb3JlIHN0dWZmIGludG8gdGhpcyBzb3VyY2UgZmls
ZSBsYXRlciBvbj8KClllcyBJIHBsYW4gdG8gYWRkIFRlZ3JhMzAgYW5kIFRlZ3JhMTI0IENJRiBm
dW5jdGlvbnMgaW4gdGhpcy4gQW55dGhpbmcgCnJlbGF0ZWQgdG8gQ0lGIGNhbiBiZSBtb3ZlZCBo
ZXJlLgo+Cj4gSWYgbm90LCB0aGVuIGl0J3MgdG9vIG11Y2ggdG8gaGF2ZSBhIHNlcGFyYXRlIGRy
aXZlciBtb2R1bGUganVzdCBmb3IgYQo+IHNpbmdsZSB0aW55IGZ1bmN0aW9uLCB5b3Ugc2hvdWxk
IG1vdmUgaXQgaW50byB0aGUgaGVhZGVyIGZpbGUgKG1ha2UgaXQKPiBpbmxpbmUpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
