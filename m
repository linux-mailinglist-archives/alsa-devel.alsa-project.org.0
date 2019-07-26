Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC976BFC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D4B2074;
	Fri, 26 Jul 2019 16:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D4B2074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564152506;
	bh=xwh8AyZrBVPlAXrq6Sk9h6D27xo9SO1nkijRd4V+Z6Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mdSFJLrverH7sfv2TfdJJ/fjWpXzirywnQ11JJ1wiK+N87Jsnmgq7Sg4BF5Kx77RG
	 K4LFcsztLhHCqXBD2nh5L0OHOu1ILYvt+nPHskUecaYO2u0zf491/GgCVm68VsceTd
	 HN/ALuH1O+DDSlExOxThNamM3SGuEJw44m9Z4qC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6FD6F803D5;
	Fri, 26 Jul 2019 16:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CEC4F80393; Fri, 26 Jul 2019 16:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B505F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B505F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322056387"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:46:34 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
Date: Fri, 26 Jul 2019 09:46:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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

CgpPbiA3LzI2LzE5IDU6MzggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gK3ZvaWQgaW50ZWxfc2h1
dGRvd24oc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQo+PiArewo+PiArwqDCoMKgIHN0
cnVjdCBzZHdfY2Ruc19kbWFfZGF0YSAqZG1hOwo+PiArCj4+ICvCoMKgwqAgZG1hID0gc25kX3Nv
Y19kYWlfZ2V0X2RtYV9kYXRhKGRhaSwgc3Vic3RyZWFtKTsKPj4gK8KgwqDCoCBpZiAoIWRtYSkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gKwo+PiArwqDCoMKgIHNuZF9zb2NfZGFpX3Nl
dF9kbWFfZGF0YShkYWksIHN1YnN0cmVhbSwgTlVMTCk7Cj4+ICvCoMKgwqAga2ZyZWUoZG1hKTsK
Pj4gK30KPiAKPiBDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IGRvIHdlIHJlYWxseSBuZWVk
IHRvIF9nZXRfZG1hXyBoZXJlPwo+IF9zZXRfZG1hXyBzZWVtcyBidWxsZXRwcm9vZiwgc2FtZSBm
b3Iga2ZyZWUuCgpJIG11c3QgYWRtaXQgSSBoYXZlIG5vIGlkZWEgd2h5IHdlIGhhdmUgYSByZWZl
cmVuY2UgdG8gRE1BcyBoZXJlLCB0aGlzIApsb29rcyBsaWtlIGFuIGFidXNlIHRvIHN0b3JlIGEg
ZGFpLXNwZWNpZmljIGNvbnRleHQsIGFuZCB0aGUgaW5pdGlhbCAKdGVzdCBsb29rcyBsaWtlIGNv
cHktcGFzdGUgdG8gZGV0ZWN0IGludmFsaWQgY29uZmlncywgYXMgZG9uZSBpbiBvdGhlciAKY2Fs
bGJhY2tzLiBWaW5vZCBhbmQgU2FueW9nIG1pZ2h0IGhhdmUgbW9yZSBoaXN0b3J5IHRoYW4gbWUg
aGVyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
