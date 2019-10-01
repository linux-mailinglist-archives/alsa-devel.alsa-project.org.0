Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD7C35EE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 15:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59385167C;
	Tue,  1 Oct 2019 15:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59385167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569937191;
	bh=JqB48NFuhBU0CvqFwcVc/r4HZZiY44R7oUxRDS7l67k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ive2/qx64OzB/YauGSkf+4nSgIpN7IiL2v1B7orj5q1nKJf5znKJdruBZWiPelpm8
	 ATA2iOBhaX/SHuJXhW5nzqZwlEV44kZaKJ7yzmZZ4CDbHTkw4P3/JYlZpcwTg/1+pD
	 xX58VIL/FC5naWhbGvxvmTdHUplxwVHSx4XOenow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE83EF804FF;
	Tue,  1 Oct 2019 15:38:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC4EF80506; Tue,  1 Oct 2019 15:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33763F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 15:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33763F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QkY2MhyI"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9356ba0002>; Tue, 01 Oct 2019 06:38:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 01 Oct 2019 06:37:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 01 Oct 2019 06:37:59 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 13:37:59 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct 2019
 13:37:57 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, <linux-tegra@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-2-ben.dooks@codethink.co.uk>
 <c2a7c046-011e-437b-0f09-0853d5cf7f34@nvidia.com>
 <85bb5ec6-8928-e4ea-8ca5-3ce1afcc4324@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f4e68563-e059-9f86-7340-de71c59d9a90@nvidia.com>
Date: Tue, 1 Oct 2019 14:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85bb5ec6-8928-e4ea-8ca5-3ce1afcc4324@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569937082; bh=w8sCPaGezj4QD3vGOKaOTJS3/bxHZ3Lth19aUUopw8c=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QkY2MhyIrYZXvt1QDdwN83GKd06AFc0Z67NzC4AHAH1MGOKoFxFuYPfdKxHVYMvId
 L2bnO138mlwg7uqwniuwmtgsDorPVsUQA7jV+Lfchu2e2AR1QZoeM2lN3CX2WFzdql
 jIurKN4jHQPkibfe1wlw2SqoYlNn37XWapacYfSH3qxWHGZrqHwAVxLFdgnEwhuD0O
 9+c8tHDQnoTzrH63DkWnodizESf0VCHmkO2gruSWi7UgAm1dZmju2PGfap6FmfRskQ
 gHksUpC/sFopjXGG0Sw3tR3spWd0v3v30H+o/xn0nWQsO+3Oc1/eAUMaYrnPeEIJ18
 RQI46H4QADi+A==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v3 1/7] ASoC: tegra: add a TDM
	configuration callback
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

