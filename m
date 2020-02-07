Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F715565E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 12:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AFC41684;
	Fri,  7 Feb 2020 12:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AFC41684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581073700;
	bh=M33KD1RWz/9cUgPSXVyM87D9uyUt9VtXDSMKZtkCMrM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WduMQw93C8l+ohfDK1FEK4U7P8YGe3Lp4fHL33GNGgXjor6eiMCKCJ2nJffjZzdR5
	 f8NP9yW54QzL9cLREHjLKkXAxGu5QsFgPJ3/PuSNbCwZBSTsjdH9NnlGyWpXso4E1P
	 Bl/1BkvRtNzgJ68NI+5amEffKBMScIaGussZUOh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9122CF8012F;
	Fri,  7 Feb 2020 12:06:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D79F80142; Fri,  7 Feb 2020 12:06:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099C0F8012F
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 12:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099C0F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RiBDDr5x"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3d44aa0000>; Fri, 07 Feb 2020 03:06:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 03:06:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:06:32 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:06:27 +0000
To: Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
 <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3e89e75d-2f5a-dc42-98f7-8e1262afe380@nvidia.com>
Date: Fri, 7 Feb 2020 16:36:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581073578; bh=3R4H2IZWw7cTPGDMdPoqMKekUyJM+BtKnjJ790Z/Zqo=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=RiBDDr5xvmcO6DXh82HHBPn9OlvxmrN84Ur8NAesELWcxhWHETz2Qpwo349cijTe1
 QjoUYMgDdWdh+navso0UWpxkqK07SM3YLwwJm4vxYcuSF+FZzgNhr0GxxrFKsa080o
 oVYcP/MXaPYi+9wg0P4bQAW4N16lOmYMdVyIsroHaaFyr2nswdnmJ8EAXbJKRmN9f6
 Q8MZ026nkP9lw/HMi9CIG4rQYQ1+eOi80nooxaG+W8IFZ/wHsktWY02gQiFft3mIYx
 t7GXZpdxMgIR48hbR4euPfqJgOytS2V7I9ppkWKhmxHLBqMhe8s2OJOE81qaz+61nj
 5QJCcY9AKwGLA==
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 3/9] ASoC: tegra: add Tegra210 based
	DMIC driver
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

CgpPbiAyLzYvMjAyMCAxMDoyMyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDMw
LjAxLjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IC4uLgo+PiArc3RhdGlj
IGNvbnN0IHN0cnVjdCByZWdfZGVmYXVsdCB0ZWdyYTIxMF9kbWljX3JlZ19kZWZhdWx0c1tdID0g
ewo+PiArICAgICB7IFRFR1JBMjEwX0RNSUNfVFhfSU5UX01BU0ssIDB4MDAwMDAwMDF9LAo+PiAr
ICAgICB7IFRFR1JBMjEwX0RNSUNfVFhfQ0lGX0NUUkwsIDB4MDAwMDc3MDB9LAo+PiArICAgICB7
IFRFR1JBMjEwX0RNSUNfQ0csIDB4MX0sCj4+ICsgICAgIHsgVEVHUkEyMTBfRE1JQ19DVFJMLCAw
eDAwMDAwMzAxfSwKPj4gKyAgICAgLyogQmVsb3cgZW5hYmxlcyBhbGwgZmlsdGVycyAtIERDUiwg
TFAgYW5kIFNDICovCj4+ICsgICAgIHsgVEVHUkEyMTBfRE1JQ19EQkdfQ1RSTCwgMHhlIH0sCj4+
ICsgICAgIC8qIEJlbG93IGFzIHBlciBsYXRlc3QgUE9SIHZhbHVlICovCj4+ICsgICAgIHsgVEVH
UkEyMTBfRE1JQ19EQ1JfQklRVUFEXzBfQ09FRl80LCAweDB9LAo+PiArICAgICAvKiBMUCBmaWx0
ZXIgaXMgY29uZmlndXJlZCBmb3IgcGFzcyB0aHJvdWdoIGFuZCB1c2VkIHRvIGFwcGx5IGdhaW4g
Ki8KPj4gKyAgICAgeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8wX0NPRUZfMCwgMHgwMDgwMDAw
MH0sCj4+ICsgICAgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzEsIDB4MH0sCj4+
ICsgICAgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzIsIDB4MH0sCj4+ICsgICAg
IHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzMsIDB4MH0sCj4+ICsgICAgIHsgVEVH
UkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzQsIDB4MH0sCj4+ICsgICAgIHsgVEVHUkEyMTBf
RE1JQ19MUF9CSVFVQURfMV9DT0VGXzAsIDB4MDA4MDAwMDB9LAo+PiArICAgICB7IFRFR1JBMjEw
X0RNSUNfTFBfQklRVUFEXzFfQ09FRl8xLCAweDB9LAo+PiArICAgICB7IFRFR1JBMjEwX0RNSUNf
TFBfQklRVUFEXzFfQ09FRl8yLCAweDB9LAo+PiArICAgICB7IFRFR1JBMjEwX0RNSUNfTFBfQklR
VUFEXzFfQ09FRl8zLCAweDB9LAo+PiArICAgICB7IFRFR1JBMjEwX0RNSUNfTFBfQklRVUFEXzFf
Q09FRl80LCAweDB9LAo+PiArfTsKPiBJJ2QgYWRkIGEgc3BhY2Ugb24gdGhlIHJpZ2h0IHNpZGUg
b2YgYH1gLCBmb3IgY29uc2lzdGVuY3kgd2l0aCB0aGUgbGVmdC4KCkRvIHlvdSBtZWFuIGxpa2Ug
dGhpcz8KeyBURUdSQTIxMF9ETUlDX1RYX0lOVF9NQVNLLCAweDAwMDAwMDAxIH0sCnsgVEVHUkEy
MTBfRE1JQ19UWF9DSUZfQ1RSTCwgMHgwMDAwNzcwMCB9LAogwqDCoMKgIC4gLiAuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
