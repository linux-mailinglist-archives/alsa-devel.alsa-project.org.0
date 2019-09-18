Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17613B616A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E03C1671;
	Wed, 18 Sep 2019 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E03C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568802456;
	bh=0lw/42EjFZbZ0TDza2Mx4LhKCobWShXm7A9ybfDtIAk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLpAVB/e19vFqrTD3AIFE1XytS9bUKOR4O25/k3AcrtR8L9906o1iaeTxMbScJu00
	 uCqtIA2HaGO8FQhvHH0i2MpBOH4iKRoQZU9gnIUIPbJjhOgmKsOL1s+Dn3wMZ29JaG
	 SstFEoD/LLRhk8sDO1zUZniSD6HtkHMib4GSEAzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23DC9F804FF;
	Wed, 18 Sep 2019 12:25:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4527F804FF; Wed, 18 Sep 2019 12:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E38AAF800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38AAF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="V+oEUoT4"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d82062a0000>; Wed, 18 Sep 2019 03:25:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 18 Sep 2019 03:25:44 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 03:25:44 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:25:43 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:25:41 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
Date: Wed, 18 Sep 2019 11:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1568802346; bh=wGGduJnQGaJZGgnKcA8Yba16L447Dx8oCOkglNgP42A=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=V+oEUoT4UnH8+BujFSVjpEZcR17UYBe0lcVaHc6zXuW3HS521HYi50y1mnm5inRxF
 PAxJuvRNSqqvd0Ip0JHj1u6mqV1vpjxtYoISteAysd6hITBkhaooB9uSKvvjZQBev/
 QO0pNPKlxQk0B6HI+C9tve1vtbdj4zcZD8AOOXqvicItwHsl81LjT2WuhHU32z2aP8
 SxgleU+z7SnoRJyp3QSu4/91hX+nlPm6LHW52NaTZSijYaAI4kGvkX070ZX2Ax5X6C
 J4gBLzIqhXFJKEHPSiEnyWNFy9BbpiTCulWkiTc9Yj29TocLpxmvw00AiO0twqPy7H
 Z+0uFRuJFEI1A==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
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