Ck9uIDAxLzEwLzIwMTkgMTI6MDAsIEJlbiBEb29rcyB3cm90ZToKPiBPbiAzMC8wOS8yMDE5IDIx
OjQ2LCBKb24gSHVudGVyIHdyb3RlOgo+Pgo+PiBPbiAzMC8wOS8yMDE5IDE3OjUxLCBCZW4gRG9v
a3Mgd3JvdGU6Cj4+PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsu
Y28udWs+Cj4+Pgo+Pj4gQWRkIGEgY2FsbGJhY2sgdG8gY29uZmlndXJlIFRETSBzZXR0aW5ncyBm
b3IgdGhlIFRlZ3JhMzAgSTJTIEFTb0MKPj4+ICdwbGF0Zm9ybScKPj4+IGRyaXZlci4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28u
dWs+Cj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51azogbWVyZ2UgZml4IGZvciBwb3dlciBt
YW5hZ2VtZW50XQo+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGFkZCByZXZpZXcgY2hh
bmdlIGZvciBmc3luYyBvZiAxIGNsb2NrXQo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxi
ZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+Pj4gLS0tCj4+PiDCoCBzb3VuZC9zb2MvdGVncmEv
dGVncmEzMF9pMnMuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3Jh
MzBfaTJzLmMKPj4+IGluZGV4IGFjNjk4M2M2YmQ3Mi4uN2Y5ZWY2YWJlYWUyIDEwMDY0NAo+Pj4g
LS0tIGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+ICsrKyBiL3NvdW5kL3NvYy90
ZWdyYS90ZWdyYTMwX2kycy5jCj4+PiBAQCAtMjU0LDYgKzI1NCwzOCBAQCBzdGF0aWMgaW50IHRl
Z3JhMzBfaTJzX3RyaWdnZXIoc3RydWN0Cj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFt
LCBpbnQgY21kLAo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+IMKgIH0KPj4+IMKgICsvKgo+
Pj4gKyAqIFNldCB1cCBURE0KPj4+ICsgKi8KPj4+ICtzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX3Nl
dF90ZG0oc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCB0eF9tYXNrLCB1bnNpZ25lZCBpbnQgcnhfbWFz
aywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHNsb3RzLCBp
bnQgc2xvdF93aWR0aCkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCB0ZWdyYTMwX2kycyAqaTJz
ID0gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoZGFpKTsKPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50
IG1hc2ssIHZhbDsKPj4+ICsKPj4+ICvCoMKgwqAgZGV2X2RiZyhkYWktPmRldiwgIiVzOiB0eG1h
c2s9MHglMDh4IHJ4bWFzaz0weCUwOHggc2xvdHM9JWQKPj4+IHdpZHRoPSVkXG4iLAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqAgX19mdW5jX18sIHR4X21hc2ssIHJ4X21hc2ssIHNsb3RzLCBzbG90X3dp
ZHRoKTsKPj4+ICsKPj4+ICvCoMKgwqAgLyogU2V0IHVwIHNsb3RzIGFuZCB0eC9yeCBtYXNrcyAq
Lwo+Pj4gK8KgwqDCoCBtYXNrID0gVEVHUkEzMF9JMlNfU0xPVF9DVFJMX1RPVEFMX1NMT1RTX01B
U0sgfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIFRFR1JBMzBfSTJTX1NMT1RfQ1RSTF9SWF9T
TE9UX0VOQUJMRVNfTUFTSyB8Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgVEVHUkEzMF9JMlNf
U0xPVF9DVFJMX1RYX1NMT1RfRU5BQkxFU19NQVNLOwo+Pj4gKwo+Pj4gK8KgwqDCoCB2YWwgPSAo
dHhfbWFzayA8PCBURUdSQTMwX0kyU19TTE9UX0NUUkxfVFhfU0xPVF9FTkFCTEVTX1NISUZUKSB8
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIChyeF9tYXNrIDw8IFRFR1JBMzBfSTJTX1NMT1RfQ1RS
TF9SWF9TTE9UX0VOQUJMRVNfU0hJRlQpIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgKChzbG90
cyAtIDEpIDw8IFRFR1JBMzBfSTJTX1NMT1RfQ1RSTF9UT1RBTF9TTE9UU19TSElGVCk7Cj4+Cj4+
IEkgYW0gbm90IHN1cmUgd2h5IHRoaXMga2VlcHMgY2hhbmdpbmcuIFdoeSBub3Qgc2V0IHRvIDEg
YWx3YXlzPwo+IAo+IFRoaXMgaXMgdGhlIHRvdGFsIG51bWJlciBvZiBzbG90cywgbm90IHRoZSB3
aWR0aCBvZiB0aGUgZnN5bmMKPiB3aGljaCBoYXMgYmVlbiBjaGFuZ2VkIHRvIDEgYmVsb3cgdGhp
cy4KCkFoIHllcyBpbmRlZWQuIFNvcnJ5LCBzaG91bGQgaGF2ZSB3YWl0ZWQgdW50aWwgdGhpcyBt
b3JuaW5nIHRvIGxvb2sgYXQKdGhpcyEgSm9uCgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
