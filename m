Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF66D6677
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 17:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A871673;
	Mon, 14 Oct 2019 17:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A871673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571068111;
	bh=x7uujPSTpSy/DwIRtf6cXH/qkmG53n0TWoIPzSd1emY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJDs6gavm4jkzBHstXgeAwg+0B4fvJB54aunr0k1CDoYa3uRmSiGILaJwQevo0Bae
	 FvETbjpS+BwabckbssI2Qptn4SDlBqItWOHqmAqmbz1qPwfXuR+4mMwUIIRbJxYuB8
	 MX7ENM4LKQqw4OPf0tHwXs+H0wBxo/UdDl2TQ4ZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3CFF80610;
	Mon, 14 Oct 2019 17:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75066F805AE; Mon, 14 Oct 2019 17:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0042FF804A9
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 17:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0042FF804A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 08:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="199434999"
Received: from rtnitta-mobl1.amr.corp.intel.com (HELO [10.251.134.135])
 ([10.251.134.135])
 by orsmga006.jf.intel.com with ESMTP; 14 Oct 2019 08:45:28 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh@kernel.org,
 vkoul@kernel.org
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-3-srinivas.kandagatla@linaro.org>
 <9d00c94b-1bce-9fdf-55fe-ee681466a97a@linux.intel.com>
 <d053a17e-3d6d-e3b6-f988-485e77c30e3b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1a1a4ac0-388c-8999-47a2-6d6f7471ab93@linux.intel.com>
Date: Mon, 14 Oct 2019 10:43:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d053a17e-3d6d-e3b6-f988-485e77c30e3b@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/2] soundwire: qcom: add support for
 SoundWire controller
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

