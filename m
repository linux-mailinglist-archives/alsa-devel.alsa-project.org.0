Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B8C124D7C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 17:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8AF41674;
	Wed, 18 Dec 2019 17:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8AF41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576686440;
	bh=nJSpS3KGCZEIRl7LwLq8GAXZKnxRumABd8pYBGw7LTc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/G7BU+bDiJ5F8jB6wutGuHcqnMKZ57LEhRoz4soquJXf12izl//fsbI4EOLrCFZ3
	 MPxuFYtZGRA1/8jhVOOZIg5nskqA9Ts4g1zLFBIHrRdymNK1lVxIlKeJqPam1fRUD2
	 kWIICJs0hepObEfzCg4IYPDDB3o4hPPoQGbi9x3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E62F80277;
	Wed, 18 Dec 2019 17:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0C77F80096; Wed, 18 Dec 2019 17:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18C0F80258
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 17:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18C0F80258
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 08:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415881663"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 08:23:47 -0800
To: Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
 <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
 <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ff0e2420-a2c6-17e7-2761-f6544e2c0cb7@linux.intel.com>
Date: Wed, 18 Dec 2019 09:32:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
Content-Language: en-US
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
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

CgpPbiAxMi8xOC8xOSAzOjQ5IEFNLCBEYW5pZWwgTWFjayB3cm90ZToKPiBIaSwKPiAKPiBPbiAx
Mi8xNy8xOSA4OjI4IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gT24gMTIvOS8x
OSAxMjozNSBQTSwgRGFuaWVsIE1hY2sgd3JvdGU6Cj4gCj4+PiArwqDCoMKgIGlmICghYWQyNDJ4
X25vZGVfaXNfbWFzdGVyKHByaXYtPm5vZGUpICYmCj4+PiArwqDCoMKgwqDCoMKgICgoZm9ybWF0
ICYgU05EX1NPQ19EQUlGTVRfTUFTVEVSX01BU0spICE9Cj4+PiBTTkRfU09DX0RBSUZNVF9DQk1f
Q0ZNKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoY29tcG9uZW50LT5kZXYsICJzbGF2
ZSBub2RlIG11c3QgYmUgY2xvY2sgbWFzdGVyXG4iKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVJTlZBTDsKPj4+ICvCoMKgwqAgfQo+Pgo+PiBJdCB3YXMgbXkgdW5kZXJzdGFuZGluZyB0
aGF0IHRoZSBtYXN0ZXIgbm9kZSBwcm92aWRlcyB0aGUgY2xvY2sgdG8gdGhlCj4+IGJ1cywgc28g
bm90IHN1cmUgaG93IGl0IGNvdWxkIGJlIGEgY2xvY2sgc2xhdmUsIGFuZCBjb252ZXJzZWx5IGhv
dyBhCj4+IHNsYXZlIG5vZGUgY291bGQgcHJvdmlkZSBhIGNsb2NrIHRvIHRoZSBidXM/Cj4gCj4g
VGhlIHNsYXZlIG5vZGVzIHJlY2VpdmUgdGhlIEEyQiBjbG9jayBmcm9tIHRoZSBtYXN0ZXIgbm9k
ZSBhbmQgdGhlbgo+IHByb2R1Y2UgZGlnaXRhbCBhdWRpbyBvdXRwdXQgdGhhdCBpcyBzZW50IHRv
IG90aGVyIGNvbXBvbmVudHMgc3VjaCBhcwo+IGNvZGVjcy4gSGVuY2UsIGluIEFTb0MgdGVybXMs
IHRoZXkgYXJlIHRoZSBjbG9jayBtYXN0ZXIuCj4gCj4gTGlrZXdpc2UsIGFzIHRoZSBtYXN0ZXIg
bm9kZSBpcyByZWNlaXZpbmcgaXRzIGNsb2NrIGZyb20gb3RoZXIKPiBjb21wb25lbnRzLCBpdCBo
YXMgdG8gYmUgYSBjbG9jayBzbGF2ZSBpbiB0aGUgYXVkaW8gbmV0d29yay4KPiAKPiBEb2VzIHRo
YXQgbWFrZSBzZW5zZT8KCllvdXIgc2xhdmUgbm9kZSBhY3RzIGFzIGEgYnJpZGdlIHRoZW4sIGJ1
dCBpdCBzZWVtcyB5b3UgZG9uJ3QgbW9kZWwgdGhlIApidXMtZmFjaW5nIGludGVyZmFjZSwgd2hp
Y2ggaGFzIHRvIGZvbGxvdyB0aGUgbWFzdGVyIGNsb2NrLiBPciBkbyB5b3U/CgpMaWtld2lzZSB0
aGUgbWFzdGVyIGhhcyBhbiAnU09DLWZhY2luZycgaW50ZXJmYWNlIGFuZCBhIGJ1cy1mYWNpbmcg
CmludGVyZmFjZS4gaXQgKmNvdWxkKiBiZSBtYXN0ZXIgb24gYm90aCBpZiBBU1JDIHdhcyBzdXBw
b3J0ZWQuIFRoZSBwb2ludCAKaXMgdGhhdCB0aGUgYnVzLWZhY2luZyBpbnRlcmZhY2UgaXMgbm90
IGNsb2NrIHNsYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
