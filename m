Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257214DD87
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 16:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1F8167A;
	Thu, 30 Jan 2020 16:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1F8167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580396802;
	bh=j4nmAocuXmDWTKHunBnan/xaKFyhSz2ZwecijJU8S8E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Du/SdspGprom5s5MBUSHLwVueKzW2FB+n4UGKRNKljteA2eRxQo/pVvMUrqnD3K8l
	 mcSOsuIjdcR0SrlpwBbrKJ4ufF0DXbSpmi0a9qbVN0PotLLu8mDWhAENrJrrGLHatn
	 ZmEB9p74PMo9YVmhOSD8NOT+jEWLIdYRUk6D7RDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BF6F80123;
	Thu, 30 Jan 2020 16:05:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 401D9F80150; Thu, 30 Jan 2020 16:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0706F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 16:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0706F80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 07:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="377069658"
Received: from jsmesenc-mobl.amr.corp.intel.com (HELO [10.252.140.145])
 ([10.252.140.145])
 by orsmga004.jf.intel.com with ESMTP; 30 Jan 2020 07:04:52 -0800
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
 <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
 <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <615262ec-2515-ef6f-1ed4-8c42170490c4@linux.intel.com>
Date: Thu, 30 Jan 2020 07:34:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: SOF: Move DSP power state
 transitions to platform-specific ops
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

Cj4+IEBAIC00OTUsMTMgKzY0NSwyNyBAQCBpbnQgaGRhX2RzcF9yZXN1bWUoc3RydWN0IHNuZF9z
b2ZfZGV2ICpzZGV2KQo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCAvKiBpbml0IGhkYSBj
b250cm9sbGVyLiBEU1AgY29yZXMgd2lsbCBiZSBwb3dlcmVkIHVwIGR1cmluZyBmdyAKPj4gYm9v
dCAqLwo+PiAtwqDCoMKgIHJldHVybiBoZGFfcmVzdW1lKHNkZXYsIGZhbHNlKTsKPj4gK8KgwqDC
oCByZXQgPSBoZGFfcmVzdW1lKHNkZXYsIGZhbHNlKTsKPj4gK8KgwqDCoCBpZiAocmV0IDwgMCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4gK8KgwqDCoCBoZGFfZHNwX3Nl
dF9wb3dlcl9zdGF0ZShzZGV2LCAmdGFyZ2V0X3N0YXRlKTsKPiAKPiBSZXR1cm4gdmFsdWXCoCBv
ZiBoZGFfZHNwX3NldF9wb3dlcl9zdGF0ZSgpIHNlZW1zIHRvIGJlIGNoZWNrZWQgb3IgCj4gZGly
ZWN0bHkgcmV0dXJuZWQgaW4gb3RoZXIgZnVuY3Rpb25zLCBhbnkgcmVhc29uIHRvIG5vdCBkbyBp
dCBoZXJlPwoKR29vZCBwb2ludCBBbWFkZXVzeiwgbm90IHN1cmUgd2h5LiBBbmQgbG9va2luZyBh
dCB0aGUgY29kZSwgSSBhbSBub3QgCnN1cmUgZWl0aGVyIHdoeSB3ZSBkb24ndCB1c2UgdGhlIGFi
c3RyYWN0aW9uIHcvIC5zZXRfcG93ZXJfc3RhdGUoKSA/CgppbnRlbC9hcGwuYzogICAgLnNldF9w
b3dlcl9zdGF0ZSAgICAgICAgPSBoZGFfZHNwX3NldF9wb3dlcl9zdGF0ZSwKaW50ZWwvY25sLmM6
ICAgIC5zZXRfcG93ZXJfc3RhdGUgICAgICAgID0gaGRhX2RzcF9zZXRfcG93ZXJfc3RhdGUsCgoK
Z2l0IGdyZXAgc25kX3NvZl9kc3Bfc2V0X3Bvd2VyX3N0YXRlCnNvZi9pcGMuYzogICAgICByZXQg
PSBzbmRfc29mX2RzcF9zZXRfcG93ZXJfc3RhdGUoaXBjLT5zZGV2LCAmdGFyZ2V0X3N0YXRlKTsK
c29mL29wcy5oOnNuZF9zb2ZfZHNwX3NldF9wb3dlcl9zdGF0ZShzdHJ1Y3Qgc25kX3NvZl9kZXYg
KnNkZXYsCgpJZiB0aGUgY29kZSBjYW4gYmUgcGxhdGZvcm0tc3BlY2lmaWMsIHdlIHNob3VsZG4n
dCBtYWtlIGEgZGlyZWN0IGNhbGwgCmJ1dCBnbyB0aHJvdWdoIHRoZSBwbGF0Zm9ybSBpbmRpcmVj
dGlvbi4gaXQncyBmaW5lIGZvciBub3cgc2luY2UgdGhlIApzYW1lIHJvdXRpbmUgaXMgdXNlZCBp
biBhbGwgY2FzZXMgYnV0IGl0J3Mgbm90IHNjYWxhYmxlL2Z1dHVyZS1wcm9vZi4KClJhbmphbmk/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
