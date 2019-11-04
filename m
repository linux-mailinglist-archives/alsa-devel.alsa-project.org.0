Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F1EEC86
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 22:58:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE4C1713;
	Mon,  4 Nov 2019 22:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE4C1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572904683;
	bh=QlXmSxJB5IY5UN6De6G0UWXyiAyNwp45SfTjEHaveLY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DrbMCSzSo+D3JgvBBZpBCRGfHeY42eR9GxIt/U5kWRdScZb5elWCT/SC9wlEddylr
	 4AE9avdOE0+EL2Kwzcj+2mZ0b0UPsIw8zXY1Kzjtf16zgXOhyp5CqMI21ntUnPykCW
	 Nlc+MX4mCYozwhUJ2P3QIW+7P7y8oJCbwWwCY5OY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72CB8F800F3;
	Mon,  4 Nov 2019 22:56:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15BAAF8045F; Mon,  4 Nov 2019 22:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58DEBF800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 22:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58DEBF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 13:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="226888814"
Received: from trowland-mobl.amr.corp.intel.com (HELO [10.254.97.182])
 ([10.254.97.182])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2019 13:56:01 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
 <71b50d6d-0000-340a-eb5d-6a63564dd2d6@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0290d80b-08fc-d85f-3f9b-fea41d3df3a8@linux.intel.com>
Date: Mon, 4 Nov 2019 13:41:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <71b50d6d-0000-340a-eb5d-6a63564dd2d6@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 06/14] soundwire: add support for
 sdw_slave_type
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

Cgo+PiBAQCAtNDksOSArNDksMTYgQEAgaW50IHNkd19zbGF2ZV9tb2RhbGlhcyhjb25zdCBzdHJ1
Y3Qgc2R3X3NsYXZlIAo+PiAqc2xhdmUsIGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUpCj4+IMKgIHN0
YXRpYyBpbnQgc2R3X3VldmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb2JqX3VldmVu
dF9lbnYgKmVudikKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlID0g
dG9fc2R3X3NsYXZlX2RldmljZShkZXYpOwo+PiArwqDCoMKgIHN0cnVjdCBzZHdfc2xhdmUgKnNs
YXZlOwo+PiDCoMKgwqDCoMKgIGNoYXIgbW9kYWxpYXNbMzJdOwo+PiArwqDCoMKgIGlmIChpc19z
ZHdfc2xhdmUoZGV2KSkgewo+PiArwqDCoMKgwqDCoMKgwqAgc2xhdmUgPSB0b19zZHdfc2xhdmVf
ZGV2aWNlKGRldik7Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl93
YXJuKGRldiwgInVldmVudCBmb3IgdW5rbm93biBTb3VuZHdpcmUgdHlwZVxuIik7Cj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDC
oCBzZHdfc2xhdmVfbW9kYWxpYXMoc2xhdmUsIG1vZGFsaWFzLCBzaXplb2YobW9kYWxpYXMpKTsK
Pj4gwqDCoMKgwqDCoCBpZiAoYWRkX3VldmVudF92YXIoZW52LCAiTU9EQUxJQVM9JXMiLCBtb2Rh
bGlhcykpCj4gCj4gUG9zaXRpdmUgZXZhbHVhdGlvbiBvZiBpc19zZHdfc2xhdmUoKSBjaGVjayBp
cyByZXF1aXJlZCBmb3IgZnVuY3Rpb24gdG8gCj4gY29udGludWUsIHRodXMgeW91IG1pZ2h0IGFz
IHdlbGwgZG86Cj4gCj4gaWYgKCFpc19zZHdfc2xhdmUoZGV2KSkgewo+ICDCoMKgwqDCoGRldl93
YXJuKCk7Cj4gIMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gfQo+IAo+IHNsYXZlID0gdG9fc2R3
X3NsYXZlX2RldmljZShkZXYpOwoKc2VlIHRoZSBmb2xsb3dpbmcgcGF0Y2ggNywgaXQgYmVjb21l
cyBhIDItY2FzZSB0ZXN0IChzbGF2ZSBhbmQgbWFzdGVyKS4KSSBhbSBhbGwgZm9yIG9wdGltaXph
dGlvbnMgYnV0IHdhaXQgdW50aWwgdGhlIGFjdHVhbCBjaGFuZ2VzIGFyZSBhZGRlZC4uLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
