Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D740BD3F4F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 14:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8C81612;
	Fri, 11 Oct 2019 14:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8C81612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570796154;
	bh=aMmCI4cf6NpOkm+5ekGLKoSn73w10ClYDz9fCr4Smzc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f56tRE4rOLK8rpHj7GInXCIUXsviTC7oZMXLjPTzfra0LXJo4oq0ZdfguPwqJ4CIU
	 riUsZjhw4Lj7Fx4Y27PlssQXpUHgJ+dK7ylFu+DdnR+4iF6KpnWYgEqUBlOR4DKeay
	 v3fsSwDRr1gYJDIJzf48z7V4bPbcabASaxSqoqcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C85DF802BE;
	Fri, 11 Oct 2019 14:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42A6CF802BE; Fri, 11 Oct 2019 14:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F3DEF80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 14:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F3DEF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JS6z1AKs"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BCDxBH008378;
 Fri, 11 Oct 2019 07:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570796039;
 bh=Y47zJ8uhjJ7byw1ryzmBdGwxbm/wOpRcU3RsQlXh64E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JS6z1AKsyC8RA9RwaOYu8dvf1XFzN58xn+Xqe740OAi8ZqHTW81UvNNMV5P+Q1K8E
 PflGiUAGOytceqVPS9zp6r1Tdgizww7wIKHYsdLr5RhYIgiHRGjOWKgP0iEhMBYN9s
 QnUFJs11tz58QzDKaaYsX2ainC02wx32PZUlnF0M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BCDxFu009180
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 07:13:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 07:13:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 07:13:54 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BCDw0a010726;
 Fri, 11 Oct 2019 07:13:58 -0500
To: kbuild test robot <lkp@intel.com>
References: <201910110016.g5AIyc2E%lkp@intel.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f6f9a0a1-2a24-300d-ef15-eb3f678f2f63@ti.com>
Date: Fri, 11 Oct 2019 07:13:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201910110016.g5AIyc2E%lkp@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [asoc:for-5.5 122/122]
 sound/soc/codecs/tas2562.c:195:14: sparse: sparse: restricted
 snd_pcm_format_t degrades to integer
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

TWFyawoKT24gMTAvMTAvMTkgMTE6NDEgQU0sIGtidWlsZCB0ZXN0IHJvYm90IHdyb3RlOgo+IHRy
ZWU6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJv
b25pZS9zb3VuZC5naXQgZm9yLTUuNQo+IGhlYWQ6ICAgYzE3M2RiYTQ0YzJkMmVjMmFkYWE0ZTYw
N2U5NzI5Yjc0MjM2YmQ1Nwo+IGNvbW1pdDogYzE3M2RiYTQ0YzJkMmVjMmFkYWE0ZTYwN2U5NzI5
Yjc0MjM2YmQ1NyBbMTIyLzEyMl0gQVNvQzogdGFzMjU2MjogSW50cm9kdWNlIHRoZSBUQVMyNTYy
IGFtcGxpZmllcgo+IHJlcHJvZHVjZToKPiAgICAgICAgICAjIGFwdC1nZXQgaW5zdGFsbCBzcGFy
c2UKPiAgICAgICAgICAjIHNwYXJzZSB2ZXJzaW9uOiB2MC42LjEtcmMxLTQyLWczOGVkYTUzLWRp
cnR5Cj4gICAgICAgICAgZ2l0IGNoZWNrb3V0IGMxNzNkYmE0NGMyZDJlYzJhZGFhNGU2MDdlOTcy
OWI3NDIzNmJkNTcKPiAgICAgICAgICBtYWtlIEFSQ0g9eDg2XzY0IGFsbG1vZGNvbmZpZwo+ICAg
ICAgICAgIG1ha2UgQz0xIENGPSctZmRpYWdub3N0aWMtcHJlZml4IC1EX19DSEVDS19FTkRJQU5f
XycKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcKPiBS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4KPgo+IHNwYXJz
ZSB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KQo+Cj4+PiBzb3VuZC9zb2MvY29k
ZWNzL3RhczI1NjIuYzoxOTU6MTQ6IHNwYXJzZTogc3BhcnNlOiByZXN0cmljdGVkIHNuZF9wY21f
Zm9ybWF0X3QgZGVncmFkZXMgdG8gaW50ZWdlcgo+ICAgICBzb3VuZC9zb2MvY29kZWNzL3RhczI1
NjIuYzoyMDI6MTQ6IHNwYXJzZTogc3BhcnNlOiByZXN0cmljdGVkIHNuZF9wY21fZm9ybWF0X3Qg
ZGVncmFkZXMgdG8gaW50ZWdlcgo+ICAgICBzb3VuZC9zb2MvY29kZWNzL3RhczI1NjIuYzoyMDk6
MTQ6IHNwYXJzZTogc3BhcnNlOiByZXN0cmljdGVkIHNuZF9wY21fZm9ybWF0X3QgZGVncmFkZXMg
dG8gaW50ZWdlcgo+Pj4gc291bmQvc29jL2NvZGVjcy90YXMyNTYyLmM6MjQ2OjU4OiBzcGFyc2U6
IHNwYXJzZTogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMiAoZGlmZmVyZW50IGJhc2UgdHlw
ZXMpIEBAICAgIGV4cGVjdGVkIGludCBiaXR3aWR0aCBAQCAgICBnb3QgcmVzdHJpY3RlZCBzbmRf
cGNtX2Zvcm1pbnQgYml0d2lkdGggQEAKPj4+IHNvdW5kL3NvYy9jb2RlY3MvdGFzMjU2Mi5jOjI0
Njo1ODogc3BhcnNlOiAgICBleHBlY3RlZCBpbnQgYml0d2lkdGgKPj4+IHNvdW5kL3NvYy9jb2Rl
Y3MvdGFzMjU2Mi5jOjI0Njo1ODogc3BhcnNlOiAgICBnb3QgcmVzdHJpY3RlZCBzbmRfcGNtX2Zv
cm1hdF90Cj4gICAgIHNvdW5kL3NvYy9jb2RlY3MvdGFzMjU2Mi5jOjQ3MjozOTogc3BhcnNlOiBz
cGFyc2U6IHJlc3RyaWN0ZWQgc25kX3BjbV9mb3JtYXRfdCBkZWdyYWRlcyB0byBpbnRlZ2VyCj4K
PiB2aW0gKzE5NSBzb3VuZC9zb2MvY29kZWNzL3RhczI1NjIuYwo+Cj4gICAgIDE4OQkKPiAgICAg
MTkwCXN0YXRpYyBpbnQgdGFzMjU2Ml9zZXRfYml0d2lkdGgoc3RydWN0IHRhczI1NjJfZGF0YSAq
dGFzMjU2MiwgaW50IGJpdHdpZHRoKQoKVGhlIG9ubHkgZml4IEkgY2FuIHNlZSBoZXJlIGlzIHRv
IGNoYW5nZSBiaXR3aWR0aCB0byBzbmRfcGNtX2Zvcm1hdF90IGFzIApvcHBvc2VkIHRvIGFuIGlu
dGVnZXIuCgpCdXQgdGhhdCBzdGlsbCBnaXZlcyB0aGlzIHNwYXJzZSB3YXJuaW5nLsKgIFRoZSB3
YXkgdGhlIGNvZGUgYmVsb3cgaXMgCndyaXR0ZW7CoCB0byBiZSBjb25zaXN0ZW50IHRocm91Z2hv
dXQgdGhlIGRyaXZlcnMgc28gYXJlIHRoZXNlIHdhcm5pbmdzIApmYWxzZSBwb3NpdGl2ZXM/CgpJ
IGdldCBzaW1pbGFyIG9uZXMgZm9yIHRoZSB0YXMyNzcwIGFzIHdlbGwKCkRhbgoKCj4gICAgIDE5
MQl7Cj4gICAgIDE5MgkJaW50IHJldDsKPiAgICAgMTkzCQo+ICAgICAxOTQJCXN3aXRjaCAoYml0
d2lkdGgpIHsKPiAgID4gMTk1CQljYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+IDxzbmlw
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
