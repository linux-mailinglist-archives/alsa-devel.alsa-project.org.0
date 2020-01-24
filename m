Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D65314772C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 04:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CFBE1685;
	Fri, 24 Jan 2020 04:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CFBE1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579836581;
	bh=/2iAp/ccV87HE2ncWuKyc841R5PBajv4gQ9EyAaxrQc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpa60UeCUHTKDP9Uhk0sMGJ3yF6ilqOVZLqNVIYbP0bWW4sGn+qc5Slpbouxyk4RU
	 WhT1QpSmBCi/2/mSvC1mrP/sI/3pjYFn7mEX9RbjLBM2wiKD9xrhlItHv6N4eQ1mF+
	 +aHAfMIoFPKQeTdt3s7u9+gNQzpGQA97CvY5dFrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F058F8020C;
	Fri, 24 Jan 2020 04:27:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D2BF8020C; Fri, 24 Jan 2020 04:27:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29C02F800BA
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 04:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29C02F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="sEiQb0pL"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2a64260000>; Thu, 23 Jan 2020 19:27:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 23 Jan 2020 19:27:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 23 Jan 2020 19:27:48 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 03:27:43 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
 <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
Date: Fri, 24 Jan 2020 08:57:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579836454; bh=/uQyjMlog0EEeGCpQdgZ8NEtOXVI02tvF1e/kfKTnrw=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=sEiQb0pLX+BpSOAzxH6fhgVWwQCGYaac7UNqj2/iT9KWSfL/lLbL1cYKxNTL5Su9n
 jVnzqfyD6BquPKUbyt4eZ7xEputbu/V7DM1DeQ1i6ykizK10qMSqOxkZ7KkL5lqu7M
 Sqw0nIvrhGI/XI1tXO2GiPKi1zISexdF2jjSTXml4uUXTLF+BLRzd9bBnYi9uhGkRR
 qJJwgZD6APTXzj85AbJdM0AYs0HrmHihgX41l+nBo78QynBQ2l1qo/UmlLgkwbIce8
 ww3E5qS1uL9MZftcDu8ys4OqM20tt0exJN9WxhL97EvKsEdQ4G3bLtddszOHmyHQSQ
 gDnIoar7Q+G8Q==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
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

CgpPbiAxLzI0LzIwMjAgNjo1OCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDIw
LjAxLjIwMjAgMTc6MjMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IFtzbmlwXQo+PiArc3Rh
dGljIGJvb2wgdGVncmFfYWRtYWlmX3dyX3JlZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCByZWcpCj4+ICt7Cj4+ICsgICAgIHN0cnVjdCB0ZWdyYV9hZG1haWYgKmFkbWFpZiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArICAgICB1bnNpZ25lZCBpbnQgY2hfc3RyaWRlID0gVEVH
UkFfQURNQUlGX0NIQU5ORUxfUkVHX1NUUklERTsKPj4gKyAgICAgdW5zaWduZWQgaW50IG51bV9j
aCA9IGFkbWFpZi0+c29jX2RhdGEtPm51bV9jaDsKPj4gKyAgICAgdW5zaWduZWQgaW50IHJ4X2Jh
c2UgPSBhZG1haWYtPnNvY19kYXRhLT5yeF9iYXNlOwo+PiArICAgICB1bnNpZ25lZCBpbnQgdHhf
YmFzZSA9IGFkbWFpZi0+c29jX2RhdGEtPnR4X2Jhc2U7Cj4+ICsgICAgIHVuc2lnbmVkIGludCBn
bG9iYWxfYmFzZSA9IGFkbWFpZi0+c29jX2RhdGEtPmdsb2JhbF9iYXNlOwo+PiArICAgICB1bnNp
Z25lZCBpbnQgcmVnX21heCA9IGFkbWFpZi0+c29jX2RhdGEtPnJlZ21hcF9jb25mLT5tYXhfcmVn
aXN0ZXI7Cj4+ICsgICAgIHVuc2lnbmVkIGludCByeF9tYXggPSByeF9iYXNlICsgKG51bV9jaCAq
IGNoX3N0cmlkZSk7Cj4+ICsgICAgIHVuc2lnbmVkIGludCB0eF9tYXggPSB0eF9iYXNlICsgKG51
bV9jaCAqIGNoX3N0cmlkZSk7Cj4+ICsKPj4gKyAgICAgaWYgKChyZWcgPj0gcnhfYmFzZSkgJiYg
KHJlZyA8IHJ4X21heCkpIHsKPiBUaGUgYnJhY2VzIGFyZSBub3QgbmVlZGVkIGFyb3VuZCB0aGUg
Y29tcGFyaXNvbnMgYmVjYXVzZSB0aGV5IHByZWNlZGUKPiB0aGUgQU5ELiBTYW1lIGZvciBhbGwg
b3RoZXIgc2ltaWxhciBvY2N1cnJlbmNlcyBpbiB0aGUgY29kZS4KCldoaWxlIHRoYXQgaXMgdHJ1
ZSwgc29tZSBwcmVmZXIgdG8gdXNlIGV4cGxpY2l0IGJyYWNlcyB0byBtYWtlIGl0IG1vcmUgCnJl
YWRhYmxlLgpJbiB0aGUgcGFzdCBJIHdhcyB0b2xkIHRvIHVzZSBleHBsaWNpdGx5IGluIHN1Y2gg
Y2FzZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
