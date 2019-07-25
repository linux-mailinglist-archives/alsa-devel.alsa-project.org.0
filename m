Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91D74C97
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 13:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B758E1AE2;
	Thu, 25 Jul 2019 13:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B758E1AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564053150;
	bh=sn1o62nc0L0UFC8BQh2DsJDQIGHJYOygXb/cnaPaojY=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MdN1JoeqhWplTDH/mIf7gC2wHTkyf/PGadgsT2FPgZhv4i+XHQy7hRGbe3R7Xl0WM
	 qYC9CJgL8jMJijhpQCF79IDQ52ieOKfJo/aBVKGXCKPjXahm2csiNYmhY3ozZ7ZolQ
	 wCHaT0aIb64PHebvm3y1ggXFK2bMBVM6aVQ4X5RY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5D9F803D0;
	Thu, 25 Jul 2019 13:10:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BE2BF803D0; Thu, 25 Jul 2019 13:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E88CF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 13:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E88CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BEVJJNuV"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PBAb2k067421;
 Thu, 25 Jul 2019 06:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564053037;
 bh=1/TqzuzDGbVSD4GIcQNUQ86RCt95tUpelfEHzuHniIE=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=BEVJJNuVXFc/rGl4La9rPmDetkxOlyZludy6jYE1r7XUuB2JgHxExwFxqhXxL+Fjs
 b35ZXUwdyrPRyZQxVnuxGOi37L5LT5cXnPQLLDlkcmnKiuDW9ipZ9eYAJMQ3HiQhA+
 KB+MHMqxmWE9SCuPqBEBW7S0Bi+sTohvYzKByTfU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PBAbbK038899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 06:10:37 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 06:10:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 06:10:37 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PBAZSr018559;
 Thu, 25 Jul 2019 06:10:35 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20190725102226.781-1-peter.ujfalusi@ti.com>
Message-ID: <6bd26b97-98b3-e5ab-2406-348698aaf71c@ti.com>
Date: Thu, 25 Jul 2019 14:10:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725102226.781-1-peter.ujfalusi@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-pcm: Use format size instead
 physical for sample_bits symmetry
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