Ck9uIDE4LzA5LzIwMTkgMTE6MTEsIEJlbiBEb29rcyB3cm90ZToKPiAKPiAKPiBPbiAyMDE5LTA5
LTE4IDA5OjQyLCBKb24gSHVudGVyIHdyb3RlOgo+PiBPbiAxNy8wOS8yMDE5IDE5OjEyLCBCZW4g
RG9va3Mgd3JvdGU6Cj4+PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhp
bmsuY28udWs+Cj4+Pgo+Pj4gQWRkIGEgY2FsbGJhY2sgdG8gY29uZmlndXJlIFRETSBzZXR0aW5n
cyBmb3IgdGhlIFRlZ3JhMzAgSTJTIEFTb0MKPj4+ICdwbGF0Zm9ybScKPj4+IGRyaXZlci4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsu
Y28udWs+Cj4+PiAtLS0KPj4+IMKgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAzNCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90ZWdy
YTMwX2kycy5jCj4+PiBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+PiBpbmRleCBh
YzY5ODNjNmJkNzIuLmQzNmI0NjYyYjQyMCAxMDA2NDQKPj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdy
YS90ZWdyYTMwX2kycy5jCj4+PiArKysgYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+
Pj4gQEAgLTI1NCw2ICsyNTQsMzkgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc190cmlnZ2VyKHN0
cnVjdAo+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwgaW50IGNtZCwKPj4+IMKgwqDC
oMKgIHJldHVybiAwOwo+Pj4gwqB9Cj4+Pgo+Pj4gKy8qCj4+PiArICogU2V0IHVwIFRETQo+Pj4g
KyAqLwo+Pj4gK3N0YXRpYyBpbnQgdGVncmEzMF9pMnNfc2V0X3RkbShzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IHR4X21hc2ssIHVuc2lnbmVkIGludCByeF9tYXNrLAo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgc2xvdHMsIGludCBzbG90X3dpZHRoKQo+Pj4gK3sK
Pj4+ICvCoMKgwqAgc3RydWN0IHRlZ3JhMzBfaTJzICppMnMgPSBzbmRfc29jX2RhaV9nZXRfZHJ2
ZGF0YShkYWkpOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbWFzayA9IDAsIHZhbCA9IDA7Cj4+
PiArCj4+PiArwqDCoMKgIGRldl9pbmZvKGRhaS0+ZGV2LCAiJXM6IHNldHRpbmcgVERNOiB0eF9t
YXNrOiAweCUwOHggcnhfbWFzazoKPj4+IDB4JTA4eCAiCj4+Cj4+IGRldl9kYmcoKSBwbGVhc2Uu
IEFsc28gSSBkb24ndCB0aGluayBpdCBpcyBuZWNlc3NhcnkgdG8gcHJpbnQgYm90aCB0aGUKPj4g
ZnVuY3Rpb24gbmFtZSBhbmQgJ3NldHRpbmcgVERNJywgdGhlIGZ1bmN0aW9uIG5hbWUgc2hvdWxk
IGJlIHN1ZmZpY2llbnQuCj4gCj4gWWVzLCBhbHJlYWR5IHNvcnRlZCBmcm9tIHByZXZpb3VzIHJl
dmlldy4KPiAKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICJzbG90czogMHglMDh4ICIgIndpZHRoOiAl
ZFxuIiwKPj4KPj4gV2h5IGFyZSB0aGVyZSBleHRyYSBxdW90ZXMgaGVyZT8KPiAKPiBObyBpZGVh
LCBJJ2xsIHJlbW92ZSB0aGVzZSBsYXRlci4KPiAKPj4+ICvCoMKgwqDCoMKgwqDCoMKgIF9fZnVu
Y19fLCB0eF9tYXNrLCByeF9tYXNrLCBzbG90cywgc2xvdF93aWR0aCk+ICsKPj4+ICvCoMKgwqAg
LyogU2V0IHVwIHNsb3RzIGFuZCB0eC9yeCBtYXNrcyAqLwo+Pj4gK8KgwqDCoCBtYXNrID0gVEVH
UkEzMF9JMlNfU0xPVF9DVFJMX1RPVEFMX1NMT1RTX01BU0sgfAo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgIFRFR1JBMzBfSTJTX1NMT1RfQ1RSTF9SWF9TTE9UX0VOQUJMRVNfTUFTSyB8Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVEVHUkEzMF9JMlNfU0xPVF9DVFJMX1RYX1NMT1RfRU5BQkxF
U19NQVNLOwo+Pj4gKwo+Pj4gK8KgwqDCoCB2YWwgPSAodHhfbWFzayA8PCBURUdSQTMwX0kyU19T
TE9UX0NUUkxfVFhfU0xPVF9FTkFCTEVTX1NISUZUKSB8Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
IChyeF9tYXNrIDw8IFRFR1JBMzBfSTJTX1NMT1RfQ1RSTF9SWF9TTE9UX0VOQUJMRVNfU0hJRlQp
IHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgKChzbG90cyAtIDEpIDw8IFRFR1JBMzBfSTJTX1NM
T1RfQ1RSTF9UT1RBTF9TTE9UU19TSElGVCk7Cj4+PiArCj4+PiArwqDCoMKgIHJlZ21hcF91cGRh
dGVfYml0cyhpMnMtPnJlZ21hcCwgVEVHUkEzMF9JMlNfU0xPVF9DVFJMLCBtYXNrLCB2YWwpOwo+
Pj4gKwo+Pj4gK8KgwqDCoCAvKiBTZXQgRlNZTkMgd2lkdGggKi8KPj4+ICvCoMKgwqAgcmVnbWFw
X3VwZGF0ZV9iaXRzKGkycy0+cmVnbWFwLCBURUdSQTMwX0kyU19DSF9DVFJMLAo+Pj4gK8KgwqDC
oMKgwqDCoMKgIFRFR1JBMzBfSTJTX0NIX0NUUkxfRlNZTkNfV0lEVEhfTUFTSywKPj4+ICvCoMKg
wqDCoMKgwqDCoCAoc2xvdF93aWR0aCAtIDEpIDw8IFRFR1JBMzBfSTJTX0NIX0NUUkxfRlNZTkNf
V0lEVEhfU0hJRlQpOwo+Pgo+PiBXaGF0IGhhcHBlbnMgaWYgdGhlcmUgaXMgb25seSBvbmUgc2xv
dD8gVGhlIGZzeW5jIHdpbGwgYmUgdGhlIHdpZHRoIG9mCj4+IHRoZSBzbG90LiBUeXBpY2FsbHks
IFRETSBpcyB1c2VkIHdpdGggRFNQLUEvQiBmb3JtYXRzIGFuZCBhbHRob3VnaCB0aGUKPj4gZHJp
dmVyIGRvZXMgbm90IGFwcGVhciB0byBwcm9ncmFtIHRoZSBmc3luYyB3aWR0aCwgaXQgcHJvYmFi
bHkgc2hvdWxkCj4+IGR1cmluZyB0aGUgdGVncmEzMF9pMnNfc2V0X2ZtdCgpIGRlcGVuZGluZyBv
biB0aGUgZm9ybWF0IHVzZWQgcmF0aGVyCj4+IHRoYW4gaGVyZS4KPiAKPiBIbW0sIHNob3VsZCB3
ZSBjaGVjay4KPiAKPiBUaGUgd29yayB3YXMgZG9uZSB0byBrZWVwIGFzIGNsb3NlIHRvIHRoZSBv
cmlnaW5hbCBjbGllbnQncyAyLjYga2VybmVsCj4gYXMgcG9zc2libGUgd2hpY2ggc2V0IHRoZSBm
c3luYyBmaWVsZCB0byBhIHdob2xlIGRhdGEgd29yZC4gV2UgY291bGQgdHJ5Cj4gYW5kIGp1c3Qg
c2V0IHRoaXMgdG8gc2F5IDIgaGVyZSBhbmQgaGF2ZSBhIG11Y2ggc2hvcnRlciBmcmFtZS1zeW5j
IHB1bHNlLgo+IAo+IEknbGwgYWRkIGEgY2hlY2sgZm9yIHNsb3RzIDwgMiBhbmQgc2V0IHRoZSBm
c3luYyB3aWR0aCB0byAyLgoKV2h5IDI/IEZyb20gbG9va2luZyBhdCB2YXJpb3VzIGNvZGVjcyB0
aGF0IHN1cHBvcnQgZHNwLWEvYiBtb2RlcywgaXQgaXMKbW9yZSBjb21tb24gZm9yIHRoZSBmLXN5
bmMgdG8gYmUgMSByZWdhcmRsZXNzIG9mIHRoZSBudW1iZXIgb2Ygc2xvdHMuCgpKb24KLS0gCm52
cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