CgpPbiAxMC8xNC8xOSA0OjA0IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IFRoYW5r
cyBQaWVycmUgZm9yIHRha2luZyB0aW1lIHRvIHJldmlldyB0aGUgcGF0Y2guCj4gCj4gT24gMTEv
MTAvMjAxOSAxODo1MCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+PiArc3RhdGlj
IGludCBxY29tX3N3cm1fY21kX2ZpZm9fd3JfY21kKHN0cnVjdCBxY29tX3N3cm1fY3RybCAqY3Ry
bCwgdTggCj4+PiBjbWRfZGF0YSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHU4IGRldl9hZGRyLCB1MTYgcmVnX2FkZHIpCj4+PiArewo+Pj4gK8KgwqDCoCBE
RUNMQVJFX0NPTVBMRVRJT05fT05TVEFDSyhjb21wKTsKPj4+ICvCoMKgwqAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKPj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+ICsK
Pj4+ICvCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmN0cmwtPmNvbXBfbG9jaywgZmxhZ3MpOwo+
Pj4gK8KgwqDCoCBjdHJsLT5jb21wID0gJmNvbXA7Cj4+PiArwqDCoMKgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmN0cmwtPmNvbXBfbG9jaywgZmxhZ3MpOwo+Pj4gK8KgwqDCoCB2YWwgPSBTV1JN
X1JFR19WQUxfUEFDSyhjbWRfZGF0YSwgZGV2X2FkZHIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNXUk1fU1BFQ0lBTF9DTURfSUQsIHJlZ19hZGRyKTsKPj4+ICvCoMKgwqAg
cmV0ID0gY3RybC0+cmVnX3dyaXRlKGN0cmwsIFNXUk1fQ01EX0ZJRk9fV1JfQ01ELCB2YWwpOwo+
Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+Pj4gKwo+
Pj4gK8KgwqDCoCByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoY3RybC0+Y29tcCwK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNlY3NfdG9f
amlmZmllcyhUSU1FT1VUX01TKSk7Cj4+PiArCj4+PiArwqDCoMKgIGlmICghcmV0KQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IFNEV19DTURfSUdOT1JFRDsKPj4+ICvCoMKgwqAgZWxzZQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldCA9IFNEV19DTURfT0s7Cj4+Cj4+IEl0J3Mgb2RkIHRvIHJlcG9y
dCBDTURfSUdOT1JFRCBvbiBhIHRpbWVvdXQuIENNRF9JR05PUkVEIGlzIGEgdmFsaWQgCj4+IGFu
c3dlciB0aGF0IHNob3VsZCBiZSByZXRyaWV2ZWQgaW1tZWRpYXRlbHkuIFlvdSBwcm9iYWJseSBu
ZWVkIHRvIAo+PiB0cmFuc2xhdGUgdGhlIHNvdW5kd2lyZSBlcnJvcnMgaW50byAtRVRJTUVPVVQg
b3Igc29tZXRoaW5nLgo+IAo+IEluIHRoaXMgY29udHJvbGxlciB3ZSBoYXZlIG5vIHdheSB0byBr
bm93IGlmIHRoZSBjb21tYW5kIGlzIGlnbm9yZWQgb3IgCj4gdGltZWRvdXQsIHNvIEFsbCB0aGUg
Y29tbWFuZHMgdGhhdCBkaWQgbm90IHJlY2VpdmUgcmVzcG9uc2UgZWl0aGVyIGR1ZSAKPiB0byBp
Z25vcmUgb3IgdGltZW91dCBhcmUgY3VycmVudGx5IGRldGVjdGVkIHdpdGggb3V0IGFueSByZXNw
b25zZSAKPiBpbnRlcnJ1cHQgaW4gZ2l2ZW4gdGltZW91dC4KCm9rLiBJdCdzIHN0aWxsIHZlcnkg
b2RkLiBhIENNRF9JR05PUkVEIGlzIGEgcmVxdWlyZWQgYW5zd2VyIGUuZy4gd2hlbiAKdGhlcmUg
aXMgbm8gZGV2aWNlMCBsZWZ0IHRvIGVudW1lcmF0ZSwgd2hlbiBhIGRldmljZSBoYXMgZmFsbGVu
IG9mZiB0aGUgCmJ1cyBvciB3aGVuIGFjY2Vzc2luZyBhIG5vbi1pbXBsZW1lbnRlZCByZWdpc3Rl
ci4KCj4+PiArc3RhdGljIGludCBxY29tX3N3cm1fcmVnaXN0ZXJfZGFpcyhzdHJ1Y3QgcWNvbV9z
d3JtX2N0cmwgKmN0cmwpCj4+PiArewo+Pj4gK8KgwqDCoCBpbnQgbnVtX2RhaXMgPSBjdHJsLT5u
dW1fZG91dF9wb3J0cyArIGN0cmwtPm51bV9kaW5fcG9ydHM7Cj4+PiArwqDCoMKgIHN0cnVjdCBz
bmRfc29jX2RhaV9kcml2ZXIgKmRhaXM7Cj4+PiArwqDCoMKgIHN0cnVjdCBzbmRfc29jX3BjbV9z
dHJlYW0gKnN0cmVhbTsKPj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gY3RybC0+ZGV2
Owo+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+ICsKPj4+ICvCoMKgwqAgLyogUERNIGRhaXMgYXJlIG9u
bHkgdGVzdGVkIGZvciBub3cgKi8KPj4+ICvCoMKgwqAgZGFpcyA9IGRldm1fa2NhbGxvYyhkZXYs
IG51bV9kYWlzLCBzaXplb2YoKmRhaXMpLCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAgaWYgKCFk
YWlzKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gK8KgwqDC
oCBmb3IgKGkgPSAwOyBpIDwgbnVtX2RhaXM7IGkrKykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRh
aXNbaV0ubmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIlNEVyBQaW4lZCIs
IGkpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghZGFpc1tpXS5uYW1lKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKGkgPCBjdHJsLT5udW1fZG91dF9wb3J0cykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RyZWFtID0gJmRhaXNbaV0ucGxheWJhY2s7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJlYW0tPnN0cmVhbV9uYW1lID0gZGV2bV9rYXNwcmludGYoZGV2LCBHRlBfS0VSTkVMLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIlNEVyBUeCVkIiwgaSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmVhbSA9ICZkYWlzW2ldLmNhcHR1cmU7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJlYW0tPnN0cmVhbV9uYW1lID0gZGV2bV9rYXNw
cmludGYoZGV2LCBHRlBfS0VSTkVMLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlNEVyBSeCVkIiwgaSk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiBGb3IgdGhlIEludGVsIHN0dWZmLCB3ZSByZW1vdmVkIHRo
ZSBzdHJlYW1fbmFtZSBhc3NpZ25tZW50IHNpbmNlIGl0IAo+PiBjb25mbGljdGVkIHdpdGggdGhl
IERBSSB3aWRnZXRzIGFkZGVkIGJ5IHRoZSB0b3BvbG9neS4gU2luY2UgdGhlIGNvZGUgCj4+IGxv
b2tzIGluc3BpcmVkIGJ5IHRoZSBJbnRlbCBEQUkgaGFuZGxpbmcsIHlvdSBzaG91bGQgbG9vayBp
bnRvIHRoaXMuCj4gCj4gWWVzLCB0aGlzIGNvZGUgd2FzIGluc3BpcmVkIGJ5IEludGVsJ3MgREFJ
IGhhbmRsaW5nLCBJIHdpbGwgdGFrZSBhIGxvb2sgCj4gYSBsb29rIGF0IGxhdGVzdCBjb2RlIGFu
ZCB1cGRhdGUgYWNjb3JkaW5nbHkuCgoKRldJVywgdGhlIHN0cmVhbSBoYW5kbGluZyBzZWVtcyB0
byBoYXZlIGlzc3VlcyBhcyB3ZWxsLCBzcGVjaWZpY2FsbHkgdGhlIAonZGVwcmVwYXJlJyBwYXJ0
LCB3ZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgYXJvdW5kIGVycm9ycyB3aXRoIApzdXNwZW5kLXJl
c3VtZSwgc2VlIGUuZy4gZXhwZXJpbWVudGFsIGJyYW5jaCBhdCAKaHR0cHM6Ly9naXRodWIuY29t
L3RoZXNvZnByb2plY3QvbGludXgvcHVsbC8xMzE0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbHNhLWRldmVsCg==
