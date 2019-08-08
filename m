Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C323886725
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 18:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AED1857;
	Thu,  8 Aug 2019 18:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AED1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565281873;
	bh=KpYDCOHlICig56bZWKN5NAbnTElTV9qjggVvkadOTaw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUoEF9R71pI0KIX7/O104bFoRjUKIOvQLiV/oPYMbJutcqUvEYbyWgu4dcCLo66BE
	 Jz0HJ0hO5e6MkGOORu0Pg7XiXgIbYa0BeVf3KE2G2J6304R34M8uVt64RyVBEkRS8i
	 YBVVPg+mYQd8DtcZm0tKtq2yoktRUd/uvwGMX21Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FF2BF80534;
	Thu,  8 Aug 2019 18:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2251F80534; Thu,  8 Aug 2019 18:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C6BF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 18:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C6BF803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 09:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="203633797"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2019 09:29:19 -0700
Received: from kyablokx-mobl.amr.corp.intel.com (unknown [10.251.19.34])
 by linux.intel.com (Postfix) with ESMTP id 0EA5F58044F;
 Thu,  8 Aug 2019 09:29:17 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-5-srinivas.kandagatla@linaro.org>
 <3ad15652-9d6c-11e4-7cc3-0f076c6841bb@linux.intel.com>
 <32516aae-8a43-6a74-c564-92dea8ff6e53@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4e60b92f-a32e-671c-3b1b-9b1ccec4f9b5@linux.intel.com>
Date: Thu, 8 Aug 2019 11:29:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <32516aae-8a43-6a74-c564-92dea8ff6e53@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/4] ASoC: codecs: add wsa881x amplifier
 support
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

Cj4+PiArLyogNCBwb3J0cyAqLwo+Pj4gK3N0YXRpYyBzdHJ1Y3Qgc2R3X2Rwbl9wcm9wIHdzYV9z
aW5rX2Rwbl9wcm9wW1dTQTg4MVhfTUFYX1NXUl9QT1JUU10gPSB7Cj4+PiArwqDCoMKgIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCAvKiBEQUMgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoCAubnVtID0gMSwK
Pj4+ICvCoMKgwqDCoMKgwqDCoCAudHlwZSA9IFNEV19EUE5fU0lNUExFLAo+Pgo+PiBJSVJDIHdl
IGFkZGVkIHRoZSBSRURVQ0VEIHR5cGUgaW4gU291bmRXaXJlIDEuMSB0byBjb3ZlciB0aGUgUERN
IGNhc2UgCj4+IHdpdGggY2hhbm5lbCBwYWNraW5nIChvciB3YXMgaXQgZ3JvdXBpbmcpIHVzZWQg
YnkgUXVhbGNvbW0uIEkgYW0gbm90IAo+PiBzdXJlIHRoZSBTSU1QTEUgdHlwZSB3b3Jrcz8KPiBn
cm91cGluZyBJIGd1ZXNzLgo+IAo+IFRoaXMgaXMgYSBzaW1wbGlmaWVkIGRhdGEgcG9ydCBhcyB0
aGVyZSBpcyBubyBEUG5fT2Zmc2V0Q3RybDIgcmVnaXN0ZXIgCj4gaW1wbGVtZW50ZWQuCgpvaywg
Zm9yIHRoZSBSRURVQ0VEIHR5cGUgaXQncyByZXF1aXJlZCB0byBoYXZlIEJsb2NrUGFja2luZ01v
ZGUgYW5kIApPZmZzZXRDdHJsMiwgc28gaXQgZG9lcyBub3QgYXBwbHkgaGVyZS4gVGhhbmtzIGZv
ciBjb25maXJtaW5nLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
