Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A8151502
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 05:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C466168B;
	Tue,  4 Feb 2020 05:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C466168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580790996;
	bh=pyOw2/4nyF3cvpbLoASYPrlMJABFwbkjSFoF36/aEsU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXdB83AWqm+JH4XKgiDO/RUxHxEMu47QuCniAZTzxUBgKmHQGmcLBOi1ejo3wM/Aj
	 4lXK/wZ41WCmaZwj3oggUMryJ9SqBnY63avaEymXRYuBSoQK8yX2HyIhag8IHExJBm
	 kHW4jitnc1yGQwzEsa+nsTP5mEI2elPrrZn9MDII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93007F8015B;
	Tue,  4 Feb 2020 05:34:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9207F80162; Tue,  4 Feb 2020 05:34:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F012FF800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 05:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F012FF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="lfn1MScF"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e38f44e0000>; Mon, 03 Feb 2020 20:34:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 20:34:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:34:45 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:34:40 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <104d2019-6505-09b1-0e9f-bcfcdd70c18e@nvidia.com>
Date: Tue, 4 Feb 2020 10:04:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580790862; bh=NSwCQ+2ljFmQNO7j63odtMCpslIrNcC8Sz110szttQU=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=lfn1MScFrfOu1ACyFaZn1We5MjYcA2OqeE0152DvpHPtGtWMqKctHUxYH25JeaKBF
 UATjyF7sC5vc2TSztTVFcCxvp1ieeFKNu3fssbwTHwKt2Jdg+Zm8AxNUfH0Vn9v4tw
 Lboh5DkBy0pSwN37H7FlUlQrfMNylAI02lwTj+I9nuHcnwyBhTLh/If6C7wFIfajdN
 E3zqngGu3aE2Tkf7i3yW9os/ZCYxWau9FUEhEiifNN1Yaa29jwktdxwOVOt/MG6cma
 JIL8csFlc2rnNhziFmWZOsBLYIL2qePFOyoabBcR8v1Ktl75WncpgqhsSBIALXz20s
 cTS/jPZT29q4Q==
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

CgpPbiAxLzMwLzIwMjAgMTA6MzkgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiBFeHRlcm5h
bCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Cj4KPiAz
MC4wMS4yMDIwIDEzOjMzLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPiAuLi4KPj4gKyAgICAg
cmV0ID0gZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgmcGRldi0+ZGV2LAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFodWItPnNvY19kYXRhLT5j
bXBudF9kcnYsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YWh1Yi0+c29jX2RhdGEtPmRhaV9kcnYsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWh1Yi0+c29jX2RhdGEtPm51bV9kYWlzKTsKPj4gKyAgICAgaWYgKHJl
dCA8IDApIHsKPj4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
cmVnaXN0ZXIgY29tcG9uZW50LCBlcnI6ICVkXG4iLAo+PiArICAgICAgICAgICAgICAgICAgICAg
cmV0KTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiArICAgICB9Cj4gSW4gdGhlIHRo
ZSBwYXRjaCAjNCAoIkFTb0M6IHRlZ3JhOiBhZGQgVGVncmEyMTAgYmFzZWQgSTJTIGRyaXZlciIp
IEkgc2VlCj4gdGhlIGZvbGxvd2luZzoKPgo+ICAgICAgICAgIHJldCA9IGRldm1fc25kX3NvY19y
ZWdpc3Rlcl9jb21wb25lbnQoZGV2LCAmdGVncmEyMTBfaTJzX2NtcG50LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVncmEyMTBfaTJzX2RhaXMsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKHRlZ3JhMjEwX2ky
c19kYWlzKSk7Cj4gICAgICAgICAgaWYgKHJldCAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgImNhbid0IHJlZ2lzdGVyIEkyUyBjb21wb25lbnQsIGVycjogJWRcbiIsIHJl
dCk7Cj4gICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAgIH0KPgo+IFBsZWFz
ZSBiZSBjb25zaXN0ZW50IGluIHJlZ2FyZHMgdG8gZXJyb3JzIGNoZWNraW5nLiBUaGUgY29ycmVj
dCB2YXJpYW50Cj4gc2hvdWxkIGJlOiBpZiAocmV0ICE9IDApLiBVc3VhbGx5IGVycm9yIGNvZGVz
IGFyZSBhIG5lZ2F0aXZlIHZhbHVlLCBidXQKPiBpdCBpcyBtdWNoIHNhZmVyIHRvIGNoZWNrIHdo
ZXRoZXIgdmFsdWUgaXNuJ3QgMCBpbiBhbGwgY2FzZXMgd2hlcmUKPiBwb3NpdGl2ZSB2YWx1ZSBp
c24ndCBleHBlY3RlZCB0byBoYXBwZW4uCgp5ZXMgImlmIChyZXQpIiBpcyBnb29kIGVub3VnaCBp
biBzdWNoIGNhc2VzLgo+Cj4gSSdkIGFsc28gcmVjb21tZW5kIHRvIHJlbmFtZSBhbGwgInJldCIg
dmFyaWFibGVzIHRvICJlcnIiIGV2ZXJ5d2hlcmUgaW4KPiB0aGUgY29kZSB3aGVyZSByZXR1cm5l
ZCB2YWx1ZSBpcyB1c2VkIG9ubHkgZm9yIGVycm9ycyBjaGVja2luZy4gVGhpcwo+IHdpbGwgbWFr
ZSBjb2RlIG1vcmUgZXhwbGljaXQsIGFuZCBoZW5jZSwgZWFzaWVyIHRvIHJlYWQgYW5kIGZvbGxv
dy4KCk9LLCBJIHdpbGwgdXBkYXRlIGl0IHRvICdlcnInIGZvciBiZXR0ZXIuCj4KPiBTbywgaXQg
d2lsbCBiZSBuaWNlciB0byB3cml0ZSBpdCBhczoKPgo+ICAgICAgICAgIGVyciA9IGRldm1fc25k
X3NvY19yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRldiwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFodWItPnNvY19kYXRhLT5jbXBudF9kcnYsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhaHViLT5zb2NfZGF0YS0+ZGFpX2Ry
diwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFodWItPnNvY19k
YXRhLT5udW1fZGFpcyk7Cj4gICAgICAgICAgaWYgKGVycikgewo+ICAgICAgICAgICAgICAgICAg
ZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNvbXBvbmVudDogJWRcbiIs
IGVycik7Cj4gICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICAgICAgICAgIH0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
