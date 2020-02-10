Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0961157472
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 13:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641A91607;
	Mon, 10 Feb 2020 13:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641A91607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581337489;
	bh=VCFxw0qePaVFJkV5vyDQw2tUwBmQpLv8j2sY6/pF1IA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYvPzQHzTkJRKfUnnSOUmM1tj9DvJYybx5BETCrpucZKNh8dqDWgVY9G0eonZQ/kr
	 5sUJNv6vxy6DfI/qBbsnHlN/zWH4xq2wjHOAIKHSmjXCxVoEzKel2+28gWBElvaUpE
	 2wiVLIwR8dbgPDRee5p8DCQZy4hsIqszUB3xFbmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847AEF80158;
	Mon, 10 Feb 2020 13:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC320F80157; Mon, 10 Feb 2020 13:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3618DF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 13:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3618DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kEr69vlC"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e414b170000>; Mon, 10 Feb 2020 04:22:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 04:23:01 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 04:23:01 -0800
Received: from [10.26.11.122] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 12:22:57 +0000
To: Sameer Pujar <spujar@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
 <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
Date: Mon, 10 Feb 2020 12:22:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581337367; bh=Q48ZjXxd5DyM/9JMirpECQ8alliDV1CVCfS6foToQeA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kEr69vlCpsxam1NKtiahRg1il9jAuXxuZ3oT9M0TD5rImRvxPfBOHBbFNzdDwte7b
 7hxAs5gV4FlqUJH11XHtAYKHMuUCj4FkG4UVMWpltLJgODLouT3GHtseNzgaxF2g7n
 AB+P9S107xnFkO1ZO2kpe6d9pc95z4xFqlnZ04UZTo277pQ6/s6lbepsDrz/w2ujLw
 NezAMoshkD0PN+MCpvIzTTB2rWdKVorZ8zgxT/Zv9VRDXdf2bZN1EaozYlVAKT5waD
 4NZmjOlZva9xPTUPWqoNrD9TXFCDYJvvnCC51eZN8uXvN/VS7404KLEpD/azEY5ika
 msjzsMHDopLTg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDEwLzAyLzIwMjAgMTE6MTUsIFNhbWVlciBQdWphciB3cm90ZToKPiAKPiAKPiBPbiAyLzcv
MjAyMCAxMTo1MiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBFeHRlcm5hbCBlbWFpbDog
VXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Pgo+Pgo+PiAwNy4wMi4y
MDIwIDE0OjI2LCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4+Cj4+PiBPbiAyLzYvMjAyMCAx
MDo0NSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+IEV4dGVybmFsIGVtYWlsOiBVc2Ug
Y2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4+Pj4KPj4+Pgo+Pj4+IDMwLjAx
LjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+Pj4+PiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIHRlZ3JhMTg2X2RzcGtfcG1fb3BzID0gewo+Pj4+PiArwqDCoMKg
wqAgU0VUX1JVTlRJTUVfUE1fT1BTKHRlZ3JhMTg2X2RzcGtfcnVudGltZV9zdXNwZW5kLAo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZWdyYTE4
Nl9kc3BrX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQo+Pj4+PiArwqDCoMKgwqAgU0VUX0xBVEVfU1lT
VEVNX1NMRUVQX1BNX09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQsCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcG1fcnVudGltZV9mb3JjZV9yZXN1bWUpCj4+Pj4+ICt9Owo+Pj4+IENvdWxkIHlvdSBwbGVh
c2UgZXhwbGFpbiB3aHkgZHJpdmVycyBuZWVkIHRoZSAibGF0ZSIgc3lzdGVtIHNsZWVwPwo+Pj4g
SXQgd2FzIGRvbmUgdG8gZW5zdXJlIGNvcmUgZHJpdmVycyBhcmUgc3VzcGVuZGVkIGZpcnN0IGFu
ZCBkZWZlciB0aGUKPj4+IGNvZGVjIGRyaXZlciBzdXNwZW5kCj4+IFN1c3BlbmQgb3JkZXIgaXMg
b3Bwb3NpdGUgdG8gdGhlIGRyaXZlcnMgcmVnaXN0cmF0aW9uIG9yZGVyLiBJZiB0aGVyZSBpcwo+
PiBubyByZWFsIHByb2JsZW0gd2l0aCB0aGF0LCB0aGVuIHlvdSBzaG91bGQgdXNlIHRoZSBkZWZh
dWx0IHN1c3BlbmQKPiAKPj4gbGV2ZWwuIFBsZWFzZSBkb24ndCB0cnkgdG8gZml4IGEgbm9uLWV4
aXN0ZW50IHByb2JsZW1zLgo+IAo+IE5vLiBUaGlzIHdhcyBkb25lIHNwZWNpZmljYWxseSB0byBh
bGxvdyBzb3VuZCBjb3JlIHRvIGZpcnN0IHN0b3AgYW55Cj4gb25nb2luZyBhdWRpbyBhY3Rpdml0
eSBkdXJpbmcgbm9ybWFsIHN1c3BlbmQgYW5kIGVuc3VyZSBhIHNhZmUgc3VzcGVuZAo+IG9mIEFI
VUIgZGV2aWNlcyBieSBkb2luZyBhIExBVEUgc3VzcGVuZC4KCldoYXQgRG1pdHJ5IGlzIHNheWlu
ZyBpcyB0aGF0IGlmIHRoZSBEU1BLIGRyaXZlciBpcyByZWdpc3RlcmVkIGFmdGVyIHRoZQpzb3Vu
ZCBjb3JlIHRoZW4gd2Ugd2lsbCBub3QgbmVlZCB0byBzdXNwZW5kIGluIHRoZSBsYXRlIHBoYXNl
LiBUaGUgRFNQSwpkZXZpY2Ugc2hvdWxkIG9ubHkgYmUgcmVnaXN0ZXJlZCBvbmNlIHRoZSBzb3Vu
ZCBjb3JlIGlzIGxvYWRlZCwgYmVjYXVzZQpvdGhlcndpc2Ugd2Ugc2hvdWxkIGZhaWwgdG8gcmVn
aXN0ZXIgaXQgd2l0aCB0aGUgc291bmQgY29yZS4gU28gSSBkb24ndAp0aGluayB3ZSBuZWVkIHRo
aXMgdG8gYmUgbGF0ZSBhZnRlcmFsbC4KCkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