CgpPbiAyNS8wNy8yMDE5IDEzLjIyLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiBGb3IgREFJcyB0
aGUgZm9ybWF0IHNpemUgaW4gYml0cyBtYXR0ZXJzIHdoZW4gaXQgY29tZXMgdG8gc3ltbWV0cnku
Cj4gVGhlIHBoeXNpY2FsIHdpZHRoIGlzIHRoZSBpbi1tZW1vcnkgZm9ybWF0IHNpemUgd2hpY2gg
bWF0dGVycyBtb3N0bHkgZm9yCj4gdGhlIHBsYXRmb3JtIGRyaXZlcnMuCj4gCj4gSWYgZm9yIGV4
YW1wbGUgYSBEQUkgcmVxdWVzdHMgc3ltbWV0cmljX3NhbXBsZWJpdHMgYW5kIHRoZSBmaXJzdCBz
dHJlYW0gaXMKPiB1c2luZyBTMjRfTEUgdGhlbiB0aGUgc2Vjb25kIHN0cmVhbSB3b3VsZCBub3Qg
YmUgYWxsb3dlZCB0byB1c2UgUzI0XzNMRQo+IGRlc3BpdGUgYm90aCBTMjRfTEUgYW5kIFMyNF8z
TEUgd291bGQgbmVlZCB0aGUgc2FtZSBjbG9ja2luZyBvbiB0aGUgYnVzLgo+IEJ1dCBTMzJfTEUg
d291bGQgYmUgYWxsb3dlZCAoUzI0X0xFIGFuZCBTMzJfTEUgaXMgYm90aCBwaHlzaWNhbGx5IDMy
IGJpdHMKPiBpbiBtZW1vcnkpIHdoaWNoIHdvdWxkIG5vdCBiZSBjb21wYXRpYmxlIHdpdGggUzI0
X0xFIG9uIHRoZSBidXMuCgpXZWxsLCB0aGlzIGlzIG5vdCBjb3JyZWN0IGVpdGhlciBhcyB0aGUK
c25kX3BjbV9od19jb25zdHJhaW50X3NpbmdsZShzdWJzdHJlYW0tPnJ1bnRpbWUsCgkJCSAgICAg
U05EUlZfUENNX0hXX1BBUkFNX1NBTVBMRV9CSVRTLAoJCQkgICAgIHNvY19kYWktPnNhbXBsZV9i
aXRzKTsKCmFwcGxpZXMgdG8gcGh5c2ljYWwgd2lkdGguCgpBZnRlciBTMjRfTEUgc3RyZWFtIHdp
dGggdGhpcyBwYXRjaCBvbmx5IFMyNF8zTEUgaXMgYWxsb3dlZCBvcHBvc2VkIHRvClMyNF9MRS9T
MzJfTEUgd2l0aG91dCBpdC4KCkkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNhbiBiZSBkb25lIGNvcnJl
Y3RseS4KClMyNF9MRSBzaG91bGQgaW1wb3NlIGNvbnN0cmFpbnQgUzI0X0xFIHwgUzI0XzNMRSBh
bmQgbm90IGFsbG93IFMzMl9MRS4KSW4gdGhlb3J5IGFueSBmb3JtYXQgd2l0aCBsZXNzIHRoYW4g
MjRiaXRzIGNvdWxkIGJlIGFsbG93ZWQgd2l0aApzbG90X3dpZHRoID0gMjQsIGJ1dCB0aGlzIG1p
Z2h0IGdvIHRvbyBmYXIuCgotIFDDqXRlcgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBVamZh
bHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2Mvc29jLXBjbS5j
IHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtcGNtLmMgYi9zb3VuZC9zb2Mv
c29jLXBjbS5jCj4gaW5kZXggMTQwNmY5MzVhZjIyLi5jNzA3MjJkYzFmNGYgMTAwNjQ0Cj4gLS0t
IGEvc291bmQvc29jL3NvYy1wY20uYwo+ICsrKyBiL3NvdW5kL3NvYy9zb2MtcGNtLmMKPiBAQCAt
MjQzLDcgKzI0Myw3IEBAIHN0YXRpYyBpbnQgc29jX3BjbV9wYXJhbXNfc3ltbWV0cnkoc3RydWN0
IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4gIAo+ICAJcmF0ZSA9IHBhcmFtc19yYXRl
KHBhcmFtcyk7Cj4gIAljaGFubmVscyA9IHBhcmFtc19jaGFubmVscyhwYXJhbXMpOwo+IC0Jc2Ft
cGxlX2JpdHMgPSBzbmRfcGNtX2Zvcm1hdF9waHlzaWNhbF93aWR0aChwYXJhbXNfZm9ybWF0KHBh
cmFtcykpOwo+ICsJc2FtcGxlX2JpdHMgPSBzbmRfcGNtX2Zvcm1hdF93aWR0aChwYXJhbXNfZm9y
bWF0KHBhcmFtcykpOwo+ICAKPiAgCS8qIHJlamVjdCB1bm1hdGNoZWQgcGFyYW1ldGVycyB3aGVu
IGFwcGx5aW5nIHN5bW1ldHJ5ICovCj4gIAlzeW1tZXRyeSA9IGNwdV9kYWktPmRyaXZlci0+c3lt
bWV0cmljX3JhdGVzIHx8Cj4gQEAgLTkzMiw3ICs5MzIsNyBAQCBzdGF0aWMgaW50IHNvY19wY21f
aHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+ICAKPiAgCQlj
b2RlY19kYWktPnJhdGUgPSBwYXJhbXNfcmF0ZSgmY29kZWNfcGFyYW1zKTsKPiAgCQljb2RlY19k
YWktPmNoYW5uZWxzID0gcGFyYW1zX2NoYW5uZWxzKCZjb2RlY19wYXJhbXMpOwo+IC0JCWNvZGVj
X2RhaS0+c2FtcGxlX2JpdHMgPSBzbmRfcGNtX2Zvcm1hdF9waHlzaWNhbF93aWR0aCgKPiArCQlj
b2RlY19kYWktPnNhbXBsZV9iaXRzID0gc25kX3BjbV9mb3JtYXRfd2lkdGgoCj4gIAkJCQkJCXBh
cmFtc19mb3JtYXQoJmNvZGVjX3BhcmFtcykpOwo+ICAKPiAgCQlzbmRfc29jX2RhcG1fdXBkYXRl
X2RhaShzdWJzdHJlYW0sICZjb2RlY19wYXJhbXMsIGNvZGVjX2RhaSk7Cj4gQEAgLTk0NSw4ICs5
NDUsNyBAQCBzdGF0aWMgaW50IHNvY19wY21faHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0
cmVhbSAqc3Vic3RyZWFtLAo+ICAJLyogc3RvcmUgdGhlIHBhcmFtZXRlcnMgZm9yIGVhY2ggREFJ
cyAqLwo+ICAJY3B1X2RhaS0+cmF0ZSA9IHBhcmFtc19yYXRlKHBhcmFtcyk7Cj4gIAljcHVfZGFp
LT5jaGFubmVscyA9IHBhcmFtc19jaGFubmVscyhwYXJhbXMpOwo+IC0JY3B1X2RhaS0+c2FtcGxl
X2JpdHMgPQo+IC0JCXNuZF9wY21fZm9ybWF0X3BoeXNpY2FsX3dpZHRoKHBhcmFtc19mb3JtYXQo
cGFyYW1zKSk7Cj4gKwljcHVfZGFpLT5zYW1wbGVfYml0cyA9IHNuZF9wY21fZm9ybWF0X3dpZHRo
KHBhcmFtc19mb3JtYXQocGFyYW1zKSk7Cj4gIAo+ICAJc25kX3NvY19kYXBtX3VwZGF0ZV9kYWko
c3Vic3RyZWFtLCBwYXJhbXMsIGNwdV9kYWkpOwo+ICAKPiAKClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
