Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C876C36
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43772098;
	Fri, 26 Jul 2019 16:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43772098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564153145;
	bh=UVX1D8JaBFVHtD9ZTTkZ2Osjgll56l8EIETQmHSZpM0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3KdiIiTU36xdfi35iRNwGd9KyAsSjJhNvWh11fFnLgcjPI4Qvo5pIsQTdHnfNtAi
	 m1vzLFJzPpHXNcot4BNuV6VtntaSbProjnel848ZPTUBepBS06db0DnG58WzEQI/Px
	 7DiE7EmjepEc5EaYc4c68ADNI1VuWUz560VkI3EA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1527BF803D5;
	Fri, 26 Jul 2019 16:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAECEF80393; Fri, 26 Jul 2019 16:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 831AAF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 831AAF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322058385"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:57:06 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-34-pierre-louis.bossart@linux.intel.com>
 <0e439b41-503d-7ffb-827f-422d63e439eb@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <41f71476-4205-7982-9422-5d00e55c24d3@linux.intel.com>
Date: Fri, 26 Jul 2019 09:57:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0e439b41-503d-7ffb-827f-422d63e439eb@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 33/40] soundwire: intel: Add basic
 power management support
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

CgpPbiA3LzI2LzE5IDU6NTAgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gK3N0YXRpYyBpbnQgaW50
ZWxfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qgc2R3
X2ludGVsICpzZHc7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIHNkdyA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gaW50ZWxfaW5pdChzZHcp
Owo+PiArwqDCoMKgIGlmIChyZXQpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAi
JXMgZmFpbGVkOiAlZCIsIF9fZnVuY19fLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBzZHdfY2Ruc19lbmFibGVfaW50ZXJy
dXB0KCZzZHctPmNkbnMpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+
PiArI2VuZGlmCj4gCj4gU3VnZ2VzdGlvbjogdGhlIGxvY2FsIGRlY2xhcmF0aW9uICsgaW5pdGlh
bGl6YXRpb24gdmlhIGRldl9nZXRfZHJ2ZGF0YSgpIAo+IGFyZSB1c3VhbGx5IGNvbWJpbmVkLgoK
eWVzLCB3aWxsIGRvLgoKPiAKPiBHaXZlbiB0aGUgdXBzdHJlYW0gZGVjbGFyYXRpb24gb2YgX2Vu
YWJsZV9pbnRlcnJ1cHQsIGl0IGRvZXMgcmV0dXJuIAo+IGVycm9yIGNvZGUvIHN1Y2Nlc3MuIEdp
dmVuIGN1cnJlbnQgZmxvdywgaWYgZnVuY3Rpb24gZ2V0cyB0byAKPiBfZW5hYmxlX2ludGVycnVw
dCBjYWxsLCByZXQgaXMgYWxyZWFkeSBzZXQgdG8gMC4gUmV0dXJuaW5nIAo+IHNkd19jZHNfZW5h
YmxlX2ludGVycnVwdCgpIGRpcmVjdGx5IHdvdWxkIGJvdGggc2ltcGxpZnkgdGhlIGRlZmluaXRp
b24gCj4gYW5kIHByZXZlbnQgc3RhdHVzIGxvc3MuCgpzb3VuZHMgZ29vZCwgd2lsbCBkbywgdGhh
bmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
