Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4B1514FA
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 05:31:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3988C168B;
	Tue,  4 Feb 2020 05:30:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3988C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580790695;
	bh=gZ9naoqtQEybdjuwwJxf00Kukojz1DQyrh2EGt8u7qc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O53y/4KF3gA1YR7xQrOggBN3BVg92ttFATn5jcri12+QbZsex5pW1mDHnAGs7no3k
	 uDD9jJ8uR9k/MCVCYHDsrw3uvJfNlypircOW/0vcZudt7lZY3/clbhdqp3L3lFIdgG
	 rpj/I+gZoISa4MRLJ/QMBgn1wSVjwY6derh/t+Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED9BF801DB;
	Tue,  4 Feb 2020 05:29:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C6B7F80162; Tue,  4 Feb 2020 05:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 452BFF800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 05:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 452BFF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Ecu5oqfH"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e38f2f80000>; Mon, 03 Feb 2020 20:28:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 20:29:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:29:36 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:29:31 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <125e08ae-8800-a81c-078e-e785ca9d4eaf@nvidia.com>
Date: Tue, 4 Feb 2020 09:59:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580790520; bh=wVpdIIs0547yQaMYO5AyL0NeEChuyPF6vnSMSMeoo7g=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Ecu5oqfHFKQhPHd263g8ghyvlryujc4E3xVUcTEp8RIWvBWxO3WqcC07dSxuYUWUD
 v5IuluCuxfOkqsw4yYZUnBBfccDyKyquxFoYWgNPj5NgbR83gP6p2q4hVaKRJUlzNn
 3BXQrprR4i8pSH2DVq4dtrlzFZZGTW8yHj7rnQg9Ri/c23rTgXKdGCpz483ON58Znr
 zTCexRKVA7/S8EYI4BghHxywyC1d9wrP/kCIv3QnYjWwqGvShQe7Ik+U7MSP294GvL
 nCg4hmjikgqa4A0PiVSIMR8RiytNgLkwgl5udDg5SnP3EpjVKDkRCCCU2dakBR07BW
 zSfYDB+9fgeRg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based
	AHUB driver
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

CgpPbiAxLzMwLzIwMjAgOTo1MiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDMw
LjAxLjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+IC4uLgo+PiArc3RhdGlj
IGludCB0ZWdyYV9haHViX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7
Cj4+ICsgICAgIHN0cnVjdCB0ZWdyYV9haHViICphaHViOwo+PiArICAgICB2b2lkIF9faW9tZW0g
KnJlZ3M7Cj4+ICsgICAgIGludCByZXQ7Cj4+ICsKPj4gKyAgICAgYWh1YiA9IGRldm1fa2NhbGxv
YygmcGRldi0+ZGV2LCAxLCBzaXplb2YoKmFodWIpLCBHRlBfS0VSTkVMKTsKPj4gKyAgICAgaWYg
KCFhaHViKQo+PiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+IGFodWIgPSBkZXZtX2t6
YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCphaHViKSwgR0ZQX0tFUk5FTCk7CgpFYXJsaWVyIEkg
aGFkIHRoZSBpbXByZXNzaW9uIHRoYXQgaXQgd29uJ3QgbWVtc2V0IGl0IHRvIDAuIE5vdyBsb29r
aW5nIAphdCB0aGUgaW1wbGVtZW50YXRpb24gSSBzZWUgdGhhdCBpdCB1c2VzICdfX0dGUF9aRVJP
JyBmbGFnLCB3aGljaCBJIAp0aGluayB3b3VsZCBpbml0aWFsaXplIGl0IHRvICcwJy4gV2lsbCB1
cGRhdGUuIFRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
