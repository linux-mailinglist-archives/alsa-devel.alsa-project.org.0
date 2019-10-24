Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24ACE3798
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 18:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322711700;
	Thu, 24 Oct 2019 18:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322711700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571933591;
	bh=/8Nyc8Q72XPsugvUYyfTAjGPTU2+cZY3eYSo5oMzgak=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCfBk+O0RG3t0/RDinABZZGczShOsS8yUYfAP1SC3H8nwGS9ACmXQXRcbQyXAgC38
	 O7ETaJ5dlXod3RC8bp8ahgWLMfrmQfxYMeSGKl0gxV/WZpxZ/4zES6jDkm6DEa7Xqm
	 SLtpmIixzRVXXfhNVvVG+AQjQzt0YxI/+xmagOyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A917AF80377;
	Thu, 24 Oct 2019 18:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B48BF8036B; Thu, 24 Oct 2019 18:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CA9F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 18:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CA9F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="FxYFqiPk"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5db1cd2b0002>; Thu, 24 Oct 2019 09:11:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 24 Oct 2019 09:11:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 24 Oct 2019 09:11:18 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:11:14 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:11:10 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
 <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
 <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
Date: Thu, 24 Oct 2019 17:11:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571933483; bh=/3ud5vYk3HOknP3MLwj012qN/whu0x4rGJaocEdOa9k=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FxYFqiPkM2yfv2tRc+t6lLlgweBK1LG5Y7zEGelmni5AYvcjlrd4YSbsFx45UNWs7
 iy+RAdPvuuMhfFvVqmY2UOhTysDxOIbvc04qAkH6WKWIVe726vsted2wwlRJKLmXye
 4UDANoshTibJiMz9esyVz6/pQza4xy6QDF18X5iB12XJlC5DuyUEjrdF/eEDsQUZza
 rBcMMULYhcC5wNit6H2BL5TkeJCZNBXFkIeOwQSM9WXipb8uKnXmUNPfy2Ib7d/FRf
 OI25wDmXn1x1qdAydnlfLdC93klvgI9YCe2PB7IHnqhYH2ll9uFu78TikCybfW38zM
 9sonWxszBENiQ==
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v4 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
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

