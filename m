Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B255C14A121
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 10:47:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E61431665;
	Mon, 27 Jan 2020 10:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E61431665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580118454;
	bh=zAWEQFl3QqAaw+A7N8DqiRcSKgJAre3Skr0gboBYX2M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVu8qA6QnS871mxRW3q2TOzSZcfgRkpp/QveNN6mmtqKRJb3TY42AlZxk6udvRknw
	 aFdDOqPldEskGbZuWVQnPdzSyZS+ftPv6BQZW55PsNW3E99FSeWsXEg9NXKVfzO4OU
	 LLlbHFy2XLJoLgOeDvPGRO4mBS0oYPF1snArTyNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B5CF80082;
	Mon, 27 Jan 2020 10:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDC0DF8021E; Mon, 27 Jan 2020 10:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D7D4F80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 10:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D7D4F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ImzEWBmm"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2eb13a0000>; Mon, 27 Jan 2020 01:45:30 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jan 2020 01:45:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jan 2020 01:45:44 -0800
Received: from [10.26.11.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 09:45:41 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
 <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2c3b2533-f271-4e38-6779-d82d6da40ffd@nvidia.com>
Date: Mon, 27 Jan 2020 09:45:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580118330; bh=LsX/gVdaQaPPnhkyvm9oZIfwSci6J3ljj8zm1g3dbd8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ImzEWBmmKcCFUsxK4kbHE1C5dluhJR8sSw3L/+ojKKvQVKf36tEAzmqk8+txj/wXo
 gBISVKDazLEn1wOTmJfzwdTjCLfLx+EwtW3X2kqEgnpNu+yN49ZZWf64BGR/a3TAPG
 KB0YoZeZYL/KIcpKnIsFxhsPbHwpeYv6m2/YlFDyg1S4u7VDRD02UpAx1viIkt5lg+
 x/rcn0VuqHIu85NvDGJJ/AL3UCMaGIGZhp0U5aJadH6B4hs7oGg0VJQusfLMp++KCd
 MSbTWmbFAwhn5lKmLcN8IihPig9ZwcjiBKR6oyRb+K5+05z91qjZRLTDHJgVX4oT75
 YnAyK2god3lGQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, atalambedu@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDI0LzAxLzIwMjAgMDE6MTgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyMC4wMS4yMDIw
IDE3OjIzLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPiBbc25pcF0KPj4gK3N0YXRpYyBpbnQg
dGVncmFfYWh1Yl9nZXRfdmFsdWVfZW51bShzdHJ1Y3Qgc25kX2tjb250cm9sICprY3RsLAo+PiAr
CQkJCSAgICAgc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWN0bCkKPj4gK3sKPj4gKwlzdHJ1
Y3Qgc25kX3NvY19jb21wb25lbnQgKmNtcG50ID0gc25kX3NvY19kYXBtX2tjb250cm9sX2NvbXBv
bmVudChrY3RsKTsKPj4gKwlzdHJ1Y3QgdGVncmFfYWh1YiAqYWh1YiA9IHNuZF9zb2NfY29tcG9u
ZW50X2dldF9kcnZkYXRhKGNtcG50KTsKPj4gKwlzdHJ1Y3Qgc29jX2VudW0gKmUgPSAoc3RydWN0
IHNvY19lbnVtICopa2N0bC0+cHJpdmF0ZV92YWx1ZTsKPj4gKwl1bnNpZ25lZCBpbnQgcmVnLCBp
LCBiaXRfcG9zID0gMDsKPj4gKwo+PiArCS8qCj4+ICsJICogRmluZCB0aGUgYml0IHBvc2l0aW9u
IG9mIGN1cnJlbnQgTVVYIGlucHV0Lgo+PiArCSAqIElmIG5vdGhpbmcgaXMgc2V0LCBwb3NpdGlv
biB3b3VsZCBiZSAwIGFuZCBpdCBjb3JyZXNwb25kcyB0byAnTm9uZScuCj4+ICsJICovCj4+ICsJ
Zm9yIChpID0gMDsgaSA8IGFodWItPnNvY19kYXRhLT5yZWdfY291bnQ7IGkrKykgewo+PiArCQl1
bnNpZ25lZCBpbnQgcmVnX3ZhbDsKPj4gKwo+PiArCQlyZWcgPSBlLT5yZWcgKyAoVEVHUkEyMTBf
WEJBUl9QQVJUMV9SWCAqIGkpOwo+PiArCQlzbmRfc29jX2NvbXBvbmVudF9yZWFkKGNtcG50LCBy
ZWcsICZyZWdfdmFsKTsKPj4gKwkJcmVnX3ZhbCAmPSBhaHViLT5zb2NfZGF0YS0+bWFza1tpXTsK
Pj4gKwo+PiArCQlpZiAocmVnX3ZhbCkgewo+PiArCQkJYml0X3BvcyA9IGZmcyhyZWdfdmFsKSAr
Cj4+ICsJCQkJICAoOCAqIGNtcG50LT52YWxfYnl0ZXMgKiBpKTsKPiAKPiBNdWx0aXBsaWNhdGlv
biB0YWtlcyBwcmVjZWRlbmNlLCBicmFjZXMgYXJlIG5vdCBuZWVkZWQuIFNhbWUgZm9yIGFsbAo+
IG90aGVyIG9jY3VycmVuY2VzIGluIHRoZSBjb2RlLgoKUGVyc29uYWxseSwgSSBwcmVmZXIgdGhl
IGFib3ZlIGFzIGl0IGlzIGV4cGxpY2l0IGFuZCBoZWxwcyByZWFkYWJpbGl0eS4KCkpvbgoKLS0g
Cm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