Ck9uIDE3LzEwLzIwMTkgMTg6MzgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAxNy4xMC4yMDE5
IDE5OjIzLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4gT24gMDgvMTAvMjAxOSAxNjoyOSwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gSGVsbG8gQmVuLAo+Pj4KPj4+IDA3LjEwLjIwMTkgMTg6
MzEsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8ZWR3YXJk
LmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pgo+Pj4+IFRoZSBDSUYgY29uZmlndXJhdGlvbiBh
bmQgY2xvY2sgc2V0dGluZyBpcyBjdXJyZW50bHkgaGFyZCBjb2RlZCBmb3IgMgo+Pj4+IGNoYW5u
ZWxzLiBTaW5jZSB0aGUgaGFyZHdhcmUgaXMgY2FwYWJsZSBvZiBzdXBwb3J0aW5nIDEtOCBjaGFu
bmVscyBhZGQKPj4+PiBzdXBwb3J0IGZvciByZWFkaW5nIHRoZSBjaGFubmVsIGNvdW50IGZyb20g
dGhlIHN1cHBsaWVkIHBhcmFtZXRlcnMgdG8KPj4+PiBhbGxvdyBmb3IgYmV0dGVyIFRETSBzdXBw
b3J0LiBJdCBzZWVtcyB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gb2YKPj4+PiB0aGlzCj4+
Pj4gZHJpdmVyIHdhcyBmaXhlZCBhdCAyIGNoYW5uZWxzIGZvciBzaW1wbGljaXR5LCBhbmQgbm90
IGltcGxlbWVudGluZyBURE0uCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cg
PGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs6IGFkZGVkIGlzX3RkbSBhbmQgY2hhbm5lbCBuciBjaGVja10KPj4+PiBbYmVuLmRvb2tz
QGNvZGV0aGluay5jby51azogbWVyZ2UgZWRnZSBjb250cm9sIGludG8gc2V0LWZvcm1hdF0KPj4+
PiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51azogcmVtb3ZlZCBpc190ZG0gYW5kIG1vdmVkIGVk
Z2UgdG8gaHdfcGFyYW1zXQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tz
QGNvZGV0aGluay5jby51az4KPj4+PiAtLS0KPj4+PiDCoCBzb3VuZC9zb2MvdGVncmEvdGVncmEz
MF9pMnMuYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVn
cmEzMF9pMnMuYwo+Pj4+IGluZGV4IDA2M2YzNGM4ODJhZi4uNzM4MmY3OTQ5YmY0IDEwMDY0NAo+
Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4gKysrIGIvc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+PiBAQCAtNjcsNiArNjcsNyBAQCBzdGF0aWMgaW50
IHRlZ3JhMzBfaTJzX3NldF9mbXQoc3RydWN0IHNuZF9zb2NfZGFpCj4+Pj4gKmRhaSwKPj4+PiDC
oCB7Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdGVncmEzMF9pMnMgKmkycyA9IHNuZF9zb2NfZGFp
X2dldF9kcnZkYXRhKGRhaSk7Cj4+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWFzayA9IDAs
IHZhbCA9IDA7Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgY2hfbWFzaywgY2hfdmFsID0gMDsK
Pj4+PiDCoCDCoMKgwqDCoMKgIHN3aXRjaCAoZm10ICYgU05EX1NPQ19EQUlGTVRfSU5WX01BU0sp
IHsKPj4+PiDCoMKgwqDCoMKgIGNhc2UgU05EX1NPQ19EQUlGTVRfTkJfTkY6Cj4+Pj4gQEAgLTc1
LDYgKzc2LDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19zZXRfZm10KHN0cnVjdCBzbmRfc29j
X2RhaQo+Pj4+ICpkYWksCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+
Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IMKgICvCoMKgwqAgY2hfbWFzayA9IFRFR1JBMzBfSTJTX0NI
X0NUUkxfRUdERV9DVFJMX01BU0s7Cj4+Pj4gwqDCoMKgwqDCoCBtYXNrIHw9IFRFR1JBMzBfSTJT
X0NUUkxfTUFTVEVSX0VOQUJMRTsKPj4+PiDCoMKgwqDCoMKgIHN3aXRjaCAoZm10ICYgU05EX1NP
Q19EQUlGTVRfTUFTVEVSX01BU0spIHsKPj4+PiDCoMKgwqDCoMKgIGNhc2UgU05EX1NPQ19EQUlG
TVRfQ0JTX0NGUzoKPj4+PiBAQCAtOTAsMTAgKzkyLDEyIEBAIHN0YXRpYyBpbnQgdGVncmEzMF9p
MnNfc2V0X2ZtdChzdHJ1Y3Qgc25kX3NvY19kYWkKPj4+PiAqZGFpLAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBURUdSQTMwX0kyU19DVFJMX0xSQ0tfTUFTSzsKPj4+PiDCoMKgwqDCoMKgIHN3aXRj
aCAoZm10ICYgU05EX1NPQ19EQUlGTVRfRk9STUFUX01BU0spIHsKPj4+PiDCoMKgwqDCoMKgIGNh
c2UgU05EX1NPQ19EQUlGTVRfRFNQX0E6Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNoX3ZhbCA9IFRF
R1JBMzBfSTJTX0NIX0NUUkxfRUdERV9DVFJMX05FR19FREdFOwo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB2YWwgfD0gVEVHUkEzMF9JMlNfQ1RSTF9GUkFNRV9GT1JNQVRfRlNZTkM7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbCB8PSBURUdSQTMwX0kyU19DVFJMX0xSQ0tfTF9MT1c7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+IMKgwqDCoMKgwqAgY2FzZSBTTkRfU09DX0RB
SUZNVF9EU1BfQjoKPj4+PiArwqDCoMKgwqDCoMKgwqAgY2hfdmFsID0gVEVHUkEzMF9JMlNfQ0hf
Q1RSTF9FR0RFX0NUUkxfTkVHX0VER0U7Cj4+Pgo+Pj4gRG93bnN0cmVhbSBjb2RlIHNldHMgRFNQ
X0IgdG8gUE9TX0VER0UsIGxvb2tzIGxpa2UgeW91IGhhdmUgYSB0eXBvIGhlcmUuCj4+PiBPciBk
b2VzIERTUF9CIGhhcHBlbiB0byB3b3JrIHdpdGggdGhlIE5FR19FREdFPwo+Pgo+PiBvaywgd2ls
bCBjaGFuZ2UsIHdlJ3ZlIG9ubHkgYmVlbiB1c2luZyBTTkRfU09DX0RBSUZNVF9EU1BfQQo+Pgo+
PiBGb3IgcmVmZXJlbmNlLCBpcyB0aGVyZSBhIGdpdCByZXBvIHdpdGggdGhpcyB2ZXJzaW9uIG9m
IHRlZ3JhIHRkbSBzdXBwb3J0Pwo+IAo+IExvb2tzIGxpa2UgYWxsIGRvd25zdHJlYW0ga2VybmVs
cyB0aGF0IHN1cHBvcnRlZCBUMzAgYXJlIGRvaW5nIHRoZSBzYW1lCj4gdGhpbmcuCj4gCj4gVGFr
ZSBhIGxvb2sgaGVyZSBmb3IgZXhhbXBsZToKPiAKPiBodHRwczovL252LXRlZ3JhLm52aWRpYS5j
b20vZ2l0d2ViLz9wPWxpbnV4LTMuMTAuZ2l0O2E9Y29tbWl0O2g9NDk4MzRlZWY5ZDUxYTZlZmY5
NTBlMGY1MmRkYzUzNDNkOTYwNjUyZQoKVGhhdCB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIgaXMga25v
d24gdG8gYmUgYnVnZ3kvaW5jb3JyZWN0LiBJIGRvbid0IHRoaW5rCndlIHdhbnQgdG8gZG8gdGhh
dC4gV2Ugd2FudCB0byBzZXQgdGhlIHBvbGFyaXR5IGJhc2VkIHVwb24gdGhlIGZvcm1hdApwYXNz
ZWQgYW5kIG5vdCB0aGUgbW9kZSAuLi4KCmh0dHBzOi8vbnYtdGVncmEubnZpZGlhLmNvbS9naXR3
ZWIvP3A9bGludXgtbnZpZGlhLmdpdDthPWJsb2I7Zj1zb3VuZC9zb2MvdGVncmEtYWx0L3RlZ3Jh
MjEwX2kyc19hbHQuYztoPTI0Y2YzYjU1MzI2ZjY4N2FkZWQyMmI5MTE4MmRmNDFjNWFlMTg4YWM7
aGI9NzAzYWE5NDhkMmM5MmI4N2ZkODRmMzY3ZjQzYTA3Nzc4ZWQwOThiNSNsMzMzCgpKb24KCi0t
IApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
